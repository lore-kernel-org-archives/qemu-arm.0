Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp934301njk;
        Fri, 24 Jan 2025 08:41:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5pQacJF1VCUHU3us4pa75BHOpZkEaT3oqSIkdmslFDhFmK8i5fSjyGMgZrnVi92xHpUGMPyqahicRAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGXozFotVpEVeI51V3be4QyLOIp3Zh/IJDgnsxkew9aeKcQRQP1pWFDcr9MXYa62I5famm/
X-Received: by 2002:a05:620a:c4b:b0:7b6:cf18:66d1 with SMTP id af79cd13be357-7be9af69869mr588914585a.21.1737736910040;
        Fri, 24 Jan 2025 08:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736910; cv=none;
        d=google.com; s=arc-20240605;
        b=MPM71BNAUk1lPVnK1fnfKu5rln+/x4eFHFN0vqOtSUZx9jSzMHPexiYxxIbTBYFatt
         35dibOL/+BQ5wBO1mYYUO7JJQqBLMmTIkhF/jkx4nS62KR1nN+4KEvx9xPrF7M9cgpmS
         zzJ2Kd/agh3aj2wQB3Fx8946kp99L6DVY1ImfYF8EWfZZcRs77CKhHaoO90KJaoiH3lG
         h1WMMjnUNmg6XuPuLgxlfwrc6amQEZTo9yOHP+QYkqe7NV8ZcKIp5XEh5eryiM2OKnn7
         Q8Nqc8dSrMoPtgwLbSIX5U8RLyxEq3WrQazDA1mkbKsWxR2IRDu9KOShdgQW1veIRojL
         tRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KmmHXd9GrblPYO2aSGw968FOMap5vznRkrI2AiqmE4w=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=cyJP78kqOrNG/GM/tX01I6B3W8Yq0vFcYzTBi7rFWbeawfCisCy6wpPk8niqyWDkAD
         AhYQHVdUy+x8AeKhqaJTr2qiIcgOU62IC3Ng5XrqBd/8mmria6tX4eU0SpFZbB7A2zr2
         UszR23qyHwfZLrB5wstC2jPd2VyYFU4kLay5br6wx/wxaHthK+cekCq7MyuqReioWKdP
         qVnArgMVjwxE8OyQoAc/uWo6NBAHDcnQW4CPi19jBJ86atl/9YETQ+Ita0GLmu4Pyz8r
         j2AVcGogNafM47oNGFyI2RVS1zTht6pEFvW0zA4suNhzxWFGBbyGv5qKbVv5ydUUEQxG
         9cEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qH0oYMqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81804si255281585a.15.2025.01.24.08.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qH0oYMqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMgn-000706-SH; Fri, 24 Jan 2025 11:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-0006B2-Ko
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZY-0005ox-Ht
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso15178385e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736200; x=1738341000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KmmHXd9GrblPYO2aSGw968FOMap5vznRkrI2AiqmE4w=;
 b=qH0oYMqU9o5s4wwVzSBwco7pfy6QZEBDInydO3B+qlZlFJzfGBPphsw0Aav4g+NhBQ
 gKMmC+LEmKOL3YZYgJWVB1VR+eJisiaIWFyzi/ugbvFUPiUmi9gFHtxbMR/SnbCaIxQg
 vbRebeyYaJFsBhjp1fKthowYILp8YJp2EiJ+JtqhvnOZJTTcd8vgtkNbLxNX0cVr/G0H
 LgugBfE0o691UHx3MpVrfTaVlY/MgZ2bO9F7QlTFTfZzg74UJB8fo1u/URMlUSfqvduu
 a0wcSdtvCxvlJs1EgOjWOiTnsiYAsA89KiILTnkd6qYETINPX/Vzwe2krNv6ISzlJTQe
 9Jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736200; x=1738341000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmmHXd9GrblPYO2aSGw968FOMap5vznRkrI2AiqmE4w=;
 b=hBM6W1cbEkcdc1E94jt2o02GbXyillHBK4VaJQ/Mx6ya5hjt2oVd3s0NLCpUXHi8h5
 4g32sgpTr5wJRi81kqtGayT99/huKtpa+XjH0UGJw8M7oCtfL62A73LLHDo/KogX4lRf
 iJ4mGtgK+N6W5UlU0RugH/G+HwwtPRy2fNDxQVkAM2NKTzSZkDv0nYF38A0US47rtOnS
 4U1QBIcjQ5UpDdLBZJ6CgWSp30QS7qP8PQd8m5cibvoeke5fOhix7zzhzt3CEvLreRIh
 MuOGAL/VHUcKJUnowpohfVJEgGO9XNz1UgQ8vv03A+BBF8iGiOOTOtEUsc2CmEnXic5G
 UocA==
