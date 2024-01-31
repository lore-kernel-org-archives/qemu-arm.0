Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1406011ejk;
        Wed, 31 Jan 2024 03:22:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJkhCDAbVuSf9uxJyD8NjfS4NUA4pbEjIxOrhRSbObZeLeSPWGBQoy3PGTUKvL3g/ypwqJ
X-Received: by 2002:ad4:5c66:0:b0:685:b0ca:e1e8 with SMTP id i6-20020ad45c66000000b00685b0cae1e8mr1661300qvh.17.1706700176845;
        Wed, 31 Jan 2024 03:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706700176; cv=none;
        d=google.com; s=arc-20160816;
        b=e4bzNn3iRMM6/YjsniIrBiugw5TDmox9nU4+j7ocNrPbjd6tQLkkOcVEIPPsy3JsdV
         huQMBC68X0IJ2nNfgRkftxLJR1Luqg4yS1fm3jutJ3KC8CWG4wrrv8vKetbdPpBaiomp
         86frZF5fsbfsF0FKHr/lTcEC0QWGX4C+vYeOigr6A3SFMQbWqKcR8Ah+WtoZKpWF8rm/
         5l86/LDtmfN2gdW4Bqm6vcFwwBEBXh7F2fz+ZqMQ5e96Fa2apgN4Iat4qNoU31FMTPDc
         XOGro2sIKafLd4QI+5F4PoFZ+/kkVWrbm67NvM+vRY5sCYM2tY628eGmpejw/Z/F44zb
         4g0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xoZeNTfDJkpavBmLfMquoZlHC2BBV8svy71fzl6+Ipk=;
        fh=xOT1whFjxqmrpp8dEEHexq9Tk/z7RUX9/xp2GdS6egw=;
        b=Rv060kstY1dAfF6JhPrdaHf+YUdtIaXMVT4Z6iFXtox+EHwPe+eWW833VredGYdJFp
         FCsP4wbIhP8Ek/s3nNQnGxROVmmD0w/7rMTiWCfbF+AN+a7E+ssk88t3Q6ydigAQ0cC/
         0+/SzVdYAExujQ8/HNempdvvQjUkrxGXO+p0HS4Cy/l6SFtXB8lJ9QgQWUXXgmjW/Tjj
         Fw61Cvdx/mcYH4CVRUt4AkfYS/9S4sSJeFk46hK4ryQYnetpsVgaSBX08yqZ+7VjVSFh
         SlIuG/naK3H4gcT/Q0jENFH0Ol0WdcnfPDgSPiCc8EVKhlulKyse4yOymFtedk/DUOjn
         yAVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kz4bHy2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl19-20020a056214519300b0068c672f29cesi2135171qvb.160.2024.01.31.03.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jan 2024 03:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kz4bHy2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rV8g6-0006yq-89; Wed, 31 Jan 2024 06:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rV8g4-0006xC-7X
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 06:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rV8g2-0005jh-KL
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 06:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706700164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoZeNTfDJkpavBmLfMquoZlHC2BBV8svy71fzl6+Ipk=;
 b=Kz4bHy2HtqVNU8wCZHRPqnwnRwgFAPXMuB5bm3I2KOeSYKJYMgJjCdKwKnAMfOjf2fH4XQ
 2iikWDy41uYbIBQeN71myPuNlBYzlvdWp0IfhbQuPtt+tn4+xgTPxWSkT70y34kKM/323/
 EKjptBuEr5vlPi5GAm3b8jR5YQgPvLo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-sEM7fFznMFebl2GztD2GHA-1; Wed, 31 Jan 2024 06:22:43 -0500
X-MC-Unique: sEM7fFznMFebl2GztD2GHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33ae7482b2dso1586636f8f.0
 for <qemu-arm@nongnu.org>; Wed, 31 Jan 2024 03:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706700162; x=1707304962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xoZeNTfDJkpavBmLfMquoZlHC2BBV8svy71fzl6+Ipk=;
 b=YuK4A7mZf2zLc7khW3wcnZV0VN7W0NfqUZVCCOzVUfdKYEtb9bHbhMiBBa4f/1pSAn
 DKYHQc4Mg/ZnRRJhtepOi2l3i7qWwanHunWDu9aMzW69CGB6SnC2dgECSnN4wxJxcfCA
 tUrWfngpj9Zhom0xpET/HlbucouL4gJogjmE6x7ey1nKCAOb0V1IlYeOspOZU3t9sRQi
 8ykCwsY7m99oLfZ0+zELrNUVXam5nbjeHNPQoKg94ORisK2ctR6tJG6+ZOTe0BhcCvSo
 EiwfMjEUopM+FoKS1Lo/caY/5gKdHBnctWvhBUxn5FyOJ43ZRwQIoN4Yo/siXqFSNNwb
 sWIg==
