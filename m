Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3806591dye;
        Wed, 2 Jul 2025 06:18:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ9yDobr5jYECNY0H5GSFUjftNrQogiVbKr/9JHWLyKO83blU3nD4yk4WgHaEdfLhK1zfKa2xRuhZdpw==@linaro.org
X-Google-Smtp-Source: AGHT+IEt4H45QhMw6leoFgOgE5JKT7TLi85cJICSOpJ+HsKB/fwEQe0ffvSoLU9Nzm6LkzZ2eEjw
X-Received: by 2002:a05:6122:3486:b0:531:2afc:4630 with SMTP id 71dfb90a1353d-53457fd70f0mr1700951e0c.1.1751462329215;
        Wed, 02 Jul 2025 06:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751462329; cv=none;
        d=google.com; s=arc-20240605;
        b=JvIvSUF1FKNGdjiZS7RlM4cvDpEvZxkxZ1HbKCTYp1NlWgtSfS6uIsnVYVv3ZYSSYA
         +cS7Rlkap7v8Sp+GrwfhcVvTwbhPM6KHQHvznAM9DOZ69UgaZ3MUsfd+L7MtAyJ3xzvm
         zlTSK8L4JM/Bb1IZTmMCElHzft0YSdImKu1RHMOkkmol3uov4BBvHynF2nqLsrud2139
         70UINY+tH2ObwVe6ee4t7/8zk8s/zjcOWwYJ/bukl7rHMe77fEVvQJgEVhTSmJkpZbZT
         lUfykn/w9cIfZyO90wpACNmonfLG3TUnCdNKl1vqsXo7APeKR+kh7UJoNO0idMN6680P
         MN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=454RTOrw8TC7VQVVIssUwUl6tKgST/Sb4UUffRSR+TM=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=B4I4qn58BXntkgr16yYs8rwXTqy+hgCFpw/nq+UA9pXragN5r9LmmDvdJYYGJ2yjeK
         60AwbYCutSeTse4yPvStJhYL1aXN9cGEaI7d8NCcWiDZoTYSMjj/boPgdNpGGmYEWT9Q
         WZEUtm46xHfBxgMn0KkXXRylUnqMgNLxjzl+jnLG4xE2tsb5d3qEuvMK/AFNAwI5xWX2
         6z0WhwUH+tYP+VS/+LNlpc9FnOFziECv81JpR1yliQpspyFfAynnG4nTO225xdZyKYiz
         ArCZJE3w8JK+jYRiPnSkAPrk9//QPbBidayTQHGqcnJ+cXqDh2kGSToABE33rXaNN13u
         mTrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1209aiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4cb48bfbsi2859911137.369.2025.07.02.06.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1209aiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwm4-0006wB-1e; Wed, 02 Jul 2025 08:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjL-0004IH-Hj
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:32 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjD-00025T-9j
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:26 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ef8df09ce9so2161458fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459897; x=1752064697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=454RTOrw8TC7VQVVIssUwUl6tKgST/Sb4UUffRSR+TM=;
 b=Y1209aiYtT614xGe88l+4gQzTG8xOAd/V65ibQ5PfD58XgaHYrwI8CugT3i4ab7Nvb
 D/cyZXwDJ679SQAZoxu6C/UXOMmI2gcojA6PkvwHCOeNOgk5JB8a+TvsZ7KN79aUC4VS
 PoQiwSLzBIBkHNeLH12qQ8jh5niZ4VyUGA4S9oB9g32v+S03YHROi4miMxPj9ydsmrUp
 Kgrs/i08w+eKS6J8K3GQmjGu6bQMe/xpMztFHagN7ThZI7UEQNp4UgKajMA0l+nepn2L
 iPwuPs1av2TdsJel3+a6YypZKa/R9BaRqK4QhVfSLx8nsucVwuS3gGJ9jCZ1pqqRsz5T
 SwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459897; x=1752064697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=454RTOrw8TC7VQVVIssUwUl6tKgST/Sb4UUffRSR+TM=;
 b=lJuY9uKVeKhsiB0GBdw9sbKDdpeAzWy091rfQRIhYypb/ZbDzp7AfBCDxLJEthQBjc
 uM4TfuqD5Nj/qsSaBOQAPFpfwNqRtFLaEAGjyDDaINikXPghhKV+bkFJ2Hwity8YwtQV
 tMyyvJug2J3GsUFKgnQ7UkKv0bzUPYp6LwdNOmS6MqiIna62++zG6W52SpHQIvioMNdD
 3uejxKMOFDZzDjuKdXMiqd7eiyvzgSc2ADyl7IXp3H3cm03sfzEJqiz0GV36+bTX3Byb
 R60ikqR9kMY6QLXcTPICDiT+g0Bg+1RxhSYF2AxPWDw4fr4qMvq1qYaVzsk1Re4vfxCW
 sqow==
X-Gm-Message-State: AOJu0YwPpwlG0WUXEYNFlezpNnpFn5I73Ev9PcSmfAzer2i0Y2BEAp+G
 1ByIkXi5M92/HN827lnmj2hyChoCwZiDX6cJngmakZH9TccR06+U+ZZKQnBMnEKE2Ks=
X-Gm-Gg: ASbGncv16uSXwiV/Z9JldWll5/z3bY8I/q9MqKlG9p1ZsecJBrmkWb7K4g2pdrpR3Qx
 ZAGdJRc0Qq1TF4Hp/C6t44Q8iD9woFk9FJlvJE2t6FDvY8zXINjmXHhSdtUSg+J49VkONSRI8P6
 DtUVRqcSt2MBQYGvnPzpa1yUM1CKwohCJQa9nUU/CVWywBtVcnQ7jhYV3chkyU9SSwR8pA9/zXz
 kIOm6fy0LPabH4968i4nsl/2xLlfhaPYDHjwP2R2WOn4oFy5Iw3VGcz9En11/k9gq3rjmeVsO8o
 C++LrZ52Xvx+SWWntu3ov+XOIIsvExBniKkIPlEFKv1uUGVZY3jVkz52DR7ENYwvUS0PFstqZnt
 JyuNy
X-Received: by 2002:a05:6871:580a:b0:2d6:7266:a8d8 with SMTP id
 586e51a60fabf-2f5889014d1mr1942546fac.3.1751459896670; 
 Wed, 02 Jul 2025 05:38:16 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 51/97] target/arm: Implement SME2 SUNPK, UUNPK
Date: Wed,  2 Jul 2025 06:33:24 -0600
Message-ID: <20250702123410.761208-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: ymr7EZueRIIG

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
index 906d369d37..a7d282695d 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1730,6 +1730,44 @@ void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
     }
 }
 
+#define UNPK(NAME, SREG, TW, TN, HW, HN)                        \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch[SREG];                                 \
+    size_t oprsz = simd_oprsz(desc);                            \
+    size_t n = oprsz / sizeof(TW);                              \
+    if ((vs - vd) < 2 * SREG * sizeof(ARMVectorReg)) {          \
+        vs = memcpy(scratch, vs, sizeof(scratch));              \
+    }                                                           \
+    for (size_t r = 0; r < SREG; ++r) {                         \
+        TN *s = vs + r * sizeof(ARMVectorReg);                  \
+        for (size_t i = 0; i < 2; ++i) {                        \
+            TW *d = vd + (2 * r + i) * sizeof(ARMVectorReg);    \
+            for (size_t e = 0; e < n; ++e) {                    \
+                d[HW(e)] = s[i * n + HN(e)];                    \
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

