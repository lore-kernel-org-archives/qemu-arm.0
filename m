Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1037571ejc;
        Mon, 22 Aug 2022 10:18:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6RBL+ap4Im2b6QndnsSDwZtUuTk5j5VjYg+1YuDYj2i7Aiy/s0cWh/ZGGo9Ol7t+nLjZzS
X-Received: by 2002:ac8:7d8a:0:b0:344:65fe:834a with SMTP id c10-20020ac87d8a000000b0034465fe834amr16031259qtd.649.1661188684550;
        Mon, 22 Aug 2022 10:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661188684; cv=none;
        d=google.com; s=arc-20160816;
        b=vpmeHO7rxlrkH0ceBCWutdK17HH0LbPkXJq1h3aJey8kI/uSvqaignMQwh3l96Ek8p
         OcZnliytaOKEPK6KrTNsWlURblHqAdPWVZ8bcnPlR413lSKPznL8y6Mhs1LZxl/+JfSX
         ymCp1DP1nxK5uM+VEynsmp83Rr6dVEMj0SPkuXYD3uA/fP88JtWkIPk3S13Lvxn4z/qd
         Jz6B/YovjdHnizL5XEOvikzDwq7bsBVy61HLUi2VgYdPQPdgtxuR0FGnsM1t2MJ8NUB0
         G3lQUamkD2P//iz/fWDvfkTI3dC7n8XfEaMuboTQ9HzG1Jma1YlFE7AJKdcddfTUlN00
         qO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
        b=k6is+AbdS0ggiR/R/HEAW4qKPuuOpj3LJEfodDzB6u7atnFORJQulxRqDHaNlnqgTi
         dZh9XpKSEiwtXFQB95ghIfFI2kXYwdWsEPJz7CLGFhJCJ6HRZuQ/k+t0Oqc8CxTBgYMD
         62qiPqawauSUqut2Gc4HZAjUEYT5klChJhNm6hBf5ryAtv+SL22iB3X3WWdCjWcqMjy8
         OGHPl5MtbnIJkkN8UEd40rlyNlJmBf8pdE6dJQsZYrxGM7tT8zMu598dLm71d7q1mSCo
         dN29pFWsB3oQA1uuUPvjFlgJlkkC0v6nC53n54MTcWg2cvWS26OIuyBxlF/eWdJQatUC
         1f6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNxbfM1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85742000000b0034455c57df9si5509147qtx.257.2022.08.22.10.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNxbfM1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQB3s-0004tK-0m
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Og-0004dU-V3
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Od-0001bM-SF
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id x23so10240710pll.7
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=uNxbfM1LG+tkQwT2rbn07Zh7psqGNLMvTCti+0WRgNFkXLbuSUyqETrHtr7TdfYxDe
 428itT65OgxjTCHR8iZYXGSKdoyd2jq1VTnCSQJqt1+ukIF/kZG0mKfHlfus5kOPI5Ka
 KIOWCPZ0Oh28Tw0sYiOkklN55wi2OLAd4a1909QdcEUBsJcpg4erGyGzQi016VqRJ0Aj
 bHTGG0j2h9UrYGAjsCHCN/EbJYu7ekfY8zsVXeCMnmnBtkFe6NO4jduekuu9PUPG9C00
 fQYHjqXTkMRiFpSZZbk8jHCKKP0LeQL8MwXnY/lAD6J6vf1NPPzGvPR/3Tl7AyusmF8L
 HUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=1XxjN+tYh/RX2SCSveUJ5pop6KOb4ww4Ce40JF5zi56iCavOViHbzGcosjDk/AAlBH
 7Kr3EIWWQ8f0BUgXwdZ27FoKYAE0O7eylCCJW/fqutzBb8InA0crvinFR2Xxy5r0JS2X
 hv/+Yhq9N9s86I99QA/B9Z12qcskoxpdZhk0nNWTQxNTRyJBm6uxiR4RwKL6RC2ulhFL
 gpI0WgyXi8kWvM26bD/ixKkvi+7E40347Ugji6ygZryfhz6m/Du2TJ6R7/wTeyMG++ju
 r+f5y8Rz4wc+M3FPIgIani98OkxhKm/79tg/t9k53/a47UcsQKGm+aDfvqCn8eefV9v3
 xLxg==
X-Gm-Message-State: ACgBeo0CqFFFD1/KE6DniN35/ougz72S+Tp/JwP0taQCNxrZXwLApO8I
 jWhNF3H+rNh8lCz3VCfUvO3H4v+RA6ip+w==
X-Received: by 2002:a17:902:eb90:b0:172:f986:a096 with SMTP id
 q16-20020a170902eb9000b00172f986a096mr1681082plg.94.1661182281916; 
 Mon, 22 Aug 2022 08:31:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 43/66] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 22 Aug 2022 08:27:18 -0700
Message-Id: <20220822152741.1617527-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ruxykf/6h4MM

Allow the target to cache items from the guest page tables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5e12cc1854..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
 
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
+
+    /*
+     * Allow target-specific additions to this structure.
+     * This may be used to cache items from the guest cpu
+     * page tables for later use by the implementation.
+     */
+#ifdef TARGET_PAGE_ENTRY_EXTRA
+    TARGET_PAGE_ENTRY_EXTRA
+#endif
 } CPUTLBEntryFull;
 
 /*
-- 
2.34.1