X-Gm-Message-State: AOJu0YwAeYQxzNI37dxZ7+toPvnVW89qQmKC4AjNWVe/ae0cPuSDlQN5
 bPzS+SFk+CLvz6yiTRUs/nUP4u12vfrDb7UYqO/sUxJFLFPhlrkgI4SwKQ3UMEVElg7SiMDMFkx
 f
X-Gm-Gg: ASbGncsz98Lmy6oLgHV/c7sksHo/BJutCRnt26WF9ShvmuqCBa/tfQvZNAAX8aXjUUT
 5qazJDhtw3LvPAUkUS15k1JGkaiK/WRrlQqy6cszdaSEcjXVLJNjM9GqiXIguMwOJUU7tIs5G/K
 2MLRjoUlo4jPgIGr0wgEAtES71Gpjww6Z//SApPthdkLtPQZyzLrgTUpO3qfNN7RvZtiTueQaNC
 Mo0dloZmZS4BOVFSQPMCDh3xxLu455TLjmIhINUbLnN4JSmzo9x935RSQaEHpldGxinDyBQUi69
 ZTA0oIki8Yg=
X-Received: by 2002:a05:600c:4e08:b0:434:a4a6:51f8 with SMTP id
 5b1f17b1804b1-438912d4a3bmr316757715e9.0.1737736200464; 
 Fri, 24 Jan 2025 08:30:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 65/76] target/arm: Handle FPCR.AH in negation step in SVE FMLS
 (vector)
Date: Fri, 24 Jan 2025 16:28:25 +0000
Message-Id: <20250124162836.2332150-66-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Emmxspwc7mMj

Handle the FPCR.AH "don't negate the sign of a NaN" semantics fro the
SVE FMLS (vector) insns, by providing new helpers for the AH=1 case
which end up passing fpcr_ah = true to the do_fmla_zpzzz_* functions
that do the work.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  21 ++++++
 target/arm/tcg/sve_helper.c    | 114 +++++++++++++++++++++++++++------
 target/arm/tcg/translate-sve.c |  18 ++++--
 3 files changed, 126 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index a2e96a498dd..0b1b5887834 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1475,6 +1475,27 @@ DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_7(sve_ah_fmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_7(sve_ah_fnmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_7(sve_ah_fnmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index dc5a35b46ef..90bcf680fa4 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4802,7 +4802,7 @@ DO_ZPZ_FP(flogb_d, float64, H1_8, do_float64_logb_as_int)
 
 static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint16_t neg1, uint16_t neg3)
+                            uint16_t neg1, uint16_t neg3, bool fpcr_ah)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4814,9 +4814,15 @@ static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
             if (likely((pg >> (i & 63)) & 1)) {
                 float16 e1, e2, e3, r;
 
-                e1 = *(uint16_t *)(vn + H1_2(i)) ^ neg1;
+                e1 = *(uint16_t *)(vn + H1_2(i));
                 e2 = *(uint16_t *)(vm + H1_2(i));
-                e3 = *(uint16_t *)(va + H1_2(i)) ^ neg3;
+                e3 = *(uint16_t *)(va + H1_2(i));
+                if (neg1 && !(fpcr_ah && float16_is_any_nan(e1))) {
+                    e1 ^= neg1;
+                }
+                if (neg3 && !(fpcr_ah && float16_is_any_nan(e3))) {
+                    e3 ^= neg3;
+                }
                 r = float16_muladd(e1, e2, e3, 0, status);
                 *(uint16_t *)(vd + H1_2(i)) = r;
             }
@@ -4827,30 +4833,48 @@ static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0, false);
 }
 
 void HELPER(sve_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0, false);
 }
 
 void HELPER(sve_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000, false);
 }
 
 void HELPER(sve_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000, false);
+}
+
+void HELPER(sve_ah_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0, true);
+}
+
+void HELPER(sve_ah_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000, true);
+}
+
+void HELPER(sve_ah_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000, true);
 }
 
 static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint32_t neg1, uint32_t neg3)
