Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1254657dyc;
        Fri, 4 Jul 2025 07:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7nijXZc9XmtkIzzGtU7oscnvRwjRc3qoXNVh2WCUNq6dYqW7+ASVkDDIkk8rgG1J8Mp+PMB9su22Vag==@linaro.org
X-Google-Smtp-Source: AGHT+IFKfaBMQiW4i2cahOhqb9P4d09uhaQHeErBABU/ZIzIFIVi1g+0k7uNXfOdmsmkNXdAo09z
X-Received: by 2002:a05:6122:f89:b0:531:312c:a715 with SMTP id 71dfb90a1353d-5347bf2d6dcmr1886359e0c.2.1751639440622;
        Fri, 04 Jul 2025 07:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639440; cv=none;
        d=google.com; s=arc-20240605;
        b=CfxIRC5z5By5GWpk9A7ZU9e9D9GOFgqHoJJc3VS783a/3UfnDgvDOZY/MEU8AajH1l
         EUj1cfAwtdQVOU1kRt+sl2c7ELsMUjWBnGSUC4IV3DfxZz7R+vPKGxmayMlgCcB717Bw
         gg0HS+Go0IGm2UQHcMdWwm/nYXtFFgku7hY3LpJktJIiMumC56J430YHoIANzdY8rvTz
         mD9Do4o6dfA5lRkk2s5NQrOca39xNndutWATMqAR57SuVfoLVREfk3CcNVYnhYD6+AER
         9eRTtsJbd7BxC7prLJy7/IbyDzwVbwFdC8Zt62VmqCfIAJVZlfDdcqDKHgqwB4YsDM0z
         ggxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ptP8uenLAkSHPDYCtgTrB8bgYvjR4QRgpRat8308Fdc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=dE7Q/2iLGSX/RypSbpPdYz4KIjfSxnY9STU8nyoeR7K39xK/lrPmLCboplSw330jsv
         RJvgUBD02dfGpqoAsm4qWzt2i2WYEv4HP4Bh3ImglkE1cy+57KhjFj7bZ6pCL94qn4N0
         kM6+P8qSW+AAnQR4mpQTOW1Ay9f/xplXESA+rBvZqQg1YvViCtvCqGe76FinkgvoIUfW
         PzY1lJlQnf+boCByI69IkURWnbEGTlABPv8xWjEZxUrYBWbMnBI/wNqye+kRB+/BtoEQ
         QT2kpxWUwetiwohh43c9w9KuMQfBpDAbzJeRvGyakZxCyPLHkowkb0bs5l/8Jmo8HfK/
         HSnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=an24kuDS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-534790b9c21si666684e0c.126.2025.07.04.07.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=an24kuDS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLN-0003IB-1w; Fri, 04 Jul 2025 10:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIC-00051l-O2
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:36 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIA-0005bb-Pj
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:32 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2ea08399ec8so907861fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638889; x=1752243689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ptP8uenLAkSHPDYCtgTrB8bgYvjR4QRgpRat8308Fdc=;
 b=an24kuDSIMyYJxTyl9M4Dk24Oh+5EgIvcWHxmbGFmTCL11C2ihFQP2Z4dkxAqBgs76
 6BJyfi8sZnOPHpLswdBOlGdyPMHwAlZ0NSFDobdvAWXc3OAHalK5GskD/+oL6ys5xD3I
 W8mq93UzcI4GxcRs6WvnaLQodeamnTA7g9PgEuiozpbEzXUMnySIsBQZvVSxJ6qP566N
 ePjNEY7HY/fs1zXWis7zjD3X82aJrQrgvgMH240LgnHaa11RSZFwKeMrrCSELFyq0wE5
 zJUugq//QKQoK7k2IfnKshcoS9rlMFyS8UQP3leIcIYpIZK40gYKn8acqLTtRxd6D27C
 auUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638889; x=1752243689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptP8uenLAkSHPDYCtgTrB8bgYvjR4QRgpRat8308Fdc=;
 b=oAoFQseIPRqGdPBX21DYrbyRZ8ytdDKYQgZc2QQDv5XJ/ETAoYSJxQd+6GEsmSTXZL
 fduDpCAr/JZOUw1icBf4jzw8hp6Rytnj2zast3xA1I7Jw8D8BXolUGS3qr0PH3YTSIXg
 RNXBnH0HcsHBH0T4TBeyCHVFfWcQngIWOx3OWrVnxqdpocooe5LksPmLGBx1SEJ4nC6a
 R11BNoz+mhDQIjdxl1VW84T7wzrM27/FqjOSvItgEsFJCgac4ShgRu3+aGy5RTRRaJUT
 pmstS0lqunpNoxr0SBoZbw0XjW8QmHLh/BVu5syrIQgApp1kU2DGSig4R0cGh7A6j8T7
 iA7Q==
