Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F74AC4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:53:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWm-00020I-0M; Tue, 21 Jul 2026 14:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUw-00016L-Jx
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUu-0006gZ-Qc
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:22 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so992877b3a.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659639; x=1785264439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eGbMR0aSKnypH9C761cx/29efStMBRI8uI8HtMSi64I=;
 b=Fn5/r9Y/mJBpTr6058Z+zK3mDNZP74hwTba44P5xjAWUv1bapFiADQAEfAaV/yf4xB
 iAyAzKM8BubRTbYSEKzo3aevHQxGtFgTuJcBHZ6hNuLf6IhzC3t+hPIA47ZCrk7T+zWw
 /V2loj0L9fdr10USQeP5pvSOHb266MSe8DE+Z5qO9tA2sREfaoAINyHkc4spPfq5o7dI
 Veru6zvI93AiqVTcEDxIYFEn84KTlCN9kVMQxHKs7AOP/EyfKQrN+m/82mDsXM8p3jkg
 PjZqR4vDFLmAA1kUnqMD6RXlchiEwQww/jKKPGFyzF6/XCeoIe4QE1It3WxI/x8bCd5y
 OB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659639; x=1785264439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eGbMR0aSKnypH9C761cx/29efStMBRI8uI8HtMSi64I=;
 b=aTM3vl1ZLwDhgF/C6R7JJXt0eoaWz5CyUnc+wSQc4BWReK1p5TcsILaziWfEnAsrkG
 wnPskh9gNl2kMyQeHvNxCA+sK1wFc7pSWfshLvJE5w1ic30vbHIgK1OC5JFY1ZVK7ZmM
 CZKqqcm8pn7xsPGImIrwmiOjnolV+/m3JUB82Ma2ut3lpD/In4YdroQkmn20ods0DGod
 EDYqsW+PMWfXRXzbfXpsxLupCLcpTvMANXVJ1pHjseeb38QJ3TIUE4r54x3FIsEHdUco
 zDnD9mzByuADYSGeBksT6t9DP6pOZEHOiwqcDPxiqO4mPjEYn/DNA8mLtA6S5OVO1nIG
 h8Gg==
X-Gm-Message-State: AOJu0YxTnkGpbnDY4K2/oh5Vs7R32aPc9OpfGS0CFhpzgtVoom2efMhz
 AB8RFBHzEPLTsbW27AhK7KyEe5PlMe0ZRemD5cKW7o3hKBiTqNSKg+fkZRnrjC7uT+wFqbw/qEC
 Jj53Q
X-Gm-Gg: AfdE7cnY5SYl0uSQdVLGCpXz+WcKcJlAonv5HG38QLZ1dDOE/PyVFTF7JlO1n+9csJR
 MbSB4AOmeqPLXdK8IVNyxFj/9QY39hzRYTZ/yOcBidmHCC2HwF96Cu7B8eIFEBdVsR3z4SRW5/P
 sKlLPB0p4MpFBI6DZNRyQ4HI9sifp4Gr/iLUVQNkKE8EOAv7JUzC0KtMk8WFZU460OMa8nHoDpt
 rJrEK8BsnyhG97ShzbUNsNDauWLxSfqhJuIC4jrGoEZBjggJcVnpJ+Z5DLPD19KZxOflJLKQARa
 KSThuTfn6ti6CabqIZ9Vgmri4TD87V8OkLuFSSE1ftLg6vuPAmYlQYRmROkmraEOnA3hds96QZ+
 mmx4UXsUie8JnChapsSW0ub0oJgWdmoHkmsHaOXFDMl04LOPg2JPtMHSOAVev75c1fGVnH6Ninr
 7342nlQtlplwZo78WpYw==
X-Received: by 2002:a05:6a21:c14e:10b0:3c3:bf10:419a with SMTP id
 adf61e73a8af0-3c3bf1044efmr17259965637.71.1784659639203; 
 Tue, 21 Jul 2026 11:47:19 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/20] target/arm: Implement AESD (indexed)