+                            uint32_t neg1, uint32_t neg3, bool fpcr_ah)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4862,9 +4886,15 @@ static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
             if (likely((pg >> (i & 63)) & 1)) {
                 float32 e1, e2, e3, r;
 
-                e1 = *(uint32_t *)(vn + H1_4(i)) ^ neg1;
+                e1 = *(uint32_t *)(vn + H1_4(i));
                 e2 = *(uint32_t *)(vm + H1_4(i));
-                e3 = *(uint32_t *)(va + H1_4(i)) ^ neg3;
+                e3 = *(uint32_t *)(va + H1_4(i));
+                if (neg1 && !(fpcr_ah && float32_is_any_nan(e1))) {
+                    e1 ^= neg1;
+                }
+                if (neg3 && !(fpcr_ah && float32_is_any_nan(e3))) {
+                    e3 ^= neg3;
+                }
                 r = float32_muladd(e1, e2, e3, 0, status);
                 *(uint32_t *)(vd + H1_4(i)) = r;
             }
@@ -4875,30 +4905,48 @@ static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0, false);
 }
 
 void HELPER(sve_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0, false);
 }
 
 void HELPER(sve_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000, false);
 }
 
 void HELPER(sve_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000, false);
+}
+
+void HELPER(sve_ah_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0, true);
+}
+
+void HELPER(sve_ah_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000, true);
+}
+
+void HELPER(sve_ah_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000, true);
 }
 
 static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint64_t neg1, uint64_t neg3)
+                            uint64_t neg1, uint64_t neg3, bool fpcr_ah)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4910,9 +4958,15 @@ static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
             if (likely((pg >> (i & 63)) & 1)) {
                 float64 e1, e2, e3, r;
 
-                e1 = *(uint64_t *)(vn + i) ^ neg1;
+                e1 = *(uint64_t *)(vn + i);
                 e2 = *(uint64_t *)(vm + i);
-                e3 = *(uint64_t *)(va + i) ^ neg3;
+                e3 = *(uint64_t *)(va + i);
+                if (neg1 && !(fpcr_ah && float64_is_any_nan(e1))) {
+                    e1 ^= neg1;
+                }
+                if (neg3 && !(fpcr_ah && float64_is_any_nan(e3))) {
+                    e3 ^= neg3;
+                }
                 r = float64_muladd(e1, e2, e3, 0, status);
                 *(uint64_t *)(vd + i) = r;
             }
@@ -4923,25 +4977,43 @@ static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0, false);
 }
 
 void HELPER(sve_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0, false);
 }
 
 void HELPER(sve_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN, false);
 }
 
 void HELPER(sve_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN, false);
+}
+
+void HELPER(sve_ah_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0, true);
+}
+
+void HELPER(sve_ah_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN, true);
+}
+
+void HELPER(sve_ah_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN, true);
 }
 
 /* Two operand floating-point comparison controlled by a predicate.
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index a7033fe93ab..663634e3a39 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3924,19 +3924,25 @@ TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
            a->rd, a->rn, a->rm, a->pg, a->rot | (s->fpcr_ah << 1),
            a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64)
 
-#define DO_FMLA(NAME, name) \
+#define DO_FMLA(NAME, name, ah_name)                                    \
     static gen_helper_gvec_5_ptr * const name##_fns[4] = {              \
         NULL, gen_helper_sve_##name##_h,                                \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d            \
     };                                                                  \
-    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_zzzzp, name##_fns[a->esz], \
+    static gen_helper_gvec_5_ptr * const name##_ah_fns[4] = {           \
+        NULL, gen_helper_sve_##ah_name##_h,                             \
+        gen_helper_sve_##ah_name##_s, gen_helper_sve_##ah_name##_d      \
+    };                                                                  \
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_zzzzp,                     \
+               s->fpcr_ah ? name##_ah_fns[a->esz] : name##_fns[a->esz], \
                a->rd, a->rn, a->rm, a->ra, a->pg, 0,                    \
                a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64)
 
-DO_FMLA(FMLA_zpzzz, fmla_zpzzz)
-DO_FMLA(FMLS_zpzzz, fmls_zpzzz)
-DO_FMLA(FNMLA_zpzzz, fnmla_zpzzz)
-DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
+/* We don't need an ah_fmla_zpzzz because fmla doesn't negate anything */
+DO_FMLA(FMLA_zpzzz, fmla_zpzzz, fmla_zpzzz)
+DO_FMLA(FMLS_zpzzz, fmls_zpzzz, ah_fmls_zpzzz)
+DO_FMLA(FNMLA_zpzzz, fnmla_zpzzz, ah_fnmla_zpzzz)
+DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz, ah_fnmls_zpzzz)
 
 #undef DO_FMLA
 
-- 
2.34.1

