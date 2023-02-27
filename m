Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4397268ejc;
        Mon, 27 Feb 2023 00:12:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/Wr1RjPvAvZIL06lHpbTXrtLczPxoJvRRaou/Vi8/VdAmDKb9d91UhvsYtvPPC5kz9uIZL
X-Received: by 2002:a05:622a:24b:b0:3b8:4076:1de0 with SMTP id c11-20020a05622a024b00b003b840761de0mr44018505qtx.30.1677485542523;
        Mon, 27 Feb 2023 00:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485542; cv=none;
        d=google.com; s=arc-20160816;
        b=wlKhPK0zdqmDRb/cxkLEkFVPYZzY52r+KRwe5WFm8NY6KYm2ap+QEHNZbbfZW7YIdW
         4G5EVzGUMgYy30Ro/RYZZiDik9NBLmCWkFWoRgiN4QuMks3CEPe0IeUMR+UYyRwBngtj
         I4ck+GR4tewVdYKZKwqHlaMLMGIoTeJwpTbJMps4qFYJ81+vsvLZljkdoQD7WIQ+uu1e
         Bi4uUWlSyh598MrTT/JWpEO9Iw3r8nCWeGYZdxg/I8MoQ12lrtma0FOwlJepxFoinIqe
         WidV/Cff9AQyV1bA5fKkqXZ/ndc497WkXgDiQob3hfZKI27lAOCRaBupHwp+XiRmKbpY
         Mj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t+5KFxEM4lJEelpxdqt9pc+tgTO1lJZXj+S0G2tDTgY=;
        b=gkS1IFfvCTeePceMUUTfveHfYaQgv5P1LBEDyp5nyWy/wBmtq0mjsOi6O1LyP+WGi0
         XL+H+zxUy6Tc6rQsiLU+2xXEgYS9RtUZoh8foQo5H5oUEIVhZMt75FMaXHAhXfu4liYL
         bWdNUVbk0KF67feSPVGaFf89auOPsFMoEQtoTg2/kPQCRnt+H9Eh8Gh/kresqpybRuGr
         4HPkabWdwHplA6NJItrc0ksukfRka7JjWvEiNIBiaVSnpOF7R7fyJp6V+Y/Xs+2vzYMQ
         VSAWG9rG89oOnCtbxmSraK4DZ1LNKR0E7E7Mxb/diMolF+u2W9hMyRsRIVM7Vz5xtGqh
         YVPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gwflLolh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a0b5c00b006fc29969febsi5614058qkg.145.2023.02.27.00.12.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gwflLolh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOP-000192-NE; Mon, 27 Feb 2023 00:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNG-0004E2-51
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:37 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNC-0007PQ-AY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:31 -0500
Received: by mail-pl1-x630.google.com with SMTP id u5so2166362plq.7
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+5KFxEM4lJEelpxdqt9pc+tgTO1lJZXj+S0G2tDTgY=;
 b=gwflLolh8YvPq4+xsyTBSIjeo9lSGPuBFC+o2Rgq7feae4/Q4AJhdlDq9aizYXngE4
 sct7Ln+UnM3vYKWxFE23+Y/PmC7y7pycYRXFX+KXDx8J8vqUtZX3K8zDAd3CYxvjWKrN
 5WQxVjbvclkLY9iqCe3muD5BN/zMu6f/l82GPrtXbn6SlaCx4zP6IuL5QJVe0yLXBqQD
 TRyp8zX3tNRZRq0Esi8zK01OkjW907RJH7i7ubUWrVlvthwLJwX8ch95U8O5rXKqg8U3
 Y3FrfWF9SMZI9z2q7SozjdHkrxBOxHs1pQ3ByTt+di1v7ndsDNyHdeLRfBij4vbXo+F6
 xW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+5KFxEM4lJEelpxdqt9pc+tgTO1lJZXj+S0G2tDTgY=;
 b=T26INSCJW2R+pDW8nOLHyHAMpM1X4VEgRwIHrvlMTWmhoSeRoVBthK0FKTrw/n6tJK
 z5hcAgTUWoj63pXKAQFIIfjTpDxUqN62vv7xO66uyOgBAS/gnWrhndbnIbaM6vfhe8s/
 WfTOgMengUGiytqPxsshBouB0OEyYVMybDs6B7rk1icPAStDOKcd/hBkRATlBD/8k7aF
 Hx0FJj5OeAALqW+9c0CXs934IFT7jFrB3yReVS6CL/Fph98l7FCtTKOH3kK49LdxvAJL
 KTfZP3JW/SszGvpCrpg/xXfkiqAUVE9N1o2+AnI35xtBzZr8VcHTIwD5URTQ2M3CSzy7
 M4YQ==
X-Gm-Message-State: AO0yUKUOhqhXWynv6jGYtqBKlH5NQB5niUy4zHdj8sD3aTaCoLhJsAlm
 1k08A6XGwG/xEaMVQIhyRZ4GuzZXj8RF57MvVcA=
X-Received: by 2002:a17:902:f544:b0:19d:138b:7c4a with SMTP id
 h4-20020a170902f54400b0019d138b7c4amr3097982plf.3.1677476909172; 
 Sun, 26 Feb 2023 21:48:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 62/70] target/xtensa: Tidy translate_bb
Date: Sun, 26 Feb 2023 19:42:25 -1000
Message-Id: <20230227054233.390271-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z8+dyTwP/5ME

Replace ifdefs with C, tcg_const_i32 with tcg_constant_i32.
We only need a single temporary for this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 3ea50d8bc3..e3fcd50691 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1406,19 +1406,15 @@ static void translate_b(DisasContext *dc, const OpcodeArg arg[],
 static void translate_bb(DisasContext *dc, const OpcodeArg arg[],
                          const uint32_t par[])
 {
-#if TARGET_BIG_ENDIAN
-    TCGv_i32 bit = tcg_const_i32(0x80000000u);
-#else
-    TCGv_i32 bit = tcg_const_i32(0x00000001u);
-#endif
     TCGv_i32 tmp = tcg_temp_new_i32();
+
     tcg_gen_andi_i32(tmp, arg[1].in, 0x1f);
-#if TARGET_BIG_ENDIAN
-    tcg_gen_shr_i32(bit, bit, tmp);
-#else
-    tcg_gen_shl_i32(bit, bit, tmp);
-#endif
-    tcg_gen_and_i32(tmp, arg[0].in, bit);
+    if (TARGET_BIG_ENDIAN) {
+        tcg_gen_shr_i32(tmp, tcg_constant_i32(0x80000000u), tmp);
+    } else {
+        tcg_gen_shl_i32(tmp, tcg_constant_i32(0x00000001u), tmp);
+    }
+    tcg_gen_and_i32(tmp, arg[0].in, tmp);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
 }
 
-- 
2.34.1

