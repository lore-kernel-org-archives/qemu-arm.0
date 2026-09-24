Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914D6C98310
	for <qemu-arm@archiver.kernel.org>; Thu, 24 Sep 2026 06:43:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9dAk-0005S4-KG; Thu, 24 Sep 2026 02:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9dAY-0005NP-PU
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 02:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9dAX-0001K2-4Q
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 02:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790232175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xix05AhKt/VlngQg3Kkr8TZMZqtmCdybbbxgv1lqsHA=;
 b=Hcv5N+0ul1JvgPzN+5l976v16vE9fy98mCnbdFaH3Gi71wDBqkg4fx60fmx5Gk1/xAVuKt
 kIt388m2BJPXUkR8WgCJkYVVz1gkvskNMTgKResb6GcDu9ghrm9UyfChWgQBd6lU2/6WMe
 aJIDbIQL9pRV+NgKfqnnI/JVwS3p494=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-NdYaXo4lOROnQwvQ7-zENQ-1; Thu, 24 Sep 2026 02:42:54 -0400
X-MC-Unique: NdYaXo4lOROnQwvQ7-zENQ-1
X-Mimecast-MFC-AGG-ID: NdYaXo4lOROnQwvQ7-zENQ_1790232173
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49cf5bd2f12so19517175e9.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 23:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790232173; x=1790836973;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xix05AhKt/VlngQg3Kkr8TZMZqtmCdybbbxgv1lqsHA=;
 b=oo1y2ysOL8mN4uxwHenHjz1f0BHdAWpr/iPrOUKtefSAOLELdT4KPZzsZovf9tT6+j
 w5cnNBHVTMhH/rTV04mkoYj1/aZXkGSbrRyGh41zPT3ENY8nH4/v0vrk29sr9ZfTpnSx
 YywSU8RgXlk3INtr4eFfPmiWEXq9kxzJzB3/tYOjzHcYJw3qK+dvkbmQRpOGyL5UnGxv
 rDR67sD7hpcK2aT3MYSFFYA5Fp/RnpMSPoURk00+78kve0+gEX0Vw9EvfNQKy+ZhLuEw
 8BXn558ePn2/18a6cd6iHkInx5+rOvqfOKyNeClV5xa7MR+e8H43V4zBykmCUy0oCAeM
 iE5g==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6d1YnlGLCHjxv8PGtzFDoZvn8lpZxUiSc0a3u9PmYlylgHzicCHbxL1FWlCgr5A3O35bxKu+IoA==@nongnu.org
X-Gm-Message-State: AFuF++nipPmHL9FuO4EmW4NjziPtjtCqUuz1y7SdXtpt44+juuIbcwW1
 qb/Yi2FKk95FAZxg9wnIrbluaqxGBy4lSe6u3ZVusQm88+nIK8IX9MYXWcU8jbz6Leh2Pl0h5v1
 Ikft4M9mo7tiM2phiLnCJaDlhIc6uwidpS/qUtBvwHtETrlSD9n52DQ==
X-Gm-Gg: AYBFou2v3qj/AZQrnOKNAAbGBCHg56yW1hAo9GPyBg8P7qnUCjB1QZCgmLYgKO1SQwd
 9MmTP9cQW97U39GKDBsiMv82OiNx11L9ugDZy7AIhCXMeQyfJ8wbPbeCythXb1cFPEz+Bz/YzbA
 uXPJmF4sYFqJSPSbqE22kPof/zzAj385QLKyjnO6/C2tN1jt/ke3U9QaNGuSrh7MBby+XeGFCUt
 DLLQXdvMNrjdiFlggDa5vLKC1K3XxLGPO/DWtu1YjX4rEfxIS94OxENlbOxgXsOMTpcf5aIK7P0
 wfPnwvMJpL5dXjLNtMqpSnCrJTcA99bh1aSNblyJUA1PtiCwPcMQuEX4SPaedC7sjQjtiePLTmw
 5lX9c09eUY9S4IDMRwVjYNi+rGd+PPMr1AfdT8wCaSvrKECGs
X-Received: by 2002:a05:600c:1c16:b0:49c:ff3c:973f with SMTP id
 5b1f17b1804b1-49fe7bba7c1mr16937505e9.24.1790232172998; 
 Wed, 23 Sep 2026 23:42:52 -0700 (PDT)
X-Received: by 2002:a05:600c:1c16:b0:49c:ff3c:973f with SMTP id
 5b1f17b1804b1-49fe7bba7c1mr16937215e9.24.1790232172662; 
 Wed, 23 Sep 2026 23:42:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5de4de4sm45838335e9.8.2026.09.23.23.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 23:42:52 -0700 (PDT)
Message-ID: <b8bcd28e-3e4a-4b87-8775-3d994396ddbe@redhat.com>
Date: Thu, 24 Sep 2026 08:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/26] target/arm/kvm: Introduce
 kvm_arm_expose_idreg_properties
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260916144721.751810-1-eric.auger@redhat.com>
 <20260916144721.751810-14-eric.auger@redhat.com>
 <67EB28E9-F8CE-4BE1-8712-88583DEFF24E@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <67EB28E9-F8CE-4BE1-8712-88583DEFF24E@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XE1FowSlmTafPFQIAsXdg4x8-jPAElMXtHM7mFx3hYE_1790232173
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Khushit,

On 9/24/26 8:26 AM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> +
>> +/*
>> + * decode_idreg_writemap: Generate props for writable fields
>> + *
>> + * @obj: CPU object
>> + * @reg: description of the sysreg
>> + */
>> +static int
>> +decode_idreg_writemap(Object *obj, ARM64SysReg *reg)
>> +{
>> +    uint64_t map = reg->writable_mask;
>> +    int i = ctz64(map);
>> +    int nb_sysreg_props = 0;
>> +
>> +    while (map) {
>> +        ARM64SysRegField *field = get_field(i, reg);
>> +        int lower, upper;
>> +        char *prop_name;
>> +        uint64_t field_mask;
>> +
>> +        if (!field) {
>> +            warn_report("%s bit %d of %s is writable but no named field "
>> +                        "in target/arm/cpu-idregs.h.inc",
>> +                        __func__, i, reg->name);
>> +            map =  map & ~BIT_ULL(i);
>> +            i = ctz64(map);
>> +            continue;
>> +        }
>> +        lower = field->shift;
>> +        upper = field->shift + field->length - 1;
>> +        prop_name = g_strdup_printf("SYSREG_%s_%s", reg->name, field->name);
>> +        trace_decode_idreg_writemap(field->name, lower, upper, prop_name);
>> +        object_property_add(obj, prop_name, "uint64",
>> +                            get_sysreg_prop, set_sysreg_prop, NULL, field);
>> +        g_free(prop_name);
>> +        nb_sysreg_props++;
>> +
>> +        field_mask = MAKE_64BIT_MASK(lower, field->length);
>> +        map = map & ~field_mask;
>> +        i = ctz64(map);
>> +    }
>> +    trace_nb_sysreg_props(reg->name, nb_sysreg_props);
>> +    return 0;
>> +}
>> +
> We can try field based handling, it is more elegant.
> - for each field, check if not RES and writable.

I guess you refer to what you did in 

[RFC PATCH v4 02/25] target/arm: expose all non-res ID reg fields as
properties
ie. enumerate through all reg->fields[] array instead of parsing the
writable bitmask. Yes I agree your implementation is simpler.
We can still implement checks against writable masks if wanted.
>
> <Though I will argue that all fields should be present not just writable :)>
Let's discuss that separately. This function could be enhanced to
support both modes anyway.

Thanks

Eric
>
>
>


