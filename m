Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp1070370ejb;
        Wed, 14 Jun 2023 02:10:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wiiBpwD/uLzECFhkOiZiHv96mP0gFaMZp0pMFG+tLQ1Jj9hkyCYKCmLmfRZJ/PqZBfmF3
X-Received: by 2002:a05:6214:508f:b0:62e:ba9:e962 with SMTP id kk15-20020a056214508f00b0062e0ba9e962mr2606222qvb.56.1686733825934;
        Wed, 14 Jun 2023 02:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686733825; cv=none;
        d=google.com; s=arc-20160816;
        b=YbcT5WcwDmhhp1DTwFTmrCMVO0c1gL3n3JtRP8Y8UMlGMD8FB15zjqvighf/BqfUJt
         y0qBYwLA6AbfGl+sddFLv0OcdYyIb9TYJi3s1fCl/5NCQ1joEdJ33Cwa/DmnJ+8ZCt4V
         8ozopzZ7QCh7doSeI51HyeOTkkmHvMmrB7dSuia5gckadfY+9BodPg1xwFsVZTKQ6lQx
         AvVzUf8ZG/UIHHZJZE05O5x7yNAlxWZ8zi008ms2u4/IQqUNPCL6mSWHpnTRTB1tej14
         d9q1ntT9rTJleJ8iV3rvi5ca8aoTBPw6guQcFCZCkgjXLSEOMBtk33YeeuIKVDTq5os+
         TCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=8HURIhnaM69iRttU1+pKgIm0TAFPtJYpzFlhjrQhN60=;
        b=CRQmvbmBwdyFO7xBYqbPM87XDv9qBpGu+xgBnHuylfMerErcV6TDNgV1iHHY3XeXmx
         K5JxoeVDkO8YFsv8d7RReG56UuoIQfoQX4aF3JEP2TjCr0yI+o5PfjMlYwFqQFU9DpJ8
         9BhEYQmq3yb4KDFgBKrSWkU8cS0rSNayx7rpJi21i2vGp6wtRtt0jVebnCh2ueVH5EPc
         mjHFKZa1wbTfMNUOMXWXcMaFYToFQaWqhn1biWDorHMGyvP+7KqpkxI9cnXn/2aKSA2R
         EcYnUBDOHgxPfHv67v285tLOHEfhwo37pQWr4G5nDnqtk2weErgn6m3HEwBGUNLC40ef
         xWdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=etrrCpHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey5-20020a0562140b6500b0062dfad6c53bsi1491138qvb.289.2023.06.14.02.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 02:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=etrrCpHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9MW3-0002W4-OO; Wed, 14 Jun 2023 05:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q9MW1-0002VK-KC
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 05:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q9MW0-000785-3l
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 05:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686733807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HURIhnaM69iRttU1+pKgIm0TAFPtJYpzFlhjrQhN60=;
 b=etrrCpHY5dvICA9pgjFYmgpwGBY9zU1FtZhvurm992+nzaWYV4v7kC9Xb73RDlarhRgema
 aBgjSvYCtWoJYgt/rYJQ6q59E1qjO32Vv5wSQTSV4S1KnfCfBolafZ5CwSh6JJQB2JwDDn
 woYxXEIwKwfac1xuO/5CFyM1AclizSs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-lc24Zd2GMQWLw3cFFj4l6A-1; Wed, 14 Jun 2023 05:10:04 -0400
X-MC-Unique: lc24Zd2GMQWLw3cFFj4l6A-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4edc7406cbaso1370628e87.2
 for <qemu-arm@nongnu.org>; Wed, 14 Jun 2023 02:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686733802; x=1689325802;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HURIhnaM69iRttU1+pKgIm0TAFPtJYpzFlhjrQhN60=;
 b=NBe5SLFX4GJVoWJ/xhLwENYkUPGGCGCTGFs4tHQRwu4I2mYKdQOzenNfHc2PhWSMJ8
 I8szJQLfe0zFy8Q0WdL1GdFlUR5nlfgb2x0RzXjvKkRNG5LU4IDd83n0uXO73kxSmk2E
 KgHfKkQSuvtbJMkdTBwKY7+JZ6mC10zmWQJ7lfTa0ldr+YAqvxIC9hl12WrAHmSCl7HZ
 BaS32JASIVi/8iO50MoYD4VbSU0MH/MuzUoz31XhA4poL6cvM9Oyc9wpDEYZocDHqGsK
 f55gMA+q6oJgmK0fsmvLXBInVBdL78FlfsRLNnnzftqx8IfhdfI5IdzOtsJ9vdtqY+j6
 I2IQ==
