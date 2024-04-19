Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2405471ejd;
        Fri, 19 Apr 2024 06:42:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNeJYugDfIOlaNxbd6D5jFsUYYbaCAzROXRpjmI+9OLTTYnz5ROEEdxqtWcdbOpfzRI/JmKdMTdrTn1Y9740ogJytfzkKF
X-Google-Smtp-Source: AGHT+IGSs9UipueZwKw+xj6nfKlGDtyc6RLX/b/zaGFz8Rud9TIZ85Jl1o+PJeL3wywKghW6tjKI
X-Received: by 2002:a05:6214:a6b:b0:6a0:50ca:7347 with SMTP id ef11-20020a0562140a6b00b006a050ca7347mr3486212qvb.31.1713534155601;
        Fri, 19 Apr 2024 06:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713534155; cv=none;
        d=google.com; s=arc-20160816;
        b=BVZFlAWLm6edwSDgXTv30s1Dx4tBGR9kzSxs+N3Z1VQeBAE2UtGDZkWWcSHuSAJ10I
         WliFKogFUYF31nPXNp5+GLfPxSgDxpUPc67YqHKu2xR7y6eV+7JxebYyRAOJ5XIp0XqA
         6sGbdryfA5W/zTr/2zKSvtXuVJiTglRVcsP2uKmZ82roM+QcpUcCo3NbGJxmc/U0TK7k
         eCYPACdZY1ms+xwhY/3nOFz82u6LXYwkmPEt94Ej7nFX/L0IsOMIOgyZ5JSwQrqxmj/P
         /2VNXX34iQjT+uWqlhlBoW+zOFbfqd2jC6yvex0h86f5wwY3lFgLv72Wtwc3QLRZLvVX
         Emew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oy0myZolFHjohcbr3xwrONm5HW5/I5fGMRWgJnRDNAM=;
        fh=mLkj3vG2/w+l42jAgIJcHpa/IcHwdT2vPSvr6KVaKbE=;
        b=UdcvRwCApebdBwpBKL1Gb8RfMWH7Z47kfUn1kc8+XgrAK4zk5OXh47MnH1+pVj2JAJ
         jZHP+KTSIk7bp5QMUAVOr9rAxF85nxRklJ/EstNLcmDdoUBhoy+wgdCaW4/N+X0vLD3q
         Hywie0V4PewXTSd2eK1GmMol1OvPytwO9tbQ38UwH9+oZjfn5qQTb8mlJ4a8+SFoJGN+
         SxrCK4mfgoNpOfjxvn+9/A0Tw2xPG6010EDez2uCK+uaoXo1EL8cWz++/Eg56XbUXlnr
         nJ6k6Hfk30r4qSs/6VQvfY3lN8tuGuG/gentjxOGlG6aiZoG7mlBsRIAWUUxGFgSSrfq
         iXGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DlmDGpYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf1-20020a0562140e8100b00695d4a4fbfasi3958900qvb.53.2024.04.19.06.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 06:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DlmDGpYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxoVA-0008Ue-6U; Fri, 19 Apr 2024 09:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxoV7-0008U6-OH
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 09:42:01 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxoV5-00086Q-3D
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 09:42:01 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so27726221fa.3
 for <qemu-arm@nongnu.org>; Fri, 19 Apr 2024 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713534115; x=1714138915; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oy0myZolFHjohcbr3xwrONm5HW5/I5fGMRWgJnRDNAM=;
 b=DlmDGpYXFvMo/RncRckvX37LNFIOFALnMahG7rfVncfUc8w1PakgJN1r5K1JzE7Muy
 x1/pvvX9QFZXPz7BGnDC+4cE+06pFPJW6rWuhFntJM94Q11RCUeZhOTOJrQ6FFB8N77x
 fiTwO4Jtg2UTkdKkgsUIiP7ysyg8HmjKxxrDCSfnKnPi5uY9Io0BdME1sB2hecMiZcrP
 PBCC7ebLhkLAEiUPqXxBryQyYEXapYEvvcJT4PPCS4Dpuad7kZseHtw8TXu9pBIA3O+E
 q0OcuAFyPVXDNpMu92uooPA1HmLm3hfIJRISP6zk3wBfU+K05lW02Y2ewewPiaYN9F9m
 UVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713534115; x=1714138915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oy0myZolFHjohcbr3xwrONm5HW5/I5fGMRWgJnRDNAM=;
 b=Rpbj+SJCfAEvcRj5F2qL5M/4OSJ7I9JghfxOuFAFZLREwR8NZmlbgAqc6wa27t5F9R
 HA+kTDEwFoeNtYUVVYwwd2hUNe8iyLsAqw2Leh4Nw9MBGQyLx1yYKtdzacBT0rl5KOeD
 wocN1XU6cJQPjEt3nzszHtMkjZJlduGLe6jaf6adUixdAJnb++K2yLv1fuarfacJNXky
 f3EoZ5WFSSXxsGZQE9dCUQvfeAszKbcWhRxsaW0zK7jAa80nuI+h9VdlpjneQFi53Dt+
 y4tUz6mE0iGunLEDk277Yc+giPwOTdFINsFPbRWetyDqBjsxE2CAB64nLweZvDpnq7vp
 +fqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+RGtLOpl/x6sND5evc+YGJqLPQ9NQCt6Z4SE4eRgmq86nRM5PVR03MfSwfIXues7O6EMnModAQ0kVusqoAPs/+nOv
