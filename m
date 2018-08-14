Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4348535wru;
        Tue, 14 Aug 2018 10:52:37 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx1hHjvjx2pt9icor559P522ixsNbr1cmnhdlmnGQ98ApfLcxweCo/nf8qEjOZLOO/Ul/jH
X-Received: by 2002:ac8:679a:: with SMTP id b26-v6mr22967347qtp.347.1534269157412;
        Tue, 14 Aug 2018 10:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534269157; cv=none;
        d=google.com; s=arc-20160816;
        b=m/Sd6wWaAbEZikdhNlN0fKodxIIe7jwcMv9oPywVHDqIuaeKhR66SAgkoksEK1bsKU
         Wgc3wO0BL2yaWpU+zZomEKjAyqUxq09hfb1ra7pMH/Mjua9BDIZh13ViSM4TBvnnRXtq
         dvEioO/zQhReMThBVl7ZJfzXd0XH/hmUN7go/eN/HwA3G1KwRdSxlwuuXAef/LbJ2TAB
         1xPURzG4ZWIjmN7QYuYMICQytT/kXnmGadm61p+gh/rGsjnzgJX2up5TfIQw7XNOQsHg
         Ai394joKRQxL+zmt24zbITx5KlxLrn3XPnpHIEjKfc5Bzll3baB8/V4fqKkWhzucE72p
         xZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3ItqVll7P5isijczlViQ2SzoO3y5yu0dwYzKR/ILukM=;
        b=lFaSC1RnVRV0tRylwnoTSiYMDHjPSBYi3HSfpnBg0e/MUXv+GRsbKAFEJFaiy4aRfi
         0VV5sKEPVomZOCBX95JgxlkbiR0OnijFLpImiJwkyNUJzCRPvSJuUN2j3l0BfBxfZvSv
         HzLwjmAsZNr1X+HuwMN0yCZi3Z9gp4b9h82sYk/ljOjwy0ELVwumhCN2V80UZ9eZtP4P
         16+aM4AnPmICTJqH4CS/2KYvBKN+lRpuiqid5bAhGOxd677lLsvreQg0YPw93sgxJahv
         uukqYTeiX4itM4Pno1Y8kilKvjYxvtXq16R3RSgwgqvp+WlzgdrE+S6VThHPWVhoClPb
         ifig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f19-v6si5783542qkm.281.2018.08.14.10.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdUi-0003H5-RK
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:52:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdQg-0008L4-3K
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdQR-0004WI-1A
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:48:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34032 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpdPr-0004BH-Lv; Tue, 14 Aug 2018 13:47:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3BC240216EA;
	Tue, 14 Aug 2018 16:29:55 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C883F1C733;
	Tue, 14 Aug 2018 16:29:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 14 Aug 2018 17:27:35 +0100
Message-Id: <20180814162739.11814-3-stefanha@redhat.com>
In-Reply-To: <20180814162739.11814-1-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 14 Aug 2018 16:29:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 14 Aug 2018 16:29:55 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v6 2/6] target/arm: add "cortex-m0" CPU model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PMlVasZYOxfx

Define a "cortex-m0" ARMv6-M CPU model.

Most of the register reset values set by other CPU models are not
relevant for the cut-down ARMv6-M architecture.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3848ef46aa..7e477c0d23 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
     cpu->reset_auxcr =3D 1;
 }
=20
+static void cortex_m0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+
+    cpu->midr =3D 0x410cc200;
+}
+
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -1845,6 +1854,8 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
     { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
     { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
+    { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
+                             .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
--=20
2.17.1

