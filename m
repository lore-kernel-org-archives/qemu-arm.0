Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1267295dyc;
        Fri, 4 Jul 2025 07:52:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXS3ZSgUYcaRB+6PFiFBr2vCvYtZ5lEGlU+nYjsI+bW2VvPNXPjNlJre45wN7YG7JdOkiH9VyNiyjsu/A==@linaro.org
X-Google-Smtp-Source: AGHT+IEnL3RXDDoqickU2pjNb7mPHEqzGADSXYW7w29NRicpApMCngHjdFLktc959qKdfRgEHwdQ
X-Received: by 2002:a05:622a:a95b:b0:4a9:72e8:9346 with SMTP id d75a77b69052e-4a9a078758amr16985171cf.41.1751640743380;
        Fri, 04 Jul 2025 07:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640743; cv=none;
        d=google.com; s=arc-20240605;
        b=Nwiv97OGIm9ju4deKGCkKrFJeR+gtEkuDq6KQzs0cUZdKkxZ0Ak6gSeX+GPURtZjum
         76McZvCCKfC4bvvcZLN20QI3sEUa6pb/wsrtesoKaxx8j4+5G/ZZiarncRi9SOzb9FFx
         +MUaEI/iKjEM/atVH3FS9P/R/4PT51Sp2amv4lI/kdjdT/Pm7wQ6+UoGAdpp/dcHiSqf
         LDhqVXSlfzjb8eTfZ796gssioP+S2mWkgsytbcr76Sn+7h6EQLj249rxgPJRZGTUp51j
         8scsu4iV4O3WK8rVwt+sZM0rL0PZqvta9GTJlWLwbT+MpIJh+ZaUCteghJMT5SI67SmX
         yAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tf60mUQtgR/yZMmICL9C93f1NUzvXbd+D0K+j9YzN7Y=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=RVCj3Mlih5NGEIGTJsGDF8eZWJfFXJUg4cAaAHsH3uiru/FH1qhqqM34mDpNMH9mOo
         +ZJpgWMGObPy86Aguqo6x8zzDhkAApvilpt/VsmyYsDXScE5EkeL3lkQJjgSPnGeDsvu
         BlRFNYosnvhAmjNrM8UUVniiDlv/XbVdYB6SXMwIr1h5XXnPRMYi6diAalk/n+tpSMGi
         lqTCqkrl78mgQNhb8k2UOJlpD4EFLoi/ycZdyGGQI6Vr57gdmh3ZtvwY11bROESA8X15
         nWzJCbqA75mFuIsz9vYsvZm91QmAIa172WzAOA2y12DpuQJq4vVsruSer2ONmWzu/LFu
         hpYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FQDd99Nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f4502si22210781cf.44.2025.07.04.07.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FQDd99Nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhRS-0006kr-Pp; Fri, 04 Jul 2025 10:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLz-0004D4-P0
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:31 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLt-00081h-Gg
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:25 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6114114daddso500658eaf.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639120; x=1752243920; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tf60mUQtgR/yZMmICL9C93f1NUzvXbd+D0K+j9YzN7Y=;
 b=FQDd99NnLkjam5+8HKs211vB45ieYJHWGkHWhis9we8alZYFPb4J7izWCuZVQHFvTz
 IcE1F7sICaEOyp6aKLqo6F8+3Z4xheY3/1MVniqiaekhcwleK/k5OCtNZtSoaHA+Vjnr
 Sq4+VixwZ3DoMq1QxY/YMSxE57VnOFCpa6T/3Afy5ICJTadBYSrBLef6W2donCdOjaJd
 b6/+NWsog3mfUIFW1vpHlqXY98wn9te8kR3mVGDi4pGD5Y22cxdFnpdn+fc5bC0lfhxc
 XeFyURr/u1dF2FFjU5DAL113A86oKMdv6S1VILSGW+3zoILjnzHmbo3+Zdcpl1B6oky1
 YJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639120; x=1752243920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tf60mUQtgR/yZMmICL9C93f1NUzvXbd+D0K+j9YzN7Y=;
 b=CddICMB+aWzxfryDRskwu58VmUlmCfOGc4kkxCLSkIlFGMEfZzEaO6t7bWbHY/Nn3a
 x8tZxg7mGC6AB8PD7BWPzKeK8setqK7O9KV34eShwHqZVuzvBNnLDj0wx2EA6OVIxLgD
 fMKSds24SaxEoVmyQmbDwTTNEqtjQmJbv1cQv8w4dxIOKJNwtOY+piCGLysnqgLNjbRa
 +g7eTGjxPL2xnxFyaPMqOQRDMl4E8IrgocQlgIxZl30ohuPZUmvrFy6lJ/Bfq3IWvtgR
 aALrr9eh755C/KAnUpM9nZ+Hw8HsefR0ICLTvQY6Vf0ohmoEFlU02j/OWxPVPgSMxyas
 4f0g==
