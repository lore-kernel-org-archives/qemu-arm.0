Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp529524lfc;
        Thu, 27 Aug 2020 05:45:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzsZ20/mxyom2/E0oGJViWAsEpdDhp+guiWDccIBfq+gpj71iU0Udf6/VNuRQSmXm6wjQr
X-Received: by 2002:a25:84cd:: with SMTP id x13mr27648100ybm.425.1598532339817;
        Thu, 27 Aug 2020 05:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598532339; cv=none;
        d=google.com; s=arc-20160816;
        b=wmAwLAoaMlem/1AwsMbM+mbF6F6toWI07Jn7Z6UR5lKNVYzFmwrzV7SWZufclVEeOg
         JSLoXVoLI+WfYRThWoeV2frY1RF31O4AiJvFnwrAwItDSkuLB7lCOuOVpSokbkOOLe82
         vZk5qbNWMfdmPFawPjlo7r1IQYQu/lExRHJUxfGn+6+Zhc8iMSR2otPeFTdlbo4OerHg
         NrU/W8KNs7PrcsZv+bEtT/3mEN868eCoP3myGvkTU76HTgvBzuGzGTpNEw1Yeq0nEMga
         FqdYpsF1rfzoEsFGhVZePw48wil9gelqoKSSX71WjkgyNpktpXSribUHlDHB6mfHxuHd
         FQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PeTro//U+ItdJy/4VEWKF3xKEFMPV5pkE6n1z5mnbVE=;
        b=T7NCsnV5InB5eT8SPlJVYFrWEnfC1EVJfEhfBRL8Jr3K+ijFwesgGTemg3egq0Tix0
         da9rNtYyo2YYi40KcD+EYkX8ELiiRBjPrx8icRb4s/SE/A9ZtXpwSsbEu6AQMish/SOI
         3uD9dgZpbJoeJ+UjxD0m/zSUGqpMvfJJaiseA9XkxuDpdpuh4+9b807RYGGLCxJAW1Mc
         vqPPFtN4NKXvxHmjU55dnjJVrS8yrUJdG7g9VKvOsbQemR1QqylFFU95q2I7IkExAamW
         A42+gE64P6/VcWYE2TdDi0fnskObIFRIlYkDbCwS+5+oHDURmbyTk3SCwq+/s1pab89G
         8yeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=hV97SJc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si2084524ybg.257.2020.08.27.05.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 05:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=hV97SJc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBHHf-0003Kn-1V
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 08:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kBHFn-0000l5-Jp
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 08:43:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kBHFl-0006ov-7M
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 08:43:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id l7so1423304wrx.8
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2020 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeTro//U+ItdJy/4VEWKF3xKEFMPV5pkE6n1z5mnbVE=;
 b=hV97SJc9WGYDc4jLr0S3i3IIbkI3t8pg4F8eAtcbiRx7Ceb8jqifJ3bjAG4vQh3HIw
 0wqx73nA9bzP+VPbEQ0IJQ36lBGs5x+HROQvyNiE9Xv0j9FZj4fAqF/LrFb79yXFXs0I
 BpB1rbK6kJJqt6ve+cnSFqwQOF/FExZiV6FIPFqVkVNZ/PXg8dvfSo6xVe4XzLL4WkXy
 KgBubXULaetxU2Bd7QXMgdv2m3r2nYFHg5kLqDmz5FBlwFvk0e1w6+3z90lQc1Snn5gv
 XIyOB9Kq/74uCaGLvYNG/swmm3+KqUXZ3m0UaCp451t+Km/VvRgDXguDQ2cOK7EGhnVL
 Qk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeTro//U+ItdJy/4VEWKF3xKEFMPV5pkE6n1z5mnbVE=;
 b=h4Mn9QsMHY3yhMA8vY4/d/+x7H7WiFPCIEXLpgCt5zxEDuaBjwyv6iDlNYYa0xHSQ2
 r6rtpp5iThD/D0Xt5caqhB4XNtHfT4Di8VVOxb8WWSrn9QXRVTuffbQRjNJQH/Y9jZ42
 sAg5eLgD5lq8yp08QsAJbfRXMLVWlK0LPOyN+nWQDS/+YhVrnCXjmDYcRT4uxMI7AH70
 5OYSxmJAled2eJjuteo2DH4+Iyf1X5eRAU2CufOEPfOrDIKcSmffxl1YE+WG6+nW1CKw
 G0x71NdsZatiWVbQKJ3UAIB9TPd1nS1OKtNXNlcOvB3q3svFYIZchinrNlLdWKp9yTDT
 AvqQ==
