Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3414313lfg;
        Mon, 15 Mar 2021 02:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww+b4o4aaKY0V7IwxXXvp9wC7QV0I/u04TG7RE6kc2JEv6Qis3TcAzFc0NZ/Uc/3PWOnn+
X-Received: by 2002:a25:c105:: with SMTP id r5mr35375945ybf.413.1615799250567;
        Mon, 15 Mar 2021 02:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615799250; cv=none;
        d=google.com; s=arc-20160816;
        b=nHKj6lfIlPXriMUbJElICkhkX+3DwCOyJUkVc/rgmJE4JmhY+hcTs3w9C43vDMcca+
         BJfAK+CTF3tG+WILY8XZnN0TGdbu+0LAIdn7OxRe1TWbOjKo7QkWuMoOFS/Qhk5TT5df
         pseFJTFd4grWR4PSS/iN1DhHZ+4rW0OrbG6JPiwJLssigv21UWx1hQkssPQqBrohxRDp
         rxNa/+nZxAJ/gTaxG8RpORNBF7RR2IqMUClvmYGLmzM9HKXeRRWTO92byI+8AdL5wLE4
         24scpWZS10x6fFcfhM5azgNPmcn9n4IitaXxDX3yQcv1U2nzrrJa3u+17Iilcadd7qc7
         QKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=0TsK+dPCEm4zr/0kATxFBw1+TxQpriDYes9+QjaKx0U=;
        b=Q+WeYWJfFutigITbWMpuEuNyggwbqK4s5pvAWVW+MmYruyx7P3Wh+vd2YQui0f+Kru
         b6s8kwpebVL8tJtNWj8Ux0NONXIiI/52KipXInVx/ba8tfF5ZPjRQAZmEPTbNkWn74D0
         I37mS2u1xrMzJV7vS05m0VVWNGL6Z8IUcnDndETSjtzcb/f753iH5FY//U7WUIxNvegO
         nf0+7OQv/EbjR0yDaTd2buSRyNLc7fmLGsYkK2Ml2mQEQHSTY4JAC+XZcOPyLCxCQhQo
         ZEN0TQ0DWEerGtpnI5N4YFSSzvE96dlOyS5CRz+Ymcb/DSH/LISfJKefg+cQmhzaCH0q
         imgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v81si14461034ybv.139.2021.03.15.02.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 02:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLjCD-0003xp-Uv
	for alex.bennee@linaro.org; Mon, 15 Mar 2021 05:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lLjBi-0003xJ-Eo; Mon, 15 Mar 2021 05:06:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lLjBg-000378-5U; Mon, 15 Mar 2021 05:06:58 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzVqX5pBpz8yVd;
 Mon, 15 Mar 2021 17:04:56 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 17:05:43 +0800
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <bd47e690-dab6-e8db-2d8c-aa729c41abad@huawei.com>
Date: Mon, 15 Mar 2021 17:05:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KgibEppVrZQW

Hi Philippe,

It seems that vmstate_ecc_state and vmstate_x86_cpu can also be constified.
Found by <git grep "VMStateDescription" | grep -v "const">.

Thanks,
Keqian

On 2021/3/14 1:11, Philippe Mathieu-Daudé wrote:
> VMStateDescription isn't supposed to be modified.
> 
> 
> 
> Philippe Mathieu-Daudé (3):
> 
>   hw/arm: Constify VMStateDescription
> 
>   hw/display/qxl: Constify VMStateDescription
> 
>   hw/usb: Constify VMStateDescription
> 
> 
> 
>  hw/arm/highbank.c             | 2 +-
> 
>  hw/arm/pxa2xx_pic.c           | 2 +-
> 
>  hw/arm/spitz.c                | 4 ++--
> 
>  hw/arm/strongarm.c            | 2 +-
> 
>  hw/arm/z2.c                   | 4 ++--
> 
>  hw/display/qxl.c              | 8 ++++----
> 
>  hw/dma/pxa2xx_dma.c           | 4 ++--
> 
>  hw/misc/mst_fpga.c            | 2 +-
> 
>  hw/usb/ccid-card-passthru.c   | 2 +-
> 
>  hw/usb/dev-smartcard-reader.c | 8 ++++----
> 
>  10 files changed, 19 insertions(+), 19 deletions(-)
> 
> 
> 
