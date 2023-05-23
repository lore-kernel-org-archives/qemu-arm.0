Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2113088ejb;
        Tue, 23 May 2023 12:57:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yzD0OoM0O9r8l83qyKwE1D3GJaOTaUhzPR0kNmsvYoq2uknCza/N5DiqM0USPjvAhVpaR
X-Received: by 2002:a05:620a:4883:b0:75b:23a0:d9b3 with SMTP id ea3-20020a05620a488300b0075b23a0d9b3mr5815458qkb.9.1684871820205;
        Tue, 23 May 2023 12:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684871820; cv=none;
        d=google.com; s=arc-20160816;
        b=rQaML8IHid/J4VhD28EfzJjFvtj7rSV3+W4HqSPl0Amm0PtYlmei1k4mw1wTqJC1XD
         y/QzLHaby+3HBLArRNPix1XufjwLXmnrTYiYIY3k/84n2JqA0e1cOtUkZnLu+Hde6CZ6
         7xSfvhDiwCcouAVAL45Pu8JCiQzgQIa4ogUhUURIaQtpREtPmKjuZWVYBIe4dI9fOqXH
         r77o8A51ETCi4QjkpJiII+POset8atABR9QByllij2kc9jrV8RN+p6FhBBiLPVadThWO
         g6Z6BDbph28kW3c0xCb8EvQnvL/bsUGLT0K0cl4Fd+Zwr4I7q9u2NXMc/2PjCz4qSZSl
         TVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s+kzg83eZnbuI0aq/ydKr/xkgLTYwwbEGaXyAFBj3HY=;
        b=V2thlAo5Ya7gxeBlxUHJtywkl8GI6oBM2HEK8pyKkmr/OjxYSAQUXG18dVykHhmweH
         KCFfCtjUKHGHXH3gBQefzjG6EDst32SErmW2UX1Clgr8OEsymONs8fmGDXAFJjOih3qD
         XwRYyz/ouC2SBjCAo/FRWgOW6rnJp5+gTg5wW8aaIAs5FxW+f8dUnUyyMsIRqxmzTCgT
         B8Zxo0aT/9t8KWopeByuu7Mys+sY/qUWvnLDYST36LR3VhmHahk/RZRdZJcH7wyc7Xu2
         Ru0HBqEkN6F6RdOb4Zbfoal4C1SsPxqYnQjf21qsQ9FSIleyaMqpnNaNZY9BWRlKbN6j
         CISg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=eNvwKNPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24-20020ae9c118000000b0075aecc49462si5174025qki.326.2023.05.23.12.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 12:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=eNvwKNPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1Y7O-0000Rs-Pi; Tue, 23 May 2023 15:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q1Y7M-0000Q4-T5; Tue, 23 May 2023 15:56:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q1Y7L-0006T7-5F; Tue, 23 May 2023 15:56:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50db91640d3so458939a12.0; 
 Tue, 23 May 2023 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684871780; x=1687463780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+kzg83eZnbuI0aq/ydKr/xkgLTYwwbEGaXyAFBj3HY=;
 b=eNvwKNPNgteDYPnBZEJEjw1R0aVgdKJeyujABwv9QR0W5Wzb5FG/sDY7ejFT0r7gXd
 HeLKbM5BVZNeeCIct+AXBw7N6VaL2e4ChyI5Bmmz+O2heIpj8mNu67OLWrFjRBX/SzgG
 +j8z2/HIV08VmoUCahGX+pU753zMcAPPkkOa+cp2g4knwjOJ4yHhQBPg3vPqt4L/bFyV
 gLlGDO9eBlVHRLPeMJyedfPabfUlnSiimeqJgpOdb+zsWgX96bp/hAriflDsz+pNV7CN
 zlUsHtKI3ZybHy2LgwhFSV3oW+BOijyAdDomfkPXjPzD2Yrr3ksUOnuF3uY5UB/LX1Ll
 DpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684871780; x=1687463780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+kzg83eZnbuI0aq/ydKr/xkgLTYwwbEGaXyAFBj3HY=;
 b=NDGj1eyP7VzKpVmu34VDBDul98k0jIBC8keT+0EUoSdVvi6hXaXOxcXvAuvtJtQnvH
 O9uJDMLmIA/RLas9jhz6ZbhvktZuSF+VKbi60H/shB3Sixw5MomczwqbAsTVZ/FnBs7u
 ibPoX0pEawp4R7Ob0RVl6RQC5jAdaX3onBMiitKw2dMODcG9/QVwtavejeDQcfyqQsfp
 LnLlq7UDRm5kV2m5DSte3MstrhktMjI0LGCkQZ+6FTLgXilrWA3qF2ap2RQ7y+l6oyAZ
 /tFzja3RCFeeklajlOq+v0rYBUk8DEYHu1RENNhWPMUJ5XSIWAeygvvaYkr/6ju1KBAo
 Pxmw==
X-Gm-Message-State: AC+VfDzJIZj4lWzE1nzKWvcxTzgYlkGBOE8cY8+knDLuNpKPfBXaGCMZ
 vqXlSoVuAAl6RKmzKuP3IH/kZp43dWo=
X-Received: by 2002:a17:907:7f8c:b0:94b:d57e:9d4b with SMTP id
 qk12-20020a1709077f8c00b0094bd57e9d4bmr15443992ejc.2.1684871780547; 
 Tue, 23 May 2023 12:56:20 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-025-113.77.183.pool.telefonica.de. [77.183.25.113])
 by smtp.gmail.com with ESMTPSA id
 dk13-20020a170906f0cd00b00965af4c7f07sm4737740ejb.20.2023.05.23.12.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:56:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 3/3] hw/isa/i82378: Remove unused "io" attribute
Date: Tue, 23 May 2023 21:56:08 +0200
Message-Id: <20230523195608.125820-4-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523195608.125820-1-shentey@gmail.com>
References: <20230523195608.125820-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: KlmeBAEyjLlw

The attribute isn't used since commit 5c9736789b79ea49cd236ac326f0a414f63b1015
"i82378: Cleanup implementation".

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/isa/i82378.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 5432ab5065..63e0857208 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -34,7 +34,6 @@ struct I82378State {
 
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs_in;
-    MemoryRegion io;
 };
 
 static const VMStateDescription vmstate_i82378 = {
-- 
2.40.1

