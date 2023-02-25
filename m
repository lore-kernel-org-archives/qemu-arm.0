Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639179ejc;
        Sat, 25 Feb 2023 01:23:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8I4BiN8pbT9UCVJKp7MFruLeSvYxpcc2SCFp0QRmsdRGYmRjq00xqaoA6tXGUrQ7+bYjF3
X-Received: by 2002:ac8:5c48:0:b0:3a8:e35:258f with SMTP id j8-20020ac85c48000000b003a80e35258fmr28093768qtj.31.1677317004638;
        Sat, 25 Feb 2023 01:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317004; cv=none;
        d=google.com; s=arc-20160816;
        b=k+84ZheQfYnR894CznV2UlkOpCmzBfrZXZkEApWLNRae7nKmZOIBHZLsbesnyf4lpl
         oawyzTa5/1y2/usy8r9QNR6A8vv88i8I2sTHR4d/PtHBoJ3o+N0I65UVGm/Ml/Uv0jxv
         5jRW02fsMEEldC4nk4RdKt+fu1xnoLajAU12cuihEfY+p+Ty7uy1ejWCqaOairbOiRyk
         +RHdX1GTJuuo8Kr7euNknzuaXJ1jarJeeKOB9b3WuObv3qeAlZrgZc/OJa9P0d9+ROQl
         IvMBN/+tBd+0kzgc5uhgq3IQ8TnIgNGnlW8lfzCQNatc/ZzFJZtoAypVTr0CAZoSs0Fr
         rVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cRXcBpFfA1rUluDEi0MWf3DOhIAjyxyRYJ9MOu/X1LQ=;
        b=0xBVLHDUlARa3vdhYCV/GnfJNYJCqAqS0c/dKVit3vGhQd4gSrfp48zevzMfJtXI/K
         DOqEzO5Q3bLElgAg8LN1GEYmXdZ5+O4Vf/a7jEnxgx8gVbQOov4tJlSKJpAm035sWmMm
         2E0np/qMkvlyYzzzTAHugRM+0kW7W5N0Q+mEGcff/jpR9xw9R6rTpJHgfwN59gGlJyjt
         jpjyyDVVu0/ao2BODuu882hTtzibmX26DIxWBBPRvAdLLf88KTweJNi/ZgKBPJFW0pqs
         jcRKVMuEGMtvw6Ka4o/xc0ywb6MX6m8ZGKH4+WyOd4u+8wDfpmgM0P6JyXUUT0arBOTI
         7Byw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJp4gXeg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020ac85951000000b003b645e71d97si1537244qtz.287.2023.02.25.01.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJp4gXeg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjQ-0006S9-Jz; Sat, 25 Feb 2023 04:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiM-00040A-Pj
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:35 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiJ-0002wq-VD
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c1so1898611plg.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRXcBpFfA1rUluDEi0MWf3DOhIAjyxyRYJ9MOu/X1LQ=;
 b=rJp4gXegcwPkMOb6/+OQNwM8m/sikLUIyataqdpg6Gokwhl968+kqSMo7NUeIeMmZP
 QuFL51yx6vqwzfx6e/SWcsKSBcsN2NZSCA7rS1K1Mt3st4ba793TqSC96tr3Z/4cmTIl
 N+m3mcNCaMUNLM9mj5+hwemFrkY5zGjRPOhqHF2yRgMMXD5mdXjjVSni4nkJRgCgLc9M
 a6rgpikSUAZ9hVjq4qHDCpbjmbwI5GVGgYRqEtJW7ZOivCazeRt3lUNSB1w+7T+X2x2A
 /kgD22XPEYmy+jcUsqKgMa4kX+RdvmmgGRS9H4WySPIbOxybx3bKqkHRsfZL7b1++d1w
 knxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRXcBpFfA1rUluDEi0MWf3DOhIAjyxyRYJ9MOu/X1LQ=;
 b=qVgR5W88Dpc3ArDJoqEGQCY0nBePjuf1cOX2gQDbVCGGNfGS1WhXtTCFBJAMqu/WjL
 EUS97IPIqHJHetkR4wXcnyR0h1U2SkbFxnuosBxOVZkTIM+b3T+zszqaRs7qA1FOGnrr
 SAaji8HEYmEZvraihMXFGhSAv/yhCw6nyjj4M8Ge1Dmyh6W+JyFyG+YG9ukV8p7LGwUM
 BTFjVyqqjoQMxywg9URdkFe8D0/ziOAOZJtc2GNe39NdJjuIaXozQE8+LwKmm3Roytdr
 e3sX4NBsSuUCM7BoW8jgcI+MwkHsjLkCR8PyeXZBb/CrN902VhEEbvmWUOXoQAsJ2qDm
 E+rA==
X-Gm-Message-State: AO0yUKUtbkwgdhZE9PIHcEEN21R4ioXqq6ZGYTy0EHi3BnN4VAt2LBwV
 K9i29p82jXfRqL3VNYNfzb7VMVB2TWrNuQu3rGY=
X-Received: by 2002:a05:6a20:840f:b0:c0:53f7:7d16 with SMTP id
 c15-20020a056a20840f00b000c053f77d16mr16265325pzd.39.1677316769493; 
 Sat, 25 Feb 2023 01:19:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 45/76] target/mips: Fix trans_mult_acc return
Date: Fri, 24 Feb 2023 23:13:56 -1000
Message-Id: <20230225091427.1817156-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: nANjV3S9g9Tg

Success from trans_* subroutines should be true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 3e2c98f2c6..a7d241e4e7 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -53,7 +53,7 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 
-    return false;
+    return true;
 }
 
 TRANS(MACC,     trans_mult_acc, gen_helper_macc);
-- 
2.34.1

