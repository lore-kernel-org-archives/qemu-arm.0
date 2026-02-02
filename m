Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75944E7DEEE
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 15:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmvra-0005Mc-FX; Mon, 02 Feb 2026 10:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmvrZ-0005Lx-Dw
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:29:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmvrX-0003eH-Oh
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770046154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgFb6mKmuQCNDjBz/M8/sot3Bf4WvQrdgrbuBx+xG/A=;
 b=gO5OfCuASL884QWot+mP+OWsvWB3G3p7mCFZabbRQWrQ1NaSFE6mFJNBFCAEMfSVRSw5Wc
 9lmJBW2GOTsRPlYCf8QDJKVV4ReTzBBJcCeLtuB4kUUtMsF1K7McPxvS+K3jZnL5lvMSoO
 rEbBd9z0WP8ioEw97EhghnnTqdOfVGM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-ejc9GN0kNFCloaK_kB00Xw-1; Mon, 02 Feb 2026 10:29:11 -0500
X-MC-Unique: ejc9GN0kNFCloaK_kB00Xw-1
X-Mimecast-MFC-AGG-ID: ejc9GN0kNFCloaK_kB00Xw_1770046150
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430fcfe4494so4469826f8f.2
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 07:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770046150; x=1770650950;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgFb6mKmuQCNDjBz/M8/sot3Bf4WvQrdgrbuBx+xG/A=;
 b=uBUBNstVHjVUsvDxbsRQKRasu/0hslc3/xDpNtMtABm76fq/s2KEQDC+M6d1qWB/9G
 J38XfLMJf69+Dm/U4cOKV9ze4Ux9wzwmT290FGcYGhsKv2nYEoAgRz8BYRtJ7jIUoEuu
 kQa6QCL32UV5yKP4yz7EOCpLDrYEJAY+c3SpfazS6LtQFaaKzoXYR5W8BTSe4bOdooc7
 PUh6Y431cyLWfZ59TSqpUURVlRX6HLYO/7/Yle+aoMWZ/K1JHGQ8gaktSMMVPME7jmSw
 MDAvsihB4Tp0M5vcLYptYU7ABEZ59CwZxKXQXAb8QYCIKCto1qPAWK0lQhUmmFUlZoHD
 ftdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTZE4O4rSHGfkaNUvs0mw+bS9hj2S36OAmL/ZAsY1eMgPRpwaRGVz+Pxp4CqQWTsApT/o86u+GDA==@nongnu.org
X-Gm-Message-State: AOJu0YyI6hZdX939mACb4V9KNmwliicx7adD4ixl0pg4olYvyRAvUQmq
 1tAc78aFoD2VJHSzqRsUIlTK8WvVDH/K14XKGZzf2oBIYD7l2/ZvXjoNwMfrOZ/aEStpVC9wGpV
 MLozR+cMMZmTeK3acPv51Q4G87qrI8xmSbYa0UHLdgLqNtWMlHwNsrQ==
X-Gm-Gg: AZuq6aJxCeLrilO+mJ2oKpTM773ZCs8tQeH+7gK1pT7rA7sOnISc6+Vnm0DtEo37FnE
 alGckq4Qt3rYYsY7ZVeL2x73Rswp1RQYqH/kB8x5L2o9lCQyrL3kz/ddBTsaxYssFnc4W7tUAud
 AchPM2nQuZHXbY4tD1vFSk1g2xFbGU5+iuLjXJc7esYsfvxOfqC5AqkPulVsRu/WJM0dwI2QDmL
 f7izWsC1qPwd8QpnD4snQcEO08PwG9lEQa6Csw1vFO89lIwMuTxMLA9hOnpqQ9bH9cFVmKsWsse
 RWv8kIGwwt6SIPKTNMhCIZrfr70cK8mJbllmZkMA60qqBIQQcu12F0rJfk8SRpSRug+qbDNciCg
 MWwW732vZQ2b9Wh8u5xfcF4hduUhDxsvGcQOFmeTRT6fPExlv+hxPMgRtKw==
X-Received: by 2002:a05:6000:310c:b0:435:9770:9ec8 with SMTP id
 ffacd0b85a97d-435f3aa9ec7mr17720760f8f.32.1770046150292; 
 Mon, 02 Feb 2026 07:29:10 -0800 (PST)
