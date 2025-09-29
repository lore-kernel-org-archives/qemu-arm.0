Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B4BCAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 15:48:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3G6D-0005Fz-Fr; Mon, 29 Sep 2025 11:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3G67-00056O-4P
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 11:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3G5w-0008UP-Af
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 11:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759160832;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJwwsZ4PeOFhxIj0vGOV2eVKMNRmcVDOuZNnwZpc+H0=;
 b=gE0IN0J6Na7T4LSQq77R3UdS0qJbZ+Gidcb18k8qtsPEhyyzjxmbf0inl9XXGPqvUnZf/r
 d1/oOnrneQKDIuh0WNNFIuNn8ttYkJOEHn0bhP7l3GGIGoKQ7Q87CbBuv5m51ZifbCRRkG
 D65IFXGRgCT6gr1Q73etKLTVqyaXte0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-cKbl5NlzMi-P5EfDuolcfw-1; Mon, 29 Sep 2025 11:47:11 -0400
X-MC-Unique: cKbl5NlzMi-P5EfDuolcfw-1
X-Mimecast-MFC-AGG-ID: cKbl5NlzMi-P5EfDuolcfw_1759160830
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3f3787688b0so2621234f8f.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 08:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759160830; x=1759765630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJwwsZ4PeOFhxIj0vGOV2eVKMNRmcVDOuZNnwZpc+H0=;
 b=FUAGYVRc4/cexAn6LctKNUq8zL9GjHacwpa2go7cSBH3e6d8XxSXmnr4AZSz/TmJ9R
 /iGtEZOyYrPIRsp0/QVs/shHVLT8vGxZXrdRKy2cvVZZjokCFNDt2934HyMuzl5a2qX/
 g2xXW8muJ3V2EQFLSQB6pqk3qBAKsBod7yiHjulBS8Gj29IiCP3mFTzKesa0HmsW3XRT
 WcE8G4FTok4rvlNNUkcNFIgegf/Hfib4K+AY5TqW0UuM+lFFYfaggxubEd9l+X3L/CuZ
 EUr0x167WhWLv91CRwDorCyk17PyOwzPU6rdIPpcFUPM7EUx6NvP9KeeWRE5OAE5r/OD
 ws/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtGDZN0TrxIL+dP7tGu7d8HUk7ye4HOlpJQGVN/XV1I1317xn1QqeGF3DPiocpRb6sEadGkHGMAg==@nongnu.org
X-Gm-Message-State: AOJu0YxbNwQM5tkDSr2V6MhKxScgQqhzyab7zculZa7KG67OSQJdIn03
 iWB/2YIypvCiOaHIRH9HOiJTYFoAj8yugkQifOmRiwPw+hUU5J9POtc19UnM4Bwkkr7PYOZl/u6
 zp7ePnPK9WbxpTnA/nmrt0owU1SynFQaUfBcjCZ8euRGZQ6vUfFaNHA==
X-Gm-Gg: ASbGncuN97JV0r7L+xjmaSe8Isdugu7PJ0yWPFte/7b+Oo0m0oY8oOGDCU6gmdQZzJM
 FKsMlIjnXi9gzIUVBVBbTt8+OvWNGf0S5JJjBT3z27MZv7ENCJmjysE1Pu3eCHC7XFBYFVfF3xv
 hbLpZilfkDkaDN3sPZHaK2m+svAWjgvqvuDrbMhldpNV2iBxLg1lzX8gBEzkjTOw1NuZBAzxmDS
 nlxWPUqxkNRQ0s62uWUEIskFoHN0eFrN2QjioYOlF8gVjtPfa/ItmcEqtaIR0geu5hDBjsYaHAX
 HsxzXPorAHCEAaYZz1/UUg4OoAKP80d0OPXHGqqNWe5mEUFO2yRFRnrsyCtji+oZkDBHdK2lyJc
 1Fsv0MYkRoUo=
X-Received: by 2002:a05:6000:220e:b0:3ea:9042:e682 with SMTP id
 ffacd0b85a97d-40e469db815mr17215331f8f.11.1759160829664; 
 Mon, 29 Sep 2025 08:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdX1o5k3+ciOFUlNyT0PhyDjGAgvaRjI1bcRNVMQAmH987rLmKwzVdyCW3tXaDlRuvQUijmg==
X-Received: by 2002:a05:6000:220e:b0:3ea:9042:e682 with SMTP id
 ffacd0b85a97d-40e469db815mr17215304f8f.11.1759160829247; 
 Mon, 29 Sep 2025 08:47:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7e2bf35sm18955389f8f.53.2025.09.29.08.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 08:47:08 -0700 (PDT)
Message-ID: <00a61c3b-c233-4d40-938b-6d06342e22cf@redhat.com>
Date: Mon, 29 Sep 2025 17:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] hw/arm/smmuv3: Optional Secure bank migration
 via subsections
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
 <20250926033013.1099304-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250926033013.1099304-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xvAAlarSywbzzZNRVr_KRpNs8jc32hXdVK3vpagXgQA_1759160830
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Tao,

