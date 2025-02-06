Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777746njb;
        Thu, 6 Feb 2025 11:59:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYrBDX6c/GPqUn0RJhDzadBMbubD2R1DvCWOdIOwvVJ4XFq0dbqmXbP8BsBX3or5Ei9HdcVAGFBkxXCA==@linaro.org
X-Google-Smtp-Source: AGHT+IEuwLEGuPPnudlNl0P+Ma1W3mVi5TGXB/9MFLhgsCTx7fYtclsQ0J2+0rT0yBcPZHkoh1iO
X-Received: by 2002:a05:620a:28c1:b0:7af:cf07:905b with SMTP id af79cd13be357-7c047c1fd74mr62363085a.2.1738871955366;
        Thu, 06 Feb 2025 11:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871955; cv=none;
        d=google.com; s=arc-20240605;
        b=UkmLyPXWhk87ypQWhHxlPvPFhQdI4vdjp6CSZEi7jSJokFOH2NoLaUq+1Ip3IobU3g
         ZBG7IYdk3sRymAAHGnbz1eBCnoBD6N4mSNG1tvB6/AAYugNAYLtmzdIm37D2eFvGTSTj
         fktVU7c2audymtSnfRUcHPfjTCfOQcfsx6M2QwAYTixR2ejXo5ZyjdJmuMHJoQfLmnvk
         0FZXrsi5HcqnWStaE3HDTKHmlmh1uZNm5xulYsNh+4LP8HtZCR20H0ZVLls6Gyqu50ai
         bc/qabkyi1spWPEZdXSdCuueBfsn9PCCJXdRuAVO4ZQe+hVFa9RrLo8bbCcOhhl0xrBC
         IpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jVdHJcWVaAi20haTkovecEqoGYD/V01LSIBrEcf/Szg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=KnCnkqLsbBjosRT/77ipyf9hizCt7m5RWvn9ebVdXxHoVbpTcFJl7tk1T1fzqCOwEU
         VlwMiw++oWP6u/fDa0SABuKWznIgFn5iygqtMFXOm2uyGs0xrVmD+Gpm+qNRtVfoK9ap
         kMPvMhtZEZ3Hz75gBvmfWu9Fm6PKcYcACL3ZhHCdYq+XThtx8Mn+hUA22Xm23tvPm0OB
         Ju7MuEnXPTavHs7Eucu8Q3TZ23VmmYg1YzyGmp/9AUL59j+nDL/MqLbGSw3Ta7vRFDIE
         zjXjSrekcCZl5bBb3DzndBLlILnQTp81MIp7aDQjxsDn0J6WdPho7IgLKWESiPiEH825
         IuaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhh7iDYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bbb487si16781061cf.474.2025.02.06.11.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhh7iDYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80s-0008F9-Kt; Thu, 06 Feb 2025 14:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80P-0007Il-Qk
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:45 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80M-0000az-AO
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:45 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21f20666e72so28704665ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871861; x=1739476661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVdHJcWVaAi20haTkovecEqoGYD/V01LSIBrEcf/Szg=;
 b=nhh7iDYEXvkFxSCax80fRprZ+5Ne1972Mke9JYBkEirJIwAYuYYW9CxHeYhvCIU6Nr
 Xw5cZ6It0BIIDIJWxvvpDQDbnDbwMk5DI3bY04WrQmsA/tRkF6yEYSUy+2c/UdioVmJm
 Xg0ZyU1J90rmBV49H2ofLhXUz2/dDOjZQc/OB36L8anuVzzJZBTeNQgEOwhRzQPWYeo/
 zV1jDfTLwd6yFnipRGJFCzFu+/y3A982+iAJjDU0bzExKWr/QTlTawVIkXdgS2a0uwTe
 wLPgmC9QFPZKsWlBjtqc0jeqg6pOictNvQM0V3mTP1zxmPPKMzjlW4ClTzsYOcfwkcwX
 F9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871861; x=1739476661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jVdHJcWVaAi20haTkovecEqoGYD/V01LSIBrEcf/Szg=;
 b=FTIJ/rzc0HKwkPGufVzt2M1fnhoEBjlZPoc0Ktd6oDZiGuFk0ZityC+Yqg5mYiZm9M
 Rc00hIBl3AH7U75BTGUOK5qfb+DqCJOVToydO0GKn9hHxqzOiB1ntN5tn0Wl1W2qhcaG
 xooG5pTq+EPNKiprSqxlZR4z0YYMrWZ1rKo+wRuzXrpnO7U214YCn0GvtoY6cVfUYymJ
 euAGo/eoFLSd/rg2oYLYDGrJGUEAvCm6tefOL9/ySds+piMCXJIO6iAA2O8IyNwUxZ4s
 UnZ9lCLYrh3ark8FiQIDMAMBMAzc2dMVBhkhV60m6nYhPB6VKDPrJtZu7bqWosMQ2t+c
 MdRw==
X-Gm-Message-State: AOJu0YwYAfThKZAwZXJFm56rsJ+gBcCd1H4LSjiH5/hldQ8aWOG7f0j8
 DcGp7F3pltgUGjC6/OYtlYve+XIdefzAFKB+PkLaZaKRsVEXesYb8tOBNTiqgww=
X-Gm-Gg: ASbGncvfwcEzg8VjzmReLyNQQ5s8i9B6j2QODd3B6E/AJHSYsPOC/PPnXtTOLzPTaj7
 mp1MwWtkHuhTbHvfOSiTktJ7MlShkXGYUmsXgwQiIyqDdlRwnQ7RlrPXN5Tqx5e7t75EBez8qMW
 BJRfDGLVGlSUKWTbe65CyakmZcbQPs6Dgvsaj7a0mSKisLsLHZDlClwGhbA9Td78tRyZx9xfQNU
 HzeM/XIxkFZP+uIHcJIXHXBDT/UoG3n5EDUUEAeQcBdt6QfwtRpeR9sDDXsIVW4AuU0QcAZdX9q
 r8AIM6tyg/WFVx7k8k+geKUHdcu4C0n0pZjrigY1o3Bd6hg=