X-Gm-Message-State: AOJu0Yzh0fLwFWe6aNxVxjaJiR4sHhQ1M63J5Gqa9/KpR9rLUT1iidtK
 DfOM33D0HweMFI142ql2s0mAyV4D3qa2Lxh1ZbkGYDu8O4F9ym8vzPXkNvM+1Zvecgesj3jzoOJ
 rbDvcCrG0Ls66J8xKgktqDg1c2M89P2YhhjZK0Q==
X-Received: by 2002:a05:6512:3d20:b0:516:d4c2:53eb with SMTP id
 d32-20020a0565123d2000b00516d4c253ebmr2381628lfv.58.1713534114967; Fri, 19
 Apr 2024 06:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Apr 2024 14:41:43 +0100
Message-ID: <CAFEAcA9Y02am4wfb8Ct9qz7YX_maH4VD+JD+FFc18dBg5+hv7w@mail.gmail.com>
Subject: Re: [PATCH v13 00/24] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i6+EN2Sesbh8

On Sun, 7 Apr 2024 at 09:19, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for ARMv8. These
> introduce support for a new category of interrupts in the architecture
> which we can use to provide NMI like functionality.

I had one last loose end I wanted to tidy up, and I got round
to working through reading the spec about it today. This is
the question of what the "is NMI enabled?" test should be
in the code in arm_gicv3_cpuif.c.

The spec wording isn't always super clear, but there are several
things here:

 * FEAT_NMI : the changes to the CPU proper which implement
   superpriority for IRQ and FIQ, PSTATE.ALLINT, etc etc.
 * FEAT_GICv3_NMI : the changes to the CPU interface for
   GICv3 NMI handling. Any CPU with FEAT_NMI and FEAT_GICv3
   must have this.
 * NMI support in the IRI (Interrupt Routing Infrastructure,
   i.e. all the bits of the GIC that aren't the cpuif; the
   distributor and redistributors). Table 3-1 in the GIC spec
   says that you can have an IRI without NMI support connected
   to a CPU which does have NMI support. This is what the ID
   register bit GICD_TYPER.NMI reports.

At the moment this patchset conflates FEAT_GICv3_NMI and
the NMI support in the IRI. The effect of this is that we
allow a machine model to create a CPU with FEAT_NMI but
without FEAT_GICv3_NMI in the cpuif, and we don't allow
a setup where the CPU and cpuif have NMI support but the
IRI does not. (This will actually happen with this patchset
with the sbsa-ref machine and -cpu max, because we haven't
(yet) made sbsa-ref enable NMI in the GIC device when the
CPU has NMI support.)

For a Linux guest this doesn't make much difference, because
Linux will only enable NMI support if it finds it in both
the IRI and the CPU, but I think it would be better to
get the enable-tests right as these can be awkward to change
after the fact in a backwards-compatible way.

I think this is easy to fix -- we can add a new bool field
GICv3CPUState::nmi_support which we initialize in
gicv3_init_cpuif() if the CPU has FEAT_NMI, and make the
checks in arm_gicv3_cpuif.c check cs->nmi_support instead
of cs->gic->nmi_support. That looks like this squashed into
patch 18:

diff --git a/include/hw/intc/arm_gicv3_common.h
b/include/hw/intc/arm_gicv3_common.h
index 88533749ebb..cd09bee3bc4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -225,6 +225,13 @@ struct GICv3CPUState {

     /* This is temporary working state, to avoid a malloc in gicv3_update() */
     bool seenbetter;
+
+    /*
+     * Whether the CPU interface has NMI support (FEAT_GICv3_NMI). The
+     * CPU interface may support NMIs even when the GIC proper (what the
+     * spec calls the IRI; the redistributors and distributor) does not.
+     */
+    bool nmi_support;
 };

 /*
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 2457b7bca23..715909d0f7d 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "cpu.h"
 #include "target/arm/cpregs.h"
+#include "target/arm/cpu-features.h"
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"

@@ -839,7 +840,7 @@ static int icc_highest_active_prio(GICv3CPUState *cs)
      */
     int i;

