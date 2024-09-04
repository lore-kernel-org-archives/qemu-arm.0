Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp71007njb;
        Wed, 4 Sep 2024 03:47:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7kCg6Pw6ZAcKuSvJgpTIvuMBr1AjGU1usL091BZrB4yRDVKCJzIkEzKzMDnbAsGr3qs8iwduktAnN5A==@linaro.org
X-Google-Smtp-Source: AGHT+IGbCHxiQOHZ5k+pLaHLSu+iAdnY2Q7/juVoggQ7KOj/pD+X5F8pGRzxEmL5IkJJcGWYswEF
X-Received: by 2002:a05:690c:ed0:b0:64b:69f0:f8f2 with SMTP id 00721157ae682-6d40ee583a5mr210337827b3.3.1725446854446;
        Wed, 04 Sep 2024 03:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725446854; cv=none;
        d=google.com; s=arc-20160816;
        b=0yJTTizlPzzHp2L07MOEMv/1ne3Oh64r1eHdJdYROTgG+Y3pAcsKXIkg2Ajxqr+ka8
         jL41thUH/AvUqJHvfA3ix/WcteNwnauWrTVDeQBcepl5qq833Kph7jFuInzlgGn4+3ii
         67Xmr8uauCT3TEiIlWr4RCsLQKBILJ+wIsaqEktVNFKWn2hofGHD2FkuOLNjUkoF9akw
         ppQFJf8RheI4iRz1UQZapl87NgmBeJIJwo9MOhmmxc9AAZcNi2oUteONUhwLkUqLR9nv
         IjG/IxI0pupLyBvO0d6j3xoF/72SABrsv9IK1djs12lbY68g+2oaLhHMju0+4+5G+lwk
         iYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=usbZ962rFjWwTT/IaAi2i4HBliyGbzhn56rQ43ZAi5k=;
        fh=fkuxEas/X0yTj3SU1FVtUcf3xIYK5BwoUZkFCjSXlVM=;
        b=F9uL1KIXAJUPVNOpL0STJ+Vy1hZBrSd5DRryvXZq/J7XenYFofaBwqVtuy7pWYmjJv
         ombTtXVaDwqvI3ss+EuUSG/B9vRtXtqrARtz/HOu4XsCv9sPXrObpATWBDfO0nDv9QHY
         71kFIqCw5bZ/MXuWdT5Xc6znNxyD5ar0jtOze/ZLYc0c8g8xc04QFKSckXemFCjS4ymx
         H+cymjjv05MHJdF1RLgKHl3uGkY309bOZmFiF9etzi7tNi8KC/2RnGs5PSGT59InJChO
         GaORoVBXFcNxjtKH5b3GSQnnHibrPD9ex6LjQGjGtWoi7E0uE2rNdLWufTb30EY20yB0
         AAIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPObmfDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d4f94fsi1155947385a.261.2024.09.04.03.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPObmfDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slnXY-0000TE-SC; Wed, 04 Sep 2024 06:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slnXW-0000Ja-7R
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:47:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slnXS-0002m1-Bd
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:47:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec6aso3500825e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725446819; x=1726051619; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=usbZ962rFjWwTT/IaAi2i4HBliyGbzhn56rQ43ZAi5k=;
 b=mPObmfDnybK+S2xKF2gYLOce3G98/97wuRB6ibEJoNqnshBmWfAkmo2ehjeO5sL3gd
 H6ehakbN6PdmmJ+5lt7OH43XX3NOCuPdAbmEGi9tzOWMrfBslGhgDn2zegHKdiNxF2oC
 IsJgCX8dEbj5KiaQFdfWT4gCzwxJhqHJ4eacvHe8WP4fFqNcNB28AbNhBkpbm3HrxtO+
 xyKLDZm707MLyPeSXlH2eZ/AQ7nd4JCSolJtFZw4ZaK8vViy0Jbvr0WNh8S4jCCJfmlT
 zi1CWSoStPGrVBFwn+6nywkhcMUCz4O+IhSE0OhUeDn5FaRq2CxFc5ciNvmGxFbCntbo
 yrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725446819; x=1726051619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usbZ962rFjWwTT/IaAi2i4HBliyGbzhn56rQ43ZAi5k=;
 b=GR+v/6GjjExbLjKLVgbrUiyWK5ryMhwC8XyWSt6tbN0pyUGESL0Uzq9U2+IbgNbhR4
 PmaMTybv/c+33b4jJ9Kv6hu6ftfHgBMUjBb5Ey3nUokNZDFKu2pjzM5VbpYxH5EoAwUE
 VRkM9BKZfiMoFx6txQxlfeI8rVYKFxR58+QxT/mWClHzUj2/vojCfHn4AojKpLCVZepO
 +BKIzA3HLQwU29CY+/zUkVTnYZbhh2cmMNhh/cj/Mt/6Iu0TZeOvCKZqgVgzWgI3AnKg
 W/LwEgU+IpsEt6uLyGpAlXliXMe8Q5vfCl48LEWPuvfOSGHG73Ca6GunbYCoH3ItXxt6
 0n1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8Dr90Bnam7nrs5q8Y8+ouD+/F0NHql2AwwTitF8xm/ji0E5ynvEw7TTc3nf9a7d1qzPcE5IVIQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyl32Ic9DQBJHnTvrwSaJfXkSuj7a7gq+SM4TzWDbFORnlG9/58
 qDmro0jwPkNcS7XHwO4jtoK0qA+Bc61h5hcVcU9yShK7RzO+NvYmFLYc1yD7N5E=
X-Received: by 2002:a05:600c:468a:b0:428:b4a:7001 with SMTP id
 5b1f17b1804b1-42c95be865emr10793315e9.15.1725446819024; 
 Wed, 04 Sep 2024 03:46:59 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e274b6sm200996665e9.33.2024.09.04.03.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:46:58 -0700 (PDT)
Message-ID: <faf8ceb4-d04f-45d8-85e3-5cfa09747b1c@linaro.org>
Date: Wed, 4 Sep 2024 12:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-discuss@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
 <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
 <6eac1f19-59a2-440a-a5b3-f4d9654ba539@linaro.org>
 <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
 <CA+1FSijxZ5Ocic-aGTikNxr_faS54fP=P+2uuCxfypMJKEE2aQ@mail.gmail.com>
 <2eeb9049-3444-49e0-892e-7022ab045647@linaro.org>
 <CA+1FSigoFF_FSKSGbs4jOyya6DJrEH9O0MMV84+XowZ7RkmFNw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+1FSigoFF_FSKSGbs4jOyya6DJrEH9O0MMV84+XowZ7RkmFNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: J88jp77KcOhG

On 4/9/24 12:13, Mario Marietto wrote:
> -> What do you mean by "qemu patched"?
> 
> Isn't this version of qemu :
> 
> https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp 
> <https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp>
> 
> properly patched or adapted,I don't know how to define it,to boot 
> Android 10 on the Jetson Nano ?
> 
> -> Hopefully you are right, but unlikely:
>  > 
> https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp <https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp>
> 
> What do you mean with "Hopefully you are right,but unlikely" ?

There are only 3 small patches, barely changing UI size and buttons.

> 
> 
> On Wed, Sep 4, 2024 at 11:54 AM Philippe Mathieu-Daudé 
> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>     On 3/9/24 22:52, Mario Marietto wrote:
>      > Unfortunately the usage of qemu patched to boot Android 10 on the
>     Jetson
>      > nano didn't change anything. I get the same exact errors as
>     before. :(
> 
>     What do you mean by "qemu patched"?
> 
> 
> 
> -- 
> Mario.

