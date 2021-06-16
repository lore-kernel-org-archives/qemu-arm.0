Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp604616lff;
        Wed, 16 Jun 2021 11:39:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNmtQXm256aOrp5jRkjDe2OkN+pPyd6HyuA+xZi5g/LrHwiULi/Qsv6pi0WZLBbGX9HzV2
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr465316wmg.44.1623868776214;
        Wed, 16 Jun 2021 11:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623868776; cv=none;
        d=google.com; s=arc-20160816;
        b=0iu3zhqrFELdqQDlaBrS/GriVEQ7Y/aCZJX1ieokPOoAZMWt8MFhA3Bha4L5+29CVP
         Lnen+flTU8TI3f4uSKdI1oBusVMiJ17Tk+UsQNX4DJxlcy6ZVIkluCrK+cN1UhwsrUXa
         lGfoVytG33l0bjZ7L7GL5ITxXbNy2t0SbX3KyiF2nDw04h7v55gaaFH39lzIyllsogDo
         L31e10K7R8oTYkCO5UGGvsp8tzF25D1N9pwfjWVGmG9moQiT3Cf0QW4ziOpx+vznnjBf
         78OOpZ+Yw7E0uLnScnpHtoq78o00xd2/9FBXfyyaGzRCG76gon/HUPTc89XKyG8mNGkn
         1xWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wrU5U33zblwrY3mMuU7yRTruyxE79AwBgc+LeGDdVZI=;
        b=l24Sp261NksZ85lEAvED8KCmsjKm+eeGPSa3+HMkgzbjQzez8BgI8GbuB9dQsA84YR
         T7m7eqIzMkT9CsKtacnjJHRQixDtHyzh9Q5UQ1kjugn2FSd4IVGK1rbiGBTLeT6JgejX
         76+8wEV51hxr+TiljI6tG7l3/SUhaUfvq9KpBTHQXg8DbFVEtO9XoS/NuIQZCtZ95tFv
         BOYQ62ek3za1MT8ZfoYDxT2anTd+01cCpGlOgF5uqRPpoV1763E8q+NLk31jGDFfHwg7
         nCuPqYkuiWDEK41IkCj+JwF4gTUsyqUnv/Pue6DEHSz+0htGJanDWj5de+EP+M9Mjfvq
         YZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BlTZr+k3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si3934185wrb.486.2021.06.16.11.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BlTZr+k3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaRr-0007Wu-9e
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRE-0006tv-UN
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:38:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRC-0001pX-2r
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:38:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so4541141pjs.2
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wrU5U33zblwrY3mMuU7yRTruyxE79AwBgc+LeGDdVZI=;
 b=BlTZr+k3bQ6wvt5Cn6d0SkXjoLBDytFANUrpV1a16x0R1RlxYbhUENRB8aDz4TRnMI
 AeWJUMv02NZdWEWaO7SYfOKUVCBXK7zf6ocb+I8e4Tu/k2qFYbwTyiB2HK+w0iE1BFzp
 oWuZlIuMSJLV450p7HG+vtRsU6aheT8Ihpu8MKYZvmhh36KBqhCFhp8dOD/po0Tido4E
 psoCFRQ42zSNNaL6qF5F1TzxqfH29UIrZDzu5UXW7fLd4bofSLkMllmJo0QR711hQce0
 7BPNSJcf/rvDbvblCVFKv+Tlf9WzpowfGOKl+jTsvnKvrSrhq/d8qZWeHtpCyx9074Mr
 itow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wrU5U33zblwrY3mMuU7yRTruyxE79AwBgc+LeGDdVZI=;
 b=gPDpQP5jo2+bO9QRmynzjFPKrNT5m/JzofpmqUOHDJ6T/7QY00Qtg99zuy3L3ExMBN
 ZBD58gpapKWorJGghbeUnxclgbMIVRgHrxQ5vQ1iz+Gp9ps4I1fvWxzuhk+tJlVEK/3Y
 g7TBdqtwNXlQQGi7jtRBU4fGAm5EGeGqGNQ4A83wdDMX7DvLVE1uB4ZFL3EQuLaDBn5l
 VEfTFJ1kGVrskq1vC/3pWYCEugkRr3eqPRiW8T0WlqpJWNOybOtE/biCy6feurCVREW7
 Fby/k2pCpr7V2IAKAOGHavZtl8Z/hKbfaacIl/QDgfG/7ajhaoY/9A2Ek1ge8G/MkdLj
 HXzQ==
X-Gm-Message-State: AOAM533WSG+MaMTL2FatdBxjXxDJiXDoEFDMxfdLRi0ZGwdNlWEl8MZs
 RmISV6luLNPAFyZnD0ZJm66yEA==
X-Received: by 2002:a17:90a:a40a:: with SMTP id
 y10mr1170241pjp.151.1623868732603; 
 Wed, 16 Jun 2021 11:38:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r4sm2817037pja.41.2021.06.16.11.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:38:52 -0700 (PDT)
Subject: Re: [PATCH v3 01/13] hw/input/lm832x: Move lm832x_key_event()
 declaration to "lm832x.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac4302f3-9dad-45e0-50dc-3114509448d5@linaro.org>
Date: Wed, 16 Jun 2021 11:38:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lcw+8UD0FqNW

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> lm832x_key_event() is specific go LM832x devices, not to the
> I2C bus API. Move it out of "i2c.h" to a new header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h      |  3 ---
>   include/hw/input/lm832x.h | 26 ++++++++++++++++++++++++++
>   hw/arm/nseries.c          |  1 +
>   hw/input/lm832x.c         |  1 +
>   MAINTAINERS               |  1 +
>   5 files changed, 29 insertions(+), 3 deletions(-)
>   create mode 100644 include/hw/input/lm832x.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#ifndef HW_INPUT_LM832X
> +#define HW_INPUT_L

You fix this error in the next patch, but better here.


r~
