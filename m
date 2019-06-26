Received: by 2002:adf:a309:0:0:0:0:0 with SMTP id c9csp583953wrb;
        Wed, 26 Jun 2019 00:43:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxXi3hLh8P2cgfJzgZXl35lxXV/z5XcCsycEHcotPKY0ymBBhex1riIJkOlxPyCxEwdLYt
X-Received: by 2002:a37:a80e:: with SMTP id r14mr2633380qke.134.1561535000395;
        Wed, 26 Jun 2019 00:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561535000; cv=none;
        d=google.com; s=arc-20160816;
        b=0cNXCE8rTJ3dS3K5oXYZ9IhYYa5qMyVPTt+jFd8Ru/g2Nl0vkNhEiVdbRATM0fJL5x
         IqoAN9I88qcxkApray+Z6JeQVprWgdUsoLW/F1STzE0qPjkFEXzGdVc4AvQVRIxpxS7W
         EiI6e6fn3Yf/jvVUJVssWtNLQi0YAyPloE/yZXGMhrHdKiUrVE7yEP+UPs9PIfIgeV5e
         EtQOAmQb32bKpJShYa8XowYmRDjJ+zBrlSvXOFD00LITbyEG0l61L6UMLtmaPRogzMra
         1PgeQZV+UhdVIQcN4dHJl2OArbeNMJPH2ahIE0OHUMCyotpL9MUaAaXGor+gs9L3sSYf
         CJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=6XtMdu3Cb1tEiym9/FlyFg6GQ1AcMJ3Oajo57+OWmIc=;
        b=O9o8eX2E/IMkDV0LN1LN85bdK8ZhIPHVBXCq13hHwdt48G5FierhN8e1V4u+r4BWdm
         dM5QiWiNnVdD035LskpkCqF3WUu+x/D/KRfZ39cp5MZmPr0nyYuaWez9QNXUqvsXipyd
         1RNqJPkPD6+iGcRJbLa4GpYFx0D1TcE23lkYdwu3xaqxgbisY8A8mXRnYYpCTlsQKtXA
         gMAb7Nt7MQOLUQtAnM6scT7qjXo1+nJoFMulR/WJMfPlnH9gb9tsf38AGqvqMjs0UVMN
         mxtEqWAAYx255ZzJqucc+uHqwSUZhabgJ3dOYQsRuXwFL0zC7K2sHBxG2ntDu5d/rz0W
         9G4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n63si11365641qka.114.2019.06.26.00.43.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 00:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 252EE30820C9;
	Wed, 26 Jun 2019 07:43:14 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEED55D719;
	Wed, 26 Jun 2019 07:43:11 +0000 (UTC)
