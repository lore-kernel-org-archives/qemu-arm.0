Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276279ejb;
        Sat, 20 May 2023 09:28:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fDbnRu46oQpDuM3qugp1rxTW/ONPxyQIGoxVW35fgSJVXoHzSoxLipmBVulphCqF7siBf
X-Received: by 2002:a05:6214:623:b0:61b:6e28:5c3a with SMTP id a3-20020a056214062300b0061b6e285c3amr9315620qvx.27.1684600093633;
        Sat, 20 May 2023 09:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600093; cv=none;
        d=google.com; s=arc-20160816;
        b=EyhmdvItdjjyXUxY/0iGQ6MkqkfJNZjqLLUwcLg/OGZtR1W+wuteGsdpH7EhFf2eSS
         unMNEey/TLN/xFOOYwgULQujbPBSEfTUH944zKqlffQE6vjf0LVnRz3RSEeXS28Suhft
         TWJeS+n/caTrRjBKFFx/sMVq3F1Vx3Ri4v0pjo0fvmQnBYy/mH+b+l4sf63JZcDyB0fC
         RVsltJuaDPcBNoRi2SNF6zMJk40hbr9diQxijLhVO3t5WSCaMwJB+sNSpnts2By36FQJ
         JQVQzaXRi5+yIXNkcK0uZHjN2pr7C4GxfebW0YTXaE1ACKsRdVUHJBW4IPdA/qpiVDUF
         zZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6WXDf+ZM8xKRR3ok9Sko5lUMigoP5WIzPelyBaHT6/A=;
        b=xHLDfXRJWWGX6Mjt0/NvSX02qwQtQdFQFdyTFWEucQw2WsUCY38TC/LIlPRyCJEUMS
         uboaqU0t7NzEg9G0Sxp0acytZxMhVY+/zW1Nn47fk7UWeKTImpDUpJDO0fgJAoGh3f8T
         i3UB9TBtzpKgqIJ6AbGYndFatvl2TVqqsSOzYn5N/Rr0m8Pm7Rj8bY9rjzR6CORXTd9r
         UI8KxUddnH60z0BcCMal71znEfXK3sL8QYGJyfdyP8I2zohE1HDZje5+gD3luq/L+5th
         /XoxYJIpnuprhTHuJk42SGCxbz/xiSwCwQGRPLeeRpRn8qeGVq6AfCR/K/7dxveDCVbl
         HIHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUixfCHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a0562140d6500b005ef56e4f61dsi1272131qvs.24.2023.05.20.09.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUixfCHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PQS-0003y9-Qm; Sat, 20 May 2023 12:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQJ-0003oS-RM
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:15 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQE-0003Di-He
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:15 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d2b42a8f9so1902457b3a.3
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600028; x=1687192028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6WXDf+ZM8xKRR3ok9Sko5lUMigoP5WIzPelyBaHT6/A=;
 b=wUixfCHPzv4t4m33BQzAwn58Cw6b65/96GrMJuwsDRylO2TW2hHfkgTZ8tQRBQzjLm
 R9jz4khe9Z7XEeKDn74C0wmfSdws6D0fQI8ndPID73egkLFouW93b0zyR8JznVC31VUU
 5eraGvW+1QVoNH+qESq0SamQ+hBHtM0Qzj6CMWnAP7/hInANMJM1l9V7AYCGPa9PyR4w
 k8LGYAMc+NJ96JJqo1pgCTVan/4718W7NCoXp87u31H/9xCox2C27GkejHfG4pafDEg4
 WISn/G16TgYlSHV4ls9FkgcEQ/jgN+35XBqMqURyWdvMHgu+spf7dy0v8ZWQ6ODpZ7GW
 JHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600028; x=1687192028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6WXDf+ZM8xKRR3ok9Sko5lUMigoP5WIzPelyBaHT6/A=;
 b=MOZ/dBKlBFgNPuOrI3b5Aw/bECmEYEMS9sozimI0S2poMpL1wrVR+7nfM+QDzvy7je
 KMSw7ge4Xy9rBNpLmdeKMpFH8EpqSs7w/+4czSQr5jUgKpjTZlqYFAkZdGWNhmrdEyZI
 cleCnL6C6cEw8pVJGTOWgO3U5cFg+q9dwdk85nG7c7+EEosEnQJA8XSaysp7ZKReWDgd
 cr1oYLcTbsku3txHdw0xPB4o6ysd+tIrzir7Dcs+W1uJuSZK4yBVY6GCyki6jDwcBw5f
 EOmyE9DvBCzAG2geZ2hP5GBZH1CjJobGZ7+K8Er3ZEscDeoMh1VeocQw9apxQ7f4/7Vx
 ldfQ==
X-Gm-Message-State: AC+VfDzY3oibhgIXKHyf4Go/gwOCtmFjvytKrdfHjZeuzTSR9chLqWkf
 7X7PUJwedSoajIs31tS+fPvFFg1qveqCP3WDzOs=
X-Received: by 2002:a17:902:d511:b0:1ab:7c4:eb24 with SMTP id
 b17-20020a170902d51100b001ab07c4eb24mr8129667plg.22.1684600028280; 
 Sat, 20 May 2023 09:27:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:27:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/27] qemu/atomic128: Improve cmpxchg fallback for
 atomic16_set
Date: Sat, 20 May 2023 09:26:32 -0700
Message-Id: <20230520162634.3991009-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: eQHOP4u6YYKS

Use __sync_bool_compare_and_swap_16 to control the loop,
rather than a separate comparison.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/atomic128-ldst.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/host/include/generic/host/atomic128-ldst.h b/host/include/generic/host/atomic128-ldst.h
index 79d208b7a4..80fff0643a 100644
--- a/host/include/generic/host/atomic128-ldst.h
+++ b/host/include/generic/host/atomic128-ldst.h
@@ -58,11 +58,14 @@ atomic16_read_rw(Int128 *ptr)
 static inline void ATTRIBUTE_ATOMIC128_OPT
 atomic16_set(Int128 *ptr, Int128 val)
 {
-    Int128 old = *ptr, cmp;
+    __int128_t *ptr_align = __builtin_assume_aligned(ptr, 16);
+    __int128_t old;
+    Int128Alias new;
+
+    new.s = val;
     do {
-        cmp = old;
-        old = atomic16_cmpxchg(ptr, cmp, val);
-    } while (int128_ne(old, cmp));
+        old = *ptr_align;
+    } while (!__sync_bool_compare_and_swap_16(ptr_align, old, new.i));
 }
 
 #else
-- 
2.34.1

