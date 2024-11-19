Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3114158njc;
        Tue, 19 Nov 2024 00:18:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYQiXPbsuS/WKXCpINj7dlboEaNZwrU02AKv/TGOqAqFl0AA9QlVcU9uEEaDlnh4QKEdbpi2kOMWprnA==@linaro.org
X-Google-Smtp-Source: AGHT+IEgn9ASvk/8o1gv0jYlfB6/rP6G9cLpaf+ST2MKaTiDZK3Pb8Vj9giPlwzRG47IN0zi50je
X-Received: by 2002:a05:620a:190c:b0:7b1:543d:c99 with SMTP id af79cd13be357-7b3622dba74mr2049738285a.24.1732004289901;
        Tue, 19 Nov 2024 00:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732004289; cv=none;
        d=google.com; s=arc-20240605;
        b=WSmK+NVE90QgNys5ZAUmjjr8poovjZavJCafOtpF+R7sw9kazQ/wo+QXe5H2FE3Wjh
         e3I1YhDUyBMdzuRnT6VjV4GSkBehS3pvoRokpU/f7XdN4BCOxzgD7nI9x5YGkT/27lpO
         BOKoz7TgwrkwLS5FZAsmd3IUQDE0bcy56kev9mbJJ00fGyz2ZeqoW+2Bou8bkqwk1dtX
         ckUgHNYEa4L7EcLiSXkLCNfpY0gqpgCwfIInvdWalwTeZ3hKQ3GSJvrEgxD8h0RxPM0o
         E/LAe0fRvtRG362VzsJ1T+WC7SqR2gL4nZU6Qpit2L5zdQdpvhOSQ82KjxjHLdfz6pdG
         +5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+zjyO/ZAFSLWpzWsLEwOawT5J5qw9RFsT6JMYjgspwY=;
        fh=Tl8pMFcscSBARSwJmNEaQwmM+DOTB01RJGAlf3qswvE=;
        b=Lc4nF0khzOx96M17YIr3FwAkqvnS8m0qISXz6Cor+8X1tCvxq/egCdZNGSXCN8EczB
         ok6xWoLyeweQA334ft7lRyUYxhK8mqXjqaVpu50Fpg5J7Jb+euBbuem5hALxdcyL5TxC
         8Zp4X1e296BF2VPTveiMLv4yn8Nqd+sgumSwxZolEyvOIAUiA72QjiYQufKn6p5Qntlh
         M1eAlD335alJj3iXA144X0pCy0HiKpBhuLoZgcyvWaKSA9c71HNx7xVqRerfAHcY3ymy
         ASeGHUze4Bz6rsXnIiRxxq2X66J0ay+FlVeGZr3CYHa5WUKMZN7v3a9o5hpzcbFQ0nTz
         k8NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cDlfATnJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b37a87ff80si166302285a.302.2024.11.19.00.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2024 00:18:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cDlfATnJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDJQn-0001kl-GU; Tue, 19 Nov 2024 03:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tDJQl-0001kF-IE
 for qemu-arm@nongnu.org; Tue, 19 Nov 2024 03:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tDJQj-0000RB-91
 for qemu-arm@nongnu.org; Tue, 19 Nov 2024 03:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732004266;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zjyO/ZAFSLWpzWsLEwOawT5J5qw9RFsT6JMYjgspwY=;
 b=cDlfATnJu041dFCPFR/iDWbKIWkssTmiHVE2IkxyOIgQiuKhHjEzl58QhdED35eeUdmqsX
 hk91B1MYdkELEcCCgDpTJz9axWft/+GDPHNb9yz3EPP/GLGHSIpmK0n5CMiw9Q/1GFk4Rh
 AYlmED4kda2knwkcgdHY1BAu8st6i6A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495--Nqg7PvhM8ad3mwKskTfhA-1; Tue, 19 Nov 2024 03:17:45 -0500