Subject: Re: [PATCH v2 03/14] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-4-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fec0d7af-a25f-2395-64df-79f2de9579d9@redhat.com>
Date: Wed, 26 Jun 2019 09:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-4-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 26 Jun 2019 07:43:19 +0000 (UTC)
X-TUID: jECW+fI9GXjU

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Add support for the query-cpu-model-expansion QMP command to Arm. We
> do this selectively, only exposing CPU properties which represent
> optional CPU features which the user may want to enable/disable. Also,
> for simplicity, we restrict the list of queryable cpu models to 'max',
> 'host', or the current type when KVM is in use, even though there
> may exist KVM hosts where other types would also work. For example on a
> seattle you could use 'host' for the current type, but then attempt to
> query 'cortex-a57', which is also a valid CPU type to use with KVM on
> seattle hosts, but that query will fail with our simplifications. This
> shouldn't be an issue though as management layers and users have been
> preferring the 'host' CPU type for use with KVM for quite some time.
> Additionally, if the KVM-enabled QEMU instance running on a seattle
> host is using the cortex-a57 CPU type, then querying 'cortex-a57' will
> work. Finally, we only implement expansion type 'full', as Arm does not
> yet have a "base" CPU type. Below are some example calls and results
> (to save character clutter they're not in json, but are still json-ish
> to give the idea)
> 
>  # expand the 'max' CPU model
>  query-cpu-model-expansion: type:full, model:{ name:max }
> 
>  return: model:{ name:max, props:{ 'aarch64': true, 'pmu': true }}
> 
>  # attempt to expand the 'max' CPU model with pmu=off
>  query-cpu-model-expansion:
>    type:full, model:{ name:max, props:{ 'pmu': false }}
> 
>  return: model:{ name:max, props:{ 'aarch64': true, 'pmu': false }}
> 
>  # attempt to expand the 'max' CPU model with aarch64=off
>  query-cpu-model-expansion:
>    type:full, model:{ name:max, props:{ 'aarch64': false }}
> 
>  error: "'aarch64' feature cannot be disabled unless KVM is enabled
>          and 32-bit EL1 is supported"
> 
> In the last example KVM was not in use so an error was returned.
> 
> Note1: It's possible for features to have dependencies on other
> features. I.e. it may be possible to change one feature at a time
> without error, but when attempting to change all features at once
> an error could occur depending on the order they are processed. It's
> also possible changing all at once doesn't generate an error, because
> a feature's dependencies are satisfied with other features, but the
> same feature cannot be changed independently without error. For these
> reasons callers should always attempt to make their desired changes
> all at once in order to ensure the collection is valid.
> 
> Note2: Certainly more features may be added to the list of
> advertised features, e.g. 'vfp' and 'neon'. The only requirement
> is that their property set accessors fail when invalid
> configurations are detected. For vfp we would need something like
> 
>  set_vfp()
>  {
>    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
>        cpu->has_vfp != cpu->has_neon)
>        error("AArch64 CPUs must have both VFP and Neon or neither")
> 
> in its set accessor, and the same for neon, rather than doing that
> check at realize time, which isn't executed at qmp query time.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qapi/target.json     |   6 +-
>  target/arm/monitor.c | 132 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/target.json b/qapi/target.json
> index 1d4d54b6002e..edfa2f82b916 100644
> --- a/qapi/target.json
> +++ b/qapi/target.json
> @@ -408,7 +408,7 @@
>  ##
>  { 'struct': 'CpuModelExpansionInfo',
>    'data': { 'model': 'CpuModelInfo' },
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
>  
>  ##
>  # @query-cpu-model-expansion:
> @@ -433,7 +433,7 @@
>  #   query-cpu-model-expansion while using these is not advised.
>  #
>  # Some architectures may not support all expansion types. s390x supports
> -# "full" and "static".
> +# "full" and "static". Arm only supports "full".
>  #
>  # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
>  #          not supported, if the model cannot be expanded, if the model contains
> @@ -447,7 +447,7 @@
>    'data': { 'type': 'CpuModelExpansionType',
>              'model': 'CpuModelInfo' },
>    'returns': 'CpuModelExpansionInfo',
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
>  
>  ##
>  # @CpuDefinitionInfo:
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 41b32b94b258..19e3120eef95 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -23,7 +23,13 @@
>  #include "qemu/osdep.h"
>  #include "hw/boards.h"
>  #include "kvm_arm.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qapi/qobject-input-visitor.h"
>  #include "qapi/qapi-commands-target.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qom/qom-qobject.h"
>  
>  static GICCapability *gic_cap_new(int version)
>  {
> @@ -82,3 +88,129 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>  
>      return head;
>  }
> +
> +static const char *cpu_model_advertised_features[] = {
> +    "aarch64", "pmu",
> +    NULL
> +};
> +
> +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> +                                                     CpuModelInfo *model,
> +                                                     Error **errp)
> +{
> +    CpuModelExpansionInfo *expansion_info;
> +    const QDict *qdict_in = NULL;
> +    QDict *qdict_out;
> +    ObjectClass *oc;
> +    Object *obj;
> +    const char *name;
> +    int i;
> +
> +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> +        error_setg(errp, "The requested expansion type is not supported.");
> +        return NULL;
> +    }
> +
> +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> +        error_setg(errp, "The CPU definition '%s' requires KVM", model->name);
> +        return NULL;
> +    }
> +
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> +    if (!oc) {
> +        error_setg(errp, "The CPU definition '%s' is unknown.", model->name);
> +        return NULL;
> +    }
> +
> +    if (kvm_enabled()) {
> +        const char *cpu_type = current_machine->cpu_type;
> +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> +        bool supported = false;
> +
> +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> +            /* These are kvmarm's recommended cpu types */
> +            supported = true;
> +        } else if (strlen(model->name) == len &&
> +                   !strncmp(model->name, cpu_type, len)) {
> +            /* KVM is enabled and we're using this type, so it works. */
> +            supported = true;
> +        }
> +        if (!supported) {
> +            error_setg(errp, "The CPU definition '%s' cannot "
use model name instead of CPU definition?
> +                             "be used with KVM on this host", model->name);

According to your commit mesg doesn't it mean that we fall into the
simplification you mentionned and not necessarily that the model name
cannot be used along with KVM?

> seattle you could use 'host' for the current type, but then attempt to
> query 'cortex-a57', which is also a valid CPU type to use with KVM on
> seattle hosts, but that query will fail with our simplifications
> +            return NULL;
> +        }
> +    }
> +
> +    if (model->props) {
> +        qdict_in = qobject_to(QDict, model->props);
> +        if (!qdict_in) {
> +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
> +            return NULL;
> +        }
> +    }
> +
> +    obj = object_new(object_class_get_name(oc));
> +
> +    if (qdict_in) {
> +        Visitor *visitor;
> +
> +        visitor = qobject_input_visitor_new(model->props);
> +        visit_start_struct(visitor, NULL, NULL, 0, errp);
> +        if (*errp) {
Normally we shouldn't do that as errp can be NULL. see /include/qapi/error.h
I see the same in cpu_model_from_info() by the way (s390x/cpu_models.c)
Maybe you can guarantee that errp isn't NULL but ...
> +            object_unref(obj);
> +            return NULL;
> +        }
> +
> +        i = 0;
> +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> +            if (qdict_get(qdict_in, name)) {
> +                object_property_set(obj, visitor, name, errp);
> +                if (*errp) {> +                    break;
I don't really get why we don't continue here instead of break. I see
that later we read the props back and populate the qdict_out object
> +                }
> +            }
> +        }
> +
> +        if (!*errp) {> +            visit_check_struct(visitor, errp);
> +        }
> +        visit_end_struct(visitor, NULL);
> +        visit_free(visitor);
> +        if (*errp) {
> +            object_unref(obj);
> +            return NULL;
> +        }
> +    }
> +
> +    expansion_info = g_new0(CpuModelExpansionInfo, 1);
> +    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
> +    expansion_info->model->name = g_strdup(model->name);
> +
> +    qdict_out = qdict_new();
> +
> +    i = 0;
> +    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> +        ObjectProperty *prop = object_property_find(obj, name, NULL);
> +        if (prop) {
> +            QObject *value;
> +
> +            assert(prop->get);
> +            value = object_property_get_qobject(obj, name, errp);
> +            assert(!*errp);
> +
> +            qdict_put_obj(qdict_out, name, value);
> +        }
> +    }
> +
> +    if (!qdict_size(qdict_out)) {
> +        qobject_unref(qdict_out);
> +    } else {
> +        expansion_info->model->props = QOBJECT(qdict_out);
> +        expansion_info->model->has_props = true;
> +    }> +
> +    object_unref(obj);
> +
> +    return expansion_info;
> +}
> 
Thanks

Eric
