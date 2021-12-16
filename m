Received: by 2002:a05:6214:3f4:0:0:0:0 with SMTP id cf20csp1635910qvb;
        Thu, 16 Dec 2021 09:10:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtrwsduVG1s2FLDjelz8Dz9++Yy2IvnwiS/V1f7qUaWFb84SCBzTgRX8qzjgN47FXDkxAn
X-Received: by 2002:a05:6000:118a:: with SMTP id g10mr9320208wrx.533.1639674609804;
        Thu, 16 Dec 2021 09:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639674609; cv=none;
        d=google.com; s=arc-20160816;
        b=nXT6K8ZLAp275GDykaszkJdLNJqreORnq13NnrQ3PCnvhDU4f8Mk/4hZJiTQicNKHG
         zNFT9EqgScBcP2QsP2PsxzGFtVxx1kFmu23bkH+zkYWXXl1QMqyxX9IRuVixB7c8O3UY
         N3fTdlk2cw1pWluEMMfzafmcmS1Pa2ONQQE2Xq87jF0pzKRNo4nELRJjyqVLowWZ0ud7
         9JXfkvzd3MTicCbAiqgLgw2AN4eJt0q2Unce1GEy9XbrVr4V+OWQ4xQd5bwYIVr4RQ+E
         w7AR5BLBAu7zulorT6+2ea4XZ1jsUuFafjYVLZUyqGp40TqBcTWw9smJ7qG7t71Ftkug
         PZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+iMmO50IIKAnCF7dKFeW6WxFOXG1HC1dAheBL8OiBak=;
        b=P038nCCVt1idz0sSGqVr2V8lBc4cDV25WyXPESnt8C0uWdPFHBgF56zh+2C7DrhEec
         ESCoBLPrPW8eE4NlUwYsqOhF3kW6WWu8E6LuiLUta+UXjBlb+YJbCyo1H7xu7egPCo1c
         QREB1T2ava6BWKul/5zNSAhsYeMBP8D6BRmmC4or6tm/L7Ch2JWkWpomS0FPJdSKw2M5
         cMg30+UwzPokKNNVq4xVOLGga954WI8x7Bb8YBdYzWPYv1TppNwLw6vSfzhOvlc70sE5
         C42WaTq409tlZKQPhYk+Dg2H0dqVTHerDHPkMXqmCsrpYnb7n6GqQD1svcAk7zIKLJ5V
         cXCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=MuBr+PmC;
       spf=pass (google.com: domain of xypron.glpk@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=xypron.glpk@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <xypron.glpk@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id a4si4113023wrw.59.2021.12.16.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 09:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of xypron.glpk@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=MuBr+PmC;
       spf=pass (google.com: domain of xypron.glpk@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=xypron.glpk@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1639674609;
	bh=Sr3DNSTvuHdJHS4uMfLQmjs1ZX/M/8wpEH6/NRUNtyQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MuBr+PmCoRGNIqXezmMEBfCWY2iChu0yYxGjYfwQrSD1gLpWxWUDPdprzGJORlP/9
	 ZJrMrXV5jmeaF+1djPuvQLzYroY1BfMdeE9fxZmNvF2hNBbtcKNI3WCb4WlX4i1dgv
	 fmOTpJyWtsj4GXO90kwQGc6TeAj71LW3jo6JQtDQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.55] ([88.152.144.157]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1msfCc0Tq7-005JHm; Thu, 16
 Dec 2021 18:10:09 +0100
Message-ID: <ded35220-e2f3-da6b-560c-2e3bb2aed300@gmx.de>
Date: Thu, 16 Dec 2021 18:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jerome Forissier <jerome@forissier.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20211215120926.1696302-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jCcIcviQejyr1ct+bC1d9ZFm7tjF/53dGPx5ueON/7cnd8H2uOL
 PoH/55DBnUCapXsVuVssm5s4ic63frVaDeDHsJtPm9Kfxz8Ht5s4iBIG9FX0VPBOnRokLjD
 UhwywxT+83gfIFmGZdj9RVa2tqbjVQy95wAs3fe2PTIMVNmRF0gUgCSMPqITrIFFed9S0K5
 kPKnIL7i5cJ8ZSYL7b3ug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7aYLYJD8dwU=:zgRYt1a8QJRtVZFdTuuDe8
 FyAP3i8v1S3Z4QDwZlsyv0d+DQmACmDvR0lDJPQ1894O0/Gvi6Db4z0kp6CRHwcQfzBrmKIg/
 xF8FkXTSXevsB5Nfl1kaC0gH9ES7bKWzbrOJ1OOkgSsWb+xGWESAHUPedwq/NLLWzzp2YDBPC
 Jht+vtHzPTOIcMI7XBlmJEBHDd8Uw3ahTieXboUhGr9zFUpWu5A5QkxkftFWDrSlDyFqy/WdD
 cn4A33K8vbQO7SpQqCCiWC9gfUtFWABaR9fpIfNHO3ez1dzQsWgNjURtzKiQee+++sB/e8u4V
 Mavgl3vTKpYpgitcAccGrDTTk9AZhNOfvsnOjRRpDXBNFGMKAJnmkUMulMYaGA8p4oZWaSFjy
 7bcqut1yrHt5pqzma7EnuK2EZXaRZbRLdr1CRidUO3t9EBEl2xKRa88zq3+f9qj/HVW1llAGB
 9uckT3BRyNZi0yJvmEcvL4fkb9aP2uSKW3RHpV0NWnz762XN5djesdBOKFk1Nr8eZbylDywWt
 7K7RS/ty3EL/1CKmLevCi37NzZwIhBigquMPbCeRdNRLvJ9Rduo1ulsujp2AH1sq41r6XLwTd
 9aLmguLRYIX0nJtxvE5fYKS0Ipz7LRXLfAyElfD4c4XtwnAA217FVqXSXPujMQFic950FYeM/
 fVK6jGAAoXLDQJhDzPTZ1kVmKZVtpKGNd1UQNnlUmErbQDoxwkY8P9RM5Skwc/nn28uJeENoA
 ukrXlZywEMebSG6HWifoPADqRA7N8zTu9yBpbVtdkBjzM/7ayHRMbAj5Ofrnv+/E1BSnF0u+9
 fUT7oM3bkCp3XFsxOPb8ilPrayPoDmpXKFt7ipyRniswBXVIYBPSJMQa5/GyNCYdsDVExc7vR
 E/N58SjpYLmG4Fh3E7a8TyqbwgGDPIPMy/F8SBf6UojuAb6Md0Do4GYHO9plaXp8B89JpAoFR
 Swy7Pz1hgpITQt2UaEYuBdewIjaweiAE8iZWhPKEwjt+Yp7DRcw/nwjeUMBJsCuJq86YTNJ5I
 tsM2U3oztZPazjonbNLqRG2JqoQbVb8uLm6HRxZCZ/hsapEhjNuWpbScR+pWoZLrlcLe1HLMV
 Pzj/ST22FevTMg=
X-TUID: TMLwU4LvJzsa

On 12/15/21 13:09, Alex Benn=C3=A9e wrote:
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
>
> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
> Cc: Ilias Apalodimas<ilias.apalodimas@linaro.org>
> Cc: Jerome Forissier<jerome@forissier.org>
> ---
>   docs/system/arm/virt.rst |  7 +++++++
>   include/hw/arm/virt.h    |  1 +
>   hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>   3 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 850787495b..c86a4808df 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -121,6 +121,13 @@ ras
>     Set ``on``/``off`` to enable/disable reporting host memory errors to=
 a guest
>     using ACPI and guest external abort exceptions. The default is off.
>

Tested on top of QEMU v6.1.0

Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
