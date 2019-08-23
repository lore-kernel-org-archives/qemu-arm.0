Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp610089wrs;
        Fri, 23 Aug 2019 06:58:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDHZ3rBooOR1yRiJ+ygQJwEjyVPxjF8cZZMyrEorz44umL2BcdRdRF8aD9rmH6a+HkAaIc
X-Received: by 2002:a37:a851:: with SMTP id r78mr4232535qke.120.1566568717775;
        Fri, 23 Aug 2019 06:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566568717; cv=none;
        d=google.com; s=arc-20160816;
        b=U21Km13H7h/g7YOS7wrj3Q3Jw3PrGTwODkz4HYal3h7M0c1IAE3ha+dGuo721wRDdZ
         zay1ZEUoEeohR3DUyKauOIklcAEXYDJTpkOmOzr2Jv5PvFQmFMqhogXgK+Waj6OIhUfm
         DqqO2wisxkmpYaqHESNAbgJO5E/1nrp3e5rCq+14F9hmr5VY+doFTpDtb6SLvLYenuvE
         HUIR/NkDX5Q0Acfa0dXIFAMf9Mr3YW0huIsz/UWLNG8vEr/szm6v+L1amKC5udqqabKS
         DHbLKh4YgtoM2DzQEdxPiCyzG4QEMh1MNL1wEj8ruSR2hwGoJyavJ9vPejRcyuH/LfCc
         XqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=aSpi3oLY7UpF1OiY53cepm+LHftOEJMAZOCCJIZTYQ8=;
        b=buYUq0N3bEWJPPjrvutdyqtjF/3FSFLgwEdj1qpK12f0GVmIWBYu3+J34s+tc686VL
         olEK721B/GXEoqvE0UJju/5+DPAZ9LN0wuvRXBiZ2AA4BSphrwZZNIplYIZwCBiDyvfp
         e/UcF5v+V42XSE3p+l2xO+Q3IjZRdwKVMVhwH/cfNh5vje4GbkJN5MRX5SqkT74MegX/
         odKg79GoxmgM+30ILtnK2WxLf5KEblHs24Iv+acHG5MBbs6P96XPfAZu1GBhz9z7Xfjd
         eLDPzyGMy78vaMeDsp3ugqpumd2ZEvUHncnxg0ybK8gofbOwGuW/HgPX7BMv6IaBrDvB
         TK6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si1778657qkj.235.2019.08.23.06.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 06:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1A5M-0001OW-UJ
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 09:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1A56-0001MR-FZ
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:58:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1A55-0007Gz-DR
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:58:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1A55-0007GO-8j; Fri, 23 Aug 2019 09:58:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 759DDA2F867;
 Fri, 23 Aug 2019 13:58:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2436B2636D;
 Fri, 23 Aug 2019 13:58:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 15:58:07 +0200
Message-Id: <20190823135811.13883-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 23 Aug 2019 13:58:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/4] Support disabling TCG on ARM (part 2)
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DAuqmZMkZErN

Cover from Samuel Ortiz from (part 1) [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. [...]

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

The first 2 patches disable non-KVM compatible cpus to the KVM build,
then the last 2 remove the boards using these cpus from this build.

This is a resend (no changes) of patches from part 1 v4 from [2].

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
[2]: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00312.html

Philippe Mathieu-Daud=C3=A9 (4):
  target/arm: Restrict pre-ARMv7 cpus to TCG
  target/arm: Restrict R and M profiles to TCG
  RFC target/arm: Do not build pre-ARMv7 cpus when using KVM
  RFC target/arm: Do not build A/M-profile cpus when using KVM

 default-configs/arm-softmmu.mak | 47 +++++++++++++++------------------
 hw/arm/Kconfig                  | 42 ++++++++++++++++++++++++++---
 target/arm/cpu.c                | 16 ++++++++++-
 3 files changed, 76 insertions(+), 29 deletions(-)

--=20
2.20.1

