Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp853898ejc;
        Thu, 11 Apr 2024 03:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdtGbqJm5u869kRgd9OSQuhoo/kdR8QYmSlYpKhfTDWhyObc90Dp19gHOZee4PkCWVsA6Pl18HXJj8lD7coLXRPwppHAYV
X-Google-Smtp-Source: AGHT+IHhP4Ub+VKqOcPpW/TU4Br9UiH3uBFF+urd17O1kcA8PeuMcLdPLkJswatl3pfJ1MJxUWto
X-Received: by 2002:a05:620a:1649:b0:78e:5148:b04f with SMTP id c9-20020a05620a164900b0078e5148b04fmr4265478qko.61.1712830627501;
        Thu, 11 Apr 2024 03:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830627; cv=none;
        d=google.com; s=arc-20160816;
        b=HnDYAcnqO/1bqTEcg7mAEzcVRKt9aJfhZrIfKEGHpM5278r+Wjh0KZdn1dIKOv76vz
         AGqx+xHOW6+lNlG0a5plBaIb2njPDdYOtW4ah9gyKMhF71JjfbT/YK1QNT0/r/6PHkCf
         11lyPKLxZo7hacQkw9phoiMzf9SXT9GGd4+OmXXkGVl9MJCNCeKg/Ah8sGQ78rN4bx28
         Rfi9ebz3mxjy4ZLrnIGgwhN1sxB4uS9mGBlyFRCa/fHp50ZCWKPQEhXrCOjfyY+Pl0fQ
         ugRpn3QAXYrQyb1JJ3tbNgMoGq3Hn4OZOqkJfjjwuOf2SNf+YSAMF2uuDeWvoylyIpE9
         Myww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PBk/zsqMq62UHC2ppX+I9WzKRA310LNthTyLJkfCC3Y=;
        fh=/PllDMSTyjCYvesj3R6R8arE+9xF73MPrW03ygzeqXk=;
        b=REPNxzqdzjCIyHNEWDMVsA1STC2D9I6I3gJ3VnF8TF6yAvqoCDtb+3hjSxYlfCdp6X
         gwCHsTQc/9yJFAep3pL0LuqtcG0jeVMwkSy8mc/D7nJdABnsUQ9mpV2LEKXWnDR2/F9r
         mwnk9z/Sl5qsmfxhD59+SHvdW82B4xnrIrxtQZ92DsdvV/JbfnzwS0XpNt+2LzxqEjTM
         rAD6Z0XycR7AbQMlLVBzBMOzqXpDkVdoiO7gjaMW7vhH9SS4OAN0RbYGmPTiG59WXPPs
         dUp4+/6NNtDLbGen3PtUOAdST2ellUvWMtJP61RfJT9y9UVw6lHF+OZNry5NLJ7xT/nC
         pOzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npx7zF3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20-20020a05620a223400b0078be6b86c5bsi1179897qkh.552.2024.04.11.03.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npx7zF3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurTx-0005Eh-OY; Thu, 11 Apr 2024 06:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTg-00051o-5a
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTS-0007Su-L9
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-346b94fa7ecso486163f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830565; x=1713435365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBk/zsqMq62UHC2ppX+I9WzKRA310LNthTyLJkfCC3Y=;
 b=npx7zF3F+rNXSdjpahiHK5yvhRce660+KGKjQ7e3DCDJhppAReTnQaCYzTNIB7Q7MN
 LLGc8zLgCchOvVrvIdrPFzRRiwiH9BEEbuxwoGTxV2NW4gmn2Nz1sd7oNW9ZNwt3rTZz
 /58tsgUw6VFSjvuI+HElyIWReWo/KD201MbUogF/Wd+TL82RV/1kAQ5zxCwTpoBYliXJ
 j/vjrRXPQwnyaL3SKwYHflofOQRvSSbMCANULWrz5g5gbVqnLeVWOLlM+zmc9lMIOpiW
 j36+zXzv5iIZpLAA3grV+UOb7DfjX7GNc1JT5LU1QJGdE4gQRjLv76gZBbOhaqGwK/Bi
 iuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830565; x=1713435365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBk/zsqMq62UHC2ppX+I9WzKRA310LNthTyLJkfCC3Y=;
 b=CptLohSDyHnRemMFiKl9tK1mJ0vBz+QCsBdAiRkCWnf475RO1cwpzbpheFftyIfVYt
 yYXQwW4TLl2qM/w5OwSxvYiieIlz1z2QcAF9F6S5xguT6Ja6pHQKojWM8q3wXq1XSHb5
 VglpalvXplLY8ymXfoswR0KtONpR0pCwPSmu6VIfWcA4nv1ZvrvtyTEKwrJ4kRvRb2Jr
 7eSzddIeDRb17qlI1lvxq25uRybUfLYHO00QKRcmyZf2vDUx2SpVKGqr9IOKCmWiGsm6
 OURNgXAe70ZJoEUvhmFpCv9HownJcRaAlFQO17gjVlqoRnCV4tfzYt1Pu0WirmGVKwLz
 9xhA==
X-Gm-Message-State: AOJu0YxMf1dxY0HmWD+esN5smIvwAudV1ltF9u+Ej0gvbH3YIk3tHxvF
 WxuWXwz8IWZ87B7nd9toqZYQ8ZgADW0kicr9f8SjLuTpe01CXKVPG8mgNgoFrgw=
X-Received: by 2002:a5d:62d1:0:b0:33d:73de:cd95 with SMTP id
 o17-20020a5d62d1000000b0033d73decd95mr4629373wrv.17.1712830564945; 
 Thu, 11 Apr 2024 03:16:04 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 c6-20020adffb46000000b00346cdf48262sm658277wrs.2.2024.04.11.03.16.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 02/13] hw/vfio/pci: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:15:38 +0200
Message-ID: <20240411101550.99392-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: bTfEG3ADGcFi

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 64780d1b79..cc545bcfbe 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2444,7 +2444,7 @@ bool vfio_pci_host_match(PCIHostDeviceAddress *addr, const char *name)
 {
     char tmp[13];
 
-    sprintf(tmp, "%04x:%02x:%02x.%1x", addr->domain,
+    snprintf(tmp, sizeof(tmp), "%04x:%02x:%02x.%1x", addr->domain,
             addr->bus, addr->slot, addr->function);
 
     return (strcmp(tmp, name) == 0);
-- 
2.41.0

