Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AC9CA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:18:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dq-0000NJ-Ct; Tue, 26 Aug 2025 21:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cr-0005Hm-Nu
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:58 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cV-0007PL-B6
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:56 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-77057c4d88bso2710902b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256793; x=1756861593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RnAyLOnPglCnqn9KStFraeKQldJjFkimEavUTsc0Rg=;
 b=oUK/FaA3poOrvXVIZEmN/ymGkOo04rqTt1ChlVcPnBVUrg1nQzyxhtu2Wolav7BzjT
 ftf9oiT5YxWV5B5rtcBgVab1W+IFIL2IB7VXGMCRE/54BbfoVTxQIiiLTFQBjSlgOL79
 SOVWnaZy1k2emgN9wXkYZD9/zfDnE0KRQaeZxUhLFV434zTkYr7LviMvF23RDx5fzz40
 zpp/eAXnKMQyfqpi4bD1LfzDqiB8zEed37D5COMVonWGk8T8XbiO617c+0x+8Zr3mNqE
 +f4PvnbaoDAjSxEPRJOxH2ABRqw/ZrB1sUPsfvuvaNhoTu7BUWoFXUgyl2vc6qfLv/51
 w1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256793; x=1756861593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/RnAyLOnPglCnqn9KStFraeKQldJjFkimEavUTsc0Rg=;
 b=ol7Ztp3/XTtpJ9SFU5vx/2hzpk96VEF0KbPojhE4jJBXIWWWFFfMcLQZ7dlYeL0+Zu
 zGeHWm5wGLp3uZdyVhMQPiMxxBvbpTq5oJGFBG1NDnBIgAtI4G+Fvwn4rRgg2dlTnd0K
 GUuKSaCHL/uU/1y+g0wskspJETtBn8+tAf9wyRUl8mjIplLWPA6buiZoBo45qZjw5Bve
 qJWMALfhFaJ4MWF++wbwntxyTb+cpzMlYzi7Vn1PFCRDwOIA/Efw97duTn8a5PatTX07
 tOCLNsipS7oDiY9neKAWbKcLgt17EiAzODeNwvV8+ySfjA+9CazMBrEE5UvJKcHFr2GG
 T64Q==
X-Gm-Message-State: AOJu0YwNhRAOZVmH05GIeSbXL3jCnxnvjHO6ElrCPk+V/Kh/paQXU2p7
 eFwumv30SLhSRJEqOiDouM0GT1NACBcTGkLdArar9naolG9gzs+D+r4snzQMC40ZjP8=
X-Gm-Gg: ASbGncteeW9HOFlKZDPzEDjCyswX2mI7U5yZLEG3kygAPUJp3aWWu5zA40qQ9us+jwO
 sV60+28Vy2aMLW43i5Wp3KODbyKArV3+mHXO+pbguMqbHrgTqt2MJN5otCZwU/RYlYtgQLJmO/y
 Um8xdDwUdxKMxFPDDT4k1LbaOKqRqJ9LQvHUTI/xnmae5ps1P7LWBq/H4S3p8yRleQ5o/NYHZJC
 5YAIVwKvnof5TOHATOeaeVcGmtbUU2AevJCWg6paS2aJiD/P6LdEpm2RBFtVMEYPvo2WdtUTfSP
 GZwe3FBLfZ04iFpvtTBh5P1Lzjdq6sD7QCGHI67xSBj3pXQAwEs/u+k5ppek0cFWL6XgkRFDz5A
 88FIuHCYF4rv4Ghym/iz6RK+wAvywLwFJt+lzYZaLFunY1wY=
X-Google-Smtp-Source: AGHT+IEonCEhDn1WNyPkAF8XfoD5+G5TmC+jJSbA71yTPy/HsO2IALLhCVO2/GDzqWP3AuXHgZ6pIg==
X-Received: by 2002:a05:6a00:3e27:b0:770:4d54:6234 with SMTP id
 d2e1a72fcca58-7704d546526mr14810896b3a.3.1756256793541; 
 Tue, 26 Aug 2025 18:06:33 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:06:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/61] target/arm: Convert init_cpreg_list to
 g_hash_table_foreach
