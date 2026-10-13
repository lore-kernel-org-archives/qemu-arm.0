Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6EDCC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:41:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3d-0007Zh-PF; Tue, 13 Oct 2026 04:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3M-00070N-Rr
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:13 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3I-0007cl-KI
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so17361195e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880796; x=1792485596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=FcrvcwO8TfKKXlj5jfLPNIJA9YWvLSs6kM7SKop1Kq4=;
 b=ujt5PVQkNfTI6SyhYanDDDkRFwjaQAI+vkpjUmqHqRT/0bCgUqWPKUhtGf+EXy+4mP
 t/2HZX8gQ/Srxuij++ZIaP0LEYb2u2uj6hgIpZDJTRGOSGL338LYKPW5zF97U2HMTLQV
 2iggm1d3MfaMGFx5txbLK3XVqCU1s+nl8RukLrRr2yHfeUHIwiAHCmzFjW8ZulISCjnM
 kCjWfJkpbs6t2XGmyu7n1/Ogp+VoZyLI089dP7INBISG8ONU4cs5EYTMwB871uqApcB8
 z52KjZVDRo/7SKIM6WeXtgp49zLCIv+VHpb/mGBiayq1j6nlfaX2PCB9B3T8Wx4+Prkc
 ZuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880796; x=1792485596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=FcrvcwO8TfKKXlj5jfLPNIJA9YWvLSs6kM7SKop1Kq4=;
 b=D/GQgwW81hRGxd6iGEN8J++jFTMMNmk+tVEHTUjKAUvY7hTXRPjewlng2vfhm4X4lu
 tyUbngMPv5g4qhxI2rQ67UlnjRaa1TJxd1HPegHBQscCC9kNbuM8mS7QlB/EPKoCFZ0I
 uU9nXRKz8PIx6VEa+NVnwOtMymaDdmY/AwVK6UpjcsintQ654NLYwppDsNmoFFhLDL8K
 31Nz1812C88V7BXN/UGs5ydjwSPnf51Ntd4NSq2z0j+lgZlvASQ7MBX9lNNiTgxfSjXx
 pgVq2BS9CMAoj/AxgqvOF9kdezEmaf/dHP4UKDs+ucFnxWgQMoN1C6n68LM1RQuZst4z
 f1Dw==
X-Gm-Message-State: AFq9FYLjtmsw4jterkXx9552GtRl2RIfZVYRd11NmOaKG0LIiT3f0pwv
 mBb1bW35TPWSz1AdW+FThFfdILay4r91bcaqGiUX6XO21pMbAxu79OBrl7g/NLwZ//nQHLCLtmY
 YejEw2MY=
X-Gm-Gg: AYBFou0qzI/JvpZSpGL/aOw9pdIJcJMIHry/hZ3uiWw4L1U4JRB+lk2WnQhv5orff8K
 Yec/r6LHtboln/mQka4My5QeFNAOZLWltNt7V0GlpS2r0nPqlVWPm3ktv7GBWstp6Ikvarf1MjJ
 JZT0AAxFye1gzXblFxiC9q2OGY8C9/sEBXyO19qq+i4zcsw6WNigNgPvQJq/E33k3uvFtHuRBWq
 KBNcj7cv95oof8J8dZmpQqZd0d1PKdwKpX2vudxbCtHUdJM4Qcs6DGtpPSUNVUDbB8anOUSV2Ct
 tn0zsCQU7ZAfw+hGzUQv4z2oK8kjLTqBYvTweTqJ+FdFvi14fA+dEHDEipW5U7coRXp63to5mVC
 Nj8DBpG+oZh9VSaik2kimzwyTS6Nznwp+yqa69nLj7q3hxH03anFxWkmsv4lClPXE/SLwkVfJDb
 vC5a1+SgRer9ThSua1J4Zme91Um2yxYt923edsEe9JL/SmUI3l/ZUi2aQcrjpM3FaUvEGWvbpM7
 h8ueAD67ZMlqne/kecv9O1v/AxmDgWffZ2EM56BOEFWt0SKH1AjBxvvrH1GD4h5iXhTiT8NpW0z
 zL8=
X-Received: by 2002:a05:600c:3144:b0:4a0:2423:946 with SMTP id
 5b1f17b1804b1-4a18e48d362mr224435315e9.15.1791880796256; 
 Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/86] target/arm: GICv5 cpuif: Implement ICH_PPI_DVIR<n>_EL2
Date: Tue, 13 Oct 2026 09:38:23 +0100
Message-ID: <20261013083933.1024405-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement ICH_PPI_DVIR<n>_EL2, which is the register that controls
whether pending physical PPIs are directly injected as virtual PPIs
to the virtual interrupt domain.

Bits in this register are RAZ/WI from EL1 and EL2 if the PPI is
not assigned to the current interrupt domain, but since we don't
yet implement EL3 GICv5 support yet all PPIs are always assigned
to the current interrupt domain.

In this commit we just implement the register access to the state;
actual injection of PPIs will be dealt with later. We give the
register a writefn because eventually writing to this will need
to trigger a recalculation of VIRQ/VFIQ.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 287cfa87140..5d3587739d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -599,6 +599,7 @@ typedef struct CPUArchState {
         uint64_t ich_ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_pend[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_enable[GICV5_NUM_PPIS / 64];
+        uint64_t ich_ppi_dvi[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_priority[GICV5_NUM_PPIS / 8];
     } gicv5_cpuif;
 
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index b901e64ef0d..2141f1d8e2c 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -487,6 +487,12 @@ static void gic_ich_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void gic_ich_ppi_dvi_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 /*
  * ICC_APR_EL1 is banked and reads/writes as the version for the
  * current logical interrupt domain.
@@ -961,6 +967,27 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .accessfn = access_gicv5_ich_reg,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_apr_el2),
     },
+    /*
+     * Note that DVIR bits RAZ/WI when the PPI isn't assigned to the
+     * current domain, so we will need to mask them when we implement
+     * EL3 support and ICC_PPI_DOMAINR<n>_EL3
+     */
+    {   .name = "ICH_PPI_DVIR0_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 10, .opc2 = 0,
+        .access = PL2_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0xb40,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_ppi_dvi[0]),
+        .writefn = gic_ich_ppi_dvi_write,
+    },
+    {   .name = "ICH_PPI_DVIR1_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 10, .opc2 = 1,
+        .access = PL2_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0xb48,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_ppi_dvi[1]),
+        .writefn = gic_ich_ppi_dvi_write,
+    },
     {   .name = "ICH_PPI_ENABLER0_EL2", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 10, .opc2 = 2,
         .access = PL2_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
-- 
2.43.0