On 9/26/25 5:30 AM, Tao Tang wrote:
> My apologies, resending patches 13-14/14 to fix a threading mistake from
> my previous attempt.
>
> Introduce a generic vmstate_smmuv3_bank that serializes a single SMMUv3
> bank (registers and queues). Add a 'smmuv3/bank_s' subsection guarded by
> secure_impl and a new 'migrate-secure-bank' property; when enabled, the S
> bank is migrated. Add a 'smmuv3/gbpa_secure' subsection which is only sent
> when GBPA differs from its reset value.
>
> This keeps the existing migration stream unchanged by default and remains
> backward compatible: older QEMUs can ignore unknown subsections, and with
> 'migrate-secure-bank' defaulting to off, the stream is identical to before.
>
> This also prepares for future RME extensions (Realm/Root) by reusing the
> bank subsection pattern.
>
> Usage:
>   -global arm-smmuv3,secure-impl=on,migrate-secure-bank=on
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c         | 70 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h |  1 +
>  2 files changed, 71 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 80fbc25cf5..2a1e80d179 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2450,6 +2450,53 @@ static const VMStateDescription vmstate_smmuv3_queue = {
>      },
>  };
>
> +static const VMStateDescription vmstate_smmuv3_bank = {
I would name this vmstate_smmuv3_secure_bank
> +    .name = "smmuv3_bank",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT32(features, SMMUv3RegBank),
> +        VMSTATE_UINT8(sid_split, SMMUv3RegBank),
> +        VMSTATE_UINT32_ARRAY(cr, SMMUv3RegBank, 3),
> +        VMSTATE_UINT32(cr0ack, SMMUv3RegBank),
> +        VMSTATE_UINT32(irq_ctrl, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerror, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerrorn, SMMUv3RegBank),
> +        VMSTATE_UINT64(gerror_irq_cfg0, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerror_irq_cfg1, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerror_irq_cfg2, SMMUv3RegBank),
> +        VMSTATE_UINT64(strtab_base, SMMUv3RegBank),
> +        VMSTATE_UINT32(strtab_base_cfg, SMMUv3RegBank),
> +        VMSTATE_UINT64(eventq_irq_cfg0, SMMUv3RegBank),
> +        VMSTATE_UINT32(eventq_irq_cfg1, SMMUv3RegBank),
> +        VMSTATE_UINT32(eventq_irq_cfg2, SMMUv3RegBank),
> +        VMSTATE_STRUCT(cmdq, SMMUv3RegBank, 0,
> +                       vmstate_smmuv3_queue, SMMUQueue),
> +        VMSTATE_STRUCT(eventq, SMMUv3RegBank, 0,
> +                       vmstate_smmuv3_queue, SMMUQueue),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static bool smmuv3_secure_bank_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    return s->secure_impl && s->migrate_secure_bank;
why is it needed to check s->migrate_secure_bank?
> +}
> +
> +static const VMStateDescription vmstate_smmuv3_bank_s = {
> +    .name = "smmuv3/bank_s",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smmuv3_secure_bank_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_STRUCT(bank[SMMU_SEC_IDX_S], SMMUv3State, 0,
> +                       vmstate_smmuv3_bank, SMMUv3RegBank),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
>  static bool smmuv3_gbpa_needed(void *opaque)
>  {
>      SMMUv3State *s = opaque;
> @@ -2469,6 +2516,25 @@ static const VMStateDescription vmstate_gbpa = {
>      }
>  };
>
> +static bool smmuv3_gbpa_secure_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    return s->secure_impl && s->migrate_secure_bank &&
same
> +           s->bank[SMMU_SEC_IDX_S].gbpa != SMMU_GBPA_RESET_VAL;
> +}
> +
> +static const VMStateDescription vmstate_gbpa_secure = {
> +    .name = "smmuv3/gbpa_secure",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smmuv3_gbpa_secure_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT32(bank[SMMU_SEC_IDX_S].gbpa, SMMUv3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_smmuv3 = {
>      .name = "smmuv3",
>      .version_id = 1,
> @@ -2502,6 +2568,8 @@ static const VMStateDescription vmstate_smmuv3 = {
>      },
>      .subsections = (const VMStateDescription * const []) {
>          &vmstate_gbpa,
> +        &vmstate_smmuv3_bank_s,
> +        &vmstate_gbpa_secure,
>          NULL
>      }
>  };
> @@ -2521,6 +2589,8 @@ static const Property smmuv3_properties[] = {
>       * Defaults to false (0)
>       */
>      DEFINE_PROP_BOOL("secure-impl", SMMUv3State, secure_impl, false),
> +    DEFINE_PROP_BOOL("migrate-secure-bank", SMMUv3State,
> +                     migrate_secure_bank, false),
I don't get why you need another migrate_secure_bank prop. You need to
migrate the subsection if secure_impl is implemented, don't you?
>  };
>
>  static void smmuv3_instance_init(Object *obj)
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 572f15251e..5ffb609fa2 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -71,6 +71,7 @@ struct SMMUv3State {
>      QemuMutex mutex;
>      char *stage;
>      bool secure_impl;
> +    bool migrate_secure_bank;
>  };
>
>  typedef enum {
> --
> 2.34.1
>
Eric


