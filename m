Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7360365wrm;
        Wed, 16 Oct 2019 09:16:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRVXnUPXJOgeepSBhWlT2JtpV3P2zCJw5r975i8JL9EF70zXdgowtvbq1t6efOM/e9gWCt
X-Received: by 2002:aa7:d04b:: with SMTP id n11mr40484205edo.104.1571242618063;
        Wed, 16 Oct 2019 09:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571242618; cv=none;
        d=google.com; s=arc-20160816;
        b=QXLndJX/qxE1HyQHmjdUVbf4qgo/Vy3wBmdS6udM2yA7KLfeao1tEzMZGCrKzfQqFL
         P1uvAsiiB7Q1FBLy1Hp2SYoTg4luOg8oZl2L4tm7tGvPUA+c84yAjQcRF/23MmXWTt4Q
         h6UOwNHd9CyUsf3e3sFTYRqIX2Kmsz6y75AZEcLokiH8C1MwAot9HEpz6pkqKZpan6Rq
         CFOqO68ZH6mYJ+VxxJSERaVxXXBhi5LRVWHR6M5vuxzf8jUPfvj3ngrHiSPFEZpVeDvi
         LXRxrFmbLyPgMK9zx1PvBiQO4J0RZ2MNM9dIIYAhcnip/vt6Fb/PVAZ97QcnWOvp7uX3
         UJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=C9Bq9n6IXw1qW0rWk21AkacfV0EbP6UlHGzVzeINO8g=;
        b=J5rtmPb89TUe6l2cI+bqH0yvktV2zZn0lZHqHoJE+7KC/ynOa0uwBjN8Xfvl9E4NIH
         h6WqX7v9yg/3bpAlbv93nYMU7YlAN9GDJn1qKUofHwsCGUxa6LUuiFQUE6j1uk0XFp8q
         9FEFl59DLwqdDiaXPd7e08rxbe2dF453g2qHLtW+vXZLct7wR7ICkWb+3+0xb/cX2fcf
         3GWfG+xGVibEzM/9Ll4s5g7Xrb2nAyjCDZ2svbUWLeINQ6ovBY6g+RkLkyV+b676lQwa
         txhHL+xW1f45WpFtW4nRB25JgzJPeeMVfmayZZ/pzC6G6RvZTEG1osvTAE83dKSOFSn2
         7Xew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si15169245edw.51.2019.10.16.09.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 09:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKlyq-0007aO-Vv
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 12:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKlyi-0007Zk-RV
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 12:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKlyd-0007aj-MO
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 12:16:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKlyb-0007X1-UA; Wed, 16 Oct 2019 12:16:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8720010CC1FF;
 Wed, 16 Oct 2019 16:16:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191BD5D9CD;
 Wed, 16 Oct 2019 16:16:30 +0000 (UTC)
Date: Wed, 16 Oct 2019 18:16:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20191016161628.rf752xuu6fzkihun@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
 <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
 <20191015105628.7ln6ph5s3vpsyfuw@kamzik.brq.redhat.com>
 <CADSWDzsKx7+4mR4pmsqi0+rddUv47q=UKwVt509B8g68UoRiMA@mail.gmail.com>
 <CADSWDzs9sdjE+-1AedPnU6o7U5XjTk=dcHf-BXQXQQkrp2O=Bw@mail.gmail.com>
 <20191016135025.k4szpqwgkhfnd6dl@kamzik.brq.redhat.com>
 <CADSWDzuXpTHDtRmTL41CXbk9GmDHO5iEgpiRgnD=buQU+nnXcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDzuXpTHDtRmTL41CXbk9GmDHO5iEgpiRgnD=buQU+nnXcg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Wed, 16 Oct 2019 16:16:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 imammedo@redhat.com, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GYHdagUMfwCq

