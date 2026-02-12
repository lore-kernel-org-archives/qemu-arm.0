Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A1EE36AC
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 17:06:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqa8m-0001Sr-4V; Thu, 12 Feb 2026 12:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqa8k-0001Rn-5k
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqa8i-0008Nv-Cs
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770915963;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSOaLWuingcRSym2iM0y3zd9G1wL2md46WyRDQEzups=;
 b=ToF5S5fa3IaXgUb/+XQZ0coqEw0k21LwMc7zTL8TlG8qo9JA/6Ya+zokKPps69MSlncqXf
 wNXk1g4ND2YR2GWXvxReNi1+/hTOK5HVbx/JzME/LMDiUkrPT32qt7LoY4JpKhH3HUzmJv
 oPo89OojM5OM46tQBM89+1vIkJHb1Nk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-ev-7jQTtM_GaR4FBJz3CSg-1; Thu, 12 Feb 2026 12:06:02 -0500
X-MC-Unique: ev-7jQTtM_GaR4FBJz3CSg-1
X-Mimecast-MFC-AGG-ID: ev-7jQTtM_GaR4FBJz3CSg_1770915961
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-65828f603ecso8628953a12.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 09:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770915961; x=1771520761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSOaLWuingcRSym2iM0y3zd9G1wL2md46WyRDQEzups=;
 b=SDXAeCrMtftt/gnD0BfmR65jNe1B8zLpaz6OPph3NV7iduL0+kuzFMM+1hyLeBkPLz
 c9mDX7E03BcFn7oDOSZRY8EBhcuIoNciXlUsumn9i1xNbQ5jNrJhtf2oSh1XQxc8VFv9
 WIAom1vJComFVxl7H6LhaEsNP2xRzGFSclSVfvNa6FSVwOJx2fEoJmBAVcuPZPzchFxt
 GSZzF4/26DWcnvddD/ZFjeAm5HUupi1Tb2MVZvyvaaXcTkRS3Yu5YrvifA5VuLeShNJk
 NoIn8DcHAcnhDvcoBGUF6NH+PVrM5CC9J68/X9gsW7L/J5m1JGuaWZ4vV7/TWe+jEKr+
 g5iw==
X-Gm-Message-State: AOJu0YybfpRsU00qKuL0cNynFDf/6/4fJZ2DZSFCzZdljdKSTl/o9Bol
 LR4xNRM8fESJONYTWH5m517C8d4XCfHJHfZ6RVpjsPW6bFrIytBSo+q1nuoT7NJK/sS+TAtuyWH
 APLcuIqAMnKx6nmOHdO3r140TXiPPh0IRZJ1OnK8abIc1noL54S9w0A==
X-Gm-Gg: AZuq6aJpgdTrZTG64jMoAuWIP4t9u6cJIsr6TD3OaQDqnX48YcmfCnWxzrWPOprTl0B
 lyxNunbNr24XdMWjjzfy45D6IkwYKKzWIxKYtid5akR4j9we6QCRiHbcDr71hmrdPd1BMMZR4xg
 0jr6v042d5huEwnr2u5Y5LhHDOi+9fGn/6pinor2NX5n+Brw75kZaW9yeHk17ILZcyWtorEYZDw
 MRPDDjGJxaN1NUiiPZwIr7W/Vg55ijDTMMoVhouTXvyzCUuj3yICgxYm6Q1keLtyVo/Z/BvdnCN
 IW+J7+JX5ddbTuCXXRiCUpvzRFWx1QId3Tr0hWUFQV/C+Q20h4X6aPSS4Kh5VzORYEExAxvVBi0
 Ig1sxVSHwLiWRH7fB8dQxXZ9NurNK67aBfYyeqHojs/KxwiFcxA5fqF7i87DkBjxe9fXsTw==
X-Received: by 2002:a05:6402:42c9:b0:658:177a:292 with SMTP id
 4fb4d7f45d1cf-65b96e1b9d8mr1999642a12.17.1770915961181; 
 Thu, 12 Feb 2026 09:06:01 -0800 (PST)
X-Received: by 2002:a05:6402:42c9:b0:658:177a:292 with SMTP id
 4fb4d7f45d1cf-65b96e1b9d8mr1999617a12.17.1770915960705; 
 Thu, 12 Feb 2026 09:06:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65a3cf50e38sm1867700a12.33.2026.02.12.09.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 09:06:00 -0800 (PST)
Message-ID: <7af8156e-4874-4cab-b71a-c39c56aa59c0@redhat.com>
Date: Thu, 12 Feb 2026 18:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-6-skolothumtho@nvidia.com>
 <aYo4n4N3dW1OLzTk@Asurada-Nvidia>
 <CH3PR12MB75483C2BA4EDC24CA0F78A4CAB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <46d3b859-6e05-4c03-8e77-0aa76629f772@redhat.com>
 <CH3PR12MB7548F06A2BB9C009FD2043F2AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <dcde8f24-7523-4e2c-8ce6-4048d3ca9c7c@redhat.com>
 <CH3PR12MB7548A87A5BC62C6D90501947AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <ef13c99e-29b3-47cf-a090-811294e723e0@redhat.com>
 <CH3PR12MB75481019FE5FEB62BCE96D58AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75481019FE5FEB62BCE96D58AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wy3IsWZ0eIA8MpL5xeAOWxB812N0DgxC19tRn5HeAHo_1770915961
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Shameer,

On 2/12/26 4:47 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 12 February 2026 15:35
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; Nicolin Chen
>> <nicolinc@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jiandi An
>> <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
>> interface
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/12/26 4:05 PM, Shameer Kolothum Thodi wrote:
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: 12 February 2026 14:57
>>>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; Nicolin Chen
>>>> <nicolinc@nvidia.com>
>>>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>>>> peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nathan
>> Chen
>>>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jiandi An
>>>> <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
>>>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>>>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
>>>> Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV
>> ops
>>>> interface
>>>>>> I had
>>>>>> the impression you reverted to a fallback impl. If there is
>>>>>> specialization, I still think ops are relevant. Eric
>>>>> There is no fallback implementation. So just to confirm, you are suggesting
>>>>> to remove the ops completely or just keep the ops for reset/init only?
>>>> Depends on the code to come next. If your reset and init really differs
>>>> between normal accel SMMU and vcmdq enhanced accel SMMU, to me it is
>>>> still relevant to have separate implementations in different callbacks.
>>> It is not an either/or case.
>>>
>>> The vCMDQ path does not replace the normal accelerated SMMU init/reset.
>>> Instead, it requires additional init/reset steps on top of the regular accel flow.
>>>
>>> if (accel)
>>>     accel_init();
>>>
>>> if (accel && cmdqv)
>>>     cmdqv_init();
>>>
>>> So the vCMDQ logic is an extension of the accelerated mode, not a fallback
>>> or alternative implementation.
>>>
>>> I think the later patches in the series make this clearer.
>>> Please let me know if you still feel the ops necessary.
>> do we have any way to introspect from the kernel what cmdq type we have,
>> so that we could have a cmdqv option with ON/OFF/AUTO value instead of
>> duplication cmdq option for each vendor?
> Looking at it again, I think we can, by calling IOMMU_GET_HW_INFO with all supported 
> CMDQ types and check which one succeeds.

then I think we should endeavour doing that. Regarding the ops, if you
feel that reset/init can be managed through a simple add-on code I am
fine with it. Maybe Cédric or Peter will have another opinion though ;-)

Eric
>
> Thanks,
> Shameer
>
>