X-Gm-Message-State: AOJu0YwvaxhiHcH3MAoF1s61OukCR+sGgy4iaZ3mEw0K/J8On5xn7ee5
 bE7/wBX2c0F0qeoFn2GW/0Xs92iSQIYB+vzIobPkCbATO5dOUY9feL2cjw1wLTk7ioSK5Fq32r7
 /ZaORf1A=
X-Gm-Gg: ASbGncugKdglB+Ui0+MRottiXNq8WW/69BbFEwfZLqg875ta6zZhu55k8Iul18e3hI4
 wRdLgvs09u8b3aYbPGLpw+xcJVuhon7rvbxkE7OOZ3oQ7uVxRuOEwrH72iMnuriuVm1VldaUZh8
 RJ6eaJNnv2HyUF8M9mKn4DuiavGLwZ1cvcDvFTAhuL2GvyVmzjlUNjl6/eQPYjlBxO6ajL1C+J4
 rgsrcQqCyStVhy2Cn2X3x40BP5LP4ghu0skRifXM2ryUiiaJBj9+KQiWkJ1DBhZGXmKNu5l+63i
 8v3FvHkQBKgzZIW8AaTxUAy0GaZzjQnZRrYMb0izXWkl6vLyWjl6G7Bfs9VuyBOjkx0dXA2ixAQ
 Zzs44ohR/UQiHDdARfydJxP3Q1QlDYEesmi5qFMkxHucfpCv8
X-Received: by 2002:a05:6820:188a:b0:611:a921:bfef with SMTP id
 006d021491bc7-6138fdea0f0mr2095483eaf.8.1751639119909; 
 Fri, 04 Jul 2025 07:25:19 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 061/108] target/arm: Implement SME2 SUNPK, UUNPK
Date: Fri,  4 Jul 2025 08:20:24 -0600
Message-ID: <20250704142112.1018902-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
X-TUID: 5UMq110xWEwG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 13 ++++++++++++
 target/arm/tcg/sme_helper.c    | 38 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 16 ++++++++++++++
 target/arm/tcg/sme.decode      | 18 ++++++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 792b993695..893b23aa3b 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -241,3 +241,16 @@ DEF_HELPER_FLAGS_3(sme2_sqcvtun_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_sqcvtn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uqcvtn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_sqcvtun_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sme2_sunpk2_bh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sunpk2_hs, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sunpk2_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sunpk4_bh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sunpk4_hs, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sunpk4_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uunpk2_bh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uunpk2_hs, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uunpk2_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uunpk4_bh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uunpk4_hs, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uunpk4_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 094a1e57f3..ee4596e066 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1737,6 +1737,44 @@ void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
     }
 }
 
