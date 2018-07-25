Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp464950wru;
        Wed, 25 Jul 2018 02:00:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcQn3gxaHfx7ulshkU9hw/g2Rh3mldzpT/15XhaeXCCObPvqLfdicnKepK39ewyHoSzWM7K
X-Received: by 2002:aed:35f8:: with SMTP id d53-v6mr19731398qte.239.1532509222288;
        Wed, 25 Jul 2018 02:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509222; cv=none;
        d=google.com; s=arc-20160816;
        b=oFiNoeLc1XXzjogrGXo9/2LVIzvXr/2ysKLxml1Csolfedag4SZeLIBltXaN6pFLqQ
         MQlqLd4OO3yLCqiLTeOBy4BG2Wi2FE2YNEYnUxro5B04SW8v3W6f/h5sjpaU+LU5JEiL
         6sKTEpKIkVctH+LqEJan1VcXMAc2ERuaE32hUHxbAP0M9HjaJakxQOg5Hp33vZ29F0VI
         gGqpa5NcNWJhUtwPYICr1uffu4qqLydCZEW6o1hPpqIrM0THOF8s+Td0a/8cNHHr8FBV
         7lE5h3dnU3s/cQYQgLoJwoSZ390iiTQ1H4GwaPGvYiixVT8Nm7zP69kXkbw6vdKoqote
         PQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HgPktDWfTQgJ/aEagv8BPaOGMElrszJmcuKfrBtS6u8=;
        b=o3kljx+5W4kzs6Fo37wmp8+u+zCDqfaZLbPEOSMPoBw7PjgR/ul4eLNoG0+fphWm1E
         Hbmk6Bs+BUpn+mNEpplBWWrQstKCU9Q8nq3D4rIKutLdnqrmagNPgyMgffZMyXpdKaF/
         q0TdUPk3v7EwXFWOw0uFSf7pTRkKmEbjLzcPvHx063yq0Ue0Td9dnMslWduEwqkwkkmi
         opNmKa0Bom/Ke0aMswg3xa4FC6g642G2GfebvK65osIlyfZoWFDNDqduT1SQDRHTFCzS
         vCMQxcZF0/xo+w5/5gSlf92oG+sc5zDIvxUjC9r+sJ4N7K+s2HASya2jAwXgskykMP9o
         IiGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si4587783qvl.54.2018.07.25.02.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:00:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFee-0008E8-Me
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:00:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeK-000897-HP
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeH-00026v-Je
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40830 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fiFeH-00024k-FL; Wed, 25 Jul 2018 04:59:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D500E407574B;
	Wed, 25 Jul 2018 08:59:56 +0000 (UTC)
Received: from localhost (ovpn-117-157.ams2.redhat.com [10.36.117.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82DC22156898;
	Wed, 25 Jul 2018 08:59:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2018 09:59:41 +0100
Message-Id: <20180725085944.11856-5-stefanha@redhat.com>
In-Reply-To: <20180725085944.11856-1-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 25 Jul 2018 08:59:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 25 Jul 2018 08:59:56 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 4/7] target/arm: add "cortex-m0" CPU model
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
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MMYV/LXjVkKi

Define a "cortex-m0" ARMv6-M CPU model.

Most of the register reset values set by other CPU models are not
relevant for the cut-down ARMv6-M architecture.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3848ef46aa..7e477c0d23 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
     cpu->reset_auxcr = 1;
 }
 
+static void cortex_m0_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+
+    cpu->midr = 0x410cc200;
+}
+
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1845,6 +1854,8 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "arm1136",     .initfn = arm1136_initfn },
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
+    { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
+                             .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
-- 
2.17.1