On Wed, Oct 16, 2019 at 04:16:57PM +0100, Beata Michalska wrote:
> On Wed, 16 Oct 2019 at 14:50, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Wed, Oct 16, 2019 at 02:24:50PM +0100, Beata Michalska wrote:
> > > On Tue, 15 Oct 2019 at 12:56, Beata Michalska
> > > <beata.michalska@linaro.org> wrote:
> > > >
> > > > On Tue, 15 Oct 2019 at 11:56, Andrew Jones <drjones@redhat.com> wrote:
> > > > >
> > > > > On Tue, Oct 15, 2019 at 10:59:16AM +0100, Beata Michalska wrote:
> > > > > > On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
> > > > > > > +
> > > > > > > +    obj = object_new(object_class_get_name(oc));
> > > > > > > +
> > > > > > > +    if (qdict_in) {
> > > > > > > +        Visitor *visitor;
> > > > > > > +        Error *err = NULL;
> > > > > > > +
> > > > > > > +        visitor = qobject_input_visitor_new(model->props);
> > > > > > > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > > > > > > +        if (err) {
> > > > > > > +            object_unref(obj);
> > > > > >
> > > > > > Shouldn't we free the 'visitor' here as well ?
> > > > >
> > > > > Yes. Good catch. So we also need to fix
> > > > > target/s390x/cpu_models.c:cpu_model_from_info(), which has the same
> > > > > construction (the construction from which I derived this)
> > > > >
> > > > > >
> > > > > > > +            error_propagate(errp, err);
> > > > > > > +            return NULL;
> > > > > > > +        }
> > > > > > > +
> > > > >
> > > > > What about the rest of the patch? With that fixed for v6 can I
> > > > > add your r-b?
> > > > >
> > > >
> > > > I still got this feeling that we could optimize that a bit - which I'm
> > > > currently on, so hopefully I'll be able to add more comments soon if
> > > > that proves to be the case.
> > > >
> > > > BR
> > > > Beata
> > >
> > > I think there are few options that might be considered though the gain
> > > is not huge .. but it's always smth:
> > >
> > > > +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> > > > +                                                     CpuModelInfo *model,
> > > > +                                                     Error **errp)
> > > > +{
> > > > +    CpuModelExpansionInfo *expansion_info;
> > > > +    const QDict *qdict_in = NULL;
> > > > +    QDict *qdict_out;
> > > > +    ObjectClass *oc;
> > > > +    Object *obj;
> > > > +    const char *name;
> > > > +    int i;
> > > > +
> > > > +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> > > > +        error_setg(errp, "The requested expansion type is not supported");
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> > > > +        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> > > > +    if (!oc) {
> > > > +        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> > > > +                   model->name);
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    if (kvm_enabled()) {
> > > > +        const char *cpu_type = current_machine->cpu_type;
> > > > +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> > > > +        bool supported = false;
> > > > +
> > > > +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> > > > +            /* These are kvmarm's recommended cpu types */
> > > > +            supported = true;
> > > > +        } else if (strlen(model->name) == len &&
> > > > +                   !strncmp(model->name, cpu_type, len)) {
> > > > +            /* KVM is enabled and we're using this type, so it works. */
> > > > +            supported = true;
> > > > +        }
> > > > +        if (!supported) {
> > > > +            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> > > > +                             "with KVM on this host", model->name);
> > > > +            return NULL;
> > > > +        }
> > > > +    }
> > > > +
> > >
> > > The above section can be slightly reduced and rearranged - preferably
> > > moved to a separate function
> > > -> get_cpu_model (...) ?
> > >
> > > * You can check the 'host' model first and then validate the accelerator ->
> > >     if ( !strcmp(model->name, "host")
> > >         if (!kvm_enabled())
> > >             log_error & leave
> > >        else
> > >           goto cpu_class_by_name /*cpu_class_by_name moved after the
> > > final model check @see below */
> > >
> > > * the kvm_enabled section can be than slightly improved (dropping the
> > > second compare against 'host')
> > >
> > >       if (kvm_enabled() && strcmp(model->name, "max") {
> > >            /*Validate the current_machine->cpu_type against the
> > > model->name and report error case mismatch
> > >           /* otherwise just fall through */
> > >       }
> > >  * cpu_class_by_name moved here ...
> > > > +    if (model->props) {
> > > MInor: the CPUModelInfo seems to have dedicated field for that
> > > verification -> has_props
> > >
> > > > +        qdict_in = qobject_to(QDict, model->props);
> > > > +        if (!qdict_in) {
> > > > +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
> > > > +            return NULL;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    obj = object_new(object_class_get_name(oc));
> > > > +
> > > > +    if (qdict_in) {
> > > > +        Visitor *visitor;
> > > > +        Error *err = NULL;
> > > > +
> > > > +        visitor = qobject_input_visitor_new(model->props);
> > > > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > > > +        if (err) {
> > > > +            object_unref(obj);
> > > > +            error_propagate(errp, err);
> > > > +            return NULL;
> > > > +        }
> > > > +
> > > > +        i = 0;
> > > > +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > > > +            if (qdict_get(qdict_in, name)) {
> > > > +                object_property_set(obj, visitor, name, &err);
> > > > +                if (err) {
> > > > +                    break;
> > > > +                }
> > > > +            }
> > > > +        }
> > > > +
> > > > +        if (!err) {
> > > > +            visit_check_struct(visitor, &err);
> > > > +        }
> > > > +        visit_end_struct(visitor, NULL);
> > > > +        visit_free(visitor);
> > > > +        if (err) {
> > > > +            object_unref(obj);
> > > > +            error_propagate(errp, err);
> > > > +            return NULL;
> > > > +        }
> > > > +    }
> > >
> > > The both >> if (err) << blocks could be extracted and moved at the end
> > > of the function
> > > to mark a 'cleanup section'  and both here and few lines before
> > > (with the visit_start_struct failure) could use goto.
> > > Easier to maintain and to make sure we make the proper cleanup in any case.
> > >
> > > > +
> > > > +    expansion_info = g_new0(CpuModelExpansionInfo, 1);
> > > > +    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
> > > > +    expansion_info->model->name = g_strdup(model->name);
> > > > +
> > > > +    qdict_out = qdict_new();
> > > > +
> > > > +    i = 0;
> > > > +    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > > > +        ObjectProperty *prop = object_property_find(obj, name, NULL);
> > > > +        if (prop) {
> > > > +            Error *err = NULL;
> > > > +            QObject *value;
> > > > +
> > > > +            assert(prop->get);
> > > > +            value = object_property_get_qobject(obj, name, &err);
> > > > +            assert(!err);
> > > > +
> > > > +            qdict_put_obj(qdict_out, name, value);
> > > > +        }
> > > > +    }
> > > > +
> > >
> > > This could be merged with the first iteration over the features,
> > > smth like:
> > >
> > >     while () {
> > >         if ((value = qdict_get(qdict_in, name))) {
> > >             object_property_set ...
> > >            if (!err)
> > >                qobject_ref(value) /* we have the weak reference */
> > >             else
> > >                 break;
> > >         } else {
> > >              value = object_property_get_qobject()
> > >         }
> > >         if (value) qdict_put_object(qdict_out, name, value)
> > >     }
> > >
> > > This way you iterate over the table once and you do not query
> > > for the same property twice by getting the value from the qdict_in.
> > > If the value is not acceptable we will fail either way so should be all good.
> > >
> > >
> > > > +    if (!qdict_size(qdict_out)) {
> > > > +        qobject_unref(qdict_out);
> > > > +    } else {
> > > > +        expansion_info->model->props = QOBJECT(qdict_out);
> > > > +        expansion_info->model->has_props = true;
> > > > +    }
> > > > +
> > > > +    object_unref(obj);
> > > > +
> > > > +    return expansion_info;
> > >
> > > Mentioned earlier cleanup section:
> > > cleanup:
> > >    object_unref(obj);
> > >    qobject_unref(qdict_out) ; /* if single loop is used */
> > >    error_propagate(errp,err);
> > >    return NULL;
> > >
> > > > +}
> > > > --
> > > > 2.20.1
> > > >
> > >
> > > Hope I haven't missed anything.
> > > What do you think ?
> > >
> >
> > I think you need to post an entire function that incorporates all the
> > proposed changes, or at least a diff that I can apply in order to get
> > the entirely changed function. I also think that it's fine the way
> > it is, so it would take a justification stronger than a potential
> > micro optimization to get me to change it.
> >
> 
> The numbers I can pull out of it are not thrilling and this is not
> on a fast path so I will not be pushing for changes.
> Though extracting the clean-up might be worth considering -
> for improved maintenance.
> 
> For a reference though:

It doesn't apply for me - even after fixing up the damager your mailer did
to it. I'd be surprised if it worked though. Merging the two loops over
features makes the output generation depend on the caller providing input.
Did you try the arm-cpu-features test with these changes?

drew

> 
> _______________________________________________________
> 
> ---
>  target/arm/monitor.c | 100 +++++++++++++++++++++++++--------------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index edca8aa..0d6bd42 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -112,17 +112,40 @@ CpuModelExpansionInfo
> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>      Object *obj;
>      const char *name;
>      int i;
> +    Error *err = NULL;
> 
>      if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
>          error_setg(errp, "The requested expansion type is not supported");
>          return NULL;
>      }
> 
> -    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> -        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> -        return NULL;
> +    /* CPU type => 'host' */
> +    if (!strcmp(model->name, "host")) {
> +        if (!kvm_enabled()) {
> +            error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> +            return NULL;
> +        } else {
> +            goto valid;
> +        }
> +    }
> +
> +
> +    /* Case when KVM is enabled and the model is a specific cpu model ... */
> +    if (kvm_enabled() && strcmp(model->name, "max")) {
> +            const char *cpu_type = current_machine->cpu_type;
> +            int len = strlen(cpu_type) - strlen("-" TYPE_ARM_CPU);
> +
> +            if (strlen(model->name) == len
> +             && !strncmp(cpu_type, model->name, len)) {
> +                error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> +                        "with KVM on this host", model->name);
> +                return NULL;
> +            }
> +
>      }
> 
> +valid:
> +
>      oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
>      if (!oc) {
>          error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> @@ -130,25 +153,6 @@ CpuModelExpansionInfo
> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>          return NULL;
>      }
> 
> -    if (kvm_enabled()) {
> -        const char *cpu_type = current_machine->cpu_type;
> -        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> -        bool supported = false;
> -
> -        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> -            /* These are kvmarm's recommended cpu types */
> -            supported = true;
> -        } else if (strlen(model->name) == len &&
> -                   !strncmp(model->name, cpu_type, len)) {
> -            /* KVM is enabled and we're using this type, so it works. */
> -            supported = true;
> -        }
> -        if (!supported) {
> -            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> -                             "with KVM on this host", model->name);
> -            return NULL;
> -        }
> -    }
> 
>      if (model->props) {
>          qdict_in = qobject_to(QDict, model->props);
> @@ -159,62 +163,52 @@ CpuModelExpansionInfo
> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>      }
> 
>      obj = object_new(object_class_get_name(oc));
> +    qdict_out = qdict_new();
> 
>      if (qdict_in) {
>          Visitor *visitor;
> -        Error *err = NULL;
> +        QObject *value;
> 
>          visitor = qobject_input_visitor_new(model->props);
>          visit_start_struct(visitor, NULL, NULL, 0, &err);
>          if (err) {
> -            object_unref(obj);
> -            error_propagate(errp, err);
> -            return NULL;
> +            visit_free(visitor);
> +            goto cleanup;
>          }
> -
>          i = 0;
>          while ((name = cpu_model_advertised_features[i++]) != NULL) {
> -            if (qdict_get(qdict_in, name)) {
> +            value = qdict_get(qdict_in, name);
> +            if (value) {
>                  object_property_set(obj, visitor, name, &err);
> -                if (err) {
> +                if (!err) {
> +                    qobject_ref(value);
> +                } else {
>                      break;
>                  }
> +
> +            } else {
> +               value = object_property_get_qobject(obj, name, &err);
>              }
> -        }
> 
> +            if (value) {
> +                qdict_put_obj(qdict_out, name, value);
> +            }
> +        }
>          if (!err) {
>              visit_check_struct(visitor, &err);
>          }
>          visit_end_struct(visitor, NULL);
>          visit_free(visitor);
>          if (err) {
> -            object_unref(obj);
> -            error_propagate(errp, err);
> -            return NULL;
> +            goto cleanup;
>          }
> +
>      }
> 
>      expansion_info = g_new0(CpuModelExpansionInfo, 1);
>      expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
>      expansion_info->model->name = g_strdup(model->name);
> 
> -    qdict_out = qdict_new();
> -
> -    i = 0;
> -    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> -        ObjectProperty *prop = object_property_find(obj, name, NULL);
> -        if (prop) {
> -            Error *err = NULL;
> -            QObject *value;
> -
> -            assert(prop->get);
> -            value = object_property_get_qobject(obj, name, &err);
> -            assert(!err);
> -
> -            qdict_put_obj(qdict_out, name, value);
> -        }
> -    }
> -
>      if (!qdict_size(qdict_out)) {
>          qobject_unref(qdict_out);
>      } else {
> @@ -225,4 +219,10 @@ CpuModelExpansionInfo
> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>      object_unref(obj);
> 
>      return expansion_info;
> +
> +cleanup:
> +    object_unref(obj);
> +    qobject_unref(qdict_out);
> +    error_propagate(errp, err);
> +    return NULL;
>  }
> -- 
> 2.7.4
> 
> BR
> Beata
> 
> > Thanks,
> > drew
> 
