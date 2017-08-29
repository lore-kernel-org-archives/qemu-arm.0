Received: by 10.223.188.70 with SMTP id a6csp6190138wrh;
        Tue, 29 Aug 2017 09:23:37 -0700 (PDT)
X-Received: by 10.36.188.1 with SMTP id n1mr3484781ite.156.1504023817024;
        Tue, 29 Aug 2017 09:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023817; cv=none;
        d=google.com; s=arc-20160816;
        b=RyXkQL1prVTAYbxTxA9Mt1HKkfPXVKt5ErgBC17mgppoKntch1eYEMoALQD3dmM8Wj
         m3B1ULKt2dK5IQLkSTjfe764pUneLaWVQ67uvAuhiSBTORXy3j8KKE5IRbToZtks1wJN
         ZdduHGElAoX2DyYBqL1aBOWKQIC8TjBuMS2TpgmOMKl+aMilpkPwbvNNpe+/+HTuK1Ab
         4XWZiLWNqVNiwJVbehHlsH4/KFvBH+FuswqU3tL2UDRVoSi4c844iBMcxAPnPVyCBq4A
         QKwUDMyD2U9yoHgYvRCmpotx5XgNsM/52XZrzdqbejlNw/m2eOwT61JEwMZX3jbfuD/J
         sk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=HnEhVX+CaccwHelxmc9rI/oYb9aI6gtC5xOmbl5wEQI=;
        b=UlJvo/6d3rlSbWFtiTxtkI9vRpn4YZBvQLt6rgM4ZeSRVb3vB+BU36h2c5UR+DhIKo
         Jg75VDunPE8Ung0UpnN4t7QD35bQAiDUm+sALm/J8AlGNwQiulvJLTKe769W0/+MEFSG
         DVy2omxl9jcsJxrSaG2p8W877dfgJh3+svI9bCP0jlDy3+i7NRANtCI5c/BjuNNybpgT
         r9VpcnGUj+eGB9Nh2ASh5QD3lU7oHkuVDoQPms7aFxfskcWDp7TGqaN9kY7eIK4LSksC
         EuWBLOAM1AG+I+/GWKoO6LGCHxVL1BbA82ZRad3z7N7d4kkatiiWQ6NleXhBAcW5G8/2
         UctA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nraI+4jn;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 89sor1587939ioi.0.2017.08.29.09.23.36
        (Google Transport Security);
        Tue, 29 Aug 2017 09:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nraI+4jn;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=HnEhVX+CaccwHelxmc9rI/oYb9aI6gtC5xOmbl5wEQI=;
        b=nraI+4jnHMFkVfhUTF4jIfx+pf0xoaVN9qFTIbBuw/QLM5NISof6zv33UR0hHbUVAx
         WjlesO7lf/YwlNQUuPui/BC2dbDQfI+woYroNqSsbqARY4dR3Z8IaQnxq32vrwkk4VcL
         Qka5k0jhjgPOYPuO0CrrGQF7Z27K1SAJ+37viXyhxd1+M46FNbckG/cdgEdfKUD9TO1h
         cLkgvuULahS/TIzcnbKX2fZqyw5i046D9PZyPODRDi/9ok6l+dDDQnW+LbaJcTxKl+ml
         hxWf1d//JY0jzqUq9C17MgLpJ/4S/ISGvX8yoaKdVpUTe7BBk2ONg6bOwL2c/MAzpgJR
         olIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=HnEhVX+CaccwHelxmc9rI/oYb9aI6gtC5xOmbl5wEQI=;
        b=hR2EUstibR1jrQGJ+7Xz9kwebD68Agkn8QE78qB2i14WRyaDSlRnjnO6hmPphpg7vm
         InC0IpHJ9GTtK/XsaOmFAop6O0kzXxcHC6BBJth57GthsJkcw8hZ5SgywgZSHTsi56oZ
         qQrnlMLoZYSn7863IoLK94PxhJf9kY42//hZuc/KD/n7rUUqxU5Eee2SBy1nk11mTnsk
         0IGDU599ywIbtWzpH4IfSzLvIywcgiiFC+S37XetWs/322pcNRwQFLxSKk7ZpGaXIEw+
         9cKFg+dzUPXBkg3Su1uETjyQMB4LWtOpiWRxNsxg401t/raPmKqxCw66hZSpwTDVFNTk
         WgGA==
X-Gm-Message-State: AHYfb5hiC/BtX8NP6ui08vPrDSDKVH3wzJWQegy2vcbsYPnIH2XVnsM7
	tCXY046I9IUHB89coTsnrI5PsvK7tT6dFPo=
X-Received: by 10.107.129.11 with SMTP id c11mr4464867iod.17.1504023816354;
 Tue, 29 Aug 2017 09:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.166.2 with HTTP; Tue, 29 Aug 2017 09:23:05 -0700 (PDT)
In-Reply-To: <3148d084-9bff-2d8e-f1a7-fba94a1e7f87@linaro.org>
References: <20170829063313.10237-1-bobby.prani@gmail.com> <20170829063313.10237-5-bobby.prani@gmail.com>
 <3148d084-9bff-2d8e-f1a7-fba94a1e7f87@linaro.org>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Tue, 29 Aug 2017 12:23:05 -0400
Message-ID: <CAJhHMCCgYRTc6yyPkYowV=ie4ZxdFzDEFupUv5EVjbgOzXi_QA@mail.gmail.com>
Subject: Re: [RFC v3 PATCH 5/5] tcg/softmmu: Increase size of TLB caches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Claudio Fontana <claudio.fontana@huawei.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>, 
	"open list:Overall" <qemu-devel@nongnu.org>, "open list:AArch64 target" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: VG/4tgwG5E+Q

On Tue, Aug 29, 2017 at 11:01 AM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/28/2017 11:33 PM, Pranith Kumar wrote:
>> + * TODO: rewrite this comment
>>   */
>> -#define CPU_TLB_BITS                                             \
>> -    MIN(8,                                                       \
>> -        TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -  \
>> -        (NB_MMU_MODES <= 1 ? 0 :                                 \
>> -         NB_MMU_MODES <= 2 ? 1 :                                 \
>> -         NB_MMU_MODES <= 4 ? 2 :                                 \
>> -         NB_MMU_MODES <= 8 ? 3 : 4))
>> +#define CPU_TLB_BITS MIN(12, TCG_TARGET_TLB_MAX_INDEX_BITS)
>>
>
> Ah, no.  This will cause several builds to fail.
> You still need to restrict the *total* size of
> the TLB to TCG_TARGET_TLB_DISPLACEMENT_BITS.
>
> (That's not a 100% accurate statement, but is close.
> See the QEMU_BUILD_BUG_ON in tcg/*/*.c for specifics.)
>
> The upshot is that if a target has 2 MMU modes,
> we can allow them to be bigger.  But if it has 8,
> we have to make them smaller.
>
> I was expecting you to write
>
>   MIN(MIN(12, TCG_TARGET_TLB_MAX_INDEX_BITS)
>       TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -
>       ...)

I see what you mean. I will fix the blunder and send an updated patch.

Thanks!
-- 
Pranith
