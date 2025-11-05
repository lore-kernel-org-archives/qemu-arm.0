Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F347CCF9F8
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Nov 2025 17:33:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGhNQ-0000NJ-UR; Wed, 05 Nov 2025 12:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGhNM-0000MM-6q
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 12:32:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGhNJ-0006H5-M7
 for qemu-arm@nongnu.org; Wed, 05 Nov 2025 12:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762363968;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETut4KkNWT/BCT5wy0gh0ieCKE10jSt3ObhCH+eQVFo=;
 b=ADV1CBbywAu8WnWfNbBj1nLZZDNTIvecU+4SSDmCg6OIkikuuypuMJbYqee+mRNz0+TAhm
 SN0/krBqsGQ2DbXowgt801Vx9eL2L5eIw0xXiTZFkkVO58qUqJ/FYkvFQ58cuk4KpJI10T
 XY2If9bzz/AeCqsg0StGXbZh6mgTyqY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-xwo9cR7bNuqlOovPKvYcXA-1; Wed, 05 Nov 2025 12:32:44 -0500
X-MC-Unique: xwo9cR7bNuqlOovPKvYcXA-1
X-Mimecast-MFC-AGG-ID: xwo9cR7bNuqlOovPKvYcXA_1762363964
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-475dabb63f2so244225e9.3
 for <qemu-arm@nongnu.org>; Wed, 05 Nov 2025 09:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762363964; x=1762968764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ETut4KkNWT/BCT5wy0gh0ieCKE10jSt3ObhCH+eQVFo=;
 b=BfgVQatihTrCei6dW6jQ6Wabp+TqW8gW3IumCxZhvVgbc9vRAr+00NQ26ZOMEQZRjI
 RLBjp9tEQ/tilUV0xvjKYxgiISlsbVQZh1Tk7XNbolFFY6FRgIiDUrPurj6OCoaOfnJE
 wh+DNhDoUNwGJUMWGOU+ouD8/9y28n08cMg4SEflRIwkjbSJFTmFWxdbElIMCf99gUGp
 zs8rVijU8+EuSbtAJxmoQMiZHZkvtO2iNvr1l5glxhQTx1zpVQL7KAfAVqrdZOJXa1tI
 lX1+vMnf+Th/ZM0cBK9j0PyzX/gZ20d84UK2xAcXuaGrWUEKSYxoYzxx2JOFj4DmnAQo
 wcdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu00tVeIbUajVjMXMHLW/uDUJ5MgFrM2qq0fWmwW8fodXQ9niZ+rf9YUOq9rdRlRyTP9RNTsXq/w==@nongnu.org
X-Gm-Message-State: AOJu0YxpnY281NQ6qss4+++rT5pfpBXCT5cOXy3YaInq1GuuyndwJg10
 k8w3fRjqNcoZZN/+Kx2drg7lIABaMiZQ4Q9J6j/zKahpUCcw+iOOsPTtASsYExtDyEbXnmL2OmC
 suJhgMud5PHltPJOT2Wg5CgJP4zxwmJ/rbuGalInShnT3QcGkcX1j4A==
X-Gm-Gg: ASbGncuZ0/CfJIhqv+CbEuj+Go8gW2A81qkG5BF9WKW2tarjBmVdYddc2ifpsC9NLG7
 o9OmF9RJHvOYghTACGqLatkwIm1/UBNqCBpqNk9Woxl44rThK4IaWt1hRLI1r0lRWTFP3AeotWP
 Y55y8sRFvAGChfv1znvmRyDn6hjMIBncJ1NR84Dlc1U74me3Xqqdz9f3G0rftd/93L+UzzKjBKw
 SWDKXgUi7d8jAo6KRA7MMRZUMwahY0GWaE6M24fvQrvwdmwKyzZYjAYfT7pNbUixN0wMLbhJZGs
 taP8mqlZ9hLu21P7muidrhe09Wm1p8rz7OwalS2kb8fXXmLCrm1na+jiSBiqRfvxbHbn+2uDxzp
 i9edxsJwC/zNeqWK0uh7W7vIEMnWFL+fJpMY4vTqD/lhbzA==
