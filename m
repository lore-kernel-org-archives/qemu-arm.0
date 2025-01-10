Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp256844njn;
        Fri, 10 Jan 2025 08:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUeloza0dohwONKlK1KLyO3/bwtXSg6Na5ptD9SE6Xo128+shHZLiUZWpeYfoD9cg65QTY7YKFcyBBzsw==@linaro.org
X-Google-Smtp-Source: AGHT+IHirP8dgU9gMV6e0cRN6g8exahLpvhU9WtGu0l7VUuARTmlWiBUZRQWlSAoMLELs8SQl7fI
X-Received: by 2002:a05:6512:b8b:b0:542:249c:2156 with SMTP id 2adb3069b0e04-5428452b8bcmr3561468e87.15.1736525061771;
        Fri, 10 Jan 2025 08:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525061; cv=none;
        d=google.com; s=arc-20240605;
        b=J1bYHF1oSxjtMXB57xJDNPQrFdvnEuZOwdVYqNrVu5uvr4rlZr5Rh+HT0DcbmD7UDQ
         8DGmk0ah8jK+hxZfVC8NQ1bpq2E1TzOjzpJEH74QA6X3Jt09wOvO1wiPzmFhLbjsNz/G
         nDHH6P1VnxYxoInt+nLCDskUKVQRw1k3tGB5/INR8fi5oNglMa5aEYsHvtbjnZUvyOm9
         7EgNsJmoHXghjBEd/G3RvB9VcqqIDdHyT3TONZmNREZoB+K50ftjWOUBGREZMN1lsoEn
         a+G9AKLpRa6HbrdhMl+95L5pJNdryqpMITQEm+BCkyyjUidPz/vpLPCAtelYBDmoxrcx
         R3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f63ecg0nif+jK+DGCLVe+u7mEjni/luwZDTHSRxVLnk=;
        fh=URsFBf80Sm4GdVFGAHM2tFc39kEPycvm2742DS2R/4U=;
        b=Qgzopelxw5EsDWLElq2hA2a+g2WxRs8OeuLVAgr9sw0C2QIfOAaApR0DwRxDiNWwE2
         X5W488osxapH6NTiXGOsu8qSIUfRZ49GBfE0nXtBvj83xjvL07dHDXT0n+IxCpZnUkoU
         JHq5tiLjTSgx6N6yzL6pNVn6CoZtZwI9YseZwIrq8JnobIUuCDoNGrZjiq2li/n2N+MX
         fD08HHWYox6oqV26FbytoX225s/D+ln4UpxSHS0Upvvj5bUHQyM6+lkhCEDKgQ5pElt6
         hklXCpMSXC0eOrYDrvYur5yexCQSOeStVHXptwT9JvI9WVbZvR6DgkIGemtTA+B2ky96
         VHqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K6NlI/3L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-5428bea75c9si1517906e87.362.2025.01.10.08.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K6NlI/3L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTk-0007ZE-Cb; Fri, 10 Jan 2025 11:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSt-0007GR-LJ
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSo-0004D1-71
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:24 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436249df846so16621015e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524940; x=1737129740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f63ecg0nif+jK+DGCLVe+u7mEjni/luwZDTHSRxVLnk=;
 b=K6NlI/3LfsFjXpj7n1dvjxw9nJ0wR6RQ6h1cmakTekEknBKEBgY2mG9wX9rrN9AKaF
 BhgQd+o5lY6j/YuTpyKopSTBpfEwN/ZOiB942Yq+Xow0goFaM3w/eY2wHXC1L5aNbxZa
 JQDQ8gZVOu8mQO/MxiuBKQnJsgFiS02EVLtYUmQLSlKKIuCqnf/bNIFSKmYYSQICvqPs
 YhKoq4ky/odDjektYA4KZBneeP+E8YJxyO4xBLOcH0j4vaJfxvkW2+HWWjjHFiCLBChB
 mRq9MmNRIB2zvPBd66qk5kmqZTQa+WDPbxaFCybDIV5sy8mKwL6MXFlLq8tk8WZsCkGi
 sa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524940; x=1737129740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f63ecg0nif+jK+DGCLVe+u7mEjni/luwZDTHSRxVLnk=;
 b=gJ81SjH4pAhxuR4tY99s06JmBrKxfKbzrGQgNGzTCWWuZkhw+Ph5qVn9PKeGkjJlzi
 QKjxrS7L//DWqaMlUn/QLkWI2/WPobmfrVFspgrQd1+EnJi6OnummWiBnsSldYIhIbch
 l2tyPDtC4knWKYx7TTyxywuEkJyrVCSEZSUYtqxjN3KLB47o2FHZIHq2IXxN9oN8T3sG
 APOMjjoG3zuQsvCphB+GLtwfaMUIxBfx4T0qZPD+5p8D1CNJlo7MaW0CcM6913jXC0u2
 EbNU99zgUCvA7kJNtVC4pF4Vuo4gsZhDBcOuiq2M7m5yYXAA5zATgANez72Ob7wRHiOX
 uu3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGsTpFzNaJL/wHphblkwJVEb3Ie815Zfhm8kM7avz6s7frzazLlivmjPnuHwekAc5HyNPcVclVA==@nongnu.org