-    if (cs->gic->nmi_support) {
+    if (cs->nmi_support) {
         /*
          * If an NMI is active this takes precedence over anything else
          * for priority purposes; the NMI bit is only in the AP1R0 bit.
@@ -1285,7 +1286,7 @@ static void icc_drop_prio(GICv3CPUState *cs, int grp)
             continue;
         }

-        if (i == 0 && cs->gic->nmi_support && (*papr & ICC_AP1R_EL1_NMI)) {
+        if (i == 0 && cs->nmi_support && (*papr & ICC_AP1R_EL1_NMI)) {
             *papr &= (~ICC_AP1R_EL1_NMI);
             break;
         }
@@ -1324,7 +1325,7 @@ static int icc_highest_active_group(GICv3CPUState *cs)
      */
     int i;

-    if (cs->gic->nmi_support) {
+    if (cs->nmi_support) {
         if (cs->icc_apr[GICV3_G1][0] & ICC_AP1R_EL1_NMI) {
             return GICV3_G1;
         }
@@ -1787,7 +1788,7 @@ static void icc_ap_write(CPUARMState *env, const
ARMCPRegInfo *ri,
         return;
     }

-    if (cs->gic->nmi_support) {
+    if (cs->nmi_support) {
         cs->icc_apr[grp][regno] = value & (0xFFFFFFFFU | ICC_AP1R_EL1_NMI);
     } else {
         cs->icc_apr[grp][regno] = value & 0xFFFFFFFFU;
@@ -1901,7 +1902,7 @@ static uint64_t icc_rpr_read(CPUARMState *env,
const ARMCPRegInfo *ri)
         }
     }

-    if (cs->gic->nmi_support) {
+    if (cs->nmi_support) {
         /* NMI info is reported in the high bits of RPR */
         if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
             if (cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI) {
@@ -2961,7 +2962,16 @@ void gicv3_init_cpuif(GICv3State *s)
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);

-        if (s->nmi_support) {
+        /*
+         * If the CPU implements FEAT_NMI and FEAT_GICv3 it must also
+         * implement FEAT_GICv3_NMI, which is the CPU interface part
+         * of NMI support. This is distinct from whether the GIC proper
+         * (redistributors and distributor) have NMI support. In QEMU
+         * that is a property of the GIC device in s->nmi_support;
+         * cs->nmi_support indicates the CPU interface's support.
+         */
+        if (cpu_isar_feature(aa64_nmi, cpu)) {
+            cs->nmi_support = true;
             define_arm_cp_regs(cpu, gicv3_cpuif_gicv3_nmi_reginfo);
         }

plus this squashed into patch 19:

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 20a8e1f2fe4..b1f6c16ffef 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -566,7 +566,7 @@ static void icv_ap_write(CPUARMState *env, const
ARMCPRegInfo *ri,

     trace_gicv3_icv_ap_write(ri->crm & 1, regno,
gicv3_redist_affid(cs), value);

-    if (cs->gic->nmi_support) {
+    if (cs->nmi_support) {
         cs->ich_apr[grp][regno] = value & (0xFFFFFFFFU | ICV_AP1R_EL1_NMI);
     } else {
         cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
@@ -1510,7 +1510,7 @@ static int icv_drop_prio(GICv3CPUState *cs, bool *nmi)
             continue;
         }

-        if (i == 0 && cs->gic->nmi_support && (*papr1 & ICV_AP1R_EL1_NMI)) {
+        if (i == 0 && cs->nmi_support && (*papr1 & ICV_AP1R_EL1_NMI)) {
             *papr1 &= (~ICV_AP1R_EL1_NMI);
             *nmi = true;
             return 0xff;
@@ -2699,7 +2699,7 @@ static void ich_ap_write(CPUARMState *env, const
ARMCPRegInfo *ri,

     trace_gicv3_ich_ap_write(ri->crm & 1, regno,
gicv3_redist_affid(cs), value);

-    if (cs->gic->nmi_support) {
+    if (cs->nmi_support) {
         cs->ich_apr[grp][regno] = value & (0xFFFFFFFFU | ICV_AP1R_EL1_NMI);
     } else {
         cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
@@ -2821,7 +2821,7 @@ static void ich_lr_write(CPUARMState *env, const
ARMCPRegInfo *ri,
     }

     /* Enforce RES0 bit in NMI field when FEAT_GICv3_NMI is not implemented */
-    if (!cs->gic->nmi_support) {
+    if (!cs->nmi_support) {
         value &= ~ICH_LR_EL2_NMI;
     }

The comments and commit message for patch 24 also need tweaking,
because they are written assuming that FEAT_GICv3_NMI means
"NMI support in the GIC proper", not "NMI support in the cpuif".

Since those changes are not too complicated, and I made them
locally anyway since I wanted to confirm that my plan was
workable, my proposal is that I will apply these fixes while
I take this series into target-arm.next for 9.1.

So I've applied this series to target-arm.next with the above
changes (preparatory to doing a pull request tail end of next
week once we release 9.0). Let me know if you'd prefer something
else.

thanks
-- PMM
