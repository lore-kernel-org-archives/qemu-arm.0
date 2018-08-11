Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp783321wru;
        Sat, 11 Aug 2018 02:09:03 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxR9tSJO/WIHfU+dn6Su4JwJZHVgrwvq7xVgJEZ+N3uNzMIwzj55pF5gGIJIKVJsa7Fs8do
X-Received: by 2002:a0c:e7ca:: with SMTP id c10-v6mr8657549qvo.48.1533978543596;
        Sat, 11 Aug 2018 02:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533978543; cv=none;
        d=google.com; s=arc-20160816;
        b=MK//Ognk71kWjfeYL3TIxKEiOIVBwv9KtQ90Om8JNhK62+bo/QB5gu+8JWlQCDdNlx
         vhow0ruE+Jcp/24dnv2C2N4FukLEZe4h/mgvNjJtoFxX3guUkq74NaPZMK5yBjzg/ZAC
         o+cRd/e1lZ+m9dsCkxVwAlVd280Q+l3bzMdqZ/fw+Igwb6ojnhTqW/VW1EHVjFQRzfnd
         gYCVDAKUn93SPLzxzE2/wGnUv1ty+r9xuX117NRA+EF59NKcM3m2BwY6oM8MeheW3c1a
         EWYnZ2rl7gv26pOmVFGdLOvQ8PvqikYpLjhdBeESNVmRLiiuE9lwKDlZWiXOewmTi6YO
         Notg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=T6Q45Ks7OTBXjSNdJfh2X7fdf3oONBndU52AfEQMcMA=;
        b=uCBuG8H+NQP9QcYBGradDojxBQCkC4zjt7HVA8/PoONqIvMHDzWrlSCXhhyv5Kdt47
         U3+OoFt/6aT9Ewlh354ADZ3Sv77dNjWxRroiydQ4lgheyi3EHidHeAFc4PsIATpdFJhl
         57BV7neYAdjBxV6LwA4EgXm850LsVVWiNLzRZa9mGiZX5S4s5IUOfe49Ea//zrC6sMSG
         QbrqnwmXJNvlL1CcQ3ckykkNQEAO9sVrRXwJt6BJ7xGyu7JaAZACQf5QpQojQOf4c2nE
         heD2OCU3kyEq+iWZRKtniYVuedGxccsLfRyV7imqqh1LZd7eJZl95VN3FqzOgmYSdVas
         +Edw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g62-v6si344782qkh.110.2018.08.11.02.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Aug 2018 02:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1foPtP-0005tR-1v
	for alex.bennee@linaro.org; Sat, 11 Aug 2018 05:09:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtA-0005sl-Bs
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPt6-00017A-BO
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:48 -0400
Received: from steffen-goertz.de ([88.198.119.201]:34650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1foPt6-000146-4h; Sat, 11 Aug 2018 05:08:44 -0400
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com
	[80.187.80.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 1F21447D95;
	Sat, 11 Aug 2018 11:05:33 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2018 11:08:29 +0200
Message-Id: <20180811090836.4024-1-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH 0/7] arm: Instantiation of nRF51 SOC and
 bbc:microbit devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1IMRbIy+FpWL

This patch series extends the stub of the nRF51 SOC and
bbc:microbit machine with the devices provided in the
previous patch series.

Based-on: 20180806100114.21410-1-contrib@steffen-goertz.de

Steffen G=C3=B6rtz (7):
  hw/arm/nrf51_soc: nRF51 Calculate peripheral id from base address
  arm: Move nRF51 machine state to dedicated header
  arm: Add chip variant property to nRF51 SoC
  arm: Add additional datasheets and copyright lines
  arm: Improve error propagation in nRF51 SOC
  arm: Instantiate nRF51 peripherals
  arm: Instantiate Microbit board-level devices

 hw/arm/microbit.c          |  91 ++++++++++++----
 hw/arm/nrf51_soc.c         | 213 +++++++++++++++++++++++++++++++++----
 include/hw/arm/microbit.h  |  30 ++++++
 include/hw/arm/nrf51_soc.h |  32 +++++-
 4 files changed, 321 insertions(+), 45 deletions(-)
 create mode 100644 include/hw/arm/microbit.h

--=20
2.18.0

