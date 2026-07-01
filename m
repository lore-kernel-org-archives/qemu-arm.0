Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733D4C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 14:10:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wevdb-0003VI-Qg; Wed, 01 Jul 2026 10:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wevda-0003UN-Be
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 10:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wevdY-0003y4-I5
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 10:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782914999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSJoBP1n90AixtXBkqkDbkBEiMdcH6OFxpJmUJV3xi0=;
 b=DGCPtf44uWYoDEN1NVhcaA5cDGcUx85iejRgdlldCjtgqexMVY39kK03kkFTrRx4HnhOoO
 AiyMv0g0IpM1sejxOclDDSMeK7V/ztrx5TQefhyaVrzHyF3KGro+N/VDBo1KJULI1H7Vo1
 udaLmyete9OHGI16n3Nsi06ujkEqyBo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-QRRqfa2TNBiBVQvQUba8Sw-1; Wed, 01 Jul 2026 10:09:55 -0400
X-MC-Unique: QRRqfa2TNBiBVQvQUba8Sw-1
X-Mimecast-MFC-AGG-ID: QRRqfa2TNBiBVQvQUba8Sw_1782914994
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c12518f7c22so73848966b.2
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 07:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782914994; x=1783519794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSJoBP1n90AixtXBkqkDbkBEiMdcH6OFxpJmUJV3xi0=;
 b=UTbYXKAusfAbiQ931/byijyQ+Zxbpwz72Y0a8nG+qCXhRvy6obw39RxYJg/QXaW3ng
 GjQZ0nWxep+J3vzwrkCGL87P+E5hev3sw861xf6awNnPmaRTZLnAIup4fpZqxTEsCGaM
 b/RCok36U0b7BXgpjly0hRxIcbvQXBgS7PwP6KPgSN6PYsSZm7C+tHr0K0foFCULxnkd
 nXavfZVhAF0n/mr1YJRtx8KP/pSg9NxJwrMEqTfAOrZwrHF0cshhp0psczQg+t8q/CJr
 n+3RvpUD1ULlcE5VtT1KtltUuu+zbYe0FHoAvnStrsL/yePVSurwS7ejufTlzXTOzRmO
 QPFw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4IOrjrL8Pz9eP1xRUOn9hX84tL72ismpOU5HSPde4uz705a2uBTC7HrgIVsE/OatfGl/WWPA7BA==@nongnu.org
X-Gm-Message-State: AOJu0Yxul8Dg1dcDclK3mpsaAuEdZJekSpdlbVN+XMPFUNF7NC3X4MZG
 UhX4ZOzZj9LnJFSDFW+BbzoVmR9wfwWJ+7ocf3pT6Ue3gS1CRWAjQDJEZfAdMAAvg+m6Rd+NHt9
 NmUI54i3kEKKCsGBX1JuR+jjCLuWNcFkzKtbo3z66Vq4XAHDY1/R74w==
X-Gm-Gg: AfdE7cn3opabuqtTjTmrRv3XPVgg7kHgEtQ54FU7CboEMZi95iFrcReIUymMqoWClTo
 RdradODW4R10xqI1d7V6yHxviTjunobPAPceiqBI9sV7h80nbWjd6uSB2ZdJSzQZOazHxqzlFxh
 yz1K8e0Y7jZksdmCHaAMeX05WJlRyYafrtWKHU4C3EY0dMXsYszdUtIjz1fXSxCRnBggDeA7EGj
 w7LC63Gw6+HShklXM6fuQiiPJaBhpbVaD8gXwjX1NmZYfFg9AULWmyUNEVny1F1lhuHUk0B5Z4V
 Iw/kWioFwcmhhj3Dm2SMBlvQLVXSC2BzloXeUhufX4s8HZBHJDLP1tU84gy5MI6XAI7suIPx4hk
 GPG5mQEApvzCqkdOt/R8e42bHXefTAtlr0nPN+LKqxgEFgSc/SieG2JsGAwA=
X-Received: by 2002:a17:906:f84a:b0:c12:9136:8a1a with SMTP id
 a640c23a62f3a-c12aa137356mr70447266b.31.1782914994224; 
 Wed, 01 Jul 2026 07:09:54 -0700 (PDT)
X-Received: by 2002:a17:906:f84a:b0:c12:9136:8a1a with SMTP id
 a640c23a62f3a-c12aa137356mr70444966b.31.1782914993819; 
 Wed, 01 Jul 2026 07:09:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288f0dfdesm279151066b.30.2026.07.01.07.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 07:09:53 -0700 (PDT)
Message-ID: <5d91c5f7-9f69-4cd2-bc8c-7d06962e5fe6@redhat.com>
Date: Wed, 1 Jul 2026 16:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 14/17] arm-qmp-cmds: introspection for ID register
 props
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
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>,
 Sandesh Patel <sandesh.patel@nutanix.com>
References: <20260616132625.1732031-1-eric.auger@redhat.com>
 <20260616132625.1732031-15-eric.auger@redhat.com>
 <c6f663fc-93ad-4a22-b9dc-d7a4653bf348@redhat.com>
 <A6010F6F-FF60-4227-ACFE-B141EEBE88AC@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <A6010F6F-FF60-4227-ACFE-B141EEBE88AC@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9I071Eom2h52-29WjldgDZ1Cp2aOwOoAaDRDXVdha9Y_1782914994
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



