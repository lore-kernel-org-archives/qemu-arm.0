Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD0D3B7E2
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Dec 2025 17:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSesM-0001zM-Ba; Mon, 08 Dec 2025 12:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSesK-0001yC-12
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSesH-00039Y-Pa
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765214293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL08V+9vqyEMIsPjsNaUawtDLNknNx/VuH+45FfUYxI=;
 b=b9c89LU2fIKJ65qk9O/NcuwpDZozu1OxYka1hZCnm5iZhyEiv4pLURMYf5GucqIc1pFqOi
 ZsnL5kAQj8vPQkqnFo9NFutdKjjSVhQkYGCZVB6AeM6CISc04XuFtdtNcXEhW6ouZUIl2x
 jsBH5KMXYYiw7+7IG9Qxs6frsS4NEGA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-T09xsgZtPAWtLk81M_FppQ-1; Mon, 08 Dec 2025 12:18:09 -0500
X-MC-Unique: T09xsgZtPAWtLk81M_FppQ-1
X-Mimecast-MFC-AGG-ID: T09xsgZtPAWtLk81M_FppQ_1765214289
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b98e6ff908aso10757362a12.2
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 09:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765214288; x=1765819088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VL08V+9vqyEMIsPjsNaUawtDLNknNx/VuH+45FfUYxI=;
 b=Byof1EJ8oRqOx+LlkitK0H7UW6I+UMWqA9rU4uNpUxnSaW47/VkBDjbog+d2mU1vXa
 i7/BxVaFePjuVokK9Aj93D1trGRd6EpsSFBgEWYi5+MqUURhPeI312t3guHBOSlUq1du
 lHIN5HUgg8qlmE1lMf4YrnqlKxgGRCx17UdT+H99zeju1bx6tOp0+IJdDbAvP2GqW99n
 uXc9aPZhDwGAAVTOFrpBnkT2lWafMWbPT0jBFg9HDKaelbtbHk/06hwzSmuPX15j4WEN
 AXaVe6sEX/hAVAZ1STg7gh7z88+VDCCsPbx3Lozxn62KgzO9Z2hl2i0v41qNdFnUvOVs
 1V1w==
X-Gm-Message-State: AOJu0YzNjK+9+uWr+g5eGpoMmQ21NaJ/fG/nkJQagrQWUDZFGN5nSPQV
 CZOMtMaH5uboFyZiq0UHNh5/6asg0zgwUukwHmUCqYfEpbbFmLrQ5NnACPqYciWNb4VtXPXzP05
 mOD9ZszVljj+Em9uaAdUfHJ6QuF/RD4hbQbsLlonci93yy4VZLzPHUg==
X-Gm-Gg: ASbGncuPrjN7hzcGxUk4Jmker4TALFlOIo8Y2F8OSxb4b9kNw/vaoLdWOO3uN6FPIKg
 sSUIi3oCAnjc9EoaSJ1QlOCwjkp1O39/0Z5XdQxEMXRHMBnlVBVdIZJ3MkMN/tHQ7OEekfQVWxC
 YqcPvRCqnnIUmE3dOEQo8qyES2kezZDlImoUtWC1/SZe05OUYPHU1BZFISsVuDcxgDVZy5Shi88
 w9P+wwTgaQsaNOeSxtdDv3G51z4TjX2kablB64rwfPGhdANxH9W3sIteupywSvkqzAiVRiARJYR
 hHiWboL4c/3xcNIivL+O4d9ebiY18KCy8hFbHZ6KWhacBEPzp6GeQ15Gbea8ETS3T9mhFncnQRw
 I7RGpTvHW9vvymw5QHTDsC1vlg6bDTWAZevNZSYHWHjUmxUYBXjp+Pf/8Qw==
X-Received: by 2002:a05:7300:d084:b0:2a4:3592:cf5d with SMTP id
 5a478bee46e88-2abc70f7864mr3708194eec.1.1765214288530; 
 Mon, 08 Dec 2025 09:18:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+EEe2PZWYlFKN+U88zJhICyFxgDpx4Q4wosJbE4lz+op2w66Q/GewNPwCJ9NFS+BsWZD9vA==
X-Received: by 2002:a05:7300:d084:b0:2a4:3592:cf5d with SMTP id
 5a478bee46e88-2abc70f7864mr3708185eec.1.1765214287991; 
 Mon, 08 Dec 2025 09:18:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2aba822b615sm35906621eec.0.2025.12.08.09.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 09:18:07 -0800 (PST)
Message-ID: <cda8507b-1cc9-41ab-96ff-b27159460ef1@redhat.com>
Date: Mon, 8 Dec 2025 18:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/33] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-30-skolothumtho@nvidia.com>
 <aR+MjODa6/XFlCqz@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aR+MjODa6/XFlCqz@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RO6xflTdQ3CvtCd6WXmoN19kICyx7gbojgVs5gzoEVE_1765214289
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 11/20/25 10:47 PM, Nicolin Chen wrote:
> On Thu, Nov 20, 2025 at 01:22:09PM +0000, Shameer Kolothum wrote:
>> QEMU SMMUv3 currently sets the output address size (OAS) to 44 bits.
>> With accelerator mode enabled, a device may use SVA, where CPU page tables
>> are shared with the SMMU, requiring an OAS at least as large as the
>> CPU’s output address size. A user option is added to configure this.
>>
>> However, the OAS value advertised by the virtual SMMU must remain
>> compatible with the capabilities of the host SMMUv3. In accelerated
>> mode, the host SMMU performs stage-2 translation and must be able to
>> consume the intermediate physical addresses (IPA) produced by stage-1.
>>
>> The OAS exposed by the virtual SMMU defines the maximum IPA width that
>> stage-1 translations may generate. For AArch64 implementations, the
>> maximum usable IPA size on the host SMMU is determined by its own OAS.
>> Check that the configured OAS does not exceed what the host SMMU
>> can safely support.
>>
>> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>>  hw/arm/smmuv3-accel.c    | 20 ++++++++++++++++++++
>>  hw/arm/smmuv3-internal.h |  3 ++-
>>  hw/arm/smmuv3.c          | 16 +++++++++++++++-
>>  include/hw/arm/smmuv3.h  |  1 +
>>  4 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>> index 73c7ce586a..35a94c720a 100644
>> --- a/hw/arm/smmuv3-accel.c
>> +++ b/hw/arm/smmuv3-accel.c
>> @@ -27,6 +27,12 @@
>>  static MemoryRegion root, sysmem;
>>  static AddressSpace *shared_as_sysmem;
>>  
>> +static int smmuv3_oas_bits(uint32_t oas)
>> +{
>> +    static const int map[] = { 32, 36, 40, 42, 44, 48, 52, 56 };
>> +    return () ? map[oas] : -EINVAL;
> We should probably just:
> 	g_assert(oas < ARRAY_SIZE(map));
>
> -EINVAL is useless anyway in the caller that prints it.
>
> Otherwise,
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
With Nicolin's suggestion
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>


