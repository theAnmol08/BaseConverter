#ifndef CONVERTER_H
#define CONVERTER_H

#include <QObject>
#include <QString>
#include <cmath>

class Converter : public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE QString convertBase(const QString& number, int fromBase, int toBase) {
        int decimalValue = baseXToDecimal(number.toStdString(), fromBase);
        return QString::fromStdString(decimalToBaseY(decimalValue, toBase));
    }

private:
    int baseXToDecimal(const std::string& number, int baseX) {
        int decimalValue = 0;
        int power = 0;

        for (int i = number.length() - 1; i >= 0; --i) {
            char digit = number[i];
            int digitValue;
            if (digit >= '0' && digit <= '9') {
                digitValue = digit - '0';
            } else if (digit >= 'A' && digit <= 'Z') {
                digitValue = digit - 'A' + 10;
            } else {
                return -1;  // Invalid digit
            }

            if (digitValue >= baseX) {
                return -1;  // Invalid digit for base
            }

            decimalValue += digitValue * std::pow(baseX, power);
            power++;
        }
        return decimalValue;
    }

    std::string decimalToBaseY(int decimalValue, int baseY) {
        const char digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        std::string result;

        if (decimalValue == 0) return "0";

        while (decimalValue > 0) {
            result = digits[decimalValue % baseY] + result;
            decimalValue /= baseY;
        }

        return result;
    }
};


#endif // CONVERTER_H
