Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4396710ejc;
        Mon, 27 Feb 2023 00:11:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8AqYE1bqgeYG3nBDaM08um2gViaaXOEX1n4MQ7OhKi+FK1pI+2mjls4BDlHRqzIpy+d/iB
X-Received: by 2002:a05:622a:1044:b0:3bf:d238:6ca with SMTP id f4-20020a05622a104400b003bfd23806camr6829032qte.68.1677485490207;
        Mon, 27 Feb 2023 00:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485490; cv=none;
        d=google.com; s=arc-20160816;
        b=LvxhD7hEIJwy0wbPtwe/iO0nCy2FUEldjeAGFyGH9HCOzteUtpxBS1UnznBnx3NxuM
         Tno02VdNbc3Fb6n1RonUk3C+a7JGqqYHgdIdr/rKvEZUBMRrER47637qJQ5E22pqagWT
         lDuHkeE+CpUoepl/nCHl3cxAu7XoaZg/Sde+FXJx2hpRs1LZRZf2SNbZSuqf0qiq+zbp
         c3NcR4zwSOI2FmI0VQgA/ZX0682aoxADAhftVcEhpo3qIDmGroTUHBbSngyXZ9HKPJjr
         30pAf96oh8hV3+tpW6Lk6EVC4HuPzR7qIitWhDyt7+Mixd190o+93EJ152WYI5UVqXrj
         G2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Htwm+E7Ej5o1YDA8ZJwARbX/GtYPS7IcYCg+lmcAy3E=;
        b=V5xyfDg9NE9+JXbgzyOH++Z0ZCVxGlY5kn8B5NEyVyqp9TCy+gox/Z3goZ59dTGP+c
         d4D79vrmLKtrget0OU0FMydUDjhvgqWEcxuKn4tgpa6AlBjIR5OdtFyQay1KAkxPlcIC
         Yzkat4NnsuMsl+k9nVJhe2h/cvIW+F0F7DaWpEn441MqjD1u1AHnNolKHoVja3evUB6a
         Zr/eh8eI9wLa19LOTrb/rbYo+UIN31oaXbjJlW7Qa2VbKuMfuNctuqZ87nO8lSIfyUCv
         1xLqq0YQdxkF++vF9gZ4OJQJjS8ZDDbEE4UmhguQRHLf6pqXXLCfCc1ksMm+knJbjIOb
         4C7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cWwWaOTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a05622a040900b003bd00b830c6si6116873qtx.78.2023.02.27.00.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:11:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cWwWaOTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWON-0000sN-Hu; Mon, 27 Feb 2023 00:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0004gw-LG
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:48 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNQ-0007bO-B3
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id c23so4886695pjo.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Htwm+E7Ej5o1YDA8ZJwARbX/GtYPS7IcYCg+lmcAy3E=;
 b=cWwWaOTHYxiB+KCaN2JEQ0ZC3ql7d3B85FqiSF9BuibjXV+Ju43HfNqGM2pXZa3rw7
 WO3lyp5iktpMdSznSB0Lw1aWe09czKEUeYLayyUr+3g0tVSpn2Sr5tzoupcJHJ13chGM
 S8gqw5zieVM3wE5O13F5vxihvRQEDwvb+3sdiasrUxSdIiX1WffQcgTUEir4NvqkNBMS
 rCx/tKznFURA0OMUVhxs//Ua4Epw3SbeepGUYxRp3e6AGXB2yIhh4VVsMvUciD9obiV1
 Qlw7MV/qzty8/dQiMM9jC0n95K6e//8PQ7UmNwK8usIw+ebhnaG80XNYy+cOy1HyiBM6
 Mb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Htwm+E7Ej5o1YDA8ZJwARbX/GtYPS7IcYCg+lmcAy3E=;
 b=vOLJEtNAqSUXh7jLOd768TrAY4UfzBVHVN+fO61adc4iogeRuM5jN0gJ6T2TQpUDUl
 pOjvGmIuX6ZcajQ6UicDtuGuJTA1jfgYq+bF7RMxUEBvs3wJFQcLU6j/CJUpwu2jRLE0
 /5iRGwcJM1nUo7cFyC0Ncuug/yVvbLGZcoJl/ul0aI0m9VV3Slh7wiXECWuv7bnVBR8M
 /KNT3sggIB2vcazC0hiYTRODwapDUEfKipqK0QEX5UmnaHITytsV724TdDoAKdfjcIQt
 Geh82xgbxM24yOxBMDJTIxS6izZcYpibCnxeeAM2fMiuxJO3bZrN0z/8i028QLr2Aje3
 9ZmA==
X-Gm-Message-State: AO0yUKWmlmxXhSD7MhwXqYx9t7r39J9UDaDGPZ2BHXgW3WzLpFiHbWia
 Fc8Hqt0kZWdpt8BnhMDSvLIC1w==
X-Received: by 2002:a17:903:22cb:b0:19d:1897:8192 with SMTP id
 y11-20020a17090322cb00b0019d18978192mr1977206plg.47.1677476922275; 
 Sun, 26 Feb 2023 21:48:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 67/70] target/xtensa: Avoid tcg_const_i32
Date: Sun, 26 Feb 2023 19:42:30 -1000
Message-Id: <20230227054233.390271-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: uaPIWouLI38H

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index f906ba7ed5..0cf3075649 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1361,7 +1361,7 @@ static void translate_all(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
     uint32_t shift = par[1];
-    TCGv_i32 mask = tcg_const_i32(((1 << shift) - 1) << arg[1].imm);
+    TCGv_i32 mask = tcg_constant_i32(((1 << shift) - 1) << arg[1].imm);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_and_i32(tmp, arg[1].in, mask);
@@ -1489,7 +1489,7 @@ static void translate_call0(DisasContext *dc, const OpcodeArg arg[],
 static void translate_callw(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
+    TCGv_i32 tmp = tcg_constant_i32(arg[0].imm);
     gen_callw_slot(dc, par[0], tmp, adjust_jump_slot(dc, arg[0].imm, 0));
 }
 
@@ -1537,7 +1537,7 @@ static void translate_clrex(DisasContext *dc, const OpcodeArg arg[],
 static void translate_const16(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 c = tcg_const_i32(arg[1].imm);
+    TCGv_i32 c = tcg_constant_i32(arg[1].imm);
 
     tcg_gen_deposit_i32(arg[0].out, c, arg[0].in, 16, 16);
 }
-- 
2.34.1

