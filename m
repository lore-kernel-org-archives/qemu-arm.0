Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEFACCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 15:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBEHb-0005zg-1b; Tue, 21 Oct 2025 11:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vBEHY-0005yg-R2
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 11:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vBEHW-00043u-7d
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 11:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761060492;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbrzgMo94ooAa/hP7tAvefYUfhTg/GV6LnkjfJ4a/hU=;
 b=DzMbwQ6UE6UNOmA17mO030bt2a9183eD3G+KkynWGerywz7CdT+VLJbSQB5WUr2oQlBcKm
 /CHn3R+CquiGaYSUCVjb3ACFtZbBQpmBOUyuz3RFiYY+rie70AuPmONB+Ir+ezr8voA8Sc
 yae2ttUyoot0IarCoBgMC1Jh4rsX44g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-AplR0_XINBCfyCXj3FCaRQ-1; Tue, 21 Oct 2025 11:28:10 -0400
X-MC-Unique: AplR0_XINBCfyCXj3FCaRQ-1
X-Mimecast-MFC-AGG-ID: AplR0_XINBCfyCXj3FCaRQ_1761060490
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-471144baa6bso33413445e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 08:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761060489; x=1761665289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mbrzgMo94ooAa/hP7tAvefYUfhTg/GV6LnkjfJ4a/hU=;
 b=nnhN7ecwKy2v3+B1J04qT1AKvkjuuPVg5/um0Onbl3pNSQ990m1N/KjsBqGL3nSSHZ
 1UsJ55qk41z9uezaBnNweFxXLxtWtXGHSHhvzjoXCxIH1I9Nc8rN3ikwwl2oF6qzjnvv
 gZZ7R3MEGaACmcixIT7rjVkxVS3jgi17DqaLYiZEGEibFN8PX9d2Y9OubklR7sQWPy/l
 lHaWM77iOW5bRGtpIR7FAdNH/9sCaJEVFJoPGLqPIh+MIWiUel3MzfVIsKXajLMbfOO1
 SGOOYHgBitxNGKIKk0xC8gvfS63nJ3Lm3kevHzfDn3xO4VZkYzCeIBtu/zfeQIBlA00a
 xcog==
X-Gm-Message-State: AOJu0YzwIDIbUFHBRyZBWKA6ZJygldnf01OPdEAnwhu1eayZCpdyj7n+
 GhcbVgScuB0cmcqIJupc8CVTaxIOUZRHJGaBjCbxj/ENfYd6Jr6g5xkiIpCY2CLfCo8VY7vgeTM
 DlcfqEVGZB1R10YL5+RwRu0jk/qdwV4WcbULiuQCbKjQU1v14DArLAA==
X-Gm-Gg: ASbGncsi/yA1BR4Qg1VNkS6z+JbSolL73J4YVBfse8cTG51S4p7x8oPf2VDQnkjdpFa
 tgXKHjVAlhj2yL5kyXwLQ+xVXRU1fa772Tgxy0cchPKY2ApWMD0ZFgCFplLhXvzN13DbCOVC5/z
 G06syzrlchZVc3IB9BV+IRkYKmN6yBkmVeBPFllKI8OiI1k2OzpxkbI6VaGBgUQg4efj+Yhf4wt
 qgA/lP+6C6R3ZsriBtLw+cJHP1D1Z7+9RoYKJ+9+Bitx8pz1uti0Iqg7PQu0cFAaMRAzrpaxPjx
 TGC3voiL5u6P3KcKPVFfXAa8tXqx3Q8q6lMLByk3IXTBV2aef5dZS3lhOimFgFKxMnmSbxjNErc
 /d3LP
X-Received: by 2002:a05:600c:3541:b0:46d:a04:50c6 with SMTP id
 5b1f17b1804b1-4711791934dmr133224975e9.30.1761060489556; 
 Tue, 21 Oct 2025 08:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiEMgEdUK1kr3M17GRhS1inC/gUeQo+zbKZIJbu14Dbv7PX3rHQ29+tWi708fkbKAob6TmfA==
