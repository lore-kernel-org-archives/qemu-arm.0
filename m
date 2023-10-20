Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1374023ejb;
        Fri, 20 Oct 2023 10:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4JAIR5lfww1viN8FHTuU9IbegKZe1BRKT/5KRoharRR7mNpcAt+cDSk7s6ykIn/1kzmB5
X-Received: by 2002:a67:b709:0:b0:458:8e7c:e09e with SMTP id h9-20020a67b709000000b004588e7ce09emr2642828vsf.17.1697821233143;
        Fri, 20 Oct 2023 10:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697821233; cv=none;
        d=google.com; s=arc-20160816;
        b=hUvAuG+BglqmRojqRTgjWAbSuJDenmFTxoOakEwPsXC5wNNNBHIHCqwi9jM3e5WUW1
         jUmMdKppDBQqxuHNIj0qkGfhdJ3SYi9VdWFxYyn6rhG/0LgKKuVxrbIYnh4ZPpkz1xtQ
         2Bo90q7n4Gry8FUoicWueleS8N2/U+w/eJGn/1QRim5/C3pBEr1N68/JEAE2R9pvnVHs
         gs4h/Vs3GhnkGL5D4pRg4BzivvnJ53ySnH3l9O6bCPoEyHMDEbjDlNDHro4zHBP7GV9g
         n3nV2ArHpuWvJW4xJPfCKEbqHe8NiYyQ3lS43NxjRCbpFLw6SEjMhsKwphTV/zkc/0WH
         RsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Kt78QWV8SLX4gIgX7BJ1w/k7e1eNEVxwNDppyA4h62Y=;
        fh=CSV7ixVglXzcxb66Foh/+b7TyX0eETHj/jUl4XtrXPU=;
        b=A10VykJq3+Vu18YBEFi9rrIy/imkw9Fkm6eeAv758bleycPIir1nckzb8jqvTsDVK6
         5mYlGqGpsp5vJFb9uRTXRCQjGAl4/duaF4ip5aIfPzV+4tmvLWlyivokjDGfCij3H7r5
         fI45+bHYP1AiveDaTA8X44PAzQKV+5Hd6C4w1HhLFJu2WjpN8JyWQHd0kxzDzVHp0GX6
         ZPwcptmReQLBBm0xfLoC7AtzT9GOVtdbUE5dL4WrUXY/rhBWGBn2XoQVk53Pbp/dO4Hn
         UzZKJxEoKQbjxS0rJnZxJiTycrJafdOltccdUNvNJSClZ/qn7UqiGa2Zd3o6d2f8jQcr
         6MDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=buGso4mN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bg6-20020a056102366600b00458a143e3acsi217486vsb.622.2023.10.20.10.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 10:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=buGso4mN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtsrO-0002W4-0u; Fri, 20 Oct 2023 13:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrL-0002VL-4f
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsrJ-0008Qy-BK
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 13:00:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so769705f8f.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697821224; x=1698426024; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kt78QWV8SLX4gIgX7BJ1w/k7e1eNEVxwNDppyA4h62Y=;
 b=buGso4mNLI77CVJxVv1P21yRdMP8Galoo/kQIGf25ymVheKhYkOPtoYeUuG1osbshq
 SVcF92XDIZMAg06cw5/sHNGv74RQaDp0wfhjkO4iOoe7t5iyT+fukAM6+4YRGheAr8lR
 pqIii50ZiqEQDLE0NSSg93Rs3lpxPxciHCOk+tqE4oRhE6cNngjzqRr8AarV4CVgvkNE
 /qoNeQaiBkpREqXLWcdxI+7lIPMtCu++MwG08/uovlu6LNTGqcPzaebb0DLWMBItRVMK
 DsKUDps1RRqKQWfks/slFbUJI6O9Png7L+5EtASMgRAad5fYWqFweVQ1lraXZwEFjxcW
 IQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697821224; x=1698426024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kt78QWV8SLX4gIgX7BJ1w/k7e1eNEVxwNDppyA4h62Y=;
 b=iZKtO4TCGbFd5zfXyjdcmE6ejxjrBxXjFzS8MAahEMXakupr1HsYw9qQFVS46pvj9F
 rKCiajeDWcu3uJmFmliCmoQMQCPi1hIsUYPq9vfZ6vDQLN46Pa6gKqYVO2tEmcTdXFle
 AWf4mQbTUR2zG19Q1jo082UevDEXQwqnmo+IvusF/X6qbD8drG5EovlwDVXIQZ7B6HQz
 diHIVOdCgc8vyAkoNHsZ1z8nbt0MRhoYio59kpjneGtZgKU7f3wvn+iIM6LkdDqgI+XM
 kUins0S8AHU89C0aIIMUq0OQTuyraIW1V2p1F8KBbfeCX6R7JRwINLhJmrI0terzDycg
 4/5A==
X-Gm-Message-State: AOJu0Yzs9u3i6YUgXXt2HvFJVrFXf14xmXNOoWy8xLZcuh9fQp8/pJ07
 ESkfwHmtu/w0MdR8lVc8D7p9cw==
X-Received: by 2002:adf:ea4e:0:b0:32d:9524:386b with SMTP id
 j14-20020adfea4e000000b0032d9524386bmr1975736wrn.32.1697821223908; 
 Fri, 20 Oct 2023 10:00:23 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b0032d09f7a713sm2068815wrt.18.2023.10.20.10.00.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 10:00:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/4] hw/char/stm32f2xx_usart: Update IRQ when SR is read
Date: Fri, 20 Oct 2023 19:00:06 +0200
Message-ID: <20231020170009.86870-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020170009.86870-1-philmd@linaro.org>
References: <20231020170009.86870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: hIfe/wOVwsk9

From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Is this required?
---
 hw/char/stm32f2xx_usart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 519d3461a3..46e29089bc 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -109,6 +109,7 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
     case USART_SR:
         retvalue = s->usart_sr;
         qemu_chr_fe_accept_input(&s->chr);
+        stm32f2xx_update_irq(s);
         return retvalue;
     case USART_DR:
         DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->usart_dr);
-- 
2.41.0

