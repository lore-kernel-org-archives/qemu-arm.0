Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C36C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:39:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZG1P-0007c6-Ia; Tue, 08 Jul 2025 17:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZFHJ-0002UL-2C
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 16:51:01 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZFHG-0003er-Uk
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 16:51:00 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-32b3b250621so44607631fa.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 13:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752007857; x=1752612657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gt2m6Pn6JVQPqk/mSrP0CK0ENC9R9D3MSBFUWpA9k1g=;
 b=Q4hlUCrgYWvpWJAf8LCAir+Xva9J0tPJHHNnC9HMNd6pUIdWwyFtSMuj5PXs8h3enj
 hd2VnRfPgUQ9lSvyC7PCShLF++ocTqO+N35h3IvPbObw1ylu2gRS60FQHmhIka8fRjSZ
 EU3t1v8HQEn5m6UKcVgk5/3SacmSvnSov/Tpd1PScB2Jg8+kFob2gqahmhlm9PXV9lfF
 vuVnluRql47ZBQQBbaLT/IkrQ6/db4k3Bv5B1C6ZeOhqFTm8jipQywIIIreNZAVYwiSI
 t3gIR/+JsJbWZH5FOgtHMvMyeLd4hpiJoxLNF4ppVKlHrQGMbgaB2XT1d0Ydkom19NIS
 yHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752007857; x=1752612657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gt2m6Pn6JVQPqk/mSrP0CK0ENC9R9D3MSBFUWpA9k1g=;
 b=XLrf/8SMCtQfVcDRPHztg6SEpF7RZsYH5RXdn6v1ftF3DxvOln2WHYWNkecj6uBThR
 ZW5sSRai+t8npCGRk4HxZ1MqeFWjNoqDuObEC4Sbn2hQChcABR6gq4gZ0FT8P2shoSJO
 ekzTlIgRNQqLUIl1/Rgu0+RureZQcDQzKYdiuVIF3do8indcibsbNNYHu1Q21tOfTH0n
 c6j8sKGLtMLpSmdSROyBrTnCMq4c+FGR090rVYLDF11e4eRjt7d6TJ/oJYc7lojbeRtx
 6z4gOKaBwEGZCCNRVlMFVxqidzq6qD+tM4ocGK8GfOFcWrjGQkPou+/hKLK95GrmtABP
 WuLA==
X-Gm-Message-State: AOJu0YxNzFgtN6r4HrN5iiZ/6XHc/2HhnXB37BhqV5Ho8pp3L6RZVJz+
 oedbMAiq+JkcrA8j3hR7F4hYPX7mlsBlNcYz25Pvr4gaS4sfnb2kjvhj2/fg12NuBQatCsRWnsp
 w+vqT
X-Gm-Gg: ASbGncvofI33ySBrNDIYShLp7SqwdXehx86JKfdyU8LCaSjS+mMYR3IQtxzX8fO6yYA
 XW8WaxouKtXfamJrRDrgYOp+q2x16TkuRFw17O+S2oE8vikpLNd19RjhwSSergngu0Nb+MEU22F
 eGdDVNn7j75uBZxvJhgW7MSqea02DIWMH31fe8w8Wp+9sEfZUsfnrzBjLeoEdPrM5B762gBpAID
 Jr1MUURlpAckFuotohgffBGjhhjN0BF1iy+KdFDGBGqim9T1UcUcZl4oBxTvaUFTL3b9R1c3wmF
 xTLGFTJdBDNIQnh+pqRjWe5Ys+f8vYkW9pfm3H+kAfp68N97sO5ux0K2rZc65R1S0f1R
X-Google-Smtp-Source: AGHT+IE+L0yyX0pqFiJ3uAV6sFE1o6IeVh74gnbcE4SKwIJoSVN52SpMbF87UHOdIMUbTOSf5tVLwQ==
X-Received: by 2002:a05:6000:2209:b0:3a3:7115:5e7a with SMTP id
 ffacd0b85a97d-3b5ddebd150mr2232338f8f.42.1751975563813; 
 Tue, 08 Jul 2025 04:52:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4a68ebsm19731255e9.39.2025.07.08.04.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 04:52:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 2/3] hw/intc/arm_gicv3_kvm: Migrate GICD_TYPER2
Date: Tue,  8 Jul 2025 12:52:37 +0100
Message-ID: <20250708115238.667050-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708115238.667050-1-peter.maydell@linaro.org>
References: <20250708115238.667050-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GICD_TYPER2 register is new for GICv4.1.  As an ID register, we
migrate it so that on the destination the kernel can check that the
destination supports the same configuration that the source system
had.  This avoids confusing behaviour if the user tries to migrate a
VM from a GICv3 system to a GICv4.1 system or vice-versa.  (In
practice the inability to migrate between different CPU types
probably already prevented this.)

