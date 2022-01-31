Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2077575lfk;
        Mon, 31 Jan 2022 00:21:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFjw+wWr/GJIBqFWnuho6SlgVg5o+RGZz/hWqFgbINSAguQf9xk+tvAHLncuYxwnVfsY6O
X-Received: by 2002:a05:6214:23c8:: with SMTP id hr8mr16620554qvb.91.1643617267634;
        Mon, 31 Jan 2022 00:21:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643617267; cv=none;
        d=google.com; s=arc-20160816;
        b=cyNTBtbKjUG59YHdpj1fSH5OoVygZQ+AUIvR88qLKjAgi0QIlkQOLuXi1ozq+4jNTX
         CdUjf0vHiOWGQOkbaLBsU8rBmxODZG0ELNjuhZXInDXcT/NhavKL+8wnda6BI+tedx8b
         l6vOQ/Sm7Lk71Mzi52gO/JCz+LdrbzFLywk3FhpVv4UmhLGAeo6e+8HugCroupdIFo7i
         j9HI0W2HyLvrUOsjWvrzJAswlYhh5XO1zHkUqlmSAo8xRKcNR5FnvrbCP4ysdImtBIXZ
         3E0rEoLWOeUP1COPf/T3z1FCLzvBDWXYrk0TchHhu0oNfO8zm4INNIKALXRSEFtH9UeS
         68tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hzdegvweuSj8obSW9UzeqPv2qiGpjMXm+KU1JMRAaAk=;
        b=XHDuPCQMqXWgjD8qtXsv44n4wVng/lBLX9W29NvhkUQFWP9blhrOUUHyFzqaEW4X6L
         uuWiUb7RkxJMB84GbDPSc8lIgH97pioUPRKTl6YHfqqKK9Oflfur58l7fmrIzNrgNU32
         PwaWx6edkxhgF1CS4xqbcWlnDlSjNtxMoVydnhRoVPZeiBaS2Cj7JYMrdMRtPiEWSnzL
         sVhLKOIRm9ZOJGYzCGNqG6l5yhoqppsIHsol8428JTplbxBCyzxu1ed1eu3q13JIEK6R
         zAB/BmEQxWjrQandvSYxRuUOQDHwfDW98e/aOM4/USOSrJW6vQUOepCgTWnOOKifAaUy
         tJXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ixbYJ6ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx13si5249173qvb.169.2022.01.31.00.21.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 00:21:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ixbYJ6ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nERvv-0004mS-2Z
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 03:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERjp-0005RG-1z
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 03:08:37 -0500
Received: from [2607:f8b0:4864:20::102d] (port=44690
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERjl-00045q-8N
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 03:08:34 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nn16-20020a17090b38d000b001b56b2bce31so12959030pjb.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jan 2022 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hzdegvweuSj8obSW9UzeqPv2qiGpjMXm+KU1JMRAaAk=;
 b=ixbYJ6ugNmG78rdBhvpH3YH/WKoXWNhK8bHeup6Nn44yPatfMaH/r9jGSfkZWhrJAk
 KYsTeAhwt96AmrYH1lebL0y7kv0pFLCOH45sPk/IEpJHAw53kdexeowM96ucRKDWtIaT
 BBz1DXSS/2z48DFNPNjvjXBUxg0Y5dzBgvH91xOZtnkzi8HZpfqHx6NQd4Gi92vJiYG0
 XwDVPxVwLjJfiXo6jAG0J7JiU8SbUIXQAwiu953EBP5XWiq6uCwYlFD74aKau/4/eZ4e
 kCX01xNMmeLSJlORcUgMziA4ecQWjTLxYIvs9fR0D9CXb3NgTd0HQEDcnX3wPY7DJ4eW
 YYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hzdegvweuSj8obSW9UzeqPv2qiGpjMXm+KU1JMRAaAk=;
 b=eTtMAXx2v5YF5bEM+uYBL1kZSeQQQRzGc43sJJrvVKG1gHZN9vBjGXOKIHYxi5iJrM
 fv/uvEbXNX6DECanTfF2hFPiwG6dqHh24bMnGnJKEhZz887WU1AW698DWy5sPd9108RT
 0yZzEj/3vD1zcUNNrVaTKdfkBQYBv6jbbsu7FJl5YGEpWfZmOTfni11h1Z0stxzB35Vi
 V366txrYxgz3SuwA+AXHwEdmqTj2EdCHTfFSO55Y6mHeuMwnwrkWgYhgMQbQBnPfRVgC
 wtWb8PcNUb40gPYpV3RWOjgcHMZSm8dnT7Zm/+3tdLIM4FJn5UICKsKr7VyrbGBI0+Lv
 b9Rw==
X-Gm-Message-State: AOAM533ZdhJbYYbTvs0t/XbfYH2UM3BE3MphwJ1Uw4IuOvrlxi/Nukn7
 66hTiWBRS8b24aAVDe3Z4d3HSA==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr32071245pjb.89.1643616511969; 
 Mon, 31 Jan 2022 00:08:31 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id s12sm16960563pfd.112.2022.01.31.00.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:08:31 -0800 (PST)
Message-ID: <06314359-3790-8e73-30b3-62354f4783b4@linaro.org>
Date: Mon, 31 Jan 2022 19:08:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/16] hw/arm/highbank: Drop unused secondary boot stub
 code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W8iBTnf0jStL

On 1/28/22 02:46, Peter Maydell wrote:
> The highbank and midway board code includes boot-stub code for
> handling secondary CPU boot which keeps the secondaries in a pen
> until the primary writes to a known location with the address they
> should jump to.
> 
> This code is never used, because the boards enable QEMU's PSCI
> emulation, so secondary CPUs are kept powered off until the PSCI call
> which turns them on, and then start execution from the address given
> by the guest in that PSCI call.  Delete the unreachable code.
> 
> (The code was wrong for midway in any case -- on the Cortex-A15 the
> GIC CPU interface registers are at a different offset from PERIPHBASE
> compared to the Cortex-A9, and the code baked-in the offsets for
> highbank's A9.)
> 
> Note that this commit implicitly depends on the preceding "Don't
> write secondary boot stub if using PSCI" commit -- the default
> secondary-boot stub code overlaps with one of the highbank-specific
> bootcode rom blobs, so we must suppress the secondary-boot
> stub code entirely, not merely replace the highbank-specific
> version with the default.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/highbank.c | 56 -----------------------------------------------
>   1 file changed, 56 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
