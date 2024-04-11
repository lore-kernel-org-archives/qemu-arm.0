Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp854394ejc;
        Thu, 11 Apr 2024 03:18:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIqQrCcnT5NG6xw9zM+vEMgOXvq3kBNd4xaJbq5OW35PpPwdKQ6Kvai7YRn0uYFGdlQK2o+FjS0OTK95M1cmsZph/gK5aa
X-Google-Smtp-Source: AGHT+IGmqqVAxN2SdSNsq2YnZ0tcLnTfHbI0Fgfoy3K11aoy6NPnFDq+SVuNpWzpfQ8UWm0eJOFN
X-Received: by 2002:ac8:59ca:0:b0:436:71c6:af0f with SMTP id f10-20020ac859ca000000b0043671c6af0fmr452889qtf.20.1712830692889;
        Thu, 11 Apr 2024 03:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830692; cv=none;
        d=google.com; s=arc-20160816;
        b=fuCMtTtq3DPOg7S63iHlII5+qp9bQNie5GSsaNzcYy/vNN2Qa95urai0cVTMf64HCh
         uAq/fSTn0R6ABO1AEiKuNtjZMNw0hskk4DKDdy5yg5dJa/Wc6KHDZrFfSyNPorfCASmp
         cHkPMoGk8SeQvN+vRGm6cy+2JJ/05SD4vTPGnx6mMr4pTHe18PX6xFKcxbowoT1SP4dK
         BbQZ3nuIQXNLlXFw9AMciU0CCq5Cy4A6AzO0ck2KxPtzcaPwkGBrf8g1nC5vXuWZEt8E
         m77IhoZ+4XcopfUrDEr3GGuvAEearIJF+77/478KCaRYSXv7c46V0uUVC1/80s8xegov
         8U3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TngF+9Flkc8Ihe+8OkjidPkiP1940GOGXxohU6xSHFo=;
        fh=pz1yopd/wrdYlGtYXbhy+U1KH6qXkA5iyTnaoXfRYpE=;
        b=b88cAf8dQMdLypDsfFF0vzrG5Z/yJ2OkP7JFRBZ16jSMqYHimRfztCI5F0cL10KRzm
         HBjE/V2GMvyAp1ja/yO0+4yTqZ63ftiWrdmsohVWn0Zt8e0p5frScbkk9ypL7BJ3C7yC
         E7rW/+mfQyFTSKty73lSQ1OWLy3cAQtWH5JVV+4Ivq5Fy7Rx54WfFIKw1rTcyak9iuvY
         uwqpZ5IGobygQdkbkHv9xmqrDAFDTEkgwBwG6APjKaeLDdc5oEOpUsBpFYx4WOHmDOBk
         zUegC+NJrZi40lgKORrOPOI4lav1C1fUAUL2ISG7tryjOO0XTZFGNJmJH57y2Ni/QAl6
         JPdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bvd2d0jI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a014d00b004366653d0casi760799qtw.793.2024.04.11.03.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bvd2d0jI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurUq-0005oG-Pl; Thu, 11 Apr 2024 06:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTw-0005EE-Q8
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTm-0007V1-Dr
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-343d1003106so4764215f8f.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830583; x=1713435383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TngF+9Flkc8Ihe+8OkjidPkiP1940GOGXxohU6xSHFo=;
 b=Bvd2d0jIKuuWpq3aXGxTREH3PuavjFdc9GOPgWMGu230MvDukKBJnYPFDudeQfhCYR
 uVCxh2Vje6zy6Iaopn1Zo7dFHUkPQzYMlbOJ0c1jbM9MDtWj33M845foy3XFlqYlDeu8
 IxAaGgIhPesPMiWNRpyaz8a2XapDd1/EEZzt1RBSnJCNnvj6koX/iv5o5DHc0pf1fPPt
 Q9QTOoRe8U5dh614w26Vu+CmJvVQdUGRodYO83WIHkBje/yHetopp3B96CM7J7LRKDCG
 nIrNQBkDJmfvTTFOzN7qvsATe/jK04HwoZIwUceriia9qHF2JMjNvOruqg65Cn5rRajA
 VwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830583; x=1713435383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TngF+9Flkc8Ihe+8OkjidPkiP1940GOGXxohU6xSHFo=;
 b=YWChzqvNiFSiMO/3h2mU+I4V3btAe7NCdvuLmW8diVGya6uio/j34oWvBbfSMQImBr
 xhQzhC+oa2TR/pu6P6hg0SnlfdYBdxnDrCw7B5Z9HAHeyTi2hjl/G9tbt2CkPo7cxbcO
 8fZcxDl4WwQV/fYY1Fj1mKlHBJB6XNDZwPT3bUgC903EyiR4NUjAvBSQ9exNK9tJEyy0
 KQhP5DDwn8wsyYoEPRMxRYIq4WMaMErch2wIYZaRWni0aKO1dQCp9cE+e7lIv3NSDah1
 fh15nbbNSmDRcW6tRALUTXQOGoaGs/FwNZ6f3B7F87WmAY7wtqbAoWHaZoQguPSP8zIh
 4EPw==
X-Gm-Message-State: AOJu0Yz5KVa5LAbu61GZrEBt8U+crifHNWkRP1NzF/15kSwVE/+XNh7O
 fUHdiLZcgbf4t7DHwLXjEY2DGjVPDzMkPd8YH5E2zxcJPyk6c7D07tYb1MQqgRs=
X-Received: by 2002:a5d:644b:0:b0:341:66c2:3dbb with SMTP id
 d11-20020a5d644b000000b0034166c23dbbmr3737072wrw.30.1712830583121; 
 Thu, 11 Apr 2024 03:16:23 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfeb47000000b0033ec9ddc638sm1413671wrn.31.2024.04.11.03.16.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 05/13] hw/mips/malta: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:15:41 +0200
Message-ID: <20240411101550.99392-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: TFGdMVUFUVb7

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Replace sprintf() by snprintf() in order to avoid:

  [120/169] Compiling C object libcommon.fa.p/system_qtest.c.o
  hw/mips/malta.c:860:9: warning: 'sprintf' is deprecated:
          sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
          ^
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9fc6a7d313..5d33aa5123 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -857,7 +857,8 @@ static char *rng_seed_hex_new(void)
 
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     for (size_t i = 0; i < sizeof(rng_seed); ++i) {
-        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
+        snprintf(rng_seed_hex + i * 2, sizeof(rng_seed_hex) - i * 2,
+                 "%02x", rng_seed[i]);
     }
 
     return g_strdup(rng_seed_hex);
-- 
2.41.0