X-Gm-Message-State: AOAM531N/g3GzWWi8WDfSIox9CV1JjsZhg1fXQ0P8B0e8w92ixTuymqB
 VJoNlizXcatLjXf+eshniBLfk74qWZQVJxk1Wd0l3FsVgdX3955uEHzHSr9Q/GE8u6CCk90L0o3
 alhYtvRwzrw9clQyTxnwZKyUbaGIKtyujUpWvguPk78eboBX2Es1+5/ItaruPYk0RDXk=
X-Received: by 2002:adf:db43:: with SMTP id f3mr21876595wrj.219.1598532216872; 
 Thu, 27 Aug 2020 05:43:36 -0700 (PDT)
Received: from vanye.hemma.eciton.net
 (cpc92302-cmbg19-2-0-cust304.5-4.cable.virginm.net. [82.1.209.49])
 by smtp.gmail.com with ESMTPSA id c205sm3889262wmd.33.2020.08.27.05.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 05:43:36 -0700 (PDT)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2] hw/arm/sbsa-ref: add "reg" property to DT cpu nodes
Date: Thu, 27 Aug 2020 13:43:35 +0100
Message-Id: <20200827124335.30586-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Graeme Gregory <graeme@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Tanmay Jagdale <tanmay.jagdale@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKaLXDd6YK4W

The sbsa-ref platform uses a minimal device tree to pass amount of memory
as well as number of cpus to the firmware. However, when dumping that
minimal dtb (with -M sbsa-virt,dumpdtb=<file>), the resulting blob
generates a warning when decompiled by dtc due to lack of reg property.

Add a simple reg property per cpu, representing a 64-bit MPIDR_EL1.

This also ends up being cleaner than having the firmware calculating its
own IDs for generating APCI.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---

As per Graeme's feedback, properly represent the MPIDR topology info
in the reg property rather than just counting cores (and update the
commit message on why this is useful).
I'm using the local helper function sbsa_ref_cpu_mp_affinity() for this,
and moving it up somewhat rather than adding a forward declaration.

 hw/arm/sbsa-ref.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f030a416fd..3e65ded9a0 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -138,6 +138,12 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_EHCI] = 11,
 };
 
+static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
+{
+    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
+    return arm_cpu_mp_affinity(idx, clustersz);
+}
+
 /*
  * Firmware on this machine only uses ACPI table to load OS, these limited
  * device tree nodes are just to let firmware know the info which varies from
@@ -183,14 +189,31 @@ static void create_fdt(SBSAMachineState *sms)
         g_free(matrix);
     }
 
+    /*
+     * From Documentation/devicetree/bindings/arm/cpus.yaml
+     *  On ARM v8 64-bit systems this property is required
+     *    and matches the MPIDR_EL1 register affinity bits.
+     *
+     *    * If cpus node's #address-cells property is set to 2
+     *
+     *      The first reg cell bits [7:0] must be set to
+     *      bits [39:32] of MPIDR_EL1.
+     *
+     *      The second reg cell bits [23:0] must be set to
+     *      bits [23:0] of MPIDR_EL1.
+     */
     qemu_fdt_add_subnode(sms->fdt, "/cpus");
+    qemu_fdt_setprop_cell(sms->fdt, "/cpus", "#address-cells", 2);
+    qemu_fdt_setprop_cell(sms->fdt, "/cpus", "#size-cells", 0x0);
 
     for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
         CPUState *cs = CPU(armcpu);
+        uint64_t mpidr = sbsa_ref_cpu_mp_affinity(sms, cpu);
 
         qemu_fdt_add_subnode(sms->fdt, nodename);
+        qemu_fdt_setprop_u64(sms->fdt, nodename, "reg", mpidr);
 
         if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
             qemu_fdt_setprop_cell(sms->fdt, nodename, "numa-node-id",
@@ -717,12 +740,6 @@ static void sbsa_ref_init(MachineState *machine)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &sms->bootinfo);
 }
 
-static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
-{
-    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
-    return arm_cpu_mp_affinity(idx, clustersz);
-}
-
 static const CPUArchIdList *sbsa_ref_possible_cpu_arch_ids(MachineState *ms)
 {
     unsigned int max_cpus = ms->smp.max_cpus;
-- 
2.20.1

