Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1070309njf;
        Mon, 2 Sep 2024 04:50:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuUswiTpte/XQ5i/VqK9GbYk4VRNIuoes3cRgckyQFbIdIWht7fRvCTNE8I7DnhfnqdMe+rFEEbVK8fA==@linaro.org
X-Google-Smtp-Source: AGHT+IFtbHPs7rb77kv3ABO0nbJN2SKwQoIllRAgWV4ZmTL9juJwD3Srbw4RTjm27bjjvMpy04qV
X-Received: by 2002:a05:620a:1905:b0:7a4:f2e9:814a with SMTP id af79cd13be357-7a81d72040amr1030942685a.54.1725277827182;
        Mon, 02 Sep 2024 04:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725277827; cv=none;
        d=google.com; s=arc-20160816;
        b=qVCwGxhHPtO73bD3ArKdD0IuirFUD5mfTcEZA/IKFlVaKOB9yj6RV7UVCN4rAsta7l
         dpJccENuyuh2jwTY9MTK8bqSKmTvYiTrjum4SpuZwJuWH/zGeB/IkdzYqK8wBe/qPKB1
         o6tRRUQsHGOAUbrq8qMbczD+FaP4T/kEAIT44TeaAQmBo/U2eAuAakxTnf1YNkwOEv7p
         1fiIPwqGbXW6faql0fGrf8mC96OBxDvihnzWglyDB5Lu9/56E50Tu+wEYxpMflXGIbSV
         trGT9/ZtZaktwJZi+jGviLtA5a7gCsql4Fssc6MoxSNgUik3k26LVifWObYmpW6vdSRT
         kq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=n3RBm/4+x8Ii6qMbo3OkaDPBp3dY/M41qpdpEswMicY=;
        fh=eGmh+hBI2SG0pRd6+hlqqS5OiiklpmpzLB2v0yS22FI=;
        b=j+PM0KoKL8y4BUXYXQVkYNu+HqY5srJnL5DDXed5Zj+oulJWhEqwXGANbZrYj/EThI
         iHE0oo8eCJ/zN4UwHa41dkaPeFMQonT1o6pxNjzbC3JtW4mlNNc+d2PtbzIAx1SOhGH/
         LHEl1egKKIj3IvPgSqSFGDFtVvZEc3LT7Ejp2eGkiPk6utvCb0Mb7nVkI67vBQ3F0/V8
         JjvBVRdvv2DaP8emM7FUQBsILqtQdlTIVrVoll8rp3GJdcvrUbFg3bbOOzqykOvthqUQ
         aDcMCNL7H2TKmnM8yds6Qidzz9/rgoZoMgjMJyBxIP9GPKuFsG9zh4ktni4cmy9MklQp
         ie/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFwAG70s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d4f9a7si1052309785a.337.2024.09.02.04.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 04:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFwAG70s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl5ZT-0003VR-Sw; Mon, 02 Sep 2024 07:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sl5ZN-0003UN-Eq
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 07:50:08 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sl5ZC-0002TG-7w
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 07:50:03 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so4263251e87.1
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 04:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725277792; x=1725882592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n3RBm/4+x8Ii6qMbo3OkaDPBp3dY/M41qpdpEswMicY=;
 b=CFwAG70s32Zaqa0mNZm5K4gKL4LI5Q4Gio+sDyH3ERG5MnHS2EcZjqu3/+njY7b3Dr
 Fz6Mw/s/Q6TbEt0YtV9g/mRKTW67tORR5jGaasi2JcbPWgl1LSOMD5v1h+Ie6p6sGORA
 m/vbDJ9tyhsijwRYyvqKYgGRV9Vl94Pl1a/3zCytighQsozjy+OG4qUPzJW1w/+Z2cNE
 YSUFyQY4RXJK8ckZbllTA5lOG3kwTj/syuMVAdrupvbF91lg5AaP6Cq8gxMxTx61I+EH
 G3ALhWvsknaf5bzQOelohZeFzZPVlGa1YHrJCqI+1Kmp+ZETkim/08SVkhefm174KQTJ
 fhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725277792; x=1725882592;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n3RBm/4+x8Ii6qMbo3OkaDPBp3dY/M41qpdpEswMicY=;
 b=P7iHpQrtex+c+haVQZjmPkG1OuMiO2kFmhBQkLQVySlTfCSdaiQTZHOpT2JUReZWGu
 1TvGLLwMJ1FzP4mJ25PePTZzvRY37xOTDVWpM8cLgYY+5MI5xMas+pgJEmT72WGrMpM9
 CtOlMDpRfvLUKuyO3Spin0RptmeZUs/czS/Bi2ya89SyH8fuGuyBUDRXH4wGUKvGpDzd
 3KvwEY57TxIDoaLzuYujeIueD8SUF13nI9uIG7V0+eWwAi3OSTf3GKtYrbG7TfTsL7G1
 a1cBUjw9W6Ps0L2/d2oU3xWqA0wmXbRpJW7o4a0CQgAZBHv4gZ7zBnJKKXuM4vj8EDdk
 c3Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsMv1b0UnMqWSpDczrV6jO5CnicefkIjlPo661q2mDgSwDszVrbG9TBetywez3r23u3kT2LdnlXg==@nongnu.org
