Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1020442eju;
        Fri, 5 Apr 2024 07:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQA5XMHSI3CZS5+XgmhtC8s4UWrcqAJsWvqzOGQyhP4nsrkGWz8uwE/giWc7nPeVX/LuzPBlYMT7HslHKxGGW16nL6zvee
X-Google-Smtp-Source: AGHT+IHmmkNixL+YS9Y91EIlIOT8FVFexhleCeECUew0J9vmIDIsT1a6y680zGQiQNoCWUmNGJRK
X-Received: by 2002:a05:620a:a9c:b0:78a:69ab:e829 with SMTP id v28-20020a05620a0a9c00b0078a69abe829mr1521683qkg.68.1712327288489;
        Fri, 05 Apr 2024 07:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712327288; cv=none;
        d=google.com; s=arc-20160816;
        b=tcNOjjPG67Qp8ZDVVHxGfUAGugjzyW5Ppiz18+tH+gexjSrCOHMxUKK3pBm7A/GhcS
         k1tKWuU1KTHLse5ESA5ZX7xeRxEwVv83Mc11k+G97f7cSQZ9lSbIsG2w/bgWnCGg6+WR
         6n3N/h81+jnRkfDQ8YS2VjWrgLAHeIV6en55AlSRieBTD2WWFHzQcjBUcdjTwAnKmmOh
         eIYALzEuBE0Q5MqAOUV/Wxsa3pze8aOct3ujHFctanJtgwCpBIasVXvYk0J4FSQJD+R0
         OMRL+9oiEtsWMtkD0GfkQK8B9gu8qMgW8QzuCR0ahQJveyi6OhPvy8oxj/PQCosBLzfZ
         +n5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7Bun2vhsCleh/N6AH9rwv8hGRqgqda8eN6MGMI23yJY=;
        fh=qcSfhKhsiC/eZQ3IU/8OZy20XdRDumJNfSUKFElhaW4=;
        b=lUSpcmZcm+xMikv7aVGVMQZhnK10azH85D/o0hz44RdxvJHnQv4L6iK7NtJsG7HqNG
         36FB+CZnAQmVHRkos6XCRG9JtpcMZ97ZUyYhkpwEUDvzhrRHoGCjQn8la5lttM9BJ+2I
         IKV/gdp3+SlgLrz7qmfLe4nP4DiS/KPy1DUTL078vMSRCvCZrYcT3gAZM1J99I/rU1G8
         44yvSfzcVSs9IJ/kk5SF8wLjqmCKiqII3JOJPjsbz4Q1Dvm03pXOP/tuILV1HkxRELnx
         jOX9jugdDwurv+2CZHhhwSABevyUdyTK+r8eYeaQg7YANDVdsjm1DTjuoujjrnfDpvTw
         fgcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5CBriXv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020a05620a144e00b007886cc4988esi1905162qkl.161.2024.04.05.07.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 07:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5CBriXv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rskXg-0006Ho-NG; Fri, 05 Apr 2024 10:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskXd-0006Gv-54
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:27:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskXb-0006nN-4Y
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:27:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e136cbcecso2990117a12.3
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712327257; x=1712932057; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Bun2vhsCleh/N6AH9rwv8hGRqgqda8eN6MGMI23yJY=;
 b=O5CBriXvuZKu+YuUfE5Gws917kwOseB0eZfOCz2me1crSsa4VrN4ri1fqrvVHAIOxk
 72MFWxwC/ktDg7DJpeO9+cOb7YxRIgl8PLfv8AMNkOTerYoa1gkvBNKJbabbYwyitZSC
 BSRNsl1fcRwhbeergf8cUINflRPy+8LWpHNFiC3lRrGRF84USJ2D0Nt3qkC8KXlrEzGw
 lGhZG1cmFxIl4/xvyvosfNXmCElBVwToBq7+/InbsQWtPZB2pAKNV6IKqz66l1pExb+U
 G4+EUPyM/1mIgXVBypnObTSMlglJWe7uGcNw5gzOqNg3k0+e3vN01zSQi49YfBLrI0qV
 zkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712327257; x=1712932057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Bun2vhsCleh/N6AH9rwv8hGRqgqda8eN6MGMI23yJY=;
 b=Kd9JCZW2k5CzYKTqFTBFzsWHh4r8EdygV2Z2k48V8VyUb0+V25jRU0jEifXyEHGdsj
 yZy8DdPyz7hVQX3NM/U0XWJKbaIwndcPBwvu1RvJ9XvYfKir828ULDBP22uIN2zwZO7Y
 9i7jhjDYXJ01bVzZrltan773ZKfXpo20boCfF8cwyYLCRnKG2kCkN7GKgtJEESq6rx/l
 dCqQ4CE7V0QBu49vc9krkP9lUDjOr2s+kwO/5n6KvcsVIt9Tw4fgthAwJKZ+1YTSuMdU
 Wd9RYfOvu8QFBqR4clZ6/IAMNC3et6ZAfTU9wphpQns1HiP1poIufBkZEe6+u3peKWJi
 Xmyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4d6pN983n2NQKMZEp2SqMft0/Xs+G/bX3tUGlilsrSnIxCSUZ2hNnuC+4Q4rJ/kbBD8uHgVXrqMj0IALIWqcID6/9
X-Gm-Message-State: AOJu0YynJWLP3MWamO724BJo8+Q19Lf0OPPHi8rm6u03fwngUb8tkr6l
 UpKVu9LvsBISmfJYqDPyasmNiU2CJjS2i8JpWs/uKRSDWXwCrhaAvf4z3ol03G8gZX1UNd5DSdL
 leluAjKkP328eKSkn0tfZSRZbDNUbVB9ZYFD2Pg==
X-Received: by 2002:a50:8a81:0:b0:56d:fca8:d209 with SMTP id
 j1-20020a508a81000000b0056dfca8d209mr1184729edj.10.1712327257354; Fri, 05 Apr
 2024 07:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240329174402.60382-1-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240329174402.60382-1-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2024 15:27:26 +0100
Message-ID: <CAFEAcA_xuXMRnmFMs_GzfrDN_kpR+c4C04OcPjxtz+hSB_ga2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/char: Implement the STM32L4x5 USART,
 UART and LPUART
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: /hvlNmeeboMp

On Fri, 29 Mar 2024 at 17:44, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> This patch adds the STM32L4x5 USART
> (Universal Synchronous/Asynchronous Receiver/Transmitter)
> device and is part of a series implementing the
> STM32L4x5 with a few peripherals.
>
> It implements the necessary functionalities to receive/send
> characters over the serial port, which are useful to
> communicate with the program currently running.

All the patches here are reviewed, so once we reopen
for the 9.1 release (in another two or three weeks) it
should be ready to go in. I'll keep it on my list to apply
once I start collecting 9.1 patchsets.

thanks
-- PMM
