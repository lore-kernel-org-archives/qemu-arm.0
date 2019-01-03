Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp422065wrt;
        Thu, 3 Jan 2019 01:12:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VwYA4BlsewOnnq0LzoVg9swn/Q9AHGxBNOIBSYWvYfbr42fUdyYrOE57mAzbaPtP07JJ6s
X-Received: by 2002:ac8:2fdc:: with SMTP id m28mr47132158qta.202.1546506773292;
        Thu, 03 Jan 2019 01:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546506773; cv=none;
        d=google.com; s=arc-20160816;
        b=mWR3szfVKm+YEIjhoWwgOczLBjU3J7sssDunUeWJzJNKQetusfzBDLguLKgA2pH6IQ
         Y1+m8BHYu5gfoT6mmC/HuOD12rCDmnBxe5F4TaDKW97J77ACVMzCYI3OMZtwqzhI1u1L
         anJymIuh4pAle5dXAMKBEWs/qFkqQN1/6nE+t6Dqy/iVRfASSTT4CCjwauRYryJEf5QX
         DyIoxUg1uJU+YDIm6jKfyxloPr/aVgHwjR1zPunnuC+A887Cw5++dz6U55AWaKLWP34+
         Sqa1TqLM+7PZ0BFmZ1KdhPCpPgOKDSL+z1iBlbvQNAxGNci84LxiLu0dc5K2FJdxQdRW
         IONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=9/AkxHNiJVVJNeFUXGB7N0wjiEPHqeEozyRjORg4w6w=;
        b=HEUMVYaUU7Qwf+ug02EsOquk0UtSJs6gJCDjXH8Xls5gw+2M9YAjL0vnvDJlq43zFK
         SaExd8hYIB8CshPIQ1apUPQamDnJOIQg8KyFnebmfStzOlvG4FQsaZFAV8CGQ0sDblOz
         a5M4uDvk2HqmW2bsBTExp5c/iNkOivOM8qiw34BNFqChKdn0jNNS34+18o7HN4HlDxoC
         LCcnWx0H5NRUh2hHG80Lql0ThpMv40k1WeX/8wn/bsi05ShMpMUrekoLNXxkPV+08Qm8
         BVqtSFqOh4k95e2h32p27aPGBfOhjDVYWj/c7MAll1yrCrhlnjqLszsX9/33E7YeCoM2
         xZdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si10929505qvo.215.2019.01.03.01.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:12:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez3c-0003Hj-Pu
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:12:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3T-0003H4-PT
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3S-0006Sx-VP
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3S-0006Se-OF; Thu, 03 Jan 2019 04:12:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E6F0C047B69;
	Thu,  3 Jan 2019 09:12:42 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0416A5C1A1;
	Thu,  3 Jan 2019 09:12:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:08 +0000
Message-Id: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 03 Jan 2019 09:12:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 00/11] arm: Core nRF51 Devices and Microbit
 Support
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChxPmvsNrzvW

Steffen has been busy so I picked up "[PATCH v5 00/14] arm: nRF51 Devices=
 and
Microbit Support".  This series includes the core devices needed to boot =
basic
guest software on the "microbit" board.

This series includes Steffen's random number generator, GPIO, timer, and =
a
stubbed clock.  Also, this series adds the tests/microbit-test.c qtest.

Changes from Steffen's series:
 * Made timer tickless [Peter]
 * Dropped non-volatile memory controller.  More work is needed there and=
 I
   don't want to hold back other devices in this series that are ready fo=
r
   merge.
 * Rebased and re-tested with make check and real micro:bit programs
   (requires out-of-tree -kernel and stub TWI device patches)

Steffen G=C3=B6rtz (11):
  qtest: Add set_irq_in command to set IRQ/GPIO level
  arm: Add header to host common definition for nRF51 SOC peripherals
  hw/misc/nrf51_rng: Add NRF51 random number generator peripheral
  arm: Instantiate NRF51 random number generator
  hw/gpio/nrf51_gpio: Add nRF51 GPIO peripheral
  arm: Instantiate NRF51 general purpose I/O
  tests/microbit-test: Add Tests for nRF51 GPIO
  hw/timer/nrf51_timer: Add nRF51 Timer peripheral
  arm: Instantiate NRF51 Timers
  tests/microbit-test: Add Tests for nRF51 Timer
  arm: Add Clock peripheral stub to NRF51 SOC

 Makefile.objs                  |   1 +
 hw/gpio/Makefile.objs          |   1 +
 hw/misc/Makefile.objs          |   1 +
 hw/timer/Makefile.objs         |   1 +
 tests/Makefile.include         |   2 +
 include/hw/arm/nrf51.h         |  45 ++++
 include/hw/arm/nrf51_soc.h     |   9 +
 include/hw/char/nrf51_uart.h   |   1 -
 include/hw/gpio/nrf51_gpio.h   |  69 ++++++
 include/hw/misc/nrf51_rng.h    |  83 +++++++
 include/hw/timer/nrf51_timer.h |  80 +++++++
 tests/libqtest.h               |  13 ++
 hw/arm/nrf51_soc.c             | 117 ++++++++--
 hw/gpio/nrf51_gpio.c           | 300 +++++++++++++++++++++++++
 hw/misc/nrf51_rng.c            | 262 ++++++++++++++++++++++
 hw/timer/nrf51_timer.c         | 393 +++++++++++++++++++++++++++++++++
 qtest.c                        |  43 ++++
 tests/libqtest.c               |  10 +
 tests/microbit-test.c          | 255 +++++++++++++++++++++
 hw/gpio/trace-events           |   7 +
 hw/timer/trace-events          |   5 +
 21 files changed, 1676 insertions(+), 22 deletions(-)
 create mode 100644 include/hw/arm/nrf51.h
 create mode 100644 include/hw/gpio/nrf51_gpio.h
 create mode 100644 include/hw/misc/nrf51_rng.h
 create mode 100644 include/hw/timer/nrf51_timer.h
 create mode 100644 hw/gpio/nrf51_gpio.c
 create mode 100644 hw/misc/nrf51_rng.c
 create mode 100644 hw/timer/nrf51_timer.c
 create mode 100644 tests/microbit-test.c
 create mode 100644 hw/gpio/trace-events

--=20
2.19.2

