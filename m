Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4036443lfm;
        Mon, 24 May 2021 18:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5x6XcxsAlwKc9ci2A08nfMFBdjO2MAsNQqCgofYZixgE4OqiBOs9SsMX5zrGm6TeaI/Mo
X-Received: by 2002:a25:be41:: with SMTP id d1mr41024193ybm.352.1621906893682;
        Mon, 24 May 2021 18:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906893; cv=none;
        d=google.com; s=arc-20160816;
        b=klSO1/a5AEiE7j6VFFVHmF/87MHCPmRhYrLsLgLFmSsVspZSZl2fA2id4lr5fjweET
         uoQjHgE5kjC1jhJ5jjFBls1BXGmvNyie3EQozW/ZC9pZFOh6fyxcnsEEmSGyoGn/iBCS
         7o8y6Ii8VSM3tvmbWiweu5tEHe4GsHKFkcHSTApqWQJXfDYJwK1XK4SEA96/Gd9m01UV
         vniTzwH0AqWmCjoOFGAZTwhjY58HiIGvJ/Xrsul0d8dU0oeggVAKNQepOMyXDYaHSVli
         PgN4Yec33jRZUj6nzi/WeD157NMExMqSktJcVWfuKJrsqstugnmKlG45B9sILcvU1TIC
         d16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xVLmkte3/X8WeOPRHb0OAi+AOLu5ah+uxiTRZR828b8=;
        b=Gzx8dD98arycvuDZ/pjJfmwqLLUPOYCUKec0aylenoWJCryXwDpl9ocuagn5qzVQiS
         JLrL9FM1XTBm+PnivlVqirkpC8+JtBbgGMtqH00bKJLYvj5EtQqcYIzAjAmuX8hEEnVz
         nnKwSu4mM3VhlmsbT+RzJqkJmivGsd9MKsKLz2QH4kjTl/8ROcfLyc8ibAEf/x+wv9+M
         7YPdubj3bZqMnuvoI8nVyAFi7Isu3zhuktUuE0oUngHJm8Ec0p7vcBqcjbmf9jFj29Js
         3hC6GiawrmisF2FFdtH/CsUjcWiDmHoTWwYui72baazG6DLcK9ab2etwIFHMSD967plH
         odEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dXsAbzQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x124si14302213ybc.463.2021.05.24.18.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dXsAbzQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llM4b-0003jU-0a
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXw-0007uU-1U
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:07:48 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXd-00041J-96
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:07:47 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e22so5664941pgv.10
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVLmkte3/X8WeOPRHb0OAi+AOLu5ah+uxiTRZR828b8=;
 b=dXsAbzQfuSoNAh60M8w9PqGejS9pb7zhvdt32oQ/WPbJWAuhv3VrtNHI+ds1EjpupQ
 sVJJen/zU1Nc3woOC/mgSFb7LLr331ce1IN7rzJUZg5m3uM9hG2ameTNoy/Nb4O3IhzP
 d/CbZQ42iQPwI5dK7anIOHGVdIT0BZvShOzfjnSUa1NNRg9jQ6CZT72XLOqbncW2ynHQ
 F0NTRGcUaDwT1KxLU9f892dqhS2ORHQ6c4OLqgM871RiKuLZQQmZKTR43osmQ7N5pzeO
 PJerB6ArtyO95t+2pow9mu19ncmMIF2ahKlRO5qn6D0S/03sDCbIN9TK4n+SOZnLkLE/
 E9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVLmkte3/X8WeOPRHb0OAi+AOLu5ah+uxiTRZR828b8=;
 b=a8bB5FAyQ62OqDiJVam3oqyb2WkI4fsYoWuGA7SzOkzlgROTDZlktbDRaTLY6g+4a2
 FI2XOwXbqLWk76rTNhNdgJImmDiGwm0YUrgejm66Ds710rqtnHRALVn1xf9TFXfZNo5K
 opPXsRZSpwY0uAyyP4VNgfmCjbi58yZgZwIGSda0OF90JXEAvl68IvVhAnVS141M3jQ2
 NxP3QltoPg3FXYlqptR9ESdxStoDimD+8yH0/d+ystnNq3O3g+f38ed7Zr1D9S+9XslP
 if4ZnptgbYeR4ufgudwgTPhmbYmbQz2iE4gHedBqAtptxr5UsZIPqnI8paTLPKNXyvFW
 ih3g==
X-Gm-Message-State: AOAM530Muopf6PfxbSDcd0BeitXppkox/EbFKys8uZgWvSKjSfFDTAW4
 cr4pIMFYU/g94HxJno96nqR3VA==
X-Received: by 2002:a62:2743:0:b029:2d5:897d:7481 with SMTP id
 n64-20020a6227430000b02902d5897d7481mr27304397pfn.46.1621904847593; 
 Mon, 24 May 2021 18:07:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 45/92] target/arm: Implement SVE2 gather load insns
Date: Mon, 24 May 2021 18:03:11 -0700
Message-Id: <20210525010358.152808-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rmnVtPXCw+ja

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
load insns.

64-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1SW
* LDNT1W (vector plus scalar)
* LDNT1D (vector plus scalar)

32-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1W (vector plus scalar)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5cfe6df0d2..c3958bed6a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,17 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 Memory Gather Load Group
+
+# SVE2 64-bit gather non-temporal load
+#   (scalar plus unpacked 32-bit unscaled offsets)
+LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+
+# SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
+LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=2 scale=0 ff=0
+
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ac43bb02be..a64ad04c50 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6015,6 +6015,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     return true;
 }
 
+static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_LD1_zprz(s, a);
+}
+
 /* Indexed by [mte][be][xs][msz].  */
 static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
     { /* MTE Inactive */
-- 
2.25.1

