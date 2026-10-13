Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8030FCC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3i-0007nN-J1; Tue, 13 Oct 2026 04:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3P-00071m-VT
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3K-0007cX-GD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:09 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso30870825e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880795; x=1792485595; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=egeU1Fljgl1j52jTMJ1XUl/uSLAULc4z+LFi4aErDLw=;
 b=iCkh7xPHpLVZrFw3JtHI8FU0aCNyMo6M/KjxmRX5TxS7HN7GcHiv9s/C+oq/fuoZqd
 ow1RI4/IyQZmd4w/cMTnG4wJt8txLE2W1uarayRF9nb0rVcWd/iGabdGbwnIgNV6b26V
 ATxo2Erx2m9L2F8Kdja4+a7a4XAyellSF3bxYHg1Pfk5B+gNuA7drMZIWTeY+Vo4Trk4
 EhMkixa1Ig0lwCVoDNZoTjoe9czCgg8orCMwju7ZMbBvUxJnyzUnsb6OEQLn1O4XjuGU
 H94Pp6zf7Dsm/LMmuDHEJHSKkxbxA/f3tO7RZbq0hSA29qxJkn292KqEP9jhI/HvV/f4
 7zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880795; x=1792485595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=egeU1Fljgl1j52jTMJ1XUl/uSLAULc4z+LFi4aErDLw=;
 b=cSSguxOsKiqIDx7q1YFKC+ocPbDq98TLlN3H/N6XVqJDuNAZq6L7VLhDhxV4AybyLV
 C7w8BuvdI0FcEc27+S7wig3qHLyvu5a5CPgh9w9CytLBrMnGsm6w5fKFBmvnCHukiBR2
 5LKVSr1bfu6ILqhdKFwU4URc1jpGiXnPQeeyoDFCHGUUfKNreYgv1oFjeyBxA0FStD0N
 6o9qCZ1P00iZfVm37CcqqN/sjIrEMhSAquC3xgg6iffzpA1Ask0/oOr5Yz3R6geYbMwj
 EY693UaMureyKlPuFt1pK28X0pHEKOaANVxSI+IgHvZ4pMVbg7o8J2ZsEslAeIIYEukb
 Ce3Q==
X-Gm-Message-State: AFq9FYJfz7Vi1CnGGCdzg1uNvH3NclEJv8lxr9QaU6ZE8UC3FwZNeYrE
 sAH0RsK/OhmyWMHRHvJNolaeD5bgF7Atf/k2EtsxSduFSQPiuW8O2ddwid2MPkDvYt/pVr8bhJD
 fYKHTEJw=
X-Gm-Gg: AYBFou2zOcauG1h5wKhaGTbLK4n55zZvqJGhNgWD2THsM3fJjmdSz6uAFBeJc3jB5iH
 +ghwnE8IQBSvV/9a2B6X4fDbCcpE53ex3p9cSo9nOFgS/KxDqNW7T3B+11Sdo1cPmpK1ti/3mfH
 llZqGB+pfNJ2GGuVfBEAuH/WKDV85bUNWf+qklPBo7SvImJa++6MCOWJOwI/G6APPiRNKseN1NU
 arMNyEX0AO51k9WKY3fwJm5B/RSh2mm8eept118h+6TL3mBoXXoS7tesyd369rU4qACb0tuU7Pv
 vqA/ASq/vgWxNky9xXu6kgh9EwG7p6mkZvafBNuA/nhkearJURXVKiQAAbjBHYcYcW0SBxKTFDz
 Ygc6C7zAsvjF4RDwAKT6IWQnLvMdP0nBQ7gn9tTgNyFSIi3vmkjVxWcH9HSEDZ0Mn9HQntv2w97
 vaUIkMvQpKGzLZvpIDC7ELuV2SiFpB7yhCAY+2ExJREuIi7s85Cf7VK8yBghrhbkJnmcusuW4C7
 D3VxipEkSML/ezFd6L30X2TMJiTcg2ZupjtesC41qGKeGHX/h2Ut95c4PKPMQG0VlZdBn/V0esA
 NdU=
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id
 5b1f17b1804b1-4a18e44363dmr226192455e9.3.1791880795278; 
 Tue, 13 Oct 2026 01:39:55 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/86] target/arm: GICv5 cpuif: Implement
 ICH_PPI_PRIORITYR<n>_EL2
Date: Tue, 13 Oct 2026 09:38:22 +0100
Message-ID: <20261013083933.1024405-16-peter.maydell@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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

Implement the ICH_PPI_PRIORITYR<n>_EL2 registers, which are the
hypervisor's interface to its guest's PPI priority register state.
As with ICC_PPI_PRIORITY<n>_EL1, we define these programmatically to
avoid listing out 16 near-identical cpreg definitions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 62262c594d7..287cfa87140 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -599,6 +599,7 @@ typedef struct CPUArchState {
         uint64_t ich_ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_pend[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_enable[GICV5_NUM_PPIS / 64];
+        uint64_t ich_ppi_priority[GICV5_NUM_PPIS / 8];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 6dec0ec1ea6..b901e64ef0d 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -481,6 +481,12 @@ static void gic_ich_ppi_active_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void gic_ich_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 /*
  * ICC_APR_EL1 is banked and reads/writes as the version for the
  * current logical interrupt domain.
@@ -1024,5 +1030,20 @@ void define_gicv5_cpuif_regs(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &ppi_prio);
         }
+        /* Similarly for ICH_PPI_PRIORITYR<n>_EL2 */
+        for (int i = 0; i < 16; i++) {
+            g_autofree char *name = g_strdup_printf("ICH_PPI_PRIORITYR%d_EL2", i);
+            ARMCPRegInfo ppi_prio = {
+                .name = name, .state = ARM_CP_STATE_AA64,
+                .opc0 = 3, .opc1 = 4, .crn = 12,
+                .crm = 14 + (i >> 3), .opc2 = i & 7,
+                .access = PL2_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+                .nv2_redirect_offset = 0xb80 + (8 * i),
+                .accessfn = access_gicv5_ich_reg,
+                .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_ppi_priority[i]),
+                .writefn = gic_ich_ppi_priority_write,
+            };
+            define_one_arm_cp_reg(cpu, &ppi_prio);
+        }
     }
 }
-- 
2.43.0


