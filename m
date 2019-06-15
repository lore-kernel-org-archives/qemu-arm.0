Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp674927wrg;
        Sat, 15 Jun 2019 08:44:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIVZ5/B8LZtNySyusoIUJP3p0N2vM/a1zpcdbJivUBDhjltiZSrii3IefcRtm+ShBQKw9/
X-Received: by 2002:a37:dc45:: with SMTP id v66mr23019652qki.24.1560613467447;
        Sat, 15 Jun 2019 08:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613467; cv=none;
        d=google.com; s=arc-20160816;
        b=YEa1aKhvj1LAYthmRP/ZcYjj9B7QmzgLcjzBN72dbb4bIVLdqldhAuNmx+gDmhBpSb
         emdIHXlVhQTjD/56RU6v69c1pVZrKG5Z3VJmIyffRRSQtL+92/1AWbRn0/PDoIRX57Zu
         ySp9NysX/SFAYUfcUr61rX/XEObfHEhlkCFg+NTNIGQtK6HZPbVNLAJnPmCKDHmVCIOY
         2RSHSffF3XxpkZpbEY7Azn+1KwkzEiyOu6xc1P8BbMI0EiMWrKM1EO4z4wwZDFdrjjJe
         ubcny+tw66HBDecsh7x8rzICW2sNrvhEmDuyr3lLldZFxtk2ROh9rI76TdDkhMDj+FaX
         nhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=zJxXmIOWScv9zRRBhpvE2Gjm7KKhB0BfUMzFOq48s8k=;
        b=eRMYh+LKoQCDoh/k52XaKWd0DKASu7oz49Xj89tMZGr9pWepmQLmd5GMWZCktxLK9F
         /QHyxcKKdHdFX5TlTxRMABb6j1BfUQ/RpNJqkAmtmZx6tW+qyFSkBYn9/PWAJzKlMIDV
         MqjieM8GTXsS10M5UzfZE/UPM++gBCxn8tSZmQcoytYSnld7qgPZKkg0VhrH2rMEkXLG
         Fe6yKpTiUSPeXTQ7QIHIU3MY3UvLCv46EhBckZ/d/Qz0GP6Re7OpUgTJmWXwnpgfQAaR
         l9HpVO05L+R+eoCsqDZFTtXxBEKfwVHoSOyqCuaNFFTDu8loj2PLcd2HqHVXyV1+EN2o
         DdaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t40si4129787qtb.73.2019.06.15.08.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAqx-0003eJ-0m
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqX-0003dp-LJ
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqW-0007fI-70
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqV-0007YO-VB; Sat, 15 Jun 2019 11:44:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1B1E8762E;
 Sat, 15 Jun 2019 15:43:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75EE31001B05;
 Sat, 15 Jun 2019 15:43:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:29 +0200
Message-Id: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sat, 15 Jun 2019 15:43:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/23] Support disabling TCG on ARM
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: frsfESo6rocf

Paolo motived me to salvage this (other!) previous series fromi
Samuel Ortiz (NEMU project).

v1 cover from Samuel [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. It splits the target/arm/helper.c file into logical TCG and
  non TCG dependent files so that one can build and run QEMU binaries wit=
h
  or without TCG enabled.

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

v2:

Most of the patches from v1 got adapted, except the "Move all
interrupt handlers" patch, because Peter disagreed with it.
See threads:
 https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg03908.html
 https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg07304.html
Anyway this is not a blocking issue, and can be done once this series
get merged.

This is a kind of series you don't want to rebase (as in, the quicker
it get merged, the saner). It is also one of my most painful QEMU
series, and really wish it was worthwhile.

The diffstat is pretty decent.

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html

Philippe Mathieu-Daud=C3=A9 (15):
  target/arm: Makefile cleanup (Aarch64)
  target/arm: Makefile cleanup (ARM)
  target/arm: Makefile cleanup (KVM)
  target/arm: Makefile cleanup (softmmu)
  target/arm: Add copyright boilerplate
  target/arm: Fix multiline comment syntax
  target/arm: Declare some function publicly
  target/arm: Move code around
  target/arm: Move the v7-M Security State helpers to v7m_helper
  target/arm: Declare v7m_cpacr_pass() publicly
  target/arm: Make the v7-M Security State routines static
  target/arm: Make arm_deliver_fault() static
  target/arm: Fix coding style issues
  target/arm: Restrict semi-hosting to TCG
  target/arm: Missing symbols when building with --disable-tcg

Samuel Ortiz (8):
  target/arm: Move all v7m insn helpers into their own file
  target/arm: Move v7m exception handling routines to v7m_helper
  target/arm: Move the DC ZVA helper into op_helper
  target/arm: Make ARM TLB filling routine static
  target/arm: Move CPU state dumping routines to helper.c
  target/arm: Move watchpoints APIs to helper.c
  target/arm: Define TCG dependent functions when TCG is enabled
  target/arm: Do not build TCG objects when TCG is off

 target/arm/Makefile.objs   |   25 +-
 target/arm/cpu.c           |    8 +-
 target/arm/helper.c        | 3416 ++++++------------------------------
 target/arm/internals.h     |   77 +-
 target/arm/kvm-missing.c   |   22 +
 target/arm/op_helper.c     |  358 ++--
 target/arm/translate-a64.c |  127 --
 target/arm/translate.c     |   90 +-
 target/arm/translate.h     |    5 -
 target/arm/v7m_helper.c    | 2603 +++++++++++++++++++++++++++
 10 files changed, 3451 insertions(+), 3280 deletions(-)
 create mode 100644 target/arm/kvm-missing.c
 create mode 100644 target/arm/v7m_helper.c

--=20
2.20.1

