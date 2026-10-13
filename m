Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A831ECC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:49:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3v-0008NI-92; Tue, 13 Oct 2026 04:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3V-0007J3-ES
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3R-0007rc-Ed
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so26910365e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880812; x=1792485612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4zMTZd7IrsEt0EnquPhNbZyBoyakwm0X4gRcwyF+QHw=;
 b=rMyKJv6xU46W7RAKBEupIm3obwSCkOftKbBq2Dgg5enz8R8oyGz+NdTxJNFHeTicKE
 dPMIzb0HFD0f7O7TuQHBmfw2zqO0WTPS5YNtXxf35Y083igu7B4WYWB1PU/96clv3yoH
 aX8RHZeXT7TTD3uM/Q9FKBYeIXIuOodUh8dfVFsHjDiNAcaREnQwzmetJfwPQ2jaRSqM
 HOiOckDvHJSywrxZGQNWrzTWxUzaty5Ipybhev+6UpB7zXisAuT98wI6rt1oaiUnZGjS
 JWjZC/etRHiGPyssbpdOK8BLrZaNdbmhbC1eCWEKfIDOmuEyrqqXGnNpvFWDauALp/GJ
 BmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880812; x=1792485612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=4zMTZd7IrsEt0EnquPhNbZyBoyakwm0X4gRcwyF+QHw=;
 b=K3Zt8lbwSH5a6kAzRyDGQCkgIvleuQYnwR+57tZq8FJcCEnX/z4ac/RMIge3asciyT
 nfthm4UTibkkcmKM1sxuRiP4owJjfqQbltR963Ht0bkgXTr30KyJrt5YmwkFMAVq9ApE
 ZS+VNQ9xNf1ZwhWku1ONvOKjsaWj7jKeW0f4YGTg/04paGwE0Upa7KeS5qJowD1+Cy2S
 XwRXq00J3cJ1W0cvQ/EP2fPvby23+jiooZ/XBxOpcQJSpaHZ89RYS9XKEkBkb/IGGNCC
 70UrSckY4S2DYot0TUeng0G10O6vxduvTiGwQziQ09NsxlvieMH8HVfFQlRDqY+ayzvT
 kDdQ==
X-Gm-Message-State: AFq9FYL1PcG9IQMs+jwI3AN0lx7RrWLnCazVC0v1mQ54QhAaA94vacGt
 fwKyeMZdxowkqhGOw+Q3hWyVITOJcwEiPK7GGvmuy90Ld/ATXvxhPfG8Qok3a5HZbmoct5xagvQ
 uzvYvUsI=
X-Gm-Gg: AYBFou3DwFTbRDtuK5de1pXfnIaHfMz6K5Tf67uRXjHgdLIAWNp95jI2NPSDSJBs3nn
 COPLaNd00s4QCtv834KvTg48wPRQcnZAwf/ZVNfw8kmp5J7Fth0nWPKbOOUcsoaz7k97gNGnXcw
 evJD2Kbr/b5rbQvpfGd4P3I0sSE7flipS4o4tq7u/3aey2T0yaOVp9tAr46XdWVzZnN90s1qEjt
 3i8d1zSrYuT0m1Z6aU9uDsx/M7ajrgVpZEvuVUwFZk2TjrQU8R8+6BENaRUymE+kOnxqxVJYiF5
 rac7szHIZh+3APytVw2h17ElABRtpgJ9jwZsddy0wQqBOkEQCNUgwxy8YiMTXgFVe0lsMR9E+hw
 sMs9tc+XluDz1u00vsDylEZvInUsnhg1lTg8QisIPAdfU8+0984WKlz565HGqQ1/OGIe9WP2dSQ
 Tkig3J16z7qdrA7wAtKGpmBnNCENyPRg7uf9sAH0uvHAFuTJBBzh8nFQ4ebmMgHhG7mrijWmw8F
 nGIxbERuoy2lVfPynSen/4Pm7+/xcMCPS3MH8h1gZrIAayy5umZ1c3iwrvqw35LrzaVDkq1MXAa
 gkrihnpYHyc1UA==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id
 5b1f17b1804b1-4a18e48d45cmr248217005e9.16.1791880811970; 
 Tue, 13 Oct 2026 01:40:11 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/86] target/arm: GICv5 cpuif: Implement
 ICV_PPI_ENABLER<n>_EL1
Date: Tue, 13 Oct 2026 09:38:33 +0100
Message-ID: <20261013083933.1024405-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Implement the redirection of ICC_PPI_ENABLER<n>_EL1 to
ICV_PPI_ENABLER<n>_EL1; the data for this is stored in
ICH_PPI_ENABLER<n>_EL2.

For the ICV access we need to honour the "make this RAZ/WI"
config bits in ICH_PPI_HVIR<n>_EL2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 125dcd8cf4d..2c717b99a0b 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -463,11 +463,28 @@ static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gic_recalc_ppi_hppi(env);
 }
 
+static uint64_t gic_ppi_enable_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    if (gicv5_icv_access(env)) {
+        uint64_t r = env->gicv5_cpuif.ich_ppi_enable[ri->opc2 & 1];
+
+        r &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        return r;
+    } else {
+        return raw_read(env, ri);
+    }
+}
+
 static void gic_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    raw_write(env, ri, value);
-    gic_recalc_ppi_hppi(env);
+    if (gicv5_icv_access(env)) {
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        env->gicv5_cpuif.ich_ppi_enable[ri->opc2 & 1] = value;
+    } else {
+        raw_write(env, ri, value);
+        gic_recalc_ppi_hppi(env);
+    }
 }
 
 static void gic_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -998,6 +1015,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_ENABLERN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_enable[0]),
+        .readfn = gic_ppi_enable_read,
         .writefn = gic_ppi_enable_write,
     },
     {   .name = "ICC_PPI_ENABLER1_EL1", .state = ARM_CP_STATE_AA64,
-- 
2.43.0