+#define UNPK(NAME, SREG, TW, TN, HW, HN)                        \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch[SREG];                                 \
+    size_t oprsz = simd_oprsz(desc);                            \
+    size_t n = oprsz / sizeof(TW);                              \
+    if (vectors_overlap(vd, 2 * SREG, vs, SREG)) {              \
+        vs = memcpy(scratch, vs, sizeof(scratch));              \
+    }                                                           \
+    for (size_t r = 0; r < SREG; ++r) {                         \
+        TN *s = vs + r * sizeof(ARMVectorReg);                  \
+        for (size_t i = 0; i < 2; ++i) {                        \
+            TW *d = vd + (2 * r + i) * sizeof(ARMVectorReg);    \
+            for (size_t e = 0; e < n; ++e) {                    \
+                d[HW(e)] = s[HN(i * n + e)];                    \
+            }                                                   \
+        }                                                       \
+    }                                                           \
+}
+
+UNPK(sme2_sunpk2_bh, 1, int16_t, int8_t, H2, H1)
+UNPK(sme2_sunpk2_hs, 1, int32_t, int16_t, H4, H2)
+UNPK(sme2_sunpk2_sd, 1, int64_t, int32_t, H8, H4)
+
+UNPK(sme2_sunpk4_bh, 2, int16_t, int8_t, H2, H1)
+UNPK(sme2_sunpk4_hs, 2, int32_t, int16_t, H4, H2)
+UNPK(sme2_sunpk4_sd, 2, int64_t, int32_t, H8, H4)
+
+UNPK(sme2_uunpk2_bh, 1, uint16_t, uint8_t, H2, H1)
+UNPK(sme2_uunpk2_hs, 1, uint32_t, uint16_t, H4, H2)
+UNPK(sme2_uunpk2_sd, 1, uint64_t, uint32_t, H8, H4)
+
+UNPK(sme2_uunpk4_bh, 2, uint16_t, uint8_t, H2, H1)
+UNPK(sme2_uunpk4_hs, 2, uint32_t, uint16_t, H4, H2)
+UNPK(sme2_uunpk4_sd, 2, uint64_t, uint32_t, H8, H4)
+
+#undef UNPK
+
 /* Deinterleave and convert. */
 void HELPER(sme2_fcvtl)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index dd1a6668fb..b45e68750d 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1419,3 +1419,19 @@ TRANS_FEAT(SQCVTUN_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtun_sb)
 TRANS_FEAT(SQCVTN_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtn_dh)
 TRANS_FEAT(UQCVTN_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uqcvtn_dh)
 TRANS_FEAT(SQCVTUN_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtun_dh)
+
+TRANS_FEAT(SUNPK_2bh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sunpk2_bh)
+TRANS_FEAT(SUNPK_2hs, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sunpk2_hs)
+TRANS_FEAT(SUNPK_2sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sunpk2_sd)
+
+TRANS_FEAT(SUNPK_4bh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sunpk4_bh)
+TRANS_FEAT(SUNPK_4hs, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sunpk4_hs)
+TRANS_FEAT(SUNPK_4sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sunpk4_sd)
+
+TRANS_FEAT(UUNPK_2bh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk2_bh)
+TRANS_FEAT(UUNPK_2hs, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk2_hs)
+TRANS_FEAT(UUNPK_2sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk2_sd)
+
+TRANS_FEAT(UUNPK_4bh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_bh)
+TRANS_FEAT(UUNPK_4hs, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_hs)
+TRANS_FEAT(UUNPK_4sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_sd)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index e005f6e6ed..38c210cd4f 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -734,6 +734,8 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
                 &zz_n n=2 zd=%zd_ax2 zn=%zn_ax2
 @zz_4x4         ........ ... ..... ...... .... . .....      \
                 &zz_n n=4 zd=%zd_ax4 zn=%zn_ax4
+@zz_4x2_n1      ........ ... ..... ...... .... . .....      \
+                &zz_n n=1 zd=%zd_ax4 zn=%zn_ax2
 
 BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
 BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
@@ -782,3 +784,19 @@ SQCVTUN_sb      11000001 011 10011 111000 ...10 .....       @zz_1x4
 SQCVTN_dh       11000001 101 10011 111000 ...10 .....       @zz_1x4
 UQCVTN_dh       11000001 101 10011 111000 ...11 .....       @zz_1x4
 SQCVTUN_dh      11000001 111 10011 111000 ...10 .....       @zz_1x4
+
+SUNPK_2bh       11000001 011 00101 111000 ..... ....0       @zz_2x1
+SUNPK_2hs       11000001 101 00101 111000 ..... ....0       @zz_2x1
+SUNPK_2sd       11000001 111 00101 111000 ..... ....0       @zz_2x1
+
+UUNPK_2bh       11000001 011 00101 111000 ..... ....1       @zz_2x1
+UUNPK_2hs       11000001 101 00101 111000 ..... ....1       @zz_2x1
+UUNPK_2sd       11000001 111 00101 111000 ..... ....1       @zz_2x1
+
+SUNPK_4bh       11000001 011 10101 111000 ....0 ...00       @zz_4x2_n1
+SUNPK_4hs       11000001 101 10101 111000 ....0 ...00       @zz_4x2_n1
+SUNPK_4sd       11000001 111 10101 111000 ....0 ...00       @zz_4x2_n1
+
+UUNPK_4bh       11000001 011 10101 111000 ....0 ...01       @zz_4x2_n1
+UUNPK_4hs       11000001 101 10101 111000 ....0 ...01       @zz_4x2_n1
+UUNPK_4sd       11000001 111 10101 111000 ....0 ...01       @zz_4x2_n1
-- 
2.43.0

