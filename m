Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B1FC79F9E
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 13:04:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3Yzu-0006FD-24; Mon, 07 Sep 2026 09:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3Yzg-0006Bk-0z
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:02:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3Yzd-000527-1X
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:02:39 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49ccfae359fso31382225e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788786155; x=1789390955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iotEmPiMiYZmi7r+LxWWGWJQuCRVXl+ELdBcaukh1a8=;
 b=WT2vBRizlVP3A8qU/PqNmC3jhDqigCwjOuMLlNDgwjNosrOnnv/0LG2JCf9eJ1kLO3
 GyDV10KwKCQ1dYOVZ5Rcb0eeYQgjpOTBda48l6n/l3HCjHJk3mXww+/yT1dapB/zC0Km
 Y58njGQ5dhtW0sij6leicw3ooXW4UXLMXhYbDJPssvYRqTnsObv8tXi+Xo2HNP7CR0Os
 kCp5U4TmSYixSnMF0nuXbilMxCw2QvlarZoWn0hBMM2NrZGiFGrlFn801N6hvB0IQh0J
 tnTTndvyfs+8EFQ68dTdbHoV85JW3r9RXQNfjsFkp7VSyRcsLGkxwz1axSQDlAdVPoUE
 qulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788786155; x=1789390955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iotEmPiMiYZmi7r+LxWWGWJQuCRVXl+ELdBcaukh1a8=;
 b=jSOoPg9rFK/4rjUiW4iOpigOaSdfOrtlHYkwoDjRIDuneyu7EEhVi7ibPB4ulZlvXc
 aSOnFshDBoOjViBMegtNGqQ4jHuKwoiAC5KCdX0wocvTGZ5oKgHvV9xlBx+K6UsxTL9N
 dX0jzHvbEj5z6IMOBG6zHXxwU3zcUbzzr9HR//FAqTA1wmtjW1rwPc+YoWLuOory2N53
 HGQvVUh6bFHYOdsI3E05V19PzMRU6hcdVYP9R4yy7KfE/xuZq2gVQwe7xloSzFTJbGh5
 FeQlOrZxHoPRwSIMMufrwxcPqWAFSxLpTgx05A6tAsmsNDhBDsczQMeCN9OZfWDeNt0z
 6mkg==
X-Gm-Message-State: AFuF++n0w/HXmLxeshx4/cWfvzByklHaSGNHaju5dElBiYtOLqd1xhsI
 08qCnxKoyZOhndaE5iq7f/TxajTo5q+2NcRiSfVG87QrsDdh1H7aJNh2ZhuBu0/MhHhAuIaV7MX
 dAGxJcYU=
X-Gm-Gg: AYBFou3XCMtS5acvh54eZcA20GtkkyXWO6ZAbh6gNd7EF3uf2gZl+vmuD5dqhWzDRNH
 O2fyB9rmQxIhbdsc0E8KPPslViSBe5pUBJfGYihU++X9c5nqKw0Y9qa6qz5PmXEM9bhKIQ6BGvD
 de8o1hGjK+lOjdnyEyMUIE70gYuA6RR53clBdaYazoI35ns8g6oGBbvoFVNGYA2jD4KZNDAJsXC
 RDynvggZMhgzEM3iQMEG0gO2Pb7CeAS4ZbpeYKNg7kANh1i4r/UZ41qYUCS//lH62TeBfWb8cqz
 VHD5EhfIN3vi4FKCd9zvka8dFDhA57U5ZzVrLeV3n2/a6FHfyTIzOBe5ylOAeOVF9NNa7WmdtiW
 eMsj93UvYgh3RpcSOiXnjnzP2Gmbfy3+osaxmXUQKveJ/wwZdLyFfMn18lr3H0qJXXwFac/4x9N
 fqNca3ZoXJvAmyt4eU38FQOL2Tue1pKoqZELFwF7xjRajF1ZpnnqNdUDnb3CEK5AWVRR6K9oYLA
 9A/PrmR6nWksOjj5lSpkSg0gQi9BZ4Uq2JihrfGlXjyUPEA6C/Lq0Z9V5Ej1Cv/Nq9Ak6qh8TZp
 803z
X-Received: by 2002:a05:600c:6088:b0:49c:fc6c:be15 with SMTP id
 5b1f17b1804b1-49cfc6cc100mr200291415e9.27.1788786154889; 
 Mon, 07 Sep 2026 06:02:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee60bae6sm468589935e9.9.2026.09.07.06.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 06:02:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
Subject: [PATCH 8/8] target/arm: Add a debug check that all sysregs are
 migrated
Date: Mon,  7 Sep 2026 14:02:23 +0100
Message-ID: <20260907130223.3148989-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907130223.3148989-1-peter.maydell@linaro.org>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

We mark some sysregs with ARM_CP_ALIAS (either manually or
automatically) to indicate that they are accessing underlying guest
CPU state whose migration and reset is handled by some other
register.  (For example, typically we make the 32-bit view of a
register an alias and handle migration for the 64-bit view.)

Add a debug check that we actually do handle the migration elsewhere:
for every sysreg in the hashtable (i.e.  which might be visible to
the guest), check that some register in the migration list has a
field offset that matches.  This isn't perfect but it can catch some
bugs.  In particular it did fire for the various secure banked
registers that we were not migrating before the fixes in the previous
patches.

