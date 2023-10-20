Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp567935ejb;
        Sat, 21 Oct 2023 18:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi9hnzD1+kILAgg8frJYzfx8xWZ4wt/vtClAUA/yy33WQ1eKycS+mpBtxgA/DXvIT8qpnh
X-Received: by 2002:ac8:5886:0:b0:412:2c24:f497 with SMTP id t6-20020ac85886000000b004122c24f497mr8704264qta.26.1697936638950;
        Sat, 21 Oct 2023 18:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697936638; cv=none;
        d=google.com; s=arc-20160816;
        b=yf2PxWcIRb/5FswY/yS2dJ8UNgT5QIxBcT49oY1tWY41v3DzgFw6PSdW84CplQ7C9i
         kKncYkp4/xSHmXCHhQtirF1aFdLWP+0Fd78gOgiDuJD/T1YNKDVa2188cDSiWPi9ucD3
         4r4C3VGZgp5/bKln/ICyGBiWNFSfTSkj+THwkBow3hDeb9bL9Ij16dLzrlX+LY4lYpGw
         xO/AXK2LvPsdE9Is7mM4FlBdQTRnLMl403tO2ESv/LjAhNAahkG4k2Rtf/m7EnODZvXZ
         VsOF1ONf3cu0Vymle6oZqhh91dV/MlcFsVxl9ppFZp2oE2Quv5hEKcM0xYln1oS5pofM
         ZXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=y1WWu6RI/8kIYK8I70BRGyaj9oj5p14/0uTAY1l74vA=;
        fh=LRx2/Aeoqqkpbkk/dzg0Gy+dhBij2dXnMd/OPRRQS88=;
        b=o1YUdbroLQxkuwELir7AL3NENAbu5dS2ToQ+RV7DHki2827J5MfWnTxUblJGn8oZnK
         GdxmvJVkFJwkHAuhvKASazUeEFq7sKBMk52izp4DRW/pJVEnRIviETTh18Vt/ofnIX22
         nKgUb4KbhzTCqqLsu5aWTQemZck/Pk81wLlaYfXnkBgGPFSpkSF4xnfrfp48XuIQfh+y
         /RT+d0npwMUDdEAJ0x/UV1JpZX+rzuFTGHWXNMIvmDI9mLx6Mq166CcAR7J4zn1ayH6X
         IHRxrRLQ+CkUIFMbwD+loRelZgFlEeBzhs294qKioBnxDLaUnKAC6Sxxs9qtdikcVsJH
         ZaYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/kqINYZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ac85947000000b0041cb4580d20si3559053qtz.352.2023.10.21.18.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 18:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/kqINYZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quMs9-0000eW-HO; Sat, 21 Oct 2023 21:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1quMs7-0000UM-UW
 for qemu-arm@nongnu.org; Sat, 21 Oct 2023 21:03:15 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1quMs6-0006lF-9J
 for qemu-arm@nongnu.org; Sat, 21 Oct 2023 21:03:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c9e06f058bso23409385ad.0
 for <qemu-arm@nongnu.org>; Sat, 21 Oct 2023 18:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697936593; x=1698541393; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y1WWu6RI/8kIYK8I70BRGyaj9oj5p14/0uTAY1l74vA=;
 b=O/kqINYZnIZDmZGuNfgMPkxK8tAXT5SfSYEgFgmU6rECS71WhrFBtTZ2aGAVGa5Zqa
 +JctumXFucpueLbWEZvpL6N5voj1TMJ3gaPiAXzgsW3HkJD/ntaR6muo1JNyEwH9KncK
 QVgGrli+Q9g2kxni99zxe2GdPtLY9krHfm2nVaFgx1A2NEunk0cgOBAT8lBRqYuqt3xi
 ud31E1eo6HtBudckVkoPw83VgNlLHmYO/S+rTvgl7F0/+Ffwj6aXedjriFikrWgRO6I3
 XtWFHA3VXoqFjBPts1POwGwYrGs5OH1rh7J8bc3vcuS/NmUXxrMwg3+5YAv7e+Vb7i4P
 +xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697936593; x=1698541393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y1WWu6RI/8kIYK8I70BRGyaj9oj5p14/0uTAY1l74vA=;
 b=PdEzY6TU4RVt42CalSxHIwUGeDEJBneXR3ST+FjNU/ngoEzAwXKO0oHwl2sYSVADVN
 0oXmL7MKxOfKmK2DfnOd3TqjKToiM4xksz4+Yo2/HMjZ9oQ6hfp8HoNN3ydyDJ4wu0xC
 3leTeR3fKQgTGILpJkLxXykSX4mDc8RlEydr/XYCp4Zo+Gv/lVtW7tkti2vSwePoLIcT
 gSXuR67GCUmIAYL0L/GUYOxHFcgPxAcOu7b1MweO+siAVWMV/jLnjAHHobFID2qfr5vw
 hj7kZwrrCvjHeJ2kbJ8vz6lduSojCil1ZvBuOK/cTRLiUurrwKdYZ3EupQ7SbEudokfC
 u9aQ==
X-Gm-Message-State: AOJu0YyHkLYIPCu1bFYWSO+9ljalftxr/3Q3CR6S6C8xcV/nfw31bPpo
 /4+toB5TuoiMCFSOEoUY1BJtFtmTDRzlqziSlHU=
X-Received: by 2002:a17:902:e5cf:b0:1c9:dff1:6de7 with SMTP id
 u15-20020a170902e5cf00b001c9dff16de7mr8383461plf.7.1697936592833; 
 Sat, 21 Oct 2023 18:03:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 jb14-20020a170903258e00b001bc21222e34sm3704336plb.285.2023.10.21.18.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Oct 2023 18:03:12 -0700 (PDT)
Message-ID: <af5539ab-ecb1-483f-b96e-1604239a4e6e@linaro.org>
Date: Fri, 20 Oct 2023 14:31:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] hw/arm/pxa2xx: SysBus/QDev fixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org
References: <20231020130331.50048-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: aCDGqu+dvuWM

On 10/20/23 06:03, Philippe Mathieu-Daudé wrote:
> Missing review: 6-9
> 
> Hi,
> 
> Extracted from a bigger series which enforce QDev state machine
> (qdev instance must be realized before external API is used on
> it).
> 
> While here, pxa2xx i2c/intc devices received some qdev fondness.
> 
> Since v3:
> - Added Thomas R-b tags
> 
> Since v2:
> - Fixed i2c_init_bus() call in pxa2xx_i2c_init() (new patch)
> 
> Philippe Mathieu-Daudé (9):
>    hw/sd/pxa2xx: Realize sysbus device before accessing it
>    hw/sd/pxa2xx: Do not open-code sysbus_create_simple()
>    hw/pcmcia/pxa2xx: Realize sysbus device before accessing it
>    hw/pcmcia/pxa2xx: Do not open-code sysbus_create_simple()
>    hw/pcmcia/pxa2xx: Inline pxa2xx_pcmcia_init()
>    hw/intc/pxa2xx: Convert to Resettable interface
>    hw/intc/pxa2xx: Pass CPU reference using QOM link property
>    hw/intc/pxa2xx: Factor pxa2xx_pic_realize() out of pxa2xx_pic_init()
>    hw/arm/pxa2xx: Realize PXA2XX_I2C device before accessing it

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
