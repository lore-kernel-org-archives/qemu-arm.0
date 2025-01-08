Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp716169njb;
        Wed, 8 Jan 2025 01:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+7eTVKKNPpZ3BfWL8CNjm/IbZlsBHUkFv80FLPFGGkGfFVgsK+eJEmyNgjRXtNBM5hy4Bal5+uy6+EQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFFfybKqdMBQH2QtFG2jPxCp/62E884z1TvYt+iVJn48bOe7Ubr/8zC1mzqCDoi7K8IlgSm
X-Received: by 2002:a05:620a:40c2:b0:7b6:d089:2757 with SMTP id af79cd13be357-7bcd977ebb5mr285433585a.35.1736328545499;
        Wed, 08 Jan 2025 01:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736328545; cv=none;
        d=google.com; s=arc-20240605;
        b=V2/MSA/brJAVQYe25KErSBFIa/DwUnwH6pNr587gcsdqAuu9C3L45vujMU8Wi0BH9Z
         joT4G0gziXF8oeNxbNqXmve7JOQZOfZYbXQ+rhQUhIXcCi+aXtZQ3g5TRTjgVQ2Zy8Df
         x/DxozAi/VjzbgGHd3n1i0cmyaQg06fzCyC/z1tcg4k8vspzHN/EvJFYCqomy8QeR/mx
         Ivq3yeqtk5Q1gBP5trSUzWUn2OOk7dd5sG9K1YGAJ/0vT8SyTV+vgd6iE76aSsBhI6hi
         spoHshojxpUvlvw6HSspKBPdjIPvR9/v8k5i3A5ODUI8sbv8RUC3qhfd/iDUkgk+0kse
         hlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fs6DjGCcdE+uixmXV2Su2ClqzCx3jJdPOZ1E1qUMw70=;
        fh=XqTFcDXyBhQjKifpCzKyi/TLQ0IUpVQuQf6tkk7TJOE=;
        b=O6Oe4mcdLHkg9cq9/DxGEwvD3X3DfdUx/rmbezCTiYbXzZ0LCa5g8f4iR2ey/1x5K4
         0BwFhvHGQ3x9Mb/4GgSf8UgL7OlxCkCFiDjR6JbMrLMtGfXP6t4QXcvelYCWCdVC9TvL
         gJSAyq7RfV2nZQSwtDtbU1yyy1htLwJt3wO3iy4WGtk+EoZOewSdkzKnsWXU74MRDCkl
         aw1g6xLFlw0ZQNbQbHdRb9J2Vyd/9XoYIW23V/ymqU53Mn/MPV/Cja7w5Hqb3UcbONy5
         NkjpzQH8pUTWQawuEGdWgoIg0LCCRrN51ycvLJiRNpfMoKt+cYBpKhohuMBnIx3hPDfP
         ikYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HzpZ8LHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4f0b85si4759603285a.510.2025.01.08.01.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 01:29:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HzpZ8LHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVSL0-0004Rn-F2; Wed, 08 Jan 2025 04:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSKG-0003xn-2I; Wed, 08 Jan 2025 04:26:14 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSKE-0004p0-Eu; Wed, 08 Jan 2025 04:26:07 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso28025980a12.0; 
 Wed, 08 Jan 2025 01:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736328363; x=1736933163; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fs6DjGCcdE+uixmXV2Su2ClqzCx3jJdPOZ1E1qUMw70=;
 b=HzpZ8LHpCXR62ipeE/AxTEjvjifSOzQHr+wePIAioKKProLTMjpmrgb1rR1ZWCTdZL
 E9Eaw/Sy76LYf4PZuLy4+hiuDbg9kDr1gWXz4CCGytMUcUWfufM6IZpmDrcctEPdz+ko
 zQ6mnsLH97ohxE4CkRyW4exjgYcTsU9RIpf24DsUZuKMSF0pH+pE4Ez3x23oRoWyZq/o
 HoCDkn5xtifVJxV/kMT9XpmDnby+g0Jk2aCUttrPitth3zOWQxSdJjs0IFP1V5vx8Twi
 V1fmOKx3Z5V54e+xCg2W+gkNNHUjASRBztMwMG+UiPAPWcyutxM325xv+bbA0ULwGpAj
 iWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736328363; x=1736933163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fs6DjGCcdE+uixmXV2Su2ClqzCx3jJdPOZ1E1qUMw70=;
 b=pP238RTg/seakgGYu+rk4s/VPt6tw/HrkD9krh2quFQJv0rSKcb3v4MunNHnCAr07w
 9HaMY+KaoYfOUNkxDjGc0Eh30yLJfY8AMINhg3iACPpj9xVEaXTXaNUXva2rN0K0F6uQ
 +RccgS9sRJgdrjRs89MMApvHkmrzo7VNP+XvFyO211cXGQfWbVD691VoMrtSHM2ZNua9
 e7+hGHyVvYaxNKNCoBkkSws4dBQ16F51uL4x/gR0a/DqKdNw5RGfHc6z6EY+RWCMhq48
 UEZNDambhse0P0EacH0LfB8kAmm1mmnLZiYTNxGNrCdLCgn3hHWGb7nFSs+bWT4nNnkW
 rDKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY2M7WVzFAhyCgQdCak6HKEUy+b4GXJzCNyIq6M588h1FDBueyEnz6NHQoLZGY1EEdvuMhi1q3XQ==@nongnu.org,
 AJvYcCWBGJFy05IXmH8z/ezGJbljd9AJTNmEWdvoZnsie821Ut2XIMNsj/5Km3NLatgqiBNAbGUtWVP+HSGUDw==@nongnu.org
