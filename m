Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1788629njb;
        Thu, 6 Feb 2025 12:15:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpFO4zE/G0KyQTTmBEjOn+PxK33zzvJybBSB/+uYJGOMS73mCoMSd6PEl81H54vBo/7nlU52vHVWsVrg==@linaro.org
X-Google-Smtp-Source: AGHT+IH74uUe7eUTL8N1D4ePskT8KmZ6V4db3Z5723jmwrqcSuQHvB1FErodQctC/s83zxEGjOxg
X-Received: by 2002:a05:620a:4555:b0:7b6:67a6:5adb with SMTP id af79cd13be357-7c047bbae0bmr95971685a.21.1738872922620;
        Thu, 06 Feb 2025 12:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872922; cv=none;
        d=google.com; s=arc-20240605;
        b=BVpcA4ItkAnrkPyz+BC/46E6OJU+eRnOmZc7OlMhEgOouu745ytP2TSlH9uTkshv3I
         /W+2/sst+220U2JsjCYqOhLjHt1pJH+srym596z+cE/0VHN5pt2XQ/Xi3LcPKTvqUflq
         TNRgpP9ZoBSnpEkh6HGQQe+5jtkUTFdcDk0xA8eJGd1Pko+a1EJOdLAK6bnftt1xP/ra
         GSJcWxUtaWgbijDnpapsLp5BKSLhK9YDgjIGxE8s0RfTBZqlG9GKLous24/gE3Xnj+T/
         ZkH66EhaDH0rKmirWR9LHYmUAs7hNi5g+LIFOQioTK2IaJvXKSfoNkRAMlB3VRlg5SED
         qaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GUjKH3+SDXBjvgWKkf+9RI+hVAQ4Vq3op39/ZrATcMY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=cnJSTXBZlTjuRm+WXpJc+bIjCKvyqx3sLrGG5Nn2u69UjtMvQWexID1qVKDL9YH2fY
         Qwdp6QVUZfFT6hP8fX6/Tcp8Q1r7gn9uALpd+Osi8+JGwmUSjVJJpl/L0yJFnxDVSLtb
         zZLw44cHSVjz9a9ykWRQY2wu4K9i5DCVOdD3vTouZleVo2ZReXHBqcwnwfBIJNlQO7Zp
         IeD92r9zfBWHx9OhuwamAU0MHIkWF0ilUl9c0LMJUcL8XlQNxNntCHP6iaWlo70y8qlY
         x/35AjDAgj3xViL7cP1pERVm99IE2YDjyRZLALUK6IbuOqQF+MiAV+5/6dgkVJ9XQNm4
         3ILQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEUAfxUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb59fdsi176763485a.355.2025.02.06.12.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:15:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEUAfxUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg85R-0002Ew-Fj; Thu, 06 Feb 2025 15:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83p-0007xx-U0
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:20 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83i-0001AQ-If
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:17 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2f9b91dff71so2092927a91.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 12:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738872058; x=1739476858; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUjKH3+SDXBjvgWKkf+9RI+hVAQ4Vq3op39/ZrATcMY=;
 b=jEUAfxUhzblcIyJs0nNfU8VbT8QpucKJF55cO/ZBK/YQfqmOis4W+WmftOLo654Ueq
 cX3+eML4H3fxQ1Q0ze+HNHb9KHK7Ajj4HUUMpWwguyk4kBm1seUPr4HI4T8VTyYRPqnR
 aRNviLQdC8xPQ4LZ67eDUh8slycoTOVJU85A0u2XR4BrbiV9czNzXTHpzbiNwEf2u3Rn
 Ex0qvG+BIt+2BKnDl8yYB3KZX10IwNUafc43DMEF5nKCNOF62XfChrA2QeolJPwUGoTx
 7GwSLCcrJnJWGMnoOnJhVnRCMaOL5YhmABsCnJv/OX9dKyBra31hFp/T4td9feuJLhKG
 4qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738872058; x=1739476858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUjKH3+SDXBjvgWKkf+9RI+hVAQ4Vq3op39/ZrATcMY=;
 b=rhCrCbfutyadYy0KD/UE3Cs8G3EgBlDqLs/Q8QhXClcZnqCK6ZYyD+HKiXRDgbkj6z
 HWG+tJspzjaf8mmscDeDNs7wt/gC+QRw6i6R0z78QKziLv2I9AQEBArLYzgd985qProC
 szDSxtrvL/7F91qmpNhMlWOqDlXBymMOVtXbeJw4+r6G3RtyihwGJ/BJtP1EEiz8ilYQ
 udL6DKZyB3j3aZ1S3FRq57By47d0wOo0vi2+ilxt7JzaYazKftjJn7Er1hD2chYHn8kY
 WVQuuXHwB/eFsWOWQkOFh7pGCH0GOUZSOfx18v+LVuhQ0U5KTjYTqSmYlgaYExXhuig+
 AHJA==
