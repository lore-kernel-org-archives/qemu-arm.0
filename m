Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1138404ejm;
        Fri, 22 Sep 2023 01:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR6C2wcdjwITX0EWpRDam7+FG1sPN1EeKyM7j/KepGcKZTkboTMDFnSuPffb4zsqAnill+
X-Received: by 2002:a05:622a:48b:b0:412:1926:3365 with SMTP id p11-20020a05622a048b00b0041219263365mr9776657qtx.47.1695370549371;
        Fri, 22 Sep 2023 01:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695370549; cv=none;
        d=google.com; s=arc-20160816;
        b=KKQ+qOTWXltmYYEI/T11HdHvYfJgv2Mpa2avKepuuX3RD2DXvjAtw5f2NC3GqeZRDv
         ny1rV6VGI8/1dkdkdtRB6hetPTr13RcRjTtqnW9sc6OpMld9urs3tDSpp/rcV6OVri4T
         8VNyKtF3fw28v3291YyvabE/DrgiKl8TjRqJctGHD5IsnO0q05rubwzXv85d5y0TSXNW
         eIO288d75gexS4T130a1cOOaoy5WIBoQKbcIkIY2OGnlggDWlaVgDhO28KW59dlVCu9X
         kLs9EPkHLqTuOwgg3NAVrB29YD3QwyHlH4L20iR6M2IZPd/wuwBZqKturqpm8XQOYc64
         csVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=KPnGJ6pUigf9VysrNrEYmrS5dUnPI6KzEbz5GjJ2rr4=;
        fh=ZvQtfmNOaRivFJMjo5SdyeUCcvCawSbAh5zvGc9Yx6U=;
        b=iGHbdy8DACl8ZXpTNhU+A/3y2nQO3v+sjRFAHhFDRwvZwFAzIiS8QtqD8zvkk5iKrb
         68hwYW5nSZCz7ZywvW+BW63HGR0OKg+FhIYoQlnQR0Q2upnRSjKcsRQm67geyx+rBD1n
         PUsXXm3e8aHM54vCa21c+65XNI25h50mQano86S+uFIUgQ8u4g5aDfA1pqk7pNAVNF/3
         zheL1iaC2YQ8aX2fW92iwG3VYS6kg9qd8VFvhBKtDZbJKdwj3Oy22Cfy5gH+rNLEMglv
         WKX20+j7J4SfcwbkTEg27FdZw3V2JF0dA6S8iX0qHX/OuWm1RV00xBh89+Vbz+/VgjOI
         EheA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUa+vH37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020ac85716000000b0040fe13367c8si1938212qtw.243.2023.09.22.01.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 01:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUa+vH37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjbK8-00028R-U5; Fri, 22 Sep 2023 04:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qjbJy-00026O-0w
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 04:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qjbJv-0004qk-HV
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 04:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695370526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPnGJ6pUigf9VysrNrEYmrS5dUnPI6KzEbz5GjJ2rr4=;
 b=BUa+vH375LMs8b3M+LDnSvmaaUEhI62+XDHDZq8aLSDLqQNIE21xC9i5DGylcl69Yx4tFA
 Xy6KL4MnA7hhtp+Mfm5OGREi2BCraCmyd0WxINmnD447D/+/YneGEaewT2zGUDdzLyG1h7
 h4285K6TBC3xy0Qs+qUZ9bFxVRkq0Tg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-8Z2BCGmAN9yhHyEZg8ZVxQ-1; Fri, 22 Sep 2023 04:15:24 -0400
X-MC-Unique: 8Z2BCGmAN9yhHyEZg8ZVxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40478e6abd0so13665815e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 01:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695370523; x=1695975323;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPnGJ6pUigf9VysrNrEYmrS5dUnPI6KzEbz5GjJ2rr4=;
 b=E3AJiJkT4soaz7gV84mDVcCQmRmQphbmHErgQXIXLOaiaZY+zE51jZ8lpgFqUvolTx
 C6A0GvLiqGMOMMAqWMqU4FaKNwu86mM8QY+6vG3aJJ1hFPC9pOwx/dxtQryi5Vd8HlMo
 rK1cL/BtM1MhKYUyApPFJxZpYUkfVWswHOPZfrEHjW4Rw/m3zXuNFKoVOUPB4SH2jLNB
 bGqCikxN4Xqlo0RRN1rKXLi5lHYrcDdeXkw/q7a639AWnECVzIdZhmXfoHOTt195Y3gb
 NwpRU0h51wBs2ZTBm/MBAcSGtV+l2k5M1wuZOoCg5FeIJZev+YiKBR7Bb42fpzDlDJ6t
 FGhw==
