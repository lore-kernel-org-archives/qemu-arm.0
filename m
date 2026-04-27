Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B9EFF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 17:08:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHPR6-0002Hh-9E; Mon, 27 Apr 2026 13:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wHPR4-0002HB-P5
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 13:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wHPR3-0006rW-Bc
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 13:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777309670;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emUxdOMyF/TPOIVyq/ATvbwmN72FwX/fWwzd2xRNeio=;
 b=CZhQmRVHlTiEipFkUf2WZcL1S3M5yS6nOvpt88SPFpAaWnoH18q08eFcp5Vq/ZcimIYDkK
 ZigNV3iGQmllGmy+9TBFjvSGl6wGuiTEKMBPIt5iLgN1YehcfOW+RakuvWtoE6mujOBmAS
 28fzsqAmciGJ0w1H1PcL/YoTK14vUyU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-wY9Ra8xeO1ik9D-M4Mi0Fw-1; Mon, 27 Apr 2026 13:07:48 -0400
X-MC-Unique: wY9Ra8xeO1ik9D-M4Mi0Fw-1
X-Mimecast-MFC-AGG-ID: wY9Ra8xeO1ik9D-M4Mi0Fw_1777309668
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b9deeec7fafso1093313666b.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 10:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777309667; x=1777914467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emUxdOMyF/TPOIVyq/ATvbwmN72FwX/fWwzd2xRNeio=;
 b=JiDwMDBJMRgzWYp1AeVlix5GGthl20ULqwXQHNwcivSFb6JJvZbWYY9hMyxfJc+Qzg
 0cOmg/aK/zgUpDafwlFDN8cATMrHalaKS7Sjuna5hcyoro7tRxPhdUeQ/eSv6fZA02Ib
 1vUbwjCQDha4MORz5XtS7isS/U/f6Fh8vKdf91hVyPiMdS1yJksteERKFUOjq+PyVifx
 xVX/emPKMgRayCAEJxEkmEBSDvw7lGRP67zjvmBxrew+sbh7tM5gveqSjkizTKy83Z4i
 UuZuCHys6jCdno9wltkiRuv4BbRLvi/O/j7uX1iGkVBm5vFrfXBLDGfGw0dI6g/sGMJ6
 5XZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hJSm286gNZlj1MLQcBYT0kPo8wODVWMArrv7Sl5ddx98rFoi8WY3w/KScawXvRD9oefQ6fsnTsw==@nongnu.org
X-Gm-Message-State: AOJu0YxxbhWQ/nWCb57SxiK/cN/psLjUPUTY1ufLtRI2RO37tnM5R57Q
 XQqnmTgFt2P58s+MzIUHicmEXGg/vlOXpdjZfCmSSrT9Tmm4zBaeTRhgUeIDxqzJcOymnr7xKU6
 zNYbKDzyZkCYZ8mf8JD9XOF5rqf+WARFpXMh3jqWl6680o+5Dk6EHIw==
X-Gm-Gg: AeBDietHoV07JbwNELAE0AA++eVBlpI5pjpq05LHvcyQpUPi28MbD2sOM72POkYMgZq
 HJ+4cN5t/idfzUFAxUnNGy5leTIL0yj1AmVRdKG9HoweedXNXomk+8tpkDaXhbROQTCeeBOLlMI
 RQAeOs3w72sV1YZJcAfsfRkxgqWuQDRhzxNx0Xiu6onWwHxHGS0GaEMNQda8R6gmqQEVVLbBrns
 dVH3NmXRzSgwMFJJ+822S/L8Ndsv5DIDHDZJGRBZn+tQV1pVh0UW0+3UHrhHi8AdUfPIG8M/CvN
 oGz/Z3DuDs26yY5MOsnuDFPdSlHnE+t/hDYkVgNKE5kkgzG8p6E9SMU/xQ0gfTi0hLradOb58wV
 FZSNbHEY+ZQ6CkRrsqSkmriF9UID/Hxodg4hq9jRyVBRc0yEy/H+4n38hAQL4ez+YS4fZAd909/
 SRXLH3
X-Received: by 2002:a17:907:c302:b0:b96:e593:fd24 with SMTP id
 a640c23a62f3a-ba419658d6fmr2613174366b.15.1777309667542; 
 Mon, 27 Apr 2026 10:07:47 -0700 (PDT)
X-Received: by 2002:a17:907:c302:b0:b96:e593:fd24 with SMTP id
 a640c23a62f3a-ba419658d6fmr2613172566b.15.1777309667014; 
 Mon, 27 Apr 2026 10:07:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba523a90fa0sm1068965866b.31.2026.04.27.10.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 10:07:46 -0700 (PDT)
Message-ID: <d1c0c347-21e0-4877-9e3c-601b6a772578@redhat.com>
Date: Mon, 27 Apr 2026 19:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20260420140552.104369-1-eric.auger@redhat.com>
 <CAFEAcA_uLzLjqdr5LyLQ3EK2zy-ZoS8FfeDq9VcaobOozO3e2Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_uLzLjqdr5LyLQ3EK2zy-ZoS8FfeDq9VcaobOozO3e2Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UpEUSkPCRgUmPk3XTiB7K4Ra9B5AKmQ3ao_STX4P4Po_1777309668
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

Hi Peter,

On 4/27/26 11:44 AM, Peter Maydell wrote:
> On Mon, 20 Apr 2026 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>> This series introduces an infrastructure to explicitly tolerate
>> some mismatches between cpu cpreg indexes/values on migration.
>>
>> We especially handle failures due to an attempt to migrate
>> more registers than exposed on the destination.
>>
>> Once the infrastructure is in place we can handle the following
>> known issues:
>> KVM:
>> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>>   from v6.13 onwards. Causes forward migration failure.
>> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>>   register from v6.16 onwards. Causes backward migration failure.
>> TCG:
>> - We can eventually remove AArch32 DBGDTRTX register which was
>>   erroneously defined.
>>
> Applied to target-arm.next, thanks (with an edit to the
> comment in patch 6).

Ack. Many thanks!

Eric
>
> -- PMM
>


