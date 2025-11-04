Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A3ACCFA04
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 14:45:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGIGy-0003Kv-B7; Tue, 04 Nov 2025 09:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGIGu-0003Hd-Dp
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGIGs-0000kH-3P
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762267469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vd1dQB0UPUpvcusF3WOV760szNTRtpFz6x95IfNTyq0=;
 b=JP4BAITTm1AZPR1kvAA91ZPeZ8utL/naEDE8PZVZ2UdINFoLVQiavkZgkfJ3RodSw/Wrpe
 F73FmL9Ot6ycvxAAgMibeeuCYnNfCM83QFMOHozntBa8u+0t9PqW7HyhRKUzZzFdZ4XHQF
 Pp0ysfOKXkk1jMD5mZOLBVwfcEXZTJ8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-vXdCA03uMNiwSOhtXAYqMw-1; Tue, 04 Nov 2025 09:44:26 -0500
X-MC-Unique: vXdCA03uMNiwSOhtXAYqMw-1
X-Mimecast-MFC-AGG-ID: vXdCA03uMNiwSOhtXAYqMw_1762267465
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-429cce847c4so1645733f8f.2
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 06:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762267465; x=1762872265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vd1dQB0UPUpvcusF3WOV760szNTRtpFz6x95IfNTyq0=;
 b=YuW++KiIhra5cWgjArO5wHNdBn24ruWrGXm4cMDOkfsg1zw39saXlVeL8LCi+yiTuF
 vAPY8lDH86+saprIjSa78GlqJe1gdKUUdXyT14MqzvAb+iyS5NjkZDSPpyGB8Z/FfPai
 cAWDOV175crJaKkjZ5BYvaqWQsjtZHOA3vwoXKkVzOAl4X+gX5SniOjMIoeM6ghu8yE8
 z15jx2r4JtE1tUMflChVrbrkWeu3V5FWSpvqjrD+V/sQEUkadfcCaKuJSYoa+nYN7ulx
 3llETQlm1yVUmpPsqAYiyeMf1w0bOWvwoZFuDuhM0aOPgVbunH93CqeAavAk2pQWLEx5
 heAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrBKA1SVCxgBsHTX2bO4gDchomoT+vNwg0aozV9ZrtiItL+ZOlflOi0GSm+wC/ZE71UzjnzWh/rQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx6AUnCZJ3d0USRZpaB5ZseHP//4/soUoKyd480XJN7SyodUpJu
 DLD0UcCdsr7r2Al0zdjo01OtCZAEoeMVZewbBzoMD9wU4uUw+zs6ROH//80umjFlLr+a9Dou36R
 I9mtRArIB6021juxY2ku0jxdv7iaGFxWfO2I/Jb00zdLJhH9E/Qs+cg==
X-Gm-Gg: ASbGnctCtAPDqKoLS4mBoCN8f/x258PMA7/60nTfdNe798s35g/3J+PuymZh21E9b5c
 RIWY+rgXQ17f2171p4ClpQsD42jvLw2s3NAkpy+WlEXqCRb1gf/6YWZjU6RpCT5Qxl4bGxFE4d6
 vAEx1NVZPO6dbSfEKoSxFBuNhl+VSwkybjVkLDbknjRTclrACm6Jhv2KYJDYqWIRSecYRlLkZUY
 qtHpMHu2bmtu6UgQzOnY7oyIwBXR93BAVhAn8Wzjnq9Ws6TqzBfoKM1Q6nFawL9tPBEEfVr9L1F
 gevzuYFdsknV8qibMiqDdl5cYPZv38glMZeEUQT9BiRaNIMpEmvIATayzUERewrrdQEr7KQhEpI
 NiAeUjJ+uIqLRmQK5imkdJ/Cxb4fRySqOxtubLYKuR5Jclw==
X-Received: by 2002:a5d:5f48:0:b0:429:ce0c:e668 with SMTP id
 ffacd0b85a97d-429ce0ce7d0mr8590626f8f.38.1762267464839; 
 Tue, 04 Nov 2025 06:44:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTmuez/fskKdAtV5f9CfzeUrMrMloDK/QaBMDfHWRFDPUfirstbPpj7fwjHkKJxTbHiGzFjg==
X-Received: by 2002:a5d:5f48:0:b0:429:ce0c:e668 with SMTP id
 ffacd0b85a97d-429ce0ce7d0mr8590596f8f.38.1762267464406; 
 Tue, 04 Nov 2025 06:44:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc200878sm4931913f8f.45.2025.11.04.06.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 06:44:23 -0800 (PST)
Message-ID: <85f315a2-e49a-4330-9419-48a8a3a4a3e3@redhat.com>
Date: Tue, 4 Nov 2025 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
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
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-16-skolothumtho@nvidia.com>
 <318947de-4467-4ced-a5d2-929e3df210ef@redhat.com>
 <CH3PR12MB754815B9B902E7EF66B0A1B9ABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754815B9B902E7EF66B0A1B9ABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lHY0rctDHKw90bn2qYytZJlQseYQCnxpa1oMSdfipLQ_1762267465
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 11/4/25 3:37 PM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 04 November 2025 14:12
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
>> get_msi_address_space() callback
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer, Nicolin,
>>
>> On 10/31/25 11:49 AM, Shameer Kolothum wrote:
>>> On ARM, devices behind an IOMMU have their MSI doorbell addresses
>>> translated by the IOMMU. In nested mode, this translation happens in
>>> two stages (gIOVA → gPA → ITS page).
>>>
>>> In accelerated SMMUv3 mode, both stages are handled by hardware, so
>>> get_address_space() returns the system address space so that VFIO
>>> can setup stage-2 mappings for system address space.
>> Sorry but I still don't catch the above. Can you explain (most probably
>> again) why this is a requirement to return the system as so that VFIO
>> can setup stage-2 mappings for system address space. I am sorry for
>> insisting (at the risk of being stubborn or dumb) but I fail to
>> understand the requirement. As far as I remember the way I integrated it
>> at the old times did not require that change:
>> https://lore.kernel.org/all/20210411120912.15770-1-
>> eric.auger@redhat.com/
>> I used a vfio_prereg_listener to force the S2 mapping.
> Yes I remember that.
>
>> What has changed that forces us now to have this gym
> This approach achieves the same outcome, but through a 
> different mechanism. Returning the system address space
> here ensures that VFIO sets up the Stage-2 mappings for 
> devices behind the accelerated SMMUv3.
>
> I think, this makes sense because, in the accelerated case, the
> device is no longer managed by QEMU’s SMMUv3 model. The
On the other hand, as we discussed on v4 by returning system as you
pretend there is no translation in place which is not true. Now we use
an alias for it but it has not really removed its usage. Also it forces
use to hack around the MSI mapping and introduce new PCIIOMMUOps. Have
you assessed the feasability of using vfio_prereg_listener to force the
S2 mapping. Is it simply not relevant anymore or could it be used also
with the iommufd be integration? Eric
> guest owns the Stage-1 context, and the host (VFIO) is responsible
> for establishing the Stage-2 mappings accordingly. 
>
> Do you see any issues with this approach?
>
> Thanks,
> Shameer


