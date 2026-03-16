Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E069F013C5
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 08:11:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2320-00078D-Dh; Mon, 16 Mar 2026 04:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22zn-0005d4-2d
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 04:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22zj-0002Hw-Ka
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 04:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773648490;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAFvNhrUgUGWXqlQg3jJvBrtZYCMzhU1q1yjSGG0fiE=;
 b=WCYKfocO0rMtOw3Pv5OqSitpkNeInpIToCDDXzSAfor15i4kGMsU3jn5TpKnNfcVcSaD1Q
 vtbpWs5eMqADiXYfFoVD4tgU6I2dIsiQ7SQ2/oD71QcMux/zJHvdMPx3AndsYEWF2z2Krc
 tmQdGxbmo4x/266+C+Lar3hcQLFMmcg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-R1cIrMpQP2K5OtqdnLZmzg-1; Mon, 16 Mar 2026 04:08:08 -0400
X-MC-Unique: R1cIrMpQP2K5OtqdnLZmzg-1
X-Mimecast-MFC-AGG-ID: R1cIrMpQP2K5OtqdnLZmzg_1773648487
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439f5c57c52so3075192f8f.1
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 01:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773648487; x=1774253287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAFvNhrUgUGWXqlQg3jJvBrtZYCMzhU1q1yjSGG0fiE=;
 b=Mq5bjXlWWXrt0LRvl8REvN2fJNyCgYXyQz+YX5r6mBAX2Tc65vS+q8LWLPcKGxhrYd
 4QZcUZP2bkKk4BY7uF3LwoGfw3jI5bovC25+BAO6BSeVmMvhCPmeNbYkKZt4lIoR2tZN
 P80hi9oubg5SiNDtOHQjHVrj4VwB+AR4+DuMpybv8aMHwtHexNuFf2fw3y9BWjiCjMfN
 sQJ6ktMg8LDFW862bapqKFeYlYjwSh/G1x5C5Sy01JysEypdT9aRGNUVWdmL+XlInnc+
 9ycIShsuvNjc0Ohu4l1GWjm5/aKA6OzauxXzoMtI7wGEi8tz0pxZDtGdmn1AGAMMh420
 aAYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB0H9wXzQAYNzGk0LpyZ/o17mwjUedb0o23+quqSww5Z2SerbLFSiLtTKZzqhqz0p00UfSLXQ8tA==@nongnu.org
X-Gm-Message-State: AOJu0Yw5xSPZ9RpkT3XZPP4Creag6RCYiy6oCAW6Py/JhOl9Wv0upKAf
 DtXTeisN/e2+Uu0TwaotvE+HTVV1QEwhysOnZxs09YdjfcvS5QInqXsvx6U39tN8XMpXqODnyiI
 l6hbDukgQUcwxQJy7FIoIh4LthvOat0Js7i9v2eTELjUanxITvr4ttw==
X-Gm-Gg: ATEYQzzoWFPrW35WNkkB36GkFvHCnbzO2IoAN1x1nswhLYyt9UUVo7O+cjA4OVl4rv9
 erJcQQMs8+bWgR7QOQPuyQSIHfzRFSTa9SBJctg7JUtRy7Rckj1rqG/B8qCbzwtKll8Dtw5kIZp
 EU68sfHTVKYr+Du5DkDC5vp+cskXEO2515YoejxY2SqW1diXPRdFaFWhJKJ1zF3iDnZ3mSiXTQ/
 6+p8bSVOt50DyC1aBxvTM8pFV/Pvy21/jmmT4HsCBqvylwi6a2bhnXKS5Yue+8glCcenfzilIKA
 z2iglWe4L0ybRt8lik4dDoesqhDRzF3Khz9a+pxXnWKo+7l+Q7GMRoRuM2RGF5gSaVKOf7cFoog
 fblI3DzuFGvqitmA63Dsd5gYAzvty4+26cGFtntfgUl1MCyPEPcRRkL/wZc8RB/DxLefcXA==
X-Received: by 2002:a05:6000:26d0:b0:439:b6f1:cd8d with SMTP id
 ffacd0b85a97d-43a04da7c89mr22219587f8f.28.1773648487114; 
 Mon, 16 Mar 2026 01:08:07 -0700 (PDT)
X-Received: by 2002:a05:6000:26d0:b0:439:b6f1:cd8d with SMTP id
 ffacd0b85a97d-43a04da7c89mr22219539f8f.28.1773648486568; 
 Mon, 16 Mar 2026 01:08:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b419270efsm9699773f8f.16.2026.03.16.01.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 01:08:06 -0700 (PDT)
