Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4603EC5DF9C
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 17:23:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyYO2-000773-Un; Mon, 24 Aug 2026 13:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wyYO0-00070r-U0
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 13:23:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wyYNy-000159-VL
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 13:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787592181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbUK19ldvIBWtcuD0oTMHA2hFkXjZn0gQlWJ+k3b3+E=;
 b=D/SEvDqDj2GtNY2Ho5HP1pwhYeGaIq46fQwGq9HvbR+qWXpv67Z/14R7uy+FJhMHS68i3k
 IM+38YXVm7v0ZnmqNfLbdOkISfK944w0ZhfmDcV9RuRTh0dIUM0PxhwX+8mmnRVOjnmIA8
 +LCzB/fpDhoaI6eSz9wfqrMb8CvSeOQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-e2dBCC7IMbWOzzef32UO3w-1; Mon, 24 Aug 2026 13:22:11 -0400
X-MC-Unique: e2dBCC7IMbWOzzef32UO3w-1
X-Mimecast-MFC-AGG-ID: e2dBCC7IMbWOzzef32UO3w_1787592108
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-c11f2b9f62fso281855466b.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 10:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787592102; x=1788196902;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:reply-to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GbUK19ldvIBWtcuD0oTMHA2hFkXjZn0gQlWJ+k3b3+E=;
 b=CsZty5LzIQx3EVj3USAhSSfxRxrfpUl28eW6pzUBeBSI+uEepuc8RxPc6UvwyWNl4v
 g70p1R7eBcSpi65aJ3TblJzIbxBlf7lF9JjmPKlVu9/IWqpisLIXuIVtEra2LfRdqCvZ
 XAxY4FXnHWZfRgmZLijLq2Dz9IMSEuC1DxE1RMy3aqGV/fyhiS6nwZkl3JJ8clFzQLrw
 OG3fZ3raTMtVc88km2walLDy9Le3O3ap9OYmJbRftUz9DZssCd/1BVZPMH5oZECLDaKm
 wYI1lDK0gLQPmVmGWQJmobeNwFrcZZzMbkXbDP+TeVCuXinWP/5g81wPoIpqe4/KgiTg
 H8NA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqqRFF/4c805ogPM0Sb1XLIQKfZX1jrvH0qaZ6D+R5vPOWooXrjiZtZk3GpU3MWNoEmTc6/jXDZVA==@nongnu.org
X-Gm-Message-State: AFuF++l0cs2azdCatnJeNSmNTuVg4sOsz7QTEPw9wksuD6+CvJmNRmMu
 bhHlkDvz2TR64hk6KDrCphUFrcVYEPB2NkfRXLPLLCY+EpvzQ8pwpEzQPNQS086f3ErzAna18xS
 aBLnS6ELyZsVmUxCTTevExTM4KEPZzaBEk8Iw0v5G63qfNSRiUYZ9OQ==
X-Gm-Gg: AR+sD12SJJ7IeQ9AAzlHCAP8CY/VuYqGKKkTrYSSgkqNbuglRq4Km58ZfsIW2ATQVBh
 sV3w/v3UtFBrP1ijMP0/oz0/RQTz2zAvaFD2dYJeHWZf8M+qLzjRBkY2SBuat3bnOyLitrF/MV1
 UIOudV+B9fddo0RZ5Mlna1aD3y4rGy1IwXT/xT/rLdtTN/pb/0lT2jipbF3VHXYONhCraHWgRfM
 Xfq3ekd5biA4ItssGrhNgpPsX5Ewub26vhnk5rdZUrP7I09uYqOgXAe6nUwWxGHPo1go+7/6DWD
 RKje7EdwgW29e1tpDDPfU/V5KEJJlF4ATA0kzFsm3hOfm2O7im6sEylMjusqttVpBMH6bII23lj
 5i9IoFPKXVlTa8Mj+0PeWlyetya7bNl2idZ/O7ekMyzwQAVnO
X-Received: by 2002:a17:907:940f:b0:c21:74ad:8b7a with SMTP id
 a640c23a62f3a-c24e5a5243amr4842566b.9.1787592101810; 
 Mon, 24 Aug 2026 10:21:41 -0700 (PDT)
X-Received: by 2002:a17:907:940f:b0:c21:74ad:8b7a with SMTP id
 a640c23a62f3a-c24e5a5243amr4840866b.9.1787592101419; 
 Mon, 24 Aug 2026 10:21:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249629563dsm1407710366b.17.2026.08.24.10.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 10:21:40 -0700 (PDT)
Message-ID: <e2fbfb8a-b3e5-4e27-b938-d92d3ccfe83f@redhat.com>
Date: Mon, 24 Aug 2026 19:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RFC PATCH v7 12/18] target/arm/kvm: Introduce
 kvm_arm_expose_idreg_properties
To: Markus Armbruster <armbru@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, shaju.abraham@nutanix.com,
 khushit.shah@nutanix.com, yangjinqian1@huawei.com, cohuck@redhat.com,
 richard.henderson@linaro.org, sebott@redhat.com, skolothumtho@nvidia.com,
 philmd@oss.qualcomm.com, maz@kernel.org, oliver.upton@linux.dev,
 pbonzini@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com
References: <20260726153221.24773-1-eric.auger@redhat.com>
 <20260726153221.24773-13-eric.auger@redhat.com> <87a4qh3tbn.fsf@pond.sub.org>
In-Reply-To: <87a4qh3tbn.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YRXCcIWoS9Ox8SyIlBpvl0wKWStYPF5s89P10HuK1cE_1787592108
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

Hi Markus,
On 8/20/26 1:49 PM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> This helper decode the ID reg writable mask, matches it against
>> ID reg fields defined in target/arm/cpu-idregs.h.inc and
>> for each writable named field, generates a uint64 property.
>>
>> REVIDR_EL1 and AIDR_EL1 are writable but they do not expose any
>> field. They will be handled separately.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [...]
>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 4f9b0a559d..1a78893f87 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
> [...]
>
>> +static void set_sysreg_prop(Object *obj, Visitor *v,
>> +                            const char *name, void *opaque,
>> +                            Error **errp)
>> +{
>> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    uint64_t *idregs = cpu->isar.idregs;
>> +    uint64_t old, value, mask;
>> +    int lower = field->shift;
>> +    int length = field->length;
>> +    int index = field->index;
>> +
>> +    if (!visit_type_uint64(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (length < 64 && value > ((1 << length) - 1)) {
>> +        error_setg(errp,
>> +                   "idreg %s set value (0x%lx) exceeds length of field (%d)!",
>> +                   name, value, length);
>> +        return;
>> +    }
>> +
>> +    if (field->arch_vals) {
>> +        /* this field has some enum values */
>> +        for (int i = 0; i < field->arch_vals_count; i++) {
>> +            if (value == field->arch_vals[i].value) {
>> +                goto valid;
>> +            }
>> +        }
>> +        error_setg(errp,
>> +                   "idreg %s set value (0x%lx) does not match any "
>> +                   "arch valid enum value!", name, value);
> Scratch the !
>
> From error_setg()'s contract:
>
>  * The resulting message should be a single phrase, with no newline or
>  * trailing punctuation.

done. Thank you for the reminder!

Eric
>
>> +        return;
>> +    }
>> +
>> +valid:
>> +
>> +    mask = MAKE_64BIT_MASK(lower, length);
>> +    value = value << lower;
>> +    old = idregs[index];
>> +    idregs[index] = old & ~mask;
>> +    idregs[index] |= value;
>> +    trace_set_sysreg_prop(name, old, mask, value, idregs[index]);
>> +}
> [...]
>


