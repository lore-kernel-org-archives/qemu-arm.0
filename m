Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1696023njb;
        Thu, 6 Feb 2025 09:32:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRj97TJ5AgJQS0AESdbj1g5Xlnl940tvN5hHR6nxwwWVFwG0cxeJ88uFMe7yUhThS9oumbj8zdLm62bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEjnyssg+Dt2R5AOzqc0yE9uFJBt/LujVBZkMTUCUZkvV96djvYxy1IqB5RSJAO9+yGoyIo
X-Received: by 2002:a05:6122:2191:b0:51b:a11f:cbdb with SMTP id 71dfb90a1353d-51f2e1026d4mr364028e0c.4.1738863125523;
        Thu, 06 Feb 2025 09:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738863125; cv=none;
        d=google.com; s=arc-20240605;
        b=BKj77Yk5U2EQ762LL++6GpT04XuFeIOubhAk3ELgj+MXrUpiERw0xzR9R7Pok+P/J1
         jiuMZ3NHUADDdbbNeBQqVrRDGI7ntcMl1iBc9ZXiAn+iK1IXavxl2fBz/LU9UawYlWps
         GzS0oa5/ekZk9akI/jUT9/yLafIGiXofl841n6gckhmCVL9Iw83eCrrhgzSpxjmqPYUz
         +NtliJesqb1ACm/foCXoStLOlT4y0YFC10/jVkhFrJbN7YbZQikDtJoNcEAdR8jwihSj
         huvnrD1SjFlChW0KU7AutlMQNe/ppEgew9vlnpD8EowcVXy+BqDRyyokgDng8KEGqO1s
         CGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=idp8YagOT72BvAuzPg0RgX1NZKUc5vKVHQTzZYr8yAg=;
        fh=9/4A7IiKv7o8U/mduupoAvddQB+8pLjjPuJGzfNnwyc=;
        b=d8P6YOYLGUvEWzqE/7D94P9rzNlF9bBicYYjq7VfwkDFwIt/cXnWsUu4thciy4qCoT
         OENhsPB3oBCvZzf7nk4fB2VSilDwkHVbb6jUiLF1tXvjSTLD+KjlQAU0tA5xoZ4NrwFF
         rnB1Gbh4ByMNZw3YKgXur1ymL6uU0nLiKTb99E3F2i18pFBILXIlB31xsJOG9bBg3TA9
         AZKw9QrkxQSdSQM43/IPuZxgr++nHS6Rrlj6BSWSkvQ6k6PfrPZT7mI7OBqTmx0Vrw21
         hNjIA1onnwP0MWBcT2iV5PpzMEJoJkzhwSZs2BhEv1vsmlbWUF8Gug53ohmqOgNiGror
         8M+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XoVEuxB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba778e7a5asi322387137.521.2025.02.06.09.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XoVEuxB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg5jK-00012I-Aj; Thu, 06 Feb 2025 12:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5jG-0000wB-Fp
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:31:54 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5jF-0002ZB-4l
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:31:54 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so957282276.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 09:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738863111; x=1739467911; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=idp8YagOT72BvAuzPg0RgX1NZKUc5vKVHQTzZYr8yAg=;
 b=XoVEuxB0Y3RgqsqnrbbwCy3HJBToBhQ/5g1ePSiSq60JLi+coc6EbiQKiaEey4opBz
 JNUbv2mj5r2ZV6msBwSo37sDDE47ou4Zy0Y/fGBckY99AUkYpDhBJ4DCfb4dzskEONtJ
 bPTFzmW5wX51T3GCy5CBd4WE/HNoLa74VvJxKzSt4NI4OF6U3fLhWtlatjKw6KSkaq38
 orXkpkRf3xJh6BUwTY4dKcqlRFYzeyEYX9q2F9oopiyKMuw6C5iObENY1PNRdwANzjK2
 lG6LVLRj3Fp19hI58ptogsbvyNux26ezDKqiagRn+74lfYmPz3wwYVDDw7GWgZp3zJcY
 YzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738863111; x=1739467911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=idp8YagOT72BvAuzPg0RgX1NZKUc5vKVHQTzZYr8yAg=;
 b=r5lt5FBql0jHbH6yKrnlIOauzm3gdF1SL57qteg9WXyDknliHMqtS//eB1RiG6Qi3U
 F2X5bk8f/abXc4/u09jmRmUAzR6fABLu9VUjrZHEcOpCpZvdQ4B8okE/W4zr2bzUE5vt
 /l3W78siqcyj5Q9Q3TjFwVC8uNSDKQu1FHFivDwmq5jGQQ2Cf81ai9gLCyTdh+1nWxWS
 0cLfFL08muYBXzT2Q52ghqm+hUebrWT0GkB4aXaaA5PHX9VdbTSAUhve6++N9/q6P5RH
 sjFlOOvFz1HulI7XZXsRX7ftvdk9c2T1SnP5BwuLYXKd61e0nxAnWRceoHTFcnu2nuQE
 r0Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdSyT8s6lB6zD0+iCCi9voHoYAzg7Wa00jIMxxIb5+jookh9M+w5G9gm53s505O4rGJGCIVQuxUw==@nongnu.org
X-Gm-Message-State: AOJu0YzmqOom+zTt9o2c0E2sUrNlxMRGmO5AxKldmCrN7QbbTrvx7LyL
 0g1v/aKk/3jL7rEHOhJhvv19xZkr+1u2PfGY/8sEf55HpcLC7/Ylym4iYUq4CLNm/l8AusL2aYP
 R47NTDhUG3ySdN9Sqtc7mKt6UF+qyhxYutZ9K2Q==
X-Gm-Gg: ASbGncvw9F1YBsIhhK21tk0iLbILQFtGe94EOjNaXubWVsWbwKdvhDQsavD8FGlDvOk
 m4xaaAhISO96Dd3Bdpd1ynwElHIHU0iK+KFai+16f7Z4Glq1Bb4ROKNk1WjWsDujVOg1zMjhj7g
 ==
X-Received: by 2002:a05:6902:2484:b0:e5a:e6eb:d44f with SMTP id
 3f1490d57ef6-e5b259cd477mr7119331276.6.1738863111469; Thu, 06 Feb 2025
 09:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-18-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-18-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 17:31:39 +0000
X-Gm-Features: AWEUYZkNvJQHpOvvbvz9bYLCSlaCYZZuFmWYkOzOsjd2fmF2SAGxMy1cBxklw_0
Message-ID: <CAFEAcA-U8dmCVfD8n+Gc1D7z1gGyUa8ZXqWN0cMmUG1cxHreWg@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] hw/arm/fsl-imx8mp: Add on-chip RAM
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: Q9MIHOIDZwn2

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx8mp.h |  1 +
>  hw/arm/fsl-imx8mp.c         | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
