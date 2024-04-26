Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp639874ejb;
        Fri, 26 Apr 2024 12:49:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVz2YXKCKxNwHpVr7Qw9Pii4fijwm9xZkIkZS8XUsP84HYgD+5C52BaZQNL81OISrWphcQmdphtBQ2CxvgkQbl5vsNrGPKl
X-Google-Smtp-Source: AGHT+IG2ReOM+XRebrRmiYCFmpUzMLFSJafsYrd7jE4dIzZ22Oe8+WurkIwz1ViWAwdScrWIorhp
X-Received: by 2002:a0c:c312:0:b0:6a0:a591:6f32 with SMTP id f18-20020a0cc312000000b006a0a5916f32mr1289759qvi.12.1714160982805;
        Fri, 26 Apr 2024 12:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160982; cv=none;
        d=google.com; s=arc-20160816;
        b=A/B1TqJtc0oocFyNwd1DGs9aOCT88taWdKgVfI2hT41LewhlRdDBF0RJr0J/c6bWDF
         Vx4yurOlQMOMEb41UIZpDlMm5VxYrBtIWpaVHI+a/U7JMmMqRms5Fgw3MsjzwaflH0sk
         vTHWVcX3kPX9sfNtP8fjck9MCL6elFsfhjeB+gUWEpmwcW8SkVHI8dT/2T/nqLdUD6oB
         +Gy9GPy6hX0GbUI27pyiVe8/vgDhe2AIUnQ7uQeI3b3ZZjv+AdBabPVVbVRJvxxni6b3
         ZDHaQn0oP6QG34DTBhXhgQUon+heRN5sPU5YQfPXdDDr02c4Ny/1UulCYz6XpK5g0RyX
         un0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q7YRlrLoDVqcKqwJc5XUnzy4U8ujSMb/8xBf3PSdyhk=;
        fh=n3gkbBeRJa9ccDejgMfLQBEAuhbGXuRpY2MjR4eenmg=;
        b=gVoCvGnCo2J0TLSWMRM1uHAAEPLfz7JwgrUQ9wuGNYhUdecUiSKzUn6J1KWgLGtvfi
         uXLKKr+hUSPyU5FTq+DG2pnFRp/ZJH6inZWc6K3wiKebUveOC6kfxpYOIyW/Ra/Eo00i
         MBXnm/RH8TCqSEsqXTx50vlZ/36sTTLfqvkGk37z/e1Mq3zqa4zdXamrfvz038JcdloN
         niV0Vb3hT9skMxHra9UGtptpL9xebXyLtA0pU4ktScBvb82qnm/7dx0o9szYgazsTA5O
         aMnbflfT7ApgG9O3dEPV9dtkpB17kt1clvUmxiRlSZfqi9HF+mVopgS1mOhsEoomPvqD
         1yGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnmuAFn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a0562140dc100b006a0859a20fdsi11626643qvt.187.2024.04.26.12.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnmuAFn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RW4-0003SE-FO; Fri, 26 Apr 2024 15:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RW1-0003It-Oj
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:49 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RW0-0004rd-3X
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:49 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51b09c3a111so3577388e87.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160746; x=1714765546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7YRlrLoDVqcKqwJc5XUnzy4U8ujSMb/8xBf3PSdyhk=;
 b=MnmuAFn3RzMmtPudj0mPg2amQIkZWLEM2+EKcx5M6L0cngtng5QrnyBkDK5/h1XCMY
 JVAKSQ6hueIEemEYOnjNopUWkObg97IvpgguhkM7izJjvtNgHa5c1EPZsYCQHSd4Rd47
 a1nPvrNqLwEJT5OqWF5StRw3qMx0qLnp78xFPrvRYqJID6My0WkAH98/tywjWeaL85jP
 Luibf3m1KAs2uqwNXRMGv81BlbRZYTGXa1erjOQaxqkZ/aFA/XgcDNflmRaoc9A9naQg
 eRnnBBPT7+WW8DGvqJCG3oJFP6qMZz+Y9ZD2TxLlsBCF5aqiYKQkEmGSkBb8pBCnwNt3
 7nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160746; x=1714765546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7YRlrLoDVqcKqwJc5XUnzy4U8ujSMb/8xBf3PSdyhk=;
 b=ijvU8dQfuQMPVxYcwoZw+UW5MIiXQp9j45ZCI4bwZ7oWkjEWelk3PPCytv1npKKJ8d
 uQ+Cn/UcYYQsJMJ2bsUFWq3ZEb/vakncuLRax1TMYo83RAHLaYNx6vQuYt2FxPIFZ8Zt
 05W5gD9mLb4o+i5JLlMfcEQPx65pB0zIBK6b1SIiZErUvcoypqug0XGha8nDEVYXBfvX
 nfblYc9eAacU1lIFhqwSQMoIGdvmjuDUGQpwGp3/D5sVAzFQ2cX1ykl/Zqxih4luLyMJ
 JPPzkg1SfI9smAk9I4yzSozUYVu15hqBxim7UcTMwrhkpaz/NAE01vnSeVfVMDZadib3
 lFCQ==
X-Gm-Message-State: AOJu0YylgdSVDbehRYoG216JgC42QLR2IBWwcwygikMup+8TGb9M/yg8
 BomgW9hq7BSwaPv0fDlvn3q3BT7w3pqecTm6kpXFQjfZMbmVq55P55oXgAbShxY=
X-Received: by 2002:a05:6512:2c99:b0:51c:ee04:3732 with SMTP id
 dw25-20020a0565122c9900b0051cee043732mr969913lfb.7.1714160746403; 
 Fri, 26 Apr 2024 12:45:46 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056402320400b00572593ddf22sm854298eda.58.2024.04.26.12.45.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PULL 38/38] plugins: Include missing 'qemu/bitmap.h' header
Date: Fri, 26 Apr 2024 21:41:58 +0200
Message-ID: <20240426194200.43723-39-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: mr/qhrUtWLQN

Since commit c006147122 ("plugins: create CPUPluginState and
migrate plugin_mask") "qemu/plugin.h" uses DECLARE_BITMAP(),
which is declared in "qemu/bitmap.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240418192525.97451-19-philmd@linaro.org>
---
 include/qemu/plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 12a96cea2a..41db748eda 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -13,6 +13,7 @@
 #include "qemu/queue.h"
 #include "qemu/option.h"
 #include "qemu/plugin-event.h"
+#include "qemu/bitmap.h"
 #include "exec/memopidx.h"
 #include "hw/core/cpu.h"
 
-- 
2.41.0

