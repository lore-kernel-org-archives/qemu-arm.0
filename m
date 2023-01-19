Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp297220ejc;
        Thu, 19 Jan 2023 04:37:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2YkfSQ4sxcV4JJSe/KHbgPLpCnQm+u52f6lXzZW4byifrIoRfETHY+S9/5FO0FFQx5fM3
X-Received: by 2002:a05:6214:360c:b0:535:12cb:98f6 with SMTP id nv12-20020a056214360c00b0053512cb98f6mr17570103qvb.52.1674131858384;
        Thu, 19 Jan 2023 04:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131858; cv=none;
        d=google.com; s=arc-20160816;
        b=JNdCIT9tJjlQjeLzQnCsQisBQlJkFDIuVzHzE+j/Yx9oHeJIVPVEH0Q8ET3X1+9bOy
         tvpZg47sUvF2KfAF6mKprg/0OaiN3KOcDJFMigVvZS0arMIg3QDpgWWrVqpvbLo0JSj4
         t6HJdrt4HM41mDVJEhRyxWSMIsIt+kODuEKytgiacpnZ/CPEH+Ek8uFAT8Bf5zezDao1
         Q8OPPSPnHtE64kC3yJAtSvQo1xe4bwT/d8Wfa7B333K7nowZlUcguVVEiWZ44Tle02yf
         OUlIj/zLLS9KLuxLgbfp2ZrAERpvUDlbJbqTqTDPVQ0oROyamU2wCzBTNDyv9SdYeUtQ
         IVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=/lTuiMIkRXJU1I0qcygaiT77weNkwoeEYjy7oIGWPVE=;
        b=eCz4wWIjgLDqE0fgmPLm7V2pWN/3ZybG7qdiG6f352zQV17hTOvLBEeqEcfW1qeu/+
         44oHJ7f1QiwIkzqlm+1blvaGZVaK3iuPRpdqg/M9mK9NeEe46AA82oC5+SP2nm//Fp7M
         iXqVBh9UfdByB/MTJki6YyKgSt4GC0tP5zpYSkYXGB1c/ffJIm8CvxH/TvvxgS9l60bm
         xvp/8ixWWd6WRL6xeYzuAAE4u3cG7Zeag7AVJF9zY3MjHb9MH9ewxo8uaYD9iCRqX3uL
         BYorTRoV5qOQLbGL1jlJW3OeQHU27iVYhCajDNV5JOzE46V6N9FiROTofTwvza/qICX1
         82QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq13-20020a056214258d00b00535433eb047si2974810qvb.341.2023.01.19.04.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:37:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU9v-00005v-Ge; Thu, 19 Jan 2023 07:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9M-0007a4-D2; Thu, 19 Jan 2023 07:36:12 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9K-0007h9-R5; Thu, 19 Jan 2023 07:36:12 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYh2NF4z4xN4;
 Thu, 19 Jan 2023 23:36:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYf1wrJz4xN1;
 Thu, 19 Jan 2023 23:36:06 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 24/25] hw/arm/aspeed_ast10x0: Add TODO comment to use
 Cortex-M4F
Date: Thu, 19 Jan 2023 13:34:48 +0100
Message-Id: <20230119123449.531826-25-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WnHgGaK5g6eI

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This SoC uses a Cortex-M4F. QEMU only implements a M4,
which is good enough. Add a TODO note in case the M4F
is added.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 5c794c2420..649b3b13c1 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -420,7 +420,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 0xc0000;
     sc->secsram_size = 0x40000; /* 256 * KiB */
-- 
2.39.0

