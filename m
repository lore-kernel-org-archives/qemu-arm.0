Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70A6CCFA05
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 15:47:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vH2DD-0004LA-BV; Thu, 06 Nov 2025 10:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vH2D7-0004Kj-Q4
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 10:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vH2D6-00074N-1f
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 10:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762444059;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aE7TurRqo5OKT7bH4ctkLvDjV6pw4ldeuPuc6pRY5fM=;
 b=HUfLmVuPrLAcTQ+r7+IspEwjbYzE3iJgij+epp3Y85b4Pu/BAwWVOZ4gTJ+35TKHx3oVLu
 5HPbEvCur8irHRGEmBRscapgflTC7IyN9OhfPar2PKU8+qP39E0lXEHjDbwpMc3AfiyfFq
 GSlaHs81I1xZiyi4UWXfNnymCrCRqc8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-we31cO4VPzK7tYKldyYl7Q-1; Thu, 06 Nov 2025 10:47:37 -0500
X-MC-Unique: we31cO4VPzK7tYKldyYl7Q-1
X-Mimecast-MFC-AGG-ID: we31cO4VPzK7tYKldyYl7Q_1762444056
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-429c93a28ebso833196f8f.1
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 07:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762444056; x=1763048856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aE7TurRqo5OKT7bH4ctkLvDjV6pw4ldeuPuc6pRY5fM=;
 b=vYyANnT1pwpA1LMJ0Tvz2qx2alf/weV93tuHSyoDMnUQAs85cqFox220Cwd5pLM4Pr
 q8VLlsf+isLhGjx4jACOHCCol4N0fNYxBvk33PxOBIYdLf93Y+mMOPynYArwflV2+Dhw
 cW3W4wy3ArTUz7eBaGMspmbthBqvfq3F4rSRi+D5XtgHgYqHUmA7gMVil3h5wUZ4J0TE
 8lwedRV3/RTOI9gYccGPUkBtUFfdnnO0E7sl5mWA1v2KuaTj51xu87W73MfW2GqlUaHF
 kaepVE6u7Yi2PUCAljY1q0uvJ/pafbYGELpH1Bh5r3lMUOm+0c17Nc+OpYo9xwGJQc50
 cgtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhXqj/i13FDxfDl9lpUkl9aPQ46Vcb7ZSAUCnC2uqPSayJobwi5xE0IRolXASWenQC59EiwI12pg==@nongnu.org
X-Gm-Message-State: AOJu0YwXjUbd92xYYiut2SzBE/QaqjtqRxqbUqigJSr/a65Er4E20sNH
 Oy8Yfol2ylKR9NttPpZWgjrk3icT2Jojti+DJYKXqleoNvcrs1+CYhK12XGAhuocP4vXccsy3/s
 ro64Zg69AJkOakxvDxpxJh9GaIjnzx2c/yeY7wmB+6VB/GjxypbNnpg==
X-Gm-Gg: ASbGncvu8awvjmOzAMN9atUWMAON0nySEVbGn8kIpcVOERq5918RE6PbwPCRxdskUey
 8yT9w46ateJXQ8fCz19hp6IE1LfXT8AIk46nvdAwUkNyQO65XwmImEkSR8p6JK2cl0ywUxP5pLW
 OHMzfPXsH6KRHW4gFBsBLT8lwdO2e1qcNP56kNsav8OY/fGgvGLD71kQU177kYd2uinDpjBPNiu
 EOj1Dh/jRZm+Y9NSg9c21ZLKEqqbjzNei6w//sFNydYAVXR2uleKYalLwtVLJNUd22eW169O/73
 gFyGjEYdtaFAEDK+qNeVMJEGEepCxT3fuVmFCM2xS+9e0G1Q5j1Mu3JCSsG+WX/YOhgaocywmeV
 UMk2nVhIHJN+3NaUtyQOqWG2cq8RvC7CjHv7czmu3rmHnvA==
X-Received: by 2002:a05:6000:400b:b0:429:bca4:6b44 with SMTP id
 ffacd0b85a97d-429e32cb6c8mr8181892f8f.13.1762444056510; 
 Thu, 06 Nov 2025 07:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoWf6QnWSV3o454X8thueDAvDOkcfpC3QtvvBuAqDQXeqLewZP2fZlg92aSx7SgOlHg0xmlA==