Date: Wed, 27 Aug 2025 11:04:08 +1000
Message-ID: <20250827010453.4059782-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Adjust count_cpreg and add_cpreg_to_list to be used with
g_hash_table_foreach instead of g_list_foreach.  In this way we have
the ARMCPRegInfo pointer directly rather than having to look it up
from the key.

Delay the sorting of the cpreg_indexes until after add_cpreg_to_list.
This allows us to sort the data that we actually care about,
the kvm id, as computed within add_cpreg_to_list, instead of
having to repeatedly compute the kvm id within cpreg_key_compare.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 54 ++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c4103d958a..268cad905f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -229,11 +229,11 @@ bool write_list_to_cpustate(ARMCPU *cpu)
     return ok;
 }
 
-static void add_cpreg_to_list(gpointer key, gpointer opaque)
+static void add_cpreg_to_list(gpointer key, gpointer value, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
     uint32_t regidx = (uintptr_t)key;
-    const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+    const ARMCPRegInfo *ri = value;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
@@ -242,61 +242,49 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     }
 }
 
-static void count_cpreg(gpointer key, gpointer opaque)
+static void count_cpreg(gpointer key, gpointer value, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
-    const ARMCPRegInfo *ri;
-
-    ri = g_hash_table_lookup(cpu->cp_regs, key);
+    const ARMCPRegInfo *ri = value;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
     }
 }
 
-static gint cpreg_key_compare(gconstpointer a, gconstpointer b, gpointer d)
-{
-    uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
-    uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
-
-    if (aidx > bidx) {
-        return 1;
-    }
-    if (aidx < bidx) {
-        return -1;
-    }
-    return 0;
-}
-
 void init_cpreg_list(ARMCPU *cpu)
 {
     /*
      * Initialise the cpreg_tuples[] array based on the cp_regs hash.
      * Note that we require cpreg_tuples[] to be sorted by key ID.
      */
-    GList *keys;
     int arraylen;
 
-    keys = g_hash_table_get_keys(cpu->cp_regs);
-    keys = g_list_sort_with_data(keys, cpreg_key_compare, NULL);
-
     cpu->cpreg_array_len = 0;
-
-    g_list_foreach(keys, count_cpreg, cpu);
+    g_hash_table_foreach(cpu->cp_regs, count_cpreg, cpu);
 
     arraylen = cpu->cpreg_array_len;
-    cpu->cpreg_indexes = g_new(uint64_t, arraylen);
-    cpu->cpreg_values = g_new(uint64_t, arraylen);
-    cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
-    cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
-    cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
+    if (arraylen) {
+        cpu->cpreg_indexes = g_new(uint64_t, arraylen);
+        cpu->cpreg_values = g_new(uint64_t, arraylen);
+        cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
+        cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
+    } else {
+        cpu->cpreg_indexes = NULL;
+        cpu->cpreg_values = NULL;
+        cpu->cpreg_vmstate_indexes = NULL;
+        cpu->cpreg_vmstate_values = NULL;
+    }
+    cpu->cpreg_vmstate_array_len = arraylen;
     cpu->cpreg_array_len = 0;
 
-    g_list_foreach(keys, add_cpreg_to_list, cpu);
+    g_hash_table_foreach(cpu->cp_regs, add_cpreg_to_list, cpu);
 
     assert(cpu->cpreg_array_len == arraylen);
 
-    g_list_free(keys);
+    if (arraylen) {
+        qsort(cpu->cpreg_indexes, arraylen, sizeof(uint64_t), compare_u64);
+    }
 }
 
 bool arm_pan_enabled(CPUARMState *env)
-- 
2.43.0


