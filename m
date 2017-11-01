Received: by 10.223.161.27 with SMTP id o27csp1261423wro;
        Wed, 1 Nov 2017 13:36:39 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TH+bBMZWN/wQQ1KDFDFXK1w+W6Ch7VghS/TJs958ujn1BylpKE7q0z1M9wQ9ryBBID7JZp
X-Received: by 10.129.120.213 with SMTP id t204mr763431ywc.513.1509568599673;
        Wed, 01 Nov 2017 13:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509568599; cv=none;
        d=google.com; s=arc-20160816;
        b=0ajtaTkM4QMEdMNP1fu/BgwRYvJG3wEAThZ9VVhC61xnn13i/OiAAMIAGIvH9ZYMb5
         07CIEAkG9gxC4YwVHHKDAvK8eo5ZvslRSIk5aMztt9QRKnbfPNZ51KMedSHItE2AUI5W
         cBy6QhvJXA3V/wRp1G7AaWfDguIuUzMPIL7gvj6q5CBw2u/cMBSmFc4lyvsmQEX0wq0T
         WprsMk2eMwJf/Mlh2cfnRPJFWK5S0p1KdoATYZwUCI5/Fon1iG8QnL2zOqp9TXAQCqEG
         /6+Ohn0rv5eIUSJZgl3TSUE/Etazb+W/o6KOkappgcKTaA3zjEc3enyxfBGChp3OATin
         ngdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=rbm9RQvSCMJBjlK84BCHx+uDVxnneO1br+AFC8eNwXQ=;
        b=l3Np+9lqf6PtTOfhzkY+JDRPRXN9r5Px4RDlsbJnMieGSCgwe4ikC9w1//Jfhpgk+L
         g3ZjwBR1m+0xHHIUgy9PxN4HH6hAETZro7gqRpRuCvp5YZDHYVJIfVWatRI0+Wb/mpwS
         BDkc2Mcy1TRJMcJenpdVIlKoRxxkX7TGp6r/ExVLfMAjFhPH0YUnGMozkiPJWxH3t6Ly
         8Nqw54VDBxk+/Nv+QSPZinDao4lRLpH5jN1y+xM9IkfsChTknMH9ng/GoSs8vgyifiil
         T106A3EDSGXvuuvRgZJ4pmxvUnDpNEy0PtmGyEhc0vp+580xUsZSGFQ796nf71hEn77n
         Y8Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=VPkou6j8;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=sMErBNOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si350236ywp.130.2017.11.01.13.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Nov 2017 13:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=VPkou6j8;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=sMErBNOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9zkd-0003z8-2h
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 16:36:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e9zkS-0003z1-CB
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 16:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e9zkN-0000mE-Eb
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 16:36:28 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53807)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1e9zkN-0000iV-0h; Wed, 01 Nov 2017 16:36:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E7E182081E;
	Wed,  1 Nov 2017 16:36:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 01 Nov 2017 16:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=rbm9RQvSCMJBjlK84BCHx+uDVxnneO1br+AFC8eNwXQ=; b=VPkou
	6j8MyDucw8C0Do6dHsH4OV9OdKjL6NoWFKOp6aJBE30vsBUmuVVgjCHGkf8NEHUA
	kIalLzv5Vu+qrsLroy6aE+uqMFwFQjAuEuh8Ls4TBT6JjrzILRLifEj9fCXwo/xp
	sXeQDApFLAntb7bKvnVWScJUiP/mM02Azj2U5U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=rbm9RQvSCMJBjlK84BCHx+uDVxnne
	O1br+AFC8eNwXQ=; b=sMErBNOq5Od3HjpuRx78P0hRO6IPr5dOoyJ4Bk7kSb+H0
	3YTxUwO0ECMBEbzSBuqdxACJTpdEhImS4C78h9HAc5J067cD2H5Qg+unrDoHuF7/
	p2k5LfSmicwQRAWgmzZLVaTOKP0X62t64dH44wDnZqT+bXdSUrg4rQKiPugCQysx
	qlxbfZtqqQ7KOkgccpCwFJXWtQJ2nOkC8jxVZMsQB9mbQbE68CS3BIMn8V9q6ucE
	XUktU9uQ9OtmTr03qy/cd5T4PvijUqiP3XVMKV+I/2TiAxO3E5OnbAC7gAo6e3K4
	i3DfG1+J3ki3aLedjIR5BFSINf47N8aRCUxHOWXRA==
