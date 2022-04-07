Received: by 2002:ac2:5de3:0:0:0:0:0 with SMTP id z3csp15997lfq;
        Thu, 7 Apr 2022 01:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2Ul7ZLBfUBSLigd+yV7ZJHlC3gaMM4A6hdJ+sVHVbM3aix4v+B13djXwTLmE03BYsCal8
X-Received: by 2002:a17:907:7f0b:b0:6e0:a336:a3f5 with SMTP id qf11-20020a1709077f0b00b006e0a336a3f5mr11418777ejc.541.1649320579053;
        Thu, 07 Apr 2022 01:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649320579; cv=none;
        d=google.com; s=arc-20160816;
        b=Cq45J0bihohpRvqmh5T18xutND4Y8oI1iI+Kskuj2zG3om59CH3jTIcJVhk+mX+mEz
         JIhEf3/q6+tXqiXgzfm0Us6kbS5dBmkEWZo/dNJuLMPLA0DKwI3i/j+b/KfGg2qc6mfs
         GlAzYH5fn47+dot65Amah4R8sVW+6n5fk36+V4jPizQyJgp0GUR5H/jj/jj0CutPLkSU
         QTsjFXOioRxFj2zqj2OsQRY1/tnkSkUaEVnWqmpW0Ngsg23Y/8GtrF1IgijurJqP9m+1
         hptNnsulS5/rlZuqVNneWjhPWi0JD4+oPTZAbegBATf3eeC/ZCZ43CV//2Fer03U/lRu
         zsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:reply-to
         :dkim-signature;
        bh=XdyZuAV21LEGWhQggj68jETHCga3RPCveWRii1PvJOI=;
        b=JH3oGlg8Gyoo9ddmtuBezLtQm7AL7sN6LVXUdLuX9nRapaMKaIZTNpi37Bj9HcWvLL
         raijtFn7isqvHV7Xi5WKL/RQ+eU9Qy4SFJhvLCNj3RXHjtwuwaznyFHG98m/jygzcOxs
         gwdXIeP2h+lktzqaOAMExUiA5H9vBhlkOEMURMNqdFNPTYtck8L32axYNEL/uAN0Zrdy
         M/mxe8WvzRiRGyqQ1mSYSRUHasiiEH7ksOuzzZHCp+5/IiT8WL3DnaZ4EmGqyKTVuCz1
         Nkuy1yuycQ3VFwBiozOWljNfpdu48uOLJFIuhFX+TE2Nt3reD3IoLLUgluA5tSJ1Uzz5
         Nqww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FxFUmmfO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h1-20020a50cf81000000b0041b7bd52e54si13250093edk.294.2022.04.07.01.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FxFUmmfO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649320578;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdyZuAV21LEGWhQggj68jETHCga3RPCveWRii1PvJOI=;
	b=FxFUmmfOPv8JvVOTO9rsCUppD96TyrqdKLqIx96GmZ5XAS+qMz2SC4S4mjXU2Gw6IWsim6
	tqs8HxenY9DAavsFRpencda33Q2uOBf8mxAnZ72ZzdxX2bkZAKnL2ed/OA2+wsQn/9QoM8
	oc88tKa9l64RcgHv49m1QK2MNBK9U4A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-VVgRwBLKN5Cg_xoZ5yTHpw-1; Thu, 07 Apr 2022 04:36:16 -0400
X-MC-Unique: VVgRwBLKN5Cg_xoZ5yTHpw-1
Received: by mail-wm1-f70.google.com with SMTP id l19-20020a05600c1d1300b0038e736f98faso1282418wms.4
        for <alex.bennee@linaro.org>; Thu, 07 Apr 2022 01:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=XdyZuAV21LEGWhQggj68jETHCga3RPCveWRii1PvJOI=;
        b=NXAOcaXwf4IRjasCaIrq51KyxMVgZozeqJjk1ltj66ThwH0aqHsIZtZnbDWHny00mb
         xgEAeA10Xy9WG3PZazT/tMG+v5jQ1tgm/sJo3vOVoduAzLeNEgUF4fM/rIhJgyPEZ3WG
         HKLlvgmX982Q1hEtJaMiKPM2BvMzlGySIuHMlzUB0oFsnSoxWqLSD8D2QtB8oZr16+xI
         h4b6PaQwYszeJNI47Ox+ji2fbbqOorqpJhCQ/ucVHxdYKK7NpNl/hsLlhkgwMyrCKTPQ
         fnETf+NKgscDWk4o0+0fbm6Kfu77V4uMzVU5WYqnmBxdC0GHXXcvhs+IE7Oz5IOvN4ll
         tUPA==
X-Gm-Message-State: AOAM532O7/zpe7VQZ6oSKkWRZGB0d+s+OEn7QOfWlHBsesYBRCOXUALi
	g3E4L5Xc0FlUmrYxdZCvRjdRN77QttTUKIvpCs6jmcA0Re1Hz9eaS+XA2or51dzpwexJmipTmGZ
	tdb8ACGROEovRCb+q
X-Received: by 2002:adf:e70d:0:b0:207:8c1b:b758 with SMTP id c13-20020adfe70d000000b002078c1bb758mr863113wrm.19.1649320575742;
        Thu, 07 Apr 2022 01:36:15 -0700 (PDT)
X-Received: by 2002:adf:e70d:0:b0:207:8c1b:b758 with SMTP id c13-20020adfe70d000000b002078c1bb758mr863097wrm.19.1649320575562;
        Thu, 07 Apr 2022 01:36:15 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id o8-20020a5d6488000000b002051f1028f6sm19466031wri.111.2022.04.07.01.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:36:15 -0700 (PDT)
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 4/5] tests/qtest/vhost-user-blk-test: Temporary hack to
 get tests passing on aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com, stefanha@redhat.com,
 jean-philippe@linaro.org
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-5-eric.auger@redhat.com> <871qyajetd.fsf@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7e297db9-7935-4a0d-9109-c0203ee1be5c@redhat.com>
Date: Thu, 7 Apr 2022 10:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <871qyajetd.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: N+VeXiWSWaTg

Hi Alex,

On 4/6/22 7:34 PM, Alex Bennée wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> When run on ARM, basic and indirect tests currently fail with the
>> following error:
>>
>> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
>> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
>> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>>
>> I noticed it worked when I set up MSI and I further reduced the
>> code to a simple guest_alloc() that removes the error. At the moment
>> I am not able to identify where ths issue is and this blocks the
>> whole pci/aarch64 enablement.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Hi Eric,
>
> I sent a RFC patch which I think avoids the need for this hack:
>
>   Subject: [RFC PATCH] tests/qtest: properly initialise the vring used idx
>   Date: Wed,  6 Apr 2022 18:33:56 +0100
>   Message-Id: <20220406173356.1891500-1-alex.bennee@linaro.org>
>
Indeed this fixes my issue! Many thanks for the debug & fix.

I will respin with your R-b's.

Eric
