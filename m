Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2508461ejc;
        Tue, 14 Nov 2023 19:53:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPinS2ogxO/aKJ+fMCmkdnSM0fhkYp8h4eY/t+zDc56h5CUt106q4vBmpcvBO4mzq2jUKE
X-Received: by 2002:a25:2f49:0:b0:da0:d005:6bb7 with SMTP id v70-20020a252f49000000b00da0d0056bb7mr8113204ybv.1.1700020401663;
        Tue, 14 Nov 2023 19:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700020401; cv=none;
        d=google.com; s=arc-20160816;
        b=nyd/QwDgaSAZI6heZkxtVi2v2sFTNpZt/MI6dPq2bQiyqLrRSMX7lZzxLtkriht1lT
         Ls5tY2foxYIlUDm+LVsuGed9kyBKZWqAGQEADBE4RIvQV2xx4ttPwhaV+VkRqr5RDB05
         mhf5fcy2ccXjGeA7P0q4XBk6g96QFUYZe8Lst0q4uT6L3C7PjpzbEOtG3J3A70hUE4qu
         qfBt5KJ2uHllashZ1mcwIbhpfW9A8aWamj6jPMozXplX7GwOcwGLRrJ4jaRn3ReTTfLH
         Ctu6/8N3mnbFw4bygmcFNNXrrNYOxNoVX3BpDJuXgzumjKMCL60uFUL5JQOl76drpr2p
         jkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TLsBshritBkNiOuYVYOhLB4LOlnqTjzm/Dp3F+beaHg=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=QTXWlz5FZXX5Rn5G+6xL6XVlPPp4jVi4LPzdt/hbEHDeG5DUCxjZILENS2Cm+XOkip
         A8B41zx94rp/8CRSYOpPqWP0TCvunJBjCxUnS8q01yTADJGRy7b11TgFVYFUJwGi5EBv
         EiSLjmxgSfVjES4oHFqGhrDYzr5kZom/jJCEPou/Cvo/xI5ikYy1A8RDTpwEKBx3pwAX
         aXUuezNreRx0PgMJ/qhuvWJdrSXbkV3ovyc8nDDomPNFqhsuRqzlSlTbbAt8lOnyKFAa
         vTOE7lJwVmgids0j5c8Ly/ylhA2usoeL2Zo+RXS11oDOJcDbJToTOeRRgWak9P1VXuXi
         GlUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QXPIJU4S;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bm3-20020a05620a198300b0077429d89227si8779667qkb.375.2023.11.14.19.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:53:21 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QXPIJU4S;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700020401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLsBshritBkNiOuYVYOhLB4LOlnqTjzm/Dp3F+beaHg=;
	b=QXPIJU4SGJk7G/LAj1Q4ujr6lLYg0ITCqLSsNDll8oubX5eodVhOFpthb3/6vmWXjTlSbn
	5uPJVu1Q+CfzShTgUcOvbGPSCuugJ7mx+iPiSSc4BbjKT7+IvQUgZgMJ7EteqpJLxOll/v
	Zlu/ybIkrV8WTSoQe2b/4Yt/8v/ds8g=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-r2vxoL0lN-WZRS-AjNaGrg-1; Tue, 14 Nov 2023 22:53:17 -0500
X-MC-Unique: r2vxoL0lN-WZRS-AjNaGrg-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b2df828525so7511987b6e.3
        for <alex.bennee@linaro.org>; Tue, 14 Nov 2023 19:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700020397; x=1700625197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLsBshritBkNiOuYVYOhLB4LOlnqTjzm/Dp3F+beaHg=;
        b=gBkUX/B3w5tbsARgl2/F4sr6WTbsAukqRiHj0yb+IrmnDxuLvkJj5tJD4JqRTFf2sF
         XWyH2cDe6HUH0qXX2VdDNIwJkgFdi95jFfjXgUu0lqFj9FeAP+5vxYPeE4JIrQdws0jt
         guNM6bbwwvzkduNEka7wRduyI/ZntZaqpDiCIWB1pC5ciLQeHCr/P7Vn7dKaw9MIDVVr
         R/jbfZ6HJzqjqtJT0fZVGUzahLdLvmOH7wHLrS0Ba7DWDBD/UCG9w1nmJSGLjyXm8nr/
         wb/plqqM9D50t4fPB/1EFCptIbUU0cU2Yo9meVLf4OMASfPS+TdV88wERM7qm95Gyc03
         uIPw==
X-Gm-Message-State: AOJu0YxDZV7ZoyLrJdVtflU+cS7/E5kIhvp1mi4HmLv6mumQVdtOyn6g
	Pz8/61hk+8/MP91S8QwwGSb55HB/CZeJB8EESA1Q4Z6npHyKyQkT6c3TAIT5gPPk5kN4Dh5EZbA
	2GrfvIHyBjDB6JFS9
X-Received: by 2002:a05:6808:493:b0:3a6:fb16:c782 with SMTP id z19-20020a056808049300b003a6fb16c782mr13816273oid.30.1700020396814;
        Tue, 14 Nov 2023 19:53:16 -0800 (PST)
X-Received: by 2002:a05:6808:493:b0:3a6:fb16:c782 with SMTP id z19-20020a056808049300b003a6fb16c782mr13816234oid.30.1700020396558;
        Tue, 14 Nov 2023 19:53:16 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006b97d5cbb7csm1950057pfn.60.2023.11.14.19.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 19:53:15 -0800 (PST)
Message-ID: <6c5eccd4-0261-4633-a5d7-bb880220df94@redhat.com>
Date: Wed, 15 Nov 2023 13:53:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20231113201236.30668-1-salil.mehta@huawei.com>
 <20231113201236.30668-9-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231113201236.30668-9-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: iROqqul1zUgS

On 11/14/23 06:12, Salil Mehta wrote:
> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
> and non-hotplug events like system power down event. Each of these can be
> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
> the CPU hotplug event.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <Gshan@redhat.com>
