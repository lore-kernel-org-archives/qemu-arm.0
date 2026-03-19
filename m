Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D41075289
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 09:36:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w39nP-00081v-M9; Thu, 19 Mar 2026 05:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w39nN-00081B-Tc
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 05:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w39nL-0004NM-Kj
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 05:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773912957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L53/CSCbpffaHBzdhKzgNQ95ArXmkmFVoIY+FVvW4Rg=;
 b=GLks5A7/v4Vog29S5MMLtsvE5WD7+nTzAILv2zrucYV7dyN9onzeXVhmzrkvNz5pWG3KRR
 uU5t3cBuTdZJcN1kWU1QWwyUH0EhtI14fQ/B1aqcDmI3CEp3FpC/462k411WhgVQjzJZPP
 FrtuMF6VKfW9fUKJXd2RV2y6Dqf57mo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-c1mlBwraOZy63dGToaxwvw-1; Thu, 19 Mar 2026 05:35:56 -0400
X-MC-Unique: c1mlBwraOZy63dGToaxwvw-1
X-Mimecast-MFC-AGG-ID: c1mlBwraOZy63dGToaxwvw_1773912955
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439cbc5fb4fso542531f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 02:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773912955; x=1774517755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L53/CSCbpffaHBzdhKzgNQ95ArXmkmFVoIY+FVvW4Rg=;
 b=Ujp67FGAdbUlnyaWH3Xhw5w9gOI2szo4slaB0grI7yenEd1ZlFF6PJuCSG0PatQyyz
 krYdcz0zEAgMrLZOT8m43vKbYpmIKgT4/P0EPlWdm02RewmFruFwrp3MetWUMTDG9t+T
 F30/Ktbw6uiyJywURtEeSj7CjB0nmuFwk6/pDMfaKzy56BXikg3d3JKo87YZdpjON5YV
 s6dhYEcoqdmjPMSucsV5MRI9OuG/VeYPtqyooDMd4UqnF//4QsgBYHvJw1+QvwBaYoni
 ZzsHvNqo8yI2uICBsaA6PCdBO6HGV62vBbSkZYrdsU9WmJea3LG7/OOfr8oHSPduVUeb
 62HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJwKDEYTO/txADc1DNON3fcXaMZVs2B5LelBnX0n7HfpjB9YBUiJeyS4Th23yCQvdrvejeQeSmrg==@nongnu.org
X-Gm-Message-State: AOJu0Yyx+mQ8gwwGHIA9p2Au2w4E4V/Wg9F2ERgtgawebPiFDA5k1Jve
 UnYXAh/edqPnJ0zmxDGfkG13h/t6LHt0WgKial3/lqw7l8VCmYfvXZwHS6oxLC6Z9tPxQaoDIs+
 dLurgBtWDMXCp06aEdX+BbLIRnmmDXO8wHypV21xzZqAP2q2Hu5jxgw==
X-Gm-Gg: ATEYQzzWObPQHymhxYOBJrBd9mFmZwjcedfFM7iCd7oVz5RzHpQHgLWuTDU0b9IQVzK
 ZkOz6mt55xXDLADVUz6ojlGDSE3YxSvJDQ3BAJ6ozE91VFrDhCFrM8NqTIFrS+7/YRUznv5TV52
 6kPz6fpNc32471x+tKMgrb5qIB5nQClk04wuSN5H5PPqRsbK2L5teBOCFzaeEMpxJJWuv4RlaZF
 KbHYmh/xJCokX2e1QSuih6QoGqwdW46VI0/BRBSIy8rMnCiW5kx8nRIWDA0unOMQDmDnQsizPaP
 KOqLL6C8U6peOhZfqdNUNch9VMTBfPdoOF0AMZdYjMThI8lflfyr1p2QFpA4vyLADrc26l7VhyU
 u9mGNgZEQ3NZUTnaUdh1TQ7UZT6ciQA8DeSGgS0sBkmvjxOTx1debFGS0K7HHiBpQmd4uMQ==
X-Received: by 2002:a5d:5f54:0:b0:439:b1d8:6091 with SMTP id
 ffacd0b85a97d-43b527a3ee0mr11636367f8f.1.1773912955266; 
 Thu, 19 Mar 2026 02:35:55 -0700 (PDT)
X-Received: by 2002:a5d:5f54:0:b0:439:b1d8:6091 with SMTP id
 ffacd0b85a97d-43b527a3ee0mr11636299f8f.1.1773912954743; 
 Thu, 19 Mar 2026 02:35:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm15150624f8f.0.2026.03.19.02.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 02:35:54 -0700 (PDT)
