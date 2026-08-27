Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01503C61DCB
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 08:21:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVM7-0003gJ-Bp; Thu, 27 Aug 2026 04:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzVM5-0003fn-Qd
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzVM4-0003LQ-2S
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787818857;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdSvTeBfLysofWli5ed9Pk2UjOgKDdG69Cf4fAXhbcs=;
 b=GVc6FNjjS8/X3vLNvHAWx+UnICkDb+GSESKt+bFG1jrQ3VcswoEq5LPrAOw4+9U4g1xtyB
 uBJ6n1Kcm0ZiLms7oepQiXAHO9YOAd/RHX+1I5xK5ew9O4Q5+dqXM5CfM7xSDvQ+Sifc0H
 eqWcQGAkGYqQF9g3088zlZ1fmmnnn/c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-P340uuuGN3KueQAeu8arDQ-1; Thu, 27 Aug 2026 04:20:56 -0400
X-MC-Unique: P340uuuGN3KueQAeu8arDQ-1
X-Mimecast-MFC-AGG-ID: P340uuuGN3KueQAeu8arDQ_1787818855
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49554715277so4047575e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787818855; x=1788423655;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hdSvTeBfLysofWli5ed9Pk2UjOgKDdG69Cf4fAXhbcs=;
 b=R2hod5DFUQ6/PN6IBdQeutxG6z5f8V3zdnfBJqcIJdJSxbVb3O1jKuj0gzhn6RfFcA
 5CokkQEKkEabo8lg0LDq/p1gPs5fs30/UN/wLg6LudodNVbqLAeWlk8W3qjSc031ptP+
 5h3coXwO9aSeemS1tTGLwRrfimVrsFarg2/GlRyklfRAiXiXOJIsjtSCtgmLqAwbPLVM
 zMwzDHG3E8vgA0mqzi3jBIJVfNsN+63FuVquzdhIZfcxFMkeZhCeLg2iOoIc+T7a8HJj
 TMkthxrwGHJMfzQF2V9si0q5n83qTpTBRVB3dPA9ajBuIfgia5fsGjQRmiSFT56jduU2
 rqJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RphgrT18U0hZekIIraVWPz+0ZSQqBdJY2XoVoFvj+ngw4FSneLmBMJDFssdc3cOU3jlRI+xATEo/w==@nongnu.org
X-Gm-Message-State: AFuF++nis+/MBdTY8rMgJL+JsA6kPwMQo8/xcHQGW/uYtnoL+umBZPXi
 TNs8DLnfH2vJLnUtIlQGyxomrfoaatT7uSCdY2W4h9FXLQaXsuh+sz/VJ6CN6dZGPVnFgeohc9P
 TcPb0WzL4FHPsPbsxi80gWx0eM+FkUAD+PTK76okulSM0gioyS6k+sQ==
X-Gm-Gg: AR+sD11o3nEHMS0qic0+sHw9HC2ZZ2fJzSJJvPxY90Ls25wZxpvUrOxDhAiys1ATuiv
 wjTRZkPprmbYMVAUDHSGPL5tpnlVaVJE2+/59sodKV0KGkyG0N1GoHs5fHiXtzzHmERXIxK71M3
 cnGN49zdgrPhbtEYDgiY8GH6hgvqMNMeNF/1myR4wriTWjyedXmKp51jWnS1JRd0sbJCK3IwtkX
 pdAnXY/vqs/9q2XofTKNvX39QNF0Pw8Tj2QbAHgQNyEl3T2zkcme07PdCv2r9+HPEV5fVMvEudD
 sBS/FxnniOJsaHMVWcSzIXUKjQ73LWYjSZQY6aMST5fy3MMwmZJSIEyVraxH+IK4RsbvmW5Ad7A
 ON1Hl5EsZZjMuKKeXKJUfRprMDe1eYBgraT12UKLKT5FzQQ+4
X-Received: by 2002:a05:600c:3baa:b0:499:ae94:be05 with SMTP id
 5b1f17b1804b1-499dc6a3e86mr169025505e9.0.1787818855207; 
 Thu, 27 Aug 2026 01:20:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3baa:b0:499:ae94:be05 with SMTP id
 5b1f17b1804b1-499dc6a3e86mr169024705e9.0.1787818854838; 
 Thu, 27 Aug 2026 01:20:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dd55dd4bsm52286485e9.3.2026.08.27.01.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:20:53 -0700 (PDT)
Message-ID: <612d54f3-929a-45bc-9c7c-1e3cbfcd71eb@redhat.com>
Date: Thu, 27 Aug 2026 10:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 05/28] hw/arm/smmu-common: Add security-aware address
 space selector
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162410.2805113-5-tangtao1634@phytium.com.cn>
 <94e049b6-f144-4494-a089-2bef2251ca07@oss.qualcomm.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <94e049b6-f144-4494-a089-2bef2251ca07@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G3ZaXtxSi1s8HY2hf2M_tSxgMy4ijivmI6bn-wE9tiY_1787818855
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Tao, Pierrick,

On 8/21/26 12:17 AM, Pierrick Bouvier wrote:
> On 8/13/2026 9:24 AM, Tao Tang wrote:
>> Introduce SMMU_SEC_SID_S to represent SEC_SID == 1, meaning Secure. And
>> then provide smmu_get_address_space, a SMMU instance-based address space
>> selector. The helper returns the per-device memory or secure-memory
>> AddressSpace selected by SEC_SID.
>>
>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> ---
>>  hw/arm/smmu-common.c         | 15 +++++++++++++++
>>  include/hw/arm/smmu-common.h |  3 +++
>>  2 files changed, 18 insertions(+)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 8e40ba603d3..54a6a9f4d62 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -30,6 +30,21 @@
>>  #include "hw/arm/smmu-common.h"
>>  #include "smmu-internal.h"
>>  
>> +AddressSpace *smmu_get_address_space(SMMUState *s, SMMUSecSID sec_sid)
>> +{
>> +    switch (sec_sid) {
>> +    case SMMU_SEC_SID_NS:
>> +        return &s->memory_as;
>> +    case SMMU_SEC_SID_S:
>> +        g_assert(s->secure_memory);
>> +        g_assert(s->secure_memory_as.root);
> This second assert is not needed as we know it was initialized in realize.
agreed, with that removed
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>
>> +        return &s->secure_memory_as;
>> +    case SMMU_SEC_SID_NUM:
>> +        g_assert_not_reached();
>> +    }
>> +    g_assert_not_reached();
>> +}
>> +
>>  /* IOTLB Management */
>>  
>>  static guint smmu_iotlb_key_hash(gconstpointer v)
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index 6ea40f6b074..9d6e2d3038f 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -43,6 +43,7 @@
>>  /* StreamID Security state */
>>  typedef enum SMMUSecSID {
>>      SMMU_SEC_SID_NS = 0,
>> +    SMMU_SEC_SID_S,
>>      SMMU_SEC_SID_NUM,
>>  } SMMUSecSID;
>>  
>> @@ -188,6 +189,8 @@ struct SMMUBaseClass {
>>  #define TYPE_ARM_SMMU "arm-smmu"
>>  OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
>>  
>> +AddressSpace *smmu_get_address_space(SMMUState *s, SMMUSecSID sec_sid);
>> +
>>  /* Return the SMMUPciBus handle associated to a PCI bus number */
>>  SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
>>  
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>


