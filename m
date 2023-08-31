Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4990914ejc;
        Thu, 31 Aug 2023 03:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEwi1boZ3SfkvMmA60q6uOKRrtgZkNWQs0MvzZd3Axo+r8hR3LLfMoxvmczuPfEKSHR1IV
X-Received: by 2002:a0c:da93:0:b0:651:7997:230b with SMTP id z19-20020a0cda93000000b006517997230bmr2547453qvj.26.1693478937867;
        Thu, 31 Aug 2023 03:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693478937; cv=none;
        d=google.com; s=arc-20160816;
        b=ONJdYTrL1CcvilNvennrzSKNf6DnozQm79DLVKmUHAMoT1HdG2lg+8QYqy967QPTLU
         ljR0jxTBbUSOau+v8n6n8DscU31ckl3pAqzmf1cQUyPm8ACZse+Wwe+o6nMyxp69qJ6t
         rBSblsqiXt+Ap8QyMugeA7+jnz29bMwLePfU3z23DDoU10RxKcTYB2iA5zi5vK5YsAuJ
         LxKJci0aQ/zZM6m9c12r61h744iz27Lc2gLDZy6nlIqiQnC+wqLcvBJF+FTe7FkPqoBE
         jY8xl8sLPi7K6l+IW45DVA5t7hRHqaDQd/kE9aCHS7mhgn3ziYNaWrnox2TxPmnHn4t9
         d7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VhDkEgN2IlfKuEoOWYouw6z+bUytQcoqFCx/xnn/WOc=;
        fh=FugNAZpRAZKAQAd248OadLqs85B6NcaBTaYX+XzDZGo=;
        b=evu13dX6A3AOrANQEHECc+CAKLs5EkOFUKrjbdyihnOUkXF6Cy2vu5YuHHSM6blAE/
         w8zqxh+zamhnWa5mR5m7wLi2TNcOXg758hT2utUTFBaBKbE0O3beXXQZ5XO4IETdVk9s
         kh2d1vaiHscfkOyQDb/URUTnNT+I8abgIpBV8PSScSj1IBVdECX9m3SGSAkU0y2ft1XG
         7ac05RPbXAMpsKF0rQMljc8zcN40EjH2P6LLosBcqUmHjYVmixstePv48mY+Rb7crWfZ
         hYMEh3dsZSU0HRKIaDD4JO6f61CFLf0I9IBnyJF+pFznwDL/Y18izmAT7ENmruTZGpE8
         Auzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NDGrr1cw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020a0cab52000000b006516123866bsi672835qvb.168.2023.08.31.03.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 03:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NDGrr1cw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbfBW-0004WV-Sm; Thu, 31 Aug 2023 06:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qbfBT-0004Fh-3O
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 06:45:56 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qbfBP-0004B3-9c
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 06:45:53 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so525872a12.1
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693478749; x=1694083549;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VhDkEgN2IlfKuEoOWYouw6z+bUytQcoqFCx/xnn/WOc=;
 b=NDGrr1cwiN+gLjQcdZqfCUYMnNzBzww27AbnN+9uGVSFlnDuUteHInJUFuVfpJjWpc
 9zQsuxwmmNq2mt5VEqUT/HQVwQgq3YvwUotrNRngbxgdas11lMoIfbYT/GgIdsXdTXh8
 dGfGXZ8unLrlpsrQKVFQOlK/JpCJUymPlu81JGh8JtBhNkAccKOsiA80F0FnQfIWSSD5
 kCzS9Hwuqe78rCZdFBk1Ge6Z7sqD0bq28AFGDvlH8p866OxJgJQbH3nzoHpxmxxA/dxy
 NgRnI1D/ZfjGMdiZHT+VLYC6XMEmZDDyzHwWRt177eh7FHboqHCEMjJ+mz4fVfCcdpio
 l0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693478749; x=1694083549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhDkEgN2IlfKuEoOWYouw6z+bUytQcoqFCx/xnn/WOc=;
 b=aTFa1MwUO/ayWKMRM9GePREatyFi8yA5GKGr1btKvR++DzUVF5fZMmvCgEs6a9yz19
 64/jl1EdCCAeM0HJ1x4ojONeIgI3bIx3ewwKKREokfn2Yc6bCPObIrtFTcDDjyZY6lqx
 3G+e9Lsw63F8qODKGFW3oROyK1vsHiqW6QbEZoUcft1FHqJpK+yQb6ZYUiRFe2QcQBS/
 +muiF28rbbhZA4iImoIrz/PkniM4hjegqQEwWAd00uKA7FaSjbTXjUFeGfvhuZoVJ/vF
 2Gw43rNnO501/eK9IplIh6F+UZS8l5bXWWYwjeOjVBuoEnpjGE5AIopPmDMisVcwFFqW
 xSAA==
