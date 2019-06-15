Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp689299wrg;
        Sat, 15 Jun 2019 09:04:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeD9qzkehH/wUZSU02/S38i9qa4NGa60ol0JArX8+egJvb2/hyHej//4S349rsr5ty1Hx3
X-Received: by 2002:aed:228d:: with SMTP id p13mr27019130qtc.208.1560614675344;
        Sat, 15 Jun 2019 09:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614675; cv=none;
        d=google.com; s=arc-20160816;
        b=0nWjZn+nKW9mHszHe1bXC3PDA6AbMgL1UBnhod4e7+O04IC1OjTxmvVoTQi9nimS1U
         vt5ntPGDoKezxLCF+d+ubwCK5pH+eyrGC4NR0IAyR2n4nQzU3IySfb4WauqeGUcHIxvW
         HMFnZ1pcG4I7GSQo+we0yGXlZ/H5sPpdfbyUHj7tMMm+67wPna6OdFnF2dtroZSSsZII
         gw2vzHqDZd0uCajKGf+zxCS/vN2Ym/5LqUgUZScfvPy3yyiUsg7kcxbfy57qUkfF/sRh
         JU0v+lTrs1Xudo0dq9bIub8FzlG/hbHLF5sl27fn5SvirpgbtQOVT8oUA0xQMbLkUGGv
         4iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Fbf0Iu4lI40rdqaRqCzSQ+5TQT17nq/OS3H/wGEKuck=;
        b=ib9OSlZtUsU5LlxHxs0kpwHSamuUevnOH8L4L16wSMlPAW+qoTX4kqNVpH20M/Pjro
         H3O9kP/IH4Ncei4TqbQsSYoOyE104FV4YOdzewC8QTkePG7qWsor4xg4z/fY04rREgHi
         LYNzhAZV1fANQw+VYYCvAG0ubpJ9uhclWNFhEtAd9IPkN4E1akbnI3RUqWIVS5w+OLuP
         RYt4c9eUBWn9P1As6SmHNpwAnBhpPhkBnAKwnouIJW4SyvgGUgU+joh2kZAzfWIiYmGz
         CiubAlb8xN86eL3FOHCgO7DgfP0lRI1hgiuCxm2kZRUj7pzqDmmm+k21qvJV2YPxHV6a
         Y6GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t53si4001189qte.224.2019.06.15.09.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 09:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcBAQ-0004p1-TW
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 12:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcArH-0004Np-Jc
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcArG-0001b1-DT
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcArG-0001YP-7h; Sat, 15 Jun 2019 11:44:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C4F98762B;
 Sat, 15 Jun 2019 15:44:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5741001B05;
 Sat, 15 Jun 2019 15:44:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:50 +0200
Message-Id: <20190615154352.26824-22-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sat, 15 Jun 2019 15:44:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 21/23] target/arm: Do not build TCG objects
 when TCG is off
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Robert Bradford <robert.bradford@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 02rTKoWNq3E9

From: Samuel Ortiz <sameo@linux.intel.com>

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---

We can also use:

  ifeq ($(CONFIG_TCG),y)
  ...
  endif

But long single line with macros from rules.mak are way easier to
rebase. Now that this series is stable, I could change to ifeq if
required.

 target/arm/Makefile.objs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 5f3f965cc6..b8aa9c032a 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -3,7 +3,7 @@ obj-y +=3D cpu.o helper.o gdbstub.o
 obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D machine.o arch_dump.o monitor.o arm-powerctl.=
o
-obj-$(CONFIG_SOFTMMU) +=3D psci.o
+obj-$(call land,$(CONFIG_TCG),$(CONFIG_SOFTMMU)) +=3D psci.o
=20
 obj-$(CONFIG_KVM) +=3D kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
@@ -31,12 +31,12 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc=
.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
=20
-obj-y +=3D translate.o op_helper.o
-obj-y +=3D crypto_helper.o
-obj-y +=3D iwmmxt_helper.o vec_helper.o
-obj-y +=3D neon_helper.o vfp_helper.o
-obj-$(call lor,$(CONFIG_USER_ONLY),$(CONFIG_ARM_V7M)) +=3D v7m_helper.o
+obj-$(CONFIG_TCG) +=3D translate.o op_helper.o
+obj-$(CONFIG_TCG) +=3D crypto_helper.o
+obj-$(CONFIG_TCG) +=3D iwmmxt_helper.o vec_helper.o
+obj-$(CONFIG_TCG) +=3D neon_helper.o vfp_helper.o
+obj-$(call lor,$(CONFIG_USER_ONLY),$(call land,$(CONFIG_TCG),$(CONFIG_AR=
M_V7M))) +=3D v7m_helper.o
=20
-obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
-obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
-obj-$(TARGET_AARCH64) +=3D pauth_helper.o
+obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) +=3D translate-a64.o he=
lper-a64.o
+obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) +=3D translate-sve.o sv=
e_helper.o
+obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) +=3D pauth_helper.o
--=20
2.20.1

