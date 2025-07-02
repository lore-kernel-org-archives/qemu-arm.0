Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3802430dye;
        Wed, 2 Jul 2025 06:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV98pft5YF1KH0ncnb24pcgL1lvopuHZMv8nc+fxKWpyUf0+vCl8troNqynHTsLfXJgFglLWd+QjDyepQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHbdn2mShmlVb4H7Qit/EaNnwpB3GNgVqQbjo8UYAjIm/J/PKC3t1UXnb85t9FwTlI142wI
X-Received: by 2002:a05:600c:a086:b0:450:d568:909b with SMTP id 5b1f17b1804b1-454a36fbdd6mr31517785e9.14.1751461981607;
        Wed, 02 Jul 2025 06:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461981; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0Ds6EHEPrXie+sHjh5BXlkSpc81fAHDgSZqk3YDQU7QFlTfVYldlJ3ka5N/Hi8TCD
         VtSIs3LnsF5VhoaBxkRs4EU3omq36kdUQtKsFiFEhP5GvYylx5PLWf7Y5H3fgINeQnsj
         heONxcB/92ZLZtSDRfHU1cZcXhEK4pf0qywmNEWtPmG1n6GRaeJuQxLxAPtIydf+qada
         fxoM9Vc8RwGvdq07VO3QPVeDT32YncSxH3LQGrXN3LlQZaMRh7s/e+vNoTwtIGaihAdq
         jtML8TnYwyjBUc3EN5RDYFUuDjKX6xKCz5jWUJHcR8tCNkM/c+FwWPVIdHQS+HgRx0nT
         UuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZW5ZQQmdbfswXGecma+4/2R/EatacCWoSALlXr8oeFs=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=kakZmZgCn+CeLGUw8GxbVZ+OqrZlY0AP0w+yuAXLZJMx4BIQn8NN77h/4yiHyAAxHC
         qEbA4dj5IQZeB2W1Qj2GjA4XAn8zzUX64qbRqNhjEV62TLzLLcbihesWfiPlNeK0mwWo
         0d3Xh3RhBWD32tpb53HuFf0p8glLA+yV+R+zymGrvZ3qAenrep1H3WOFnayiwHm5GsQ2
         wI1Pka98t/TL2VBMslExDAg0mE9g489PYR9d/1U/enberbLNWm2V6lPMKgZxVg56LjVk
         2+YHeo5Fe+cvb3oQN6vX1Y17xF08jMOa9CP1oRmUDwmWYbreKfd37hEasuCK1Iilk5Ng
         QAIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v1PQBAEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-45382349e2asi136023425e9.20.2025.07.02.06.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:13:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v1PQBAEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwqK-0006Sc-Fw; Wed, 02 Jul 2025 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn1-0008Sr-7H
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:17 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwmn-00036n-2Y
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:07 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2eaf96c7579so2850453fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460117; x=1752064917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZW5ZQQmdbfswXGecma+4/2R/EatacCWoSALlXr8oeFs=;
 b=v1PQBAEifyrAw2J1/IfRjPyDKdgNHiwwr3Uonv3KljrW3wHaN4DBJ1bQJB93Cn60QH
 tN+yxWN2qKzFa2pg59JK4y3TTtjboOLIjdH4QWBztLuD5FMjMWkFZ46Oc3KVXyZhA30N
 dpO3Yhy0cvsDwuiTMIiBJWZqarNJNdh73U7XDcvp49kCHld798cOdBgRSDSzkSrjHmLj
 PJtcnWGnkEmV9QFf8AO6mfdBpun62P9GY0miGaDXC5a8EOyzAj6SNH+IXjUriJyVFKGd
 UiY67UshEgpvnwGISK1oUPkliU2xSNosoCurttpEGMaflPzDrL2lrdLYhTQYLCvcdn+d
 EO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460117; x=1752064917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZW5ZQQmdbfswXGecma+4/2R/EatacCWoSALlXr8oeFs=;
 b=A1gA6J9ZkmVZn4sWDHzWD8y9P/bqL6P6wr3IwUY5Mu5K5OrsbSWZ3wHJcse/1ccod4
 //v19r1PF3To2w2RApgeeT5FN0n2R2yQ81W0ZPCsdxhTdPH3953wUr6zm/xw+xLwKvzt
 Jf618TM5OGTuS5/qEQ0ZBXv2U7K4n9jFLAaMpamUl2TRqJobtTVcpj/0j9K6yqdUkLpy
 mMoScC8zIyKyZuJXJFBtLQ6+Z41yQnXSxAScHrweIJHcWC+0lxyxGSRVTOpa4A5O7ZuK
 kaElZMxCMCS+mjIbvAH4ZdrtSkfgIpKnxr/kIoftzxw9wZWHMCHZ71tT3sk4fU2JY5Xj
 z+YA==
X-Gm-Message-State: AOJu0YxxTN5/l8eoaVrJmJhih7CsJH+D3Rbf1FK2I7BvlkQ3izuE6VC8
 4epWPuBB3fVZA5yJBZxSj7pvvnBX6Xzd5AgM6EvC0R4iC1uRhLo8gx7lduzwOHd2PMSWz+uedBp
 qTwoKWHU=
