Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3990578ejv;
        Tue, 2 Apr 2024 07:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMe2OO2hqVpg2fL4NnnRntam/+A72lAfe9b/P4zU2lSNeSMnFQbG9hiv+DN8Yc/bDhLs1EgbHJ9sxt2tQB15FS05yrqZIC
X-Google-Smtp-Source: AGHT+IG/HbpebK8DOZG1zpaQYsnasQq3qX1DDjYUdtN5Pd9YJJr1j0lHJSrJxmpV0uCjrAAHEIKt
X-Received: by 2002:a05:6830:2b21:b0:6e8:99a4:ffd2 with SMTP id l33-20020a0568302b2100b006e899a4ffd2mr10133745otv.31.1712068052983;
        Tue, 02 Apr 2024 07:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712068052; cv=none;
        d=google.com; s=arc-20160816;
        b=zI0+98DAl7q4hO+0vqu9OixS3TjrHM8cRifhK6glSneAM6Ogs9D7Wz3vffCsw8/MLi
         1IBjxnYbBB9zGoW36wX2STjyu+scM1kJh4OgOUrNSS9ZYvmFvX2NEFYxSG6a9ayenPhh
         v5n6BgGTBgQ/xegrxucvM5K+Vl2HfTVBfYVzgxfCc3JqN6xI2CJrzUwzX4CY6Z0EQ7U9
         /2w9LYD2LVdBb3S9Kn1g17jHCkJGIN7U1IK+O6yTOHIAI5IFVG2Ykxsm6p1IP0O5KK5j
         C1w+htGtPGEdaNhQFbhR9CCLMErk6+8QHSU4sPUcpFAlrxE9FzjiZQgl+v7UWCrmtzZV
         09OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GBDHfu1WWwUZX0nO+1GdOpxUbxXBz6m2k2jhIHnZ7lw=;
        fh=c+9H9cMw8ecIRqGSeQc/k1jkoSZH5OC1DdIqwmXyubM=;
        b=fnO6+GPGdoSjYcCicjtGpYgsKpbP+WMKlTwc0aPMSIvnRefK6vi60F+w9aTPpMEYLS
         YhY5j+F7L831Y5kXZKEb+IG2h+eGD/87EpELyk1YALoJCUbM9QRPIgNz2AW7ezXdjtk1
         02k0ZuETiqzc8TgD8w5gQ5qxhx45YRwPXkzy4gCsmp/s0xiGL7pKGrBeKep+SmGPvV5/
         QjgIMLwUJ17etp4wSLhRUpHM147kkaDZ/XEJOpFqMnVdhy6ZOObcowHhSQnY3Yxo7Rwq
         a4/QAvdQFaUytwtqgOeMdq8TjHQSvChdCfX0xPzVTLQNre2DG/0N0msCa5foE/P5ALot
         ffKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FC32CwpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020ad445ad000000b0068cd9703420si12197453qvu.332.2024.04.02.07.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FC32CwpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf4Y-0000sq-7O; Tue, 02 Apr 2024 10:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4V-0000rK-Pn
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4T-0007jb-4M
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-415446af364so26329495e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067903; x=1712672703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBDHfu1WWwUZX0nO+1GdOpxUbxXBz6m2k2jhIHnZ7lw=;
 b=FC32CwpQHzC0Nynp1HeXvJGICZ0KibfLDnEKf4H09QTjps8uDomnjvVW/e1GCK+/Ht
 agBr3RxNQAarPv0wys3yAjf8AJ9oCXESQ57lwQxE9thWuvJjPpl1GI1LVwWHgNEt3gpl
 649ex7LqjWzafD2G42Nn3NOjJgxaLzsS6EEwnGdpylET7ZYg9BvAMQQ25S+47WXsi47/
 3BtSpC8y6G0gRAZIt1eaazUi0U+CHjkmvcSHa+9PC5hbdwFh9VjI4u+OILC17LOXEKMH
 Y8Zzh05gO3Sm1gB3xGKcZK1gL257VYhhGLlnKMNo2nkspWJL/a9DNixq6W+JUtl14pp9
 JyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067903; x=1712672703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBDHfu1WWwUZX0nO+1GdOpxUbxXBz6m2k2jhIHnZ7lw=;
 b=niNIKzqb+5lMbE9KSVOV73W+6FtQg7cJmor8Ze/YrnLmELs4M16QMXSmsBYY+dnlJb
 F9FDaXAAWUO6F3J4qNIEvF5XEQZe/wcXd9e5O75IeAMRX4MBXAOvO4dudIeWN2lHGJx7
 JbNB3agpY6Zcjdn9X+Zp1ymKkSEmFvON5Kg7B13EyjrmW0heCQ8VKok36Uv34NPV2tzP
 aHoyqODAVhytBtDjWzA7L1ikuIar6cCTjGkSOHZv8aGO/PXJuGastgHXU8vIxGF30t8y
 mtFnag0XUbB5+tIzxKZrE+qW86OuRXz1m4ZwdVSHET83hCwi2nny549zHFN64Fo883oV
 jS9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6rv9Z4awULVeC4EUHkbKa2E8ExjBGvEcn+UD+5PVkl5GEVR0RJjBpBbb4cHki/LY1jy4SPQwRihXKHIZYXndkPzmn
X-Gm-Message-State: AOJu0YxLFQwqQqTObXRNrjJ6MIbz4Jbi2/DcEvTVaeUHX49+oSqvYgrI
 3ltmEDwZFfB9o8lB08STXca/1E7ovLGaVwAkf9Uu60LAQKFk9lsmS+cPQ0Nl2lI=
X-Received: by 2002:a05:600c:3b29:b0:413:4299:ec9f with SMTP id
 m41-20020a05600c3b2900b004134299ec9fmr11034767wms.5.1712067902875; 
 Tue, 02 Apr 2024 07:25:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 fs11-20020a05600c3f8b00b004146dd6bfe2sm18023274wmb.47.2024.04.02.07.25.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:25:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 04/15] target/ppc: Rename init_excp_4xx_softmmu() ->
 init_excp_4xx()
Date: Tue,  2 Apr 2024 16:24:19 +0200
Message-ID: <20240402142431.70700-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: OKjxJh7m7Wuw

Unify with other init_excp_FOO() in the same file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20240313213339.82071-5-philmd@linaro.org>
---
 target/ppc/cpu_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 22fdea093b..6241de62ce 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1642,7 +1642,7 @@ static void register_8xx_sprs(CPUPPCState *env)
 
 /*****************************************************************************/
 /* Exception vectors models                                                  */
-static void init_excp_4xx_softmmu(CPUPPCState *env)
+static void init_excp_4xx(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
@@ -2120,7 +2120,7 @@ static void init_proc_405(CPUPPCState *env)
     env->id_tlbs = 0;
     env->tlb_type = TLB_EMB;
 #endif
-    init_excp_4xx_softmmu(env);
+    init_excp_4xx(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
     /* Allocate hardware IRQ controller */
-- 
2.41.0

