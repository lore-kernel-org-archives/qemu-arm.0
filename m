Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3233791wru;
        Mon, 13 Aug 2018 11:58:02 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz73KqxNWWFDeJ1Pg1YCFiq97+5ypoNP6RNZYZlnf0HXYJA8IPoxww/aZIJ8rjkTQop5DS5
X-Received: by 2002:a37:50c3:: with SMTP id e186-v6mr16540085qkb.91.1534186682022;
        Mon, 13 Aug 2018 11:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534186682; cv=none;
        d=google.com; s=arc-20160816;
        b=OEWNEtCIjCWtIzVAT/YzUuOeaziurBMpBWTVVJb6nHAva3T5MO7adZZlyyb6otMtCk
         oTLm7IjkuhE3SxuIHaFqU1dhGHPAdYgrlXk/9++vsA7OjFq3O1tHJ+4n++UyuAFGb8PP
         NaBs8Ls4PzWvPsSmM0NJGDv6sVnSP1DNreEJa4/ThLAgKf4qNO1jpy8GmRWwblQw9B8b
         hrJ4M8B9/7PDFiJWbavhF8NdO6+78H1DGdO18UPcscm90cu+xKtP/2lp2dH+JMx6pEQt
         ED8mqiE0jL7SBa/lqNweKThe6XFqhclPqPwCBjkX623QFoyXjUVK6/F9OmhNqWJjm4s0
         VYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3ItqVll7P5isijczlViQ2SzoO3y5yu0dwYzKR/ILukM=;
        b=Cc6BOxSu4WlAiDKmJzhEEKGORv29bfQAW5COo9rdGE9Rm7oIUvnq5qMcy0LMFcL2iI
         gusGA7tUAeBwRioxnhASWq5gU4V39g7DMYGjB4j1ZHxTNzroEgUkaZRxjI8RJCN7F4P4
         2hnlTkq1c1vkrwiyYmmlzg2666RwjT7niX2uX8iMIkVNoSMaOzcZYVvxqyDtcP7+wvAP
         figUJSwie4zOydC/Y7GqVy70XLZxmWp1eqbTuRGBtBLaJbzTP0h577bVXVIpE1j+iEgR
         fsMzATBoeZILO/JVb+4pPlnnL0A/HdX3OZ94fZeL7CXKzlQCBVBX5bpgEbiF3/V86VSJ
         OmHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k90-v6si3765090qkl.224.2018.08.13.11.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 11:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpI2T-0004E0-F6
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 14:58:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsl-0001s5-Od
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsi-0003yH-FS
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:47:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37252 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpHsi-0003y7-Ao; Mon, 13 Aug 2018 14:47:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB7C6818A6A9;
	Mon, 13 Aug 2018 18:47:55 +0000 (UTC)
Received: from localhost (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6545620389E0;
	Mon, 13 Aug 2018 18:47:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 13 Aug 2018 19:46:20 +0100
Message-Id: <20180813184624.12071-3-stefanha@redhat.com>
In-Reply-To: <20180813184624.12071-1-stefanha@redhat.com>
References: <20180813184624.12071-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 13 Aug 2018 18:47:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 13 Aug 2018 18:47:55 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v5 2/6] target/arm: add "cortex-m0" CPU model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5PJRO8RcRQmj

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