X-Gm-Message-State: AOJu0YwnuHVEyNff3SVB7K/PLBR6NO2NpY3xMNVMtl1r3Kirb3cZQcY5
 3ZpcJMMBA4nj2nkFVH4N1pQxcGRZTVqUkoMJK6uzzJr2geOjydbDnCSxv0pOci4=
X-Received: by 2002:a05:6512:ad1:b0:52e:9f76:53dc with SMTP id
 2adb3069b0e04-53546a59f62mr6619177e87.0.1725277790944; 
 Mon, 02 Sep 2024 04:49:50 -0700 (PDT)
Received: from [192.168.200.25] (83.11.24.101.ipv4.supernova.orange.pl.
 [83.11.24.101]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540828d77sm1609267e87.180.2024.09.02.04.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 04:49:50 -0700 (PDT)
Message-ID: <d457014f-104a-4fe3-8896-d22425a007e8@linaro.org>
Date: Mon, 2 Sep 2024 13:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Specifying cache topology on ARM
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20240823125446.721-1-alireza.sanaee@huawei.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20240823125446.721-1-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: VRK202EpQd+L

On 23.08.2024 14:54, Alireza Sanaee via wrote:

> Failure cases:
>      1) there are cases where QEMU might not have any clusters selected in the
>      -smp option, while user specifies caches to be shared at cluster level. In
>      this situations, qemu returns error.
> 
>      2) There are other scenarios where caches exist in systems' registers but
>      not left unspecified by users. In this case qemu returns failure.

Sockets, clusters, cores, threads. And then caches. Sounds like more fun
than it is already.

IIRC Arm hardware can have up to 16 cores per cluster (virt uses 16,
sbsa-ref uses 8) as this is GIC limitation.

I have a script to visualize Arm topology:

https://github.com/hrw/sbsa-ref-status/blob/main/parse-pptt-log.py

It uses 'EFIShell> acpiview -s PPTT' output and gives something like this:

