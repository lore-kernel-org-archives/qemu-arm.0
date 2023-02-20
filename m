Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2528915ejb;
        Mon, 20 Feb 2023 10:51:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+yzrOQrCjGzv867oU9NWp6X3xstg+Y/XsAUWXW8z0SD/bUipvC8bDCoDwFTvlBCpFVQJnF
X-Received: by 2002:a05:622a:1483:b0:3b8:6b4c:aba8 with SMTP id t3-20020a05622a148300b003b86b4caba8mr4257154qtx.39.1676919083539;
        Mon, 20 Feb 2023 10:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676919083; cv=none;
        d=google.com; s=arc-20160816;
        b=IgYkazbV15BM4xYHZlf1hSFea04/Pd5B9i+XIoqc/ApxcrGX4ZHCiF7KSUeTsf/Zyt
         Quc84y9IbgHFxBF3Qu8BbYwtbrCAIO6JVQPOSdBMnY51tXb0xcPQ9xImi6jMEAcR4Dwb
         KjDfWKD01/9EorTp25jtSU5CGdX+J3ZE/x4GG4B3dZsvo8IJhNzuvMho0GDmIK5PsCGx
         JxG7Gpp3RfnEOwOTJA+P48YVpYovd6c5Xb37lTFu3iSovSjg8NguA8pa/16MV8PpmaJe
         FJNEUiy9XfcdFv4aZEpmrIygx5NmFW8Pbvx3Q4/l8HIXtw+n8wxTY5I8C5X3xNOxYbVS
         Phew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9ngagxltp/pj0L5xJ7citQRxeVgJMhPUIstQCvSUy3Q=;
        b=QprthG8Jy+R7Jh7ues0s0znS0d0/KGSwuf1qxH0XmN/tJQI7v1BrGKuy7Zy+BHvn69
         q6GvU4PSpA4AzInbT7NSQdiYrDlmaHSx6snCGcRocJKILsRwDlA8bHm5amsSim02rhMy
         bnudXiExkbszY5twy6VE/aOPatbooAwN5EafoLSISOEIpEX4WmrXn9BziIfNN9kfqxcU
         4dsA5KR4k1xafPNxwYmZp10PQRBJksuIXgcb/GJLIPDut/Ue/I94bBdRf44bvoSutiCR
         eNU4KAsMX0MHyTxp0ips2cjSLPLrDGZvEIWz9y0D9r5wJNYjHzQn4c3wlAUR5uI1JWqS
         SmAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPWW1BOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020ac85852000000b003a81d7834cbsi10240440qth.430.2023.02.20.10.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 10:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPWW1BOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUBFw-0008JX-7Z; Mon, 20 Feb 2023 13:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBFr-0008Il-7W
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:51:15 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBFp-0006JN-NP
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:51:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2207802pjj.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 10:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ngagxltp/pj0L5xJ7citQRxeVgJMhPUIstQCvSUy3Q=;
 b=NPWW1BOy08zzMgt1ss9rlbJPmDzu66Lw03gIAwxUQh2/c3X8AKvTbAcbsxNjMMnzBy
 H638ZpCEyEB6qOSYE3gqKL3sE8h836yu4hqeiX/K/TqpK6j0UQMqVUI967MLy7cEmdes
 nQ1e5GThVb/lWYv7WWO5tJ6PFnC1//RINk9Ok1mE7MQK9eO17HXI8aSRk46EvF0FSykp
 6+4ihNDOPo2S2jFVTb665n+CETPAeU8ylhIK7n0sGg2N+FozzcewcRULuVBcVeZbUiSR
 mQo23DzsmJ8ozq4K0keL0scy09zYwrzzKvoSbOBUK8bmpCIkIAdRyAvYIiyAotkuQNck
 BvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ngagxltp/pj0L5xJ7citQRxeVgJMhPUIstQCvSUy3Q=;
 b=AKKRq1CAZJZtnOyGhZemB8bWWi7vYNgkHtCFdm09bjzDQbi3ehCiMGTXKSKP1guFpK
 ROdk6ln735vwY6N8fI0+M1C1kTY1/mlfne0qcd//9SvUYjc4NjZmNXzFWfinRdnakKJa
 uM4hQG/sv9CYVxaC4F1VDO7vjSzFPnE20Kak5YPx1LRpieUdNAOhot7Oq0s/wHDtCerC
 Kzd0Ui/iq7pdsUdhg84MzkxDH7QNh0e3JxAYBy7EqKtBItefHxYtQd96cd7cVK3gWlSF
 aF2vTbUsNGwm8zCUK10IAYjOnygIEgil9BS4w1tGAQmPnyk/Zb+H5ElHqN/rGvstZASp
 GE+w==
X-Gm-Message-State: AO0yUKVM3MMUiCeGE4wp8xSdITLuSSfsSmR3X2DWhV3tO6aTRBi7n+jg
 bqYX1QSIpGJOhve2cb8mbneGjA==
X-Received: by 2002:a17:903:28cb:b0:19a:a43c:41a3 with SMTP id
 kv11-20020a17090328cb00b0019aa43c41a3mr3768256plb.42.1676919072201; 
 Mon, 20 Feb 2023 10:51:12 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s2-20020a170902a50200b0019926c77577sm8273010plq.90.2023.02.20.10.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:51:11 -0800 (PST)
Message-ID: <300c815f-fc69-4aac-c1b2-81526419623d@linaro.org>
Date: Mon, 20 Feb 2023 08:51:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] hw/char/pl011: Open-code pl011_luminary_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: K1ipfZ/CjTTg

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> pl011_luminary_create() is only used for the Stellaris board,
> open-code it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/stellaris.c      | 11 ++++++++---
>   include/hw/char/pl011.h | 17 -----------------
>   2 files changed, 8 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
