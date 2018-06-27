Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6301537wrq;
        Wed, 27 Jun 2018 07:38:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdjE8osNtsIHr4180U2HTnJOhRfJ1q02dbzUVrDXaqK2jvPCBAF4ScSTNFepzzm0Sd8QRdA
X-Received: by 2002:aed:3fc8:: with SMTP id w8-v6mr5616243qth.262.1530110326789;
        Wed, 27 Jun 2018 07:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530110326; cv=none;
        d=google.com; s=arc-20160816;
        b=FRd9DrAczRyaWC91SQBQD7jSu3rIZb0uEbQwP1/JSf/sz3cf3Bp6t8ob2bbbNQk8d5
         qmeFQGuXSbWhw79jRz3fM0sygMPpzDZ/PH1iGlK/Iqrj84dT5N2hvjFiOI2CajydtpJZ
         fCJAeCdXzXQyjMxxWQwQUqzCyFEeMBAkwJy63/oyo6NRvf1wMtiWriWCUY/ZodCHOvKn
         zpaB0xxXQ9XDgvI2vOWhncYqoBAVmnwJgJoAyaXL+UiZsCwR16GfTBkN5Y715amYZLMS
         GyKU973WDFlmevwarJZysB08GNvedGT0xMK23lS8wQX/fGm/Bkew9AA+4JonxzuEVSEN
         GNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=aMBb3Wa0uXQOAC8285KnyA3hZ4B5RSBmzSlgXgXt3Ao=;
        b=orgrTTCuGhObihwCaYmGD2abCshMclLUhXqRSh/7ke5vdCNVhWtT5Guq6JxiE4/tnO
         BXmV5/BaPzrewqVO4PV5doO0dhV15J6g86TRjImrZWh3XOVquOxNaSP3HAGb6zgMLYbr
         c7zY6ryjHTQ475zUfteb02XyVEwrZrbSIFvJzdg2ueP4Z5oJpflSmwe+fG/8uxD7mQoj
         meHiCtCa6vk0Ach7iqWYCJ6bQyKrCclU7ruozeHokb8rtEQTg0UjP8B13LM7UW4ZY5dX
         hMkXKKll9yHEo/mkhpb26L1151pPJtyHpvNZZrKiV9GkVyjJPSuNuyOlltNgFVL7lZXw
         HtEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SxrM3Eux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8-v6si4068088qkj.250.2018.06.27.07.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 07:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SxrM3Eux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYBao-0004Vc-1d
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 10:38:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBae-0004Tr-NU
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBad-0002mv-Qx
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:38:36 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:46538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fYBaY-0002iH-Ij; Wed, 27 Jun 2018 10:38:30 -0400
Received: by mail-pl0-x242.google.com with SMTP id 30-v6so1130776pld.13;
	Wed, 27 Jun 2018 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=aMBb3Wa0uXQOAC8285KnyA3hZ4B5RSBmzSlgXgXt3Ao=;
	b=SxrM3EuxK1l3+vtSelG/F26PxdRhiK9c4bYjFBQnvyid08d7AaO2qujbIXlXUEoMoI
	6xZv9tt4SribWQ82pHpKg1h+LBiaNHMDYPj/y/arbZPy5B/ZJllrcK18v6RMJ0O+vzkm
	4Ma3ly2vhqTlbCCzZtsGpUfS7eDKz739laLFtQfmupXQOG8UVrgZK/PaUnhP05YcedcK
	jojUdrIGzbGcaiW36V/AxFAYpvcJVrl31szkQIGyNzOTL1ZrsKkRdaGOdRb7sOsasex/
	0lZsLXcdGll9GCKShEbcHVj63ZJN2yv/2OCyzOcUUxLE8rDMbs27jk0fmnjKN2cyF+Pm
	TIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=aMBb3Wa0uXQOAC8285KnyA3hZ4B5RSBmzSlgXgXt3Ao=;
	b=ZcOcJ13QdLQYvKomvnmlaGnfRljYILx2wmmYn/vyKaEstAABKxsLnNMgI0NOe9cgwe
	JE7fKVSQspcFgFQGNXQKHLt7039SZHps81bdgvw4WIzElBWGPHzCAnYo2otjCxtWLKde
	DRTj+vFg5RJByUiiaqAmhNySkY3UBasqUXMzn4/cpYMSecKqOXw101OAcxoJD1PRs5qj
	LniLs9tQMUurZWYqxCJUknP4ygzgwNNFC3ht/AQk/ZBaAIa7PNc2Bq4w/eCKsmCFLPIl
	sYFCXrisiLSrI5dg0Vl2epTDZ3AtaFZVGwuf6eqRjIcF/C6wfz7M360i+SgLvRLLbl/2
	u8IA==
X-Gm-Message-State: APt69E1XXmY9asNI0CDftJtGgrOFFI4qSeLFsd26IrEfwsgckmHQpjj/
	kkw7Rp99w9L+7fROx5KWl/o=
X-Received: by 2002:a17:902:728a:: with SMTP id
	d10-v6mr6398938pll.192.1530110309418; 
	Wed, 27 Jun 2018 07:38:29 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm6162474pgv.37.2018.06.27.07.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jun 2018 07:38:28 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Jun 2018 00:08:20 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 00:08:12 +0930
Message-Id: <20180627143815.1829-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 0/3] [PATCH 0/2] arm: Add nRF51 SoC and
 micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XiYFfDPCeQVO

This short series implements a minimal definition of the Nordic
Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
machine that will use this SoC.

This work will serve as the base for our Google Summer of Code and
Outreachy interns who will work on implementing a number of features on
top of this base.

I've tested this with a microbit micropython firmware, and checked that
it starts running by looking at it with gdb.

I chose to keep the nrf51 and the microbit seperate, to not confuse the
peripherals that are on the microbit but are not part of the nrf51, and
vice versa.

v2: Addresses review from Peter and Stefan

Joel Stanley (3):
  arm: Add Nordic Semiconductor nRF51 SoC
  arm: Add BBC micro:bit machine
  MAINTAINERS: Add NRF51 entry

 MAINTAINERS                     |   8 +++
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/microbit.c               |  56 +++++++++++++++
 hw/arm/nrf51_soc.c              | 116 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  41 +++++++++++
 6 files changed, 223 insertions(+)
 create mode 100644 hw/arm/microbit.c
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

-- 
2.17.1