X-Gm-Gg: ASbGncsOqAEMgo3uv4GvwwrGeh7U35IrEdg7Kx/Kcc7R5kWWym6ZDctZmzI2yatdaB1
 1KBUuVO5StBI53gWU9NDmnFQTPmsTIuOht4154HPFRUgShynv/D9Zd5hKQArVE1TZTgaQMqR0Tj
 O1B+2ge/Qbqbvc2aQTQnxXT3Jsv2N1Xh0YLaU23wC7z3jR9rIIpdzg7G6yyc5UfdUa3g0GVHvUg
 9MZ3K3nNLRb46pL6SzqxlkTOVGjXmi/xafIr/hYKjfc+bq/0BY3ptZ1p/8pB2ijlbc5slcBtn7c
 tTFwsESIUzc+XYTP5FblXnKVaK9QdmYs4xL++0jLLkxB5xPixTYK08j9sUjkAZbmQ/IbNw==
X-Received: by 2002:a05:6870:1655:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2f5a8d3d508mr2099711fac.30.1751460117418; 
 Wed, 02 Jul 2025 05:41:57 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f7d89sm3907004fac.34.2025.07.02.05.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:41:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 81/97] target/arm: Implement TBLQ, TBXQ for SME2p1/SVE2p1
Date: Wed,  2 Jul 2025 06:33:54 -0600
Message-ID: <20250702123410.761208-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
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
X-TUID: JZQqyOldXeE5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 10 ++++++++++
 target/arm/tcg/sve_helper.c    | 10 ++++++++++
 target/arm/tcg/translate-sve.c | 14 ++++++++++++++
 target/arm/tcg/sve.decode      |  3 +++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 0f510ea610..5f4b4aa036 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -676,11 +676,21 @@ DEF_HELPER_FLAGS_5(sve2_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2p1_tblq_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_tblq_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_tblq_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_tblq_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_tbx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_tbx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_tbx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_tbx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2p1_tbxq_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_tbxq_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_tbxq_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p1_tbxq_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_sunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 0fc602fb12..c45d36433c 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -3844,6 +3844,16 @@ DO_PERSEG_ZZZ(sve2p1_zipq_h, helper_sve_zip_h)
 DO_PERSEG_ZZZ(sve2p1_zipq_s, helper_sve_zip_s)
 DO_PERSEG_ZZZ(sve2p1_zipq_d, helper_sve_zip_d)
 
+DO_PERSEG_ZZZ(sve2p1_tblq_b, helper_sve_tbl_b)
+DO_PERSEG_ZZZ(sve2p1_tblq_h, helper_sve_tbl_h)
+DO_PERSEG_ZZZ(sve2p1_tblq_s, helper_sve_tbl_s)
+DO_PERSEG_ZZZ(sve2p1_tblq_d, helper_sve_tbl_d)
+
+DO_PERSEG_ZZZ(sve2p1_tbxq_b, helper_sve2_tbx_b)
+DO_PERSEG_ZZZ(sve2p1_tbxq_h, helper_sve2_tbx_h)
+DO_PERSEG_ZZZ(sve2p1_tbxq_s, helper_sve2_tbx_s)
+DO_PERSEG_ZZZ(sve2p1_tbxq_d, helper_sve2_tbx_d)
+
 #undef DO_PERSEG_ZZZ
 
 #define DO_TRN(NAME, TYPE, H) \
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 4ed0fe0480..cf8497a388 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -2380,12 +2380,26 @@ static gen_helper_gvec_4 * const sve2_tbl_fns[4] = {
 TRANS_FEAT(TBL_sve2, aa64_sve2, gen_gvec_ool_zzzz, sve2_tbl_fns[a->esz],
            a->rd, a->rn, (a->rn + 1) % 32, a->rm, 0)
 
+static gen_helper_gvec_3 * const tblq_fns[4] = {
+    gen_helper_sve2p1_tblq_b, gen_helper_sve2p1_tblq_h,
+    gen_helper_sve2p1_tblq_s, gen_helper_sve2p1_tblq_d
+};
+TRANS_FEAT(TBLQ, aa64_sme2p1_or_sve2p1, gen_gvec_ool_arg_zzz,
+           tblq_fns[a->esz], a, 0)
+
 static gen_helper_gvec_3 * const tbx_fns[4] = {
     gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
     gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
 };
 TRANS_FEAT(TBX, aa64_sve2, gen_gvec_ool_arg_zzz, tbx_fns[a->esz], a, 0)
 
+static gen_helper_gvec_3 * const tbxq_fns[4] = {
+    gen_helper_sve2p1_tbxq_b, gen_helper_sve2p1_tbxq_h,
+    gen_helper_sve2p1_tbxq_s, gen_helper_sve2p1_tbxq_d
+};
+TRANS_FEAT(TBXQ, aa64_sme2p1_or_sve2p1, gen_gvec_ool_arg_zzz,
+           tbxq_fns[a->esz], a, 0)
+
 static bool trans_PMOV_pv(DisasContext *s, arg_PMOV_pv *a)
 {
     static gen_helper_gvec_2 * const fns[4] = {
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index e98275eec1..52a56d3341 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -663,6 +663,9 @@ ZIPQ2           01000100 .. 0 ..... 111 001 ..... .....         @rd_rn_rm
 UZPQ1           01000100 .. 0 ..... 111 010 ..... .....         @rd_rn_rm
 UZPQ2           01000100 .. 0 ..... 111 011 ..... .....         @rd_rn_rm
 
+TBLQ            01000100 .. 0 ..... 111 110 ..... .....         @rd_rn_rm
+TBXQ            00000101 .. 1 ..... 001 101 ..... .....         @rd_rn_rm
+
 ### SVE Permute - Predicated Group
 
 # SVE compress active elements
-- 
2.43.0

