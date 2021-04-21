Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp416545lfb;
        Wed, 21 Apr 2021 06:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSL4ZDJkU8Wl/qbL7Y+FHQXutncQOfSB3A2KGfiO2pqTm+bfKvzsrJU7VS+8CILWQGN1fa
X-Received: by 2002:a05:6512:203:: with SMTP id a3mr19742224lfo.111.1619010217573;
        Wed, 21 Apr 2021 06:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619010217; cv=none;
        d=google.com; s=arc-20160816;
        b=HG87pbs+9zT3BbekITgLjlPUzLdvi11BoMkH31T8oLoOfZ2MTXRgmQbvVBeWy7jJSR
         Qo2AabmBNaY8SmPBK/SE1ShmQABfRGU/1XdN5dGlYLNo9VIZmYhGUU9VrnwkHMR2Qq2n
         AM+04z0YUB7Hakoz5U5yx0yZh4PRtNzhWFYQQNmaLAVKrZ4Za+GbojOl+i9O+TEQSpXV
         TsFl36/qXY70H0iUw7lINZ+eB/BiuE0wnlT2xqYbyfURGHDpBlJyozKw2s2XpdZm2xwd
         uIABXlkBQg6j09YiqxUE4aiWDcDR6IvLWR/+5cnnsGlxJk7AW3pLRQlskY9QQye9L32K
         bQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Db5rYtKu6pu05hBUlJnA/FTlz8NWsWOpTXGIw2eqMgE=;
        b=qh+foVGzbDPzCHZZv5wv5SZn+fmkse8ls9G95AjqNMV/7fVPkYn4cLK7K3bKv0Czbo
         ol05cdaX5oF0zAv+8q3RCvNUeBf6eoj4oa6UfETXdyM8NANLT+CV7n1uB5AV7Dgab5zg
         yreCvYrdHYYvFy9kAOsEyhwkw3fa6+a1k2rHNqsML73VQDjLFXFg7nYMTnyxNR5ez5pU
         gqPqBBem6NQO2YVvWH0SIA/ysGs8Y1qxIlnea8+Ey1yt/w8D+PyzIHCp/2tJB1leuTZB
         9+6n8+3p8kWdOuUkEkY7jfhknATpCm4t9d+OcyyyhyXjse0+sdI8cSdpOgyIByEoWtgA
         UVcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ePGsKjww;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si2220897lfh.169.2021.04.21.06.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 06:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ePGsKjww;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZCW0-0005ck-FR
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 09:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZCV9-0004hX-U8; Wed, 21 Apr 2021 09:02:43 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZCV8-000577-7W; Wed, 21 Apr 2021 09:02:43 -0400
Received: by mail-ej1-x629.google.com with SMTP id mh2so41837312ejb.8;
 Wed, 21 Apr 2021 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Db5rYtKu6pu05hBUlJnA/FTlz8NWsWOpTXGIw2eqMgE=;
 b=ePGsKjwwBtXVggEBzd5AHWiAihy5CCa14MiVNSUoWmV4HyrvtXR7cXEjzTgi4P3fAQ
 Vp0rC6zI3uooQP1zfzBsMp+XgmdYN+GlAwxTw+IrYW42frVKpQatdny9eV/aoPRF30QL
 +Pc79ozBmC7Rtzb/QNAj/M6Z6vyT08ss35pL8q1Ca8NZVeQgqncmZxPowLWk2SdtFbRe
 GpuFYye4dGqdivae5L9WJiNkeZBlmQGGwrNreBtPYylzC68QobM9xkiGhPpDHyWXXTtU
 uP8kAiShBvIjRcMO88LZA0vIthC83JXVLGoI/SIbnG6Mq71rg/I/JtYiqrI3w6ZopMBS
 krIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Db5rYtKu6pu05hBUlJnA/FTlz8NWsWOpTXGIw2eqMgE=;
 b=j+ZCNMmJfQYgHx+DngZIUB0pO+1lc9VOYG+d2Lqpb668ZuLOwhbkVs/QJzkeqmsD0Y
 qgf2O2MLHUZnqcSUUW5mzXlNVmt6oFxjyOHlu5bFfa5cMf8sKMuBQKbIgMunzAo7xy/i
 tiAPtkv3LRYKq8AJKR94irbji6/hRi2eTAgW3DozVZXw+EbY5u5fxA4Vm1nitw5iKXvu
 0pK3ll1uDwZ6/Cbmem30NqdtL8GYGj1dUGlvuh/4EnJ9m4vx2pHDftHWTh4ZpKHCdApA
 Lj+JCKn/+zvbweeHFEvya3vY8uqa3PrdXBFWTMrj2pQvCAWWsEqf6KfQo6v0mvyDDFtJ
 gxyg==
X-Gm-Message-State: AOAM5310RY1wecQR93+RHxDWu7O0zyscN4mE9j7uUeN6VDQoElYLIj84
 jbrhnXjPHgj2xSLF7VJHoIo=
X-Received: by 2002:a17:906:b28c:: with SMTP id
 q12mr33220820ejz.284.1619010158009; 
 Wed, 21 Apr 2021 06:02:38 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 9sm2376915ejv.73.2021.04.21.06.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 06:02:37 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] hw/arm/aspeed: Do not directly map ram container
 onto main address bus
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-2-f4bug@amsat.org> <20210420182819.GD4440@xz-x1>
 <1c21cbf3-c80b-4e65-485e-334ae84cefe0@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c91b3f57-cc2c-7575-3447-715e329a4a42@amsat.org>
Date: Wed, 21 Apr 2021 15:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1c21cbf3-c80b-4e65-485e-334ae84cefe0@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YMDnklnrvBGf

On 4/21/21 7:53 AM, Cédric Le Goater wrote:
> On 4/20/21 8:28 PM, Peter Xu wrote:
>> On Sat, Apr 17, 2021 at 12:30:18PM +0200, Philippe Mathieu-Daudé wrote:
>>> The RAM container is exposed as an AddressSpace.
>>
>> I didn't see where did ram_container got exposed as an address space.

I guess I used the wrong base to git-publish and skipped the first patch =)

>> I see it's added as one subregion of get_system_memory(), which looks okay? 
> my version of this patch took a simpler approach. See below.
> 
> Thanks,
> 
> C.
> 
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -327,7 +327,7 @@ static void aspeed_machine_init(MachineState *machine)
>      object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
>                              &error_abort);
>      object_property_set_link(OBJECT(&bmc->soc), "dram",
> -                             OBJECT(&bmc->ram_container), &error_abort);
> +                             OBJECT(machine->ram), &error_abort);

This will work as long as no board maps the main memory elsewhere than
0x0. Using the alias make it more robust (and also is good API example
for the usual "use API via copy/pasting" style when adding new board)
IMHO.

>      if (machine->kernel_filename) {
>          /*
>           * When booting with a -kernel command line there is no u-boot
> 
> 