Date: Tue, 21 Jul 2026 11:46:52 -0700
Message-ID: <20260721184656.530230-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/crypto_helper.c | 47 +++++++++++++++++++++++++---------
 target/arm/tcg/translate-sve.c |  2 ++
 target/arm/tcg/sve.decode      |  3 +++
 4 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 9d71277b47..3719487754 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -463,6 +463,7 @@ DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesimc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(crypto_aese_idx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_aesd_idx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(crypto_sha1su0, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(crypto_sha1c, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 27b5813b6d..05f193b3d1 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -99,6 +99,23 @@ void HELPER(crypto_aese_idx)(void *vd, void *vn, void *vm, uint32_t desc)
     } while (s > 0);
 }
 
+static void aesd_kernel(AESState *ad, const AESState *st, const AESState *rk)
+{
+    AESState t;
+
+    /* Our uint64_t are in the wrong order for big-endian. */
+    if (HOST_BIG_ENDIAN) {
+        t.d[0] = st->d[1] ^ rk->d[1];
+        t.d[1] = st->d[0] ^ rk->d[0];
+        aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
+        ad->d[0] = t.d[1];
+        ad->d[1] = t.d[0];
+    } else {
+        t.v = st->v ^ rk->v;
+        aesdec_ISB_ISR_AK(ad, &t, &aes_zero, false);
+    }
+}
+
 void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -107,23 +124,29 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
         AESState *ad = (AESState *)(vd + i);
         AESState *st = (AESState *)(vn + i);
         AESState *rk = (AESState *)(vm + i);
-        AESState t;
 
-        /* Our uint64_t are in the wrong order for big-endian. */
-        if (HOST_BIG_ENDIAN) {
-            t.d[0] = st->d[1] ^ rk->d[1];
-            t.d[1] = st->d[0] ^ rk->d[0];
-            aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
-            ad->d[0] = t.d[1];
-            ad->d[1] = t.d[0];
-        } else {
-            t.v = st->v ^ rk->v;
-            aesdec_ISB_ISR_AK(ad, &t, &aes_zero, false);
-        }
+        aesd_kernel(ad, st, rk);
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(crypto_aesd_idx)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc);
+    intptr_t idx = simd_data(desc);
+    void *vm_idx = vm + idx * 16;
+    intptr_t s = opr_sz - 16;
+
+    do {
+        intptr_t base = ROUND_DOWN(s, 4 * 16);
+        AESState rk = *(AESState *)(vm_idx + base);
+        do {
+            aesd_kernel(vd + s, vn + s, &rk);
+            s -= 16;
+        } while (s >= base);
+    } while (s > 0);
+}
+
 void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5b6b66aaef..340ed7d975 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8334,6 +8334,8 @@ static bool do_aes2_idx(DisasContext *s, arg_rx_n *a, gen_helper_gvec_3 *fn)
 
 TRANS_FEAT_STREAMING_IF(AESE_idx, aa64_sve_aes2, aa64_ssve_aes,
                         do_aes2_idx, a, gen_helper_crypto_aese_idx)
+TRANS_FEAT_STREAMING_IF(AESD_idx, aa64_sve_aes2, aa64_ssve_aes,
+                        do_aes2_idx, a, gen_helper_crypto_aesd_idx)
 
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 64e0dd0eae..1ab1b4042b 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1985,6 +1985,9 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 AESE_idx        01000101 00 1 .. .10111010 ..... ....0   @aes2_2
 AESE_idx        01000101 00 1 .. .10111010 ..... ...00   @aes2_4
 
+AESD_idx        01000101 00 1 .. .10111011 ..... ....0   @aes2_2
+AESD_idx        01000101 00 1 .. .10111011 ..... ...00   @aes2_4
+
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
-- 
2.43.0


