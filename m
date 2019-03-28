Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp258027wrx;
        Wed, 27 Mar 2019 23:29:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx91rmsX0dhfQ2TmRv26yN04eZVk3Rf1frLbrbA3UxYlRb8Ik4GHjnrfHByq5zvy3siMYfe
X-Received: by 2002:a24:4c82:: with SMTP id a124mr6827829itb.163.1553754571191;
        Wed, 27 Mar 2019 23:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553754571; cv=none;
        d=google.com; s=arc-20160816;
        b=TxifKUacoMsIVb9H9DGtpToo2hy7LVnhHXrK/JDSKxw5zTi9WHRIaxtji3YByl/7m2
         V05hEHLr8miAb21NILvt0B3mzPw5RH7kiyyubsmThZybKV2WT/f8HlAugSOyP8bdE/tf
         2WhG5QqQSb/3uOkdS13moPZgwPmAdD2YQgxe+KCyM7ByNcssX3d0BEl/n0evR+kzC39Z
         UGdNGuSZwGTSwqn11NHXm6J7VPi3nINmwZjNdF48pSWLq2+quByhMRIMVPDAui8ETmwy
         31uuPrWKptBEM4G0dB6424S0qowi3Z36KmKOlkJj2I7BlpVn5flWig4ctq9lJyg4aA9I
         FAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=fKFvnZrVzExg0eZWR1k29bXSWEViWQ+/gGzKaOP2Gqo=;
        b=enHTOelGq7BouGNfuQXRgd10veJYfBroaOvptgQNBqnOVOU9q8Wk/sYxC0Pm0EM/Bh
         KWayzqilPKTEAmQfz7HupeGIDEnRd1S6FS29GX4LTxeE7jWyLLD2IbPiK7cpSsY7SqYf
         EIT9dSMixnbOhyY+L26MLSTbzcsinRFHfhmTzI5h+YIJx4yay4zIK2QsnLNdh71cP3al
         xY58mR6QQYbESQfQqOmuunYhaqLFyVWbd1jTTWUAIeLjF37vJfwRL5yUk8pGkCIZPoHl
         A3NLV+5PGtls1mv2E/U5zuLpwAQbGKY/sIUVUA/+R9Ou5DNSvHfxmEUKeRRXa/sNPu0V
         tK/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OZo8VBXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b70si1322747iti.92.2019.03.27.23.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Mar 2019 23:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OZo8VBXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9OXa-00054Y-Cu
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 02:29:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h9OVI-0003L6-PZ
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 02:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h9OR0-0000ya-Tu
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 02:22:43 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1h9OR0-0000xx-Hf; Thu, 28 Mar 2019 02:22:42 -0400
Received: by mail-pf1-x443.google.com with SMTP id t21so10896773pfe.2;
	Wed, 27 Mar 2019 23:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fKFvnZrVzExg0eZWR1k29bXSWEViWQ+/gGzKaOP2Gqo=;
	b=OZo8VBXaFvabnf5D88dChboSbArr4wHDOw+c1hcC/VM6ywaIhzYkfyKky7yYzn/9mF
	HVcbLrop2FBEo39oHN6TScyWN5iYpS/kl9A3iz41jMUjOCIRHsYb5RYpwxMq+1oPhbyg
	g+c+8BeXd2mnzKl+MjIZQis2ni9AlwRt8/NyRRZ68nxCERxjrY2VlKghJ0NHuvvqJ2Ri
	JMP0XzzG46D2CDWFCR7+N6zil4uh8KWEiQpGaCuCoEJzyg/6ZqleJ1M6nSS7GKEDo8jk
	wxNHqp8OvzkTLGwjDR3XVu3KzlaDs+lpruHddAycwCXzGx5nhRSSiUXxTg/alEPbjmba
	Udmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=fKFvnZrVzExg0eZWR1k29bXSWEViWQ+/gGzKaOP2Gqo=;
	b=TpWWCkEV7eiIzn7RpqyVncmidRP3b3YOrVmzxFJNdhDMMzR9805pV5hfn7gQsQpRcx
	5rID+jTGenTVhoGjIoyxLGIUSPhYXLtoIuRRc4vHO3WjLD+t+9CKbdTWLQQstlL1iX9a
	QY9Tq50EYL6t3EDGtYwqhplZUVKxoqTP4j7tevfZxFMptDXF/7F3SLgX2DBFsKBWoyJW
	qtNrFkWh5L1A6HThXC9Bg84e6uqU+tHk/cfLQD+icYMTMzMN8LfNTqg3bxLr4iGmQJA+
	1+IWtuDFTEFNpcTLwRGS4jcBEnCdMdaibQoJyoBp3k3GRE97u8ZfSVVmYircRN4jMKB9
	EM1Q==
X-Gm-Message-State: APjAAAU24mtN7i37rsHApcLBjeR2P/ppkIiet2JdLmAO7SbvkZnt+FI/
	eNrJN6ByOpAlYlGlVYnzJj4=
X-Received: by 2002:a62:565c:: with SMTP id k89mr39493378pfb.175.1553754161048;
	Wed, 27 Mar 2019 23:22:41 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
	by smtp.gmail.com with ESMTPSA id
	g188sm42671900pfc.24.2019.03.27.23.22.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 23:22:40 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Mar 2019 16:52:34 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 28 Mar 2019 16:52:20 +1030
Message-Id: <20190328062222.8409-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH 0/2] arm: aspeed: Add RTC Model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c1BStYrY/zQH

A model for the ASPEED BMC real time clock (RTC). The model is sufficient
for running the guest Linux kernel driver, and ticks in time with the
host when programmed.

It does not implement the alarm functionality, which includes the
interrupt.

Joel Stanley (2):
  hw: timer: Add ASPEED RTC device
  hw/arm/aspeed: Add RTC to SoC

 hw/arm/aspeed_soc.c           |  15 ++++
 hw/timer/Makefile.objs        |   2 +-
 hw/timer/aspeed_rtc.c         | 157 ++++++++++++++++++++++++++++++++++
 hw/timer/trace-events         |   4 +
 include/hw/arm/aspeed_soc.h   |   2 +
 include/hw/timer/aspeed_rtc.h |  31 +++++++
 6 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 hw/timer/aspeed_rtc.c
 create mode 100644 include/hw/timer/aspeed_rtc.h

-- 
2.20.1

