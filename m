Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp14439lfc;
        Tue, 25 Aug 2020 09:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvfdG2OZDWju7fK/FJVNxeTkTqCSHVtS9CIt9LoRneooF9nQEDkJ+ppjXrrlSinOeRr3/5
X-Received: by 2002:a25:ab0d:: with SMTP id u13mr16578691ybi.248.1598374352839;
        Tue, 25 Aug 2020 09:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598374352; cv=none;
        d=google.com; s=arc-20160816;
        b=pNJYM0+lz3UHp0Ucrj8ybvdkYSJViKnB/PgtUKedyxLmFWKd+3KWOYJTJhcQHLNFYH
         deYkAbzGNkRxsM3zHpnKejVbatRywO063MLBIBBT3iBTXRtPdS8G3zao9Pp/VXTOpJv2
         BKLgtfd4iXbRvGZsIg4mRjJHGm9iN08vptwDmERrfHxcCOfYzU9g+xGMpaiHwuqt2W2J
         5Bw7+bZakUNLTzv17Xpkn+4j/Vrl+YXgAhIMyZpU3ziJrdKwIxqG9PofGL47uVqqs/zs
         QbYqhFbjbMJ0zwBfr66pf3FGosu04nueXwE4V7/ulBVPCpjVXB+XP4suWGgqkf956CY4
         LdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=fIVyrpVHMw6tNd0qd5YUw4P9aigzbhlX4LJYiIphK6A=;
        b=glzQlDpophcBQk64DtzlN6vAW7ODTwlqoNzmhDbQZXHes13XRuZkvnq9OftCX5T9mG
         kU7cLh7Kr5vYcVxSymxJ6vJeE+LNoXzH/fp6tzuJ9NTFgrB2SoEQATCEy++hPBYBYg5G
         btPM99OCVgmUJihUKdJZvrxWf/cgybX2tag2SISCVMshMU3Xl9C2NJldYKKo47VjNhd1
         KaWpYVECcb85RK25HsSyG3vDTC3QXiV8ELpNS55R1bkuLW5iFaU/TcE+FII1CLhmqZHn
         dZm4AJZwQAnUre5nBQsEDQSYkYAMC6WZhXNkErSPTfyGHew7VWKxoAjuX57AZaGqQB76
         TeJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Nl+O7UlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si15970214ybd.119.2020.08.25.09.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 09:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Nl+O7UlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAcBU-0008Ko-90
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 12:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kAcBM-0008H8-4v
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 12:52:24 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kAcBJ-0003V7-NL
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 12:52:23 -0400
Received: by mail-wr1-x444.google.com with SMTP id p17so7782318wrj.8
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIVyrpVHMw6tNd0qd5YUw4P9aigzbhlX4LJYiIphK6A=;
 b=Nl+O7UlR0KSc9w/ZPf//XlYBzkvkzudcCbX0bJx7ZgY/uc6DnGZVoLEG2U3eV7HrmV
 50q6jDUKtMae+2lRRm6rTxDee2DYLGpL/6GyHObdoYjAiiK6IQr1B8+eK65+ctvKFSeg
 rJCtRRb5wym/O5a82S78/yBZObYNUSd5NIYhweDAdQBrZh61AkItUOX4Ta5/OU3iBDjA
 JLOm+rmV+FMiXDEXjFHKS2Aa5IY+rf1fLHBEQe8cpSW94HFw6NrXusZo2mtBkYSedopy
 5fh6Gh8Rzi0riiAipO97XRkRHWPlCTfddCJUZIC3yVt8H0hh+GOapsi1QmDiPW/yDvUf
 7gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIVyrpVHMw6tNd0qd5YUw4P9aigzbhlX4LJYiIphK6A=;
 b=f3+QiZz4saU1RvjWi68G8IkqprF+UoQam+0kwSEtf553bCp9X+3mgVCLEnzevWtZWL
 Fb2D2PGADo7z98zKvyRCrvVg5CQ+Ih76ni10fynp05420LHSsYKerKWZ584WSyxamPeE
 0iHOaRjzYiKXmO5goxqu76ZpVfMiey7Odrp0q/uCsnr0YK7sHb0IRxtdWxhTGzVNexl4
 17yMMJo4y20Dq85/DSZWWEwCD2NuSj7ipsQARLUFMFlC5tOFui3yo4CXXlat0mvTOhUf
 t1ukwBXvYE5C+I9WsbdZ3dJAzdMKXoazLIGSMjRlr1Bg24bzEOKFMN8gGEHUICJhACy7
 2WaQ==
X-Gm-Message-State: AOAM530kSZSdxj2h6R1ftLeZ8VTajnBXix/El4z3BIWorddXAb23dAPh
 bTwmmU1NGERr19CcmQQTgkGXtmcnzih2oYG9nHAzAwIivns8+7AiDrTeaD4eRpmbZu4zSAGOz9R
 hjHET+eJdP+g+8FR+xhKGdhOxSHhAl4nNF8hACxsXIhaS2E7NK9zr9tixe9mxt58xYRI=
X-Received: by 2002:adf:80cb:: with SMTP id 69mr12191966wrl.313.1598374339637; 
 Tue, 25 Aug 2020 09:52:19 -0700 (PDT)
Received: from vanye.hemma.eciton.net
 (cpc92302-cmbg19-2-0-cust304.5-4.cable.virginm.net. [82.1.209.49])
 by smtp.gmail.com with ESMTPSA id v9sm20281870wru.37.2020.08.25.09.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:52:18 -0700 (PDT)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/sbsa-ref: add "reg" property to DT cpu nodes
Date: Tue, 25 Aug 2020 17:52:17 +0100
Message-Id: <20200825165217.7379-1-leif@nuviainc.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Radoslaw Biernacki <rad@semihalf.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XP64TwrXYCO

The sbsa-ref platform uses a minimal device tree to pass amount of memory
as well as number of cpus to the firmware. However, when dumping that
minimal dtb (with -M sbsa-virt,dumpdtb=<file>), the resulting blob
generates a warning when decompiled by dtc due to lack of reg property.

Add a simple reg property per cpu, representing a 64-bit MPIDR_EL1.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f030a416fd..167c57a08b 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -183,7 +183,22 @@ static void create_fdt(SBSAMachineState *sms)
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
@@ -191,6 +206,7 @@ static void create_fdt(SBSAMachineState *sms)
         CPUState *cs = CPU(armcpu);
 
         qemu_fdt_add_subnode(sms->fdt, nodename);
+        qemu_fdt_setprop_u64(sms->fdt, nodename, "reg", cpu);
 
         if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
             qemu_fdt_setprop_cell(sms->fdt, nodename, "numa-node-id",
-- 
2.20.1

