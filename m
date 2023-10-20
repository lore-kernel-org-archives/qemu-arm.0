Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1375030ejb;
        Fri, 20 Oct 2023 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFqDxKttC32UENdBYznbR/qw1iqhKR8rnc4NKdxbMYroOAJDHLCcvFEirxefPpj1RdvGGi
X-Received: by 2002:a67:ef51:0:b0:457:dbe3:ef45 with SMTP id k17-20020a67ef51000000b00457dbe3ef45mr2867280vsr.19.1697821296039;
        Fri, 20 Oct 2023 10:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697821296; cv=none;
        d=google.com; s=arc-20160816;
        b=lsF5H2cyjiFb7/oI1yvZK9q4P2oE3REP90tiXdhyaRCXHFnc9QmMrBlTzXM1LVbrWz
         yYoxE3YSDbkE0oXXxUkT4EXX9pu1Xi+9AzEBu1h/YTkhapnQZGaHYvcpvafi8eZYc9Zt
         ll/d3AH7nzX9dAv0fVZboqLrjp9S13JDF7KSi/3rRJpS7Rx0+9DmXMqmjn/KA9gRVoF+
         gl/sHXRVbtflJNFOXXjYLa/k0GWEE/I9MXCGe8IWM9wJqoTIlWhB2XSflAYEoEfJLYFY
         UfR19Ckqgmk6OppkTkD13gzh5HhNKyl58gmpaEz47eWL2+IB6OmNvltanaOsYT2TXW8M
         hUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pbtFw1Pjg71UOOCnDLcng5H0rDRsRUycUpGk3Jvwf+E=;
        fh=CSV7ixVglXzcxb66Foh/+b7TyX0eETHj/jUl4XtrXPU=;
        b=qd5rgL7xX+89/AtKTLmeFb4YPRnfhQ8gbWDp+4p2jmr4PsbQWLrW3vcneSK8eR4pTJ
         Vlrv/h6xW0C6EwXfJcDFxI1KK670yzHz5IgcBHQBr2ldsj85fecjYpgJlLvmtsWNPJUt
         w3AlRhP1/ZyJa8BCGGZXpavoaWhJBUrtCsQPvUwqex/5WHcMe0HORnpAZUZlOVXAIwiq
         4JnvmeRVGlvPvpGXQpgqIhUDf5h5kHemYDit0L3qkRDS+VnVm0RoGtFIeGfqSqFLklVC
         UlmOZVKcn1zxWrvQO8y4ctINzWUtNeMFsIElR449JxLl6+aKXdKOYDpdZ3w+eUHidoQ+
         IqQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVhWsJ12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26-20020a05610205da00b00457bf1e4f16si211824vsf.635.2023.10.20.10.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 10:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVhWsJ12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtsrd-0002cc-TU; Fri, 20 Oct 2023 13:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrX-0002bg-Ie
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrW-0000KB-37
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4084095722aso8498175e9.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 10:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697821235; x=1698426035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbtFw1Pjg71UOOCnDLcng5H0rDRsRUycUpGk3Jvwf+E=;
 b=HVhWsJ12DKZ8Ias3+ZxP+xhNixI8LvNChPDSguMrKjxp+PElSUgnURMXXu2I1hgYHS
 VNwWHasZDgdqKht1LlDjDFxDRFHNhlS6DXmNA++oJPFf1w3ktG7NiYUTYRdLmkrgcr6y
 aElMdEa7Vq7zzcjBfMABVmKYPOLk81Wre5OBRxtWTyb3W8dGlez/M0vBC4CRMfbxuSwN
 oW0coYyiGaZdOH9R5iXLJxcMoTAdJouvZ1UGpxt9DQSJxxGrgHom49zXVl/dhIiWspJq
 IDtQ0CI2zylbg7Uls/jL1fALGKgiLCdx8SOmzJ7YrO1kyKE1U98ExVxZEDJbLAwb19tU
 do1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697821235; x=1698426035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbtFw1Pjg71UOOCnDLcng5H0rDRsRUycUpGk3Jvwf+E=;
 b=xLIxK0HFFqcAWYNMwBs3NrZZyClbbPgg2eS8YU/wIP00c1Fu+DoPB8LOCpHFI/VYwU
 bYSNzU/CvvQ/i5tvaxxITJLF0K9KMvkk34JDRnTZpSa27NdBLekAclydPiqKiwQZqWMH
 IzEZ5H8JP2t1JRa4PKh1iHr0eL5OtGn6HeIDvX4v3H6+yNDZcR1qCst+eKObjKb/Blhh
 MffJY5EJ2HuJ5w5EWL0w+vO60AYg+TTlsmCRERSYiJwuQHku9s4CPZJCIAoMndN7eiaP
 Sce27TP9ialoSzaA8eeiuWSzcHUjeBhoGBCfwLMVUzvq2BSDvvTT2eNQv7Z3gS8RhQHz
 oLtA==
X-Gm-Message-State: AOJu0YxbZRt76jzzs/mwLG62Oa0K5gq7dTML0OMgW/PorBtlGShSCuPn
 tnYrbGKUOcYvlbHnxxSsPApX0Q==
X-Received: by 2002:a05:600c:4f49:b0:3fb:a100:2581 with SMTP id
 m9-20020a05600c4f4900b003fba1002581mr1888317wmq.14.1697821235488; 
 Fri, 20 Oct 2023 10:00:35 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b0040531f5c51asm2625453wms.5.2023.10.20.10.00.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 10:00:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/4] hw/char/stm32f2xx_usart: Add more definitions for CR1
 register
Date: Fri, 20 Oct 2023 19:00:08 +0200
Message-ID: <20231020170009.86870-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020170009.86870-1-philmd@linaro.org>
References: <20231020170009.86870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: rKgVazztHWcp

From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Useful if unused?
---
 include/hw/char/stm32f2xx_usart.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
index 65bcc85470..fdfa7424a7 100644
--- a/include/hw/char/stm32f2xx_usart.h
+++ b/include/hw/char/stm32f2xx_usart.h
@@ -48,10 +48,12 @@
 #define USART_SR_TC   (1 << 6)
 #define USART_SR_RXNE (1 << 5)
 
-#define USART_CR1_UE  (1 << 13)
-#define USART_CR1_RXNEIE  (1 << 5)
-#define USART_CR1_TE  (1 << 3)
-#define USART_CR1_RE  (1 << 2)
+#define USART_CR1_UE     (1 << 13)
+#define USART_CR1_TXEIE  (1 << 7)
+#define USART_CR1_TCEIE  (1 << 6)
+#define USART_CR1_RXNEIE (1 << 5)
+#define USART_CR1_TE     (1 << 3)
+#define USART_CR1_RE     (1 << 2)
 
 #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
 OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXUsartState, STM32F2XX_USART)
-- 
2.41.0

