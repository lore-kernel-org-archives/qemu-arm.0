Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5533391wrm;
        Tue, 15 Oct 2019 02:59:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypiwKGF3HDnB0pYifkPSopCoLoKH3jAH0JKYEdOLdZelF375RpCZ4rOsRyCy41IEV5o2Bq
X-Received: by 2002:a0c:ee49:: with SMTP id m9mr35947830qvs.118.1571133584213;
        Tue, 15 Oct 2019 02:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571133584; cv=none;
        d=google.com; s=arc-20160816;
        b=08ctwTKB5RVwiRKU/oLU4X9uCysnxEiMkYckSWBfDN7SFPbTDgDBdQcxxjuATxlVj/
         EGlLD5MKj29iAviMkSyAW/TkL2WwwJMWDFuwbJ3mb3uYjeL3UusBFBDPb9f0FHiCMSl/
         CnTxuIjx8aguEzphOaHV6PpNOmRY6PjiK7q9yiGiHKUYpsNZnL3E4k6a29vZjZbyKpcz
         mtYoFl7eJGzEGpGvJLxDJbVTiuHr/fM0KkkJIj64YmPA62gKIni3tZXVpr5QDo/knAEt
         0r7VAEWOB85FJyJmm8FClMI1JVWzV5bqCZIUDQJXqwA5CdtmXjcBl19EljXqnyLYJzN3
         Pkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfzmN6m2LYwDN7dJX6+ktjKx7wRMqYlFGgbS84wXFAY=;
        b=PlNnR6ltUDH+HNbBNWDEJO8B0lm/ijS2YA+lt+nSAX8q1NaVk7HkXlxiBvGjvuGEBO
         VnQEeT/U3QHG0oFbBry+IvMwnYTI9ND6Ugou7pIFiyZWqAucaPBLL87tNTX0OGkC5lXa
         Ynr0o8mgRktLQFrgjsN7xqUHAUCU5pmMHYx+S3c/YNRlxglj9YBNLPXiLJd0p5SOA2Vm
         uqNBCR0Ue3ZqVuCMUeLXIpZqytHvABOuCJ3qzLrsDf7fU8nEcsU2xlXdcviI2qEuNtDy
         eozbi7RSTdGbovrZjTErBJn+5s3ghjQn6h4BJVCaLXFlqKmMx7v4GvdIxmzrDEKIyU+T
         BzlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v++gQK4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 93si20951416qtc.101.2019.10.15.02.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 02:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v++gQK4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKJcF-0005Ri-JL
	for alex.bennee@linaro.org; Tue, 15 Oct 2019 05:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iKJc3-0005Qr-6a
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 05:59:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iKJc0-0006Mc-Sa
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 05:59:31 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iKJc0-0006M7-MY
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 05:59:28 -0400
Received: by mail-io1-xd42.google.com with SMTP id n26so44435943ioj.8
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2019 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gfzmN6m2LYwDN7dJX6+ktjKx7wRMqYlFGgbS84wXFAY=;
 b=v++gQK4phGImU5Wp8o7qkJ5MsQXMfcNtYWCxmyKCUcV//ZIf3cMn8AbOcylRNUc+6q
 3t4YJoVhKHxYq8N/1KH9jO8r9WeGGkBrC1r3+ky7vWYSvh2gORSQsxJqDQwKcsNgYnoz
 F7CxQt+yJ/gLAtJFKgZFM1AUjUJMWG5xDDGTH394o7dvMSfCBh/RUCxseftgDe4wRFOE
 V7DZVKBC0TDEcDPLUs2BBiOQHAEkjnmu+7Z9TI0I6fzHZpYv7wS6ceersWx0tEO4TIJ6
 eRH5Xu64x/xPQKAsfD+FqzGV+FmdHUnB4HSDiWHeSvBnfjWOvSQhoosCzBmYYSor2K9V
 OyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gfzmN6m2LYwDN7dJX6+ktjKx7wRMqYlFGgbS84wXFAY=;
 b=b16kEcXGtbGO2PDxAzo7bwHtcUT/Ao+TQXpqMnM8tu0NtnIBZ0nAPuRxS64WDOpo3s
 Trv4RzJvkq4RXDLIU8Ej7ymR2C50DoQlbYgu+ChnlOE1KmPn7oYvr0sXsNVwqXr01QUc
 Sdh7ndnXS2knhbTe/3mF6b/CJrOCrBUkY2KN0WDonhEsVlZsRpO7T2jCVf8giYa7fbtK
 ya2Tp+Jb0ImoSfVtID5FykdoccKz2xeKEctuLtN00P+sVwo+Wy1irV9hme6WNhZRg451
 98mKphGded3/yxx3An6FyN1O6F8+OC4jlCDc3mSV6jocWxyje1wyi4szZ7IX+CL2uvsc
 bOKA==