X-MC-Unique: -Nqg7PvhM8ad3mwKskTfhA-1
X-Mimecast-MFC-AGG-ID: -Nqg7PvhM8ad3mwKskTfhA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4315cefda02so29726145e9.0
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2024 00:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732004264; x=1732609064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zjyO/ZAFSLWpzWsLEwOawT5J5qw9RFsT6JMYjgspwY=;
 b=NJSqsEq4DPYGZJpunUN93ojnfxwmcWBTlu+rypYuFVT789EC70tbwfHjLhaw3KqUa7
 UlMBlWq3iSUjDFzGMyCqMPk27llLknOyKFbz9dqL23mwZvPxuCbssSfWaK1YqThrxGuw
 N6k1Gk10xcN6jFcqupz/WKxoCmT/OdGeQv4l7+K4XPY5kMhp2IkCVKgvUHSxHOqGhYdj
 jFgAaYr8v7Hv6/Etxk9v1a7VCiTHjT1Ul4GzPqh7w3lhMs7cesIR+1t4xNH4AEuQokgB
 +gB/tihfR+N6iza3EJoHJZc/R83eeYvpOf0hMPK2jaaKcgQBvjA3s42ywTk26CTMkxc2
 OisQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPi4F1uqdAk2lwpGPQcQ71JhNWPZgmvTmpVDsd3K3VsiqEnJCcD/83GKCE++Er8VfOVXg2P7xxXg==@nongnu.org
X-Gm-Message-State: AOJu0Yxg4Ptjwa8x1bExwufyfykh9EmHF2aY6prHCaQE/ihaIKwo8uy3
 zKURA1PRZhZSJo1uj4i7D8YjjCbESOcj6mFffIdvSWA46JqmCKkqIzHLel8e5aUOEFJkmvVaJe/
 jIt214VFvGHJB8P6gYWP1TQNaP+z9ytkueKRElstNNxjv/1LWRw==
X-Received: by 2002:a05:6000:1846:b0:382:49f9:74bc with SMTP id
 ffacd0b85a97d-38249f977cbmr4134828f8f.41.1732004264370; 
 Tue, 19 Nov 2024 00:17:44 -0800 (PST)
X-Received: by 2002:a05:6000:1846:b0:382:49f9:74bc with SMTP id
 ffacd0b85a97d-38249f977cbmr4134793f8f.41.1732004264016; 
 Tue, 19 Nov 2024 00:17:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3824b28ef5fsm3164566f8f.5.2024.11.19.00.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 00:17:43 -0800 (PST)
Message-ID: <95d39240-f2e2-4427-a822-380e22783279@redhat.com>
Date: Tue, 19 Nov 2024 09:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>,
 Andrea Bolognani <abologna@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "arighi@nvidia.com" <arighi@nvidia.com>, "ianm@nvidia.com"
 <ianm@nvidia.com>, "jan@nvidia.com" <jan@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, Don Dutile <ddutile@redhat.com>
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
 <1845a6b8-5214-4379-85f4-3d36b61059dd@redhat.com>
 <Zy0jiPItu8A3wNTL@Asurada-Nvidia>
 <e36a1c1c-c880-4c64-82f9-34d55a04bd00@redhat.com>
 <SJ0PR11MB67448860487317755CCCF76192202@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB67448860487317755CCCF76192202@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tF_PJNcaIek4UA-EpgOrQSGcS9OiNWfqYT-F_qBWC-0_1732004264
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Rl2mKWUPDcT6

Hi Zhenzhong,

