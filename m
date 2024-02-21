Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1997659ejb;
        Wed, 21 Feb 2024 07:42:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVH6PFwf15N0KIfJLFCd4/4Ll8j569Dnlr1LMeJP581lecxcbXxCycxWD8VlZqzp9iWzRr8eWDWPIUf29P6R1Pr0WNhK+UV
X-Google-Smtp-Source: AGHT+IEwpTawaZmjSYewmmkthARiWhR55aTiAL+79Ic5YnM00NCFAhsCd0LslypXArvu4dZeLyog
X-Received: by 2002:a0d:cdc2:0:b0:604:1917:369 with SMTP id p185-20020a0dcdc2000000b0060419170369mr18978067ywd.27.1708530147650;
        Wed, 21 Feb 2024 07:42:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708530147; cv=none;
        d=google.com; s=arc-20160816;
        b=gDJjavPkOI7f6Kb93Sg4qknAsb/hhAmB8fusV/Yvs9wNaYG/yvp8booUV1hPw2J0Uo
         LIYQaIOESM2Me9XGGpoR9jXJxpHCS65K9VKz8erHAjpenpGTWcuvBbTS3cjDq6EyJs4P
         Mfb0xkjI9XAMtGLfxRNeWCM2PAjZsj8gbQtf1yuFsZYhxTkC4/QJxJfzkXYFcff/oKwN
         vHQ+230oaav/EBSnIHyanmUzW98aOeA0ZOCOIzsV8C0aCl2GnwL9hrZcgYnhTj3Z1QIF
         vHi3ZE/cANN6x7ObWNuDdFsHsV1mmaYzUyYQplp7lFldwsieYjvAdGUI0TeBeW1OuKH9
         x2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h0rMCtexgvyL/jrBXkcmUZwK4PEevrktJT3ywti7/q4=;
        fh=3rQwW+BL4fsHpPoHeZ75gIP3rqCYji/K6cMuiFjKVtE=;
        b=0nBxKXwbmdbTiUmZNeUbqWJWvj9bfOdlEobi/EfDXXG1DnvZuJfNSt/1QnjzO9NL2G
         TvvJTa6EWTvZusG7ggMUsSMP9tr70CxjCY16L50du8u0cZtpFUqken2KT6Ft4w4cyHfV
         UkQ6GwQfzFlQv/HSClF2SZlNT4Mi/mxvcMEzh5hq8/FgV8tdId6fDBVX1o4J4UsIbN+2
         Co+n7A9GACcWGz6JYd7bAA7OrtvBuq6i2Cxt7n0uCNXPNi7qZJTrYhbooSHssoM6arAm
         0JHritvGUqGYKcYO4eCTI9V1nuuPlVKmKKyqBpg7/Qtgz4hILDu//xfkrljyAMipxDTh
         3JGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BCA06NPE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05620a07e500b007876f28e153si5449482qkk.286.2024.02.21.07.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:42:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BCA06NPE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoaq-0001zW-Tn; Wed, 21 Feb 2024 10:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rcoUB-0001Tv-Fs
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 10:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rclyu-0000kK-Qt
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 07:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708519547;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0rMCtexgvyL/jrBXkcmUZwK4PEevrktJT3ywti7/q4=;
 b=BCA06NPEI9JVix6rn4GWN8pv5Fr5O73YgYB7QQhd0z0Xl62dBoqxVbyHkYxq1dE1cU+mFG
 27jwyxCRqfTYjHDzU3YWpPgmtFAoZrLfwAJGVg3btyYZuSc6vPZFatUuW4gl3h3gaYUWji
 zsXqdWs7npn2qlhaaFujy415nPMaEPE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256--fPcTzcnPR2y5qnFfncGUQ-1; Wed, 21 Feb 2024 07:45:46 -0500
X-MC-Unique: -fPcTzcnPR2y5qnFfncGUQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68f9bc8a192so13405616d6.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 04:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708519546; x=1709124346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h0rMCtexgvyL/jrBXkcmUZwK4PEevrktJT3ywti7/q4=;
 b=qZTShrnZdIyBe0cEj6DT4iAG7o85jcoMLJHBtyDgFCb/iWuWm2phAtqwJY6f7UTJEZ
 JXC3+BPoAz8M2+tR5JAWt8XcP8HQ8GWVhATANHJrphao8lvY7YHjWmsaUl5Xb+MZqaUo
 yPKpXV+VvMwNj9lCA2ma+zqLMv9TPRMFn0CoI+lHfpV+ip9zdVnYNdFmjyoVpLASGci2
 iy5Beblms7t+WB/GJ8RxgmI9PusokRSxybDPppTqtKoflchOJALuvOhUeFz0htcTmf2N
 tdqsoj3mjovE9vlF+scZQW7cN8n8VpyDGgYw4OiDsDA3TYsVKYvpudUcwbGikD8kKlz3
 sR3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrXVyoVBRMsqbF7p0ZYmPYnZ6baSorCjFbqMwu58h9yFXM5ZS0Gu3mmhev5XMlicCYU4JWE1eoc7k1+wvO+GXvHkWM
