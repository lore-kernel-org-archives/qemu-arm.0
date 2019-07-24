Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9410533wrv;
        Wed, 24 Jul 2019 07:25:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzs1NK4e3xyyIufqHRN1oDU7C+Y0zxDwBwjJoLLUBs2Z2i+6+AsoE0q1tI8p2YHx4HsGoKK
X-Received: by 2002:a0c:dd86:: with SMTP id v6mr59518475qvk.176.1563978339962;
        Wed, 24 Jul 2019 07:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563978339; cv=none;
        d=google.com; s=arc-20160816;
        b=EHLIjra5VbncWzpRqf4ZMhojKvdXnjUNh6fmksYJS4pgUnqkrGWt6vTq0v2D3mIaLB
         PujnKzLjlShcmDjy/iRDFWawcZcCcnKgds1jWR78i8z0JEydH9dfL+d+3+WWqR70LqGY
         Vkqe+d54VjlFE+kg6wGEP1NI2c/1NHAGT2bbaFpvgVNwdTmpBfAiqsz493kgrmZWGs9a
         15dpPh2rqQ2LoImiqa+OAvGA+DdsgHBPE8HfOmVIvWkw3+LjTjvrK4+FdElqTwHyjPuf
         CAgy7EtmdtOc/dfiesQnm76cKCHqLpqbVQ1cSOQVC3b4uUsgmmMrqPl/WlTL85ti0uTz
         e+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ns4yoF3lhTyRPMVlF46xgCeOB7l3v9WAECcWTsxOKC4=;
        b=NLnhtm06zX/4gsx9U6su6n15PIXtOy2UYtT98qUwi+sCPbSYZvY4hT2d4RGiQsO5/3
         guloILTI/kfleTb/IP+ELhS9S1Kpr7KVgUaHXc8Z2TypcmNRVgO0oneLdXvMsF/olZc6
         g+8M3zeQS9pDR6zbOw9sq7hNSkVE6i2dSqaJKbWSNmh6H4wcEqJPLiaLjwGam5D0YEUz
         VOWyz2z4B1KQmvA9aQlTXh0NAR0LR9F7RvAFfMZogmIXBezvloKK9xU2bFb41dEjE8us
         5wzI+6LQyGtOjF2/F56D4Gc0nc2Ok17LR4WsmIpwCux3sWg89GWIpJKWAAH+y+PBUwuq
         CBLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w8si2726518qta.357.2019.07.24.07.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 07:25:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0636481F0D;
	Wed, 24 Jul 2019 14:25:39 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7848F5D9DE;
	Wed, 24 Jul 2019 14:25:34 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 03/14] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-4-drjones@redhat.com>
 <fec0d7af-a25f-2395-64df-79f2de9579d9@redhat.com>
 <20190626132627.oh2d3qteemgqb6u2@kamzik.brq.redhat.com>
 <848513be-d5c1-7eda-cfc8-bd9836c2ed1d@redhat.com>
 <20190724140502.3ipk2ekr4nyyop2z@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <af580f76-7542-d5a4-7c8f-f75d441ee8e3@redhat.com>
Date: Wed, 24 Jul 2019 16:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190724140502.3ipk2ekr4nyyop2z@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 24 Jul 2019 14:25:39 +0000 (UTC)
X-TUID: btPXasHel4IZ

