Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1364BCCD180
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:14:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yS4-0003lv-LW; Wed, 01 Oct 2025 11:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRq-00038X-Kf
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:08:54 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQ9-0000nP-MQ
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:08:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso6126004f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331208; x=1759936008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgRekvmTJ/VCtBPy89EpCeHzqbjnCgHMk9XzcH8ZZx8=;
 b=coLbB4WwvretULXAEtHly+zNKyYSKZ5OlEHXpauWu6MnzPmYu+rAGoHVgw+JTIvoxA
 HXwlt/kv2xIh+4giG7/UrjeCzmca7CFh8k9ERIRw47R+g06dA9w4B56PgSRsM92EBh6b
 gGfA9SnwWrERR6D6KFp71B2sED2wqsdGUoOPNB3V7yzhWmVk5X0w13HJ0WvhH11lQSl4
 wgNSsBKfP6GoDBUVB+wJXbFKotuQL47umPUXqBRoJf/CD/J8wDBfIWGkCTff9S2xyK4f
 /MB6ATIAmWD0Wc/VwYAmUQdgvmye1fRdImRQ+iVF7Q2x9XmM16KeQbjHf2bioIQoselD
 lShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331208; x=1759936008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgRekvmTJ/VCtBPy89EpCeHzqbjnCgHMk9XzcH8ZZx8=;
 b=u3E5zqsGf9bO/2jX7/AkU6kHanHoRqW1xN2olMvvexYMr1Sb7hmhBba7Rm1cO2Sss7
 Vt1faXAjrYTrEAuchGdrSqDqhBjd82njUSkL5a1M7BWAQQCVp6xlSLjZTdILYvHiFJIH
 yBoXZAeAXqKSPvV+MUZXINwZMmAwC2K9liv53+hNfsfFOF+g8G6GDJ8HjBizvX0HPVUJ
 YMQzhHQM5b0h63iM0scNKCrODLtc/c+NvmnmwWYuJp5jprVPzVv8tCI5uY3jYP5+yXzu
 1DxqIfXxjQLIr7+/EdJ1/L2NONclmLp8isezughNXapaZHENifEr2Yk9NW845MO+FYk9
 xA6Q==
X-Gm-Message-State: AOJu0YxbIaZ8tQXua1nFwknToqTTJF1bVzuPetxvTeU+/aX7kXdTo/Qv
 XH816kK0iiTi62CppymP2U65sgZ3PpkKjoiLrnebrhCmXVGQNZvKy56SXqiLFu7I/6Q=
X-Gm-Gg: ASbGnct7Vyuhtb+D2tOB9q49pbYIntKP5Mt3QPBPDz5YBFCrL8+jUvUZwdB6DqVS8n8
 kRB8LBqUYwUMyNccESNb8kl9n5FkA9fmS2sA9dk1jUv7KfWbcp/YF8z50N6letd+zN7e/Be+UVc
 m/5UWj4awLimP3CkO5cpnvIPT1t6SlrnJhvw5/S3V/uqr2YZYd4/OMnvpExihqhGc75LB7qRWPm
 uWI2T588+ATQR2Eu598S7rRyflY9fxiEcWFCmV3ELlRC2+qqHln7wRIJOW55My/8UQrbTs7pfMq
 797Ppkj52lgVUplwpE8gAwkAoylC3MWZGQ9S+QlVAhQCyxrCmNjj0HscoJ8vQ/aAArMhjdKMCoV
 jEZ/EUtTgsoe0mLvSvQn8IgDCoBFbHU4hlr7a/v25DSzkTYtAzdi+sIlK/SdLviC7hkhqDF3UD8
 qF+xauVJkVWXYvQSme2Zxg
X-Google-Smtp-Source: AGHT+IF6btBrTtBXsCyTjEV0w6exyA7U2R5NCMxQNV+7lluj+aV+XkDultE+kKDstjJdSU31d77zqQ==
X-Received: by 2002:a05:6000:200d:b0:3e2:b2f0:6e57 with SMTP id
 ffacd0b85a97d-4255780b898mr3265768f8f.36.1759331208335; 
 Wed, 01 Oct 2025 08:06:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb1a3sm27980067f8f.10.2025.10.01.08.06.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 15/22] target/m68k: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:20 +0200
