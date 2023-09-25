Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp738024ejc;
        Mon, 25 Sep 2023 16:58:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdddWcUlZdH3y+wRYaTeuYIZlHlv8Mbohv+mCv0TTl8xAf9tDCyX8vW1ThpViieuDD/N95
X-Received: by 2002:ad4:4e92:0:b0:63f:8677:34a with SMTP id dy18-20020ad44e92000000b0063f8677034amr7644920qvb.50.1695686325149;
        Mon, 25 Sep 2023 16:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695686325; cv=none;
        d=google.com; s=arc-20160816;
        b=tkRrSKkKKPDII//Z1rZZXO3YMXFDwWIuHb5TSkPxMssUD6gI15sIVboGALXcaEJyXG
         sZ5U8vg8Q25MN/It+IoyuJFgv32sBeQ4qH5nWqDPcayjQ34f5gXL2qNd2s7/y1DbVOkf
         KCZUWkPCNMCmYeoQ6Vmj3hlhra7r6XwV7Su02M3oClP4HFTc1NoA25UWH5yFYcRJrkj8
         l0u+o2B78G5uqu2tmsDAOzRW1w7HcwtSuWLtWRYZkHgykN1rK31ZT69vCH8qMbpbZcgR
         1T0sx/qf9EBYoX2mxvXM/MmO5mFowBl/eUNFWG7UFw4Wfts7a3YujhGFPP39BXNMYkr6
         GfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fOvcIRFv6hFezh56Gs1I2EKTDQgBQaStMW0xU95/6XA=;
        fh=Ce7iclKJ9LCnlI+7zrgGHsreXhl5oe3Cfh9PCFNRDpE=;
        b=bxFxqZHXdHwI7wGaxgaEJLEIRc1N44q6y95uIcmJ/2Nwzlsbw5welIARSN9fB+fcZH
         oeJxqgWW9rXwtEmKix83TjehyFDJEWoccr5litju7ByMXyBVnAPnlx2Zt9sY9mecla3D
         sEcjHZZzCGL+KlBmqpax0/wMPSTpw73Vm5pCeM17DWzyxbyDv58im74DqreSAnw6obqo
         bCG2fDgb1wHNUQD/+82qwDaLEeXnFAR1YxUDBk4NSAk457+wTWhkKQQj2HzCGWEZI/+7
         8N56uVdIneBWzUjWNgmvrbFg0esBXVpJom1RF9hw6OevMAS0eVDpae7R5xmmO3ll8g4s
         xXtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AKSNthMG;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bs11-20020a05620a470b00b0077437335298si1193412qkb.765.2023.09.25.16.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AKSNthMG;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695686324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fOvcIRFv6hFezh56Gs1I2EKTDQgBQaStMW0xU95/6XA=;
	b=AKSNthMGxGJHdFMFi1n9DtT/amved6y11/13qnj7xKrPWzn4dEgzjI8TRVKWAnTcC/GyDe
	DAlE3uCHxO+YWSMYAiDEjf+5t9wz1D7yfKbQsar0edwYVdRoCVtDrc5Hr03DkpxExkkU5U
	pUUiQW4cp7xzQU9cGpoR6GMUupJSeAk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-DEZd9vCANnmnKEXCu2hiIw-1; Mon, 25 Sep 2023 19:58:43 -0400
X-MC-Unique: DEZd9vCANnmnKEXCu2hiIw-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1c41538c7eeso72457735ad.1
        for <alex.bennee@linaro.org>; Mon, 25 Sep 2023 16:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695686322; x=1696291122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOvcIRFv6hFezh56Gs1I2EKTDQgBQaStMW0xU95/6XA=;
        b=lr6L0BmfvREJBEYmE4VAJrGOb57VK5/TJbfQysk6YCEwC2MN3/GPlCn+6XP+SZLICu
         tAesmpkJ5vNAOI+sr6sKs6SM+UipoPoiGfnvz8r57QfGxoeKJc3BVnEFjHtx1HB+8A7j
         vI8as3Sn1CEhSXtDnuZJAA/If2HPWTnlru+Jva2QjdCalK+HPItRcq8abKZNYD4aDo/K
         Ts23z2K0E6c61AJ8exCp24NObycFeqhETRR602q0POHYLxXYaPZYO7itXYXqHtqO6gwj
         pCuV6aTENNBHnNeHniR++obE/5M4fFUXBWU3+ycCQkjGuEkSVi0o3inXxVsRJFrp6PEo
         lrXg==
