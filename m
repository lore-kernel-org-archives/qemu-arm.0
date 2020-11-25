Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp154510lfb;
        Tue, 24 Nov 2020 20:08:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkScCA3NoDdI2qVOKwzCTLqHL7zMwQNzVsrJ500n7jP46ZHRm1WJr+m+xi33f+kdkU2UY2
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr1370836ybp.306.1606277339121;
        Tue, 24 Nov 2020 20:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277339; cv=none;
        d=google.com; s=arc-20160816;
        b=W/10SoWe0E7UkwYdl4kJihqPoPJVUuSn4Mfg1Mgv++BxeTFFG9AtWAi83RY7xYvKcv
         Q+HaJ17HS/hyx8Pb5Hfzc8ZL41WAIeeyCVubFjCaqRCPk3uahh18k8DUBtMPW33s1QJn
         OzeQM96iLfW2xf7g6HMtk1DSZrVfTaq+JdeBDdvapz1ElcYpoG3VF6QQmSlgFUAYSM0d
         4ToO5AEKFv+5hbbaxUKqJgkhySbB5R6hdFzrScZmhmnUSrMeCc+c9v1b+4rKeukUsj+/
         ykji4kCACdmxB5BXjB8ATJhb94N/nfISbEEbXuILvehCSHxpaq5PTdAYD2t9VYfI0JcS
         ZSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wlXlRdc0Ps4lTbxrXVpBLYGv+DVDYQ5KsE5wMhxDQbM=;
        b=mdRoNshknX780ziKrs5F5n39wn83cEnoAl7ug5c1BU6I9Boj9rpWxTI6Q02Oqwrzh9
         OqbDiBxfeJqAEPlFi4Zbw8jSSri97rTW2IGAOv++XNtIuh3ZJl0gDaEzRr/4UTtZTZX2
         D57TtztsWeFf5X7zIe1XpJNcaQuktP+ykdQ8GSNNbgQghZ8uuhFDBSLKr2ia04Halz8K
         DK8AQU/UpBjPsC1vgrAaH/sEsIAWhrc0CooeuNTpb1Zod4odDhVKpezKE5OvjAGlaZK3
         6PwJ9z0gnH9ZKtA1s5D5Lq35aXpHNIKLmBaTS4bzVeBp0Xr7fvudR5VUWzLKUUaFCCi+
         ZjsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NNRKuJv7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si1000514ybs.57.2020.11.24.20.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NNRKuJv7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm70-0006tT-H2
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm53-0004wX-6n
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:57 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm51-00064B-G1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:56 -0500
Received: by mail-pf1-x443.google.com with SMTP id 131so1082279pfb.9
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlXlRdc0Ps4lTbxrXVpBLYGv+DVDYQ5KsE5wMhxDQbM=;
 b=NNRKuJv7HLZcC5szZ1uyUbuBzCZmY4Q1NklB4u8+mYUaKrlbadAHYSZZY55YHXdFfk
 irt4OI52mFuRR6gEjsxlOPG9GozlmHhGIKSM4OavI29Y38fdPGkJ+3drRIeE0QZYoojp
 DvEAwrfG8FK13p68DDvikQklLZA3/G6aOoGQqfopLEAU/nkHHezgC7sgDJBVR56JkAFA
 CmmQjGohxTsuYD0agAjAL2f36vDLctFYa3Gm4Fj8dfc7HUWGAaYhD1sPMblpVQIPrEdi
 uGg49K3wb7s3uD6Dua3QsAvd456Dp+aCTiuCARZ64P6pe8SpE/H3pPIEJsTsIEZA0ZXW
 kmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlXlRdc0Ps4lTbxrXVpBLYGv+DVDYQ5KsE5wMhxDQbM=;
 b=gksaH4st4zLjgT+dX6ydMrHowJzeK02EC3cpWlvRau1lHkj6dlXQjLF/oM5ub1+avE
 +SEBs7Hbo4DoZZeuoUAMk7tlnKwT/fYHp13phpS3YRy9jngz9nlNoVKeSq9dJMj9f6zC
 c0VhA4e3OX6p//zQZMAtOEpIwIkpr+kGAGQ8itXA3eUerXR7taGkYZ8Atg0yc6cBpHpl
 OWedePdY7RrSl7rZyn51RhWgyqfxavHTvlIPMh0RBRyyKWtQHW1AJd6oO0L2cRJEsrGn
 Qd1j55BrsNaHaMEBC9cud42TaSZy4fEmuuMW11aQsW+kQRtuAuST0ZBNv5ggJzF8tTuv
 08kw==
X-Gm-Message-State: AOAM532eIr953A47qpOxxYxQTcSgG0udHw2xBD04Li6E4r7UQanarTPO
 KhpvajpRcp2kt+eXLRq4lXQP9N5roniNhA==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr1838625pjb.128.1606277213961; 
 Tue, 24 Nov 2020 20:06:53 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/arm: Enforce alignment for VLDR/VSTR
Date: Tue, 24 Nov 2020 20:06:38 -0800
Message-Id: <20201125040642.2339476-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MQ7BJPXEIKsW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 58b31ecc3f..51e85c2767 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -926,11 +926,13 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UW | MO_ALIGN | s->be_data);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UW | MO_ALIGN | s->be_data);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -960,11 +962,13 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UL | MO_ALIGN | s->be_data);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UL | MO_ALIGN | s->be_data);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1001,11 +1005,13 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s),
+                        MO_Q | MO_ALIGN_4 | s->be_data);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s),
+                        MO_Q | MO_ALIGN_4 | s->be_data);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1

