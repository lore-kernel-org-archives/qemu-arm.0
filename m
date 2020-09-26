Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2369704lfq;
        Sat, 26 Sep 2020 13:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV1IlikthUAQOHV/Agsy4p8jO13fjyeDkbyv/gQx+9khIDXQ0xaTToHlLG897IIlHPpXnG
X-Received: by 2002:a25:c747:: with SMTP id w68mr7341085ybe.349.1601152610226;
        Sat, 26 Sep 2020 13:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601152610; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZV2m0i2E0y+bgw2txznsFBWGKbfYdAfCme0Z+9PC9NxoVMVgiAkILpDhrumwPpS4p
         H7z2E/bPkKarAJ47hDt12t0OyVVKe3i40oWwR2tBQlomcqwedeutxi1Blsm+zYSXKfyI
         SBZ1Qs9LDgDK5cIFZjFzhWhXrbWaT6Go3Gcg0ZGi5Sgrmk/Jbq6JLW3QxafulA6J46yP
         3lpHK4DO/jG48UVAM6P/fxqjEHFN+VqrMF0P7UFh93q4LGjrOaTzC8UvEwnJyZa8jHxO
         B+tFUz/Qh+7DGl22l/im6xTIwrlA5Y2PZc3u9MGdh3MV6pkDFsNdZpusnHsXb70q3s3q
         CEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BQEM8GyrRfT9S+MUOhVXhzGx7HhUGi/JUVZeZqV6V6g=;
        b=MsQ6xCONJ0uZTvkw4ci83SSrgXTnmFnO/GTeYuPeIjEzJQu/LUUFDlzxzGrhGSjGrK
         lYy2QM2IilKcj9qideGDtID5J6h6T2fUvvWH8lrigPjMFYp7H3DCNd8aefiz2z8s/Mv5
         ZwxVEeH+1COzLUdiQq7PG3ViD4meG/GX5E/ZIqXP955t+AzD/jXn6jHSiGB5NZyrhTJh
         WqddT4RzF7PfuhM5hwuPOk0bL5SJ1G0ONxTGHXaDkZARvo5dgKbspu6FJ8ViG1T+BOIV
         tuDQ6q4q7rXyX2P5rB3BgjR3OX3lALAiuhxW/fm+ySh0kz0PBZjNpWeLqoBbLcUDZbWx
         SfnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PRCH59Jk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p202si6308902ybc.330.2020.09.26.13.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 13:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PRCH59Jk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMGw5-00006j-LD
	for alex.bennee@linaro.org; Sat, 26 Sep 2020 16:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMGvn-00005L-CM; Sat, 26 Sep 2020 16:36:31 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMGvi-0002Lm-BT; Sat, 26 Sep 2020 16:36:31 -0400
Received: by mail-wm1-x344.google.com with SMTP id e11so1774120wme.0;
 Sat, 26 Sep 2020 13:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BQEM8GyrRfT9S+MUOhVXhzGx7HhUGi/JUVZeZqV6V6g=;
 b=PRCH59JkuL0oscz4LFmFU2pUsqVGCgcHdk8hg5g9BfPg2fNsmxQEtuhOWcFZ0O7wkU
 YM9ix4PDdiyhlLfXBLW4dp142ICoCelciIoruOl7XN9HlgCPrTcAD7L2jjHyVnGcvkMj
 r5fgDeeQD/1dyL4FKIwE2xVEIhNH5gGgl7c2JQTXOixXOjxi0oL8PwLT13D2j0QQnNde
 +PXIkWsq9TDS0vtYPZXl1hmqc9PEtZxvUPGpMzMuYq2v184cACTqgu4byZ5pbjxD4qT8
 it/uyeGR1/FsU/nbab9ShM50tQi3FN2msbqbJNyIZOnamY/BThU88bIEnHxgLFB9kauV
 gu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BQEM8GyrRfT9S+MUOhVXhzGx7HhUGi/JUVZeZqV6V6g=;
 b=f1+2bWur0qq/A1Y16ja/fcHPAD8RqDb8JF6RQlMWNpPtuCKyjirljyGZXyiqHtGB8m
 0IRVrGubNIez4Pbwx5vCiA/vn6tfljnBdRGTXlUJgrYFURbSh0C25uredDn+L9CVpbOd
 MYa0eZqjxr+eVyrGkgPC6rM7TkNdkbrS1gApPO0GQ8RdDsgwCRGaf2kFhlr4tbqP+j8U
 /t/e521skGhMm8CSwYsdAllz3rC+ZGnYOoUH+zYk+AqGXxCecpj+Zi2cZNJi32E+5p7+
 W+yryNBJ4mhVxG2zKClPNEsDl4cHLFMVQNz/5ohZ2bcOcACEjOidccJl87FlUkPmKPrb
 S3aw==
X-Gm-Message-State: AOAM533qu4aTwu0PiWy+DkF6z+CopajcIj0KLnbEBbXxlqNNHSjf/piZ
 HzLzrJGQTqYiO0qF6T9yHztv/nhpEo0=
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr3844705wmi.19.1601152584509; 
 Sat, 26 Sep 2020 13:36:24 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id d2sm7662571wro.34.2020.09.26.13.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 13:36:23 -0700 (PDT)
Subject: Re: [PATCH 01/14] hw/core/clock: provide the VMSTATE_ARRAY_CLOCK macro
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20200925101731.2159827-1-luc@lmichel.fr>
 <20200925101731.2159827-2-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5f6a9c59-5d17-2ef6-563d-d180270bbc3b@amsat.org>
Date: Sat, 26 Sep 2020 22:36:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925101731.2159827-2-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.213,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: suG7YWuxua8+

On 9/25/20 12:17 PM, Luc Michel wrote:
> Signed-off-by: Luc Michel <luc@lmichel.fr>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index d357594df9..c93e6113cd 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -79,10 +79,15 @@ struct Clock {
>  extern const VMStateDescription vmstate_clock;
>  #define VMSTATE_CLOCK(field, state) \
>      VMSTATE_CLOCK_V(field, state, 0)
>  #define VMSTATE_CLOCK_V(field, state, version) \
>      VMSTATE_STRUCT_POINTER_V(field, state, version, vmstate_clock, Clock)
> +#define VMSTATE_ARRAY_CLOCK(field, state, num) \
> +    VMSTATE_ARRAY_CLOCK_V(field, state, num, 0)
> +#define VMSTATE_ARRAY_CLOCK_V(field, state, num, version)          \
> +    VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(field, state, num, version, \
> +                                       vmstate_clock, Clock)
>  
>  /**
>   * clock_setup_canonical_path:
>   * @clk: clock
>   *
> 
