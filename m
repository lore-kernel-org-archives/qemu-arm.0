Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4719755wrs;
        Mon, 26 Aug 2019 21:01:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOIGsHivqMLi4k7DcO4cDItWMiIJ+wXIsaBvXl8xXeX903gXzgFc3nUoebFfBBEQQtigrh
X-Received: by 2002:a17:906:58f:: with SMTP id 15mr19457804ejn.19.1566878497362;
        Mon, 26 Aug 2019 21:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566878497; cv=none;
        d=google.com; s=arc-20160816;
        b=YWzqi8IDBQ5A/qDMxOUKEV03KxHpc+sq3VvZiqlM3Gyy8Lnv/AnUaklyv1eVa8veOT
         yxmp32QeVTnUw/Iu0so2sFZ0p8IpDVV9S8DWKjWrwa74mUzf813BqNlAsMV3c532Y732
         L9zhziequROdGIEj8nSI2HO0mYihsc+JAQ7moqCLkivX5jtHQczzk0m9i23YwEXnTUMa
         AT8n7+utzYFqrpqBiggUCswqbSbpzBbEBIFu6z24D8FuzY9UjrTLRNOdL3YcCwk8hqgY
         Z9XTA/Unxz9XDkui16boRF9Vw8cZZagAu6r6p+lDk+jkWBwEzrX5nHXEPThzaAH4KXeV
         aMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=LoljCxasXQr8gEYD+Q8SANmO4hCFYq0yLIjxP2rk0U8=;
        b=BiGMg5gmA0iqQlSzSVOhdVfATlVCiHQFjRv782uDlyUVqislSR13xa2uZVckgeZtkx
         GhFoCZwpSS6N5Cogt0kc7I8AJPf2oxpIDDQzwtYHEkDt4vtcnJcD141hr/kSVvNmvqbT
         2SsODGkG2+r94nOe3rJAW57kVVi1Va8Em/nZe9zJ/TkfZKyr79J9DuR6AuWsuH6x9CpQ
         sv0r6Z7cKpC0dKs1IeXLfukaT6oCanMWbUkOs2YwspaZOYY9GmO2qTvB91SqoRy/K6TL
         tgbZPD/L6Jm3rljCqA08KjWT4AHVjTIFdcBGw3d3bdedqk/3xnuTTx9/OMlc7JxpeH6g
         +KNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d9BnNFVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t35si7978737eda.160.2019.08.26.21.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 21:01:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d9BnNFVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Sfo-0002ji-8C
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 00:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1i2Sff-0002it-KC
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 00:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1i2Sfe-00059y-8p
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 00:01:27 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35196)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1i2Sfe-00059m-0T; Tue, 27 Aug 2019 00:01:26 -0400
Received: by mail-pg1-x541.google.com with SMTP id n4so11867532pgv.2;
 Mon, 26 Aug 2019 21:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LoljCxasXQr8gEYD+Q8SANmO4hCFYq0yLIjxP2rk0U8=;
 b=d9BnNFVZqD+KKzofeBZGdTXb+caLVyQIc/02sdH7r5Khr3Kr0AXb5UXskcyC0BvMQf
 EZz1VlXfbULCm6W0eosl7sTDxUWEvM0Pfk0MmFoX0YZ0jXLIwfGbbfvmtaA6+0s5ioei
 t4NFF1rrsm9mQ2P+wHA2q3GiCK1S73QRbhPv283Nfn8vtKHS6Yf8AaQ4tWEbOO+dtNGx
 W93G87niNL/bm78WKa5rkZdyIXZQcXcF88yn/MgcyFkDsouKCriIQAr0ST5fHb3MkBWw
 Zxj+TDmcmpvQPZUfUL3VrTJ8Jio1VU7AE/CGs1vjevGEa/HHDQ8kj8pYSzeKFVlSPYs/
 TycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LoljCxasXQr8gEYD+Q8SANmO4hCFYq0yLIjxP2rk0U8=;
 b=FYYbuCklbvPU9e0EeXjYLhRxs3iljM8Y89j498bXZYNNoveSU9dUwjNOO7wh51umXN
 TXldfmaFQ5naF7Z1r3giHU6eMjlT3fe1Y+H87NLn4ElACo13qsCTgQERje9mKvWPPlOi
 EJj/37sg+3D76duloCe6EvHlUAPN37w0PIf8rCVj6w4VyrOFQg9F/cit8Ym0hLijxY6i
 +V/PZPiHbED6PT4c7UJqHl1Nwyu6k786hkMRMGJuo+h43n/BK82MUjyxV7jjqY3MBHyi
 HOlBnIpAqKSepLrgirGSgo+9Znk4WxnFMcrgeqRCKCFuwhQIQjUNo9znEmVXfTxocZFM
 6IAQ==
X-Gm-Message-State: APjAAAXr7njk7yOBdq6o1jeb3SZDh4qBiFVJE3p+bSUR6OpD+kqxeJU3
 ZvVhfvgBB/WokOFNYPL7oR4=
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr19080840pgr.156.1566878484847; 
 Mon, 26 Aug 2019 21:01:24 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s11sm12004814pgv.13.2019.08.26.21.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:01:24 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Tue, 27 Aug 2019 14:01:11 +1000
Message-Id: <20190827040114.23390-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v6 0/3] Add Aspeed GPIO controller model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1mDhdXRSYNL1

v6:
- fixed bug in get/set pin
- added error checking that Cédric suggested

v5:
- integrated AspeedGPIOController fields into AspeedGPIOClass
- separated ast2600_3_6v and ast2600_1_8v into two classes

v4:
- proper interupt handling thanks to Andrew
- switch statements for reading and writing suggested by Peter
- some small cleanups suggested by Alexey

v3:
- didn't have each gpio set up as an irq 
- now can't access set AC on ast2400 (only exists on ast2500)
- added ast2600 implementation (patch 3)
- renamed a couple of variables for clarity

v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
read/write to minimise confusion with a 'set' of registers.

Rashmica Gupta (3):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC
  hw/gpio: Add in AST2600 specific implementation

 include/hw/arm/aspeed_soc.h   |    3 +
 include/hw/gpio/aspeed_gpio.h |  100 ++++
 hw/arm/aspeed_soc.c           |   17 +
 hw/gpio/aspeed_gpio.c         | 1014 +++++++++++++++++++++++++++++++++
 hw/gpio/Makefile.objs         |    1 +
 5 files changed, 1135 insertions(+)
 create mode 100644 include/hw/gpio/aspeed_gpio.h
 create mode 100644 hw/gpio/aspeed_gpio.c

-- 
2.20.1

