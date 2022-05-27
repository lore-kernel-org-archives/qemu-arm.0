Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1226412lfh;
        Fri, 27 May 2022 12:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm5+4/ZsqwzhSO9DBiX9zAIRBn+paqrHR/2qLjy6SXQFCitSTOjUcmpNX4GmaUD+JH3mu4
X-Received: by 2002:ad4:5dc6:0:b0:461:e12e:932f with SMTP id m6-20020ad45dc6000000b00461e12e932fmr36278748qvh.115.1653678111775;
        Fri, 27 May 2022 12:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678111; cv=none;
        d=google.com; s=arc-20160816;
        b=X6YjyNaGWQfyOtfv9nPrhSd0Y2sa4akXC5R+A2arQM8H1nGBTfI0hqCOiv/q6MNjcp
         t0xmMYk67nY0woOa5ONJI4OI+sFV0rEYiYWcYo7hn28nSy1eNGekGndbEjM/+vvF5g9N
         TGJekUW+U2qVIvDOLS7Kmrw96f56jTayOEVveoZ4vnOKpYRH38viEsfgW4lhUTO63dsY
         EcLODRJy1uhmkYgZk8cfnXBoM7LlrvITMcpL9BkKzJtJ1b9HzhS/f8YtVMhVdBolcoeV
         e4iZZaNjZ8vjS+OIy7EUrz/OmP3P3V9e6fbpNGGmQscwAoxHY/mWD2T7nREENDAkMw+p
         o4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ae1R3S9CZr6dsrirE4eQqaT1nWC8LLDmdYj1ka/aR5s=;
        b=YWGWtbmq4zP5nPkesmGmkdvnJmM+50ulzacd/oTkr7Z6ODaKbc8XDTHCnvkw8+nACL
         TakUTIuwgIebtil8UTnlRrlcP32ofmIBHnjGtPofzC8m031SYbtN0ixYEwZfFTuIK9eI
         9UkqKjWzPwBurgL9lsH6DaAsNE+u1FofNchQ0dR951flFLGcwQRkZ1T/CEIk1Vw2GJE4
         MstJs9extcTntqSfj/xjfwdaq4HBO8taiaFK7ZMTzJPW48t04I4SkrgtSYxXwpviYnCC
         ZDLY5nw0y6qbUC2YE7xONzc4qcMFfwH3Xk0i36QjAEblDs4DNG//3ihXWxDf0uSCtfPZ
         a/Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vX0fzv+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx11-20020a0562142b0b00b0045647eb02f3si3303544qvb.346.2022.05.27.12.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vX0fzv+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufDb-0001Uu-9r
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003ay-76
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebz-0004Mn-Jh
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y1so4987154pfr.6
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ae1R3S9CZr6dsrirE4eQqaT1nWC8LLDmdYj1ka/aR5s=;
 b=vX0fzv+GEiwIg7dFjflsQXqELVMVBupI7oWbglYhr821+tEuyHkjG/q12phDW6D8Od
 yv0uTw6JCyVrO8Pu4u5kKyB80eIt8YrsCPVAa0ltWf0a8kOXOhVK9E6/fm/JoiySb/OR
 lmftq/9QQ97lUYoYLMgLLjgo2wI4yFOaEabf8WYwlUqkI9mk4tOKZK5L4WVI6WbLdN3O
 ASAVETLR+EkxRUWvWpATUHKnS5jlbyTIMxiaVD7Nc8nPH4YDr+uHG7FetX4t0XYr3v0/
 eYtI3ZqMj3Y/HtPOpn1ReHpfj8eS5QyWD7CxY1NJo35e3i4kgT0TLO2gurP8PCCyPpO/
 2sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ae1R3S9CZr6dsrirE4eQqaT1nWC8LLDmdYj1ka/aR5s=;
 b=dnGPQnNruqhv/iqvBUa79tfgOmXpAKfw0PQ62kProClg3jjn2efp+vcJQ49a/fV3FG
 uLw+lh0NvWucGii5arhYXgM+JxpAiG7/YMp5hI7hi5N5DB3XueJcBigv/L35cmhfd93j
 eDDy9ae1hi2UvOKDdYUH1Vk1dSMQmA2cwUAK/dI6fifG52xmFxdU8w9lwJvvXARmm62+
 LZj+Gx9bBH6rzR/ELotqV22L/C6EUWyMTmbvaCqRw4mggumbxoEX/8MrLqCOt2hlLWXi
 QLb3v9cEbCub54EBdtfLkqR3kaxccG9LPDXDvFN/CCjRvlawgS/pmvigYkxs1pJH6Oxp
 PLPg==
X-Gm-Message-State: AOAM531nLsmRL6rhI+AyTV6XZaDVRpWFkMuG8D8/1EBuo+vee/qkGEg4
 KEeodjEs5Cjj6+MEBqBkF9nEnw==
X-Received: by 2002:a65:43c2:0:b0:3db:7de6:99f8 with SMTP id
 n2-20020a6543c2000000b003db7de699f8mr38372276pgp.347.1653675777803; 
 Fri, 27 May 2022 11:22:57 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 053/114] target/arm: Use TRANS_FEAT for do_pfirst_pnext
Date: Fri, 27 May 2022 11:18:06 -0700
Message-Id: <20220527181907.189259-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 8ngEUqMFD0CB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6fd9a42ef9..abb5433ee5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1668,15 +1668,8 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
     return true;
 }
 
-static bool trans_PFIRST(DisasContext *s, arg_rr_esz *a)
-{
-    return do_pfirst_pnext(s, a, gen_helper_sve_pfirst);
-}
-
-static bool trans_PNEXT(DisasContext *s, arg_rr_esz *a)
-{
-    return do_pfirst_pnext(s, a, gen_helper_sve_pnext);
-}
+TRANS_FEAT(PFIRST, aa64_sve, do_pfirst_pnext, a, gen_helper_sve_pfirst)
+TRANS_FEAT(PNEXT, aa64_sve, do_pfirst_pnext, a, gen_helper_sve_pnext)
 
 /*
  *** SVE Element Count Group
-- 
2.34.1

