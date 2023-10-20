Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1374798ejb;
        Fri, 20 Oct 2023 10:01:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD7jsb4G9Du+N9krq+Gc8xzXSF4T0hOg/MJJywZ6CEXPsZ3ql/KY/Mn1J6OJG7V9xpSG2m
X-Received: by 2002:a05:6122:3114:b0:48f:8891:296b with SMTP id cg20-20020a056122311400b0048f8891296bmr2857832vkb.0.1697821283364;
        Fri, 20 Oct 2023 10:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697821283; cv=none;
        d=google.com; s=arc-20160816;
        b=l+qm06iYjdwFHF1PniNAhWBIr2/4sxIy5hHeMIax7nsEJzIWsVWf9ksYCNrFStCgAY
         e9kH8T0l+a5ZMvZoMwp81flFFU1HVLE681ITN7A/jO7WGyGJSCEdP1cNTHL+yWSERv+U
         ujD4e1hn084VX4gH2cQCfPT0aEub8gznbMKArI32bYEIShHDyfJ1tzAsDvKB59hEdeuC
         lm+jiP5Rz1FRlzuqZ3YebYIFySDsvMzv/IDcdqT0tkkVnoh+qZHGPuxUVhVFWqgDdaea
         7C54w4pub7mT1OzswF/c9Ku4w7s3rGdJBqCGOGi/nV8NSFT280GF0YNzP3Of33wD2fip
         l6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1xZSgqSQwwblLFwOLujd84tc/4RL/5RbsxrAj9sMqy8=;
        fh=CSV7ixVglXzcxb66Foh/+b7TyX0eETHj/jUl4XtrXPU=;
        b=QKmg4Lz80s5zpgJRE6Wl4khRiLgcQs7Gygr530jmwNSI4czu68xSqg9uq9wnGVs7yP
         8jUWX9HePQXdhdgTUVU65XfbRy6US2BlbuyT6mCEWd2HtrTjDhbumYBQ1FSSIeIaDWOh
         WJC4Y0YcruiQL/U8Px/33fOl5/yse8Lup2PLQxhp1ivzHe4ngdZSkc6ex1uwxZwQomm1
         2p4awYksbmpeJsUNUuR5R82SMJI5WhXa7KxsRvxpOOqfztOTn9bjn6m/s2KOWVwE0y7o
         smyuEdcKuXAaLMARhajX/y7leFIoXoj7HAkaRkydfHKuqr0Ut+ddlexOQ2ZefFy17Zc7
         A3uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uxu0caw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b201-20020a1f1bd2000000b0049d29abcc66si226675vkb.79.2023.10.20.10.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 10:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uxu0caw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtsrT-0002aK-Jq; Fri, 20 Oct 2023 13:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrS-0002Yj-5z
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrQ-0000H5-13
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4084e49a5e5so8688915e9.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697821230; x=1698426030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xZSgqSQwwblLFwOLujd84tc/4RL/5RbsxrAj9sMqy8=;
 b=Uxu0caw9V+mF9gc5xue8m5yGAWKN2t121DKBUV1Oo0t6RJMNvH/jucPFjUclMyc7h0
 e5FtFgnbcASgWsPeZasAER1VpmYZE29GYeSRzzVbkewKnOsScs7iLQHtRcIh36h2aDBx
 4DcMKi9gL0mD3J1Cemv6bEyocNKKB2NDiSZ8Z+CS03BapOp/hkyY7qZNEPaE0mWWA8V+
 eFlU57gn6AJR0dlLJrpYrM61NzipbnbZRzn1kZki3MXQh6j+pmaS2leu/yVtpKtiv9WG
 JKE6AeKMu/3004yJa6nJangX7hQx2BbrqlqIq1i0ge70F+klYboy14zUi5Z6Q2GvsXmu
 aV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697821230; x=1698426030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xZSgqSQwwblLFwOLujd84tc/4RL/5RbsxrAj9sMqy8=;
 b=RiBqJO+LERzrZ0UqvqfRvbG9LYlxQtMbhsD2yQKwYB40Ci4UiT2fhDMv/TjtqIfJI6
 6dShuKAKKti3JnMZWiDVvsXwTF1zcZxYXaRNyi7r8bcU97WUezV4InrFGBrmz8pg+edf
 NrKgGfdHZCiDjaYq4Fl8Wmw5Ois8JtX1R7VPAzifHtK/mB8lkVMvaHJ6lMNbMULfuNKP
 NWs73+ck6kvo/hP8HHRBf/w5qc/9qc1ErleGtbjx2cYkNII5pGy+X10hzdJe53jqGhED
 M9LfpUquma7o/ZAXFf9U8sjl1cdKJlizgfyRg87iotkuBkbvB+ZsZGQXcO4MhqKiQ5Um
 A0JQ==
X-Gm-Message-State: AOJu0YwiXzAbK4IaJASQsGwnJX20ahzMuj86+hZN4wqEgLHppLx/XetL
 uKLNW8ydPqS4EeUJExMnbvpQEw==
X-Received: by 2002:a05:600c:35ca:b0:405:3955:5872 with SMTP id
 r10-20020a05600c35ca00b0040539555872mr2053594wmq.18.1697821229814; 
 Fri, 20 Oct 2023 10:00:29 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 e7-20020a05600c218700b00407efbc4361sm7346993wme.9.2023.10.20.10.00.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 10:00:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/4] hw/char/stm32f2xx_usart: Update IRQ when DR is written
Date: Fri, 20 Oct 2023 19:00:07 +0200
Message-ID: <20231020170009.86870-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020170009.86870-1-philmd@linaro.org>
References: <20231020170009.86870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3JieFqBGfz6P

From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/stm32f2xx_usart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 46e29089bc..74f007591a 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -169,6 +169,7 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
                clear TC by writing 0 to the SR register, so set it again
                on each write. */
             s->usart_sr |= USART_SR_TC;
+            stm32f2xx_update_irq(s);
         }
         return;
     case USART_BRR:
-- 
2.41.0

