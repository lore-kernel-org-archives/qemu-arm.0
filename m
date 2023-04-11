Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183654ejc;
        Mon, 10 Apr 2023 18:07:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZLKIu3ZElmFwv4JdLp3MNT7HM+IkZIhF5ueT9W0XdUozrkNenqDnsik1ks8kPIcf6tXFf7
X-Received: by 2002:a05:6214:500a:b0:5ea:c6f7:6d2d with SMTP id jo10-20020a056214500a00b005eac6f76d2dmr1979500qvb.52.1681175276272;
        Mon, 10 Apr 2023 18:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175276; cv=none;
        d=google.com; s=arc-20160816;
        b=kL/6fgCBaGS+kdM8IavmoGfY4QslrxX2KB6BwFruP6IYXF2DGUbimR5L0UntzOVMTc
         dW+kM1lxbCYy60XzjEMM4JepG6i2XMsMd8dh71s3z/Bg44sCwaCjoUnhICfIuSIlIQ0r
         +3nqNJLMUhStfNeYjHmlU5oiELuBq16zillt3/nf7xH/wpTLgeq15uv+ah83tzBsh4QS
         E94xnD9cWO7BidadGAoUdb5bt1tup93i3I3tFRFcxgC230tJppg6b3eSUmHwIRQacIN7
         AixyN9fc7HqfLrlRmUMdRJ9ZTuOueYCrobq0yUcwxz8J6tz1BL4WrOZ+lZIw83Blz7lK
         LbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
        b=Yzs9tsGV3zzsUxlXrSwEz0X45GIAaVHG1YL5EqOofZF27R+VoqBzWlGABrxmhJdov7
         q8XDqETMI2LVHdExDDC164ytDng+xVBq/kscfsHVD0SKkbdz+6bhGNFHTbN996KSUskw
         7fPFPF69uAIxQORsV/v+I4lVBWy8hJp1S0TONRAY0PKwNtsA0UKfSwhB6HYkPBtcOyM3
         j9R6sYjRCztOoqFb17kqwdc4RZT6ZgiSISysP7/AalDaBSaadnBr0RSaG/6L1nIC2Bhz
         tiiPYO2NZgX6no4FjyRpP+s5r751vqkhxkKS7cVDstVF3eu9GL3wG7xAMpHmmxLjsE2T
         g7+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pwXZhKpa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a056214124900b005a24f4dc34asi8574479qvv.326.2023.04.10.18.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pwXZhKpa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Sz-0005iU-8E; Mon, 10 Apr 2023 21:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SO-0004eK-Ha
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SL-0000Vl-4r
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:58 -0400
Received: by mail-pl1-x633.google.com with SMTP id y6so5182845plp.2
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
 b=pwXZhKpan0IPi+5Q9W/jlStrSUj+zZ9TCBlwY7LbNs0YF1GZ3cjFcZCFsjqd+OGUTk
 NGoji/Ov55oIYfoi1MI45Etd0JAE31RP3kV/NAs5qCDacNQ1jm0iL67lGpehWrvtYtHh
 +kJ9nHlZCYtFcgfsWlp1BgJASPmQA2MtBea/4WO4z1eWrH4v3QvbckJSoFLi23U32CQw
 8zGgpiFLY/O2vi/k0Q5VbQkoUVLwritOLH420cjI/ErfVkC28vhvD7uj1ieYiCqyOhfG
 Wh8KVNGrwxHFdIJ8U9n3HK/atCpYOX6KZcIn2dRNbE0WX9Pu1Fc2CviDsG/Ry9bbqyVd
 F6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
 b=CKPuS4JwNfpts0NQETmyFqUY8i59K45j8FTwmKhk8oHUD5OtyL5Pi54wrGPKog4VLY
 jjyA147kH467+rtBg/dMRuMiv8r4hIpn9B1ZbTJtmjlnnTyVQT91hw2xm4ZSpcCC0u4u
 8w0WhnNTNtLWkk8F33WWXVZBeniQDLjX5sMM2uZHUkUmzaKFLac6SoyGLbCy9blWM3I+
 Ah46MIsXzYyxvSflsWkMsOWINQepBBzZRVHgW1fxlpkScSRIDonPRKbTtIyY/Zn1Z0Ep
 cjuI/SAgbJnPMaoxHYEFy6h7bebc8bZNfzx8WoBTNwCi+xZaiCN+fyYCvEZIC+sInRT5
 O6lA==
X-Gm-Message-State: AAQBX9eT040w+jYGnwdghh88BzmkWS7Ww7zmZNMwLHKnAmdAefBABhy/
 9XV8MVg5xA+206qyauO52gFc6kbB+ovzj39WtjVnBw==
X-Received: by 2002:a17:902:e392:b0:1a3:d5af:9b73 with SMTP id
 g18-20020a170902e39200b001a3d5af9b73mr750305ple.58.1681175154474; 
 Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 14/54] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Mon, 10 Apr 2023 18:04:32 -0700
Message-Id: <20230411010512.5375-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: QQQGzfP/KlF6

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 40d661072b..a156929477 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1306,7 +1306,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
-- 
2.34.1