Because the check is more of a debugging aid than something I'm
confident will never produce a false-positive report for some niche
combination of CPU and machine options, we only do it for debug
builds, and make it a warning printed to the user rather than an
assertion failure.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 121 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b41e07e84b4..82e7a20bdb6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -230,6 +230,125 @@ bool write_list_to_cpustate(ARMCPU *cpu)
     return ok;
 }
 
+#ifdef CONFIG_DEBUG_TCG
+/* Data to pass through to check_cpreg() */
+typedef struct CheckCPRegData {
+    ARMCPU *cpu;
+    bool warned;
+} CheckCPRegData;
+
+static void check_cpreg(gpointer key, gpointer value, gpointer opaque)
+{
+    CheckCPRegData *data = opaque;
+    ARMCPU *cpu = data->cpu;
+    CPUARMState *env = &cpu->env;
+    bool match = false;
+    const ARMCPRegInfo *ri = value;
+
+    if ((ri->type & (ARM_CP_NO_RAW | ARM_CP_CONST)) ||
+        ri->fieldoffset == 0) {
+        return;
+    }
+
+    /*
+     * If we don't have EL3 then the guest can't get at S-only
+     * registers even if they're in the hashtable. This avoids
+     * false-positive complaints about e.g. TTBCR_S and DFSR_S: they
+     * are migrated via ESR_EL3 and TCR_EL3, but we only register those
+     * _EL3 regs if ARM_FEATURE_EL3.
+     */
+    if (ri->secure == ARM_CP_SECSTATE_S && !arm_feature(env, ARM_FEATURE_EL3)) {
+        return;
+    }
+
+    /*
+     * Some special cases for sysregs that are backed by fields that we
+     * migrate in the main vmstate, not the cpregs array.
+     */
+    if (ri->fieldoffset >= offsetof(CPUARMState, banked_spsr[BANK_USRSYS]) &&
+        ri->fieldoffset <= offsetof(CPUARMState, banked_spsr[BANK_MON])) {
+        return;
+    }
+    if (ri->fieldoffset >= offsetof(CPUARMState, elr_el[0]) &&
+        ri->fieldoffset <= offsetof(CPUARMState, elr_el[3])) {
+        return;
+    }
+    if (ri->fieldoffset >= offsetof(CPUARMState, sp_el[0]) &&
+        ri->fieldoffset <= offsetof(CPUARMState, sp_el[3])) {
+        return;
+    }
+    if (ri->fieldoffset == offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC])) {
+        return;
+    }
+
+    for (int i = 0; i < cpu->cpreg_array_len; i++) {
+        uint32_t other_regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        const ARMCPRegInfo *other_ri = get_arm_cp_reginfo(cpu->cp_regs,
+                                                          other_regidx);
+
+        if (!other_ri || (other_ri->type & (ARM_CP_NO_RAW | ARM_CP_CONST)) ||
+            other_ri->fieldoffset == 0) {
+            continue;
+        }
+
+        /*
+         * If the field offsets match exactly, or this 32-bit cpreg
+         * is in the second half of a 64-bit field, consider it to
+         * be handled.
+         */
+        if (ri->fieldoffset == other_ri->fieldoffset ||
+            (cpreg_field_type(ri) == MO_32 &&
+             cpreg_field_type(other_ri) == MO_64 &&
+             ri->fieldoffset == other_ri->fieldoffset + 4)) {
+            match = true;
+            break;
+        }
+    }
+    if (!match) {
+        warn_report("check_cpreg: no migration entry found for %s", ri->name);
+        data->warned = true;
+    }
+}
+#endif /* CONFIG_DEBUG_TCG */
+
+static void arm_check_cpreg_coverage(ARMCPU *cpu)
+{
+    /*
+     * Try to catch bugs where we don't actually migrate a cpreg.
+     * Specifically, here we check that every cpreg in the hash table
+     * (and thus potentially visible to the guest) which specifies
+     * a fieldoffset has some entry in the cpreg_indexes[] array that
+     * handles that same fieldoffset.
+     * The typical bug that will be flagged up here is if a register
+     * is marked as an alias of something else, but there isn't actually
+     * anything else that handles the field.
+     *
+     * Note that the checks are more of a best-effort, are somewhat
+     * expensive at O(n^2) in the number of sysregs, and need some
+     * cases to be excluded where the sysreg data isn't migrated via
+     * the cpreg arrays. So we only do them in --enable-debug builds,
+     * to avoid potentially causing problems for users.
+     */
+#ifdef CONFIG_DEBUG_TCG
+    CheckCPRegData data = {
+        .cpu = cpu,
+        .warned = false,
+    };
+
+    /* We'll only use the cpregs for migration with TCG */
+    if (!tcg_enabled()) {
+        return;
+    }
+    g_hash_table_foreach(cpu->cp_regs, check_cpreg, &data);
+
+    if (data.warned) {
+        error_printf("check_cpreg errors are a QEMU bug that may cause "
+                     "migration to fail. Please report this with the full "
+                     "QEMU command line and version.\n");
+    }
+#endif
+}
+
 static void add_cpreg_to_list(gpointer key, gpointer value, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
@@ -281,6 +400,8 @@ void arm_init_cpreg_list(ARMCPU *cpu)
     if (arraylen) {
         qsort(cpu->cpreg_indexes, arraylen, sizeof(uint64_t), compare_u64);
     }
+
+    arm_check_cpreg_coverage(cpu);
 }
 
 bool arm_pan_enabled(CPUARMState *env)
-- 
2.43.0


