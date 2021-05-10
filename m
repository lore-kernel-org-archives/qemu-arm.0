Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3267702lfg;
        Mon, 10 May 2021 12:22:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYLB3qgmTQx+JqK0y3DaG3f3j2P9HIqg/JXD0wGXG4EfJO70wMqBl3eDIDR/dFnYibBKWA
X-Received: by 2002:a6b:5a16:: with SMTP id o22mr19717873iob.63.1620674535448;
        Mon, 10 May 2021 12:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620674535; cv=none;
        d=google.com; s=arc-20160816;
        b=DKUlVCQ1k8F03A08vgY63BM/zwVV8BoDoAawsGwF6Vr4JfL3/EMUHVNGMu30GHesy0
         ZUnwR0b0wR1zk/cdl5neKX7opL5n8wPweA8Rapazd1Rjzvh9KcZRYX/kEpVGd3aZTup+
         9U15dKp7RHpswgMmQ+0V+F8ACsUe4Bih5N6SjMAqiVVl1/SLtxc2w1DdAHpypHR8cmSb
         saR5a24aOiGHZU7Pvw9O+l+HkQqx+RaeFGCs1FeZ1ttN9UcID3FqVlUS6Z0kB440wj4k
         Okn/mgeCgQ95NOKaeqtVqBc/WrzX4Hy9pm+LveeI8soRj58tIahWMNm9AyH5YgySqD8K
         B3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cvnePiPJbn0S02UYch0XLThOp788tWmOvVF2A0c3EwU=;
        b=b4fvGS+LwAQe60rS50HV90SXlYhZsXQjlnNU7bmD6/feq56vfUt3UGAhj5Vg0bTTCX
         ryIMtqTEcXpSAoQOsZ+IABxHqMX62j+ENq6MS3s5uQZx5V9mZOR0Dhl5wplb0TWGCJMN
         OUN7GkG6794+2PbxPJA5CJgycOhuFK+sTBxwmGAwcZ2gd95H+XHlqcntFhGqpHVfYZkb
         joiN6uqcBAXeSFlbJCG6kDC5atqLZ+O0yuif1YgD0q5q6KBRnpFr5N5I9Z5n+xcaZ/U/
         1W1cKdfl/dWqNZd1bU0QKrkpoBUDRilTC5fdwap3K8NkW9SchIROd4+38PgiRXe1O9XE
         BUMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dxcGgujM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si18016714ilv.97.2021.05.10.12.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dxcGgujM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBTq-0000uu-Qr
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgBMj-0001Uk-BM; Mon, 10 May 2021 15:14:53 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgBMh-0008Jc-SO; Mon, 10 May 2021 15:14:53 -0400
Received: by mail-ed1-x529.google.com with SMTP id c22so20004335edn.7;
 Mon, 10 May 2021 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvnePiPJbn0S02UYch0XLThOp788tWmOvVF2A0c3EwU=;
 b=dxcGgujMln5m+Lio410IzOvPJPY0atZyPjOBbNFLsht09znp1gHiQMpqIm1jrnNYSs
 JvNifHi4kFwmBqsxYiUX69RS6ufG1El32TJScC5zLRqjC8Q3NGqEsAzaCEKCQOoytagb
 MwIUSpZLl5ji+20/PVWIVEtz+TdFgmU0KQapjkMurf6QjbycEpArw96nGSgSB/c3bNEj
 FMg3TyeXQqFYzRku4KKy8xhNqk39slsWAET58g1c1jXa5C57wzg6MEXgUmx9buwaR/SS
 Pp2EgHsgoTS5AMIqroCBtk+2sFZIiMHn1DmpfbxPdb+qA8Upb85PBhr2eGMviPRtfAes
 Dlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cvnePiPJbn0S02UYch0XLThOp788tWmOvVF2A0c3EwU=;
 b=MAdA8PZB7csOEuYS/sCvR6UqvzB9gjK2FvNk9yX8wQipQwxCXkzobHheRUhXldqwXN
 VjVSpuIx5yVJV4FNizJnPG/x9B9+MEu9B+7d+g2HfkUzAG82RMcF0RZNhp9MLBHC5FKo
 wbtCNr4Uesv5pxGHq4uZm/b0rav+veNAsHp4onxrfGSYgu9PtsD+/zfywRSh5xWx1ZaO
 QD1RtjwkzMT5G5ZxNoA6jB81AM3V9YiyZzBgO/SUITaR2XMzDWVByy2CHPBL6hOtOaiL
 tvfQK9PNNPSzAaNmWM7J8rT0cx74mdQ4IbXlOrwKesdvuP/d2xTDll/B6YKdIVDODYI3
 43GA==
X-Gm-Message-State: AOAM5326g80z0tKELL6z+4jGonWqs92swm1h8zP3GT4wMcLiLODazYyI
 agAzGX8HtchGooeAgDJw518=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr30918932edv.44.1620674090198; 
 Mon, 10 May 2021 12:14:50 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b17sm11932973edr.80.2021.05.10.12.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 12:14:49 -0700 (PDT)
Subject: Re: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <71d9367e-efbf-5051-68ac-df1dc7f53531@amsat.org>
Date: Mon, 10 May 2021 21:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I+UocfNKBF1D

Hi Peter,

On 5/10/21 9:08 PM, Peter Maydell wrote:
> This patchset fixes some bugs in how we were modelling the
> TCMs and the SRAM in the SSE-300 which were preventing
> Arm TF-M from booting on our AN547 model; there are also
> some fixes to things I noticed while I was in the code.
> 
> The specific bugs preventing boot were:
>  * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
>    area was too small
>  * we were putting the SRAMs at the wrong address (0x2100_0000
>    for SSE-300, not 0x2000_0000 as for SSE-200)

How can we test it?

> The other stuff I've fixed is:
>  * we were modelling the SRAM in the AN524 both in the SSE
>    and in the board model (harmlessly, as the board-model
>    memory was just always shadowed in the memory map and
>    unreachable)
>  * we were modelling the TCMs in the AN547 board model,
>    which is conceptually wrong because in hardware they're
>    part of the SSE-300. No guest-visible change, but it will
>    avoid problems if/when we add another SSE-300 board model
> 
> thanks
> -- PMM
> 
> Peter Maydell (6):
>   hw/arm/mps2-tz: Don't duplicate modelling of SRAM in AN524
>   hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
>   hw/arm/armsse.c: Correct modelling of SSE-300 internal SRAMs
>   hw/arm/armsse: Convert armsse_realize() to use ERRP_GUARD
>   hw/arm/mps2-tz: Allow board to specify a boot RAM size
>   hw/arm: Model TCMs in the SSE-300, not the AN547
> 
>  include/hw/arm/armsse.h |  2 ++
>  hw/arm/armsse.c         | 35 +++++++++++++++++++++++++++++------
>  hw/arm/mps2-tz.c        | 39 ++++++++++++++++++++-------------------
>  3 files changed, 51 insertions(+), 25 deletions(-)
> 

