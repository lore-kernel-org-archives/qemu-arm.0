Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6327463ejq;
        Mon, 15 May 2023 00:12:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Bf2PYE+i/+1AXM3XP1upIOi2TBoY85Ts+Oh0ArWupEOK4sb8oh9Jcdu6/iQD0NlrJUF8O
X-Received: by 2002:ac8:5714:0:b0:3f5:e8f:47b1 with SMTP id 20-20020ac85714000000b003f50e8f47b1mr11457558qtw.59.1684134750150;
        Mon, 15 May 2023 00:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684134750; cv=none;
        d=google.com; s=arc-20160816;
        b=fATiTNn2hdSity5xddcVF60jl/3OJuqsq5ZomvXrrLr65LRAAcBvoLOKFSdUPVS7CS
         RiHVsIJXoG6XilVqT8dAuI7sl+spsVUm+oAO3tJqYbcojZUTQqHxZqEr7F3snVsmyd9M
         4C+ZSbLNau8X6gpjyiyYMht6HYOgteEcU4JiJhnIgIyxkNg06NGf/QEHeAoWrYlSQwQ7
         7RylETJiIup/3wz2zCquVhQ9jCirEJUw9QwCqVya9+A14AFRRZgdDqdnZsqrFx2mKrVa
         1ErnwabpP/TwpwWORYAfTYipXlKNl77Nc/7mhCcMOmBKrKg6j/wF9nJ2PvricpH2TtzH
         +c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sBdlLd0RGmZoGMQI2SU5HJRgzkUTKTcbuAttEZnC7Hs=;
        b=HCL4+eej2DjllD/9+ewraTQU/fzgYFwH1FI4H/R7VDoCGGfp1N4tpx5KdgMo8Bv6p8
         rBptdkGP/VQNCq9IjE9JXjmzEqwsTpGzjvGD33ybLhw9vrUoVOQ/SAUjSacASYf8Kuwd
         9ppU+hgSfW5BNnK0bu0K4HxMLdiX4YHCOTA+Teeicb8xEcuW2sBrJerBrOWRmXBmjPXD
         7mr8Co86+Sl1Jzv9nJ5fM6UgngZ8Op1lufFlfWTMtAqsxbHhiYNb1ywFTjvQ0Xf87k0D
         6mXe0gbF1guSRKIEoIhjVHpfJR93ydWz7PStRWks/FBoEaOn7TgUh3N8dm8k34UOgSpx
         3PFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gSA3hRNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020ac84e8b000000b003f4dc3f05d7si7756363qtp.563.2023.05.15.00.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 00:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gSA3hRNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pySMy-00039R-Tl; Mon, 15 May 2023 03:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySMw-000388-CY
 for qemu-arm@nongnu.org; Mon, 15 May 2023 03:11:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySMt-0001BE-O3
 for qemu-arm@nongnu.org; Mon, 15 May 2023 03:11:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so9185329f8f.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684134696; x=1686726696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sBdlLd0RGmZoGMQI2SU5HJRgzkUTKTcbuAttEZnC7Hs=;
 b=gSA3hRNv4z8ocOBKDn7UWeB2JV6IW5qQgZU2NrWdWMqToHSwjtqS4a1y2nPBKBQodZ
 g7kVH39dUkBSDRCo6tJi6Hce1IahrhfEJATsCGhhwvCm0g5Wi8fMyAchutzrZZaiqwI9
 gwAzAJzpM8KFbJjunRjJBe3R3PjXfarG60qmAvOcI1K19P7KMC7WV+Mm3E9C32LkZPsg
 ajXX0RHEXJlPeSGFiEdESNAQsNX+F81mSS8j8lAnm+ofOJ991SSFOJFh+F5eyJQI9qRG
 76HhgRAtqEZac+zlyU0MRLZ8gGFfUgYYtvXnXXntC/vhNErANNsOi8Lpd01LU18fjJ5T
 Tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134696; x=1686726696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBdlLd0RGmZoGMQI2SU5HJRgzkUTKTcbuAttEZnC7Hs=;
 b=krjZnKjMk8fbzTsKRR0+KvkQJ3o2NGvaTpNVwgOkuEUlTB5WItOKecSz4CuCbkfCgM
 jaj8bdK3oxbFguvI6SABeMhXEJ/WPL013WsIw4Lsi+yompTAfOsaPv8SbvakYRqULSEv
 XWZq/Gi+CZhy69Bh8DYFAbMoDEoAT7OE2Fa/HoHRVAx5PaeG13hdqArpEGVY7uT9+bZh
 snahBJ+RMe4FNMM2bWCbRqiXjBLto2XDRb3OBgDpNL0AvZT/QZanukIq9j2KTQo1J1cU
 HxI9yqTsQp7r46Hgvbrw85odEpy4QHPvamkZMahH+rajyaB1PzqR+tVYL9XruM8GDCYc
 m/0A==
X-Gm-Message-State: AC+VfDwqJK+z/wBFkjzxVZC5ofdBrU0FdKSXpjjTuFgW3sPG9D83TXwK
 KrwaIfYqDdynEcXZFq/vUhCzoQ==
X-Received: by 2002:adf:e552:0:b0:307:7be5:90da with SMTP id
 z18-20020adfe552000000b003077be590damr21224140wrm.68.1684134696341; 
 Mon, 15 May 2023 00:11:36 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b00307925ff35bsm24590535wrw.49.2023.05.15.00.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:11:36 -0700 (PDT)
Message-ID: <16934ed7-b58d-6685-2aaa-6e2e9560bb75@linaro.org>
Date: Mon, 15 May 2023 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] hw/arm/omap: Remove unused omap_uart_attach()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230513100906.46672-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jDLGXn4wV+OS

On 13/5/23 12:09, Bernhard Beschow wrote:
> The function is unused since commit
> bdad3654d3c55f478e538037d9eccd204e5fc8ee ('hw/arm/nseries: Remove
> invalid/unnecessary n8x0_uart_setup()').
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/omap.h | 1 -
>   hw/char/omap_uart.c   | 9 ---------
>   2 files changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

