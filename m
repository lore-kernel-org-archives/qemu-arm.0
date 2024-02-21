Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1993643ejb;
        Wed, 21 Feb 2024 07:35:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXz6vVHPFW5QDaLvQhNOGANP+5i8GQktsZFqIc41qxQ+CtkNSqEt2LkADHc4exQsKk5qkfH4rolE8oDtpPpfCeS7QtwOy9Y
X-Google-Smtp-Source: AGHT+IGYq9rSAIAfCZcZlhJ2/52BpgTSu5Hc3+n4Liful/LMF8Iw0500UiITiXp077X4MyQFAjgR
X-Received: by 2002:a05:6214:1249:b0:68d:1d9:2be8 with SMTP id r9-20020a056214124900b0068d01d92be8mr25539857qvv.51.1708529713350;
        Wed, 21 Feb 2024 07:35:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529713; cv=none;
        d=google.com; s=arc-20160816;
        b=RKmOKS7zStund+vk2fpMiA6p5qvJwLf3zCZn5ZVNtpDD20pHn/gzH/qHpbE9e4FMiB
         yYPVsT0H1KLvhgLEBMly4B8k4XZZXuFtkvkPc4/zJObvlQmxZ3meYUXIMSvIzrvnC0BN
         Vwj7H/rQmK/RwgNf/sUgq4Fv8u+QCxKWb/uF3uEP5Iz/svOVA6IyMN8rlGkWT5K1SKZx
         qo+pJbrSY41QAgOv3nNJiDfRXBvVlafRKuL0OddjcVcOZaV98e8bQar41LXoMwYVYcn4
         5sHeVCVrDiYDNYm/XpWleHSaVqH9z3NqngOuL+86Ay2qr3B2ZTDHi/yqANZf0wil7VN9
         G90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nsnmg5mi/lerDRFafL3w6XSxkCdhTGMidZW9pcicK2c=;
        fh=YMNmD06cT6N9ldlPbEZkzkuPCivnfl0qGI468za2X0I=;
        b=VixTE7C438o0DCZrcxpSb2djxMvDVKdB0OR3L1R8jvs4rx2Gd1KHUbh6TKdH7ze26N
         pLV59PoK38T+Q9eY/9xMabNWKjY9S9nbhBg7aiwiERnVpzHGFGHZj53ecI9Pk8E25fTq
         yHs92tK7ZGbYrR6o4TzCNlF21EwaeGWDpCgkkBE1XLOZ68ojl6Fj9Ox0m+1wd1adjksY
         iGyariNm1/9IWkOvojf/rjCosgXCUT3LrayniHEYo29M2xQumAvX5+aUIkfVQPXUMbbL
         yDczjqMWgzNgQ/Fq79XR8nDQxSmpXsQOdmBpfb1YHwtoiAZ0EXSbrk0HQnFPdmhdCclK
         GDtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNybrzs+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu15-20020ad45ccf000000b0068f765ab5c7si6277862qvb.292.2024.02.21.07.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:35:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNybrzs+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoQg-0001GS-Nc; Wed, 21 Feb 2024 10:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rcoM9-0000nB-4F
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 10:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rck3B-0006Nm-DT
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 05:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708512124;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nsnmg5mi/lerDRFafL3w6XSxkCdhTGMidZW9pcicK2c=;
 b=VNybrzs+7gZBVLakd9HYn+Ko27tLQUgf1cvOqqYcLwOt2HNfKBblrfODrmqC1bGZtc+L8Y
 xhEb4FsqOztnnLOdKHBFdNri7dUbMfB1WontyDfv6wJ5XYwEHRuiMwFzs8woB4QJZoF5vh
 kf8tnmGV52WVSRZ/23KfJ19NXc6n7ZM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-V622L1jNMMepAdBQsxieWw-1; Wed, 21 Feb 2024 05:42:01 -0500
