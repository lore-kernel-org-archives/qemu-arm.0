Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp7234338pjl;
        Wed, 16 Oct 2019 06:50:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkHJVNwdvYqWSxRs2zibS6Tu0akhvTrS8LESFWCCr1mi0UBm+aM6cU7m3/6dyGMwi9sDDs
X-Received: by 2002:a17:906:c443:: with SMTP id ck3mr40820482ejb.0.1571233850219;
        Wed, 16 Oct 2019 06:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571233850; cv=none;
        d=google.com; s=arc-20160816;
        b=xMeOtn7uxrRuHVknvW11YLWhdHdoK0wMu0Otjtw1XBbu8fwnwCePhTwUrUBGEHGmD+
         jtYn3MlkWubA/JwgTpsPEr74wVBqiKIjiqGpAwLsM26I3HN8zwD/JAmfCJY0WCdQlnXH
         hvxIn6gsEaeZXNtbO2fEl6TpU+u6Sih0dMaIeuejbNMJGp8NR8vykmyGw0pRo8siZaiY
         Ng5kk1fAnO1USaHijtl+iYVxHA0V6VIMv64HUB1iJSOMyHRs4GyNukw0ly0x/5iZ7wLp
         yO9TCSOv5nVbiH/pKN5nBdMb+fkQopMVFpaQxe3jaAOjAryD086yQwORQYwUoxoOFQxG
         IW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=Kj54x42pEaXAekp+vM9KYUxZDdYO0rchs+rl2IW5v8k=;
        b=e5+EKZQIwrN4qs6nskzW+CjN/5/PxQnVsHo5LTH5KC8kfhTjARs+hnh0pQBUt6G+ws
         b4kS+hxnGfO08zbKExvliqYD+1QcKzLfbH5HSYOHReQoIxbkLQeN7HCIH3sdUNaV4z3L
         z8uX61k8nuqh8P2HIEKNmh3e7dybsFKU8GpSkQEjFRm/oS8LAhvCKYk2v1uyjAYdevOS
         /E//zr6ddYuJEihpvbctEwKHFSgiUw8UiK41HZcGUVq+jpd+dFDlGYJBgNWRw/DxeuQ+
         W2yEbjhSBgW79fUf2SCubqUO+oOHSBlmWnl5YeDo/NoFyD6s33SACBMZkXXi4tlT7anC
         Qujw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si15209351ejp.103.2019.10.16.06.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 06:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKjhR-00050W-3M
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 09:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKjhJ-0004zF-C2
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 09:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKjhH-0004to-6J
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 09:50:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKjhG-0004t7-T6; Wed, 16 Oct 2019 09:50:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50F5EA3CD91;
 Wed, 16 Oct 2019 13:50:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 829AE60166;
 Wed, 16 Oct 2019 13:50:27 +0000 (UTC)
Date: Wed, 16 Oct 2019 15:50:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20191016135025.k4szpqwgkhfnd6dl@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
 <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
 <20191015105628.7ln6ph5s3vpsyfuw@kamzik.brq.redhat.com>
 <CADSWDzsKx7+4mR4pmsqi0+rddUv47q=UKwVt509B8g68UoRiMA@mail.gmail.com>
 <CADSWDzs9sdjE+-1AedPnU6o7U5XjTk=dcHf-BXQXQQkrp2O=Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDzs9sdjE+-1AedPnU6o7U5XjTk=dcHf-BXQXQQkrp2O=Bw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 16 Oct 2019 13:50:37 +0000 (UTC)
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
X-TUID: eXf9tzfDMupH

