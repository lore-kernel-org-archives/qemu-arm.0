Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp352217njb;
        Fri, 7 Feb 2025 09:25:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMK34ddv8GIzSS08a094FpzSqUr11kb/jGvZ2ZS05G+8zCIFTslADVuSP/Up2S01UXW3mwT61ZXKivXw==@linaro.org
X-Google-Smtp-Source: AGHT+IH3uLHiEcBzMDTreld1FSssm6bHQG1cdq+biAq+kbgK2PdIq+H7u3mwsLFT9t7u8o3AkpG4
X-Received: by 2002:a05:620a:298e:b0:7b1:1180:a455 with SMTP id af79cd13be357-7c047bbab72mr489524185a.22.1738949124150;
        Fri, 07 Feb 2025 09:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738949124; cv=none;
        d=google.com; s=arc-20240605;
        b=hnwUgR3+TEtq55pldgHIZ1Aojpy826/iz7M+3R5MyXaQar5Jkc8vmoTeNmV25gyyvs
         K9Il6s653TN1jS3uMUzpWNMHalZFImJjKadORjn9AEUMrVeZj3WKZK976KZnJrjlBEmM
         yJnFtDh8hZ7/0iquydDlpLMBCCeQ6Wyf1OmgC9+rsfqjlUY8BNa9esDnbKL4AVYRzw+7
         IFnfnEU9givq1b+FzYcxo+5sA+9c7U/xCif8KBfLl2V/TYuBIis47CDlO2lIuqPvg7MX
         CRzwfrZDS8Xgrldn4KWWGJISaoFu4GbYzp58AXPZaK4B3XNFtlSxmtOi43/k1p3eVzcj
         EdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lL5b7RJmgyhiKOxUfDfD7TODJIBWag/8R4MWPcxcNlA=;
        fh=pHJ9jbPl48+nzcPqjOlPN9Kfs9pRBJ8eLTSa/h6ssIQ=;
        b=IS8+otLd4iIGm6ZwW1Q3noUW+I7AU6pu9jdBX9ZPcShjT0qPdhkOXPqcLiyk751jda
         iGJQSpAIPiZpfRmcWvEfg2fstaZ2f8O888y/QCkO/b4wzAhu86c3a+YpDtLxiNU0tORQ
         ScCKOhHwqbm292UTGtYbhuH9/qiJHfv66N3rSrZRBQ+gcgpOXNkIy45tfNRADd194cAS
         xYrkPrrLM9C+6B7tmNPRU76zg4xJgzfsSZnYGp4HUcgo9pbV2ejUovy2+78r2jF0t6TT
         lXPuyVwbNsCDBmIPNUDGUqXrscUe+yOti2+IRS4Jd4iBD9TFZb6Pq5mMbVzUVZA0d1PO
         VbEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AfG7Lh/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb4fd3si368124785a.417.2025.02.07.09.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 09:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AfG7Lh/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgS6S-0003d9-IV; Fri, 07 Feb 2025 12:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tgS6P-0003ci-Ep
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tgS6N-0000tO-CZ
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738949113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lL5b7RJmgyhiKOxUfDfD7TODJIBWag/8R4MWPcxcNlA=;
 b=AfG7Lh/LrimaUvYW86VN5GbS5Brcf3aCP31136YNLDWw0/FEIAHXDqFvc2vqqqdEr4TYli
 BgtqtyOmmdyvV7X0Z+1bwKcDLRKGNFcSRHmljKp+0yGyEcDH70XueyZZH/evQOeTqma0Jh
 m76dRjrUVkbPXapHF54vlhWfBpKn6cU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-Rt38MiVNOMSF-kcTbCLUig-1; Fri, 07 Feb 2025 12:25:11 -0500
X-MC-Unique: Rt38MiVNOMSF-kcTbCLUig-1
X-Mimecast-MFC-AGG-ID: Rt38MiVNOMSF-kcTbCLUig
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-436225d4389so16034405e9.1
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 09:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738949110; x=1739553910;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lL5b7RJmgyhiKOxUfDfD7TODJIBWag/8R4MWPcxcNlA=;
 b=INLDKqdRlyRrcoBk4K0SKs5fMm86pQmquiLnzw253JHHMofK7i/H6x0KXchKBgnraC
 HwgtwvEKJRVPndfYkhvBeBenTgk5mERI/4Bkg83stH2E5kqnHG3HLZB/Lr0LccVxkgHN
 dwT70ezvoC0U7eB2JeSm5GgFw9qwAWMCKyW87HT9T5TNn2XrXtpTFCjG4aBHn2saP8lC
 iwq3KDPXy4qnvDKa6eGlWc3LlWt3UAtL6doYBw5mCnp1rFaTMIsmUGX4RPS40yp0VubR
 ABGaViO5pDLukgdao/HyTXV/nDsum0Ed5l28bX8xVAJ5gOJ0567gIMVi3CSj2Jqh/i4n
 Fq4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV5wJYlGXzc1gckKEjyEq8Hcw7RqHN5CFyH6Tx32Y9r4ieMysDHFSsns6QACn/RVW8eFIEHScRbw==@nongnu.org
