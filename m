Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp623283lfy;
        Fri, 14 Aug 2020 10:13:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm/0sWcX+peldrS/MJs8YlrdfYywC/30HgU/z6DCCZsmODl57NwUAKrQLeA8rFuunGBkHs
X-Received: by 2002:a25:5f0f:: with SMTP id t15mr5172198ybb.253.1597425194368;
        Fri, 14 Aug 2020 10:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597425194; cv=none;
        d=google.com; s=arc-20160816;
        b=kA+ohQplsTVf277eBJSeuLJ/rHGf81Pqq3P0ucgTm8Vh+3J9JZrZMaFXeAIPUCXhhH
         dGpjU/DuZCa5+mc8+p4cZPuv7GWKkGVongfS7qOKKcky4+71OhQzO2XJGXCFxFZzNiIB
         S7WelJX518vGcXaxjXlyqsZRdt3qLaOOr/VbvbF+hi9oR7x7WFTMpvXFVelqEli8jgNE
         hMtDoNVC/TsIytaeYK0o2wNAP733BTrSOVFMq86ArOJAOKAqk/zLRE/N6aaFaB/bX3Iu
         6V/RUE9E/BNtTDjA/95sJpOkcpFEzSqNtPcC2U/mVqUBJfqE2P+x/ZdUFvO4gj0erG4N
         BU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZFuA5der7b54aAokYnIBx1jHUrMnEJxZB+HuaWuvMko=;
        b=mAdrJj6mwKBLPz+YQTd1OeFHYGMmRjX0zDORPrud3XKK1U9NJgXxs6cNITTn9IHDA9
         D5M6U1LqrvkoMW2inM3m0NNM/9ye2BVm3wNUY/AS4HwGEZUNe7OR2dgr7rpFWPMrTBw6
         4PO0faMEE0NPC4s5SDkgZNAfxJ/Cf6+2AArXvHQggvxT3Ra0H45jF8TS9CNenUb43EtI
         6AwkonMrGOZQQu0u23I3aV53tE5ou2V4V7fHW71ygR4itrtf/h8/SbJGBy0MuWwvxiBj
         FrYXk6v0lpRCixhSQD9gcBVEd2z99wD1luz9pQmGbKWIHd6tNg8fzswpmiBDtZzsB/KC
         W8qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lGlWvjM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si9006890ybp.144.2020.08.14.10.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 10:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lGlWvjM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6dGT-00024q-Nv
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 13:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6dGM-00023F-B2
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 13:13:06 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6dGK-0006O5-QE
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 13:13:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id f10so4449130plj.8
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZFuA5der7b54aAokYnIBx1jHUrMnEJxZB+HuaWuvMko=;
 b=lGlWvjM+T9RBppmxl5xAfMbJAletGk9yLD/N8Ur05Ya3J8cn34nqJVZ6h+rin5rLBl
 LZwr+uQrcOuMiIFuBlv2RyRo433Kqn0oNrnE2keXtHAgpTpSxc0wwx0FuaPFjKeM8MHa
 H+F70zSVKTA6d3fBBSlJrTEB8Zf4HwTkPwJDtU+gM/mmOcVJpTiPASg09wD39brud5bk
 WKFoJn2TOmL5qvH2F7dhc4hE0Ls56+SoGC/h316itgKTt1YLZAyLxyW64L+eLeN/P7Cc
 g9R8MIcL6cFKIbYt5mpQWNK3uN16TA93Fxh1feHAsglZ7KDFKzq2nSkqxWoND7z/1sJo
 ytwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZFuA5der7b54aAokYnIBx1jHUrMnEJxZB+HuaWuvMko=;
 b=Vhg7w/z8ck+3qTFiRytyP/yEMzSVF8RoQtHGvRymEPX0rxQYf9C4ob1l5CuR+cdKd4
 y5c+KHyrTLvD1O7oOAVNhD6JYiBtgZgAje+rMyGyYTq2FtryCgO2U0yt450nqSzgM3y8
 XjtkaUspMa0oex8u/CeRXjqoibzuY9gSHWrhiFB3VC6rXFKMEAM2T0yQGq8IyraZp08E
 MEKH3+XQYU+olUD/nYWJoIZKmk72Xuhx2tTf/bOsGkQWGdJwzdxVyXTWtd5IWSAfXk2Q
 Vo1lHYEFfvPW2critJr73uMoPFjl3Y/Prcu0NS1rg4X20TO81vsnQzdstNfAiwpk1xmr
 GOjA==
X-Gm-Message-State: AOAM5304vgQLCp9UDoLW8I97F2WCVHcrPp7jQP/Ls+1SoMhaZom6I3d5
 jwRk5GaPmfWQl/3Q1eQnzAY2VKXr5JSvCg==
X-Received: by 2002:a17:902:7b82:: with SMTP id
 w2mr2728335pll.39.1597425182949; 
 Fri, 14 Aug 2020 10:13:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e4sm10062198pfd.204.2020.08.14.10.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:13:01 -0700 (PDT)
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac: Use AddressSpace for DMA
 transfers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200814122907.27732-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ed25d03-c534-a2ae-07da-87c1ac5212d2@linaro.org>
Date: Fri, 14 Aug 2020 10:12:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814122907.27732-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ldh7+2rqQinw

On 8/14/20 5:29 AM, Philippe Mathieu-Daudé wrote:
> Allow the device to execute the DMA transfers in a different
> AddressSpace.
> 
> The H3 SoC keeps using the system_memory address space,
> but via the proper dma_memory_access() API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Tested with:
>   AVOCADO_ALLOW_LARGE_STORAGE=1 avocado run -t machine:orangepi-pc tests/acceptance/
> ---
>  include/hw/net/allwinner-sun8i-emac.h |  6 ++++
>  hw/arm/allwinner-h3.c                 |  2 ++
>  hw/net/allwinner-sun8i-emac.c         | 46 +++++++++++++++++----------
>  3 files changed, 38 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

