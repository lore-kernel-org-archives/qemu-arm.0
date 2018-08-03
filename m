Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp156845wru;
        Fri, 3 Aug 2018 07:47:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcuvWZRbPYZNBhHkYu+A5yONuk8J3Pu9NVFeHLcRE1qF/F4hmlSMUZOrMXLKWc88SlsuF9E
X-Received: by 2002:a37:404c:: with SMTP id n73-v6mr3889526qka.250.1533307672393;
        Fri, 03 Aug 2018 07:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307672; cv=none;
        d=google.com; s=arc-20160816;
        b=n/FdWk72Rr+Hv7PMypaMvR4YUcLSXFtyVMic+Qqlinewao8tN0pV57vPanAQfD8dE5
         6XWdHNpNNYPLkVjmLBnoAd++zxc+CMXQ8Gv2ier7aWAZlqRUrEPrR8LHKtq8rtPa7Uhe
         H2aq1bWZkKqRfUEY94anNzNLwUxTFZxCR8CKYhQ0zi56qX3o7wc6Xaaquhc4xOjRySKT
         Un5+9uxWLq/TdAn0hXmFCr4HtoLuLwK/MiJxzziqVDzZwKLCsrWgRYGTobm8Ib+T/Gdr
         b829wn1yv0/qSDEc99/2FATIvntXukJg8SyAlhqArgc+NZnNyAlrbXzgdaCMelFBoDLX
         UKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=EmI/iwNfoQjAV6d5rRjCEzndsoHmMdT96FW5Z5WwpiI=;
        b=h8hSuIyj2CbqdVwmlAEHVWXajpzgEZv7XSkCcDj0ObhIHjLku17EO6jIKowJx0BU42
         tO0lW+D9lnWBXSg7DCVBNHlzy5UiLClpdS3D7UU6ji1xl1YaCIQRDmJ1g67bZdRuV67O
         ZM//xBw+tohqvxSxd0FVykiAMyx50L9/fqDulbg3nZJ2+zaddATx0GPoCPAsaNyFHtGu
         45OVFw7k4pGTXX3BSgwTfmgxRhhJ/JT+1YUI9dgBlfki1RTmvw6FTUBiyzLiJlDGSpHb
         UhOcCEvJXQDf+T4YP163/AxVbKPTEWSKPz22ROA1BeuL64h3S8eFtEUNHhxutJwY1g9w
         CelQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5-v6si3932318qtp.240.2018.08.03.07.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbMt-0002i8-Sr
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:47:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMc-0002hm-My
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMb-0007cz-5J
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42288 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMb-0007cm-0T; Fri, 03 Aug 2018 10:47:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53B1640241DF;
	Fri,  3 Aug 2018 14:47:32 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 081867C34;
	Fri,  3 Aug 2018 14:47:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:17 +0100
Message-Id: <20180803144721.17036-3-stefanha@redhat.com>
In-Reply-To: <20180803144721.17036-1-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 03 Aug 2018 14:47:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 03 Aug 2018 14:47:32 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 2/6] target/arm: add "cortex-m0" CPU model
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
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mefCNTweKUPF

Define a "cortex-m0" ARMv6-M CPU model.

Most of the register reset values set by other CPU models are not
relevant for the cut-down ARMv6-M architecture.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