Message-ID: <a8537a3a-e79f-4e62-a83e-3765dcd217a8@redhat.com>
Date: Thu, 19 Mar 2026 10:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] hw/arm/smmuv3-accel: Change ATS property to
 OnOffAuto
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260318184907.4060030-1-nathanc@nvidia.com>
 <20260318184907.4060030-3-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260318184907.4060030-3-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kCDdHyfZ2RlV2lA8tpjrtRtT7dgJ6r2FeCYGK6Z3tg4_1773912955
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



On 3/18/26 7:49 PM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Change accel SMMUv3 ATS property from bool to OnOffAuto. The 'auto'
> value is not implemented, as this commit is meant to set the property
> to the correct type and avoid breaking JSON/QMP when the auto mode is
> introduced. A future patch will implement resolution of the 'auto'
> value to match the host SMMUv3 ATS support.
>
> Fixes: f7f5013a55a3 ("hw/arm/smmuv3-accel: Add support for ATS")
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.c    |  4 +++-
>  hw/arm/smmuv3.c          | 17 ++++++++++++++---
>  hw/arm/virt-acpi-build.c |  2 +-
>  include/hw/arm/smmuv3.h  |  4 +++-
>  4 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 2bb142c47f..f21a6a9997 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -827,7 +827,9 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, s->ril);
>  
>      /* QEMU SMMUv3 has no ATS. Advertise ATS if opt-in by property */
> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, s->ats);
> +    if (s->ats == ON_OFF_AUTO_ON) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, 1);
> +    }
>  
>      /* Advertise 48-bit OAS in IDR5 when requested (default is 44 bits). */
>      if (s->oas == SMMU_OAS_48BIT) {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 068108e49b..a683402a0c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -317,6 +317,11 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>      smmuv3_accel_idr_override(s);
>  }
>  
> +bool smmuv3_ats_enabled(SMMUv3State *s)
> +{
> +    return FIELD_EX32(s->idr[0], IDR0, ATS);
> +}
> +
>  static void smmuv3_reset(SMMUv3State *s)
>  {
>      s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
> @@ -1966,12 +1971,17 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      }
>  #endif
>  
> +    if (s->ats == ON_OFF_AUTO_AUTO) {
> +        error_setg(errp, "ats auto mode is not supported");
> +        return false;
> +    }
> +
>      if (!s->accel) {
>          if (!s->ril) {
>              error_setg(errp, "ril can only be disabled if accel=on");
>              return false;
>          }
> -        if (s->ats) {
> +        if (s->ats == ON_OFF_AUTO_ON) {
>              error_setg(errp, "ats can only be enabled if accel=on");
>              return false;
>          }
> @@ -2128,7 +2138,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>      /* RIL can be turned off for accel cases */
>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
> -    DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_OFF),
>      DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
>      DEFINE_PROP_UINT8("ssidsize", SMMUv3State, ssidsize, 0),
>  };
> @@ -2160,7 +2170,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "Disable range invalidation support (for accel=on)");
>      object_class_property_set_description(klass, "ats",
>          "Enable/disable ATS support (for accel=on). Please ensure host "
> -        "platform has ATS support before enabling this");
> +        "platform has ATS support before enabling this. ats=auto is not "
> +        "supported.");
>      object_class_property_set_description(klass, "oas",
>          "Specify Output Address Size (for accel=on). Supported values "
>          "are 44 or 48 bits. Defaults to 44 bits");
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 719d2f994e..591cfc993c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -402,7 +402,7 @@ static int iort_smmuv3_devices(Object *obj, void *opaque)
>  
>      bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
>      sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
> -    sdev.ats = object_property_get_bool(obj, "ats", &error_abort);
> +    sdev.ats = smmuv3_ats_enabled(ARM_SMMUV3(obj));
>      pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>      sbdev = SYS_BUS_DEVICE(obj);
>      sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 26b2fc42fd..ce51a5b9b4 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -70,7 +70,7 @@ struct SMMUv3State {
>      uint64_t msi_gpa;
>      Error *migration_blocker;
>      bool ril;
> -    bool ats;
> +    OnOffAuto ats;
>      uint8_t oas;
>      uint8_t ssidsize;
>  };
> @@ -91,6 +91,8 @@ struct SMMUv3Class {
>      ResettablePhases parent_phases;
>  };
>  
> +bool smmuv3_ats_enabled(struct SMMUv3State *s);
> +
>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
>  OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
>  