X-Received: by 2002:a05:6000:310c:b0:435:9770:9ec8 with SMTP id
 ffacd0b85a97d-435f3aa9ec7mr17720694f8f.32.1770046149771; 
 Mon, 02 Feb 2026 07:29:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132368csm41755900f8f.31.2026.02.02.07.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 07:29:09 -0800 (PST)
Message-ID: <afd46d73-a823-4952-b5b2-d5cd4085e7ba@redhat.com>
Date: Mon, 2 Feb 2026 16:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 31/37] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "clg@redhat.com"
 <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260126104342.253965-1-skolothumtho@nvidia.com>
 <20260126104342.253965-32-skolothumtho@nvidia.com>
 <d9192ae6-a94f-479a-b19f-734cc52a6be0@redhat.com>
 <CH3PR12MB754867E986856DC7718D4051AB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754867E986856DC7718D4051AB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 67Vn5KHUyI_wgiC7s0r3aFrmsAGqY-yO4qoWXwUV9iE_1770046150
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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



On 2/2/26 4:11 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 02 February 2026 14:40
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> clg@redhat.com; alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>;
>> Matt Ochs <mochs@nvidia.com>; smostafa@google.com;
>> wangzhou1@hisilicon.com; jiangkunkun@huawei.com;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: Re: [PATCH v9 31/37] hw/arm/smmuv3-accel: Add property to
>> specify OAS bits
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer, Nicolin,
>> On 1/26/26 11:43 AM, Shameer Kolothum wrote:
>>> QEMU SMMUv3 currently sets the output address size (OAS) to 44 bits.
>>> With accelerator mode enabled, a device may use SVA, where CPU page
>> tables
>>> are shared with the SMMU, requiring an OAS at least as large as the
>>> CPU’s output address size. A user option is added to configure this.
>>>
>>> However, the OAS value advertised by the virtual SMMU must remain
>>> compatible with the capabilities of the host SMMUv3. In accelerated
>>> mode, the host SMMU performs stage-2 translation and must be able to
>>> consume the intermediate physical addresses (IPA) produced by stage-1.
>>>
>>> The OAS exposed by the virtual SMMU defines the maximum IPA width that
>>> stage-1 translations may generate. For AArch64 implementations, the
>>> maximum usable IPA size on the host SMMU is determined by its own OAS.
>>> Check that the configured OAS does not exceed what the host SMMU
>>> can safely support.
>> After discussion with Kubevirt guys, the management of current RIL,
>> ssidsize, ats and oas options look touchy because it is tricky for them
>> to introspect the host values.
> I may be wrong, but it looks like Kubevirt actually makes use of libvirt. Or
> is it independent?
yes they do? The problem is they don't know how to set the values for
those props besides definiting a kind of hardcoded profile. They are
unused to do that. The best would be to let qemu guess the right values
by introspection through the kernel uapi.
>
> The reason I am asking is Nathan is already working on the libvirt changes 
> for this here:
> https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/thread/5GG76AQTTDUHW5KRANPY3QUII4ZOEYRP/
>
> And the _AUTO suggestion might impact that as well.
sure. That's why I discuss it tight now.
>  
>> In cold plug case at least it looks feasible to use IOMMU_GET_HW_INFO()
>> to retrieve host info:
>>
>> RIL is in IDR3
>> ssidsize in IDR1
>> OAS in IDR5
>> ATS may be more touchy but maybe this can be introspected too?
> Yeah. ATS might require some kernel plumbing as BIOS can override it.
agreed
>
>> I would advocate to turn those options into _AUTO options to give a
>> chance to the user to ask for host derived values.
>>
>> Currently in include/hw/qdev-properties.h we have
>> DEFINE_PROP_ON_OFF_AUTO for a bool and
>> DEFINE_PROP_ON_OFF_AUTO_BIT64 for a 64b
>>
>> RIL can match bool.
>> Others may need a new DEFINE_PROP_ON_OFF_AUTO_* one.
>>
>> Note such kind of auto property was introduced for virtio-iommu
>> (DEFINE_PROP_GRANULE_MODE)
>>
>> What do you think? Most probably this has been dicussed in the past but
>> I do not necessarily remember the outputs.
> IIRC, the only conclusion was that the user has to specify the SMMUv3
> parameters.  Don't think the _AUTO option was discussed previously.
> If this is a very useful thing to have, I can take a look.
If this sounds feasible, I think this would be a more relevant approach.
The default values could be kept as is for now and we would let kubevirt
set AUTO value until the default gets changed.

Eric

>
> Thanks,
> Shameer