-smp 24,sockets=1,clusters=2,cores=3,threads=4
socket:        offset: 0x24 parent: 0x0
   cluster:     offset: 0x38 parent: 0x24
     core:      offset: 0x4C parent: 0x38 cpuId: 0x0 L1i: 0x68 L1d: 0x84
       cache:   offset: 0x68 cacheId: 1 size: 0x10000 next: 0xA0
       cache:   offset: 0x84 cacheId: 2 size: 0x10000 next: 0xA0
       cache:   offset: 0xA0 cacheId: 3 size: 0x80000
       thread:  offset: 0xBC parent: 0x4C cpuId: 0x0
       thread:  offset: 0xD0 parent: 0x4C cpuId: 0x1
       thread:  offset: 0xE4 parent: 0x4C cpuId: 0x2
       thread:  offset: 0xF8 parent: 0x4C cpuId: 0x3
     core:      offset: 0x10C parent: 0x38 cpuId: 0x0 L1i: 0x128 L1d: 0x144
       cache:   offset: 0x128 cacheId: 4 size: 0x10000 next: 0x160
       cache:   offset: 0x144 cacheId: 5 size: 0x10000 next: 0x160
       cache:   offset: 0x160 cacheId: 6 size: 0x80000
       thread:  offset: 0x17C parent: 0x10C cpuId: 0x4
       thread:  offset: 0x190 parent: 0x10C cpuId: 0x5
       thread:  offset: 0x1A4 parent: 0x10C cpuId: 0x6
       thread:  offset: 0x1B8 parent: 0x10C cpuId: 0x7
     core:      offset: 0x1CC parent: 0x38 cpuId: 0x0 L1i: 0x1E8 L1d: 0x204
       cache:   offset: 0x1E8 cacheId: 7 size: 0x10000 next: 0x220
       cache:   offset: 0x204 cacheId: 8 size: 0x10000 next: 0x220
       cache:   offset: 0x220 cacheId: 9 size: 0x80000
       thread:  offset: 0x23C parent: 0x1CC cpuId: 0x8
       thread:  offset: 0x250 parent: 0x1CC cpuId: 0x9
       thread:  offset: 0x264 parent: 0x1CC cpuId: 0xA
       thread:  offset: 0x278 parent: 0x1CC cpuId: 0xB
   cluster:     offset: 0x28C parent: 0x24
     core:      offset: 0x2A0 parent: 0x28C cpuId: 0x0 L1i: 0x2BC L1d: 0x2D8
       cache:   offset: 0x2BC cacheId: 10 size: 0x10000 next: 0x2F4
       cache:   offset: 0x2D8 cacheId: 11 size: 0x10000 next: 0x2F4
       cache:   offset: 0x2F4 cacheId: 12 size: 0x80000
       thread:  offset: 0x310 parent: 0x2A0 cpuId: 0xC
       thread:  offset: 0x324 parent: 0x2A0 cpuId: 0xD
       thread:  offset: 0x338 parent: 0x2A0 cpuId: 0xE
       thread:  offset: 0x34C parent: 0x2A0 cpuId: 0xF
     core:      offset: 0x360 parent: 0x28C cpuId: 0x0 L1i: 0x37C L1d: 0x398
       cache:   offset: 0x37C cacheId: 13 size: 0x10000 next: 0x3B4
       cache:   offset: 0x398 cacheId: 14 size: 0x10000 next: 0x3B4
       cache:   offset: 0x3B4 cacheId: 15 size: 0x80000
       thread:  offset: 0x3D0 parent: 0x360 cpuId: 0x10
       thread:  offset: 0x3E4 parent: 0x360 cpuId: 0x11
       thread:  offset: 0x3F8 parent: 0x360 cpuId: 0x12
       thread:  offset: 0x40C parent: 0x360 cpuId: 0x13
     core:      offset: 0x420 parent: 0x28C cpuId: 0x0 L1i: 0x43C L1d: 0x458
       cache:   offset: 0x43C cacheId: 16 size: 0x10000 next: 0x474
       cache:   offset: 0x458 cacheId: 17 size: 0x10000 next: 0x474
       cache:   offset: 0x474 cacheId: 18 size: 0x80000
       thread:  offset: 0x490 parent: 0x420 cpuId: 0x14
       thread:  offset: 0x4A4 parent: 0x420 cpuId: 0x15
       thread:  offset: 0x4B8 parent: 0x420 cpuId: 0x16
       thread:  offset: 0x4CC parent: 0x420 cpuId: 0x17

You may find it useful. I tested it only with cache at either core or
cluster level.
