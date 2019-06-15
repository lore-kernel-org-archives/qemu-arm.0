Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp679568wrg;
        Sat, 15 Jun 2019 08:51:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfd0jZxW1PLnAlnWGpTVX8SXi/aadoZcshfd4BQuZHs76AJcmfVoRLG/cDQrquYxTGKb+c
X-Received: by 2002:ac8:e05:: with SMTP id a5mr51381650qti.53.1560613887340;
        Sat, 15 Jun 2019 08:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560613887; cv=none;
        d=google.com; s=arc-20160816;
        b=bh07LDsG3fPWtVDOmEQrnib/L4v3WpT4jPSn9rIEbnVr6Gkc2A4k2PTugV4NKNH5Fq
         ku8neKAFFPrOrz4Gc2TtLR8z/INHcJoB+8ltdsRtcE0Ze4YXGwo4Zqq9yNX79yBukv+0
         ACUdPGBlXHR3keIN8WERRHT6aNr8bl/vldAvkKgrVaYCx5qfwkc6gMfePkXnWqgnAAWp
         GyeKezRd+ThfY/PgFSqNhZVazJXn0iJiqyzU9qwzhDZyUmjkYQNy5w8N8IGlZCMmI9+x
         JsihKMiYZETIJtpHaDhF0/T7v+euv87HRqlLtDXpgvjswJx8QsCby76SDSaqtSEsG8/1
         yf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5gObwXsTXhG0fHzOg4rZ+85b5we+lijRk5p82To8sIc=;
        b=fj5fRYqmXw1nceRwtBnNsZAqDXjflSssHbt5As8NG2mbEAoaTvtv+N0UxJsCPda4NM
         TqrQCyg2NnlLY0ObnVSErBJdDc2pbXtE0DyJpleKIQ3Yn7UxCoxNdUaEocZD9wc4+NIH
         UYBgujPykAjSo2iPNbG8AvqYUZPzJ6PHvcPTqyn0WJi5p/hOgTzunAtve8HH6frkXcAd
         AHgJ7oNI0/iPJ4R1nnGVsDkMjIMlsGZjeNeXxXzjGU3vTz0XPuYot5xnFfhwjKhkqaQ1
         3G/zmUfP2oKAnTEiT5PFA9YTaLhaoHnos8yKz78tiGkO6Lf7qD1ABRyTrwXwtaoVmtm/
         etjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d32si4114395qtd.116.2019.06.15.08.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcAxi-0008TS-RL
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqh-0003f3-Aw
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqf-0008AU-Ct
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqd-0007om-IS; Sat, 15 Jun 2019 11:44:09 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15B643688E;
 Sat, 15 Jun 2019 15:44:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAF451001938;
 Sat, 15 Jun 2019 15:44:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:32 +0200
Message-Id: <20190615154352.26824-4-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sat, 15 Jun 2019 15:44:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 03/23] target/arm: Makefile cleanup (KVM)
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
X-TUID: SW91WaJ/J+lj

Group KVM objects together.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 3269dda613..626e340f55 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,14 +1,15 @@
 obj-y +=3D arm-semi.o
 obj-$(CONFIG_SOFTMMU) +=3D machine.o psci.o arch_dump.o monitor.o
-obj-$(CONFIG_KVM) +=3D kvm.o
-obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
-obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
-obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
 obj-y +=3D helper.o cpu.o
 obj-y +=3D gdbstub.o
 obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
 obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
=20
+obj-$(CONFIG_KVM) +=3D kvm.o
+obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
+obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
+obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
+
 DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
=20
 target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODET=
REE)
--=20
2.20.1

