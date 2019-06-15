Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp674923wrg;
        Sat, 15 Jun 2019 08:44:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKkzv/9tNMSnZqN/qpBJgbq95PZuTqEbfapaHr+kPUaQsUOrbr3EmSaJuHEzDyqBPws5/v
X-Received: by 2002:a37:ad0f:: with SMTP id f15mr82628852qkm.68.1560613467277;
        Sat, 15 Jun 2019 08:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613467; cv=none;
        d=google.com; s=arc-20160816;
        b=BKyurSiNsELqy6wRkFlk7Hfbcu2093Vfh4WYwGosEJxTG/QAxgMMbnEHn9evHhBTw3
         6vb9EpMrF927DO0FlW7zd2bwDnJpvc04FG4835ZA6wa9QduklboMDqy0Tpz2l1fBTn8L
         UCLZogJlzRhVTNpMTKOnPq8APacbuOXrDdT6IfhFYXmU4BPE5/3NsK1Stk6IMqH8uwo+
         jzF6cMtuaMCD5k/b9MDBC6BFxSZvl+R6F8Bo6RIwQc77xo+AA//5IJ16lgwFukQ6O4Er
         4i/oRK32VqSHinV7nIbOOyQlFjWPOzwud4amZOJkeIn64XQ4JVeUXbVHpPZlMmPwh3Q2
         g8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oEjMqolkHBiTzTiVmEVi+refRxn4gzfL55F2Hw4NUNg=;
        b=s1nwZB3WCEvsXpwujTXdHrv6wV9WPMy4CQc3lKspFh2g/rJrON6C8sbyooWWcBVVvZ
         hs+S1iUAvdNIIP/TgZQ2ZktF5a9isf0ub93Y8Nhl48oAXMOGCzzk7cldp9ki9SvO/YZm
         4Va01tQe+cjBURaYooHVSPopk4qBao6i1hF1Nm7VAGzFRnUVxjwNdt07cqHJrjNPAD7w
         xf9TAy6tr2mMiw2GTNOZRunrfpbxMF20PxJVlP656pHkebFAAlCKM67IoW8I6oo9WjzI
         a8/YY20+T5bSmFJb4zQSgDUOtPWpJD35+DZ41SpXwWGNwdkzlSb0SbIlbJCwZfIC8bCk
         nvfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si3802054qvs.152.2019.06.15.08.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAqw-0003fx-Qg
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35501)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqd-0003eH-D0
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqb-0007wd-H0
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqZ-0007jK-HS; Sat, 15 Jun 2019 11:44:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C532307D913;
 Sat, 15 Jun 2019 15:44:01 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEE91001B05;
 Sat, 15 Jun 2019 15:43:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:31 +0200
Message-Id: <20190615154352.26824-3-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sat, 15 Jun 2019 15:44:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 02/23] target/arm: Makefile cleanup (ARM)
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
X-TUID: uT3ZFxEWNGns

Group ARM objects together, TCG related ones at the bottom.
This will help when restricting TCG-only objects.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 7c31fa01c1..3269dda613 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -4,11 +4,9 @@ obj-$(CONFIG_KVM) +=3D kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
-obj-y +=3D translate.o op_helper.o helper.o cpu.o
-obj-y +=3D neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
+obj-y +=3D helper.o cpu.o
 obj-y +=3D gdbstub.o
 obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
-obj-y +=3D crypto_helper.o
 obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
=20
 DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
@@ -32,6 +30,11 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.=
c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
=20
+obj-y +=3D translate.o op_helper.o
+obj-y +=3D crypto_helper.o
+obj-y +=3D iwmmxt_helper.o vec_helper.o
+obj-y +=3D neon_helper.o vfp_helper.o
+
 obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) +=3D pauth_helper.o
--=20
2.20.1

