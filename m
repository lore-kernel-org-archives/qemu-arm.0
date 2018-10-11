Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1816898wrt;
        Wed, 10 Oct 2018 19:26:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63k7CCaYSw4Mvx2G3yG6kNRuvqbPibxX4yNCepB256Ax/bX+f/ckOq/IEN7YFhx21kLUC3N
X-Received: by 2002:ac8:4745:: with SMTP id k5-v6mr6757117qtp.350.1539224765364;
        Wed, 10 Oct 2018 19:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224765; cv=none;
        d=google.com; s=arc-20160816;
        b=GJmGSoeII44wQKNDdUa9V5i38/iYrmNq+zSEMlICYAqH3m/n7oxh/ydYd2gQVeP8vp
         aNWzkYu4+XgRfB1cwqk2Z+Ah6ZljTzeaicN7nnEEnxBE/egE8vbmlYTVj+zDYjdwJfby
         NK6HX4jYkokoSaG/dCmlIDnmnTcqqgH6lGX3OPRfPssGaLQ3Zj/XJAE99QQCAON1EFDd
         68FpvKkiaXeVO/bL5i46UupJPvHZcilfSg2DLVg3/viRj993ML34R8chPI+MNda11Daf
         YDK8N/Sf7zJMw3SNCjHRPTqiH6OowuVgTrEQSeyUvXnV5aExTAyKZKLMqGqIEV+T3tA1
         N9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=HTIJRMP1nxs4AvxfgTDEK+ygizk/27lZxcg/lX8C/cc=;
        b=AfgJYrlvv6meTrMXPg9zRrwRpnBmxQSjYxWe3H6C5jPIBoVKFql6zRtFor35ZcXpSI
         KarpFDbRqahoLQ7SLCm3is9TG8DRYmZA3ODx96fBB6ek5oFu1rTO3e/w+s6dPximkI0M
         r1lRWLMMYAETksRjCPCU67acuasOBWxuWaY9/9crVyqbfnUbOM3JTk5075SKfSpKq6Wh
         0cR6tpqxEjezL3JQZqNsAd1F+q4hh3IOB5ocDIrRoI4VfUL9M8IZnT+iNT4xIEPbH7B3
         D+/bFDWc7IjGAVPti/KJe1HAei3/H0QmaEaWEfRUX/O0A/VQr24iC9DC/X/9HV71aM18
         tSBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SvmKAcw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17-v6si1354529qtq.281.2018.10.10.19.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SvmKAcw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQfs-00079H-Rv
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:26:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZu-0002Ir-Fk
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZt-0004Tn-KW
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:54 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39233)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZq-0004R2-L9; Wed, 10 Oct 2018 22:19:50 -0400
Received: by mail-lf1-x142.google.com with SMTP id w21-v6so5468467lff.6;
	Wed, 10 Oct 2018 19:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HTIJRMP1nxs4AvxfgTDEK+ygizk/27lZxcg/lX8C/cc=;
	b=SvmKAcw2tKnsGl22b2tqUeSJY5MGuEB4cPV/CG5BJaggIrNV+uVKjQY1ELoOA7f4a8
	g0z7gOGbmClddUTZbBt1KO5yoUcOUHp/yZX6VEPcWjC09vziItBg17KLfB+D1Pj3gvL4
	rFdRSTZNb1YeiYcq1X3EhMFK8aApzuDSPwhIjmpUNedRsr+LJwr8SEcS7ABVscBD4DCp
	3YKPvp3dijZavBcpFT+KbKYrjvin5EtW+VU6trWyLueL/jgohX8FzyIAXSo5IAD7JKs6
	uTGsmJ/kM6ON3WE2jPxUEtjml2cq/UJCtUdmrcBKKuQtWiTAHGmX8dNoNHNQlot+WP+k
	HyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HTIJRMP1nxs4AvxfgTDEK+ygizk/27lZxcg/lX8C/cc=;
	b=ohoO8+mlFLOEoQ447M5/Y1ngYve7eLv0CyQqOvMJW1ZjDvUr1qIf2Rvhi9h1v7QAgF
	sxbNIchiS9/7XUlh7Uh2y22pkWIIm94+tDK8jsytY1aNdfvUCtDH42qWY4iCUh9p79g2
	5TnCONNGtLfWyxTfcd0CNi0Xb39yakI+p27nOVbEeeO1KrIlJSdQebxrv5yvYb7pvArl
	Vzo0WOEDKPC9rJVVNpXywNWIZhQlqrp1Vklls5JHoOCglntJkqyWpfg2qRKOu4bRSQ7H
	ERxL51mYE6mVbyopPkanIojYYiKBBkWC1jLZe/88RwuNdtjuIyjEaK+IEgKVlg9sRRMw
	l8yQ==
X-Gm-Message-State: ABuFfogsOojvURoQBmgUN4qG9rbxKAisGH2crTs8tMhSjD9mK9SwPyGj
	o2uk+AH2hoEaZnovEeXHYj2irTDIElI=
X-Received: by 2002:a19:1d81:: with SMTP id
	d123-v6mr19560730lfd.39.1539224389180; 
	Wed, 10 Oct 2018 19:19:49 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	d6-v6sm5234313lfk.83.2018.10.10.19.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:29 +0200
Message-Id: <20181011021931.4249-11-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: [Qemu-arm] [PATCH v2 10/12] target/arm: Add the Cortex-A72
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: spr1TUEVbKlN

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the ARM Cortex-A72.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu64.c | 66 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index db71504cb5..44fdf0f6fa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -51,7 +51,7 @@ static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 }
 #endif
 
-static const ARMCPRegInfo cortex_a57_a53_cp_reginfo[] = {
+static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
     { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
@@ -156,7 +156,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
+    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
 static void aarch64_a53_initfn(Object *obj)
@@ -215,7 +215,66 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
+    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+}
+
+static void aarch64_a72_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a72";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_VFP4);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
+    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
+    set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x410fd083;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034080;
+    cpu->mvfr0 = 0x10110222;
+    cpu->mvfr1 = 0x12111111;
+    cpu->mvfr2 = 0x00000043;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50838;
+    cpu->id_pfr0 = 0x00000131;
+    cpu->id_pfr1 = 0x00011011;
+    cpu->id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0x00000000;
+    cpu->id_mmfr0 = 0x10201105;
+    cpu->id_mmfr1 = 0x40000000;
+    cpu->id_mmfr2 = 0x01260000;
+    cpu->id_mmfr3 = 0x02102211;
+    cpu->id_isar0 = 0x02101110;
+    cpu->id_isar1 = 0x13112111;
+    cpu->id_isar2 = 0x21232042;
+    cpu->id_isar3 = 0x01112131;
+    cpu->id_isar4 = 0x00011142;
+    cpu->id_isar5 = 0x00011121;
+    cpu->id_aa64pfr0 = 0x00002222;
+    cpu->id_aa64dfr0 = 0x10305106;
+    cpu->pmceid0 = 0x00000000;
+    cpu->pmceid1 = 0x00000000;
+    cpu->id_aa64isar0 = 0x00011120;
+    cpu->id_aa64mmfr0 = 0x00001124;
+    cpu->dbgdidr = 0x3516d000;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
 static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
@@ -293,6 +352,7 @@ typedef struct ARMCPUInfo {
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
     { .name = NULL }
 };
-- 
2.17.1