X-Gm-Message-State: AOJu0YzVdna4l8dttRBtFV0uyYMrWrXFrM8WQRs8tl28IqTZng4bOJ8D
 CaFWaDQK7GwvygH7fM8jcSw8eKXdWFHEcTjHi9ek6qe5TWerN6t1o5uCmNaAwhiz3CzCBTyO7Hq
 P9bSKbzF+K1FHxunPNPxWoe1Jv8XBmn5J5BrRDCT4iz2/fSw74g==
X-Gm-Gg: ASbGnctKduELXzPBbJ+7A+qcSNXHIwaEgvKWbDQ19JCwO2vqHyaxSvv/WHxmt7Pr4kG
 wXBLfYVvOxGrUbkRi5jIqy+04h0AjZBrTsAiUnH0ptWmV3OQ7KfNAfexPyZ3BXroqdC71HVVfe9
 nSfbJe0Yh4e4E3OljWsB5YewlMoRuPn3N8Gbg1wQr4owVocMQxBi2P1usblDKYvWKOsmeAQss+Q
 DswUQofMEA+Eol85DNReinK3HIzwr/a+7gsTM7Es356pXEMa64aC1si18PZOFXeYbypseTl4MT6
 uelcu8h3y0K8pdt6ZdANEq8CODn556RMiFKCYuHou+8=
X-Received: by 2002:a05:600c:8712:b0:438:e2ce:92d2 with SMTP id
 5b1f17b1804b1-439255503demr29194475e9.4.1738949110346; 
 Fri, 07 Feb 2025 09:25:10 -0800 (PST)
X-Received: by 2002:a05:600c:8712:b0:438:e2ce:92d2 with SMTP id
 5b1f17b1804b1-439255503demr29194285e9.4.1738949109918; 
 Fri, 07 Feb 2025 09:25:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae80dsm59800005e9.22.2025.02.07.09.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 09:25:09 -0800 (PST)
Message-ID: <2a18c763-cde4-4798-8866-3e023fc6ffc3@redhat.com>
Date: Fri, 7 Feb 2025 18:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
To: Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 imammedo@redhat.com, alex.williamson@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <Z6Y6sf064FBWT5G1@x1.local>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <Z6Y6sf064FBWT5G1@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xbm2N0UkVvZk08HZ0ndXjtL_dURMf-1SQ20ElDRzHhI_1738949110
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LPy9bAPQwoMF

On 2/7/25 17:54, Peter Xu wrote:
> On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
>> This is a follow-up of Peter's attempt to fix the fact that
>> vIOMMUs are likely to be reset before the device they protect:
>>
>> [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
>> https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
>>
>> This is especially observed with virtio devices when a qmp system_reset
>> command is sent but also with VFIO devices.
>>
>> This series puts the vIOMMU reset in the 3-phase exit callback.
>>
>> This scheme was tested successful with virtio-devices and some
>> VFIO devices. Nevertheless not all the topologies have been
>> tested yet.
> 
> Eric,
> 
> It's great to know that we seem to be able to fix everything in such small
> changeset!
> 
> I would like to double check two things with you here:
> 
>    - For VFIO's reset hook, looks like we have landed more changes so that
>      vfio's reset function is now a TYPE_LEGACY_RESET, and it always do the
>      reset during "hold" phase only (via legacy_reset_hold()).  That part
>      will make sure vIOMMU (if switching to exit()-only reset) will order
>      properly with VFIO.  Is my understanding correct here?


Eric,

We were still seeing DMA errors from VFIO devices :

   VFIO_MAP_DMA failed: Bad address

with this series at shutdown (machine or OS) when using an intel_iommu
device. We could see that the VIOMMU was reset and the device DMAs
were still alive. Do you know why now ?

Thanks,

C.


> 
>    - Is it possible if some PCIe devices that will provide its own
>      phase.exit(), would it matter on the order of PCIe device's
>      phase.exit() and vIOMMU's phase.exit() (if vIOMMUs switch to use
>      exit()-only approach like this one)?
> 
> PS: it would be great to attach such information in either cover letter or
> commit message.  But definitely not a request to repost the patchset, if
> Michael would have Message-ID when merge that'll be far enough to help
> anyone find this discussion again.
> 
> Thanks!
> 