X-MC-Unique: V622L1jNMMepAdBQsxieWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4125670e7d1so18584915e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 02:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708512120; x=1709116920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nsnmg5mi/lerDRFafL3w6XSxkCdhTGMidZW9pcicK2c=;
 b=PFumWRY6TwhEAaDRwLcJJKmbc/Ykv/QTMN1q/Kf03iyzuzMWisY5BUYNhnWotU+jF/
 9rbbNOTujCF0oLO4pPGCIsbiiuGC4+lgNCqu/Nq8pzN6LeqlvWDYAzyYqFPg7dk9Btih
 17vecFZsAThcX2MK8NgDsnqTBH9vvn7ggA/ZGKJAM7nakL2lmM5ESw0M5N4TQY+EMC07
 m//2ya03EhSR5NjzhzQMUh0lPp9eHPEhKGtLqzWuVlMyYIaHF47JMhGMCVAlFvEiwDxu
 W8FoURon4M73MMo7KFt5c/HuKXfUr5d/+hTuVm28kT3bwrwGAlK4vJMnVBjFF8WpGMo9
 PzmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY2NdFUigAAswQ/VWCfInyOpHPIEqn+LLxEOJI2EhHbHrZBHrdO24ifSuy/Fd9HqmQIo32mE3lhfv6iB6hhHANlzXR
X-Gm-Message-State: AOJu0YymwxnTeDZFuaka3sn7Lu9lPLBr4+gL91JhBlpj73/X+mIheQhw
 +so3ZCg5uZPJEygMGk+br51VFZR0kxolcRiq3Je/q94e4Ue3+TSk5w2TmiEY4Z0ADMK4AePxpTY
 i712gw9pMOFRYWC8fDjFXDGlv0radHXteI8xfp3iEra8I1zS3OA==
X-Received: by 2002:adf:ff8c:0:b0:33d:251c:78b2 with SMTP id
 j12-20020adfff8c000000b0033d251c78b2mr11514082wrr.28.1708512119871; 
 Wed, 21 Feb 2024 02:41:59 -0800 (PST)
X-Received: by 2002:adf:ff8c:0:b0:33d:251c:78b2 with SMTP id
 j12-20020adfff8c000000b0033d251c78b2mr11514063wrr.28.1708512119575; 
 Wed, 21 Feb 2024 02:41:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bt21-20020a056000081500b0033d1f25b798sm16542591wrb.82.2024.02.21.02.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 02:41:59 -0800 (PST)
Message-ID: <8c0f6a91-7ae2-46c6-a8ad-18ca096a6115@redhat.com>
Date: Wed, 21 Feb 2024 11:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com, clg@redhat.com,
 peter.maydell@linaro.org, Peter Xu <peterx@redhat.com>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
 <20240213060731-mutt-send-email-mst@kernel.org>
 <417ea71e-fb45-4e1d-b8e5-9d54d93dba3b@redhat.com>
 <20240213064017-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240213064017-mutt-send-email-mst@kernel.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iiyzQl8asrNU

Hi,

On 2/13/24 13:00, Michael S. Tsirkin wrote:
> On Tue, Feb 13, 2024 at 12:24:22PM +0100, Eric Auger wrote:
>> Hi Michael,
>> On 2/13/24 12:09, Michael S. Tsirkin wrote:
>>> On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
>>>> Do you have an other concern?
>>> I also worry a bit about migrating between hosts with different
>>> page sizes. Not with kvm I am guessing but with tcg it does work I think?
>> I have never tried but is it a valid use case? Adding Peter in CC.
>>> Is this just for vfio and vdpa? Can we limit this to these setups
>>> maybe?
>> I am afraid we know the actual use case too later. If the VFIO device is
>> hotplugged we have started working with 4kB granule.
>>
>> The other way is to introduce a min_granule option as done for aw-bits.
>> But it is heavier.
>>
>> Thanks
>>
>> Eric
> Let's say, if you are changing the default then we definitely want
> a way to get the cmpatible behaviour for tcg.
> So the compat machinery should be user-accessible too and documented.

I guess I need to add a new option to guarantee the machine compat.

I was thinking about an enum GranuleMode property taking the following
values, 4KB, 64KB, host
Jean, do you think there is a rationale offering something richer?

Obviously being able to set the exact page_size_mask + host mode would
be better but this does not really fit into any std property type.

Thanks

Eric
>