X-Gm-Message-State: AOJu0YyL8s99Zf1H9wrpHF9iYn6hQ1QUGaY9UR0uuW+40T8MIvotbzJD
 /JdZSCmuJ5ywc59MdDR3XRXtK5vMCSlxh4LrTAA2THJbfAmFnGM+bXFBx3uEQ/D2spU=
X-Gm-Gg: ASbGncvDCxMC9UpKzzJ9gFdDDYLbpy54S9dh01xMtpFFNqp3t6/zwLMDyf/XQFm5mZ9
 ZhQWVcLnZuH9/Bv5XEl7JiuHkiZ1bRy7ZPwvT22vlejcMGD45VTkwJnNLfHCN+wxrQUDInmhCD+
 OeHbv8EVtVVEn7yoCriU9Wd260lqBPZhsGig14xO2/0fLthJ4KKRWKEQzbFfVENpCCf4eL683n8
 csQrODagTQEt2ezhlfJotBhW0jdaI8WzsWochiF9SwuGbHdpBBQf43Oult8wKcLoxxlumBQNJTr
 nsGn5yPU9n+XWJg1UdcyzajfMqYggPGNWswgLALURioe3jHQapIrW0zOgQWIvWqk5aovsOLIKqR
 xPDI1TG746NoauEAEN1XTKmPmN5U3+TbP1/zRptHwkBscGVGY
X-Received: by 2002:a05:6871:5b18:b0:2f7:93bf:4eaa with SMTP id
 586e51a60fabf-2f796bac1bdmr1620103fac.11.1751638889465; 
 Fri, 04 Jul 2025 07:21:29 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 013/108] target/arm: Rename zarray to za_state.za
Date: Fri,  4 Jul 2025 08:19:36 -0600
Message-ID: <20250704142112.1018902-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
X-TUID: 60HVJFQhnVCm

