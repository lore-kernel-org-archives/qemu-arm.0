Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp737134ejb;
        Thu, 15 Feb 2024 10:01:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXr5Wka2yYVIA2O/Jq59qkyEzskKZn15MNxC4b0r58ljOc+1CwLGQFNrT0cUTBPMLq65SgIUnOpvacWDi0jgEk5HxiccJE1
X-Google-Smtp-Source: AGHT+IENxMjobWXOw5fSNde8srZWG86gQoiLh01LAw5fBPUZMMMrqlGP9Oih+5ofeyCMZflZrl0S
X-Received: by 2002:a1f:db44:0:b0:4c0:375a:d68 with SMTP id s65-20020a1fdb44000000b004c0375a0d68mr2181054vkg.11.1708020108948;
        Thu, 15 Feb 2024 10:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020108; cv=none;
        d=google.com; s=arc-20160816;
        b=VxnTi1UotWOuZppdIhjiqoey8ieFb6Sth49k1hy8dHyAqcgoGR8v62wkVPTmGkanDW
         CbI3y+X5eEVLQWRpZP4+lv9DAOyzi0R8hyYXsO238xMYxuA4u6lC5AJ0VNyXr5Oo/SYi
         vfqEK2k0RBnk0g7hmph8NpEQIKzLtwZo1eDrWrKFsS+E/oqPIDoEP3/ki1sEOyb4JFgL
         RrazCWULsf2bE5Ak1nauX0DykIEc+h4+Zkr1Bn+TdLu92fv2YUz5Ryabpp1N+t59tcOO
         hru4la3kYpGG/f/nYc4XthrpUE10dM18n4uQzvhNal1bPkkMUI4mC7gXlIxK8cKxjntP
         u5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K9qIQKhs5a0rBnt1RjYr8e6nFgX9Qz3kgk9xy5OfTBw=;
        fh=fvPUXMdF5QvUaFMqHoGXrCkgR1ZJLW+srH0epgGNoQg=;
        b=dNnDzC8QCqD7lT5cO69ro0ZkocXzO9Q++2eVqPRTRqPXhcKNuZi05VTPB/Orwng3DL
         TyyRzMfLJBTVAKNREhoMXaPZGb5LZg1scu5L63EJ4m4rdwNGPjkVU30HzNqTXDiezvzY
         LxdvQmwsFq7SIbYR9BTxy4+NeriZVVQmVqFIoM9yIuUOqSok9Ss0qDGkxxci+IxH4tBL
         diDmdyDSPF3/v7L2JlRnG3PHNDoMp5/E8vS0ht9KeVXyZHXjOVb7ptR8Rras8MStqASR
         qlUMZi+4Xym9x3KF4BBaN6+Rny8l+c3DNg62Bi77PTizhAnIii/PdLo2yGEcl7mGb5Bg
         phjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcVjhbk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05612212d500b004c01ad73359si399735vkp.112.2024.02.15.10.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:01:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcVjhbk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag2w-0002QH-CA; Thu, 15 Feb 2024 13:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2n-00022N-O1
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:01:10 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2j-0002P0-8P
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:01:09 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563d017696eso514519a12.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020062; x=1708624862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9qIQKhs5a0rBnt1RjYr8e6nFgX9Qz3kgk9xy5OfTBw=;
 b=jcVjhbk2wkTr1VOMW5l/6dNmOeMuZB74HM5kfddyqgAVVruzA1PdZHXL+gT/pACIhS
 ahasEDmR3iDZmges47KRqiyG8nO4n50WBcPMpgVE/opa1PbkuRjFgfBoiBjaeduZc+I7
 o2TgNBInpZsw6FQ/9q5MKriad6XTWZUo0/K8T/PMfZLNtWU+5zf6ZJ/YdG0rMXn0k17G
 l+d2ROaA3cRyOocmf+J7Lt/6BYbhtSahjmInFEFHeLsCsvOjOUZQ/qeXvYmW+ctbi3qx
 IJ4c58la/jHWX8ENCYPp0RyT1egkUd5qfykEOzs91DfupJEKHXlKc7Lp6Uk0j7aKU9be
 WIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020062; x=1708624862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9qIQKhs5a0rBnt1RjYr8e6nFgX9Qz3kgk9xy5OfTBw=;
 b=H8Ba75OmhvFr6hilzUqapDjgp/2Io0zDc7hgJvFB0jsQtGSOIEV4Xr3bp9ynanGiE7
 r2vgOxW7SePMfRc6cJsWnGPcQrZkWdKVq4791ddMxwLtw67od0YeiWFtyq+Uk0m2P74s
 PumInCyAClvA5ILJdDXLQsFKWEZTMnApo8kyZTtWRUd1iuUmQHCjjYKa3R9Sn50XKxaw
 /Kcjyelpp3tAzWRj8exkPLgyUDfdYSg07O0mfL987axqiq23FYGmLHMFtZOypadQkIFN
 e21dmzESveI7bCgXOCHBBwqgsYEveI/PIXc1Sdy4mYoN72JyRI0ReQwCfBRnFtzkNXwk
 mFug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzE8XIcXIS5DRq5Nk866PhYCh+SzOnyddEe8KNPXNFwz6eVKwYEN0j/o1c5S1oxtDdPqEgQPwe+AwkL3vFlAjTuZC7
X-Gm-Message-State: AOJu0YwvbZ6DttQl1uXK1YEiDjgGfkSPJ310Qlmul5rIsLbIxeo5Bj9A
 MIt7qqOTXgQPbmRjMufJVovzQ9wZJW4Ik9KKA1Pq9AiTt6IiIgelN7vG/lgoQZQ=
X-Received: by 2002:a17:906:7d86:b0:a3d:e9c:6d3a with SMTP id
 v6-20020a1709067d8600b00a3d0e9c6d3amr1800135ejo.49.1708020062128; 
 Thu, 15 Feb 2024 10:01:02 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090699cc00b00a3d943558b8sm744210ejn.134.2024.02.15.10.01.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:01:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Damien Hedde <dhedde@kalrayinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 28/56] hw/sparc64/cpu: Initialize GPIO before realizing CPU
 devices
Date: Thu, 15 Feb 2024 18:57:22 +0100
Message-ID: <20240215175752.82828-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: uiQ7vwYV9Qvt

Inline cpu_create() in order to call
qdev_init_gpio_in_named_with_opaque()
before the CPU is realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Damien Hedde <dhedde@kalrayinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213130341.1793-13-philmd@linaro.org>
---
 hw/sparc64/sparc64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index 72f0849f50..3091cde586 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -24,6 +24,7 @@
 
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "cpu.h"
 #include "hw/boards.h"
 #include "hw/sparc/sparc64.h"
@@ -271,9 +272,10 @@ SPARCCPU *sparc64_cpu_devinit(const char *cpu_type, uint64_t prom_addr)
     uint32_t  stick_frequency = 100 * 1000000;
     uint32_t hstick_frequency = 100 * 1000000;
 
-    cpu = SPARC_CPU(cpu_create(cpu_type));
+    cpu = SPARC_CPU(object_new(cpu_type));
     qdev_init_gpio_in_named(DEVICE(cpu), sparc64_cpu_set_ivec_irq,
                             "ivec-irq", IVEC_MAX);
+    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
     env = &cpu->env;
 
     env->tick = cpu_timer_create("tick", cpu, tick_irq,
-- 
2.41.0