X-Gm-Message-State: AOJu0YwCs6N/SXGiGkSpuOUsqc8/jt+tmBE7LFNdTcGP+GjUDYTmn+mB
 KLGnfSo/eW0X8rpRTS2GS4XuA4JrG0e64WbzxzInfz/LnfrSRFAeApx2nYEs
X-Gm-Gg: ASbGnct+TVlSEPPnSh6NDdPxI+ydfNiv/+KFg8ZWQHkSlTS4vjCHmzPYU+OVnHdKW7V
 WR9b6dozu7stnH70Cq84wiU2fKvX8parzyIirOzLUWzGdYwqTzsZeaxdhvDJ/q7hRnLxsGss95s
 iZ2rGD0ymyv4Neqxo9cRl92hinFxXfIZIVP+NRItKwLtUYmeXrkbSreofLnIDDDzgvUwCNqOZxZ
 Y9yYcLul8P9OFxwF3aD5GuoPrN9cuEQoS3+MDFb2nBfjj1x7dHJFsgbKd6YCTLnRIuGrvVov+/g
 hTqHxSGEdx2/Q6HWRS68Sse4EQvCSpFl+nedavbp3wbgFzc=
X-Received: by 2002:a05:6402:268c:b0:5d2:d72a:77e4 with SMTP id
 4fb4d7f45d1cf-5d972e6c9b0mr1687005a12.28.1736328363114; 
 Wed, 08 Jan 2025 01:26:03 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-188-106-228.77.188.pool.telefonica.de. [77.188.106.228])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806feddfasm26116096a12.58.2025.01.08.01.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:26:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/14] hw/timer/imx_gpt: Remove unused define
Date: Wed,  8 Jan 2025 10:25:34 +0100
Message-ID: <20250108092538.11474-11-shentey@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108092538.11474-1-shentey@gmail.com>
References: <20250108092538.11474-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: mdq5RC9B+2qS

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/timer/imx_gpt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 2663a9d9ef..11eca9fa4d 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -20,10 +20,6 @@
 #include "qemu/log.h"
 #include "trace.h"
 
-#ifndef DEBUG_IMX_GPT
-#define DEBUG_IMX_GPT 0
-#endif
-
 static const char *imx_gpt_reg_name(uint32_t reg)
 {
     switch (reg) {
-- 
2.47.1

