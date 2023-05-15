Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6568490ejq;
        Mon, 15 May 2023 07:54:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44WFFFnH7pbngazoDrAk0fb+99d8J0ANxQKA4eMuBxBuUrvxzgWn6C0300Yahqba7h13tA
X-Received: by 2002:a05:6214:5091:b0:621:6fe6:cea4 with SMTP id kk17-20020a056214509100b006216fe6cea4mr20961061qvb.13.1684162470974;
        Mon, 15 May 2023 07:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162470; cv=none;
        d=google.com; s=arc-20160816;
        b=MFdT4A1OvBX9BUelOvmmpdQHBGBCOht/XC3OwoC8N7kg23tEZlv6k3ZJ9i+8T5ucnY
         IiXtXWthZTwONC1oWup+J1mdyEwBfb8dGwf4oDIkxiA7NPInSVkRgLtGpn9NR48ZmdmV
         5akgw/FqCgUbHSMHAsYMTli5vZUpPCr3G3m6D35m3HlbrHdG5xeFhOV79my7GksjZ7GK
         J93zwm0rvFAeBZngxVMnjE1yxHF5w8kskiha1BDELS9gHv8/hLThkKvDRMVClz0n4v4L
         40PN+BnNX/DIsb+LDkiRaGzzr4pXdDfYPDNc4sB/YsmEhLFDVLtjcBmV1aQtFywDWSWk
         0D8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QglhRsdw7AzGzQGFnKhJg0Itmtj7bWZIFp39BEmNv6E=;
        b=ZYtgfkpU3NWsp8wYpIC1BK3HUx9juwH1Szz5PfuFn0/UgO4SjOibxdv8i/KLDuaMML
         eJ6uFZqOfBS9KGuMBRV42DvALdx8xLOz3DVd7H85b1rBTa+DMEs4zTdei/rQI0SDUjqb
         NwoSHMcokOaS+hjQBrqmbx4XpXHDQDypwHmXsi6m/LtucY34MSFTMrzWX3gzD7alHIL5
         9X99ssrlpur+i5d72j42sAluyjUYVfJlTNY6WgJCuUT0tilBJpktcS8qKB9KcAf/ECK1
         g0V1LuzdpNEKUpSxBbTzkYa5hqII+kSFAGcCCXS5GUBnLMGRdQN3cUD8TfNXpg39cJ4w
         t3WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iCbi7E8/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a0562140d4b00b006234742d107si3982409qvr.139.2023.05.15.07.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:54:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iCbi7E8/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIq-0001cH-JW; Mon, 15 May 2023 10:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHY-00070x-Ez
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0004rv-NE
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:33 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so120245245ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161218; x=1686753218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QglhRsdw7AzGzQGFnKhJg0Itmtj7bWZIFp39BEmNv6E=;
 b=iCbi7E8/0QUKz7qYqiDmyVA7Td0HW5AX1NoUOvEbosqmjX4VmPwVloTvj+w6QudEiL
 LCA1Rugz502R6vcEUQ6qfwpzaqLLrXtCr9VqGaHvQGyX3BHoZEOqgj+CZm510NLOZ0+Q
 79zIqzHMlB7NZ38c5luZ9eJiSK33mJB4HDgRH/t+/4VT9HxmNK1EgMFfcN4XDVXSCEui
 PnVcqxhEgvZ2RBqJINllHGxgerl2+nC4rVhNqYrGCTnrmtx3jEP/AcRbcWQPEe+7+Nv9
 FwFAsEhl78fOYEq44Nh//X3T9ylnDXn3q/vow+ouqMJw/sgyp1veGhOw0YJ4I/Syua7c
 pfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161218; x=1686753218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QglhRsdw7AzGzQGFnKhJg0Itmtj7bWZIFp39BEmNv6E=;
 b=al7HomKWGoLfR3U9lpK3BNbzXJRHd5udpVw0J49HZArkMO3esEQkST1F26z3jOPlR2
 PnbJwJ0nO4/hj69v7/KiIw3a4el2eHJvsmzPJST8vxR9/woLn5TnJa7HQnDD1f1RIKcy
 m0bc2gGiW0uupwItf4RQFvIM2XXu9JwVLCzQpTmDSBjKzVZv3tjprJV4fXvdOoVODhU/
 I/nbb5YMnYlya3GwuszjCZvKQF8nVhBaAwDUwxEbRlYGc5uvy9HnwSpr/Nla5w3m1NIy
 kPUBA1KCBn73py1vVRO0NoDnqZCk+vxIJWrnVRr1zRNMVw1U0a2jI3cwpcPUc7vFGGkT
 ZyRg==
X-Gm-Message-State: AC+VfDwe94bVDMSYhKjG3BvUntqp54i2/k+Tm3KXZ3awfRnohTDZMvfo
 MbcFIK6PYhPQs8VStQCmCY0wX3ClTkVxpgfss2E=
X-Received: by 2002:a17:902:ce8c:b0:1ad:f138:b2f6 with SMTP id
 f12-20020a170902ce8c00b001adf138b2f6mr11645112plg.16.1684161218232; 
 Mon, 15 May 2023 07:33:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 27/54] tcg/sparc64: Rename tcg_out_movi_imm32 to
 tcg_out_movi_u32
Date: Mon, 15 May 2023 07:32:46 -0700
Message-Id: <20230515143313.734053-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: almIWqr0iWiR

Emphasize that the constant is unsigned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 2689599fd6..e244209890 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -405,9 +405,9 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
-static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
+/* A 32-bit constant zero-extended to 64 bits.  */
+static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
-    /* A 32-bit constant zero-extended to 64 bits.  */
     tcg_out_sethi(s, ret, arg);
     if (arg & 0x3ff) {
         tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
@@ -429,7 +429,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
     if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_movi_imm32(s, ret, arg);
+        tcg_out_movi_u32(s, ret, arg);
         return;
     }
 
@@ -473,13 +473,13 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi_imm32(s, ret, hi);
+        tcg_out_movi_u32(s, ret, hi);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
         hi = arg >> 32;
-        tcg_out_movi_imm32(s, ret, hi);
-        tcg_out_movi_imm32(s, scratch, lo);
+        tcg_out_movi_u32(s, ret, hi);
+        tcg_out_movi_u32(s, scratch, lo);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
     }
-- 
2.34.1

