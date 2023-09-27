Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1631592ejc;
        Tue, 26 Sep 2023 23:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqF1k+zHQpSEcXU9qiPxsGNV/eMNHIT+Ib7bIIT3K2h+4JXCP4CRWPSnhFbUHwthAqrpvE
X-Received: by 2002:a81:4f01:0:b0:59f:66a1:bfca with SMTP id d1-20020a814f01000000b0059f66a1bfcamr3613534ywb.26.1695796234335;
        Tue, 26 Sep 2023 23:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695796234; cv=none;
        d=google.com; s=arc-20160816;
        b=FiQ/hJMIP4q4FeZLNBj3AWO6lyKkaLT3A0UI1MWCm4hik0uLLTuI2feFhcbnfGsfiJ
         uUiBkDYejpEMFUFUzHcUoM8+eZ3XzI4zlpJV7oHK4wDUsGfXByGqzxGe42795eAAcAJp
         QBPorJCD4tSvddT85X2BU2Wkhv+sE1dR3207Z+NetrTp6OY3NSYzsiO3MjBhkwhW8xFg
         IuITolDjSL5aHIyhcX5VaIV27FKx1Y1K1UhF7xygY29tk8tispiv1qQHBAFFno6IXmK0
         nUDnUruOmzy78+Ykz3u0JwLuYV9MPQEjnG6OYKi4u37P5FoasYzPjtBhgJvvw6Gqiwjx
         3Vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GwpqGyZbXBaIK7l/zifkXJjTSF/FIiPZ4s+Omj0Z/Zw=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=u5R+3g0uxj44Rl0tw745CQq1leOnRyeZ8/O4PV66dXBJlHSSKSzuJnMto/ca1clx0h
         9gzPjEaHoWaWRPGPdonea0mZo3BcCD6bZnXtAxvBej5jHNUDmZ826fjccboUguq5CUJ5
         N0oBKRw8lZ+/SNW4DHUfbFUqaMzTGdbe3thwMDXCjnzgTlLv+CuyQ6PRNtas+SE3E4MN
         cOyItLdlq3meHdIOiKhbn8QV5Sabgr4XeNBrGHcs1dFvDLNQKxsFjebCCbGxaUgai5Jh
         XLG8rOQSif35SMHLSv0/aJsnkETDJD7MWZQR7cOLsxJiOpN5cOKwBTnQHplFBRFsOK3h
         DI+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bRc/fUtI";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b5-20020a81bc45000000b0059f4f562bb1si4062968ywl.72.2023.09.26.23.30.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 23:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bRc/fUtI";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695796233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwpqGyZbXBaIK7l/zifkXJjTSF/FIiPZ4s+Omj0Z/Zw=;
	b=bRc/fUtIvbuOKJNP8WCOfW8LPYfIRAN8f2eLsVsJIKL0xKelkyOBxsIJLjfeA89p/oHWT6
	wvWJwvkbf66NodRUAagY9U+/pxVn/RVJBrPZ2BxRAI0oTlRzuQIQysjbY3PSbEPcVPIX9N
	e2g/6q95NGsT5K2SyBm2ha7HF9DlEMQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-NvoEM08ZOeaZQqNq01wrng-1; Wed, 27 Sep 2023 02:30:30 -0400
X-MC-Unique: NvoEM08ZOeaZQqNq01wrng-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-692161c3948so12798608b3a.0
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 23:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695796229; x=1696401029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwpqGyZbXBaIK7l/zifkXJjTSF/FIiPZ4s+Omj0Z/Zw=;
        b=W/p08j+ySLW/gh4fH+PxanaQsi+xWq4JVfe5hAfkyJF3WhPG/Z/WwRO3vlisJlpOc/
         CmKs5kKXX5BP2RpsqJrNnL+eCbo3tPa9o5JBh6l2BLs/bx9dIzewbBS2MgoPrpimCFnt
         R2ZiKOoc3baWAh7CJaAFzSOUTXiRtjfQCSWFBxNcgxAS/OLjKrhnMLOW8x/+QyGHMrvb
         mkYyAUwz1/mqOGWzs5i96SMXw+3OIXTnagcG5JRjzpK7HmqtCNgjcShhomo8d9MsaVtX
         A6QqonqhIfSoRr294M6DmG+KpUqUis1F8HhChQ3Wc82zr8KtXPWraWsif4A9tkBETAVg
         5E0w==
X-Gm-Message-State: AOJu0YxwMNLDwas0znQoUC6MpdOqvZJ9wG8m5iq9AvoGHiu1jcNPE6oh
	hiC8Nq7ErdK9JeF7lphY01/IcWr3kjJWh/W9X+wTKt3Gz463/tL31OZSl7l0XhxdUgIS1ejQt38
	EG5YDbYXMHuRVTBiE
X-Received: by 2002:a05:6a00:813:b0:68a:6018:a66f with SMTP id m19-20020a056a00081300b0068a6018a66fmr2144657pfk.2.1695796229527;
        Tue, 26 Sep 2023 23:30:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:813:b0:68a:6018:a66f with SMTP id m19-20020a056a00081300b0068a6018a66fmr2144601pfk.2.1695796229216;
        Tue, 26 Sep 2023 23:30:29 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id b3-20020a639303000000b005706b9813afsm10515080pge.90.2023.09.26.23.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:30:28 -0700 (PDT)
Message-ID: <41003807-062f-1121-956e-72e0444e048f@redhat.com>
Date: Wed, 27 Sep 2023 16:30:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 04/37] arm/virt,target/arm: Machine init time
 change common to vCPU {cold|hot}-plug
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-5-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-5-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: f5heLJotzA9J

On 9/26/23 20:04, Salil Mehta wrote:
> Refactor and introduce the common logic required during the initialization of
> both cold and hot plugged vCPUs. Also initialize the *disabled* state of the
> vCPUs which shall be used further during init phases of various other components
> like GIC, PMU, ACPI etc as part of the virt machine initialization.
> 
> KVM vCPUs corresponding to unplugged/yet-to-be-plugged QOM CPUs are kept in
> powered-off state in the KVM Host and do not run the guest code. Plugged vCPUs
> are also kept in powered-off state but vCPU threads exist and is kept sleeping.
> 
> TBD:
> For the cold booted vCPUs, this change also exists in the arm_load_kernel()
> in boot.c but for the hotplugged CPUs this change should still remain part of
> the pre-plug phase. We are duplicating the powering-off of the cold booted CPUs.
> Shall we remove the duplicate change from boot.c?
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Reported-by: Gavin Shan <gavin.shan@redhat.com>
                            ^^^^^^^^^^^^^^^^^^^^^

                            <gshan@redhat.com>

> [GS: pointed the assertion due to wrong range check]
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c      | 149 ++++++++++++++++++++++++++++++++++++++++-----
>   target/arm/cpu.c   |   7 +++
>   target/arm/cpu64.c |  14 +++++
>   3 files changed, 156 insertions(+), 14 deletions(-)
> 