X-Gm-Message-State: AC+VfDyTFSEp5TYR0cft12WKfe1GOElFm495k6yuS7X3m6Aagkx0RWqv
 PfO76BbSznqlS0iZanOLcqvv8jESZj6K2ZHH0tEaOhNySF3sMzo9IA3HL3ObTo9/DrYo9ivtpM3
 +aU8MykX+7cY4
X-Received: by 2002:a05:6512:286:b0:4f6:3ab6:3d9e with SMTP id
 j6-20020a056512028600b004f63ab63d9emr7691089lfp.59.1686733802623; 
 Wed, 14 Jun 2023 02:10:02 -0700 (PDT)
X-Received: by 2002:a05:6512:286:b0:4f6:3ab6:3d9e with SMTP id
 j6-20020a056512028600b004f63ab63d9emr7691080lfp.59.1686733802254; 
 Wed, 14 Jun 2023 02:10:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:b200:7d03:23db:ad5:2d21?
 (p200300cbc704b2007d0323db0ad52d21.dip0.t-ipconnect.de.
 [2003:cb:c704:b200:7d03:23db:ad5:2d21])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a7bc8c9000000b003f8140763c7sm11729459wml.30.2023.06.14.02.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:10:01 -0700 (PDT)
Message-ID: <83978976-1b13-8300-19b0-7b3c24be556c@redhat.com>
Date: Wed, 14 Jun 2023 11:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/10] memory-device: Some cleanups
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230601121447.272487-1-david@redhat.com>
 <20230601121447.272487-2-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230601121447.272487-2-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.098, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WgHU0seOEw4T

On 01.06.23 14:14, David Hildenbrand wrote:
> Working on adding multi-memslot support for virtio-mem (teaching memory
> device code about memory devices that can consume multiple memslots), I
> have some preparatory cleanups in my queue that make sense independent of
> the actual memory-device/virtio-mem extensions.
> 
> v2 -> v3:
> - "memory-device: Introduce machine_memory_devices_init()"
> -- Declare the function in hw/boards.h
> - "hw/loongarch/virt: Use machine_memory_devices_init()"
> -- Use VIRT_HIGHMEM_BASE
> -- No need to include memory-device.h
> - "hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZ"
> -- Add more details why it's ok to the patch description
> - Adjust to memory_devices_init() -> machine_memory_devices_init()
> - Add RBs
> 
> v1 -> v2:
> - Allocate ms->device_memory only if the size > 0.
> - Split it up and include more cleanups
> 
> David Hildenbrand (10):
>    memory-device: Unify enabled vs. supported error messages
>    memory-device: Introduce machine_memory_devices_init()
>    hw/arm/virt: Use machine_memory_devices_init()
>    hw/ppc/spapr: Use machine_memory_devices_init()
>    hw/loongarch/virt: Use machine_memory_devices_init()
>    hw/i386/pc: Use machine_memory_devices_init()
>    hw/i386/acpi-build: Rely on machine->device_memory when building SRAT
>    hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
>    memory-device: Refactor memory_device_pre_plug()
>    memory-device: Track used region size in DeviceMemoryState
> 
>   hw/arm/virt.c          |  9 +-----
>   hw/i386/acpi-build.c   |  9 ++----
>   hw/i386/pc.c           | 36 +++-------------------
>   hw/loongarch/virt.c    | 12 ++------
>   hw/mem/memory-device.c | 69 +++++++++++++++++++-----------------------
>   hw/ppc/spapr.c         | 37 +++++++++++-----------
>   hw/ppc/spapr_hcall.c   |  2 +-
>   include/hw/boards.h    |  4 +++
>   include/hw/i386/pc.h   |  1 -
>   9 files changed, 67 insertions(+), 112 deletions(-)
> 

Any further comments? If not, I'm planning on taking this through my 
memory-device tree.

-- 
Cheers,

David / dhildenb

