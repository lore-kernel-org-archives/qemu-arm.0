Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3437078lfc;
        Fri, 12 Feb 2021 10:21:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgNENmjHOYGSUCzSUyNeuuPHAeUBH7CNDtcKSh1KSU3rRBNfdeerWHzILm0Z9NsK019+/a
X-Received: by 2002:a25:af50:: with SMTP id c16mr5689446ybj.10.1613154087497;
        Fri, 12 Feb 2021 10:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613154087; cv=none;
        d=google.com; s=arc-20160816;
        b=wS+Ymh6qAuevan5Xk/LwviQmL+U8Wb1MdlaLg78qfrvoFbA3Eh3lAlQ9jU2i6DaDFD
         cH68j9SrByfBg/G4uI4oQ5JhHCQfT27rlJXF8QRjJze4+4YlH7w2N6LRy6+Zxd6hM05o
         xQTegmeBN5PKvC0piQLNYgQdxtsH4yXuzb47DjFTmFJg3V0W3xrF0+33YVd5diC7gZEO
         /9BSGn1oY0iJRqMGqPdXRNbQ6nHTpUfSVvTkdMbBb+8mVpbj/n+YJf2VwZ+1sPJMHnba
         Ax+QlB59HOKASx/TyokVh3tKW1WHRW6ClOVOT5cXK3930vWrDczfBXKg1dYLSv3wE3gl
         c+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8FVFmHz0nBUyRqCyVXMxljBZG7vQgwj3fjM5xD/39uY=;
        b=jKS8YmQfNvD8i/2nzO3A8gFHOpfXRcG6EdAz6PceFOaf0UxwMFM0eskQA+yvFZG83y
         V2b+LKj6OgLs5MYIkKb0ssWwTgYiaHxtiG61Y8jTMHZSfUWrmttx9B51QH4rMRZMhM91
         p5fdChmpyiwPEBjXwAGhPsg7k7NGvO9a+aW3kMzhekUSOE7hGsYOl1Gmp71nMh7hwVLQ
         pli/tEUa25v1+7K2mChUGBG1CHYtffn8bewH/HRwGCOTyvx0aYIfHBKk5ldcJ1a/sf8a
         K0RKXvIJ+i2zljrFEDB3z25HNoojP/4EfBqPcPrUqjFOxqBSsE10QdPwmQsXCjZVXD+G
         Ea9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UD27PEr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h37si9014506ybj.201.2021.02.12.10.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 10:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UD27PEr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAd4I-0001Jg-Ps
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 13:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd2Q-00008Z-17; Fri, 12 Feb 2021 13:19:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd2N-0003Zm-TV; Fri, 12 Feb 2021 13:19:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v7so235384wrr.12;
 Fri, 12 Feb 2021 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8FVFmHz0nBUyRqCyVXMxljBZG7vQgwj3fjM5xD/39uY=;
 b=UD27PEr0Xl2FjXtqCBtewltb1Ok17acQ3rIGj6nj6BB52d88Brj7h8lJwc0XTxZuR+
 z8M+56rsu8y0yzKcyCKhPbRz0xLjVM9WG/qzoreVP59cUbkqk1yomTHAm7oUBtk0k61Q
 58DzWfV7gErGKdblj34CUW4qX9DdOv1lEywBaYog/o/3oIbRuFNJDQ1tqoXSo6t3HfC/
 AGmMYUmGnPyRfpb8jQFxJCVp1MCwbeB0IARd/VpiMFQMLlou4VKY0dtoej5TEzyUSGc0
 oNhfZU6qLEFcZTh26VP6Ji91sKQNVXYhElSS3KKUdqJB3YSm+AeFpMf9+ilb3YP45Fr0
 86TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8FVFmHz0nBUyRqCyVXMxljBZG7vQgwj3fjM5xD/39uY=;
 b=KRXtsYjz8g/gflxrOe5YGGQlxEfQQSlX/p7AA6Rt7DK8XAKP/7dDb4BYrqpqmB6vQJ
 KBpol7f2TxDohP7bmJXUFcDmnlj9cba963qA12xsJz3lnoLaa4wMIngFADD1KPfsE2lK
 xdyJ5tGSqNEgUNXOdDAdHcXBZMP/1EUTX/XdCFRC8L8hZesBioQQbEaF5arwBD36oZIE
 r6yZbjwTwO71oHM4TVrp5S/KHvcBsVfXpYYY6fo/c5EAevZTIiZ9JAhzi/AnzK6awvmh
 DTIaSgPhhwMRkxvvGoGHv8KOcIEpSgIW/Fwrnee21Jbc6Z2Ks2mNh6TBqskoJZOXG2zV
 jvtw==
X-Gm-Message-State: AOAM532wEdVgTfM6J0fLPoBLs02+7TfX4OvQhdNz3QwMX1esKgl4+2E0
 C1vzA5iXB7bzI9z3VCjaBhW1V2keg7U=
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr4993743wry.254.1613153964771; 
 Fri, 12 Feb 2021 10:19:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm14571761wrs.45.2021.02.12.10.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:19:24 -0800 (PST)
Subject: Re: [PATCH 05/24] hw/misc/mps2-fpgaio: Make number of LEDs
 configurable by board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a67c14bc-8ae4-d2f0-ca1c-b293bf61659a@amsat.org>
Date: Fri, 12 Feb 2021 19:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73lWDKzdAAPy

On 2/5/21 6:00 PM, Peter Maydell wrote:
> The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
> FPGAIO device is similar on both sets of boards, but the LED0
> register has correspondingly more bits that have an effect.  Add a
> device property for number of LEDs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-fpgaio.h |  5 ++++-
>  hw/misc/mps2-fpgaio.c         | 31 +++++++++++++++++++++++--------
>  2 files changed, 27 insertions(+), 9 deletions(-)

All LEDs are green so we are good for now.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
