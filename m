Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp1296759ejt;
        Fri, 16 Jun 2023 03:30:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4T4GpumivMHlLOOFMMOtsXTYExVS3G+/Cy7hywRf1DXuISd66GX8z0lSgetOURKkJ8g33/
X-Received: by 2002:ac8:7c44:0:b0:3f6:a19b:fcb4 with SMTP id o4-20020ac87c44000000b003f6a19bfcb4mr2185873qtv.47.1686911425640;
        Fri, 16 Jun 2023 03:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686911425; cv=none;
        d=google.com; s=arc-20160816;
        b=U/MAiq6luTV/RIFkuJfzCPEYUmxuPr2hkWaVyzahMIhnG40cewsax/pOScdNWc+olZ
         7/wS2gcMbH9AdMC+krABGrbuo3Q3YvqOtD4eUe+0cMhsnz/pN0UuMC9u8WSAFfGa3dtd
         u3gkCVeKSyb4Pa2JCOsT/HpPRWMPa5S9hEa7XgdXoxdMpKfLjQFRMSNGLcNt8gCkPky4
         dFGMxKMCkTr2Z4K3/2NwtBLIgk246yt5n/93J6EwYW1QfB2fXacNSpeygiZLGCsCX4r8
         iu/1dLpY/D1WkR7d2u8IDun0ierApYA9A0WxaqddJnno/oKwYXPBCCYQRcslL+wS1Vo1
         5IUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=92xWwc/xn57EVrGt32pxXKL5nOzCl0xs34WGS1IXpSE=;
        b=RWRMvlpVvcamw00nxS1iLMak9T1NcF8jZ19E9pGU1d1BQQk4GHi7N+NWjLkPHtTQXU
         eyu6GjFADgdvSquTZ6nVmoLnosuN7ezG+NrS+2BzmXFh9RHTZCd4V39nlAKxXYAoL7iJ
         dfPl7JRBUwnQ0yGSWE7i0iEpoDsTCM2+7ojajIZfpbMqc5Z/edzveU5uILWnxo6ld47O
         ifOzCrMu/zSNpc0hNi6jm4+6i9ZmkDQam6jI9nntZj1t9T5jAKGGPxdKNMsRgLLMaIyO
         PcirA4Q6ogiyD5+vg0mtPiERqsgBYHkllnZxLoiblB7rhl59ybRUOE9pPiUzgs1Ehpx4
         XFUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P08M/cyz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac85e46000000b003f534327c38si10914968qtx.348.2023.06.16.03.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jun 2023 03:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P08M/cyz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qA6i2-0006lW-VB; Fri, 16 Jun 2023 06:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qA6i0-0006ks-Su
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 06:29:36 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qA6hz-0006Mm-8P
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 06:29:36 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51a3e7a9127so568913a12.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jun 2023 03:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686911372; x=1689503372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=92xWwc/xn57EVrGt32pxXKL5nOzCl0xs34WGS1IXpSE=;
 b=P08M/cyzR3ByoOAAbGav9X2nKlnEJ6MjrWNZFmgoD9Ss7uxAzFmMSHoYZdbptbD0+9
 GJr1c+6iWWprSVKLmG6vG4ew0FzdhPvhh2cTyyfvKistGOS4gCy/vKdlE9moqyT4zkpH
 A9cEKdRdXhzEZcPIOOZZ9aFk1ZSaHEnJFFoBAnW5iI973UVm1tyZVCPPEFaAio8cuIrI
 jurKGugsDtMYAyYNCPuUrf6SGeSEeRZslHGsqDdkDolO6fQGVu/rJxfKAmi0/rb4OE/X
 7cpxcu4YD6kYwL+5xJvvohgxeuOXCnoj41Begpzhc9hEhK3hRAt8/3i4onyn90Hd9amy
 ezgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686911372; x=1689503372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92xWwc/xn57EVrGt32pxXKL5nOzCl0xs34WGS1IXpSE=;
 b=Lnjc1pFHgZ5uyUEjD8d4aDA3/Xr/xO5KJrvuvM64oO0CKnAdEcJuIi64zpVeLBTobd
 1jn2gbMQzSEfAWSIrS+3ZVQ6Z5DOKvBnwooqagPTSG/49XxsaYlJs1seZ2jhWShebA/0
 FbR2leIzDmolUWMLvV7hskPjurUvEBhhBEmkVVVCe/JOGqDN73xrYhFgnYMN3fsQGJMT
 dPWWSqVzp574DbdNUajGrdUjPtyZivhsFz4KByXrgs09bC5NKQGpGvlZ8ZmTMfdLzZzo
 Ttdx9ml5Tu4IrQf4llUP54wAvsLm08Yk0kccvcH7KhWYoKwAcKJehJurV1oMSCb8rwkz
 3EDA==
X-Gm-Message-State: AC+VfDxNFIhEFlI/ugwhsvEsV0dEbMsSjBv5TYqeCpEvd8yRJRuaIeHd
 MePdFQ/u4L+eHJsa8gk+DT8Bpg==
X-Received: by 2002:aa7:d0c2:0:b0:518:79d2:208c with SMTP id
 u2-20020aa7d0c2000000b0051879d2208cmr1399255edo.18.1686911372614; 
 Fri, 16 Jun 2023 03:29:32 -0700 (PDT)
Received: from [192.168.85.227] ([91.223.100.45])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a056402068900b0051495ce23absm9695536edy.10.2023.06.16.03.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 03:29:32 -0700 (PDT)
Message-ID: <c8f2136b-9564-a1c7-b1ba-409c1f700e60@linaro.org>
Date: Fri, 16 Jun 2023 12:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PULL 0/6] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230615173525.428831-1-clg@kaod.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230615173525.428831-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: T5tLhaEUBWfB

On 6/15/23 19:35, Cédric Le Goater wrote:
> The following changes since commit 7efd65423ab22e6f5890ca08ae40c84d6660242f:
> 
>    Merge tag 'pull-riscv-to-apply-20230614' ofhttps://github.com/alistair23/qemu  into staging (2023-06-14 05:28:51 +0200)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/  tags/pull-aspeed-20230615
> 
> for you to fetch changes up to 42bea956f6f7477c06186c7add62fa0107a27a9c:
> 
>    target/arm: Allow users to set the number of VFP registers (2023-06-15 18:35:58 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * extension of the rainier machine with VPD contents
> * fixes for Coverity issues
> * new "bmc-console" machine option
> * new "vfp-d32" ARM CPU property

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~