Message-ID: <20251001150529.14122-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/helper.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 15f110fa7a2..0f8512af72c 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -491,6 +491,7 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
     int32_t size;
     int last_attr = -1, attr = -1;
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
     MemTxResult txres;
 
     if (env->mmu.tcr & M68K_TCR_PAGE_8K) {
@@ -505,25 +506,25 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
         tib_mask = M68K_4K_PAGE_MASK;
     }
     for (unsigned i = 0; i < M68K_ROOT_POINTER_ENTRIES; i++) {
-        tia = address_space_ldl(cs->as, M68K_POINTER_BASE(root_pointer) + i * 4,
+        tia = address_space_ldl(as, M68K_POINTER_BASE(root_pointer) + i * 4,
                                 MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK || !M68K_UDT_VALID(tia)) {
             continue;
         }
         for (unsigned j = 0; j < M68K_ROOT_POINTER_ENTRIES; j++) {
-            tib = address_space_ldl(cs->as, M68K_POINTER_BASE(tia) + j * 4,
+            tib = address_space_ldl(as, M68K_POINTER_BASE(tia) + j * 4,
                                     MEMTXATTRS_UNSPECIFIED, &txres);
             if (txres != MEMTX_OK || !M68K_UDT_VALID(tib)) {
                 continue;
             }
             for (unsigned k = 0; k < tic_size; k++) {
-                tic = address_space_ldl(cs->as, (tib & tib_mask) + k * 4,
+                tic = address_space_ldl(as, (tib & tib_mask) + k * 4,
                                         MEMTXATTRS_UNSPECIFIED, &txres);
                 if (txres != MEMTX_OK || !M68K_PDT_VALID(tic)) {
                     continue;
                 }
                 if (M68K_PDT_INDIRECT(tic)) {
-                    tic = address_space_ldl(cs->as, M68K_INDIRECT_POINTER(tic),
+                    tic = address_space_ldl(as, M68K_INDIRECT_POINTER(tic),
                                             MEMTXATTRS_UNSPECIFIED, &txres);
                     if (txres != MEMTX_OK) {
                         continue;
@@ -732,6 +733,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
                                 int access_type, target_ulong *page_size)
 {
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
     uint32_t entry;
     uint32_t next;
     target_ulong page_mask;
@@ -768,7 +770,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
     /* Root Index */
     entry = M68K_POINTER_BASE(next) | M68K_ROOT_INDEX(address);
 
-    next = address_space_ldl(cs->as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
+    next = address_space_ldl(as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
     if (txres != MEMTX_OK) {
         goto txfail;
     }
@@ -776,7 +778,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         return -1;
     }
     if (!(next & M68K_DESC_USED) && !debug) {
-        address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+        address_space_stl(as, entry, next | M68K_DESC_USED,
                           MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK) {
             goto txfail;
@@ -795,7 +797,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
     /* Pointer Index */
     entry = M68K_POINTER_BASE(next) | M68K_POINTER_INDEX(address);
 
-    next = address_space_ldl(cs->as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
+    next = address_space_ldl(as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
     if (txres != MEMTX_OK) {
         goto txfail;
     }
@@ -803,7 +805,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         return -1;
     }
     if (!(next & M68K_DESC_USED) && !debug) {
-        address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+        address_space_stl(as, entry, next | M68K_DESC_USED,
                           MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK) {
             goto txfail;
@@ -826,7 +828,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         entry = M68K_4K_PAGE_BASE(next) | M68K_4K_PAGE_INDEX(address);
     }
 
-    next = address_space_ldl(cs->as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
+    next = address_space_ldl(as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
     if (txres != MEMTX_OK) {
         goto txfail;
     }
@@ -835,7 +837,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         return -1;
     }
     if (M68K_PDT_INDIRECT(next)) {
-        next = address_space_ldl(cs->as, M68K_INDIRECT_POINTER(next),
+        next = address_space_ldl(as, M68K_INDIRECT_POINTER(next),
                                  MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK) {
             goto txfail;
@@ -844,7 +846,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
     if (access_type & ACCESS_STORE) {
         if (next & M68K_DESC_WRITEPROT) {
             if (!(next & M68K_DESC_USED) && !debug) {
-                address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+                address_space_stl(as, entry, next | M68K_DESC_USED,
                                   MEMTXATTRS_UNSPECIFIED, &txres);
                 if (txres != MEMTX_OK) {
                     goto txfail;
@@ -852,7 +854,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
             }
         } else if ((next & (M68K_DESC_MODIFIED | M68K_DESC_USED)) !=
                            (M68K_DESC_MODIFIED | M68K_DESC_USED) && !debug) {
-            address_space_stl(cs->as, entry,
+            address_space_stl(as, entry,
                               next | (M68K_DESC_MODIFIED | M68K_DESC_USED),
                               MEMTXATTRS_UNSPECIFIED, &txres);
             if (txres != MEMTX_OK) {
@@ -861,7 +863,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         }
     } else {
         if (!(next & M68K_DESC_USED) && !debug) {
-            address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+            address_space_stl(as, entry, next | M68K_DESC_USED,
                               MEMTXATTRS_UNSPECIFIED, &txres);
             if (txres != MEMTX_OK) {
                 goto txfail;
-- 
2.51.0