Message-ID: <a0ca818f-8e05-4756-b6bb-8f986c59cd54@redhat.com>
Date: Mon, 16 Mar 2026 09:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] hw/arm/smmuv3-accel: Support AUTO properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Matt Ochs <mochs@nvidia.com>
References: <20260312210328.2016191-1-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260312210328.2016191-1-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P0JcQUU0NFCWmmuHB5An-JXxmqz4KHjzLs4nHHFswF8_1773648487
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Nathan,

On 3/12/26 10:03 PM, Nathan Chen wrote:
> Hi,

If we want this to be taken in qemu 11.0 you need to clearly indicate
that in the series title:
using a subject prefix like "PATCH for-11.0"

Then you need to clearly justify what those patches are fixes for stuff
introduced in qemu 11.0, something like:

In qemu 11 we introduced new options for vSMMU but feedbacks received
when starting the integration of layered products shows the need for
auto/host retrieved values. To avoid breaking JSON/QMP compat, we want
to fix the option types so that they can later support the auto mode. At
the moment the auto mode is not supported though.

Thanks

Eric


> This is a follow-up to the previous RFC series [0] that introduces
> support for specifying 'auto' for arm-smmuv3 accelerated mode's ATS,
> RIL, SSIDSIZE, and OAS feature properties. Based on feedback from the
> previous mailing list discussion, this refresh only converts the
> properties to the auto form, keeping the default values from
> Shameer's HW-accel SMMUv3 series [1]. A future series will
> introduce support for resolving the 'auto' values based on host
> SMMUv3 IDR values, as well as setting per-device ATS capability.
>
> When set to 'auto', RIL and OAS will use the defaults set from
> smmuv3_init_id_regs() while ATS and SSIDSIZE will remain at the
> initialized 0 value; i.e. RIL enabled, 44-bit OAS, ATS support
> disabled, 0-bit SSIDSIZE.
>
> A complete branch can be found here:
> https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto-v2
>
> Please take a look and let me know your feedback.
>
> Thanks,
> Nathan
>
> Changes from RFCv1:
> - Remove changes that resolve the 'auto' values based on host SMMUv3
> - Restore defaults values for RIL, OAS, SSIDSIZE, and ATS
> - Update OasMode to accept all OAS sizes instead of only auto, 44, and
>   48
> - Include comment in SsidSizeMode schema clarifying enum value
>   ordering
> - Replace ats-enabled prop with a helper that accepts the dynamic
>   casted TYPE_ARM_SMMUV3 object
> - Separate out guest vs. host ATS check in
>   smmuv3_accel_check_hw_compatible() to a different commit
> - Document accel, RIL, OAS, SSIDSIZE, and ATS properties in
>   qemu-options.hx
>
> Testing:
> Basic sanity testing was performed on an NVIDIA Grace platform with GPU
> device assignment and running CUDA test apps on the guest. Additional
> testing and feedback are welcome.
>
> [0] https://lore.kernel.org/qemu-devel/20260309192119.870186-1-nathanc@nvidia.com/
> [1] https://lore.kernel.org/all/20260126104342.253965-1-skolothumtho@nvidia.com/
>
> Nathan Chen (8):
>   hw/arm/smmuv3-accel: Check ATS compatibility between host and guest
>   hw/arm/smmuv3-accel: Change ATS property to OnOffAuto
>   hw/arm/smmuv3-accel: Change RIL property to OnOffAuto
>   qdev: Add a SsidSizeMode property
>   hw/arm/smmuv3-accel: Change SSIDSIZE property to SsidSizeMode
>   qdev: Add an OasMode property
>   hw/arm/smmuv3-accel: Change OAS property to OasMode
>   qemu-options.hx: Document arm-smmuv3 device's accel properties
>
>  hw/arm/smmuv3-accel.c                    | 42 ++++++++++++++++++----
>  hw/arm/smmuv3.c                          | 38 ++++++++++----------
>  hw/arm/virt-acpi-build.c                 |  2 +-
>  hw/core/qdev-properties-system.c         | 27 +++++++++++++++
>  include/hw/arm/smmuv3.h                  | 11 +++---
>  include/hw/core/qdev-properties-system.h |  6 ++++
>  qapi/misc-arm.json                       | 44 ++++++++++++++++++++++++
>  qapi/pragma.json                         |  1 +
>  qemu-options.hx                          | 29 +++++++++++++++-
>  9 files changed, 169 insertions(+), 31 deletions(-)
>


