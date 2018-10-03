Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6438012wrt;
        Wed, 3 Oct 2018 08:14:31 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61BGgNVMJ04APs59MrIguDvu19jJPZDG3RgbaemGmqW55ij3Nn1Hg/HJKeI4Q+gdyijsHSC
X-Received: by 2002:a0c:9aef:: with SMTP id k47-v6mr1673764qvf.134.1538579671297;
        Wed, 03 Oct 2018 08:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579671; cv=none;
        d=google.com; s=arc-20160816;
        b=jlm6uDl/yhXJYujJ6XhR4lA+4k3pkjcBS4zfyogDZ+eqlUa/sNGuMvwLSLL2GZLM5B
         uVObcQFwmEEVnYPEiJwL6qA7m9P/EtuYFXEf6hQZ9u28emAtQwq+tg/HCbKcy2vvvI98
         In7R5RIBts0rU07juhPu1dupU3ekYGn4n75ts9MLgddcFVbhS6ov3AvUlvcBzrwrK/Ix
         S8TwNttvaDkCauiDrTefzo74GfBScSYJhwwSJoXkAjx7XiYqPtxwidb9r6aULG//yY6e
         Aa33nO/iNUK/DoLeWpiHqR4xldWaNxc9opDWHtloH032oDbU4tEXGrDZ4V03z9A8DMwt
         OTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TjadI8cUCVkRuIbycVSHfp34CxaXn6Lxf6cziK2DDYk=;
        b=diyrWUoNIgEx4ERcVhpGa+HCuxowhUbUD/i3bE91NaIaT/q6AMa2TOrrRWhWkavf37
         vKLD7yrB09u6SwsQgf74q6ee8b1Hk8n9Z2ttjclszCNEOH3LqWx60PfyV6iD8d1I0mP0
         CuWeMo3I9XeosN1fEKS7+4PLRto4XXG8+1Rlcdiry6TlbvACPYQplP1tEjNv2jITTqlO
         pj0S6aDHyGNPgyIBJzP5gki6M/P2R3dclCmEERssqZF1cSxAtRtGOWCExsftZ6JEn2Ym
         VRDjnhbs43lz0dhWOl/ma74gEuqsZt4afC2gVyFevqyAHXjDD1vV7VZQG+Dqzy/AjE9z
         PUKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XNDt9qRP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31-v6si1050216qvq.268.2018.10.03.08.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XNDt9qRP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ir8-0002pn-M6
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:14:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7iqu-0002mb-6N
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7iqr-0006jz-2W
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:14:16 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7iqh-0006fK-5W; Wed, 03 Oct 2018 11:14:03 -0400
Received: by mail-pl1-x642.google.com with SMTP id az3-v6so3635397plb.4;
	Wed, 03 Oct 2018 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TjadI8cUCVkRuIbycVSHfp34CxaXn6Lxf6cziK2DDYk=;
	b=XNDt9qRPitTOoTezy3vBJaAE1E/2fGkz3LWDn69uAc9ikLCfAmpuT9niMtfqWXklXA
	u2L1jvvpPQgly6CfsvbsiWFjRJ2LNIcaFy57cV52RSPtd+2nvuc+pQ1hK5ivFWbtjPi0
	uoOLpR6bAkwx1wjQU16sYzHdoMTxQohJJpCeoIv336+EHR1osD+M7gvo//VlM5qGmX5z
	XFXzC9PzyncOLsoipmGa6c8ucMochTINkU6x19CkpWHN0k946O1XpnAOu0ff0fnWRRCx
	9CGp+CWvWqq9Z50PEviR6M6WiqoWeFVGV9DK0ewz1buyimkn3QNnWHl9BcWFZ7CZ0LD9
	xvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TjadI8cUCVkRuIbycVSHfp34CxaXn6Lxf6cziK2DDYk=;
	b=IxT82rFDzLhFrwGvo+93bc6txjf8AIOEoHgTZO50t5ZydIpBK9wA1bpCrtEdHw9MfA
	nsMiIKr+RX77BDLTtAhINgELz8JKVwD9uVPa+OYutih35vrJCjRPL6xBTl2BqC9dwEPP
	rUjtnH7zEwB575fyhx4um5/fwZVJsYkUtIUflfJYNKgBJY3pCxEScvORTcbdnv8Uoh2P
	gmTBE1E0cwU3GmINdNHaFJXMrEuJDxMeEXQ5PVKWdR7nkCOk9n3InTUHGHYYEtf14ghI
	Djf2mk/3WrxA+JB+rlXpD3W7YaVxdaYFWlu8cP94T71ametfF1C27HziBMi92riq6b0R
	DoJg==
X-Gm-Message-State: ABuFfoj2OZ1z5z1o8yqPpMN9IFpiGG/teGlkjpyFNKedm+AaoqW33NEp
	oy0mxW4BnjeUnUHVu/rkxvfRWXjg6rA=
X-Received: by 2002:a17:902:43e4:: with SMTP id
	j91-v6mr2162438pld.74.1538579640593; 
	Wed, 03 Oct 2018 08:14:00 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	e19-v6sm3562371pfb.153.2018.10.03.08.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:13:59 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:44 +0700
Message-Id: <1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v1 10/12] target/arm: Add the Cortex-A72
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Feov5oCH1RJm

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the ARM Cortex-A72.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu64.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 800bff7..02e500b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -218,6 +218,64 @@ static void aarch64_a53_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
 }
 
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
+    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
+}
+
 static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
@@ -293,6 +351,7 @@ typedef struct ARMCPUInfo {
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
     { .name = NULL }
 };
-- 
2.7.4