X-Received: by 2002:a05:600c:348f:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-4775cd3bd61mr43957875e9.0.1762363963598; 
 Wed, 05 Nov 2025 09:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2gTPfMaLwxZaRw0Z4Nl7Bp9jmdrjyUSPZTDYdLSX9khLuz+6HeMLAlGkR+PPci8tJzlc8IA==
X-Received: by 2002:a05:600c:348f:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-4775cd3bd61mr43957475e9.0.1762363963190; 
 Wed, 05 Nov 2025 09:32:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775592eeaasm49683145e9.3.2025.11.05.09.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 09:32:42 -0800 (PST)
Message-ID: <e9d5300a-6aab-4b17-828f-3d3a4d3071df@redhat.com>
Date: Wed, 5 Nov 2025 18:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251031105005.24618-16-skolothumtho@nvidia.com>
 <318947de-4467-4ced-a5d2-929e3df210ef@redhat.com>
 <20251104142052.GD1537560@nvidia.com>
 <CH3PR12MB7548E5E1A2DFE297C4C65E0AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20251104145157.GF1537560@nvidia.com>
 <CH3PR12MB7548379E64E7A12904B5BF7AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20251104151234.GG1537560@nvidia.com>
 <CH3PR12MB754877D400D19E57AFB16D0BABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20251104153535.GH1537560@nvidia.com> <aQoz2+bLMJWNoVwx@Asurada-Nvidia>
 <20251104174152.GI1537560@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251104174152.GI1537560@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lT4LSsVLBnyR2Sp4OOwfLU2nS8T-320HRRK6al3CqpE_1762363964
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 11/4/25 6:41 PM, Jason Gunthorpe wrote:
> On Tue, Nov 04, 2025 at 09:11:55AM -0800, Nicolin Chen wrote:
>> On Tue, Nov 04, 2025 at 11:35:35AM -0400, Jason Gunthorpe wrote:
>>> On Tue, Nov 04, 2025 at 03:20:59PM +0000, Shameer Kolothum wrote:
>>>>> On Tue, Nov 04, 2025 at 02:58:44PM +0000, Shameer Kolothum wrote:
>>>>>>> Sure it is trapped, but nothing should be looking at the MSI address
>>>>>>> from the guest, it is meaningless and wrong information. Just ignore
>>>>>>> it.
>>>>>> Hmm.. we need to setup the doorbell address correctly.
>>>>>> If we don't do the translation here, it will use the Guest IOVA
>>>>>> address. Remember, we are using the IORT RMR identity mapping to get
>>>>>> MSI working.
>>>>> Either you use the RMR value, which is forced by the kernel into the
>>>>> physical MSI through iommufd and kernel ignores anything qemu
>>>>> does. So fully ignore the guest's vMSI address.
>>>> Well, we are sort of trying to do the same through this patch here. 
>>>> But to avoid a "translation" completely it will involve some changes to
>>>> Qemu pci subsystem. I think this is the least intrusive path I can think
>>>> of now. And this is a one time setup mostly.
>>> Should be explained in the commit message that the translation is
>>> pointless. I'm not sure about this, any translation seems risky
>>> because it could fail. The guest can use any IOVA for MSI and none may
>>> fail.
in general the translation is not pointless (I mean when RMR are not
applied). In case a vhost device (virtio-net) for instance is protected
by SMMU, vhost triggers irqfds upon which a gsi is injected in vgic.
This latter does irq_routing mapping and this gsi is associated to an
MSI address/data. If the MSI address is wrong, ie. not corresponding to
the vITS gpa doorbell, kernel kvm/vgic/vgic-its.c vgic_its_trigger_msi
will fail to inject the MSI on guest since
vgic_msi_to_its/__vgic_doorbell_to_its will fail to find the ITS
instance to inject in.

Thanks

Eric
>> In the current design of KVM in QEMU, it does a generic translation
>> from gIOVA->gPA for the doorbell location to inject IRQ, whether VM
>> has an accelerated IOMMU or an emulated IOMMU.
> And what happens if the translation fails because there is no mapping?
> It should be ignored for this case and not ignored for others.
>
> Jason
>


