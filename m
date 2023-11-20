Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp67738ejy;
        Mon, 20 Nov 2023 13:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc6rk5nf/CG0kXEXXv+LCegcsAjGBrEP2sc4+tN+LqyezDLEiyStHVmF/kQqWW+AB/mzZe
X-Received: by 2002:a05:6102:31a:b0:45d:9988:2354 with SMTP id 26-20020a056102031a00b0045d99882354mr7064429vsa.28.1700516437982;
        Mon, 20 Nov 2023 13:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516437; cv=none;
        d=google.com; s=arc-20160816;
        b=ZC3Ut/gqUAvrLMJISP7zj24l9SkI8e2r1riUGrLp9zOH7kfp1c73etDo1NR+AuIeCy
         o2re/rcy9tDGi63ylHXhOo6iulHzRGdRIcf5gSvYkrgLHcMwgHBDbMJoqYb7kFtFePoj
         nLP8G2s/QaFjrLPO8bZ0vSIoAKtAUyeXru5MTjY8m2JQGePVyAdwvBO1PGuIaP0H5fhb
         6ezumMI7v/EacOwnUfoXK6PI6IhGy0t/XI/1NNMVX9301j19JEj5ndPptb7BdfvhUUG6
         0f/Vj15eBUxpm8KmmRBHRzz6xGHkSPh6N1LPBLPIlP5p0mvstXUVkTvmsmWv1auk4rxu
         IDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=drwtQoQ75QuwOSsjQYja6ApK0ZWyT5mWD40njjZhqyI=;
        fh=AVTfbHsPJGg1WFQV1X+Bul2rECWTr55QornV8gS+Ss0=;
        b=yfRdzVnu4QAHGCx+46Qbdks9Sg6bWrD9miY80DMwcvlq0rxHUon8M2NSuM/PW2qKrG
         YLF3cCW2Lb4ajQ+NVilZjIBauPn1E/OX8prgeABj/THei8Pq+goV4oank2z0HzSW8u2Z
         tNZ86E6LyU8JBTyalemc7ElWzRsTQ/eMDD3Q6MpFVavaFkEaVphBfzdjk7SnSCOTGYt2
         73retp3/uCoSVCU7y9YPL7MNxbfiWdBmywZrCJ1/gfPgzJ8YaoZihLpLaa2qaaMvrFER
         OgQRs9DXYGo+TD4ECd1fKl38kj6mT4I+PdU5F0whMoTS8ef00xyyF3tiy8Foh/eD5gBR
         AiiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCPuesFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt18-20020a056214049200b006707430cd6bsi8660724qvb.270.2023.11.20.13.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCPuesFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5BzC-0004UC-NB; Mon, 20 Nov 2023 16:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BzA-0004Oq-LX
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:39:17 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Bz9-0004iV-58
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:39:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so1335855e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516353; x=1701121153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drwtQoQ75QuwOSsjQYja6ApK0ZWyT5mWD40njjZhqyI=;
 b=OCPuesFLnTny55vzGzN+ysvm91sZbnROQwfte0JO5Gk66U7AKVXMKdtwt7N/OmkFys
 cv3pDJEiO/Y3u/ODWVguBZMdXICZHB8Gsl1V37ecb5anAE88UAcJoz45fODwVqBVqyu8
 roMUyJ8vEZWJqHAi0UzqGwOQeRdUgGNL4RSOwoZ7rBMafuaespdfEehdZaTOcu0llogk
 iH9fSkyDBcKfjH9Xc15/AjTn2muCysSPwlaWnKLluoxinrfzRhcM8Qy0cPGE+ule24S6
 1Z9oPYqK6ZwQnIdUPzWhOSPFFT/rZN1Rls4pQ+48xnkPJ5+KVd1igulUJdCc9DBAlrNi
 IIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516353; x=1701121153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drwtQoQ75QuwOSsjQYja6ApK0ZWyT5mWD40njjZhqyI=;
 b=rfQmOb3SuG9e67AznLFGi1fJmKHUhN7PaD2YN7a6/KqF3spgM9alGkvpm/h3CQH+gD
 yJiswnXB7pAvM6InKdIlhUnmaJrgl34rUOrRZfrlSAM3If7sVhGNXZvS9n4cEs77/T3Q
 BNmrd0bIb2j/WGX3AuX/KP2AwbSF186JOZfo36P6C0m8FwGnfWr4zObm109xUFnMK9jA
 P44W+gjy2dw7TBpJqklMQ8G6w62tyCRuJv9lBlgucXtd3sj6xLPdAI1oAiazljnmh79m
 5Qv7XQ33kbeRbtI7ahgVByq38GR3QcX+PXtlV4s6bmJFRuAAE0lwEf2LTbyD0p6TgoDG
 iooQ==
X-Gm-Message-State: AOJu0YwLAmFK9KULIy6worSVbcMlGzz+pakO9xRNCPvULkRQHCvyMgi3
 57l54xExyhQ2g7iLlN7e5+4gLA==
X-Received: by 2002:a05:6000:18ad:b0:32d:b06c:d30b with SMTP id
 b13-20020a05600018ad00b0032db06cd30bmr6850326wri.55.1700516353594; 
 Mon, 20 Nov 2023 13:39:13 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfda4c000000b003232380ffd7sm12279698wrl.102.2023.11.20.13.39.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:39:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH-for-9.0 24/25] hw/nvram: Simplify
 memory_region_init_rom_device() calls
Date: Mon, 20 Nov 2023 22:32:58 +0100
Message-ID: <20231120213301.24349-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: FF3pm8WItd2B

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, errp;
@@
-   memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp);
    if (
-       errp
+       !memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/nrf51_nvm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index 7f1db8c423..7b25becd49 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -336,12 +336,9 @@ static void nrf51_nvm_init(Object *obj)
 static void nrf51_nvm_realize(DeviceState *dev, Error **errp)
 {
     NRF51NVMState *s = NRF51_NVM(dev);
-    Error *err = NULL;
 
-    memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
-        "nrf51_soc.flash", s->flash_size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
+                                       "nrf51_soc.flash", s->flash_size, errp)) {
         return;
     }
 
-- 
2.41.0

