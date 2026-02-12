Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FBBEEA845
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 18:57:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqbsM-0002cl-Gz; Thu, 12 Feb 2026 13:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqbsL-0002bR-5g
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 13:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqbsJ-0004xi-Lw
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 13:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770922634;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIDIJX0tRI/GboZIbqLyZDHS7CmPYsxtAqtgGplFOkI=;
 b=Xj5pU/S2A8XxC95w1g4U6KbJFo/aWRNDqVUTTjt2dc8TEkGoY3OeIgxilyhLfR1psrharE
 15j35mgUFsgRJSoIesUg/U8rClq7VO7efwtf4TQILzdw7Ci8dcV4mzIsJsNqAv/TngI9B1
 GVgX1n/ZP0OH+ZGa2H2evtyY/HNGV5s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-Ro3-LJUKMr60aLfMLOztTw-1; Thu, 12 Feb 2026 13:57:11 -0500
X-MC-Unique: Ro3-LJUKMr60aLfMLOztTw-1
X-Mimecast-MFC-AGG-ID: Ro3-LJUKMr60aLfMLOztTw_1770922630
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47edf8ba319so1429125e9.2
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 10:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770922630; x=1771527430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIDIJX0tRI/GboZIbqLyZDHS7CmPYsxtAqtgGplFOkI=;
 b=Qz6zF/3oNr7WW3fTa653KoePHfEnqmU+NnwIM5YyyNoOqhXLg1QzgX32pBBivLfPbP
 xwZTxBk2B8W4ADMzi/DdAuVLmUClJtpwXOAQVUXet4xmUoHpewIH6fnu1ynYi6PpqR25
 rt6nfmYJgD1Svou4hFBXAtmP3+GyGqyjw3M/tWIzfC4k8cUp06ADzXdPEpxZdrfJ2bc4
 5XQGvgpH+AoMkihXWvlM0fbROAL7ABKwQvBZI5SO+QIEnmSQCFQetoL6oxrcpVephw2j
 mB/QFFnHTAPe2Yxj2JSpfC1VbGhCHJcpF5vuhnjLEhepZvmpGTJ+ryFFtGryNTfQ82hI
 6k0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz1GIjaz5QFgPhk/KG99aMs5jLm9bbkvADzgeRW/PXE6Yv635VnyIcb4wUf/q1W4zt/7pBZt0fnA==@nongnu.org
X-Gm-Message-State: AOJu0Yx3QZxZmYi1zR8NSGVcxKzcggbSfsIEnHu3demazA7FvOOmJs90
 e3PcrXLN61UCJ5LgBk52x7OxAE43xmoeQiENUwm2G9ehZRMxzK53ab2lxMXJKklFj4AolGmxmgm
 5Qt722PEEhUc/NBDnM5JgCd1CTR/HxScp+yO/B4EkvOvKtN/seZJRxQ==
X-Gm-Gg: AZuq6aIFToR7BOh5RfYrOmyFUwzgJR8O1Ur+u+Tf/3C8hZtkEryyyEJ/aHc98Nt2+ZL
 CCnMax1I+9DTnl0DxLhvmJ34qkJ01zHhaBd+M/XjalBlQb7yyvrYZL9TWisNh55ri1pEQ+u43P5
 grAaDrFnAjuHckeG8y7gcBesehSVDehNePEYxm5xVrUk6TH1l1wVSXjSprJjQit5SwLvTHoTg32
 UtxS8BLC7mDzccgpR+uTwYf+QxlB+eZ9qkey9eyWQTN5vq3tCbzuvfhKUZW8Fe/Gf+cE1j9lePF
 uA7nMCgtvFuMK0w+Wf4zmRN7wrLquzEIYjBIm9r4H8Te7L5QtwOzb+mItC7L9XEEamWfWoDD1x8
 7MNrBzTdhABQVorcBmMuqjSVSehfHoDZr6dFsijPxNwSZFfXSTgPRAHXf75e1/AMYoYERRg==
X-Received: by 2002:a05:600c:3b19:b0:480:6b76:dfb4 with SMTP id
 5b1f17b1804b1-48370e18708mr2382645e9.8.1770922630140; 
 Thu, 12 Feb 2026 10:57:10 -0800 (PST)
X-Received: by 2002:a05:600c:3b19:b0:480:6b76:dfb4 with SMTP id
 5b1f17b1804b1-48370e18708mr2382345e9.8.1770922629696; 
 Thu, 12 Feb 2026 10:57:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d34657sm16274631f8f.6.2026.02.12.10.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 10:57:09 -0800 (PST)
Message-ID: <b1cf54c0-d8a0-47a7-bd67-f3773fe1a52b@redhat.com>
Date: Thu, 12 Feb 2026 19:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/24] hw/arm/smmuv3: Add per-device identifier
 poroperty
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-23-skolothumtho@nvidia.com>
 <6c4468e1-85e5-4d3e-9b4d-6710aac202a2@redhat.com>
 <CH3PR12MB7548BFE35E11F407DC3AAC8DAB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548BFE35E11F407DC3AAC8DAB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j-g1DFpeWNLud479Mv6vE6vApPwqDejkeCezw0JYyEs_1770922630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 2/12/26 7:53 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 12 February 2026 18:30
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: Re: [PATCH v2 22/24] hw/arm/smmuv3: Add per-device identifier
>> poroperty
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/6/26 3:48 PM, Shameer Kolothum wrote:
>>> Add an "identifier" property to the SMMUv3 device and use it when
>>> building the ACPI IORT SMMUv3 node Identifier field.
>>>
>>> This avoids relying on enumeration order and provides a stable
>>> per-device identifier. This is useful when we add support for
>>> Tegra241 CMDQV DSDT in subsequent patch.
>>>
>>> No functional change intended.
>> I think an important info which is missing here is you need the id used
>> in IORT and DSDT to be the same, is that correct
> Yes. That is correct. I think I have that explanation in next patch. I will
> mention it here as well.
>> By the way why can't you reuse the QOM id. I think Dan said there is one
>> for all QOM objects.
> Yes. QOM device has a global id. But I am not sure we can use that here.
> For one it is a "char *" and normally user or management layers will use
> That,
> eg:
> -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1-pxb1,
oh yes you're correct. Forget about it

Eric
>
> Thanks,
> Shameer
>