X-Gm-Message-State: AOJu0YyFlIcRAqfFghgQebMydxw7bBxCrTh2OmsAJHrPrmRxvapMtRdx
 voPlHoSj94oFpf/XDdhldoQziVX5lMSmLyOUM6dCpGOq1fdEu5YbeOozljjGXW6/lh4jSHPDmjS
 7v7+4qgHSjvl/TkJw+8lB8Rw8kSGHkI4clWVctCV8jeS7ln+CsQ==
X-Received: by 2002:a05:6000:1150:b0:33a:e9d8:189b with SMTP id
 d16-20020a056000115000b0033ae9d8189bmr901705wrx.71.1706700162270; 
 Wed, 31 Jan 2024 03:22:42 -0800 (PST)
X-Received: by 2002:a05:6000:1150:b0:33a:e9d8:189b with SMTP id
 d16-20020a056000115000b0033ae9d8189bmr901689wrx.71.1706700161904; 
 Wed, 31 Jan 2024 03:22:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cx18-20020a056000093200b0033935779a23sm13177241wrb.89.2024.01.31.03.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 03:22:40 -0800 (PST)
Message-ID: <f139efc5-c34c-4c83-9954-a37bffcb5c90@redhat.com>
Date: Wed, 31 Jan 2024 12:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for
 hotplugged devices
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "yanghliu@redhat.com" <yanghliu@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "clg@redhat.com" <clg@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
 <SJ0PR11MB6744C50921CC63221A93C75492712@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <7bc955a1-f58d-43b1-8e95-c452bb11f208@redhat.com>
 <20240125184822.GB122027@myrica>
 <db8d6171-acd2-4e1e-9c25-c7d12fa26de4@redhat.com>
 <20240130182239.GA1392966@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240130182239.GA1392966@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: VCJVgy0A3hr+

Hi Jean,

On 1/30/24 19:22, Jean-Philippe Brucker wrote:
> On Mon, Jan 29, 2024 at 05:38:55PM +0100, Eric Auger wrote:
>>> There may be a separate argument for clearing bypass. With a coldplugged
>>> VFIO device the flow is:
>>>
>>> 1. Map the whole guest address space in VFIO to implement boot-bypass.
>>>    This allocates all guest pages, which takes a while and is wasteful.
>>>    I've actually crashed a host that way, when spawning a guest with too
>>>    much RAM.
>> interesting
>>> 2. Start the VM
>>> 3. When the virtio-iommu driver attaches a (non-identity) domain to the
>>>    assigned endpoint, then unmap the whole address space in VFIO, and most
>>>    pages are given back to the host.
>>>
>>> We can't disable boot-bypass because the BIOS needs it. But instead the
>>> flow could be:
>>>
>>> 1. Start the VM, with only the virtual endpoints. Nothing to pin.
>>> 2. The virtio-iommu driver disables bypass during boot
>> We needed this boot-bypass mode for booting with virtio-blk-scsi
>> protected with virtio-iommu for instance.
>> That was needed because we don't have any virtio-iommu driver in edk2 as
>> opposed to intel iommu driver, right?
> Yes. What I had in mind is the x86 SeaBIOS which doesn't have any IOMMU
> driver and accesses the default SATA device:
>
>  $ qemu-system-x86_64 -M q35 -device virtio-iommu,boot-bypass=off
>  qemu: virtio_iommu_translate sid=250 is not known!!
>  qemu: no buffer available in event queue to report event
>  qemu: AHCI: Failed to start FIS receive engine: bad FIS receive buffer address
>
> But it's the same problem with edk2. Also a guest OS without a
> virtio-iommu driver needs boot-bypass. Once firmware boot is complete, the
> OS with a virtio-iommu driver normally can turn bypass off in the config
> space, it's not useful anymore. If it needs to put some endpoints in
> bypass, then it can attach them to a bypass domain.

yup
>
>>> 3. Hotplug the VFIO device. With bypass disabled there is no need to pin
>>>    the whole guest address space, unless the guest explicitly asks for an
>>>    identity domain.
>>>
>>> However, I don't know if this is a realistic scenario that will actually
>>> be used.
>>>
>>> By the way, do you have an easy way to reproduce the issue described here?
>>> I've had to enable iommu.forcedac=1 on the command-line, otherwise Linux
>>> just allocates 32-bit IOVAs.
>> I don't have a simple generic reproducer. It happens when assigning this
>> device:
>> Ethernet Controller E810-C for QSFP (Ethernet Network Adapter E810-C-Q2)
>>
>> I have not encountered that issue with another device yet.
>> I see on guest side in dmesg:
>> [    6.849292] ice 0000:00:05.0: Using 64-bit DMA addresses
>>
>> That's emitted in dma-iommu.c iommu_dma_alloc_iova().
>> Looks like the guest first tries to allocate an iova in the 32-bit AS
>> and if this fails use the whole dma_limit.
>> Seems the 32b IOVA alloc failed here ;-)
> Interesting, are you running some demanding workload and a lot of CPUs?
> That's a lot of IOVAs used up, I'm curious about what kind of DMA pattern
> does that.
Well nothing smart, just booting the guest with the assigned NIC. 8 vcpus

Thanks

Eric
>
> Thanks,
> Jean
>