X-Gm-Message-State: AOJu0YyFnLzQES69tqHoj1vEeKWQlubwu93YRNs9Fq5rDhr7ovaXx6lb
 UeCQZs4XMoHGN6j0V8Zuu9WI+b3cboFk+qmg2fx/ZKepcZUVdjda/vv9npqOz8Q=
X-Gm-Gg: ASbGncs64q52G8WsCf+PQpqBORE2+C25TR+hXjO6fdc8el0f8PRSwO0ZDE+JZOtu+X/
 FQ7Wcs5+iy4R1fo4K5ta0G/YAgRJL1bTHncktlBMt402wlMy4w/wzBEshI5+0VVS28D5Al1kFId
 9Rp4umHWWK8unTzXEIvWz3LFbfq1omqynY9vyBfQBRuvRzVW+PXprpx7L5WBO3mGgToMZxnkcnS
 RRNhlHLNvOceMPtNKRIlekhGlUhTCrDTy0Wz495ADYxKYFfIRjK3MuucE1xIAmDHd4Mh3zqxKCD
 rsrdHSo1n1NG2ZY7YaqGQh0Fli1qCDkQAK7pyt5cS3PUlb0=
X-Received: by 2002:a17:90b:2bd1:b0:2ee:dcf6:1c77 with SMTP id
 98e67ed59e1d1-2fa2417731bmr592015a91.16.1738872057012; 
 Thu, 06 Feb 2025 12:00:57 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee24sm1808857a91.36.2025.02.06.12.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 12:00:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 54/61] target/arm: Implement SME2 SUNPK, UUNPK
Date: Thu,  6 Feb 2025 11:57:08 -0800
Message-ID: <20250206195715.2150758-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: WkPcmLarEFJm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 13 ++++++++++++
 target/arm/tcg/sme_helper.c    | 38 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 16 ++++++++++++++
 target/arm/tcg/sme.decode      | 18 ++++++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 7ae3fd172d..3d3eb393b3 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -238,3 +238,16 @@ DEF_HELPER_FLAGS_3(sme2_sqcvtun_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
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
index a9adc8589f..cf4f09dbc4 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1676,6 +1676,44 @@ void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
     }
 }
 
+#define UNPK(NAME, SREG, TW, TN, HW, HN)                        \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch[SREG] __attribute__((uninitialized));  \
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
index ec88a91cf1..9d7a10aa6b 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1347,3 +1347,19 @@ TRANS_FEAT(SQCVTUN_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtun_sb)
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
index 491c6231ea..1da64c5258 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -733,6 +733,8 @@ FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
                 &zz_n n=2 zd=%zd_ax2 zn=%zn_ax2
 @zz_4x4         ........ ... ..... ...... .... . .....      \
                 &zz_n n=4 zd=%zd_ax4 zn=%zn_ax4
+@zz_4x2_n1      ........ ... ..... ...... .... . .....      \
+                &zz_n n=1 zd=%zd_ax4 zn=%zn_ax2
 
 BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
 BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
@@ -781,3 +783,19 @@ SQCVTUN_sb      11000001 011 10011 111000 ...10 .....       @zz_1x4
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

