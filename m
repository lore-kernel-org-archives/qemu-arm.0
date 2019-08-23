Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp845593wrs;
        Fri, 23 Aug 2019 10:24:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfZVVSajxEaHYZ1KDFjIAToNxVcJA/0wQHYEOHD5KuUlur4XnH8ReKB9DV/XeJZbTnilhG
X-Received: by 2002:a17:906:bceb:: with SMTP id op11mr5449603ejb.2.1566581089576;
        Fri, 23 Aug 2019 10:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581089; cv=none;
        d=google.com; s=arc-20160816;
        b=YgALfwvVAZyxBbtcMmnd+l9TwlWkEhumwbW3Tcr1zifnP3JKctXVEy+RnQ1PNTqpiz
         9r9tfPTb6V0tVevusLMRoXdH8FFNWC7t6mJofFPtSLsPdnG/k6FZTebOQEQ5sGzY0Jha
         YnXEQDIjPRGsDY4AKBw0pTDGXDB212jav2QU67w9yOvSK92G0tDtj36NGQy3jXvenYOW
         KjHWDmN/8/9Ve3GbhBb+0erITYthE7bXZ/15ldSb8tnWoaKcxv6nNn2YTZcs22ccJWHb
         6JqKUZYOF22Olbs09iB3iz+xzY2tEAOCFA8mKxXyBAEDhQa4g4+PUL4pSMqhsADx3LJy
         w1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=fzamstLzFBKjPZ/kxBEFyS0Fy3UuxOPDhES2K0udpxI=;
        b=Ukd8iCagkx+moIF6f+kg4w6SWuajoeUnCP1U6XUc7rRESK2TKkDINeCOtao6dxGg/7
         RDCDk01RWEAsi5k688wkq/GyM8xCvbeIivkik7TWDUPqxOVlpdeF6FKlunRG/+huFJb0
         kaAQizOggmD8ezf1vpqU4ptBtPZJ6149JsVK5qLApWfpPLnFKSg8YdUV7EliGGhX+lqi
         UIhCsIs150LcoyV8DYPmF4dgfIhOUj5zbWv1aVF6pV6hqtwvwdIWwlL2Vf2KT8HT3Daf
         qiDeQhSIHf/H2NCT8b5Y2sPM5RVQm/QnD9gjm5qrHLnqJkwRtA85e21m3zXEay7kD1o9
         cUig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q5b1Ka99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k27si2265257edb.292.2019.08.23.10.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q5b1Ka99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DIu-0000p2-Mo
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DIm-0000op-Vk
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DIm-0003Qa-0T
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:24:40 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35163)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1DIl-0003QH-Pl
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:24:39 -0400
Received: by mail-pl1-x642.google.com with SMTP id gn20so5924505plb.2
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fzamstLzFBKjPZ/kxBEFyS0Fy3UuxOPDhES2K0udpxI=;
 b=Q5b1Ka99T/WCLwgQvejVXOlyQYVKF465/VQYq23A6LcSxyFmAvC7GaGLqTMbxFUy1C
 +1VW84lLnCRsLer8PQXIHPmnBLfFKzz5mEkvqd/wrqyGvXU2Pjzm3hxsrbxPaMPDUl2o
 mLYtC1FNTik5oZ8LrU6WXDJz2yToxDy3CdB/2QllmUdvbF45+Y0hEJAeUd5uDoUiEKFY
 37LF8VmXsNYjeagf9U38etyRQFy+gAIq1LkxW/HyQSoy879RyXspD0swHcu0o/Y4y6rY
 mVgBlrpvAMaACliz3TJSERiFz68xfbEZItyN6TrH9NsD04ZpCGUcKJ7MKtdlBdG7AhTW
 5+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzamstLzFBKjPZ/kxBEFyS0Fy3UuxOPDhES2K0udpxI=;
 b=iJSFZHDfEoUHWyGwFDySplrLpMzt61gDRyqlPPPr/OWLBL/hbQ9xnqm8kWwn2OSnCq
 2xjLvNX041erEAJ7pitExlJuOPmoQmwonoSJeZdCiLDHhrivOYefcbmVqePmJlFBKHVX
 7sjEiSdPv/79NRijLIc+Zlf+o+wyZETqnAqfxnWRQpWW7VbbT4eEalN/gFoJcBuRlw6p
 SranjUATI59tgutJYBEGo/lYnM6b5M2hw7LFps/y2YvtYQnQbtJCWNt9mH4ZmeCBTo90
 xIATB+6g7xlf80kLYUXdKOmAojEBhZz9Nt5RjwYzsBPx9B+h6qi54mmAZedszKGEyb9P
 /Rrw==
X-Gm-Message-State: APjAAAXkdPw4qCNcIZ4Qet8j4CiCyy0+3zKA2Tu/xfE5ffRSXaEZXJMA
 INTOQRk3OlvRt0cNAUfRUvqYHg==
X-Received: by 2002:a17:902:bb94:: with SMTP id
 m20mr5937248pls.336.1566581078461; 
 Fri, 23 Aug 2019 10:24:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s3sm4819284pgq.17.2019.08.23.10.24.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:24:37 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5a686b01-c7e1-6839-40a7-be2c9d818a6d@linaro.org>
Date: Fri, 23 Aug 2019 10:24:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143249.8096-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/6] hw/arm: Use
 sysbus_init_child_obj for correct reference counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8yaeMECxxTzQ

On 8/23/19 7:32 AM, Philippe Mathieu-Daudé wrote:
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index f69358a5ba..2781d8bd41 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -131,8 +131,8 @@ exynos4_boards_init_common(MachineState *machine,
>      exynos4_boards_init_ram(s, get_system_memory(),
>                              exynos4_board_ram_size[board_type]);
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
> -    qdev_set_parent_bus(DEVICE(&s->soc), sysbus_get_default());
> +    sysbus_init_child_obj(OBJECT(machine), "soc",
> +                          &s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
>                               &error_fatal);

Thomas' comments re the commit message notwithstanding,
the patch itself is correct.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