On Wed, Oct 16, 2019 at 02:24:50PM +0100, Beata Michalska wrote:
> On Tue, 15 Oct 2019 at 12:56, Beata Michalska
> <beata.michalska@linaro.org> wrote:
> >
> > On Tue, 15 Oct 2019 at 11:56, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Tue, Oct 15, 2019 at 10:59:16AM +0100, Beata Michalska wrote:
> > > > On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
> > > > > +
> > > > > +    obj = object_new(object_class_get_name(oc));
> > > > > +
> > > > > +    if (qdict_in) {
> > > > > +        Visitor *visitor;
> > > > > +        Error *err = NULL;
> > > > > +
> > > > > +        visitor = qobject_input_visitor_new(model->props);
> > > > > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > > > > +        if (err) {
> > > > > +            object_unref(obj);
> > > >
> > > > Shouldn't we free the 'visitor' here as well ?
> > >
> > > Yes. Good catch. So we also need to fix
> > > target/s390x/cpu_models.c:cpu_model_from_info(), which has the same
> > > construction (the construction from which I derived this)
> > >
> > > >
> > > > > +            error_propagate(errp, err);
> > > > > +            return NULL;
> > > > > +        }
> > > > > +
> > >
> > > What about the rest of the patch? With that fixed for v6 can I
> > > add your r-b?
> > >
> >
> > I still got this feeling that we could optimize that a bit - which I'm
> > currently on, so hopefully I'll be able to add more comments soon if
> > that proves to be the case.
> >
> > BR
> > Beata
> 
> I think there are few options that might be considered though the gain
> is not huge .. but it's always smth:
> 
> > +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> > +                                                     CpuModelInfo *model,
> > +                                                     Error **errp)
> > +{
> > +    CpuModelExpansionInfo *expansion_info;
> > +    const QDict *qdict_in = NULL;
> > +    QDict *qdict_out;
> > +    ObjectClass *oc;
> > +    Object *obj;
> > +    const char *name;
> > +    int i;
> > +
> > +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> > +        error_setg(errp, "The requested expansion type is not supported");
> > +        return NULL;
> > +    }
> > +
> > +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> > +        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> > +        return NULL;
> > +    }
> > +
> > +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> > +    if (!oc) {
> > +        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> > +                   model->name);
> > +        return NULL;
> > +    }
> > +
> > +    if (kvm_enabled()) {
> > +        const char *cpu_type = current_machine->cpu_type;
> > +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> > +        bool supported = false;
> > +
> > +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> > +            /* These are kvmarm's recommended cpu types */
> > +            supported = true;
> > +        } else if (strlen(model->name) == len &&
> > +                   !strncmp(model->name, cpu_type, len)) {
> > +            /* KVM is enabled and we're using this type, so it works. */
> > +            supported = true;
> > +        }
> > +        if (!supported) {
> > +            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> > +                             "with KVM on this host", model->name);
> > +            return NULL;
> > +        }
> > +    }
> > +
> 
> The above section can be slightly reduced and rearranged - preferably
> moved to a separate function
> -> get_cpu_model (...) ?
> 
> * You can check the 'host' model first and then validate the accelerator ->
>     if ( !strcmp(model->name, "host")
>         if (!kvm_enabled())
>             log_error & leave
>        else
>           goto cpu_class_by_name /*cpu_class_by_name moved after the
> final model check @see below */
> 
> * the kvm_enabled section can be than slightly improved (dropping the
> second compare against 'host')
> 
>       if (kvm_enabled() && strcmp(model->name, "max") {
>            /*Validate the current_machine->cpu_type against the
> model->name and report error case mismatch
>           /* otherwise just fall through */
>       }
>  * cpu_class_by_name moved here ...
> > +    if (model->props) {
> MInor: the CPUModelInfo seems to have dedicated field for that
> verification -> has_props
> 
> > +        qdict_in = qobject_to(QDict, model->props);
> > +        if (!qdict_in) {
> > +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
> > +            return NULL;
> > +        }
> > +    }
> > +
> > +    obj = object_new(object_class_get_name(oc));
> > +
> > +    if (qdict_in) {
> > +        Visitor *visitor;
> > +        Error *err = NULL;
> > +
> > +        visitor = qobject_input_visitor_new(model->props);
> > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > +        if (err) {
> > +            object_unref(obj);
> > +            error_propagate(errp, err);
> > +            return NULL;
> > +        }
> > +
> > +        i = 0;
> > +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > +            if (qdict_get(qdict_in, name)) {
> > +                object_property_set(obj, visitor, name, &err);
> > +                if (err) {
> > +                    break;
> > +                }
> > +            }
> > +        }
> > +
> > +        if (!err) {
> > +            visit_check_struct(visitor, &err);
> > +        }
> > +        visit_end_struct(visitor, NULL);
> > +        visit_free(visitor);
> > +        if (err) {
> > +            object_unref(obj);
> > +            error_propagate(errp, err);
> > +            return NULL;
> > +        }
> > +    }
> 
> The both >> if (err) << blocks could be extracted and moved at the end
> of the function
> to mark a 'cleanup section'  and both here and few lines before
> (with the visit_start_struct failure) could use goto.
> Easier to maintain and to make sure we make the proper cleanup in any case.
> 
> > +
> > +    expansion_info = g_new0(CpuModelExpansionInfo, 1);
> > +    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
> > +    expansion_info->model->name = g_strdup(model->name);
> > +
> > +    qdict_out = qdict_new();
> > +
> > +    i = 0;
> > +    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > +        ObjectProperty *prop = object_property_find(obj, name, NULL);
> > +        if (prop) {
> > +            Error *err = NULL;
> > +            QObject *value;
> > +
> > +            assert(prop->get);
> > +            value = object_property_get_qobject(obj, name, &err);
> > +            assert(!err);
> > +
> > +            qdict_put_obj(qdict_out, name, value);
> > +        }
> > +    }
> > +
> 
> This could be merged with the first iteration over the features,
> smth like:
> 
>     while () {
>         if ((value = qdict_get(qdict_in, name))) {
>             object_property_set ...
>            if (!err)
>                qobject_ref(value) /* we have the weak reference */
>             else
>                 break;
>         } else {
>              value = object_property_get_qobject()
>         }
>         if (value) qdict_put_object(qdict_out, name, value)
>     }
> 
> This way you iterate over the table once and you do not query
> for the same property twice by getting the value from the qdict_in.
> If the value is not acceptable we will fail either way so should be all good.
> 
> 
> > +    if (!qdict_size(qdict_out)) {
> > +        qobject_unref(qdict_out);
> > +    } else {
> > +        expansion_info->model->props = QOBJECT(qdict_out);
> > +        expansion_info->model->has_props = true;
> > +    }
> > +
> > +    object_unref(obj);
> > +
> > +    return expansion_info;
> 
> Mentioned earlier cleanup section:
> cleanup:
>    object_unref(obj);
>    qobject_unref(qdict_out) ; /* if single loop is used */
>    error_propagate(errp,err);
>    return NULL;
> 
> > +}
> > --
> > 2.20.1
> >
> 
> Hope I haven't missed anything.
> What do you think ?
>

I think you need to post an entire function that incorporates all the
proposed changes, or at least a diff that I can apply in order to get
the entirely changed function. I also think that it's fine the way
it is, so it would take a justification stronger than a potential
micro optimization to get me to change it.

Thanks,
drew
