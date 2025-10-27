Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20DCCCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 17:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDRAs-0003mv-3S; Mon, 27 Oct 2025 13:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDRAn-0003m9-Il
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDRAf-00075j-O7
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761586693;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7ljtdk6QTU3Cuz3gyrAiBhi8Funmosax55z7rWz2uQ=;
 b=LV1glGeMR/uJ9Anmpuv9O7HsoTELyt62vDyaIroRDKjUin21GrhfQb254gT2kMCSYr8br0
 y2VjSLiSJ8gjbgNiqJG310VS6eY3hiKlVnkKrvfHNXUuS7WB7MraFmckvkARgTde/SS2QZ
 QakRukKvYKoLe1o2jrH3XCeO0tEAXQU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-dk2ypSqdPM-0nfxs9mIReg-1; Mon, 27 Oct 2025 13:38:12 -0400
X-MC-Unique: dk2ypSqdPM-0nfxs9mIReg-1
X-Mimecast-MFC-AGG-ID: dk2ypSqdPM-0nfxs9mIReg_1761586691
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-426d4f59cbcso3820502f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 10:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761586691; x=1762191491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7ljtdk6QTU3Cuz3gyrAiBhi8Funmosax55z7rWz2uQ=;
 b=G/Nmxj/dENsCG/ysqSbbJKcUApPZAKVuyuTPJZLntjwxYz67TBMolHwshHdGxPNWpc
 MH/3iwAphkP8uX/jCXHryVcIcovsUn4BZ2y0GbKx5nr0mmbYFUimpBiCtkvjsCPBfsl3
 r8/1KXNNNZnwQCeCUChGRaAwoFsODZRHfqMVQrJNKHVuYzm8FJVSt5cG1CMuHyVVLw1W
 kqCaCOcyuP63bzJN7rfsBzUEYXrAljCZNsmYqLA16FRnnD+88EKV1PdyuZlx+Krnp88L
 Zzb9jUHNY6oDPmp8uFHMlZg9iCxJheaxxnrywNmrLpTG3YIc5P+0Eqj3CntjwlqQFJbC
 msFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF2kCoW7u+MMPL6OwgQYb6OCk6T+Jpu82vXgPS8TFja4K99FyJazx2KffKixcpMG7dGs2NLoRonQ==@nongnu.org
X-Gm-Message-State: AOJu0YzkT5MjVsoIbMkmybPd5j2lsY1En7iTZduJcFQLEvb2d4srW6F6
 vkX9QF4Cvw1Rijx9F6KWwNHh502xxAxlfvg4ayutPGOeD/B1g+CRBb1sMdxvhdAeACloCa57Sf/
 G3ZXoVxPtoT1A6eX2DewFTZXB4KnYBkm0kaJVT+mR4FR9jWbAxExExQ==
X-Gm-Gg: ASbGncvYQ7DB7SO0QHYLOeVKKMG0xm29lyMrMHlc3e6gZg7JE7ZURHfSP8QrQNJkfaM
 Fp3kE7SEoPpTXhfhXiFvSTLSszf2b6DbDxVkQvkHTXa+04IhzWS/gdKWpGNRE043arGKlOG50I/
 geuw+KLT0C3Ef9rIbYNbViMrXmf9b+6qEwXAP2J1heVOb8Ql7fUnjw2LO6MI+y9xHt+Cr7fRg8B
 4oHXTPPPJz5WaVPhJFVnljDUAfFHliS0i47DM806isB+lVu6D2XvyviD0VXVgENA5hpdea3+2GG
 p1xfSUubSTg/B0R4a6Qicm409pRtyivRSKpC8L0Ri4Jfnz8unVnM/elsAartjR1/leQwGgXvpXV
 XjzzTCoRQhDA/Uoa0TNn0lRtTQP3MGqwtE50rxcgPmiykVg==
X-Received: by 2002:a05:6000:4021:b0:411:3c14:3ad9 with SMTP id
 ffacd0b85a97d-429a81c3e34mr325747f8f.21.1761586691064; 
 Mon, 27 Oct 2025 10:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbvlTRZt7VPRuhOMxtoSO3lpojw9R9eWb+Wpc8TeWzgrwqJsZgm+cDvZywMwLBZ0Jajp3nsQ==
X-Received: by 2002:a05:6000:4021:b0:411:3c14:3ad9 with SMTP id
 ffacd0b85a97d-429a81c3e34mr325722f8f.21.1761586690655; 
 Mon, 27 Oct 2025 10:38:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952e2e06sm15436900f8f.46.2025.10.27.10.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 10:38:10 -0700 (PDT)
Message-ID: <25d22f06-69e2-4954-9bd9-f73f899fc114@redhat.com>
Date: Mon, 27 Oct 2025 18:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/27] hw/arm/smmuv3-accel: Add support for ATS
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, jgg@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-23-skolothumtho@nvidia.com>
 <26f4d9b2-75be-4913-bb60-01e647a7ec83@redhat.com>
 <aP+oRLu/BYNaAPHG@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aP+oRLu/BYNaAPHG@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zeqed0H6syFMRd2-m2BsH9vXk5LgnvweAeUNMPpZLfE_1761586691
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 10/27/25 6:13 PM, Nicolin Chen wrote:
> Hi Eric,
>
> On Mon, Oct 27, 2025 at 05:59:13PM +0100, Eric Auger wrote:
>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>> QEMU SMMUv3 does not enable ATS (Address Translation Services) by default.
>>> When accelerated mode is enabled and the host SMMUv3 supports ATS, it can
>>> be useful to report ATS capability to the guest so it can take advantage
>>> of it if the device also supports ATS.
>>>
>>> Note: ATS support cannot be reliably detected from the host SMMUv3 IDR
>>> registers alone, as firmware ACPI IORT tables may override them. The
>>> user must therefore ensure the support before enabling it.
>> This looks incomplete to me. ATS is a big topic in itself. I would
>> prefer we do not advertise it until we do not have full support for it
>> (including emulation). Comparing to
>> c049bf5bb9dd ("intel_iommu: Add support for ATS") which was recently
>> contributed we miss at least translation request implementations
>> (PCIIOMMUOps ats_request_translation callback implementation).
>>
>> See:
>> https://lore.kernel.org/all/20250628180226.133285-11-clement.mathieu--drif@eviden.com/#r
> In accelerated SMMUv3 case, ATS translation and invalidation are
> done by the physical SMMU. Wondering why do we need this?

in 06/27 you still can have emulated EPs hotplugged in the loop, no?

I remember some discussions with Peter who was also reluctant in general
to introduce some partial feature support. I think in general this is a
good policy to have features emulated and then accelerated. That's also
good for testing in case we can bring up some test env.

Thanks

Eric
>
> IIRC, intel is mixing their emulated translation and accelerated
> one, and their pasid table is not integrated like SMMU's CD table
> that we already passed entirely via the STE.
>
>> Also in SMMU spec I see other stuff like STE.EATS, ATS skipping stage 1,
>> ... Here I only see  SMMU_CMD_ATC_INV and this is only implemented for
>> accel. I think I would rather stick to the minimum in this series, ie.
>> reject in case of ATS mismatch (for testing purpose you will just need a
>> small hack until we get ATS support), work on ATS enablement in parallel
> That SMMU_CMD_ATC_INV seems to be the only thing we need for ATS..
>
> Thanks
> Nicolin
>


