Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301858ejc;
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8LdjWlqRp9QwzzA/jXAL/4Jb/Cm2N0nD6xxlpxZ1muV494CK1K9w1mSn7mce+Aidwq0ZcL
X-Received: by 2002:a05:6214:e8d:b0:56e:a756:91d with SMTP id hf13-20020a0562140e8d00b0056ea756091dmr47613332qvb.50.1677477121577;
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477121; cv=none;
        d=google.com; s=arc-20160816;
        b=QGOPxVRPL4zRakTxv7II24ePnqqTdSeXlz6HmhzB3Uu5Bc7LFJ+1FTfijeaULcPHmG
         qPD8O0WoYYTjFd3dIgeHytoyM8ysTANASAzpaWj4tbRkxnlDRFRP6VtM0QATmHX1pV5U
         7YqN/2UjJlft3fnlv2BCI7b8AFj67xr743FIp8zlmn4tYg0HL61mL2nG/9O8OKGZvXMa
         SLJpuM73RfcR1yi/fn4kaLLqDXiLas1U2V1u9fecOeYSo92wqw8KfZkJ3JXCkaNL8tL4
         JPpgV5TVmMvBFMgvWyz2PMNxAURmgVl0Q+JJjwKBjysMxzZbjkBDMRbWxy69C19eDmyT
         oH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KtD3E7GYpMHpgVn/sQN45x11Mj52FNGcI7jXV5OHaxI=;
        b=gamFh/bmLqwRErfyDpwxyXu/JvfBuHl29qdh/4rz07a8/xcUQiZubL/dBdqbiuoUto
         a8ZXt7lUn+ahHh/B6w4C3X7JBuUUrGEw8glbtkvEQ5SXx/kqpiBbRwsEXj3F1uUlwKqL
         zLOkwql065aIgu2yN1VkguIoe7xWzWG4jeAMINKf4FWi+ftNj2x5qtPf5OoRKNlsyr5X
         bLLc2R8QKSeE49L8jXhWdzvUJvI3t50bp9EGs8dhBL7QFXFbKQPzXRxRZvlhPVH7q04X
         4kjWbMh1DYYJNZaV9AAeA94fXVZY7yOaWO30o+qjzPCWhqS3H0dDNEDgHBactTWXFb/1
         tznQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OXGh4XO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c66-20020a379a45000000b00731860c3ccbsi5008438qke.355.2023.02.26.21.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OXGh4XO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJ0-0005ps-Dt; Mon, 27 Feb 2023 00:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIk-0005Js-QW
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:54 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIf-0004lW-MI
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:54 -0500
Received: by mail-pf1-x433.google.com with SMTP id fd25so2816332pfb.1
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtD3E7GYpMHpgVn/sQN45x11Mj52FNGcI7jXV5OHaxI=;
 b=OXGh4XO9ASMmA35vl6614q15GWSHMtNrCkPiRg3XCkVWivLYERYGzQ9BcTLMFLf/aw
 rZxVh5JqhY8JTth3zO++JQeoESb+pd++emcGDjtK4V/rZjv2bdkJx2gXCeRQ/EaWqEGQ
 hO1gJ9dPNUseUH0WD+8XTQhap6Zr2lCMeACEekbmJq8i3pXjuU66EQByAtdQkq+Wcp1l
 X5EMXo1PRYO87hr80c2b5g59MoLfX4P/SQQ8uvxqirtGbxigcSrhkWo46uuuB1GdWFeY
 sqybBcEAZiSw3WsXGRg2N5sADtfJhMJ6uueYxpPSWPoqn8J3X0uG2Vf66fQnucsoes0V
 tl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtD3E7GYpMHpgVn/sQN45x11Mj52FNGcI7jXV5OHaxI=;
 b=t5NdKeiWcWHYcVxB8zc6iZSaFvK+Zfcz4rTtgbPUVg4BUID0UM8RHttNIbQCdXSpaY
 ++YXBvhQUJ61CAh8EJ7TDrxA1+jKM1fPXJA/Lio6e7YAQkiNF50MN0sQZ8K4jSGmBglN
 2ID+AtCGsrqdH7LadPS2uKXNDWS3EoIZtaRVhLFsjIoJcsAhvjcx/P0hpLzNJDwirQS5
 cLSGtgabCVSiU7xMD0ZVje6nKdVlT7y4h16YObRQtrUH4Zr3drbHGIMCpGOcWsuog86X
 MHlSh4b7brlpU7SNIZZYx6SJfHFCaOI3FQxf57RErc0B3Q2hR3zSxT4htPASRXGT/3D3
 EgEg==
X-Gm-Message-State: AO0yUKVXhsSfqDtG4Op+wYJ2Yspnr3gFOqk9U3aywzntxITh4wyk3F4u
 n9L61j6CdVf/+00jd1W0qIpy2A==
X-Received: by 2002:aa7:9d8d:0:b0:5d6:3d96:4777 with SMTP id
 f13-20020aa79d8d000000b005d63d964777mr16571712pfq.24.1677476628378; 
 Sun, 26 Feb 2023 21:43:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 24/70] target/m68k: Reject immediate as destination in
 gen_ea_mode
Date: Sun, 26 Feb 2023 19:41:47 -1000
Message-Id: <20230227054233.390271-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: oytaxlOfjz5U

In theory this should never happen, as all such instructions
are illegal.  This is checked in e.g. gen_lea_mode and
gen_ea_mode_fp but not here.  In case something higher up
isn't checking modes properly, return NULL_QREG.  This will
result in an illegal instruction exception being raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 3055d2d246..7a87811427 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -898,6 +898,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
         case 3: /* pc index+displacement.  */
             goto do_indirect;
         case 4: /* Immediate.  */
+            /* Should never be used for an output or RMW input. */
+            if (what == EA_STORE || addrp) {
+                return NULL_QREG;
+            }
             /* Sign extend values for consistency.  */
             switch (opsize) {
             case OS_BYTE:
-- 
2.34.1

