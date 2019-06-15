Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp674883wrg;
        Sat, 15 Jun 2019 08:44:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcdhBkY+DlXvaHCTU3daRdHlw3NcCz7nCf4lJVyd1HYSXWwvFP/z8S+gcFePV5y6WRK9AN
X-Received: by 2002:aed:39e2:: with SMTP id m89mr12539362qte.349.1560613464294;
        Sat, 15 Jun 2019 08:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613464; cv=none;
        d=google.com; s=arc-20160816;
        b=1IGvEWS0NiIxVX5Bi4oZM7pUpVvcFhhliL0+z0Bl1+t3r891YbX1ObPZNkFtFen90g
         Zr0ly6xO+zS/p05/6+iNwE09pVV4J4Q0E9jRnqNNsymCrNfUG3KURhAeXmC+TRQc07dT
         yMgEXyYVyFrQ8fTc1CB5s/Mk0FSBca31mqTIhVZU1lXIMIJdzM9Wvy5fZ7O3JyW/z4rz
         ZgVDxxUBA4YKyjXNJB3w74lEGDEznVH4TSgrQBKSbbIBebmh4M2pThkwFCVuLhg84taP
         bOt++D0XtDw27I6ErAKNFxOIFBCAMVVWjs8LENaba6DUMWTHhB+J8hy11xRUwxzW2fDg
         qGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=lZErC6+hUi0QqOCauo3jRzCSZbMvxRqSjS/rIUv+r5w=;
        b=OxS/+MJchNiUPFPu5SEof+JVz2xmjL2u1506Gueks+tKk/fU9FNKeKxHvSlljxONy9
         f3Dl8S+cGWWphO3Jxpll+9FXjkX8kAduetAoU2lCCEh6e9Uqe8mkXmXdDuDgEQyTVvkS
         0AsCs70Jny7qzl6IUI/dXsDKPpyKfd/ReW5oi7JWcl4ewkoGTtI6fv6ATz9HO1l3s0Yc
         EhkZor5+ZUn66hYlZ0iyIWNVkQ6w2FskBwkOVTDJQFAZoBLdkH7KlEUgnOah7kmFY+e8
         dQeR9e3WGex/+ZvJ6MF1Oh7oqIBA/BzxIFjNh1TRcKEa2DuEkT5SEM+IvjSeve7ga+eq
         +4+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q63si4482280qke.226.2019.06.15.08.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:44:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAqt-0003eQ-PY
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35463)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqZ-0003dv-IA
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqX-0007kb-QQ
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50302)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqX-0007dw-Kf; Sat, 15 Jun 2019 11:44:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5D573083391;
 Sat, 15 Jun 2019 15:43:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 650F81001B05;
 Sat, 15 Jun 2019 15:43:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:30 +0200
Message-Id: <20190615154352.26824-2-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Sat, 15 Jun 2019 15:43:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 01/23] target/arm: Makefile cleanup (Aarch64)
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
X-TUID: 4kuisnXq5WuU

Group Aarch64 objects together, TCG related ones at the bottom.
This will help when restricting TCG-only objects.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index dfa736a375..7c31fa01c1 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -7,8 +7,7 @@ obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
 obj-y +=3D translate.o op_helper.o helper.o cpu.o
 obj-y +=3D neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
 obj-y +=3D gdbstub.o
-obj-$(TARGET_AARCH64) +=3D cpu64.o translate-a64.o helper-a64.o gdbstub6=
4.o
-obj-$(TARGET_AARCH64) +=3D pauth_helper.o
+obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
 obj-y +=3D crypto_helper.o
 obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
=20
@@ -33,4 +32,6 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
=20
+obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
+obj-$(TARGET_AARCH64) +=3D pauth_helper.o
--=20
2.20.1