X-Gm-Message-State: APjAAAWCrI1gAja/s7R4JMtoPDKTtCWA/otXT4woRpzcZoEfwdrJLrKS
 bhTG7Yrii3h8/5lxekRXErMxEmpokuSpqHBiSwQeug==
X-Received: by 2002:a02:c90a:: with SMTP id t10mr40620023jao.89.1571133567174; 
 Tue, 15 Oct 2019 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
In-Reply-To: <20191001125845.8793-2-drjones@redhat.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 15 Oct 2019 10:59:16 +0100
Message-ID: <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 armbru@redhat.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, eblake@redhat.com, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ymQ9jRmbeZek

On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
>
> Add support for the query-cpu-model-expansion QMP command to Arm. We
> do this selectively, only exposing CPU properties which represent
> optional CPU features which the user may want to enable/disable.
> Additionally we restrict the list of queryable cpu models to 'max',
> 'host', or the current type when KVM is in use. And, finally, we only
> implement expansion type 'full', as Arm does not yet have a "base"
> CPU type. More details and example queries are described in a new
> document (docs/arm-cpu-features.rst).
>
> Note, certainly more features may be added to the list of advertised
> features, e.g. 'vfp' and 'neon'. The only requirement is that we can
> detect invalid configurations and emit failures at QMP query time.
> For 'vfp' and 'neon' this will require some refactoring to share a
> validation function between the QMP query and the CPU realize
> functions.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  docs/arm-cpu-features.rst | 137 +++++++++++++++++++++++++++++++++++
>  qapi/machine-target.json  |   6 +-
>  target/arm/monitor.c      | 145 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 285 insertions(+), 3 deletions(-)
>  create mode 100644 docs/arm-cpu-features.rst
>
> diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> new file mode 100644
> index 000000000000..c79dcffb5556
> --- /dev/null
> +++ b/docs/arm-cpu-features.rst
> @@ -0,0 +1,137 @@
> +================
> +ARM CPU Features
> +================
> +
> +Examples of probing and using ARM CPU features
> +
> +Introduction
> +============
> +
> +CPU features are optional features that a CPU of supporting type may
> +choose to implement or not.  In QEMU, optional CPU features have
> +corresponding boolean CPU proprieties that, when enabled, indicate
> +that the feature is implemented, and, conversely, when disabled,
> +indicate that it is not implemented. An example of an ARM CPU feature
> +is the Performance Monitoring Unit (PMU).  CPU types such as the
> +Cortex-A15 and the Cortex-A57, which respectively implement ARM
> +architecture reference manuals ARMv7-A and ARMv8-A, may both optionally
> +implement PMUs.  For example, if a user wants to use a Cortex-A15 without
> +a PMU, then the `-cpu` parameter should contain `pmu=off` on the QEMU
> +command line, i.e. `-cpu cortex-a15,pmu=off`.
> +
> +As not all CPU types support all optional CPU features, then whether or
> +not a CPU property exists depends on the CPU type.  For example, CPUs
> +that implement the ARMv8-A architecture reference manual may optionally
> +support the AArch32 CPU feature, which may be enabled by disabling the
> +`aarch64` CPU property.  A CPU type such as the Cortex-A15, which does
> +not implement ARMv8-A, will not have the `aarch64` CPU property.
> +
> +QEMU's support may be limited for some CPU features, only partially
> +supporting the feature or only supporting the feature under certain
> +configurations.  For example, the `aarch64` CPU feature, which, when
> +disabled, enables the optional AArch32 CPU feature, is only supported
> +when using the KVM accelerator and when running on a host CPU type that
> +supports the feature.
> +
> +CPU Feature Probing
> +===================
> +
> +Determining which CPU features are available and functional for a given
> +CPU type is possible with the `query-cpu-model-expansion` QMP command.
> +Below are some examples where `scripts/qmp/qmp-shell` (see the top comment
> +block in the script for usage) is used to issue the QMP commands.
> +
> +(1) Determine which CPU features are available for the `max` CPU type
> +    (Note, we started QEMU with qemu-system-aarch64, so `max` is
> +     implementing the ARMv8-A reference manual in this case)::
> +
> +      (QEMU) query-cpu-model-expansion type=full model={"name":"max"}
> +      { "return": {
> +        "model": { "name": "max", "props": {
> +        "pmu": true, "aarch64": true
> +      }}}}
> +
> +We see that the `max` CPU type has the `pmu` and `aarch64` CPU features.
> +We also see that the CPU features are enabled, as they are all `true`.
> +
> +(2) Let's try to disable the PMU::
> +
> +      (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"pmu":false}}
> +      { "return": {
> +        "model": { "name": "max", "props": {
> +        "pmu": false, "aarch64": true
> +      }}}}
> +
> +We see it worked, as `pmu` is now `false`.
> +
> +(3) Let's try to disable `aarch64`, which enables the AArch32 CPU feature::
> +
> +      (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"aarch64":false}}
> +      {"error": {
> +       "class": "GenericError", "desc":
> +       "'aarch64' feature cannot be disabled unless KVM is enabled and 32-bit EL1 is supported"
> +      }}
> +
> +It looks like this feature is limited to a configuration we do not
> +currently have.
> +
> +(4) Let's try probing CPU features for the Cortex-A15 CPU type::
> +
> +      (QEMU) query-cpu-model-expansion type=full model={"name":"cortex-a15"}
> +      {"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}}}}
> +
> +Only the `pmu` CPU feature is available.
> +
> +A note about CPU feature dependencies
> +-------------------------------------
> +
> +It's possible for features to have dependencies on other features. I.e.
> +it may be possible to change one feature at a time without error, but
> +when attempting to change all features at once an error could occur
> +depending on the order they are processed.  It's also possible changing
> +all at once doesn't generate an error, because a feature's dependencies
> +are satisfied with other features, but the same feature cannot be changed
> +independently without error.  For these reasons callers should always
> +attempt to make their desired changes all at once in order to ensure the
> +collection is valid.
> +
> +A note about CPU models and KVM
> +-------------------------------
> +
> +Named CPU models generally do not work with KVM.  There are a few cases
> +that do work, e.g. using the named CPU model `cortex-a57` with KVM on a
> +seattle host, but mostly if KVM is enabled the `host` CPU type must be
> +used.  This means the guest is provided all the same CPU features as the
> +host CPU type has.  And, for this reason, the `host` CPU type should
> +enable all CPU features that the host has by default.  Indeed it's even
> +a bit strange to allow disabling CPU features that the host has when using
> +the `host` CPU type, but in the absence of CPU models it's the best we can
> +do if we want to launch guests without all the host's CPU features enabled.
> +
> +Enabling KVM also affects the `query-cpu-model-expansion` QMP command.  The
> +affect is not only limited to specific features, as pointed out in example
> +(3) of "CPU Feature Probing", but also to which CPU types may be expanded.
> +When KVM is enabled, only the `max`, `host`, and current CPU type may be
> +expanded.  This restriction is necessary as it's not possible to know all
> +CPU types that may work with KVM, but it does impose a small risk of users
> +experiencing unexpected errors.  For example on a seattle, as mentioned
> +above, the `cortex-a57` CPU type is also valid when KVM is enabled.
> +Therefore a user could use the `host` CPU type for the current type, but
> +then attempt to query `cortex-a57`, however that query will fail with our
> +restrictions.  This shouldn't be an issue though as management layers and
> +users have been preferring the `host` CPU type for use with KVM for quite
> +some time.  Additionally, if the KVM-enabled QEMU instance running on a
> +seattle host is using the `cortex-a57` CPU type, then querying `cortex-a57`
> +will work.
> +
> +Using CPU Features
> +==================
> +
> +After determining which CPU features are available and supported for a
> +given CPU type, then they may be selectively enabled or disabled on the
> +QEMU command line with that CPU type::
> +
> +  $ qemu-system-aarch64 -M virt -cpu max,pmu=off
> +
> +The example above disables the PMU for the `max` CPU type.
> +
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 55310a6aa226..04623224720d 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -212,7 +212,7 @@
>  ##
>  { 'struct': 'CpuModelExpansionInfo',
>    'data': { 'model': 'CpuModelInfo' },
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
>
>  ##
>  # @query-cpu-model-expansion:
> @@ -237,7 +237,7 @@
>  #   query-cpu-model-expansion while using these is not advised.
>  #
>  # Some architectures may not support all expansion types. s390x supports
> -# "full" and "static".
> +# "full" and "static". Arm only supports "full".
>  #
>  # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
>  #          not supported, if the model cannot be expanded, if the model contains
> @@ -251,7 +251,7 @@
>    'data': { 'type': 'CpuModelExpansionType',
>              'model': 'CpuModelInfo' },
>    'returns': 'CpuModelExpansionInfo',
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
>
>  ##
>  # @CpuDefinitionInfo:
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 6457c3c87f7c..edca8aa885f0 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -21,8 +21,16 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "hw/boards.h"
>  #include "kvm_arm.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qapi-commands-machine-target.h"
>  #include "qapi/qapi-commands-misc-target.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qom/qom-qobject.h"
>
>  static GICCapability *gic_cap_new(int version)
>  {
> @@ -81,3 +89,140 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>
>      return head;
>  }
> +
> +/*
> + * These are cpu model features we want to advertise. The order here
> + * matters as this is the order in which qmp_query_cpu_model_expansion
> + * will attempt to set them. If there are dependencies between features,
> + * then the order that considers those dependencies must be used.
> + */
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
> +        error_setg(errp, "The requested expansion type is not supported");
> +        return NULL;
> +    }
> +
> +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> +        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> +        return NULL;
> +    }
> +
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> +    if (!oc) {
> +        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> +                   model->name);
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
> +            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> +                             "with KVM on this host", model->name);
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
> +        Error *err = NULL;
> +
> +        visitor = qobject_input_visitor_new(model->props);
> +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> +        if (err) {
> +            object_unref(obj);

Shouldn't we free the 'visitor' here as well ?

> +            error_propagate(errp, err);
> +            return NULL;
> +        }
> +
> +        i = 0;
> +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> +            if (qdict_get(qdict_in, name)) {
> +                object_property_set(obj, visitor, name, &err);
> +                if (err) {
> +                    break;
> +                }
> +            }
> +        }
> +
> +        if (!err) {
> +            visit_check_struct(visitor, &err);
> +        }
> +        visit_end_struct(visitor, NULL);
> +        visit_free(visitor);
> +        if (err) {
> +            object_unref(obj);
> +            error_propagate(errp, err);
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
> +            Error *err = NULL;
> +            QObject *value;
> +
> +            assert(prop->get);
> +            value = object_property_get_qobject(obj, name, &err);
> +            assert(!err);
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
> +    }
> +
> +    object_unref(obj);
> +
> +    return expansion_info;
> +}
> --
> 2.20.1
>
>