On 6/19/26 8:05 AM, Khushit Shah wrote:
>
>> On 18 Jun 2026, at 2:56 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Hi Khushit,
>>
>> On 6/16/26 3:17 PM, Eric Auger wrote:
>>> From: Cornelia Huck <cohuck@redhat.com>
>>>
>>> Implement the capability to query available ID register values by
>>> adding SYSREG_* options and values to the cpu model expansion for the
>>> host model, if available.
>>>
>>> Excerpt:
>>> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
>>> {"return": {"model": {"name": "host", "props": {"SYSREG_ID_AA64PFR0_EL1_EL3": 1,
>>> "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0, "SYSREG_CTR_EL0_L1Ip": 3,
>>> "SYSREG_MIDR_EL1_PartNum": 3407, "SYSREG_CTR_EL0_DminLine": 4,
>>> "SYSREG_ID_AA64MMFR0_EL1_PARange": 5, "SYSREG_ID_AA64MMFR1_EL1_ECBHB": 0
>>> ../..
>>>
>>> So this allows the upper stack to detect available writable ID
>>> regs and the "host passthrough model" values.
>>>
>>> It also allows to test some ID reg field values:
>>> (QEMU) query-cpu-model-expansion type=full model={"name":"host","props":{"SYSREG_ID_AA64ISAR0_EL1_DP":0x13}}
>>> {"error": {"class": "GenericError", "desc": "idreg SYSREG_ID_AA64ISAR0_EL1_DP set value (0x13) exceeds length of field (4)!"}}
>>>
>>> (QEMU) query-cpu-model-expansion type=full model={"name":"host","props":{"SYSREG_ID_AA64ISAR0_EL1_DP":0x2}}
>>> {"error": {"class": "GenericError", "desc": "idreg SYSREG_ID_AA64ISAR0_EL1_DP set value (0x2) does not match any arch valid enum value!"}}
>> for your info I am currently exploring ways to test set field values
>> against KVM. Current check only test against field size and enum values
>> if any.
>>
>> I have a POC instantiating a scratch vcpu and it is totally feasible to
>> set the id reg with the modified value. What is more tricky is to build
>> an incremental scratch vcpu with all the set values accumulating But I
>> guess it should be feasible too.
>>
>> If we manage to do that, I don't think you need safe rules/values
>> anymore because using query-cpu-model-expansion you could directly check
>> the enhanced cpu model can safely apply on host. I will share as soon as
>> I get something clean enough. Thanks Eric
> This seems like it is definitely doable. But, I think it is inefficient and does not
> scale with the number of cpu models.
>
> It will essentially require 1 (vcpu create) + x (number of id register) ioctl calls
> per Named CPU model or a configuration that management software wants
> to test.
yes. But that's also the only way to test incremental stacked settings.
If an IDREG setting depends on a formerly applied one and is
incompatible, you will know. With only safe_rules/values you won't have
that precision I am afraid.
>
> In v3, I will  change how we handle safe_rules. As the analysis in mail to Marc
> almost all of the writeable ID register fields supports writing a lower value.
>
> There are only few exceptions.

OK
>
> Another point I want to raise is without safe_rules, we will not have
> QMP feature parity with x86 where cpu-definitions reports model
> blocker properties. This in-parity means some management
Interesting. I need to further look at cpu-definitions I acknowledge

Thanks

Eric
> software can not be easily ported to work with arm64 named
> cpu models. 
>
> Warm Regards,
> Khushit
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>
>>> ---
>>>
>>> v5 -> v6:
>>> - add the write capability
>>> ---
>>> target/arm/arm-qmp-cmds.c | 29 +++++++++++++++++++++++++++++
>>> 1 file changed, 29 insertions(+)
>>>
>>> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
>>> index 83ec95c290..edcfc82a25 100644
>>> --- a/target/arm/arm-qmp-cmds.c
>>> +++ b/target/arm/arm-qmp-cmds.c
>>> @@ -21,6 +21,7 @@
>>>  */
>>>
>>> #include "qemu/osdep.h"
>>> +#include "qemu/error-report.h"
>>> #include "qemu/target-info.h"
>>> #include "hw/core/boards.h"
>>> #include "kvm_arm.h"
>>> @@ -84,6 +85,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>                                                      Error **errp)
>>> {
>>>     CpuModelExpansionInfo *expansion_info;
>>> +    ObjectPropertyIterator iter;
>>> +    ObjectProperty *idregprop;
>>>     const QDict *qdict_in;
>>>     QDict *qdict_out;
>>>     ObjectClass *oc;
>>> @@ -145,6 +148,20 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>         }
>>>
>>>         qdict_in = qobject_to(QDict, model->props);
>>> +
>>> +        object_property_iter_init(&iter, obj);
>>> +
>>> +        while ((idregprop = object_property_iter_next(&iter))) {
>>> +            if (!g_str_has_prefix(idregprop->name, "SYSREG_")) {
>>> +                continue;
>>> +            }
>>> +            if (qdict_get(qdict_in, idregprop->name)) {
>>> +                if (!object_property_set(obj, idregprop->name, visitor, &err)) {
>>> +                    break;
>>> +                }
>>> +            }
>>> +        }
>>> +
>>>         i = 0;
>>>         while ((name = cpu_model_advertised_features[i++]) != NULL) {
>>>             if (qdict_get(qdict_in, name)) {
>>> @@ -190,6 +207,18 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>         }
>>>     }
>>>
>>> +    object_property_iter_init(&iter, obj);
>>> +
>>> +    while ((idregprop = object_property_iter_next(&iter))) {
>>> +        QObject *value;
>>> +
>>> +        if (!g_str_has_prefix(idregprop->name, "SYSREG_")) {
>>> +            continue;
>>> +        }
>>> +        value = object_property_get_qobject(obj, idregprop->name, &error_abort);
>>> +        qdict_put_obj(qdict_out, idregprop->name, value);
>>> +    }
>>> +
>>>     if (!qdict_size(qdict_out)) {
>>>         qobject_unref(qdict_out);
>>>     } else {
>


