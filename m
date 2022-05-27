Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1251052lfh;
        Fri, 27 May 2022 12:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrKhmhvOJjU5E5f5qmyoGwpO6Dw1FmAjHNY+cJrVI8NUtdEsHCYtaS/GfQZG6VrjlnTN8K
X-Received: by 2002:a05:6214:27c1:b0:464:2c1e:3feb with SMTP id ge1-20020a05621427c100b004642c1e3febmr3587451qvb.69.1653680958262;
        Fri, 27 May 2022 12:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680958; cv=none;
        d=google.com; s=arc-20160816;
        b=DpcTlOh1dQVuQbVfv+4Fm4z0wb2gaeEycKs6NlynglMWpXt1sfB+1y7RjL085sS03n
         iZMZAX2GgyRQlpnYCFUhn2NY2DZB0lFMXNDoQY/Kwq8AsabcgSz/8St9FQ5V7bkC62t4
         mz4HnZwEgItTRRyhwuCflTPYCV9fnYLoz9DDOnf+TyVU1CGb9MdqN9StngMoo21vO7c/
         CBexcKIcGZz1BG6TtZAqhy3Od7mU1Md/PcAh12HrA4LCFFaNlCELKA8Ach8bzaO8kd9I
         3+5yw2+ir5SdrdI7zPqKqKwJrJJzLHYUQNCnEVijHRFLB5pP81ceGCFGmrNX8cm/Xi4K
         FSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jenGXgth8/5lyJY0ppyuniUdVxk7NPlHkBbrEm55oI8=;
        b=eN1ZFKXCpuEQFf47PMAB09vwSTEFzg8oAP58UvkUuFv/G8c7z5A1iS0OSzsTG68hwr
         JuW2mV/uLega0hk1ZPqVbG7rOOjHdMMSQdJGx68/K+hLnbJvDKAbyfTn+F5cLmXXBHrb
         1Ctve1pUM9VaJfTPePSSv1+K7S8+vaB2TGJ4xjSqpwd2/smFJVbb7gFq/A+O1Zph5Oly
         WGmbLBw69O4u7p3PZ977Y+5U7iLnrjKYSf9Jblhg5GJtDP9p9b9l4glq8Q978nAv2iOx
         4DltYKhAg4dc8GWdqKI/Kl4jKfw1EDzQoY87uGTHrsbRjz5m6eVdhprBpNIYho98xAwe
         6kEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXCTCOqD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a056214076c00b0045aff883b7bsi2834343qvz.62.2022.05.27.12.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXCTCOqD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufxV-0006GC-Mr
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0001hc-12
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefP-0005JU-3u
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 c10-20020a17090a4d0a00b001e283823a00so1638426pjg.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jenGXgth8/5lyJY0ppyuniUdVxk7NPlHkBbrEm55oI8=;
 b=dXCTCOqD7WNzrjq56GrIpEOOloRD3k+fAhDmHqBMjCFlEYi6JKgQ9Kzjxgto5vyafO
 7ibDg2hBU+YJQETOi+DiXCjjyWXu3vpizRGhWOFblZR54boJV/jdMih0Zj/ECsjeKqdp
 9OrXz4muElDFQ3wnoZeqt+TKCA44XYsxr6WO8DzYtKlN37/qLho8wReuMUqxQZZ8t0Nq
 QJERmWNZe375QPVBYcOXgHvXO4cHLqj7N58cB1MsZyNMfhj5XQXA/z7BxMOdVZoLRlcS
 8mWOpzJha8K3EYhx1DPunYxPIw1f0CjY4RnxwDVWEvLc70oWXptwURLe5kXUbeULuPKn
 l/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jenGXgth8/5lyJY0ppyuniUdVxk7NPlHkBbrEm55oI8=;
 b=gIDR6iYl573elVLKN8HL3rSAH+LB4K5hkABnHqSHZ6YXuWe5QGmEjfXStoDRh3tntd
 lOvRaq9DMz6ooqHk+ueyUkhPsJ7M+pqGU8ETqn0xXKgkD7dkUnm5mOxhiVfk/McbD5lg
 EpDsBt35N0zLFc6oT0nLKvUodRadJ2xcukvlhrwSqSO6xZPwXPQ1KEJnfvyOF0281Ea6
 V7GP69IhqBTVkRx8g3AwD8Q4O4/VDXSk140TJV9XKK6pFpn/c0JqWujIGhMpMym+mI7f
 2gxKhwMBhFQdGVX0xNBh9yz9ESgAzxyKVH5mUYxqVTeVzvHGttVREmlEOyQefSEx8y/+
 wLaw==
X-Gm-Message-State: AOAM5324+phvp+m5sDJks8a9dEyBO8Au7f2O2JQayGXMbJ6RjWzrY9IK
 5Wa6SnQdTS2GYJxjzi+TKZ/imYJULatvyg==
X-Received: by 2002:a17:90a:8407:b0:1d9:ab62:bd3c with SMTP id
 j7-20020a17090a840700b001d9ab62bd3cmr9664269pjn.139.1653675989780; 
 Fri, 27 May 2022 11:26:29 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 087/114] target/arm: Use TRANS_FEAT for FMUL_zzx
Date: Fri, 27 May 2022 11:18:40 -0700
Message-Id: <20220527181907.189259-88-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OqrcrgjBNrS7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d596e7a027..29fcc8b014 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3557,25 +3557,13 @@ TRANS_FEAT(FMLS_zzxz, aa64_sve, do_FMLA_zzxz, a, true)
  *** SVE Floating Point Multiply Indexed Group
  */
 
-static bool trans_FMUL_zzx(DisasContext *s, arg_FMUL_zzx *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_gvec_fmul_idx_h,
-        gen_helper_gvec_fmul_idx_s,
-        gen_helper_gvec_fmul_idx_d,
-    };
-
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, a->index, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const fmul_idx_fns[4] = {
+    NULL,                       gen_helper_gvec_fmul_idx_h,
+    gen_helper_gvec_fmul_idx_s, gen_helper_gvec_fmul_idx_d,
+};
+TRANS_FEAT(FMUL_zzx, aa64_sve, gen_gvec_fpst_zzz,
+           fmul_idx_fns[a->esz], a->rd, a->rn, a->rm, a->index,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Fast Reduction Group
-- 
2.34.1

