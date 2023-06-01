Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp144180ejb;
        Wed, 31 May 2023 20:14:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SNNFQ5L/zjIV4KXgvUpx9a13mYvCrazRFJqs/Sp00XTMO4kJUQRf+Q9jfYtGMyWprimUb
X-Received: by 2002:a05:6214:c8d:b0:625:aa1a:b6d3 with SMTP id r13-20020a0562140c8d00b00625aa1ab6d3mr7123949qvr.53.1685589252346;
        Wed, 31 May 2023 20:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685589252; cv=none;
        d=google.com; s=arc-20160816;
        b=pLcOJi8tcJz8uYz45aZl8KYBs7slCzER5y/8PB+x3ct9odSRtJLwH6l27E8ZV/jmnA
         Zrcv4PlgPbYG0cRk61efOAPr2EZ1A6WtKOch3BtmM7PZX01wGDT2H0/IqhcLVH8LpSf4
         pc2P3+6KIhQPbyCS451SmdyfXNGAnD4MDmJM9Kyn9naLK7cC3cyibw23lQJTHd0hsgUi
         DgRKZz0CA9Ndi8EIqOQAiYIdOFyNtKN+qlOE9slQYIBwo25KGyWnSv2N8zWtTgERdZ9m
         EiMXA47l7JDoSxT+2kFUMTPLZ7MDss4culSzJUBVIPbC15F11teLSPA9M0K3e0AIcFU6
         nZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1kVwc1Qzq4GNqnCYUhxAQDhPsJqMamvHEqwga7wa9hQ=;
        b=TWNScuCL79a03Ty4PYegeRCX5pdt4akvJcYCBIs9vZ6XuCNeHQvnqFgJUMPs+y7DKJ
         xqwpmCyAc3PROrgEqx3ME9Q5hu39ielKpZNyR8atQV2uPgoMsSDN92Z86jbunjr/qtrb
         40lgN5GUMxkt3diHaWaAQtAsQJaom7PtXfAUYnM8k7S9KC1synQPHG9lSFPf8VM82Ef8
         kHBWGbtP21vhLxPvMOwy51BsTJ+TnXkKZ8OClUnEKij7jyBzL9bT5ufpzlEm45FHKoLD
         HENZQVDp6n8dYhagjYpsKaez2WSqtcm3R1LrUEFidZOd9Iaj2hUo78vyZDjRDKcItbNq
         B9Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaOVW8bG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw8-20020a0562140f0800b0056ee98ad954si6089854qvb.315.2023.05.31.20.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 20:14:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaOVW8bG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4YlA-0005Xl-M0; Wed, 31 May 2023 23:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yl9-0005XE-ER
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:13:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yl7-0002Ef-T7
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:13:55 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-565ee3d14c2so3628627b3.2
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 20:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685589232; x=1688181232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1kVwc1Qzq4GNqnCYUhxAQDhPsJqMamvHEqwga7wa9hQ=;
 b=iaOVW8bGn3pI3s0kInLPVvuwIX4xsk8ruXBqBZSeqOEM+5bRSGmGyJ+GqOxzJ7hDFA
 od17UqXkLPhhsQwc8OqCllJ5Umzrv4yzeZVzydR6+CwkUJfCHVgTLNHvw/beX8uCD1G9
 h1dT1JPsxx1l68HuHtcmlcvvT0+zG+7S3xEoImEzMGD/WShF/mvHmNB3mW6U9ON1H9sY
 W44VTx5pTMzALF71Qv+IGiEqj+TRjkdDy7bMJivZChOy4oyW3r5q+1OWZEDbHNZgSUss
 Lwwgq3p2JbT1lwYI/KHl0KeaHy/z7wfH/mD/h26zHsIEEyhcOXzQbW111GD67ITQIEaW
 uU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685589232; x=1688181232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kVwc1Qzq4GNqnCYUhxAQDhPsJqMamvHEqwga7wa9hQ=;
 b=Xd7vsw/3mj4qFRdhjdCNw0uxFcL2i4oT9ENgqYiEEHR0PFtP26OVyiWVnqCrC3P8cZ
 HAzTmF0nMFk9ug90rFt1bnoIhgStllImwhraOnNjV3tQCCVLNpEqDqDlR8W+/Sn8PmQS
 CDrFMUZ8eUjY9pIKxjSyyfR6qrzaiFIYdhFlvOYOwLV6+7JIFBqldCi5abQovzekePbM
 7d40+uLGknD9N1aMAgTUDHSzcZZI/mu1vgv5W02dw5mBV4yppFLw6ixfo+fXQCH4p09u
 EWXqfiQb8Lho1oNWzrfMDtzMcTyJ7LkUMAVLwD4M1OB6tpAAy43zLl15q3d4O42KEb6R
 jpoA==
X-Gm-Message-State: AC+VfDxbP3GzIiHwdvKsXK11bwo22N7hT7xL5AHJO5jqbV4e2ty6e1Oc
 ogwgVqcTAaEnp3v8c1uxzkFgUA==
X-Received: by 2002:a81:4f4a:0:b0:567:aea3:75ba with SMTP id
 d71-20020a814f4a000000b00567aea375bamr8534682ywb.4.1685589232374; 
 Wed, 31 May 2023 20:13:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7?
 ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
 by smtp.gmail.com with ESMTPSA id
 l30-20020a635b5e000000b0053f5ff753e2sm2019553pgm.23.2023.05.31.20.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 20:13:51 -0700 (PDT)
Message-ID: <cf845d37-31c7-6214-b36a-3e2e93490a1e@linaro.org>
Date: Wed, 31 May 2023 20:13:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] hw: Simplify using sysbus_init_irqs() [manual]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230531223341.34827-1-philmd@linaro.org>
 <20230531223341.34827-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531223341.34827-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9o58Gy2ueSzY

On 5/31/23 15:33, Philippe Mathieu-Daudé wrote:
> Audit the sysbus_init_irq() calls and manually convert
> to sysbus_init_irqs() when a loop is involved.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/loongarch_extioi.c | 3 +--
>   hw/intc/omap_intc.c        | 3 +--
>   hw/pci-host/gpex.c         | 2 +-
>   hw/timer/renesas_tmr.c     | 9 +++------
>   4 files changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
