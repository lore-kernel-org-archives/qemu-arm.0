Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp675100wrg;
        Sat, 15 Jun 2019 08:44:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMj5dvlZf+MyAy0VMFTEm4be4yNosuRPUq8g+c/bQ+9Z/25M5RmRsAJ7te2QJfSA5lAoBF
X-Received: by 2002:ac8:6898:: with SMTP id m24mr85037720qtq.362.1560613478324;
        Sat, 15 Jun 2019 08:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613478; cv=none;
        d=google.com; s=arc-20160816;
        b=KloeeAIaxrwMDFDc+l6SDs+hruvVddeYl5fz8ghKWKQSXBWgoq7LV3otFmQ/AN1YYx
         8V0jA64SUqcDwWNoRVluKxMqTRXfbzivPoHfoEvA6p6Jq23C4IZYIiaVFQHFMm9pG6rR
         Xz8fTTe01f6z5HvIcv3vUFaMfsc3Qgq/tYNrBrOegzQd0wd4gHN9zjoh1Yi4iR8RkR/z
         KkP8QmmMDEMGIif0pWoaCePxElguTz0ucZOEPmQA3wK1gc3pcc3aDCk6wh9c6p1N3bzR
         lY8Tgae8cOkGNh+9IuHC6GIUyRyZPx11/sxB2nbKip3vizkde6DlFDEZx9+ZLQga7h1b
         mpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SxVe8AsyGoz2Xsn4OuILbYJ33ilA8UUn74L/rwQomeo=;
        b=BhnudWwOQd9RyJixWNQowm+MItiWQ+gMsOz5lwzczwgax6acL3NY+M1U5Cyt0AfYDA
         L83XWFGSmbXAK789auY4HazRPILVfZePkLEUSAYp6is/cwdAAGIpnl3Xsa+5JH6dyIP5
         8K9vV6Iufk/+nL94nWiC0dZrO8tI0ZOjiUozUakc6V+ZsuFUEBuaT0qottzWzFVapvX2
         9r0T0esQd/+VoCmTTcTQYEo9093jo6pr6+V26XbIe+pePPicwRRUFnP+hLRfGZ3pn4Pc
         Ni7/2CWUH/SaGBQzkkHR24m9UygRFBg5N+zm4rAGsJTDPUj+gmNqPlvTaijxrwVSacdK
         CrTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r65si3858280qkc.215.2019.06.15.08.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAr6-0003hg-1O
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35537)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqh-0003f4-Ax
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqf-000880-8y
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41812)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqd-0007uH-AO; Sat, 15 Jun 2019 11:44:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C37AE3688B;
 Sat, 15 Jun 2019 15:44:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 856DA10EE6A9;
 Sat, 15 Jun 2019 15:44:03 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:33 +0200
Message-Id: <20190615154352.26824-5-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sat, 15 Jun 2019 15:44:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 04/23] target/arm: Makefile cleanup (softmmu)
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
X-TUID: oqim9cK1L2dk

Group SOFTMMU objects together.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 626e340f55..72b42f825f 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,9 +1,9 @@
 obj-y +=3D arm-semi.o
-obj-$(CONFIG_SOFTMMU) +=3D machine.o psci.o arch_dump.o monitor.o
-obj-y +=3D helper.o cpu.o
-obj-y +=3D gdbstub.o
+obj-y +=3D cpu.o helper.o gdbstub.o
 obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
-obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
+
+obj-$(CONFIG_SOFTMMU) +=3D machine.o arch_dump.o monitor.o arm-powerctl.=
o
+obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
 obj-$(CONFIG_KVM) +=3D kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
--=20
2.20.1

