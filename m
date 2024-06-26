Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp837660njc;
        Tue, 25 Jun 2024 21:13:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8UjFZCFs7THiYpG2lh5fqIF8U2njhdZ1nQi53Ofkp53ZCfR7v5+mWCgnuTT1yUoBcAx4ft5xodcIm963NqBSnO/NoInds
X-Google-Smtp-Source: AGHT+IH/cPWhc7+zWphz+vxbP79rTEjlTahfUO9VjiFaqLg6xhkmzJ7sKOSOeDuCFGgnQga/zDTM
X-Received: by 2002:a05:6122:4594:b0:4ef:4db7:fd8e with SMTP id 71dfb90a1353d-4ef6d8071e1mr7974060e0c.4.1719375213243;
        Tue, 25 Jun 2024 21:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719375213; cv=none;
        d=google.com; s=arc-20160816;
        b=WYjt1hhc5YaReU5ilBH2LHyRe86VI1Rww4kIERz4i4QrfpoeU1AqCfNrM6wvhDVUxf
         mNg28Sl2XiXy8dudYw9WNcWGldYaWEtTbBcOjeC8hQS1pBVNBOmiyDxBm5vejPZcTEwE
         VgUVanA4XuZbsjxox3vJL9edA9UJk5ope9KG2njxubGROYZbYKTycpNJMeccf4Tiq/bM
         DwwiV+80u4XSCTa/KNP2KSSlcmjI/xavy7XeXa5tNAkeRLgIVk+Z0Hl0m5rOyeLRJC/K
         UfXdcdTGAIyd8P3z035q9m/jLtyaM5hphD62MJCpmMIljDoOwJKZF1WqJB8GG7TAWZvd
         o/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tVkf9f84Zg6rObRBIBlD+ENxvLeBAxG6a+dRUvuJd1s=;
        fh=mvrFjdS53WImAGMy6n8cb3cx7NP08L/nnvq/F5GIm1Q=;
        b=KEAiHQRaDgmECAMBJa4MghAra3od823EWciiEwTvYJAAl+BKT9875Tdmfo9kAYATJR
         e1Ic0GTmtWYNMYY7nzGG3+Ahx9NLO+/F6o4DAao/5z+pMXYFp3nFVFFw69bpXfTE5yDb
         ZV/D3NWH7aAYzSctZf7T+Z8HjdaWk6HfjuzmuAkO9CGGxw//V95jdKH76ZBWHFaMrlAG
         7gr+mpjx/2DLTTACujlyM3sEksxnKRGQN4EVjlisIMGWzsWocOYU7/psvND36nlaOsoe
         kcMKR+l4GRRTsGjSf/zZIl/wZeoXuRiOS1RTvxGzK5P6VrrRnmBDNQe1IDMMDypyjob5
         0hBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B8a/hwUr";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ecebb4dsi124292146d6.118.2024.06.25.21.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B8a/hwUr";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719375212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVkf9f84Zg6rObRBIBlD+ENxvLeBAxG6a+dRUvuJd1s=;
	b=B8a/hwUrPW3nlI1Jegf+qGErrTrOsGYCXuB2AU6iRF5bf/yziHD402G+xmf4LIV4KZdJt+
	rtcng2QN4G1Unz6t55Hiqn7ufGd/9uaf6oIy6Fju0EnINAj9iqktv/wENpN0v7AIVaKMmP
	DAkWv3Rin8nnrW3GVfTYttkt+UEXIKQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-XfNHdC0tPrC6BadPX3BZYA-1; Wed, 26 Jun 2024 00:13:31 -0400
X-MC-Unique: XfNHdC0tPrC6BadPX3BZYA-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-72268cc4453so1662069a12.3
        for <alex.bennee@linaro.org>; Tue, 25 Jun 2024 21:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719375210; x=1719980010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVkf9f84Zg6rObRBIBlD+ENxvLeBAxG6a+dRUvuJd1s=;
        b=lHvdAGV3D75kAoF5zfiR3v+aXdCl7DsqtfKAo0BogqJnk7dGkYHud8vUom7/PwU/D1
         s8NKQMUj9o7jTcVb+IADVrb/3guTKjjdxZfm8uu88gVyVcQwBVO45DKP2A0rOUK2WqLY
         V7uJ4oXWBMQxzFUyK9reVoatJB/xE32T4QB7PuRQuWo1YNHw5iMKNn/nggbVRyqENbV/
         L9ZaUC1oSNEhPsLa6JlNK5oC3U1mNgX0YwdvI/YjyzgWDNmw2qv1+pG8Z2zbZOzXMy0p
         dOEWKVanfNf6SexHn0SpbfS1dD63O7UkTutHdb0um1MNFxXKFxkN7unQWCsfZhue5GJu
         bXfg==
