Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149625ejb;
        Mon, 30 Jan 2023 10:26:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9uVe+ncoI4OtiYn1Jn0wHPAfW4rjv7xCq5TGSa0GCTbb/IEkvy0QUfyGSxXCg+nxhCHW1B
X-Received: by 2002:a05:6214:4406:b0:538:baf2:3ca7 with SMTP id oj6-20020a056214440600b00538baf23ca7mr18110722qvb.2.1675103179322;
        Mon, 30 Jan 2023 10:26:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103179; cv=none;
        d=google.com; s=arc-20160816;
        b=NG1PdqnxHpSrI9+JDUPCIe+9fhHewsZXTJ5A1ZipfCzFGJqo9OkJhK4gjdggRqhXSj
         EOMc8CEAxOuMVfZlnatIUvlzBysky2bLtOBP/xsARZa5flZ4z/AWBfEIK6fD7dUAc8RU
         eQXQy6Rgid9OMK3enU7Na0Sq+g66bRY+JPiB5F1trLT5Ird+Wk+tu4GqdHCEsh4UlCpr
         JdHAZOo9mePmYknuMHR/QDghFrYZz6Ss1PtrQsr+/cLH23IiLq9d8cpMlXNaYUpDCI/X
         IQS5shDOBrFU2RgYu/DlDc4UNlf/wYJc5UzskleQtxM8X/kex+xI08vLFGKyhz0gD+Zg
         zHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rq0lR9ne6I1nZstcxCOL1EodaQTBuWKIlIMnYQtQVEQ=;
        b=UhwSg4mwIj59CcfVonO/OYHMPAZTEODvwVwNoloCDnW563yY/4TIkBn2eApaSsWgFG
         O9sdJW9psxbk3NNl00Ha3pk3x+38qThTmH1wTJ+qH1IA/+/udY51+OHtqKvGQHNCyzxl
         HVmi6xLfCh8r9nkzVMrhD57xaY42u/LLWa3s9dKRehg1CxRKVMeMxm8IohgvMD/xC+mJ
         u3v8C7J4Yc852sP9ba6AAVM8GAX4O42jW7vMvEAfLzW1/TsovkWILAfWQDvMgNBfTEVX
         dJHodx57rDgB7GHFbZxt2oJVPcJBis69UeTba51+V1ax6b81r/zvF4efiL37XQ0wlG18
         fIXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWBNV5kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id my8-20020a0562142e4800b005377156456esi6949370qvb.329.2023.01.30.10.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:26:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWBNV5kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqH-000139-7b; Mon, 30 Jan 2023 13:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq9-0000zZ-0R
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:13 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq3-0008IM-El
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id y1so12005810wru.2
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rq0lR9ne6I1nZstcxCOL1EodaQTBuWKIlIMnYQtQVEQ=;
 b=CWBNV5kpX6yRYgoF+3K/zfNPHilLx7rVI7ZPhV9eX5W/Q66I20JRXkNF1ugMm6S4BM
 Dd9DNjnzaWbrncSHM8BzU89sjBwqxmD2fWyhcqS1uxyGmEHHvRGpC3eBDNom5AJJsyns
 zNfrnw9nDKSs2bjpiQnUcbg84hK59iTVYEBwPeqzp6/nMibgUcaclpSAxnUyUn1Sm4dF
 ZNleYuioKtbCjP6F5IHAimgP4cx++3MtoQaqFKeIGrYtTMgK1NWXUxQCzQ5NiIFw/ANN
 5V7VGrSFu1PsGJNHcsxCeOlzJGqLewxYY3qbRaOvzWbr/JOypH5vYzzCtUTt7DpWaebU
 jiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rq0lR9ne6I1nZstcxCOL1EodaQTBuWKIlIMnYQtQVEQ=;
 b=22RuGpQGjvc30he02tr/Q80wrOPjO+S69A4ytMRsolN1WieBrO/7HtxiLbVPkq4cjC
 hTWQ0ewCHLAkzn0/58HHkJSYf5LrCatOnIy7h4rrwGbWWCuwkjt/KJercVOve1lbesbx
 OsgJp4YmFJgz1i/quG4j51MN+MMO7rFTp1Mpx/Ku+tP8qxTVinIkuxMfxzX/bpTa9mRI
 y79lQLkzBt7palr1q443Djrbl7fWyBrWGCFuQLfNtpGczIMvYTUoJdOruYDrHVmL+8aR
 BS+VJ9qcL6GLf4OpaAz1W690kXnO+Ks0fv8uDcuY4juFhIFqSmimc6fM95kFXdbPQGO/
 Z1Qw==
X-Gm-Message-State: AO0yUKWeRozky2uyya2DCgB/v9GySftkfq8pCuAC7M6liBTFS7h0wcNh
 HOeqrw6pkIKE3gCmeV1GzGpaBobRWt+l3R5e
X-Received: by 2002:a5d:5b0c:0:b0:2bf:eb2c:369 with SMTP id
 bx12-20020a5d5b0c000000b002bfeb2c0369mr320600wrb.66.1675103103713; 
 Mon, 30 Jan 2023 10:25:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] target/arm: Correct syndrome for ATS12NSO* at Secure
 EL1
Date: Mon, 30 Jan 2023 18:24:38 +0000
Message-Id: <20230130182459.3309057-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: xVgW4nUig2G5

The AArch32 ATS12NSO* address translation operations are supposed to
trap to either EL2 or EL3 if they're executed at Secure EL1 (which
can only happen if EL3 is AArch64).  We implement this, but we got
the syndrome value wrong: like other traps to EL2 or EL3 on an
AArch32 cpreg access, they should report the 0x3 syndrome, not the
0x0 'uncategorized' syndrome.  This is clear in the access pseudocode
for these instructions.

Fix the syndrome value for these operations by correcting the
returned value from the ats_access() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ccb7d1e1712..6f6772d8e04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3284,9 +3284,9 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
                 if (env->cp15.scr_el3 & SCR_EEL2) {
-                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                    return CP_ACCESS_TRAP_EL2;
                 }
-                return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
+                return CP_ACCESS_TRAP_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
         }
-- 
2.34.1