The whole ZA state will also contain ZT0.
Make things easier in aarch64_set_svcr to zero both
by wrapping them in a common structure.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               | 48 +++++++++++++++++++---------------
 linux-user/aarch64/signal.c    |  4 +--
 target/arm/cpu.c               |  4 +--
 target/arm/helper.c            |  2 +-
 target/arm/machine.c           |  2 +-
 target/arm/tcg/sme_helper.c    |  6 ++---
 target/arm/tcg/translate-sme.c |  4 +--
 7 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2530aaca22..7db97e8038 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -715,27 +715,33 @@ typedef struct CPUArchState {
 
     uint64_t scxtnum_el[4];
 
-    /*
-     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
-     * as we do with vfp.zregs[].  This corresponds to the architectural ZA
-     * array, where ZA[N] is in the least-significant bytes of env->zarray[N].
-     * When SVL is less than the architectural maximum, the accessible
-     * storage is restricted, such that if the SVL is X bytes the guest can
-     * see only the bottom X elements of zarray[], and only the least
-     * significant X bytes of each element of the array. (In other words,
-     * the observable part is always square.)
-     *
-     * The ZA storage can also be considered as a set of square tiles of
-     * elements of different sizes. The mapping from tiles to the ZA array
-     * is architecturally defined, such that for tiles of elements of esz
-     * bytes, the Nth row (or "horizontal slice") of tile T is in
-     * ZA[T + N * esz]. Note that this means that each tile is not contiguous
-     * in the ZA storage, because its rows are striped through the ZA array.
-     *
-     * Because this is so large, keep this toward the end of the reset area,
-     * to keep the offsets into the rest of the structure smaller.
-     */
-    ARMVectorReg zarray[ARM_MAX_VQ * 16];
+    struct {
+        /*
+         * SME ZA storage -- 256 x 256 byte array, with bytes in host
+         * word order, as we do with vfp.zregs[].  This corresponds to
+         * the architectural ZA array, where ZA[N] is in the least
+         * significant bytes of env->za_state.za[N].
+         *
+         * When SVL is less than the architectural maximum, the accessible
+         * storage is restricted, such that if the SVL is X bytes the guest
+         * can see only the bottom X elements of zarray[], and only the least
+         * significant X bytes of each element of the array. (In other words,
+         * the observable part is always square.)
+         *
+         * The ZA storage can also be considered as a set of square tiles of
+         * elements of different sizes. The mapping from tiles to the ZA array
+         * is architecturally defined, such that for tiles of elements of esz
+         * bytes, the Nth row (or "horizontal slice") of tile T is in
+         * ZA[T + N * esz]. Note that this means that each tile is not
+         * contiguous in the ZA storage, because its rows are striped through
+         * the ZA array.
+         *
+         * Because this is so large, keep this toward the end of the
+         * reset area, to keep the offsets into the rest of the structure
+         * smaller.
+         */
+        ARMVectorReg za[ARM_MAX_VQ * 16];
+    } za_state;
 
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index bc7a13800d..d50cab78d8 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -248,7 +248,7 @@ static void target_setup_za_record(struct target_za_context *za,
     for (i = 0; i < vl; ++i) {
         uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
         for (j = 0; j < vq * 2; ++j) {
-            __put_user_e(env->zarray[i].d[j], z + j, le);
+            __put_user_e(env->za_state.za[i].d[j], z + j, le);
         }
     }
 }
@@ -397,7 +397,7 @@ static bool target_restore_za_record(CPUARMState *env,
     for (i = 0; i < vl; ++i) {
         uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
         for (j = 0; j < vq * 2; ++j) {
-            __get_user_e(env->zarray[i].d[j], z + j, le);
+            __get_user_e(env->za_state.za[i].d[j], z + j, le);
         }
     }
     return true;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7b207f2620..6265627762 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1335,8 +1335,8 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             qemu_fprintf(f, "ZA[%0*d]=", svl_lg10, i);
             for (j = zcr_len; j >= 0; --j) {
                 qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%c",
-                             env->zarray[i].d[2 * j + 1],
-                             env->zarray[i].d[2 * j],
+                             env->za_state.za[i].d[2 * j + 1],
+                             env->za_state.za[i].d[2 * j],
                              j ? ':' : '\n');
             }
         }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c311d2df21..3879bce848 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6663,7 +6663,7 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
      * when disabled either.
      */
     if (change & new & R_SVCR_ZA_MASK) {
-        memset(env->zarray, 0, sizeof(env->zarray));
+        memset(&env->za_state, 0, sizeof(env->za_state));
     }
 
     if (tcg_enabled()) {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index e442d48524..6e73368ef9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -315,7 +315,7 @@ static const VMStateDescription vmstate_za = {
     .minimum_version_id = 1,
     .needed = za_needed,
     .fields = (const VMStateField[]) {
-        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+        VMSTATE_STRUCT_ARRAY(env.za_state.za, ARMCPU, ARM_MAX_VQ * 16, 0,
                              vmstate_vreg, ARMVectorReg),
         VMSTATE_END_OF_LIST()
     }
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 9942d717aa..7b0bc1b17c 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -39,12 +39,12 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
     uint32_t i;
 
     /*
-     * Special case clearing the entire ZA space.
+     * Special case clearing the entire ZArray.
      * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
      * parts of the ZA storage outside of SVL.
      */
     if (imm == 0xff) {
-        memset(env->zarray, 0, sizeof(env->zarray));
+        memset(env->za_state.za, 0, sizeof(env->za_state.za));
         return;
     }
 
@@ -54,7 +54,7 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
      */
     for (i = 0; i < svl; i++) {
         if (imm & (1 << (i % 8))) {
-            memset(&env->zarray[i], 0, svl);
+            memset(&env->za_state.za[i], 0, svl);
         }
     }
 }
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 51175c923e..e8b3578174 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -92,7 +92,7 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     offset = tile * sizeof(ARMVectorReg);
 
     /* Include the byte offset of zarray to make this relative to env. */
-    offset += offsetof(CPUARMState, zarray);
+    offset += offsetof(CPUARMState, za_state.za);
     tcg_gen_addi_i32(tmp, tmp, offset);
 
     /* Add the byte offset to env to produce the final pointer. */
@@ -112,7 +112,7 @@ static TCGv_ptr get_tile(DisasContext *s, int esz, int tile)
     TCGv_ptr addr = tcg_temp_new_ptr();
     int offset;
 
-    offset = tile * sizeof(ARMVectorReg) + offsetof(CPUARMState, zarray);
+    offset = tile * sizeof(ARMVectorReg) + offsetof(CPUARMState, za_state.za);
 
     tcg_gen_addi_ptr(addr, tcg_env, offset);
     return addr;
-- 
2.43.0

