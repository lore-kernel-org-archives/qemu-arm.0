Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1221162lfh;
        Fri, 27 May 2022 11:52:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylgHdneLocuXnAbPhbiiEyVxTVzpPKZcS9/9yLjQ3Pd+/zRDbInyEyvqPllWEbAEGAdGDp
X-Received: by 2002:a05:620a:6c8:b0:69c:7adc:7370 with SMTP id 8-20020a05620a06c800b0069c7adc7370mr28542836qky.49.1653677523882;
        Fri, 27 May 2022 11:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677523; cv=none;
        d=google.com; s=arc-20160816;
        b=gUlwHe59OYo0h5W/TjCPZXXmTQBpUEi+A8mH/W1VhT23v+8B8avR3k8LbGoDxcfpke
         YJzRIkLyWuQMNMTo1F5Df5faraVgZSl0zZTdbgvRTfvqi5d9r4dS6MKXCQ5aQc5B9rbu
         qvBuEsFmYqxcArK7sNkciNM0apMrv3ZLkJdRDYM9IK1wdcOqv6G/yrMNYDUBCBbc0eh/
         XgJT9exwneDMIgoE1j69xA35+duz8+B3v5Mo3OeT90MOxEDLBeMU/12q+Z6NxtZnk3yW
         HVoO+MHe7jK29/8glEr5KXSxhbIvLY3rlmcVFbjKaBvkE5LlrzUyEOxHOixxX8FSayfI
         4kpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9GzR6SjGne04dpMjKvt4tLmGUCZGiEsDKCfPsqE6Vfw=;
        b=JAR8kgsM0JV/vlDca0VfUhhpCe8KK58ASP+Zsa2IOEyg9TmKHuW5+QCgQvgjhu0XB5
         x4aDalRDglcn+uT5uuLGwr4rMaAulbE8cVGWreEG1Luec7tSvMoOBqLZax8b02BnCSEX
         KTd0/nktFEZACfAUQBYLN+jl1DZQ9iMbfjIrdVmhrzSDHx2U5M32c/5AeOvZuwfMLAuS
         JOEKCjpRyixTQ9txF1OTkJVgSkO/BwCkrMypdGJJVqRCda4tcycucTDVb4SIm2oP09/Z
         CAJv88f0iha195YG1UhDONpav/5Amaqb3zcDn3fwRv5wcF7vjjFMPSS49fRs0xcnhH4v
         V/aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aL7jzVUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a05620a28ca00b006a594bcc3bdsi3828027qkp.723.2022.05.27.11.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aL7jzVUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuf47-0002a7-8u
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYw-00085j-1p
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYs-0003ZK-FC
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id d22so4790049plr.9
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GzR6SjGne04dpMjKvt4tLmGUCZGiEsDKCfPsqE6Vfw=;
 b=aL7jzVUAxLavkWm0lX19L2yatPqzz1mwh6tKfNZ5Q2cYXVo9Ef4CJi+wd0Mq4DZWUC
 ZkEgEbIHpld9Zy1vhtSuh1M9xJFoyXaaVEMR6A0Mlf9rILGE8fp2iD9liHPH73Yb7S/7
 IZIQmjBNCqScx2mjbms3cqd2/dPC3oMMCGc2BFgCTN/1fa9wQQV0hXMZdeEa/pWRpDgj
 pXgj2CdppVcGSWIZQe3VkP3Q67ROeuR+jwHv90SbSWDbOetRCaBLTzP/lRzXu4upu8Sz
 6XCABu/YLGJV/dka0JE6A+h3ggOV4zgVeZQdq/3Dl0BhAL0AzZO0eSJyjq5xgFriqjaU
 hOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GzR6SjGne04dpMjKvt4tLmGUCZGiEsDKCfPsqE6Vfw=;
 b=6YBeOIo80BUkf1k8rDY8//XE9STc6/D56GRhJJwV5Ev5oJhRzoqVKwsSmm0vXgELq3
 VA3dFOrDcZrKp5rm0AnP9bOnAltnxCuiPwrwVUNS2fgL6omTSpWiqBXdNdRZA60g4W9I
 eA2C0Zf6USBW1+5jJL9hsKsQZ+YibH88pjBx3XcQqiCdHyi6tYdN6h6U8vKrgIp/d+Tf
 w0RhojZTtIO9o10TPk0W3f5/8ekifzIaNvySfzMybM6/ryRYZ7w9iWAGkYjiQgUZxkmW
 NivND15yZ7gtGny/kREwUh7LSVaOHyBBSiOS25oirtGDYSxs+eD4AwUWVTggpZFyStsM
 VXnw==
X-Gm-Message-State: AOAM530Ixlguwo8N9cAUIGj1X7m5ZXqnhYt36aa8TAd9HtRh4Wo1jFHr
 iKg9YCexj1BN9whegScqpODQMQ==
X-Received: by 2002:a17:902:820e:b0:161:b3df:46ea with SMTP id
 x14-20020a170902820e00b00161b3df46eamr43037530pln.13.1653675585169; 
 Fri, 27 May 2022 11:19:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 039/114] target/arm: Use TRANS_FEAT for do_zz_dbm
Date: Fri, 27 May 2022 11:17:52 -0700
Message-Id: <20220527181907.189259-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VibkxRVlh2Wm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7938c5393e..6fa721eca6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2046,20 +2046,9 @@ static bool do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
     return gen_gvec_fn_zzi(s, gvec_fn, MO_64, a->rd, a->rn, imm);
 }
 
-static bool trans_AND_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_andi);
-}
-
-static bool trans_ORR_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_ori);
-}
-
-static bool trans_EOR_zzi(DisasContext *s, arg_rr_dbm *a)
-{
-    return do_zz_dbm(s, a, tcg_gen_gvec_xori);
-}
+TRANS_FEAT(AND_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_andi)
+TRANS_FEAT(ORR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_ori)
+TRANS_FEAT(EOR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_xori)
 
 static bool trans_DUPM(DisasContext *s, arg_DUPM *a)
 {
-- 
2.34.1

