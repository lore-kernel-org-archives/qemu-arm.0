Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2177565ejb;
        Wed, 21 Feb 2024 13:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJ2k5LPGwGe4F8dEgc3bQyctpxRFi3l6rmbHyUn+tZJAyIItPtlHaqsyNvZLjwjgo+RUL7DxG8A1deanLPl6KHHa5OaMvG
X-Google-Smtp-Source: AGHT+IESrVt6K+dG00J+OX5tBf9Q3IrXFMAAXtJVR7qR9zLOdu2w1IOUAOoi57Lf+RLbP7w1kkcH
X-Received: by 2002:a0c:e30e:0:b0:68f:1dd4:cc42 with SMTP id s14-20020a0ce30e000000b0068f1dd4cc42mr16118550qvl.42.1708550869081;
        Wed, 21 Feb 2024 13:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550869; cv=none;
        d=google.com; s=arc-20160816;
        b=CYku8JrMVDPPkV92I0nEJvSpTsdDQypuCSFpWYFWdKWXhraP1O2IzQgBETiiBQuxTk
         KRSE+jCNa9/MUi+J4TOYCyhC4+cEDgiKqUv0lu7TLfo6UgcF0bSd1gbrs6/PrIBMxNql
         z38IxOHn0SOLoDrWTUdKnoxApXkWqoVmSHJF0thPp6LJV9CIN6ni5y4Cgucn+ikjUNIv
         uyrBA8Q6I4kuFz/wnzXYUpRGofPMMxTTjwycUv/VUNmDNft3amgiHtqYKrNi1QmJWsAX
         cK90ADwpCMxly0mkQq+xAZdASpDgnLot01a0J7hHzTEvngYbtqO/76q9XWR7DGsJYulg
         hUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NM3OaF5xVJiH79yUFzhlf4BJ4fqxcxDiXY4cqoH9BzE=;
        fh=9w3KqSgzMaROh11QbcP6yxiFqeRkPaMHH6jm8VkaSlE=;
        b=exuGxyb0f2sWgYigU13evsl6ZwHnnOT2wxru8xJDH+i5iP7qhNPYLRaKfOHp9I3FKQ
         ZRBRB3//cokG+F+X1ZrWEYkw9tMJtqeOFXWPoZJ3QNiFlij5C9jqNfhbZqGybw/y3jaQ
         WaWHxd+rfEpaDu5RIzO8mw2SH1dX9GWWyd9DvNKt3XF/FLwaO9Ih1IDr4QWuAm6bXau0
         ULLIgYfzVfXk8PmXZm0ayCMPzDlS7gcrY/quuUkcB2aeuV9dwI+4l85pSqllvuUJ+rBL
         8LaqWGk+G/Uj3DpWJB78Stqk/Feu2m7xJwCiyDY7drDcFk5ODTIodQ+DE2WVUnhVMzyO
         kYgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AdpoUhzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz8-20020a0562140e6800b0068cb950df8asi11787054qvb.5.2024.02.21.13.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:27:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AdpoUhzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcu0e-0006ga-96; Wed, 21 Feb 2024 16:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcu00-0004bs-Nj
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:19:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzz-0001OK-4k
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:19:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41278acf971so6168695e9.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550364; x=1709155164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NM3OaF5xVJiH79yUFzhlf4BJ4fqxcxDiXY4cqoH9BzE=;
 b=AdpoUhzfMXTC3rmgCYRewXCSVh3cBZKFmYxrAJ1KAbJu9a+BjkahyKyx/Ka+DoK7i+
 iWNk90ehBr8pseI39qjax8zZ6Tqg3pGKFo1tK8kDvdkAbfvlXnnvwg+SFwY9qrz1AsFw
 d9jGeIj9fbNsitQo4JEG3h40lk4FOlEYhzgBBF920oDEX7BQ66uV0t6FmD7XF75nr1Yq
 KMuqc28P8rxazbeo+SiljigLsMWv1ysw8lg/KWm8Le/ZzWAd6mUqYGnFbbtoOqGgRdDd
 dYAPKVMz6+zUfXlHRTaY4tUfq2uaN0Urcg0l1ZHdleGg0HfXOU1Xj9Q1LHQPzECw0MLR
 v9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550364; x=1709155164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NM3OaF5xVJiH79yUFzhlf4BJ4fqxcxDiXY4cqoH9BzE=;
 b=fAdLFG+oAJG18UOCmxbj2pZ7eJaksiCimqOZ8TPX5uPtKJBnum4tOf1lsSl/nCvRHo
 WhrxT1ybnucjdyj6w6hgMWWauCSsKNKFC5jzIMeMEd2LNw4pGYu2gUvNxL89nQODD4jw
 wywpx/V0jCczr9O64JDhFIJQvZv7Hu07e1ST1wQs/NV0g8DavKUWlx+lD07XilMftvKC
 2P5UY+zG7esMfFHdh2+YPhiDyDROR0V+slR3M4U2q65R8iYFVxs+InKLMaBx1eArINkr
 rxrW5h87w7bihwC/JrQmA25IylRxWHoRHDeSH+C1eYuL9wNaOpWZn6Nmi2fW0ilavLg5
 eaNw==
X-Gm-Message-State: AOJu0YwbaslP6AEggmlSnt/3df9G1kTTbOrTwTa/gNRGQYhVyPOH/pAj
 sD5ACXj65/JuTea5ZKVCf+iQ3Tlyoc2FV5F9i7Hi8wAUSyRor4Og8vBm7aMQbLc=
X-Received: by 2002:a05:600c:5250:b0:412:63e8:b2f3 with SMTP id
 fc16-20020a05600c525000b0041263e8b2f3mr9088273wmb.4.1708550364663; 
 Wed, 21 Feb 2024 13:19:24 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0041256ab5becsm16906430wms.26.2024.02.21.13.19.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:19:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 25/25] hw/sparc/leon3: Fix wrong usage of DO_UPCAST macro
Date: Wed, 21 Feb 2024 22:16:25 +0100
Message-ID: <20240221211626.48190-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: F89MyIKM9etr

From: Thomas Huth <thuth@redhat.com>

leon3.c currently fails to compile with some compilers when the -Wvla
option has been enabled:

 ../hw/sparc/leon3.c: In function ‘leon3_cpu_reset’:
 ../hw/sparc/leon3.c:153:5: error: ISO C90 forbids variable length array
  ‘offset_must_be_zero’ [-Werror=vla]
   153 |     ResetData *s = (ResetData *)DO_UPCAST(ResetData, info[id], info);
       |     ^~~~~~~~~
 cc1: all warnings being treated as errors

Looking at this code, the DO_UPCAST macro is indeed used in a wrong way
here: DO_UPCAST is supposed to check that the second parameter is the
first entry of the struct that the first parameter indicates, but since
we use and index into the info[] array, this of course cannot work.

The intention here was likely rather to use the container_of() macro
instead, so switch the code accordingly.

Fixes: d65aba8286 ("hw/sparc/leon3: implement multiprocessor")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240221180751.190489-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sparc/leon3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 4873b59b6c..6aaa04cb19 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -150,7 +150,7 @@ static void leon3_cpu_reset(void *opaque)
 {
     struct CPUResetData *info = (struct CPUResetData *) opaque;
     int id = info->id;
-    ResetData *s = (ResetData *)DO_UPCAST(ResetData, info[id], info);
+    ResetData *s = container_of(info, ResetData, info[id]);
     CPUState *cpu = CPU(s->info[id].cpu);
     CPUSPARCState *env = cpu_env(cpu);
 
-- 
2.41.0