X-Gm-Message-State: AOJu0YwmBeMFjEXToKIyKPvEiOt/ZxHVUd27X90oREc/sZP5K8IdvkdU
 n/+23nUtEXmFiLF0jeKIsCMvIov9S2084m0MYsHKIdGx2ZFe9Wa5Jhy+DvGDDTjp4F5AZo6fr12
 2PXdSXjcr+Zim
X-Received: by 2002:a05:600c:1e05:b0:405:3803:5588 with SMTP id
 ay5-20020a05600c1e0500b0040538035588mr2912422wmb.22.1695370523181; 
 Fri, 22 Sep 2023 01:15:23 -0700 (PDT)
X-Received: by 2002:a05:600c:1e05:b0:405:3803:5588 with SMTP id
 ay5-20020a05600c1e0500b0040538035588mr2912399wmb.22.1695370522761; 
 Fri, 22 Sep 2023 01:15:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:7100:dfaf:df8b:54b9:7303?
 (p200300cbc71a7100dfafdf8b54b97303.dip0.t-ipconnect.de.
 [2003:cb:c71a:7100:dfaf:df8b:54b9:7303])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c2d5500b004053e9276easm923265wmg.32.2023.09.22.01.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 01:15:22 -0700 (PDT)
Message-ID: <b67c18d1-a648-81bc-1144-33fb839f2aa3@redhat.com>
Date: Fri, 22 Sep 2023 10:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
To: Ankit Agrawal <ankita@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>, Aniket Agashe <aniketa@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
 <20230915084754.4b49d5c0.alex.williamson@redhat.com>
 <f129b30b-bd0c-4e30-6be9-384b2b79a26b@redhat.com>
 <BY5PR12MB3763FA9922B9059DC14CA80DB0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <BY5PR12MB3763FA9922B9059DC14CA80DB0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NCesU27dGuxe

On 22.09.23 10:11, Ankit Agrawal wrote:
>>>>
>>>> Typically, a command line for a virt machine with NUMA nodes would
>>>> look like :
>>>>
>>>>      -object memory-backend-ram,id=ram-node0,size=1G \
>>>>      -numa node,nodeid=0,memdev=ram-node0 \
>>>>      -object memory-backend-ram,id=ram-node1,size=1G \
>>>>      -numa node,nodeid=1,cpus=0-3,memdev=ram-node1
>>>>
>>>> which defines 2 nodes, one with memory and all CPUs and a second with
>>>> only memory.
>>>>
>>>>      # numactl -H
>>>>      available: 2 nodes (0-1)
>>>>      node 0 cpus: 0 1 2 3
>>>>      node 0 size: 1003 MB
>>>>      node 0 free: 734 MB
>>>>      node 1 cpus:
>>>>      node 1 size: 975 MB
>>>>      node 1 free: 968 MB
>>>>      node distances:
>>>>      node   0   1
>>>>        0:  10  20
>>>>        1:  20  10
>>>>
>>>>
>>>> Could it be a new type of host memory backend ?  Have you considered
>>>> this approach ?
>>>
>>> Good idea.  Fundamentally the device should not be creating NUMA
>>> nodes, the VM should be configured with NUMA nodes and the device
>>> memory associated with those nodes.
>>
>> +1. That would also make it fly with DIMMs and virtio-mem, where you
>> would want NUMA-less nodes ass well (imagine passing CXL memory to a VM
>> using virtio-mem).
>>
> 
> We actually do not add the device memory on the host, instead
> map it into the Qemu VMA using remap_pfn_range(). Please checkout the
> mmap function in vfio-pci variant driver code managing the device.
> https://lore.kernel.org/all/20230915025415.6762-1-ankita@nvidia.com/
> And I think host memory backend would need memory that is added on the
> host.
> 
> Moreover since we want to passthrough the entire device memory, the
> -object memory-backend-ram would have to be passed a size that is equal
> to the device memory. I wonder if that would be too much of a trouble
> for an admin (or libvirt) triggering the Qemu process.
> 
> Both these items are avoided by exposing the device memory as BAR as in the
> current  implementation (referenced above) since it lets Qemu to naturally
> discover the device memory region and do mmap.
> 

Just to clarify: nNUMA nodes for DIMMs/NVDIMMs/virtio-mem are configured 
on the device, not on the memory backend.

e.g., -device pc-dimm,node=3,memdev=mem1,...

-- 
Cheers,

David / dhildenb