X-Gm-Message-State: AOJu0YxKLGZRzMhJAbZ8IVqe43KYLiWgZHMpbfG3X2+66d78RBaSnYss
	Uaxgtd88R1kTgY1L4ys6jgU4SImHBkU1INPfE8g25Wv0VyNzZGcrr898ueDlClPsTq9gA0kC0+y
	IQU3ENrt1ToKVpE25
X-Received: by 2002:a17:903:41c3:b0:1c0:c86a:5425 with SMTP id u3-20020a17090341c300b001c0c86a5425mr7632919ple.19.1695686322307;
        Mon, 25 Sep 2023 16:58:42 -0700 (PDT)
X-Received: by 2002:a17:903:41c3:b0:1c0:c86a:5425 with SMTP id u3-20020a17090341c300b001c0c86a5425mr7632881ple.19.1695686321995;
        Mon, 25 Sep 2023 16:58:41 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902b28500b001c62b9a51a4sm561612plr.239.2023.09.25.16.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 16:58:40 -0700 (PDT)
Message-ID: <15913a45-35ef-29eb-00b4-db64cc80509c@redhat.com>
Date: Tue, 26 Sep 2023 09:58:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
To: Salil Mehta <salil.mehta@huawei.com>, Russell King <linux@armlinux.org.uk>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "maz@kernel.org"
 <maz@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lorenzo.pieralisi@linaro.com" <lorenzo.pieralisi@linaro.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "ardb@kernel.org" <ardb@kernel.org>, "justin.he@arm.com"
 <justin.he@arm.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>
References: <20230925194333.18244-1-salil.mehta@huawei.com>
 <1ba2e69bf0a94c1498ab5863b365559b@huawei.com>
 <ZRHpyxCe8ybsxKck@shell.armlinux.org.uk>
 <a4f5b9370c2c45c7a09fe55f4a7b1a62@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <a4f5b9370c2c45c7a09fe55f4a7b1a62@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4ZniIs7/ERuC

Hi Salil,

On 9/26/23 06:21, Salil Mehta wrote:
>> From: Russell King <linux@armlinux.org.uk>
>> Sent: Monday, September 25, 2023 9:13 PM
>> To: Salil Mehta <salil.mehta@huawei.com>
>> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org;
>> james.morse@arm.com; jean-philippe@linaro.org; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; lorenzo.pieralisi@linaro.com;
>> lpieralisi@kernel.org; peter.maydell@linaro.org;
>> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev;
>> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
>> will@kernel.org; catalin.marinas@arm.com; ardb@kernel.org;
>> justin.he@arm.com; oliver.upton@linux.dev; pbonzini@redhat.com;
>> mst@redhat.com; gshan@redhat.com; rafael@kernel.org;
>> borntraeger@linux.ibm.com; alex.bennee@linaro.org;
>> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
>> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
>> miguel.luis@oracle.com; sudeep.holla@arm.com; salil.mehta@opnsrc.net;
>> zhukeqian <zhukeqian1@huawei.com>; wangxiongfeng (C)
>> <wangxiongfeng2@huawei.com>; wangyanan (Y) <wangyanan55@huawei.com>;
>> jiakernel2@gmail.com; maobibo@loongson.cn; lixianglai@loongson.cn
>> Subject: Re: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
>> Arch
>>
>> On Mon, Sep 25, 2023 at 08:03:56PM +0000, Salil Mehta wrote:
>>> Looks like some problem with Huawei's mail server server. No patches
>>> except the cover letter are reaching the qemu-devel mailing-list.
>>
>> I haven't seen any of the actual patches - just the cover letters.
>> Was that intentional?
> 
> No. all the patches are either getting held either by the server or
> Some other problem. This has happened for both the instances of the
> patch-set I had pushed to the mailing list within 2 hours.
> 
> I am not sure how to sort it out without the help of IT. China is
> asleep now.
> 
> Any suggestions welcome to debug this. Or Should I wait till tomorrow?
> 

Thanks for your efforts to continue working on the feature. Hope the mail
server issue can be fixed early so that patches can be posted. I don't
see the attached patches either. However, the code is available for early
access in your private repository, as clarified in the cover letter :)

   https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2

Thanks,
Gavin