X-Gm-Message-State: AOJu0YwciXS2sqXvl0DpSXgSuCCU1rrUqq9seI8A4MJGkk8ZmhTHotIp
 Zo8usH/ncWU1IrumWI3dKBorgA==
X-Received: by 2002:a05:6a20:44c:b0:14c:daa9:5e22 with SMTP id
 b12-20020a056a20044c00b0014cdaa95e22mr4058925pzb.45.1693478749545; 
 Thu, 31 Aug 2023 03:45:49 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a62b611000000b0066a2e8431a0sm1060679pff.183.2023.08.31.03.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 03:45:49 -0700 (PDT)
Message-ID: <bb17db0b-69d5-4d53-b93b-e1984bf7ca1b@daynix.com>
Date: Thu, 31 Aug 2023 19:45:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] build: Only define OS_OBJECT_USE_OBJC with gcc
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230830161425.91946-1-graf@amazon.com>
 <20230830161425.91946-2-graf@amazon.com>
 <996b4057-6d64-3803-792b-f6c49dd9f3bf@linaro.org>
 <c933da5b-92fe-47f6-ade1-9c1e2770aa23@daynix.com>
 <6e98c4e8-89ea-4fd1-a6cf-e9cdcf043482@amazon.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <6e98c4e8-89ea-4fd1-a6cf-e9cdcf043482@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cAS4pC9++vT+

On 2023/08/31 17:59, Alexander Graf wrote:
> 
> On 31.08.23 10:53, Akihiko Odaki wrote:
>>
>>
>> On 2023/08/31 17:12, Philippe Mathieu-Daudé wrote:
>>> On 30/8/23 18:14, Alexander Graf wrote:
>>>> Recent versions of macOS use clang instead of gcc. The 
>>>> OS_OBJECT_USE_OBJC
>>>> define is only necessary when building with gcc. Let's not define it 
>>>> when
>>>> building with clang.
>>>>
>>>> With this patch, I can successfully include GCD headers in QEMU when
>>>> building with clang.
>>>>
>>>> Signed-off-by: Alexander Graf <graf@amazon.com>
>>>> ---
>>>>   meson.build | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 98e68ef0b1..0d6a0015a1 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -224,7 +224,9 @@ qemu_ldflags = []
>>>>   if targetos == 'darwin'
>>>>     # Disable attempts to use ObjectiveC features in os/object.h since
>>>> they
>>>>     # won't work when we're compiling with gcc as a C compiler.
>>>> -  qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
>>>> +  if compiler.get_id() == 'gcc'
>>>> +    qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
>>>> +  endif
>>>>   elif targetos == 'solaris'
>>>>     # needed for CMSG_ macros in sys/socket.h
>>>>     qemu_common_flags += '-D_XOPEN_SOURCE=600'
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>
>> Defining OS_OBJECT_USE_OBJC does not look like a proper solution.
>> Looking at os/object.h, it seems OS_OBJECT_USE_OBJC is defined as 0 when:
>> !defined(OS_OBJECT_HAVE_OBJC_SUPPORT) && (!defined(__OBJC__) ||
>> defined(__OBJC_GC__))
>>
>> This means OS_OBJECT_USE_OBJC is always 0 if Objective-C is disabled. I
>> also confirmed os/object.h will not use Objective-C features when
>> compiled as C code on clang with the following command:
>>
>> clang -E -x -c - <<EOF
>> #include <os/object.h>
>> EOF
>>
>> If compilation fails with GCC when not defining OS_OBJECT_USE_OBJC, it
>> probably means GCC incorrectly treats C code as Objective-C and that is
>> the problem we should solve. I cannot confirm this theory however since
>> I have only an Apple Silicon Mac that is incompatible with GCC.
> 
> 
> My take on this was to make the gcc hack be a "legacy" thing that we put 
> into its own corner, so that in a few years we can just drop it 
> altogether. I don't really think it's worth wasting much time on this 
> workaround and its potential compatibility with old macOS versions.

That makes sense.

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