X-Received: by 2002:a05:6a21:3115:b0:1e1:c03c:b420 with SMTP id
 adf61e73a8af0-1ee03b415acmr1331056637.31.1738871860753; 
 Thu, 06 Feb 2025 11:57:40 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 32/61] target/arm: Implement SME2 FDOT
Date: Thu,  6 Feb 2025 11:56:46 -0800
Message-ID: <20250206195715.2150758-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bOi4ubi2gzzH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  5 ++++
 target/arm/tcg/sme_helper.c    | 44 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 18 ++++++++++++++
 target/arm/tcg/sme.decode      | 14 +++++++++++
 4 files changed, 81 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index cdd7058aed..ec93ff57ff 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -173,3 +173,8 @@ DEF_HELPER_FLAGS_5(gvec_fmaxnum_b16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fminnum_b16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sme2_fdot_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme2_fdot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index d973d83957..18b17e9fb2 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1122,6 +1122,50 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
     }
 }
 
+void HELPER(sme2_fdot_h)(void *vd, void *vn, void *vm, void *va,
+                         CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_maxsz(desc);
+    float_status fpst_odd, *fpst_std, *fpst_f16;
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    fpst_std = &env->vfp.fp_status[FPST_ZA];
+    fpst_f16 = &env->vfp.fp_status[FPST_ZA_F16];
+    fpst_odd = *fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (i = 0; i < oprsz / sizeof(float32); ++i) {
+        d[H4(i)] = f16_dotadd(a[H4(i)], n[H4(i)], m[H4(i)],
+                              fpst_f16, fpst_std, &fpst_odd);
+    }
+}
+
+void HELPER(sme2_fdot_idx_h)(void *vd, void *vn, void *vm, void *va,
+                             CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, j, oprsz = simd_maxsz(desc);
+    intptr_t elements = oprsz / sizeof(float32);
+    intptr_t eltspersegment = MIN(4, elements);
+    int idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    float_status fpst_odd, *fpst_std, *fpst_f16;
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = (uint32_t *)vm + H4(idx);
+
+    fpst_std = &env->vfp.fp_status[FPST_ZA];
+    fpst_f16 = &env->vfp.fp_status[FPST_ZA_F16];
+    fpst_odd = *fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t mm = m[i];
+        for (j = 0; j < eltspersegment; ++j) {
+            d[H4(i + j)] = f16_dotadd(a[H4(i + j)], n[H4(i + j)], mm,
+                                      fpst_f16, fpst_std, &fpst_odd);
+        }
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm,
                         void *vpn, void *vpm, CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index ec12bfd089..2885655cc5 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -844,3 +844,21 @@ static bool do_bfmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
 
 TRANS_FEAT(BFMLAL_nx, aa64_sme2, do_bfmlal_nx, a, false)
 TRANS_FEAT(BFMLSL_nx, aa64_sme2, do_bfmlal_nx, a, true)
+
+static bool do_fdot(DisasContext *s, arg_azz_n *a, bool multi)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 0, 0,
+                         multi, FPST_ENV, gen_helper_sme2_fdot_h);
+}
+
+TRANS_FEAT(FDOT_n1, aa64_sme2, do_fdot, a, false)
+TRANS_FEAT(FDOT_nn, aa64_sme2, do_fdot, a, true)
+
+static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                         a->idx, 0, false, FPST_ENV,
+                         gen_helper_sme2_fdot_idx_h);
+}
+
+TRANS_FEAT(FDOT_nx, aa64_sme2, do_fdot_nx, a)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 9850c19d90..a2b93519c4 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -285,6 +285,9 @@ BFMLSL_n1       11000001 001 0 .... 0 .. 011 ..... 11 ...   @azz_nx1_o3x2 n=1
 BFMLSL_n1       11000001 001 0 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=2
 BFMLSL_n1       11000001 001 1 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=4
 
+FDOT_n1         11000001 001 0 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=2
+FDOT_n1         11000001 001 1 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -322,6 +325,9 @@ BFMLAL_nn       11000001 101 ...01 0 .. 010 ...00 100 ..    @azz_4x4_o2x2
 BFMLSL_nn       11000001 101 ....0 0 .. 010 ....0 110 ..    @azz_2x2_o2x2
 BFMLSL_nn       11000001 101 ...01 0 .. 010 ...00 110 ..    @azz_4x4_o2x2
 
+FDOT_nn         11000001 101 ....0 0 .. 100 ....0 00 ...    @azz_2x2_o3
+FDOT_nn         11000001 101 ...01 0 .. 100 ...00 00 ...    @azz_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -351,3 +357,11 @@ BFMLAL_nx       11000001 1001 .... 1 .. 1 .. ...00 10 ...   @azx_4x1_o2x2
 BFMLSL_nx       11000001 1000 .... . .. 1 .. ..... 11 ...   @azx_1x1_o3x2
 BFMLSL_nx       11000001 1001 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_o2x2
 BFMLSL_nx       11000001 1001 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
+
+@azx_2x1_i2_o3  ........ .... zm:4 . .. . idx:2 .... ... off:3 \
+                &azx_n n=2 rv=%mova_rv zn=%zn_ax2
+@azx_4x1_i2_o3  ........ .... zm:4 . .. . idx:2 .... ... off:3 \
+                &azx_n n=2 rv=%mova_rv zn=%zn_ax4
+
+FDOT_nx         11000001 0101 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_i2_o3
+FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
-- 
2.43.0

