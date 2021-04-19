Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1497350lfb;
        Mon, 19 Apr 2021 13:44:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQcO9CAYmeZSUaIDLl1nFjklb1VTMow9aJ2bYXjb0SAMdBoHSyPrSB/FiZX/OWgZzmE9iZ
X-Received: by 2002:a05:6e02:1a61:: with SMTP id w1mr8403669ilv.304.1618865056866;
        Mon, 19 Apr 2021 13:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865056; cv=none;
        d=google.com; s=arc-20160816;
        b=U5iD9VN76cTQG88Fdyyh/hc5T463HfMNYHCcaO7BETzWUXRtlSJhwRwzrIaPOtbhb5
         Wts9HjgKgDSsY+sIr7L+Cvk1kR4BVwzXOdw3luC/hRvmeme428OzqLZykP9zM/sBkDpB
         ReAkMZb1IL/x2aV8dFfFJ/nO0Zkim9AaAQNVFcE41SqbE4q8gSfJsn4RWWpsQMgYNCGF
         WNi0jL5tQestyyraQ9fpTxNj4Xd4Fmwvd2XCgAf2sOV/ajg+hK7AFLd+TXdmdG7tUkYA
         3znIdREk+D4l1wey6sZYAvj0TRNOr6Gcc0SxNpjwJM1NiDcyXZc7VBtVe/AxGx07uXZG
         CmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
        b=nQn4CRlYx5Sa3kmwp1T4Ss29TpmrVbWFPfvXBS9VK3TMT8zpTsFDGm0izIff2UOxRE
         xDKJ3PYuoaSK5EjFOfxMBrF3biu79fx+G6zVdNl1a/94O0cLTkEi6m+0N7N7J1V5CqRg
         qCREgKRGv+SlpHF5qC6TKGfOCiKrv7ZmiJP1iGJxqibZGQSD3TOCeO8s7wjw1XUYabib
         Qm3cir/+WZ+spB+FqK6YHwE2iPJGpdm9Wxa2U/Koa3JYx5xaBaGk/2wpue3bVBicrBdY
         M5k1msamuQnR2Vc2Qn0Kf70xuyaeaGNHOFPDpew7aQjP/WRCgJ1bO7Od499H99bU6fUj
         yBsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PfDg4aUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si13577637ilr.157.2021.04.19.13.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PfDg4aUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaki-0004L4-6r
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQm-0007lO-I1
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:40 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQk-0002gf-ID
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:40 -0400
Received: by mail-qt1-x82d.google.com with SMTP id o2so13699869qtr.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=PfDg4aUjpVzBp2eWCKBThySgKiMVpyg1EJtE42ZGD0YYJz4vVj3W4cVbngjBZ3XT5j
 WHzU6BmOYghbvn9Daw0sMI/sZ9gOcSkAFfECam6LgmVIx3T/iFwS5WNvlOX8MbiIXmzn
 Bm3tfkS6BN6EP6fMJRvUPpKJmKNrscqxhO76Ng1J8rdHEAkz74QDUU+47WaNnZIbEfQh
 qQEZnCpojgHdxA7ZYwDIWbvfZiA8D759VTel+8SEL+A2SQUbdOm1gtnPHzfNg60ifS7q
 bQw47p3GycBG8KCOYQGnZAiRlHP3dTxm2Anu8X5AyDh5yUPS/xIjaXipCC1E5z7PrQJC
 MFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=gzya1UpW8r61xqo/kYjBpurknhLsrKlc7SosNf7ylf8zNUw4b1baTgQZYn+9Kdb3EV
 Hi0xwsdNGef6S1paU3kBZ30b6wSeEkbDVSUp4sAGODX0IxUXdmvh3MSgI5j4C4XtynQK
 0bHUUvH2ZpIHzHvAmb2G5v7Uczn1qcf8YLpOX8oIhqVKDrGZIpVCPwpBsuRLX+nkevKw
 HKf+en8lU3RktWtpiY7a89oNSzaKzSQLAHrhSvAcXIsV7D1zzz3+wOKb3DG8O/CCDxD+
 QfTnweaXp50slOUAZlWny174tehTg0hwPvVek6IHKWuDl/2VnHADj7GAyiEFyg24om3N
 MDdQ==
X-Gm-Message-State: AOAM530EL34Mt4u490MIRZ4VtHKKZ57gHI0qtAvow9dBCBV1WBc/z2pf
 T05cFnDJwPZ36LSXrLahPAHIu61usR1tQVgF
X-Received: by 2002:ac8:555a:: with SMTP id o26mr8761994qtr.303.1618863817705; 
 Mon, 19 Apr 2021 13:23:37 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/31] target/arm: Enforce alignment for VLDR/VSTR
Date: Mon, 19 Apr 2021 13:22:47 -0700
Message-Id: <20210419202257.161730-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YK+kW032tZbe

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f50afb23e7..e20d9c7ba6 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1364,11 +1364,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1398,11 +1398,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1439,11 +1439,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1

