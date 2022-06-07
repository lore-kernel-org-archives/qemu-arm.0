Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2404636lfb;
        Tue, 7 Jun 2022 13:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyCB0MBAYzX2V+ZFDqwJJk6bn8w5y6hB+Lp79vifDOfov6Fef1BYTrx1k+/g+DwD3Tq7Pr
X-Received: by 2002:a05:620a:459f:b0:6a6:cde5:4f73 with SMTP id bp31-20020a05620a459f00b006a6cde54f73mr6290276qkb.450.1654634433729;
        Tue, 07 Jun 2022 13:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634433; cv=none;
        d=google.com; s=arc-20160816;
        b=Tix4NiN6RnpdvEW2NoTJrNXlI/0VGz3k9JoOBjrAKmkzYzyW8G13hyfVPySDU2XjAx
         s3iOfBTBAhSeqVK+N3qRzQ7bXweRbLfPcqLHbMNDI3fJUleGvKPdhHswNA0bXbziGDb4
         kqHGkeIkoBjKrj1eM75qktiwoLtkynRziGhR3xTI9v2MuMs1ggDi+w+Mc+oCn1Xect/U
         5PgOyN1ohKcnxHloj3S235wE/w09VH7+Ty8Bl8Ry/goAWuolq750a5ODrLDl/J3yOKNB
         E8zih8L9ODKVOrgDkQNtQ9rs4c/pfOZq1mKS6Sq+Q7dymNIcb6nJfMMgH9P9iQFavF8m
         +B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3ImGeL35V1VptULMhKWxD6rBwxNJOjwQ4O8lIdXg7Ns=;
        b=ru3Uj9pqHc2vvjRJZ3LJlYa9efxhT2D3UCf8GaOu6yixNA0XAfR85FvKTpQ1Yi6jwH
         08TxArYGeL9HUphCz3YSNhcN3KshJ4fN7w6iAj1SjL7c/0TNvL2d2BGfi1LmWEXvgbpg
         Lt0Y0sTK6f6xYMnhIROsUutEigUy1qpmaJJzYr5PFsMkbOj02+mocQ7Ctc7CI9jPuPTl
         ZpcO0bE/n0L456BRmo3uLM1gYDfb/xbNrBK7dUnrPOtb7Bk3AeuP4Xr8m7z4ThDcICZC
         mPnjbgMoWhWMWv4cpQC+ThWqKjN8pHAwf9ZiKI/hRHMUR/2QPu9RAyxA4rQ7wDKyyeho
         rPzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hHsUQU11;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05621421a500b00456390f6fb9si2694115qvc.414.2022.06.07.13.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hHsUQU11;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg09-0004AV-8A
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftC-0007T7-Qm
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:22 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft6-0007Es-TA
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id gd1so16669702pjb.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ImGeL35V1VptULMhKWxD6rBwxNJOjwQ4O8lIdXg7Ns=;
 b=hHsUQU11WBe7700oxpE76yF0K/G5HxsqeHGCcIv/qwNA4vrOltJYMAdqTJaNFnxUpB
 utbkimkUsAkmRarwyNcEME+3jK/J4p3+4dx4kXXiKOIXYUgOggTGLmiIHL8ou4qLH4yo
 I+2uXi1r7YDNsZo8UguXcxWwIxTXHg9ZMlK9TrWh1xGH1MxCtxfejHyhd0ZW20g3u9J7
 Ts0fyo4cNhSVLWSrq7GxaKI7W3uwS2RS+ECyeOEs5QdFPD+Q1FZjVwjUv895obkRf8M8
 iYQDrY7X6C+MPaHIg7FLotSjKKN8jC00b7ygVJiyjHyoW/QofzmSJcuLIrDnukUpOYIB
 m7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ImGeL35V1VptULMhKWxD6rBwxNJOjwQ4O8lIdXg7Ns=;
 b=CcHSF+niQoffR/DXXuFRLu3m+Vlhd6VDA8ndg1X0Avjz5w9S6ifAZMDXf/5ojGEaAi
 6QmaUqJTalFbQ9UwjT545TfBImMBeEENEwL1vRLEarN6266MWuIxgUgbT/ny6UGQyHVw
 VniWQGPu4iZygVJEEVvPxFw/oo7DSx6+TwASgitRtnlp853yPxbncLEQhAd8/AH4VTfW
 VK0zfQx8YQF/uuownKCrd0Rgbg77GCubW0yfmvsGpFFRM+/dglExwpTxVlTWmI4vAnP2
 toLIWMt6JgNzvcHTKpmbCDzuqQjA4vEUuf03uvPTfXjieGtkJmmNOeqBFJDWDCknRYYi
 iH1g==
X-Gm-Message-State: AOAM530c+NUIy3NoXoqkZ/IbcnyrTgmr/6Qd7hId0FUKqvuX+cOulKYf
 RSAR7kbhd3LxKM/7P/QSoRgGeQ==
X-Received: by 2002:a17:902:b7c3:b0:167:7ca8:7f24 with SMTP id
 v3-20020a170902b7c300b001677ca87f24mr12468733plz.51.1654633995537; 
 Tue, 07 Jun 2022 13:33:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 09/71] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
Date: Tue,  7 Jun 2022 13:32:04 -0700
Message-Id: <20220607203306.657998-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: uq3Z+wbiOczw

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1

