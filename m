Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp536492ejb;
        Tue, 13 Jun 2023 06:36:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WlZUFMXWAi3nLVgJWszEkAsPg4H1b5iqI0fjHsNW/gGfTGcg1tdV6HUZsN40RAZuMJ4CA
X-Received: by 2002:a05:622a:86:b0:3f5:2082:e0a8 with SMTP id o6-20020a05622a008600b003f52082e0a8mr15490533qtw.1.1686663400978;
        Tue, 13 Jun 2023 06:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686663400; cv=none;
        d=google.com; s=arc-20160816;
        b=x60VJhBajNrEbn+uDSBv3d+1ibYl3GOC+N57GnXD+7F6d2H+XAyqfd3/cttUR6KisJ
         Ngb4L5qfHQAZSfoUNMp3DDcRlN5cVoyaJbccIoriXFjIQT0hRNxaPO6oq5fUMdhvi1d7
         Yd2jUDc55l0pQ3tMUyvqh1sN/WI9FuWTa6tE84m9O1iEE7MeEJfj2f7k4aIhVW1Z2Ozi
         2xZY7X9yCkfr/zfG14LXWza7Pxej5JWD9EGIhHbmKIGzkvQLHR0D67V60FQHK2VkfmaX
         3SJs73CTyIUTTtAi9f9lF5oJ4zXvX//WIcMY8zJoHYqPVfau96FNRvzAXL3GLGmiUNK1
         t6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TTge5Z4b4nMW2vtK7DGlD8HEj0g/6GKKAfDYFgtpth4=;
        b=lB6nWTGVAJaWUjE+LMqs7x5V64Kn+8McQvgYtho4CSA67HAGC9yjxSLlB6ntvDjP58
         FXtG3b1MPdi15ghm1eoxmoEdGUnON8ATXY0cTD7Sgh4G/3UboxvE7eMwmAkKnWUHJuZf
         FB77SmdAIlqVovZwQnj4m+0LrFkI6YFblF++oYKqyTiib1thqrlvr7Kp9razHUyQkLZy
         kuLAoRRcBwvlK6IYqoytiJa0nLCq+Ibavs7hihUe4cZr2GColxRnGlZRiPrYxko3BLkI
         nQolhnjRixsVa0aU+7wQWePK0+WGTx2TEP/kKJnLukEJj6eAM0Puc0Jij6ZYVSUmngJX
         rdhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XH619R4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a014b00b003f9b92c58e8si7998039qtw.187.2023.06.13.06.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 06:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XH619R4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q94CG-0002DL-OD; Tue, 13 Jun 2023 09:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94C5-0001qp-J8
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:36:22 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94C2-0002jY-I4
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:36:21 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-977c88c9021so913821366b.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663377; x=1689255377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTge5Z4b4nMW2vtK7DGlD8HEj0g/6GKKAfDYFgtpth4=;
 b=XH619R4kQi6Lp5yKVpKuHUy/njKxMMAs2zawhmz311JWOOhmIks7onMHi5FK7yoQxB
 qZUKm/CbUdWdxgtuXa7VjKtPOuD32dPDZbZkwXc1EW69fpSn/vq3Um7GNG4w8MAnyjTj
 OUVyMiReFufNPu1q8JYMGrlBCRfB0qJUhYVfdFzx1BE0xPxkee/MTHFuB77GY8cYpSYA
 pRBk4TOg35dzrVeH2PJxxbQB3PJHUjwrEuBezf70NY7UTxEOaOEQeUdmpSV7UlKOSca5
 wwH8ozGiitVAd1gTf/FJir+jWxgZZtnRgy+vLbCQT4skAllNj+h4iFdypDJ7EBG5K9o/
 DD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663377; x=1689255377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTge5Z4b4nMW2vtK7DGlD8HEj0g/6GKKAfDYFgtpth4=;
 b=Hc5i8kk1JwUoX7zDwoAPb5K2Ht4m16KKGODUFSseEyiaIwpEITJgdYBj3PKr/SYbrX
 gqcpRLgUwiJKrn3au1yOBMKMguvd6pYYCCsthITbweUEt/LyJKNlk+GewR0JpuWzuT5u
 j5XwMGVqkbSFSU/Z2LszoDryRlUjWHR+yzimOhCHviFilu5/8W7g1oX9KEAcWiVP9ZS0
 nCOjmUHqhosXejOVqvK6aslDLl6xilAQOqedoq8STjFqcUyqcAz4JoQNMTwnJpbLpGfp
 PSb5jol9SHxrmTH271a57CPAhtTFefIVTeXe0ppdjMp9+wGN4GaBmg1RaYSp7LcRFIZz
 fPNw==
X-Gm-Message-State: AC+VfDwDqfQ70o4txysKJ/nvjxA1in+ES9hWhfzdB8S7GG1bhRuOOCMV
 2O0yDGH5NDjWlX0RMaBvjTQeyQ==
X-Received: by 2002:a17:907:9307:b0:974:1ef7:15be with SMTP id
 bu7-20020a170907930700b009741ef715bemr14360731ejc.30.1686663376750; 
 Tue, 13 Jun 2023 06:36:16 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170906710f00b009745bac0567sm6583544ejj.126.2023.06.13.06.36.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:36:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 7/9] meson: Alias CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
Date: Tue, 13 Jun 2023 15:33:45 +0200
Message-Id: <20230613133347.82210-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: vGUeRrWJtW4y

We use the CONFIG_USER_ONLY key to describe user emulation,
and the CONFIG_SOFTMMU key to describe system emulation. Alias
it as 'CONFIG_SYSTEM_ONLY' for parity with user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 34306a6205..8bfa37afe2 100644
--- a/meson.build
+++ b/meson.build
@@ -2862,6 +2862,7 @@ foreach target : target_dirs
     endif
     config_target += { 'CONFIG_BSD_USER': 'y' }
   elif target.endswith('softmmu')
+    config_target += { 'CONFIG_SYSTEM_ONLY': 'y' }
     config_target += { 'CONFIG_SOFTMMU': 'y' }
   endif
   if target.endswith('-user')
-- 
2.38.1

