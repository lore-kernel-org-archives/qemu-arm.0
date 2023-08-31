Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp261007ejc;
        Thu, 31 Aug 2023 16:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwj340rs+2rqFciRkJ1vNU0V5T6+ZiiMiQbr6E0tdRKXBCb5KXAvd4eUDgL22In2Fl6dK3
X-Received: by 2002:a05:620a:2412:b0:76c:b0aa:cfd1 with SMTP id d18-20020a05620a241200b0076cb0aacfd1mr792960qkn.37.1693524341529;
        Thu, 31 Aug 2023 16:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693524341; cv=none;
        d=google.com; s=arc-20160816;
        b=iNmAfRt6cqBXv0uEY4F6I/D1A7aiy1UeikfyDfHUwXKJMhItfx9+/gdI5ZkEjjF/br
         rh4DKtxPdfvZKIiW/X8lVwg4OsX/pr4ZLqy2WwmmWUYzeLU/1Gvx4A0LtnWXKPGbVCEN
         usfuBYhSTuTgDONhJH3A3o6yEV5IVSiv5Gs/XBDmGSvzRFZidlayXVcstjE5AxXR3SSY
         ZLfHD6ngHfcyuUnChBr1SHqyKkEYxpBCu+ZNhyljfpGfk8eiQmieiEyhPvVle187C7DU
         fLOlJfJvlKZOZZqEmIlfsOAzU4R4pq7CwIkDTxjDLXOGVI8zAF/jSaMuKq4W7hBKGwwX
         SQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WknjyyvkUA5R2BgSlGNmVEJEpeTJCnFvoRCppP0P3KM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=yJiRK2PyZAPGbzEOi4CdUf+E1RaCXIDtmS90nA+8pM0LrT6mQyGzhwPx5HufsoO9X1
         yOgYDdxxgYgyvxStnl+B6FAZOVUFizE+3V2exCRQuLc2E6axeyVPhxTK+2mrg6Tc8kwD
         TKyOaDKAphi9kV7fXsCHWQN8z0CnIo1uwfRNBiaUL68/RIR13fn2oj23x2LevpgGdwwz
         CR+sL/+lYqNZP+EeBhf23OgtQGRfGOcRvwUgiTlKI/+9iG3xbLJ0zRW5o7eihthj6x1/
         BaDVCUJL2f3foI9gGeTOIiXfdfjY9oWV4ps0xw+lzc1V9s3WLqygdwC10BfMrQ6DE5PE
         uabw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ID9qTH1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dp6-20020a05620a2b4600b0076da695e1d9si1563016qkb.431.2023.08.31.16.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ID9qTH1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbr22-0006pN-R5; Thu, 31 Aug 2023 19:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr21-0006oG-Ma
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1s-0002Hu-DB
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:57 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68c3ec0578bso1154902b3a.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693524286; x=1694129086; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WknjyyvkUA5R2BgSlGNmVEJEpeTJCnFvoRCppP0P3KM=;
 b=ID9qTH1e8l70XOoWNZbmTClNjyiLUsqvM7NxEdhHgsY1mzvcMw4mtuJnYAMXnhwr7W
 4jixWe8CQMs9vIJBWlRGnhq2Ra0T4kxUVSfASPt48xAQao8j9NwT09x4h9tR88cpzRzK
 mF3UB1YlDle7hgueVppK6ZL4HThyP6nc+skv+3I8Tzn0a7UmRb9jw8673DJWQ/kSxcgT
 UcXAbyv+LQHGSV2MiTzLupkVRKU4GAH2tWVC/rFz+/STpy4PS6yWs7QAH1OodedeYUwh
 s8xOzYPq6nU4asI5CeJ44+i+2RhGkTj3pHXk0HZCrHmRcGOPeGcVbdECjBFc6uucIIlt
 PmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693524286; x=1694129086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WknjyyvkUA5R2BgSlGNmVEJEpeTJCnFvoRCppP0P3KM=;
 b=Bg/lTpvTy70lWvB+LFlsfECbBFKqeNAFyMpZLCUecNtX/mJ/h8LTi3Ko351OYo68sb
 GvTCVNkNST2gUOEDQE9UjRi/NZN2Ea9gAt6OLRakP7FXVF9ij937QNJmkOJNaPuaZcVi
 xAToxLfv/8jPdCCx2ScAQfqAJ2XENvqSMEhn3Kun+7OFzZi4NI4qt5a4/GtWZ8m+TCrX
 zbZe89QkVbPNYSjjUn6PrK4omxhzFA1ZrE/nXfTTvBxWxFwC1QpiKAr1AynJR/mXFuso
 zs7Zc8M7nzPOzsA6YN+ff5H8ACEBtrf4zVyHj20sXSDqI41aw6seB2xU7N7DOXByZgUd
 HkqA==
X-Gm-Message-State: AOJu0YycvCjeAjA8RAXJuhCE/25fIA3B9UP9kGduClrUp7ShWy37fMyt
 5Qdf2d7N4WPoCVMSw8C0oEi+ww==
X-Received: by 2002:a05:6a21:7742:b0:14d:f8a4:d0d1 with SMTP id
 bc2-20020a056a21774200b0014df8a4d0d1mr1171762pzc.35.1693524286590; 
 Thu, 31 Aug 2023 16:24:46 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001bb8895848bsm1732711plb.71.2023.08.31.16.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 16:24:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 5/5] target/arm: Enable SCTLR_EL1.TIDCP for user-only
Date: Thu, 31 Aug 2023 16:24:41 -0700
Message-Id: <20230831232441.66020-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831232441.66020-1-richard.henderson@linaro.org>
References: <20230831232441.66020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: ZefmLFOnHJxK

The linux kernel detects and enables this bit.  Once trapped,
EC_SYSTEMREGISTERTRAP is treated like EC_UNCATEGORIZED, so
no changes required within linux-user/aarch64/cpu_loop.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bb0585441..b9e09a702d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -243,6 +243,10 @@ static void arm_cpu_reset_hold(Object *obj)
                                   SCTLR_EnDA | SCTLR_EnDB);
         /* Trap on btype=3 for PACIxSP. */
         env->cp15.sctlr_el[1] |= SCTLR_BT0;
+        /* Trap on implementation defined registers. */
+        if (cpu_isar_feature(aa64_tidcp1, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_TIDCP;
+        }
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-- 
2.34.1