X-Gm-Message-State: AOJu0YxqlalOxkUkr5lZvJFcq42rj15oN8Tx1aAqL7XTwbYv2X2RxRFM
 uoxXDewy9reYBozzEccUMp56feAmcdagSXNooh6+quphaTiONCvBsT4UQUeAcwktIBlN//F2Z2h
 TZVVJXmy7c6J/9vDsBcNZet8t0Hj3dZqphoBbw5RfJKa5FnLovA==
X-Received: by 2002:a0c:f084:0:b0:68f:a250:7a07 with SMTP id
 g4-20020a0cf084000000b0068fa2507a07mr1767880qvk.19.1708519545943; 
 Wed, 21 Feb 2024 04:45:45 -0800 (PST)
X-Received: by 2002:a0c:f084:0:b0:68f:a250:7a07 with SMTP id
 g4-20020a0cf084000000b0068fa2507a07mr1767863qvk.19.1708519545642; 
 Wed, 21 Feb 2024 04:45:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ng9-20020a0562143bc900b0068f455083fbsm5130548qvb.63.2024.02.21.04.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 04:45:45 -0800 (PST)
Message-ID: <fa751e58-0b98-4b86-900d-83b128d1c829@redhat.com>
Date: Wed, 21 Feb 2024 13:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 clg@redhat.com, peter.maydell@linaro.org, Peter Xu <peterx@redhat.com>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
 <20240213060731-mutt-send-email-mst@kernel.org>
 <417ea71e-fb45-4e1d-b8e5-9d54d93dba3b@redhat.com>
 <20240213064017-mutt-send-email-mst@kernel.org>
 <8c0f6a91-7ae2-46c6-a8ad-18ca096a6115@redhat.com>
 <20240221113106.GA4121556@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240221113106.GA4121556@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qS6zkqcnhdaE



On 2/21/24 12:31, Jean-Philippe Brucker wrote:
> On Wed, Feb 21, 2024 at 11:41:57AM +0100, Eric Auger wrote:
>> Hi,
>>
>> On 2/13/24 13:00, Michael S. Tsirkin wrote:
>>> On Tue, Feb 13, 2024 at 12:24:22PM +0100, Eric Auger wrote:
>>>> Hi Michael,
>>>> On 2/13/24 12:09, Michael S. Tsirkin wrote:
>>>>> On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
>>>>>> Do you have an other concern?
>>>>> I also worry a bit about migrating between hosts with different
>>>>> page sizes. Not with kvm I am guessing but with tcg it does work I think?
>>>> I have never tried but is it a valid use case? Adding Peter in CC.
>>>>> Is this just for vfio and vdpa? Can we limit this to these setups
>>>>> maybe?
>>>> I am afraid we know the actual use case too later. If the VFIO device is
>>>> hotplugged we have started working with 4kB granule.
>>>>
>>>> The other way is to introduce a min_granule option as done for aw-bits.
>>>> But it is heavier.
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>> Let's say, if you are changing the default then we definitely want
>>> a way to get the cmpatible behaviour for tcg.
>>> So the compat machinery should be user-accessible too and documented.
>> I guess I need to add a new option to guarantee the machine compat.
>>
>> I was thinking about an enum GranuleMode property taking the following
>> values, 4KB, 64KB, host
>> Jean, do you think there is a rationale offering something richer?
> 16KB seems to be gaining popularity, we should include that (I think it's
> the only granule supported by Apple IOMMU?). Hopefully that will be
> enough.
thank you for your prompt reply. I do agree.

nevertheless I am going to prototype passing the whole page size mask I
think. That could be useful to test some weird configs

Thanks

Eric
>
> Thanks,
> Jean
>
>> Obviously being able to set the exact page_size_mask + host mode would
>> be better but this does not really fit into any std property type.
>>
>> Thanks
>>
>> Eric