X-Received: by 2002:a05:6000:400b:b0:429:bca4:6b44 with SMTP id
 ffacd0b85a97d-429e32cb6c8mr8181866f8f.13.1762444056079; 
 Thu, 06 Nov 2025 07:47:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb4772basm6531403f8f.26.2025.11.06.07.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 07:47:35 -0800 (PST)
Message-ID: <74f7cf15-beaa-4dd6-b7e6-bb510aa52dd3@redhat.com>
Date: Thu, 6 Nov 2025 16:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
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
References: <CH3PR12MB754815B9B902E7EF66B0A1B9ABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <85f315a2-e49a-4330-9419-48a8a3a4a3e3@redhat.com>
 <CH3PR12MB754844745DF256D7FF2CB07AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <e4fd6d1e-3fca-457b-ac6a-69e721d799f4@redhat.com>
 <CH3PR12MB75489F2161213432D34688D2ABC5A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <7ac24d9a-0caf-48cb-832c-812fecc5c82c@redhat.com>
 <20251105181049.GU1537560@nvidia.com> <aQuYZM/8SX+RtDtv@Asurada-Nvidia>
 <20251105185816.GW1537560@nvidia.com>
 <f0c5945d-ec24-4bb9-827c-c3e57abdea36@redhat.com>
 <20251106143217.GA1732817@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251106143217.GA1732817@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wb9ztRuNC61N6MBcW4beb-jlU659NN65DhcSaOUmmiE_1762444056
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.271,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 11/6/25 3:32 PM, Jason Gunthorpe wrote:
> On Thu, Nov 06, 2025 at 08:42:31AM +0100, Eric Auger wrote:
>>
>> On 11/5/25 7:58 PM, Jason Gunthorpe wrote:
>>> On Wed, Nov 05, 2025 at 10:33:08AM -0800, Nicolin Chen wrote:
>>>> On Wed, Nov 05, 2025 at 02:10:49PM -0400, Jason Gunthorpe wrote:
>>>>> On Wed, Nov 05, 2025 at 06:25:05PM +0100, Eric Auger wrote:
>>>>>> if the guest doorbell address is wrong because not properly translated,
>>>>>> vgic_msi_to_its() will fail to identify the ITS to inject the MSI in.
>>>>>> See kernel kvm/vgic/vgic-its.c vgic_msi_to_its and
>>>>>> vgic_its_inject_msi
>>>>> Which has been exactly my point to Nicolin. There is no way to
>>>>> "properly translate" the vMSI address in a HW accelerated SMMU
>>>>> emulation.
>>>> Hmm, I still can't connect the dots here. QEMU knows where the
>>>> guest CD table is to get the stage-1 translation table to walk
>>>> through. We could choose to not let it walk through. Yet, why?
>>> You cannot walk any tables in guest memory without fully trapping all
>>> invalidation on all command queues. Like real HW qemu needs to fence
>>> its walks with any concurrent invalidate & sync to ensure it doesn't
>>> walk into a UAF situation.
>> But at the moment we do trap IOTLB invalidates so logically we can still
>> do the translate in that config. The problem you describe will show up
>> with vCMDQ which is not part of this series.
> This is why I said:
>
>>> Thus, the general principle of the HW accelerated vSMMU is that it
>>> NEVER walks any of these guest tables for any reason.
> It would make no sense to add table walking then have to figure out
> how to rip it out.

understood. Though strictly speaking you are not adding it as it is
already there ;-)
>
>> But anyway you need to provide KVM a valid info about the guest doorbell
>> for this latter to setup irqfd gsi routing and also program ITS
>> translation tables. At the moment we have a single vITS in qemu so maybe
>> we can cheat.
> qemu should always know what VITS is linked to a pci device to tell
> kvm whatever it needs, even if there are more than one.
Yeah we can work in that direction instead. But this could be worked on
later on along with vcmdq series as well ;-)

Eric
>
> Jason
>