X-Gm-Message-State: AOJu0YwNvsUlJMulPex9vcHVVl5z1Ci7F604YAZ2ZE3ZdyIadFWlfqjz
 8Tr00pfW6q4Sb4lcvMLZF7jx+Xjrujo3QfsrLFzzOUoqmb6ixRoYsuNzdsoA1UW6ZMtOG/bdGsh
 p9RM=
X-Gm-Gg: ASbGncuGHzvJy9RKJ1vQooepha1GQaLYs0cRz1vF+vtE4w86ei/frg2DOsdFqxrHjqO
 SJrNLzFcdobVI/TvGvsTPID7/qd8WZ8jSqXGiD/N4zwXpp4BBzdgxirzqcx8RmqJ3KRbLTQPVFB
 N28ZbqBQ1t6soBkv99Ht/0Y0UGNP1miJpLCZJBn34MVeNpstve4xt/fI+cs6d55UzZQatpECyNe
 j5sHhR4+te9wMUh0r0suySSTYH9TM+yrrNffaDFdmeHkrZmE2Op19cBCPxkafljJfkg5mzz9Z+u
 3PQRWQPolXrw+vq4dviw69WRDuLsOPo=
X-Received: by 2002:a05:600c:3b02:b0:434:f5c0:328d with SMTP id
 5b1f17b1804b1-436e26d971emr94638765e9.23.1736524939809; 
 Fri, 10 Jan 2025 08:02:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da63eesm90389005e9.3.2025.01.10.08.02.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/9] hw/arm/stellaris: Remove incorrect unimplemented i2c-0 at
 0x40002000
Date: Fri, 10 Jan 2025 17:01:58 +0100
Message-ID: <20250110160204.74997-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: bD5XF3KO2kmB

There is nothing mapped at 0x40002000.

I2C#0 is already mapped at 0x40021000.

Remove the invalid mapping added in commits aecfbbc97a2 & 394c8bbfb7a.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 7c9e7e6c15b..254f7a234bf 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1001,7 +1001,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
      * http://www.ti.com/lit/ds/symlink/lm3s6965.pdf
      *
      * 40000000 wdtimer
-     * 40002000 i2c (unimplemented)
      * 40004000 GPIO
      * 40005000 GPIO
      * 40006000 GPIO
@@ -1356,7 +1355,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     /* Add dummy regions for the devices we don't implement yet,
      * so guest accesses don't cause unlogged crashes.
      */
-    create_unimplemented_device("i2c-0", 0x40002000, 0x1000);
     create_unimplemented_device("i2c-2", 0x40021000, 0x1000);
     create_unimplemented_device("PWM", 0x40028000, 0x1000);
     create_unimplemented_device("QEI-0", 0x4002c000, 0x1000);
-- 
2.47.1

