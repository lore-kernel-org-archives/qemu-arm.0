Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B73C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYHt-0005cH-Ub; Tue, 30 Jun 2026 09:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1weYHn-0005av-78
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1weYHl-0004b1-HO
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782825236;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2fxDeuFtAamJnUx68ai6yqnwyLW2L/ImIpa9F1jTftA=;
 b=TNeFaiVcy32i4ObxwESP2maC2lKptmTdR3E9gZBEsR4r38lzanQ5VO5+y4wRLE2wjpupms
 S7bhy/TNb0WlRDExAQYVHMGM2SjWVkgQqNH/YCk3WabnJ2Rit3lG0Mgm+Wrcz4kgqs3Z32
 J2Y6K1FeyDAm565wD4ATZXf+aDnnLNM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-QfOvFdhlP2Oil1TwuMm_wg-1; Tue, 30 Jun 2026 09:13:55 -0400
X-MC-Unique: QfOvFdhlP2Oil1TwuMm_wg-1
X-Mimecast-MFC-AGG-ID: QfOvFdhlP2Oil1TwuMm_wg_1782825234
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-493a5d7eaedso21199485e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825234; x=1783430034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fxDeuFtAamJnUx68ai6yqnwyLW2L/ImIpa9F1jTftA=;
 b=ZbiNLbQxGHv4Iy0tcGlLyWBNI2TRpgC0M+lafaxlvoEFU0NMQhykc2C5VdFHG1yipP
 FqzODpxlSJXRZEHrJdcj5dsl859ytRGUcojj7IX9d5naU3M/a/omJv80kOkrMJpM2Zol
 AA/scmOGKtfR8PJFZMiPNY/+A6E1i9vAl6NdufH26iVsrwSlyEGVZNpTwNQip/YpIpKY
 IAtDKjN/Nasz9e5EM3B35PmjVTvadus/5RIOD6OBgsYVig2ll1aaYzJofhWwZMzg5lFi
 adAfm7zLErYghNmeu3EQ1pMuNcMSPWR3RB+/qu3tCJdI4mSku7cEQEsDsSPxBc3HpTNA
 9VTg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/twDs+F1id6Gq2gVy/0mc8EQYfWQgTQ/HO5fheDjDEaKXCX4Zbtk8fFr8LIRtG1DhSwYLyCgn0Zw==@nongnu.org
X-Gm-Message-State: AOJu0Yw2E/kcBUVYU0gt6WrlbAvOPgMlBe6RdNXgvBYV4QLS2nedgIKK
 K4EEBZEicIqRaVO2txdx4z28xZZxwgE3KYQAyt4/KU76sQjq67AUJjhnozXR3BS/GUC+dThli8+
 ALA286Pam3EwVSf/Ua2pxgle8kYJy9DTA0btkvvdGWnnKs9P2dC1tSw==
X-Gm-Gg: AfdE7cmP86sOy3Q7Pat4aRigoqmaeBdhyGBQd1vcC8lfYF/yI/gc8iYJWLQOL2VgMjs
 QcBf2yl0oMFkrFWU9cABeBR2EpcDAm7F/A/M9rB/MM68RQaBPK/crZMypU4XlM1+S8NgN8HXWhL
 zCVF45wBfbsN4rtUtwA+4eDUP+eK0650Pgz/eUbxW1sF4Ooin1exdJJtGZDBRLoUhBdwxUEPCKm
 tmMgh7XoLUtvBPYhXdvreimpNnxmKVX88OYaH0s7lcIcc+kHC8UQdg2tfSfgKUeBqzMw1WK+r9p
 pp6ogdbY7ldkJUMZkTTMPl7TOTjiD1iKsIHsTV7tZ3HVO+3lt90kzPeMuNwbN1rwfUqQd6Bha78
 FhpcB974LaCgiq2Qu+b6M/pmxA3nhukb2t5vcujoKdnsPd1BmywnvD8gZpPo=
X-Received: by 2002:a05:600c:8b71:b0:493:aaf5:6e04 with SMTP id
 5b1f17b1804b1-493bda4ae27mr9082605e9.15.1782825234257; 
 Tue, 30 Jun 2026 06:13:54 -0700 (PDT)
X-Received: by 2002:a05:600c:8b71:b0:493:aaf5:6e04 with SMTP id
 5b1f17b1804b1-493bda4ae27mr9082245e9.15.1782825233830; 
 Tue, 30 Jun 2026 06:13:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8cd303csm66624125e9.6.2026.06.30.06.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:13:53 -0700 (PDT)
Message-ID: <a034d5c4-02a5-43a1-b453-2c1dec59a5cc@redhat.com>
Date: Tue, 30 Jun 2026 15:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/smmuv3: Sanitize
 SMMU_S_STRTAB_BASE_CFG.LOG2SIZE
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, skolothumtho@nvidia.com, nicolinc@nvidia.com,
 nathanc@nvidia.com
References: <20260630083042.2692392-1-eric.auger@redhat.com>
 <20260630083042.2692392-3-eric.auger@redhat.com>
 <akOJ8SNPV_I48tD_@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <akOJ8SNPV_I48tD_@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S_2ARZcuNFHD5_ZUF0Km7iFtg6kiM7hYGpKG8SLMqiE_1782825234
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 6/30/26 11:18 AM, Daniel P. Berrangé wrote:
> On Tue, Jun 30, 2026 at 10:30:20AM +0200, Eric Auger wrote:
>> STRTAB_BASE_CFG.LOG2SIZE is programmed by the guest through the
>> emulated SMMUv3 MMIO register interface. Currently the value is
>> not checked.
>>
>> The SMMU spec says: "Except for readback of a written value, the
>> effective LOG2SIZE is <= SMMU_IDR1.SIDSIZE for the purposes of
>> input StreamID range checking and upper/lower/linear Stream table
>> index address calculation."
>>
>> So for STE lookup make sure log2size is capped at SMMU_IDR1.SIDSIZE.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
> Can you add the "Resolves: bug URL" to the commit message so it
> gets auto-closed on merge.

sure. Thanks for the hint

Eric
>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 0a8d2fbb6a7..db5aca26ec0 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -672,6 +672,15 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
>>      /*
>>       * Check SID range against both guest-configured and implementation limits
>>       */
>> +    if (log2size > SMMU_IDR1_SIDSIZE) {
>> +        /*
>> +         * spec says: Except for readback of a written value, the effective
>> +         * LOG2SIZE is <= SMMU_IDR1.SIDSIZE for the purposes of input StreamID
>> +         * range checking and upper/lower/linear Stream table index address
>> +         * calculation.
>> +         */
>> +        log2size = SMMU_IDR1_SIDSIZE;
>> +    }
>>      if (sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))) {
>>          event->type = SMMU_EVT_C_BAD_STREAMID;
>>          return -EINVAL;
>> -- 
>> 2.53.0
>>
> With regards,
> Daniel