X-ME-Sender: <xms:RDD6WXcYT269Wlj4pM8pEeGk8XiWOwd3AvHXsLrr-EQIHflESxSNEQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id B3DCE24731;
	Wed,  1 Nov 2017 16:36:20 -0400 (EDT)
Date: Wed, 1 Nov 2017 16:36:20 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20171101203620.GA17963@flamenco>
References: <20171025093535.10175-1-richard.henderson@linaro.org>
	<4ab3bd81-925c-a281-614c-2cd87fce38b5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ab3bd81-925c-a281-614c-2cd87fce38b5@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/51] tcg queued patches
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g/RL/DlE0Nv1

On Wed, Nov 01, 2017 at 18:34:23 +0100, Thomas Huth wrote:
> Seems like something in this patch series broke a couple of ARM boards
> (smdkc210, nuri, raspi2, xlnx-ep108 and xlnx-zcu102). With current
> master branch, I just get this error:
> 
> $ aarch64-softmmu/qemu-system-aarch64  -machine raspi2
> **
> ERROR:/home/thuth/devel/qemu/tcg/tcg.c:537:tcg_register_thread:
> assertion failed: (n < max_cpus)
> Aborted (core dumped)
> 
> Could you please have a look at this?

Turns out some boards initialize a fixed number of vcpus, which
can be > max_cpus.

The below fixes the issue for me, although I'm not entirely happy
with it because if -{smp,max}_cpus < machine_class->max_cpus, some
TCG regions will be wasted. Not a huge deal (in most cases it will be
2MB per unused vCPU), but a better fix might be to just honour -max_cpus
for these boards. We might just not care enough though.

		Emilio

---8<---

Subject: [PATCH] hw: define and use machine_class->max_cpus_override

max_cpus needs to be an upper bound on the number of vCPUs
initialized; otherwise TCG region initialization breaks.

Some boards initialize a hard-coded number of vCPUs; mark this
with machine_class->max_cpus_override so that max_cpus is
set to machine_class->max_cpus when set.

Update the ARM boards that hard-code max_cpus, thereby letting
them boot again.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 hw/arm/exynos4_boards.c | 2 ++
 hw/arm/raspi.c          | 1 +
 hw/arm/xlnx-zcu102.c    | 3 +++
 include/hw/boards.h     | 3 ++-
 vl.c                    | 4 ++++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index f1441ec..7071505 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -189,6 +189,7 @@ static void nuri_class_init(ObjectClass *oc, void *data)
     mc->desc = "Samsung NURI board (Exynos4210)";
     mc->init = nuri_init;
     mc->max_cpus = EXYNOS4210_NCPUS;
+    mc->max_cpus_override = 1;
     mc->ignore_memory_transaction_failures = true;
 }
 
@@ -205,6 +206,7 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
     mc->desc = "Samsung SMDKC210 board (Exynos4210)";
     mc->init = smdkc210_init;
     mc->max_cpus = EXYNOS4210_NCPUS;
+    mc->max_cpus_override = 1;
     mc->ignore_memory_transaction_failures = true;
 }
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 5941c9f..bf4eec3 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -167,6 +167,7 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->max_cpus = BCM2836_NCPUS;
+    mc->max_cpus_override = 1;
     mc->default_ram_size = 1024 * 1024 * 1024;
     mc->ignore_memory_transaction_failures = true;
 };
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index e2d15a1..f7e0004 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -185,6 +185,8 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
+    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->max_cpus_override = 1;
 }
 
 static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
@@ -241,6 +243,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->max_cpus_override = 1;
 }
 
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 191a5b3..724be45 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -176,7 +176,8 @@ struct MachineClass {
         no_sdcard:1,
         has_dynamic_sysbus:1,
         pci_allow_0_address:1,
-        legacy_fw_cfg_order:1;
+        legacy_fw_cfg_order:1,
+        max_cpus_override:1;
     int is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
diff --git a/vl.c b/vl.c
index ec29909..b2f056a 100644
--- a/vl.c
+++ b/vl.c
@@ -4336,6 +4336,10 @@ int main(int argc, char **argv, char **envp)
                      machine_class->name, machine_class->max_cpus);
         exit(1);
     }
+    /* some machines initialize a hard-coded number of cpus */
+    if (machine_class->max_cpus_override) {
+        max_cpus = machine_class->max_cpus;
+    }
 
     /*
      * Get the default machine options from the machine if it is not already
-- 
2.7.4

