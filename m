Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9429385wrv;
        Wed, 24 Jul 2019 07:44:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvdjsh1QlX/O36mDwNAFaSXTXhcyjVn5iw9F7yjoSlJ1YNWuu6mLVShEXGLT11K7G3XiMV
X-Received: by 2002:ac8:f4b:: with SMTP id l11mr56101140qtk.215.1563979476231;
        Wed, 24 Jul 2019 07:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563979476; cv=none;
        d=google.com; s=arc-20160816;
        b=a8QGtpEQ03100nvtty/VnuPwzqArz78MWYkVxP0S3fvi8itgIliXwq/+FJ9OYB9VCV
         xs/mYErCa92OIn1Cw+K35WqvbhZiJ9FxmLrXnigx2xBtxrnrWQVyUrWFWwFKPHPl7Wd9
         UqVI1qZmbIaz7DXXHtLcfIFMRTK4WR0hWtwXArDXclLPVzneJaSWTyBgTAXGARY0PaRz
         v/peK0mLbzA6CPGTg8aW2JCO21YYKadZ6WcCVGB1LNGw+nN+fac1MeJyCLsM+9+PN5Q8
         XXSKGgpR1YLhJOOW6pudLksfFn9tYJTUIKl8NBjAgcXrQguOOypKIx6naqMGM1m6RHEF
         pKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=sDR22u/vzvdKMM0Nq6wWbtFLSiMDFg2smNkxFVyq1X8=;
        b=m01/ti44+zj2+8sCPhgEeojZnVLn3wx10G0hg72xInaNZ6dO8F0LEntSM74d4DR6Dt
         6pY3+1SE/uFvo4IADuZbJ5QCLRO5OHkMKb669rfKLpPT54j1tTFahi85DqjE7pTi+a6z
         fhnrNG32DH2djq7HHy9wMb8T34r5YA+VmhyYD5bh26y2DN/BYHrmHMYaZFO2ByFN80Md
         YEWvzmhnLsy8MOPcTUMKDDaSDID71+mtiLN60ZNJ0QI4OVRqXsA7+VRNJW6FawshDKT7
         ym2ZZmF2YfathWv6ScYkhG5Didq3mQSPkPr4bO53gUdYtkwdFOAHatWDoxAfra2LeQEy
         lB+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z7si10192447qkb.134.2019.07.24.07.44.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 07:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 510C230A695C;
	Wed, 24 Jul 2019 14:44:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81BFF61F21;
	Wed, 24 Jul 2019 14:44:30 +0000 (UTC)
Date: Wed, 24 Jul 2019 16:44:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 03/14] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20190724144428.plozynk3t5mdahvx@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-4-drjones@redhat.com>
 <fec0d7af-a25f-2395-64df-79f2de9579d9@redhat.com>
 <20190626132627.oh2d3qteemgqb6u2@kamzik.brq.redhat.com>
 <848513be-d5c1-7eda-cfc8-bd9836c2ed1d@redhat.com>
 <20190724140502.3ipk2ekr4nyyop2z@kamzik.brq.redhat.com>
 <af580f76-7542-d5a4-7c8f-f75d441ee8e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af580f76-7542-d5a4-7c8f-f75d441ee8e3@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 24 Jul 2019 14:44:35 +0000 (UTC)
X-TUID: kd9yqqXWlu9t

On Wed, Jul 24, 2019 at 04:25:32PM +0200, Auger Eric wrote:
> >>>>> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> >>>>> index 41b32b94b258..19e3120eef95 100644
> >>>>> --- a/target/arm/monitor.c
> >>>>> +++ b/target/arm/monitor.c
> >>>>> @@ -23,7 +23,13 @@
> >>>>>  #include "qemu/osdep.h"
> >>>>>  #include "hw/boards.h"
> >>>>>  #include "kvm_arm.h"
> >>>>> +#include "qapi/error.h"
> >>>>> +#include "qapi/visitor.h"
> >>>>> +#include "qapi/qobject-input-visitor.h"
> >>>>>  #include "qapi/qapi-commands-target.h"
> >>>>> +#include "qapi/qmp/qerror.h"
> >>>>> +#include "qapi/qmp/qdict.h"
> >>>>> +#include "qom/qom-qobject.h"
> >>>>>  
> >>>>>  static GICCapability *gic_cap_new(int version)
> >>>>>  {
> >>>>> @@ -82,3 +88,129 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> >>>>>  
> >>>>>      return head;
> >>>>>  }
> >>>>> +
> >>>>> +static const char *cpu_model_advertised_features[] = {
> >>>>> +    "aarch64", "pmu",
> >>>>> +    NULL
> >>>>> +};
> >>>>> +
> >>>>> +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> >>>>> +                                                     CpuModelInfo *model,
> >>>>> +                                                     Error **errp)
> >>>>> +{
> >>>>> +    CpuModelExpansionInfo *expansion_info;
> >>>>> +    const QDict *qdict_in = NULL;
> >>>>> +    QDict *qdict_out;
> >>>>> +    ObjectClass *oc;
> >>>>> +    Object *obj;
> >>>>> +    const char *name;
> >>>>> +    int i;
> >>>>> +
> >>>>> +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> >>>>> +        error_setg(errp, "The requested expansion type is not supported.");
> >>>>> +        return NULL;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> >>>>> +        error_setg(errp, "The CPU definition '%s' requires KVM", model->name);
> >>>>> +        return NULL;
> >>>>> +    }
> >>>>> +
> >>>>> +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> >>>>> +    if (!oc) {
> >>>>> +        error_setg(errp, "The CPU definition '%s' is unknown.", model->name);
> >>>>> +        return NULL;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (kvm_enabled()) {
> >>>>> +        const char *cpu_type = current_machine->cpu_type;
> >>>>> +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> >>>>> +        bool supported = false;
> >>>>> +
> >>>>> +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> >>>>> +            /* These are kvmarm's recommended cpu types */
> >>>>> +            supported = true;
> >>>>> +        } else if (strlen(model->name) == len &&
> >>>>> +                   !strncmp(model->name, cpu_type, len)) {
> >>>>> +            /* KVM is enabled and we're using this type, so it works. */
> >>>>> +            supported = true;
> >>>>> +        }
> >>>>> +        if (!supported) {
> >>>>> +            error_setg(errp, "The CPU definition '%s' cannot "
> >>>> use model name instead of CPU definition?
> >>>
> >>> I took that wording from s390x, but maybe I prefer "The CPU type..."
> >>> better. I'll change it for v3.>> This CPU type is not recognized as an ARM CPU type?
> > 
> > That's not what this error message is stating. The CPU type may well be an
> > ARM CPU type, but it's not one you can expect to use with KVM enabled. I
> > currently have
> > 
> >   "The CPU type '%s' cannot "
> >   "be used with KVM on this host", model->name)
> > 
> > queued up for v3.
> 
> decidedly, I meant the error message associated to:
> 
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> +    if (!oc) {
> +        error_setg(errp, "The CPU definition '%s' is unknown.",
> model->name);
> +        return NULL;
> +    }

Ah, OK. Yeah I can change that one too. Of course if we deviate from
s390x's generic error messages for common errors, then we're assuming
the messages aren't being parsed by upper layers using code that we'd
like to easily adopt to ARM. But, I think that assumption is reasonable.

> 
> Why am I always looking at your series when we suffer heat wave?
>

Climate change generates too many heat waves. Or I generate too much
code that requires comments. Or both.

Thanks,
drew
