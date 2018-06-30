Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1612881wrq;
        Sat, 30 Jun 2018 02:23:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfZlcSGPYJ64YvEQI6cuaSKxi132ehkTog0trdCtlxdUHfVBQ1ZcInYPloE6JD2d7isg0Gu
X-Received: by 2002:a37:9d54:: with SMTP id g81-v6mr15362767qke.186.1530350615279;
        Sat, 30 Jun 2018 02:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530350615; cv=none;
        d=google.com; s=arc-20160816;
        b=z+Rb6sAlHxK99Hqlr0Uv6/zalJYKtGRQCcOixQOLGQcS3WUThoiPxwYvZE8PhKCXGs
         h4BVlyCeCv4Qc40PnKz2lzml442EjjIhH42wvuZZRIOJfLxF23oZve1uTvZ7z4+TgCi6
         CfudprlH9f/L6QdTEdOYLn7vPC9RJFDzRzbT/cTuFh4EKbsdXjxvRfzbW9Z3qS5i5z7V
         XwXHWNP2fEIRp7usdYHe8SDb/czK01/zD8ihPzT7obxBbZ4A/0jK3ejiF9wXFTtwenLf
         gRQHaZz904lRCwdV9aYkx0hwlRc2Z/Ibu//OR9sOgVJY9YAYf6p5ALpGPQvmgYQW7OhB
         JSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Hj5l37sCyjw5Rd/4EA+SDatU9bF2eLz+AjCmsAM2ra8=;
        b=MCgF0G9hGuFrFUWxBEMJRvBUxO0NYD9Bi2iPulrvR8hfx8hfGARrrkt0wpIhFHPsen
         ux/Q3qb2h5vNd9H9i73sCEPV7pOETcZhGWbSAEBWDJ27WSTv/n9Upzune/64YZj9rfKu
         yTmJ62Se08QEJhHZpFjnJEj/Tbe0KxLl8OTyaIDSgMoRal5ZU4edbFqT7sNuTp7Awjte
         ZkxWJeaptl8xbvsmlIZJoVtCYGWxWDp+OQ/nI01IoIMuUE6DfPitHp1JzW8/WjFcovjp
         /+CZZF6V7ag4l8N0Ibx1v6kQx3qL2vO/ihBtABUbc9I8jdF5/DWtizckfRbXLRS9TCt2
         DoUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12-v6si9505336qkh.133.2018.06.30.02.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 02:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZC6Q-0001gu-Oa
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 05:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fZC3W-0008CV-9G
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 05:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fZC3V-0001nY-6l
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 05:20:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34254 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fZC3V-0001mc-1F; Sat, 30 Jun 2018 05:20:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7326E4077B7F;
	Sat, 30 Jun 2018 09:20:32 +0000 (UTC)
Received: from localhost (unknown [10.33.36.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07A3021565E1;
	Sat, 30 Jun 2018 09:20:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 Jun 2018 10:13:43 +0100
Message-Id: <20180630091343.14391-4-stefanha@redhat.com>
In-Reply-To: <20180630091343.14391-1-stefanha@redhat.com>
References: <20180630091343.14391-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sat, 30 Jun 2018 09:20:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sat, 30 Jun 2018 09:20:32 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 3/3] target/arm: add "cortex-m0" CPU model
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
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKg9XQJdEuiR

Define a "cortex-m0" ARMv6-M CPU model.

Most of the register reset values set by other CPU models are not
relevant for the cut-down ARMv6-M architecture.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2ae4fffafb..10951fa0eb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1233,6 +1233,15 @@ static void arm11mpcore_initfn(Object *obj)
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
@@ -1825,6 +1834,8 @@ static const ARMCPUInfo arm_cpus[] = {
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

