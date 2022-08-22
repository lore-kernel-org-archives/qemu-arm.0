Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp990455ejc;
        Mon, 22 Aug 2022 08:49:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/QvCkACFBqeX3YdBWkx43XGUSQ24j6EaDPTmjx6MiTGfm8tMGi7Xu7hH5WoFBf3HO5cip
X-Received: by 2002:ac8:5d49:0:b0:344:7275:dd61 with SMTP id g9-20020ac85d49000000b003447275dd61mr15387865qtx.48.1661183390295;
        Mon, 22 Aug 2022 08:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661183390; cv=none;
        d=google.com; s=arc-20160816;
        b=vTPS8FnhnppOQKvh1tgAUTiy48pxcB8C2vP84AnBRSqITjmXkWcQLwMT9Mfx0QZ0VP
         xJqLRLyRtKmCVmKVkexAfJonUr0nqD6vKphOmGp5KdFwjtKDg4uDBds8PA5P0zVvvWtl
         80iVFdZOy/XMtv8K1ZvMvbtdlJzIE9/XvLRAXV/xxLORz0huVEWhX6fO4jg3RreywDeU
         snBcH+RrHmBpmGe/fn8UMekZBSnu0G40DVvaTAiMWuetB3I+IO/lcSpa8XTs4HHEyH7x
         n+VcVHDA+2zsGnj1t+FqsBOieRZrGkr674vkoIAkSPtWC4ecWs4cQnad4eymVSBx+rZS
         chkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=svQnwizGhYqj2KNlPoUGzrRVUcGJh31LTdC8nQ9RVe4=;
        b=zdKOLCYEs/WKW4VlphSMeDPjQ1Z4m6OR4MMzlgNGemBVlMIqle7BmuA7fKSFlmy76v
         LqbXycqLLvwt5xVkQFppOd0+UhYBmqViaxSjQ6P2d3r+GGHF44dSN9WetTisaPnE4iPU
         emIsbUydmyydm8aCOGiiEXZKprCiBjqCXrWRgO+O3M1h2U+2eC7FU00JcqGa0/rskk5X
         rEPe7pSYlZqUAkR9oFhHH1pP7ALd5To13eHumAVEcwQmDiAvxaZZmYZuLnlq+Ao0GUEJ
         kCSK13BxGyBxsn4zcUBmp/nr39ty+QdwEfZvQWm6E1EIFCWEVSr+QVD9V8YKwRYfUfhh
         31wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKvCZgKP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a0562140caf00b004774476d0e6si5304198qvs.161.2022.08.22.08.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 08:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKvCZgKP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ9gO-00036M-O8
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 11:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lf-0008LP-Ct
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:19 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:47063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LS-0000ob-En
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:19 -0400
Received: by mail-pg1-x535.google.com with SMTP id d71so9663424pgc.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=svQnwizGhYqj2KNlPoUGzrRVUcGJh31LTdC8nQ9RVe4=;
 b=XKvCZgKPcgXsJqp/w45cTSa1IbW2yo0eSliLIDiIa6A8Wk1SXDcAKJNmdsJaZwlmc4
 AODVVhjd9eD1rp5TuE7utuygIneemHvsdAWsIgmuTKbwUXf0cSg5GMo6Dc61ZO/i8Hs1
 59OzDSFSt+q1gdrwYPgphrqUaN/ehTfOwCYSnxHMx+wcYKCsoUy91A1RBvWBo7swEAeP
 BHlGvPWeiPVXHhoqvyXcrHy+DA5Lmvctk29RQoNDFtYLtn7Mq9BwvErbRLlpoEx6vnTU
 kH2Wnvnr1F7lcyW6rM6v92AEy6DY6rgy9yGboo5fFoyMO+nEKnoNRewZTRk7sJHaGIw5
 Qn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=svQnwizGhYqj2KNlPoUGzrRVUcGJh31LTdC8nQ9RVe4=;
 b=Sauij/hlezKhrB2HeoN0bGhpJe8h+6BFMrcuvOcCilvrTMeS9kIno093nNnYyDKjnF
 8DIb56XPpWBkRaiPv8qiOwfN7SOnLti8nCGNCS+4y0oElL+qVRQcanhan8bgBorSfU1t
 BEqxWtcO+T5Fo/4P2uV4A1S9Sj8CnQ/MuQqz2UwaLtPY46AWtDOQzspDxSFcowaVOm1j
 Qlg/Id9nDidd7725obqpycwafyfRc+zVYi9cs3wGDgWTngXsPJKCQ9J3BHSRY3q4gWgk
 Vp5/rBBSPv4V4fI+dShZNQ/NKtg1Zk4cKcchsGPV1gtDLEpkZzPwZWLfLkxv/hPlVDce
 TPbQ==
X-Gm-Message-State: ACgBeo19+OdJIjG0Kon/LoQqbbNlgoe62ecL6RyNIamm4sxmukXjPePd
 Af829oeitpT0taWwbhGtBDFQPlBgHceWxA==
X-Received: by 2002:a65:64c6:0:b0:42a:a392:5340 with SMTP id
 t6-20020a6564c6000000b0042aa3925340mr5501022pgv.588.1661182085109; 
 Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 28/66] target/arm: Drop secure check for HCR.TGE vs
 SCTLR_EL1.M
Date: Mon, 22 Aug 2022 08:27:03 -0700
Message-Id: <20220822152741.1617527-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U9466LHhSatL

The effect of TGE does not only apply to non-secure state,
now that Secure EL2 exists.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ae9552f46f..7c0a4316a3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -157,8 +157,8 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && (hcr_el2 & HCR_TGE)) {
+        /* TGE means that EL0/1 act as if SCTLR_EL1.M is zero */
+        if (hcr_el2 & HCR_TGE) {
             return true;
         }
         break;
-- 
2.34.1