X-Received: by 2002:a05:600c:3541:b0:46d:a04:50c6 with SMTP id
 5b1f17b1804b1-4711791934dmr133224695e9.30.1761060489106; 
 Tue, 21 Oct 2025 08:28:09 -0700 (PDT)
Received: from [192.168.43.95] ([78.245.103.33])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3b45sm20985267f8f.11.2025.10.21.08.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 08:28:07 -0700 (PDT)
Message-ID: <8d87fa88-2b1c-4ae8-b4c6-89a788da4bcc@redhat.com>
Date: Tue, 21 Oct 2025 17:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/27] hw/arm/smmuv3-accel: Restrict accelerated SMMUv3
 to vfio-pci endpoints with iommufd
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-7-skolothumtho@nvidia.com>
 <b222848f-c933-43dc-b6e0-97dd8455cee6@redhat.com>
 <aPZ+i6Vgxww1OTTo@Asurada-Nvidia>
 <CH3PR12MB754822875EB806B9C5F6889EABF5A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754822875EB806B9C5F6889EABF5A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3VaI3g-OoTihYyX6QFj6LAbHmQgOAmqV-5guhWYLdRw_1761060490
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/20/25 8:59 PM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: 20 October 2025 19:25
>> To: Eric Auger <eric.auger@redhat.com>
>> Cc: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> Jason Gunthorpe <jgg@nvidia.com>; ddutile@redhat.com;
>> berrange@redhat.com; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
>> <mochs@nvidia.com>; smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 06/27] hw/arm/smmuv3-accel: Restrict accelerated
>> SMMUv3 to vfio-pci endpoints with iommufd
>>
>> On Mon, Oct 20, 2025 at 06:31:38PM +0200, Eric Auger wrote:
>>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>>> +    /*
>>>> +     * We return the system address for vfio-pci devices(with iommufd as
>>>> +     * backend) so that the VFIO core can set up Stage-2 (S2) mappings for
>>>> +     * guest RAM. This is needed because, in the accelerated SMMUv3
>> case,
>>>> +     * the host SMMUv3 runs in nested (S1 + S2)  mode where the guest
>>>> +     * manages its own S1 page tables while the host manages S2.
>>>> +     *
>>>> +     * We are using the global &address_space_memory here, as this will
>> ensure
>>>> +     * same system address space pointer for all devices behind the
>> accelerated
>>>> +     * SMMUv3s in a VM. That way VFIO/iommufd can reuse a single IOAS
>> ID in
>>>> +     * iommufd_cdev_attach(), allowing the Stage-2 page tables to be
>> shared
>>>> +     * within the VM instead of duplicating them for every SMMUv3
>> instance.
>>>> +     */
>>>> +    if (vfio_pci) {
>>>> +        return &address_space_memory;
>>> From that comment one understands the need of a single and common AS.
>>> However it is not obvious why it shall be
>>>
>>> &address_space_memory and not an AS created on purpose.
>> We tried creating an AS, but it was not straightforward to share across vSMMU
>> instances, as most of the structures are per vSMMU.
>>
>> Only SMMUv3Class seems to be shared across vSMMU instances, but it
>> doesn't seem to be the good place to hold an AS pointer either.
>>
>> The global @address_space_memory is provisioned as the system AS, so it's
>> easy to use.
> We had discussed this previously here,
> https://lore.kernel.org/qemu-devel/aJKn650gOGQh2whD@Asurada-Nvidia/

Thank you for the pointer. I definitively missed that thread. Seems
Peter was not very keen either to use the address_space_memory. Why
can't we use a global variable in smmu-accel.c ? in hw/vfio/container.c
there is a list of VFIOAddressSpace for instance.
Is there anything wrong doing that?

Thanks

Eric

Eric
>
> Thanks,
> Shameer
>