X-Forwarded-Encrypted: i=1; AJvYcCW5a4LIN7FUc+dbuQyQ/EG+GoTouLG+DeSrl+EkesZ2mV8na36jjXlYtrEFfwUDwi07lVVdM+WVm1ZAR32qSTq5Xsm+dIok
X-Gm-Message-State: AOJu0YzXqvYTllzjXTrgOM262sVqfCy6ijCkd58IFQEp45hxOcWvhrc6
	7r7kxyquvWOuqIaEOoKohnO8yVTKFvzs8YbeOGVZVvYh2OxP/mITaALS+QU8TibKKnFQR4ljeJh
	3YVTckqGffNUS3vrjT8Hoy+UwM4NJXb6QxgZjX8b39ksoaq/JRImG7A==
X-Received: by 2002:a05:6a20:daa2:b0:1bc:b15a:49ff with SMTP id adf61e73a8af0-1bcf7ff1344mr10389561637.47.1719375210290;
        Tue, 25 Jun 2024 21:13:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:daa2:b0:1bc:b15a:49ff with SMTP id adf61e73a8af0-1bcf7ff1344mr10389535637.47.1719375209856;
        Tue, 25 Jun 2024 21:13:29 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.50] ([43.252.112.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc7cbesm89583745ad.298.2024.06.25.21.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 21:13:29 -0700 (PDT)
Message-ID: <b36e0d64-9653-4d48-b72a-00a1aee86629@redhat.com>
Date: Wed, 26 Jun 2024 14:13:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 0/8] Add architecture agnostic code to support vCPU
 Hotplug
To: Salil Mehta <salil.mehta@opnsrc.net>, Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, npiggin@gmail.com,
 harshpb@linux.ibm.com, linuxarm@huawei.com
References: <20240529234241.205053-1-salil.mehta@huawei.com>
 <20240602180241-mutt-send-email-mst@kernel.org>
 <20240605160327.3c71f4ab@imammedo.users.ipa.redhat.com>
 <CAJ7pxeYehVhPWfbEqRMMSCVHk31JQhtQhRSM_4e1WqBhqv0UHQ@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAJ7pxeYehVhPWfbEqRMMSCVHk31JQhtQhRSM_4e1WqBhqv0UHQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ek/BZLklF+77

Hi Salil and Igor,

On 6/26/24 9:51 AM, Salil Mehta wrote:
> On Wed, Jun 5, 2024 at 3:03 PM Igor Mammedov <imammedo@redhat.com <mailto:imammedo@redhat.com>> wrote:
>     On Sun, 2 Jun 2024 18:03:05 -0400
>     "Michael S. Tsirkin" <mst@redhat.com <mailto:mst@redhat.com>> wrote:
> 
>      > On Thu, May 30, 2024 at 12:42:33AM +0100, Salil Mehta wrote:
>      > > Virtual CPU hotplug support is being added across various architectures[1][3].
>      > > This series adds various code bits common across all architectures:
>      > >
>      > > 1. vCPU creation and Parking code refactor [Patch 1]
>      > > 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
>      > > 3. ACPI CPUs AML code change [Patch 4,5]
>      > > 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
>      > > 5. Docs [Patch 8]
>      > >
>      > >
>      > > Repository:
>      > >
>      > > [*] https://github.com/salil-mehta/qemu.git <https://github.com/salil-mehta/qemu.git> virt-cpuhp-armv8/rfc-v3.arch.agnostic.v12
>      > >
>      > > NOTE: This series is meant to work in conjunction with Architecture specific patch-set.
>      > > For ARM, this will work in combination of the architecture specific part based on
>      > > RFC V2 [1]. This architecture specific patch-set RFC V3 shall be floated soon and is
>      > > present at below location
>      > >
>      > > [*] https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v3-rc1 <https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v3-rc1>
>      > >
>      >
>      >
>      > Igor plan to take a look?
> 
>     Yep, I plan to review it
> 
> 
> A gentle reminder on this.
> 

Since the latest revision for this series is v13, so I guess Igor needs
to do the final screening on v13 instead?

v13: https://lists.nongnu.org/archive/html/qemu-arm/2024-06/msg00129.html

Thanks,
Gavin