On 11/19/24 08:07, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Tuesday, November 19, 2024 2:00 AM
>> Subject: Re: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
>>
>> Hi Nicolin,
>>
>> On 11/7/24 21:31, Nicolin Chen wrote:
>>> Hi Eric,
>>>
>>> On Thu, Nov 07, 2024 at 12:11:05PM +0100, Eric Auger wrote:
>>>> On 11/1/24 05:09, Nicolin Chen wrote:
>>>>> Hi,
>>>>>
>>>>> This is a continued discussion following previous month's:
>>>>> https://lore.kernel.org/qemu-devel/Zvr%2Fbf7KgLN1cjOl@Asurada-Nvidia/
>>>>>
>>>>> Kernel changes are getting closer to merge, as Jason's planning to
>>>>> take vIOMMU series and smmuv3_nesting series into the iommufd tree:
>>>>> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
>>>>> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
>>>>> https://lore.kernel.org/all/0-v4-9e99b76f3518+3a8-
>> smmuv3_nesting_jgg@nvidia.com/
>>>>> So, I think it's probably a good time to align with each others and
>>>>> talk about kicking off some QEMU upstream work in the month ahead.
>>>>>
>>>>> @Shameer,
>>>>> Do you have some update on the pluggable smmuv3 module?
>>>>>
>>>>> Updates on my side:
>>>>> 1) I have kept uAPI updated to the latest version and verified too.
>>>>>    There should be some polishing changes depending on how the basic
>>>>>    nesting infrastructure would look like from Intel/Duan's work.
>>>>> 2) I got some help from NVIDIA folks for the libvirt task. And they
>>>>>    have done some drafting and are now verifying the PCI topology
>>>>>    with "iommu=none".
>>>>>
>>>>> Once the pluggable smmuv3 module is ready to test, we will make some
>>>>> change to libvirt for that and drop the auto-assigning patches from
>>>>> the VIRT code, so as to converge for a libvirt+QEMU test.
>>>>>
>>>>> FWIW, Robin requested a different solution for MSI mapping [1], v.s.
>>>>> the RMR one that we have been using since Eric's work. I drafted a
>>>>> few VFIO/IOMMUFD patches for that, yet paused for getting the vIOMMU
>>>>> series merged to this kernel cycle. I plan to continue in Nov/Dec.
>>>>> So, for the near term we will continue with the RMR solution, until
>>>>> we have something solid later.
>>>>>
>>>>> [1] https://lore.kernel.org/linux-iommu/ZrVN05VylFq8lK4q@Asurada-Nvidia/
>>>> At Red Hat we may find some cycles to resume working on the QEMU
>>>> integration. Please can you sketch some tasks we could carry out in
>>>> coordination with you and Shameer? Adding Don in the loop.
>>> That is great!
>>>
>>> So, given that Shameer is working on pluggable module part and we
>>> have folks working on libvirt. I think the only big thing here is
>>> the SMMUv3 series itself. Please refer to the changes in the link:
>>>  - cover-letter: Add HW accelerated nesting support for arm SMMUv3
>>>  - https://github.com/nicolinc/qemu/commits/wip/for_smmuv3_nesting-v4/
>> Looking at your branch I see the following series (marked with cover-letter)
>> *
>>
>>  *
>>
>>    cover-letter: Add RMR WAR for MSI mappings (based on former RMR flat
>>    mapping and not related to *[PATCH RFCv1 0/7] vfio: Allow userspace
>>    to specify the address for each MSI vector
>>    <https://lore.kernel.org/kvm/cover.1731130093.git.nicolinc@nvidia.com/#r>
>>    I guess)*
>>
>>  *
>>
>>    cover-letter: hw/arm/virt: Add multiple nested SMMUs (Nicolin ->
>>    Shameer)
>>
>>  *
>>
>>    cover-letter: Add HW accelerated nesting support for arm SMMUv3
>>    (Nicolin)
>>
>>  *
>>
>>    cover-letter: Add VIOMMU infrastructure support (Nicolin)
>>
>>  *
>>
>>    cover-letter: intel_iommu: Enable stage-1 translation for
>>    passthrough device (Zhenzhong)
>>
>>  *
>>
>>    cover-letter: intel_iommu: Enable stage-1 translation for emulated
>>    device (Zhenzhong)
>>
>> The last one is covered by *[PATCH v5 00/20] intel_iommu: Enable stage-1
>> translation for emulated device
>> <https://lore.kernel.org/all/20241111083457.2090664-1-
>> zhenzhong.duan@intel.com/#r>
>> *
>>
>> *I see there is a reference to *"Enable stage-1 translation for
>> passthrough device" series but has it been posted for review? Adding
>> Zhenzhong in copy.
> There is an RFCv1 posted upstream which is a combination of
> " intel_iommu: Enable stage-1 translation for emulated device" and
> " intel_iommu: Enable stage-1 translation for passthrough device".
> Link: https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg02740.html
>
> If you means the split version, not sent yet. Plan it after the series about
> emulated device is accepted.
OK thank you very much for the link and confirmation.

Eric
>
> Thanks
> Zhenzhong
>

