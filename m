Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13E1CD98E0
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 08:03:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZOlE-0007un-Co; Tue, 16 Jun 2026 04:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wZOlD-0007uW-17
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wZOlB-0007AR-I5
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781596980;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kN2kbp0ZO+hLE5oZ/5WuYNrtaRI3M4w+bQORE2OJafs=;
 b=NWiwTFHOFDrGzjCtE1LGaPcofSzPSnRHuVCaug1M9zYeXzeOO/A+r6ZHy/QWNfre0PE3WM
 N7sh+g6GuheDL5azgNl3g5NnjHqQBdXG3vrPDncBYqAYwrXmPdqxioKfdQLjgk2vt6guI0
 WjDeaiJaEQxkNIqjomp0s9UylOuu+CA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-VZBcYVpSMDGiI939BuU_cg-1; Tue, 16 Jun 2026 04:02:58 -0400
X-MC-Unique: VZBcYVpSMDGiI939BuU_cg-1
X-Mimecast-MFC-AGG-ID: VZBcYVpSMDGiI939BuU_cg_1781596978
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-beb5131c31cso393995666b.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 01:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781596978; x=1782201778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kN2kbp0ZO+hLE5oZ/5WuYNrtaRI3M4w+bQORE2OJafs=;
 b=PQh1yE5X7Pi99UrN2SCEHnzQr86V/WvwOHLOrsyqMsD0jF8CUqZo4GoGyZYkdcYNSC
 oqJ4WJ+s6YTY804MRRXHuyZpACgdvZLwgdmjJhUkFwMnd3srqwyj22sGMUiuP0+t4eGK
 jiT0oypTwbZQA7Wq4ytTxYd4xYmpwySZEogLtrz618N4/Ofjhc0d2ArOyAV/HrqVkbEf
 B4e7u6omvlhYUZ+lFytOfVCf3S6BO7jKl1JjIA2MMnTz8arh0RqIxa0bh4D0iyextWz5
 IFSLdeaWAUCfk/8MpmRyPT8ErG3WAo2duRc3s8lB7mB4q6CRYy9gqItWs4Y1f620NDVl
 Biiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gaJvzrPK+rWiMzZzPZ8WltXx6EJsi8vJyc0lGXgR4QesfVp4jQxOaSKfHDBAYxMvh/K8BrT9NHw==@nongnu.org
X-Gm-Message-State: AOJu0Yx449onLxANtmwWSZbam8f34GB0HQWQaCSzVvGV7oFA29UQM0k5
 vVxAmKvTq6yg+zIApBSx+5WqYFS1vKQ0N+ZiTBwvRd/l4gI5Mqe2PqH/mdqjOiD/7owzf9MZwHr
 8O3h7GMYfsBIirJlsB/blZskniMKoZI/9LCShW1o+6n7fC/MVeceLEw==
X-Gm-Gg: Acq92OHTV0AlN42vhjfFu85Woe/Zu/ljpu7RGMNqNiqGZcgvfRpqDcOBe+JLpH9Hosn
 bCphQCae8zakQ5mC2ZboUBX0dWEA/Up0csgbjD1sebQScPh6MS0ldhJO3aUoBqC8gAsjzX+jzRj
 FXC+0oPfBHg5OjnDPIYCAzedwDAKnSE/WgLU6gmXMehQeW+v1HLWPcHmvcqT7AHIqVCLW6rSlAM
 6BqyT70ej8Y6+7YkTkKUlJkx1MpxbcxeW+gNokE6gIebJ6S0Ux+hAESOpjJi9T8lPRzWSJJF+2m
 pOpBVQC4RN1rRBloVMAvGavGCFC/mYI9Z0N3/fDuA3eWhMscPigYPxw8C5yuyaZ5img0Uegxjf5
 YOrT2hpQ+JWjJ3PuIEYyHylK09bHuHf5MybyIooDR2iI1dp5i47N3fTpY8qh+elc69JSxvQ==
X-Received: by 2002:a17:907:1c9f:b0:ba6:e18f:1568 with SMTP id
 a640c23a62f3a-bfe2a2195a4mr925275966b.32.1781596977397; 
 Tue, 16 Jun 2026 01:02:57 -0700 (PDT)
X-Received: by 2002:a17:907:1c9f:b0:ba6:e18f:1568 with SMTP id
 a640c23a62f3a-bfe2a2195a4mr925270166b.32.1781596976848; 
 Tue, 16 Jun 2026 01:02:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb522167dsm592049266b.25.2026.06.16.01.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 01:02:56 -0700 (PDT)
Message-ID: <4c1bdb4a-2d9c-4a01-87c9-da2ad2c8f254@redhat.com>
Date: Tue, 16 Jun 2026 10:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/18] arm-qmp-cmds: introspection for ID register props
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, shaju.abraham@nutanix.com,
 khushit.shah@nutanix.com, yangjinqian1@huawei.com, cohuck@redhat.com,
 richard.henderson@linaro.org, skolothumtho@nvidia.com, philmd@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-18-eric.auger@redhat.com>
 <10ae56f5-6fc7-fe58-1e17-7c3b968045be@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <10ae56f5-6fc7-fe58-1e17-7c3b968045be@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DVfM40kao5BjLGaoKjvJAUF4UDhM3q4Dvr2uBvggg2E_1781596978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/27/26 8:29 AM, Sebastian Ott wrote:
> On Tue, 19 May 2026, Eric Auger wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Implement the capability to query available ID register values by
>> adding SYSREG_* options and values to the cpu model expansion for the
>> host model, if available.
>>
>> Excerpt:
>> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
>> {"return": {"model": {"name": "host", "props":
>> {"SYSREG_ID_AA64PFR0_EL1_EL3": 1224979098931106066,
>                  ^
> This looks wrong - more like the full reg value and not just EL3.. 
effectively! Fixed.
>
>> "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0,
>> ../..
>>
>> So this allows the upper stack to detect available writable ID
>> regs and the "host passthrough model" values.
>>
>> [CH: moved SYSREG_* values to host model]
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>
>
> Reviewed-by: Sebastian Ott <sebott@redhat.com> 
I added the write part now

Thanks

Eric


