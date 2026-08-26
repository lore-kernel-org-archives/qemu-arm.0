Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F105AC61DC4
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:44:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHds-0008Uq-GY; Wed, 26 Aug 2026 13:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdp-0008RP-1r
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:25 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdm-0004kT-Ik
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:24 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8487214ad2bso1588591b3a.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766141; x=1788370941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SA8NuNbPWvaRSZTQw5oEPqkYFFMVFwD+KRwGTdCfjnk=;
 b=vYdpk1kOfW/jq5olksVv1jcjScgRHVb4iUmoTjCrPMEllbXDXcdhPXNkPXvWEramwN
 OSJftVTFgAl9dFpHoL6OS9kymI/oavLY9928j0IoWDcd5LmmM/mOnVacacPAbqgnLHjO
 DllZsgfJaBSiVNdaRURwgH9BYpLer9anr8i/6eUlC3mEg+m+DYAAxqxY0/1H7wD2ch9S
 4ar4AH7oQ5ZdIbzMdY4dNDUaMeekQkAGCOKG6U6trPwSWUxSZFIn67TR8hpU97USxj09
 hkzCH4KnelWnxPBe4Y4AE9vgC3BZDM3C3qlCmoHLKQ+4ct66PKMbppBx9ib3RDhGiReu
 fYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766141; x=1788370941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SA8NuNbPWvaRSZTQw5oEPqkYFFMVFwD+KRwGTdCfjnk=;
 b=AAiNUlTal7WUa50MCQhdoTjOHpnmN0X/1vbaYTu0G1OPLOxAo3ulTSulwDI8baAXVe
 HmGS6yixEoSaBP/TYqHlzWgg2P9n8zyk7yYzxI92os1A4tF4Rt59NxjlPkKdQXVg49pL
 axkDILDIk69IWaxq6bJGqJGjwzfRhXYEDOHNKZV/MIHrTA6v63kSOzdbRpqxA68xdDFn
 U3p36TX2u3gVUzFbffywd9Rbq+IhDzmElQ0ukfuCdP4qz9DPu3CZ50FmPYwi9jCzSGrC
 HJzcjStE7HspSuCiw0psyAcGVNvq7/0cyhotKdM77s4mdUJyBJSZy+xd7iN2aB1HzLme
 ChFw==
X-Gm-Message-State: AFuF++nnW+Kp8rYRCQBmn1vhZAKgLGpaR3tSlzEkSry6/7hTJjKDt4kV
 pLrQgyW8TnAFJ9WyOWJOFyOUO6QaO2xcCwBMVnNIZcGs+kxaP2JUE/RKQYB6EUmd8T8=
X-Gm-Gg: AR+sD10HEhOQUoHvk/iI2H5aq5/X9seeuDGefpcISLbmmLmkFdhwlPHYx3OXDkpY4CE
 rY4YtBBrnVd3y12d66eUceKmjEnH8e6Ll7t8iyhi9hyjq4QDSn7uTq0yiF8dteMuJial82mI/Dh
 sts+nflC95XupHG9s22zDIzjo5C2wOfrPOa7A9X2I7gkt47uS96ng8HDAg7gyM3DbV1+4dROO8y
 4hE2uH6LcLFomF2l/yfa9gIWdW5otnlyCm7UYDigNwjIqJdpW6DMidUPEKh9Uzs8uHvWb5Zzile
 dMyAgcGOT7XmaP93+qZLAo5m7WWT7dGCn15MmqZsefhh0gRj9P75SHmTpUfsD2ep4AqfqGUcOih
 YnrIegi6hbDVAb4/Z7s9yA/G0JKbm8YKc9aIWft7s4oyLBsD1FfrkUHKAz1C3cEzeOlMEZi+dPf
 i8Qj2le4RL6YQsUJ0d3dCGGHyos9OWfwSK6THzm26PsB1eGgJLQOxMA4HdEaNZK7N0vR+QqMOkQ
 MQpgzxe9rnlYCSI7A==
X-Received: by 2002:a05:6a20:2587:b0:3cd:99d2:d534 with SMTP id
 adf61e73a8af0-3cf7576c442mr15885012637.3.1787766141003; 
 Wed, 26 Aug 2026 10:42:21 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/25] target/arm: Implement FMUL (multiple/multiple and
 single vectors)
Date: Wed, 26 Aug 2026 10:41:51 -0700
Message-ID: <20260826174213.614571-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 target/arm/tcg/translate-sme.c |  9 +++++++++
 target/arm/tcg/sme.decode      | 15 ++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index db1950f407b..463754b057f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -891,6 +891,15 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[4] = {
 TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_zzz_n1_fpst, a, f_vector_fscale[a->esz])
 TRANS_FEAT(FSCALE_nn, aa64_sme2_f8cvt, do_zzz_nn_fpst, a, f_vector_fscale[a->esz])
 
+static gen_helper_gvec_3_ptr * const f_vector_fmul[4] = {
+    NULL,
+    gen_helper_gvec_fmul_h,
+    gen_helper_gvec_fmul_s,
+    gen_helper_gvec_fmul_d,
+};
+TRANS_FEAT(FMUL_n1, aa64_sme2p2, do_zzz_n1_fpst, a, f_vector_fmul[a->esz])
+TRANS_FEAT(FMUL_nn, aa64_sme2p2, do_zzz_nn_fpst, a, f_vector_fmul[a->esz])
+
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
                       GVecGen3FnVar *fn)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index e1bef9987b0..60c7cacc10e 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -219,6 +219,8 @@ UMOPA2_s        1010000 1 10 0 ..... ... ... ..... . 10 ..      @op_32
 
 %zd_ax2         1:4 !function=times_2
 %zd_ax4         2:3 !function=times_4
+%zn_ax2         6:4 !function=times_2
+%zn_ax4         7:3 !function=times_4
 
 &zzz_en         zd zn zm esz n
 
@@ -288,6 +290,11 @@ SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
 FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_2x1
 FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
 
+FMUL_n1        1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2
+FMUL_n1        1100000 1 esz:2 1 zm:4 1 111010 ...00 ...00 \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4
+
 ### SME2 Multi-vector Multiple Vectors SVE Destructive
 
 %zm_ax2         17:4 !function=times_2
@@ -361,6 +368,11 @@ FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
 FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_2x2
 FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
 
+FMUL_nn        1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2
+FMUL_nn        1100000 1 esz:2 1 ...01 111001 ...00 ...00  \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4
+
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
 &azz_n          n off rv zn zm
@@ -521,9 +533,6 @@ FDOT_n1_hb      11000001 001 1 .... 0 .. 100 ..... 01 ...   @azz_nx1_o3 n=4
 
 ### SME2 Multi-vector Multiple Array Vectors
 
-%zn_ax2         6:4 !function=times_2
-%zn_ax4         7:3 !function=times_4
-
 @azz_2x2_o3     ........ ... ..... . .. ... ..... .. off:3  \
                 &azz_n n=2 rv=%mova_rv zn=%zn_ax2 zm=%zm_ax2
 @azz_4x4_o3     ........ ... ..... . .. ... ..... .. off:3  \
-- 
2.53.0