Note that older kernels pre-dating GICv4.1 support in the KVM GIC
will just ignore whatever userspace writes to GICD_TYPER2, so
migration where the destination is one of those kernels won't have
this safety-check.

(The reporting of a mismatch will be a bit clunky, because this
file currently uses error_abort for all failures to write the
data to the kernel. Ideally we would fix this by making them
propagate the failure information back up to the post_load hook
return value, to cause a migration failure.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2:
 * fix comment missing bracket
 * fix reset handling so this works on GICv4.1 hosts
 * move get/put code to be with the other GICD regs
---
 include/hw/intc/arm_gicv3_common.h |  6 ++++++
 hw/intc/arm_gicv3_common.c         | 24 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 25 +++++++++++++++++++++++--
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index a3d6a0e5077..bcbcae1fbe7 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -267,6 +267,12 @@ struct GICv3State {
     GICv3CPUState *gicd_irouter_target[GICV3_MAXIRQ];
     uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
 
+    /*
+     * GICv4.1 extended ID information. This is currently only needed
+     * for migration of a KVM GIC.
+     */
+    uint32_t gicd_typer2;
+
     GICv3CPUState *cpu;
     /* List of all ITSes connected to this GIC */
     GPtrArray *itslist;
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 1cee68193ca..7b09771310e 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -275,6 +275,29 @@ const VMStateDescription vmstate_gicv3_gicd_nmi = {
     }
 };
 
+static bool gicv3_typer2_needed(void *opaque)
+{
+    /*
+     * GICD_TYPER2 ID register for GICv4.1. Was RES0 for
+     * GICv3 and GICv4.0; don't migrate if zero for backwards
+     * compatibility.
+     */
+    GICv3State *cs = opaque;
+
+    return cs->gicd_typer2 != 0;
+}
+
+const VMStateDescription vmstate_gicv3_gicd_typer2 = {
+    .name = "arm_gicv3/gicd_typer2",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gicv3_typer2_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(gicd_typer2, GICv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
@@ -304,6 +327,7 @@ static const VMStateDescription vmstate_gicv3 = {
     .subsections = (const VMStateDescription * const []) {
         &vmstate_gicv3_gicd_no_migration_shift_bug,
         &vmstate_gicv3_gicd_nmi,
+        &vmstate_gicv3_gicd_typer2,
         NULL
     }
 };
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3be3bf6c28d..8e34d08b415 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -405,7 +405,16 @@ static void kvm_arm_gicv3_put(GICv3State *s)
         }
     }
 
-    /* Distributor state (shared between all CPUs */
+    /* Distributor state (shared between all CPUs) */
+
+    /*
+     * This ID register is restored so that the kernel can fail
+     * the write if the migration source is GICv4.1 but the
+     * destination is not.
+     */
+    reg = s->gicd_typer2;
+    kvm_gicd_access(s, GICD_TYPER2, &reg, true);
+
     reg = s->gicd_statusr[GICV3_NS];
     kvm_gicd_access(s, GICD_STATUSR, &reg, true);
 
@@ -572,7 +581,10 @@ static void kvm_arm_gicv3_get(GICv3State *s)
         }
     }
 
-    /* Distributor state (shared between all CPUs */
+    /* Distributor state (shared between all CPUs) */
+
+    kvm_gicd_access(s, GICD_TYPER2, &reg, false);
+    s->gicd_typer2 = reg;
 
     kvm_gicd_access(s, GICD_STATUSR, &reg, false);
     s->gicd_statusr[GICV3_NS] = reg;
@@ -707,6 +719,7 @@ static void kvm_arm_gicv3_reset_hold(Object *obj, ResetType type)
 {
     GICv3State *s = ARM_GICV3_COMMON(obj);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
+    uint32_t reg;
 
     DPRINTF("Reset\n");
 
@@ -719,6 +732,14 @@ static void kvm_arm_gicv3_reset_hold(Object *obj, ResetType type)
         return;
     }
 
+    /*
+     * The reset value of the GICD_TYPER2 ID register should be whatever
+     * the kernel says it is; otherwise the attempt to put the value
+     * in kvm_arm_gicv3_put() will fail.
+     */
+    kvm_gicd_access(s, GICD_TYPER2, &reg, false);
+    s->gicd_typer2 = reg;
+
     kvm_arm_gicv3_put(s);
 }
 
-- 
2.43.0