Hi Drew,
On 7/24/19 4:05 PM, Andrew Jones wrote:
> On Wed, Jul 24, 2019 at 02:51:08PM +0200, Auger Eric wrote:
>> Hi Drew,
>>
>> On 6/26/19 3:26 PM, Andrew Jones wrote:
>>> On Wed, Jun 26, 2019 at 09:43:09AM +0200, Auger Eric wrote:
>>>> Hi Drew,
>>>>
>>>> On 6/21/19 6:34 PM, Andrew Jones wrote:
>>>>> Add support for the query-cpu-model-expansion QMP command to Arm. We
>>>>> do this selectively, only exposing CPU properties which represent
>>>>> optional CPU features which the user may want to enable/disable. Also,
>>>>> for simplicity, we restrict the list of queryable cpu models to 'max',
>>>>> 'host', or the current type when KVM is in use, even though there
>>>>> may exist KVM hosts where other types would also work. For example on a
>>>>> seattle you could use 'host' for the current type, but then attempt to
>>>>> query 'cortex-a57', which is also a valid CPU type to use with KVM on
>>>>> seattle hosts, but that query will fail with our simplifications. This
>>>>> shouldn't be an issue though as management layers and users have been
>>>>> preferring the 'host' CPU type for use with KVM for quite some time.
>>>>> Additionally, if the KVM-enabled QEMU instance running on a seattle
>>>>> host is using the cortex-a57 CPU type, then querying 'cortex-a57' will
>>>>> work. Finally, we only implement expansion type 'full', as Arm does not
>>>>> yet have a "base" CPU type. Below are some example calls and results
>>>>> (to save character clutter they're not in json, but are still json-ish
>>>>> to give the idea)
>>>>>
>>>>>  # expand the 'max' CPU model
>>>>>  query-cpu-model-expansion: type:full, model:{ name:max }
>>>>>
>>>>>  return: model:{ name:max, props:{ 'aarch64': true, 'pmu': true }}
>>>>>
>>>>>  # attempt to expand the 'max' CPU model with pmu=off
>>>>>  query-cpu-model-expansion:
>>>>>    type:full, model:{ name:max, props:{ 'pmu': false }}
>>>>>
>>>>>  return: model:{ name:max, props:{ 'aarch64': true, 'pmu': false }}
>>>>>
>>>>>  # attempt to expand the 'max' CPU model with aarch64=off
>>>>>  query-cpu-model-expansion:
>>>>>    type:full, model:{ name:max, props:{ 'aarch64': false }}
>>>>>
>>>>>  error: "'aarch64' feature cannot be disabled unless KVM is enabled
>>>>>          and 32-bit EL1 is supported"
>>>>>
>>>>> In the last example KVM was not in use so an error was returned.
>>>>>
>>>>> Note1: It's possible for features to have dependencies on other
>>>>> features. I.e. it may be possible to change one feature at a time
>>>>> without error, but when attempting to change all features at once
>>>>> an error could occur depending on the order they are processed. It's
>>>>> also possible changing all at once doesn't generate an error, because
>>>>> a feature's dependencies are satisfied with other features, but the
>>>>> same feature cannot be changed independently without error. For these
>>>>> reasons callers should always attempt to make their desired changes
>>>>> all at once in order to ensure the collection is valid.
>>>>>
>>>>> Note2: Certainly more features may be added to the list of
>>>>> advertised features, e.g. 'vfp' and 'neon'. The only requirement
>>>>> is that their property set accessors fail when invalid
>>>>> configurations are detected. For vfp we would need something like
>>>>>
>>>>>  set_vfp()
>>>>>  {
>>>>>    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
>>>>>        cpu->has_vfp != cpu->has_neon)
>>>>>        error("AArch64 CPUs must have both VFP and Neon or neither")
>>>>>
>>>>> in its set accessor, and the same for neon, rather than doing that
>>>>> check at realize time, which isn't executed at qmp query time.
>>>>>
>>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>>> ---
>>>>>  qapi/target.json     |   6 +-
>>>>>  target/arm/monitor.c | 132 +++++++++++++++++++++++++++++++++++++++++++
>>>>>  2 files changed, 135 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/qapi/target.json b/qapi/target.json
>>>>> index 1d4d54b6002e..edfa2f82b916 100644
>>>>> --- a/qapi/target.json
>>>>> +++ b/qapi/target.json
>>>>> @@ -408,7 +408,7 @@
>>>>>  ##
>>>>>  { 'struct': 'CpuModelExpansionInfo',
>>>>>    'data': { 'model': 'CpuModelInfo' },
>>>>> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
>>>>> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
>>>>>  
>>>>>  ##
>>>>>  # @query-cpu-model-expansion:
>>>>> @@ -433,7 +433,7 @@
>>>>>  #   query-cpu-model-expansion while using these is not advised.
>>>>>  #
>>>>>  # Some architectures may not support all expansion types. s390x supports
>>>>> -# "full" and "static".
>>>>> +# "full" and "static". Arm only supports "full".
>>>>>  #
>>>>>  # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
>>>>>  #          not supported, if the model cannot be expanded, if the model contains
>>>>> @@ -447,7 +447,7 @@
>>>>>    'data': { 'type': 'CpuModelExpansionType',
>>>>>              'model': 'CpuModelInfo' },
>>>>>    'returns': 'CpuModelExpansionInfo',
>>>>> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
>>>>> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
>>>>>  
>>>>>  ##
>>>>>  # @CpuDefinitionInfo:
>>>>> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
>>>>> index 41b32b94b258..19e3120eef95 100644
>>>>> --- a/target/arm/monitor.c
>>>>> +++ b/target/arm/monitor.c
>>>>> @@ -23,7 +23,13 @@
>>>>>  #include "qemu/osdep.h"
>>>>>  #include "hw/boards.h"
>>>>>  #include "kvm_arm.h"
>>>>> +#include "qapi/error.h"
>>>>> +#include "qapi/visitor.h"
>>>>> +#include "qapi/qobject-input-visitor.h"
>>>>>  #include "qapi/qapi-commands-target.h"
>>>>> +#include "qapi/qmp/qerror.h"
>>>>> +#include "qapi/qmp/qdict.h"
>>>>> +#include "qom/qom-qobject.h"
>>>>>  
>>>>>  static GICCapability *gic_cap_new(int version)
>>>>>  {
>>>>> @@ -82,3 +88,129 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>>>>>  
>>>>>      return head;
>>>>>  }
>>>>> +
>>>>> +static const char *cpu_model_advertised_features[] = {
>>>>> +    "aarch64", "pmu",
>>>>> +    NULL
>>>>> +};
>>>>> +
>>>>> +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>>> +                                                     CpuModelInfo *model,
>>>>> +                                                     Error **errp)
>>>>> +{
>>>>> +    CpuModelExpansionInfo *expansion_info;
>>>>> +    const QDict *qdict_in = NULL;
>>>>> +    QDict *qdict_out;
>>>>> +    ObjectClass *oc;
>>>>> +    Object *obj;
>>>>> +    const char *name;
>>>>> +    int i;
>>>>> +
>>>>> +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
>>>>> +        error_setg(errp, "The requested expansion type is not supported.");
>>>>> +        return NULL;
>>>>> +    }
>>>>> +
>>>>> +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
>>>>> +        error_setg(errp, "The CPU definition '%s' requires KVM", model->name);
>>>>> +        return NULL;
>>>>> +    }
>>>>> +
>>>>> +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
>>>>> +    if (!oc) {
>>>>> +        error_setg(errp, "The CPU definition '%s' is unknown.", model->name);
>>>>> +        return NULL;
>>>>> +    }
>>>>> +
>>>>> +    if (kvm_enabled()) {
>>>>> +        const char *cpu_type = current_machine->cpu_type;
>>>>> +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
>>>>> +        bool supported = false;
>>>>> +
>>>>> +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
>>>>> +            /* These are kvmarm's recommended cpu types */
>>>>> +            supported = true;
>>>>> +        } else if (strlen(model->name) == len &&
>>>>> +                   !strncmp(model->name, cpu_type, len)) {
>>>>> +            /* KVM is enabled and we're using this type, so it works. */
>>>>> +            supported = true;
>>>>> +        }
>>>>> +        if (!supported) {
>>>>> +            error_setg(errp, "The CPU definition '%s' cannot "
>>>> use model name instead of CPU definition?
>>>
>>> I took that wording from s390x, but maybe I prefer "The CPU type..."
>>> better. I'll change it for v3.>> This CPU type is not recognized as an ARM CPU type?
> 
> That's not what this error message is stating. The CPU type may well be an
> ARM CPU type, but it's not one you can expect to use with KVM enabled. I
> currently have
> 
>   "The CPU type '%s' cannot "
>   "be used with KVM on this host", model->name)
> 
> queued up for v3.

decidedly, I meant the error message associated to:

+    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
+    if (!oc) {
+        error_setg(errp, "The CPU definition '%s' is unknown.",
model->name);
+        return NULL;
+    }

Why am I always looking at your series when we suffer heat wave?

Thanks

Eric
> 
>>>
>>>>> +                             "be used with KVM on this host", model->name);
>>>>
>>>> According to your commit mesg doesn't it mean that we fall into the
>>>> simplification you mentionned and not necessarily that the model name
>>>> cannot be used along with KVM?
>>>
>>> There's no way to know that. The simplification is meant to avoid having
>>> to know which models will work with KVM, because most don't, but some do.
>>> Can you suggest wording you'd prefer if you don't want to make the error
>>> message so absolute? I think I prefer keeping it simple like this and
>>> just saying it doesn't work.
>> Something like:
>> "We cannot guarantee the CPU type %s works with KVM on this host"
> 
> OK, I can change to this one.
> 
>>>
>>>>
>>>>> seattle you could use 'host' for the current type, but then attempt to
>>>>> query 'cortex-a57', which is also a valid CPU type to use with KVM on
>>>>> seattle hosts, but that query will fail with our simplifications
>>>>> +            return NULL;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (model->props) {
>>>>> +        qdict_in = qobject_to(QDict, model->props);
>>>>> +        if (!qdict_in) {
>>>>> +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
>>>>> +            return NULL;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    obj = object_new(object_class_get_name(oc));
>>>>> +
>>>>> +    if (qdict_in) {
>>>>> +        Visitor *visitor;
>>>>> +
>>>>> +        visitor = qobject_input_visitor_new(model->props);
>>>>> +        visit_start_struct(visitor, NULL, NULL, 0, errp);
>>>>> +        if (*errp) {
>>>> Normally we shouldn't do that as errp can be NULL. see /include/qapi/error.h
>>>> I see the same in cpu_model_from_info() by the way (s390x/cpu_models.c)
>>>> Maybe you can guarantee that errp isn't NULL but ...
>>>
>>> Yeah, I know about the errp NULL thing, which is why I use local_err
>>> elsewhere. I decided to follow s390x here though because I'm guessing
>>> our QMP function will never be called with a NULL errp, it just
>>> wouldn't work that way. Would you be satisfied with an assert(errp)
>>> at the top of the function? Or should I switch all these to local_err
>>> and then propagate?
>> well up to maintainers. If it is not that much a pain, just propagate ;-)
>>>
> 
> OK, I'll just propagate.
> 
> Thanks,
> drew
> 
