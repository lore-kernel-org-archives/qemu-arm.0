Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4700363wrm;
        Mon, 21 Oct 2019 08:07:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfssbo9/tAuXchLMikDeWlkSE8v22dCSX4r036bR6sQgOZjOkO/qoCcsTiUT+kqElz9Jve
X-Received: by 2002:a17:906:2cd2:: with SMTP id r18mr22404089ejr.282.1571670466937;
        Mon, 21 Oct 2019 08:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571670466; cv=none;
        d=google.com; s=arc-20160816;
        b=XS1BxfN7ahOlm4HlteWSWfLkhMKnq+WHc9WgBhGXBJU7fRG6h6XrS23oJOdEgzF/2z
         Ereb900IK08em/FQihzJqWcg2cCOiExeEaViy+Jfi9gRoyW2fli/RxK7AlPpqFkRZCJB
         t9bYQUQVRr8AKW6tQHbd/WxHBG3EPDqnAjvlVRESZbqnSqs4iCJysvBEzJXUVfcZRDiA
         SmGAMf7uDfKpszX3drJmCx87vHuYcH+xDSfR1/4VtPdYHKBc+EwKNwe+mN1Jb92HM56X
         uX5ArsUly3tcThMO8Im2yH8+wJOMWpKTr77+giSyCrNrZlB7tDVHSLxqamSqQLHjFX2H
         doOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4jfBO9dXtycoQ+LUnfDkjC9DiMBC/ilexkuliLwlrs=;
        b=ZIBzViM+nUFacT9X7MryRcozQN/fvWISWZ+irS9HxkVcbY3jZvTaxD/pqdW+rQ84py
         OhUIeKe/0upgF6XGW/YcAmMz2njWOZwUwi7vUH16QEl68wgy3lfKsykIf0TUJod+xdfB
         A1iYLg9u3bYl3xgqRgfoiRcuNmobXO2F5mFG6j3AUiTClzPjHOi303wd1KDKY75B0GjF
         G2LuijZnmBY2zAyWZbGXVKNKyHEyOAoPEQnX1mlvfnhwSQwGkZ5+qwP+l77DQY/nW6Ak
         EdDnCq9ERjFrAO1xUvJooOuWtQLJ8VABZzSUc3eOvBx2rikZThe3hXnHjja7h/0dNAD2
         0xXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBFhkjZs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si9941153ede.274.2019.10.21.08.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 08:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBFhkjZs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMZHd-00087e-LZ
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iMZHO-00082I-MY
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 11:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iMZHM-0000V1-EI
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 11:07:30 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45707)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iMZHM-0000UO-56
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 11:07:28 -0400
Received: by mail-io1-xd44.google.com with SMTP id c25so16260152iot.12
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J4jfBO9dXtycoQ+LUnfDkjC9DiMBC/ilexkuliLwlrs=;
 b=GBFhkjZs3/EqZPRjhjJvXaK5R5NCzNf+OEQQFCpDUVnW/J6uaKwhFix0ruovsKbbwz
 +0lfyoB7mTywJWIaRkn2FGoXCyNONOD0jEcgRNWJ3h7vdQbN0bWKtQDIU6QgFoLozzjB
 DuPc55mkNEVEJlZWyGQdn+rqtJg+J708Tb6TNaiVdHwzxKF3LpF81XnL3ibbP1OcohQT
 k0Cf1JIQU6EodQVCZqDvLV9p8W31IxAbZJBGT8AE7aVeUqYme1MeTa793ab/CCZM2nFs
 Ii5mcoIoxYoQwoP9si/245e8cW3Jt6iFory1u3rx289s2MO3WjBYnJq/t/ggiFF0vD7v
 1+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4jfBO9dXtycoQ+LUnfDkjC9DiMBC/ilexkuliLwlrs=;
 b=T6yPHALfabUXkd2l84HcUAqciNkC0LlEcQxUhbAcaK1nFxSBAc4BqsSUDuVskHNQAx
 jP7SSBgRNY52VBYarUodM3O/DLH9TmINw6xCgdnarAlSMvy/iBg7dgIZoilTW31rHoH8
 sAELA7YINw0zC+iAFRUNEg5vvc5ypqnQmv5Jb9HKyQxYLpjR5U8n9UlURRq/pCt+xPQN
 cg3AVwaqQKpQj7yUU6Jgg5mWAJFg9k64l3Qc51W+iU9wNmQotjPD3EmCbwLgsCgyFM8B
 fjOjpOR7TMJnn2rrK6wwib89G9LL9liYWSemMimdB0YgXKqcknKzwHrjEsx4C7zmuYvN
 9hcw==
X-Gm-Message-State: APjAAAWexzs+Z+oOk8894ezV1mMb+Sw36e/BzCM94v5lgnTCJpqepioN
 WQMuEMP9+Q46jrz/vPbCDtfSRdIcP2LbypZ9ZfYFHw==
X-Received: by 2002:a02:330e:: with SMTP id c14mr22992138jae.5.1571670446225; 
 Mon, 21 Oct 2019 08:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
 <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
 <20191015105628.7ln6ph5s3vpsyfuw@kamzik.brq.redhat.com>
 <CADSWDzsKx7+4mR4pmsqi0+rddUv47q=UKwVt509B8g68UoRiMA@mail.gmail.com>
 <CADSWDzs9sdjE+-1AedPnU6o7U5XjTk=dcHf-BXQXQQkrp2O=Bw@mail.gmail.com>
 <20191016135025.k4szpqwgkhfnd6dl@kamzik.brq.redhat.com>
 <CADSWDzuXpTHDtRmTL41CXbk9GmDHO5iEgpiRgnD=buQU+nnXcg@mail.gmail.com>
 <20191016161628.rf752xuu6fzkihun@kamzik.brq.redhat.com>
In-Reply-To: <20191016161628.rf752xuu6fzkihun@kamzik.brq.redhat.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Mon, 21 Oct 2019 16:07:14 +0100
Message-ID: <CADSWDzvT7E9P3uEJDV9z+L=HEBuDRwQ904-GG0M9T-NUz+OsoQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
X-TUID: 4freXwxLpgqN

On Wed, 16 Oct 2019 at 17:16, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Oct 16, 2019 at 04:16:57PM +0100, Beata Michalska wrote:
> > On Wed, 16 Oct 2019 at 14:50, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Wed, Oct 16, 2019 at 02:24:50PM +0100, Beata Michalska wrote:
> > > > On Tue, 15 Oct 2019 at 12:56, Beata Michalska
> > > > <beata.michalska@linaro.org> wrote:
> > > > >
> > > > > On Tue, 15 Oct 2019 at 11:56, Andrew Jones <drjones@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Oct 15, 2019 at 10:59:16AM +0100, Beata Michalska wrote:
> > > > > > > On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
> > > > > > > > +
> > > > > > > > +    obj = object_new(object_class_get_name(oc));
> > > > > > > > +
> > > > > > > > +    if (qdict_in) {
> > > > > > > > +        Visitor *visitor;
> > > > > > > > +        Error *err = NULL;
> > > > > > > > +
> > > > > > > > +        visitor = qobject_input_visitor_new(model->props);
> > > > > > > > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > > > > > > > +        if (err) {
> > > > > > > > +            object_unref(obj);
> > > > > > >
> > > > > > > Shouldn't we free the 'visitor' here as well ?
> > > > > >
> > > > > > Yes. Good catch. So we also need to fix
> > > > > > target/s390x/cpu_models.c:cpu_model_from_info(), which has the same
> > > > > > construction (the construction from which I derived this)
> > > > > >
> > > > > > >
> > > > > > > > +            error_propagate(errp, err);
> > > > > > > > +            return NULL;
> > > > > > > > +        }
> > > > > > > > +
> > > > > >
> > > > > > What about the rest of the patch? With that fixed for v6 can I
> > > > > > add your r-b?
> > > > > >
> > > > >
> > > > > I still got this feeling that we could optimize that a bit - which I'm
> > > > > currently on, so hopefully I'll be able to add more comments soon if
> > > > > that proves to be the case.
> > > > >
> > > > > BR
> > > > > Beata
> > > >
> > > > I think there are few options that might be considered though the gain
> > > > is not huge .. but it's always smth:
> > > >
> > > > > +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> > > > > +                                                     CpuModelInfo *model,
> > > > > +                                                     Error **errp)
> > > > > +{
> > > > > +    CpuModelExpansionInfo *expansion_info;
> > > > > +    const QDict *qdict_in = NULL;
> > > > > +    QDict *qdict_out;
> > > > > +    ObjectClass *oc;
> > > > > +    Object *obj;
> > > > > +    const char *name;
> > > > > +    int i;
> > > > > +
> > > > > +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> > > > > +        error_setg(errp, "The requested expansion type is not supported");
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> > > > > +        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> > > > > +    if (!oc) {
> > > > > +        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> > > > > +                   model->name);
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    if (kvm_enabled()) {
> > > > > +        const char *cpu_type = current_machine->cpu_type;
> > > > > +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> > > > > +        bool supported = false;
> > > > > +
> > > > > +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> > > > > +            /* These are kvmarm's recommended cpu types */
> > > > > +            supported = true;
> > > > > +        } else if (strlen(model->name) == len &&
> > > > > +                   !strncmp(model->name, cpu_type, len)) {
> > > > > +            /* KVM is enabled and we're using this type, so it works. */
> > > > > +            supported = true;
> > > > > +        }
> > > > > +        if (!supported) {
> > > > > +            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> > > > > +                             "with KVM on this host", model->name);
> > > > > +            return NULL;
> > > > > +        }
> > > > > +    }
> > > > > +
> > > >
> > > > The above section can be slightly reduced and rearranged - preferably
> > > > moved to a separate function
> > > > -> get_cpu_model (...) ?
> > > >
> > > > * You can check the 'host' model first and then validate the accelerator ->
> > > >     if ( !strcmp(model->name, "host")
> > > >         if (!kvm_enabled())
> > > >             log_error & leave
> > > >        else
> > > >           goto cpu_class_by_name /*cpu_class_by_name moved after the
> > > > final model check @see below */
> > > >
> > > > * the kvm_enabled section can be than slightly improved (dropping the
> > > > second compare against 'host')
> > > >
> > > >       if (kvm_enabled() && strcmp(model->name, "max") {
> > > >            /*Validate the current_machine->cpu_type against the
> > > > model->name and report error case mismatch
> > > >           /* otherwise just fall through */
> > > >       }
> > > >  * cpu_class_by_name moved here ...
> > > > > +    if (model->props) {
> > > > MInor: the CPUModelInfo seems to have dedicated field for that
> > > > verification -> has_props
> > > >
> > > > > +        qdict_in = qobject_to(QDict, model->props);
> > > > > +        if (!qdict_in) {
> > > > > +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
> > > > > +            return NULL;
> > > > > +        }
> > > > > +    }
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
> > > > > +            error_propagate(errp, err);
> > > > > +            return NULL;
> > > > > +        }
> > > > > +
> > > > > +        i = 0;
> > > > > +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > > > > +            if (qdict_get(qdict_in, name)) {
> > > > > +                object_property_set(obj, visitor, name, &err);
> > > > > +                if (err) {
> > > > > +                    break;
> > > > > +                }
> > > > > +            }
> > > > > +        }
> > > > > +
> > > > > +        if (!err) {
> > > > > +            visit_check_struct(visitor, &err);
> > > > > +        }
> > > > > +        visit_end_struct(visitor, NULL);
> > > > > +        visit_free(visitor);
> > > > > +        if (err) {
> > > > > +            object_unref(obj);
> > > > > +            error_propagate(errp, err);
> > > > > +            return NULL;
> > > > > +        }
> > > > > +    }
> > > >
> > > > The both >> if (err) << blocks could be extracted and moved at the end
> > > > of the function
> > > > to mark a 'cleanup section'  and both here and few lines before
> > > > (with the visit_start_struct failure) could use goto.
> > > > Easier to maintain and to make sure we make the proper cleanup in any case.
> > > >
> > > > > +
> > > > > +    expansion_info = g_new0(CpuModelExpansionInfo, 1);
> > > > > +    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
> > > > > +    expansion_info->model->name = g_strdup(model->name);
> > > > > +
> > > > > +    qdict_out = qdict_new();
> > > > > +
> > > > > +    i = 0;
> > > > > +    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > > > > +        ObjectProperty *prop = object_property_find(obj, name, NULL);
> > > > > +        if (prop) {
> > > > > +            Error *err = NULL;
> > > > > +            QObject *value;
> > > > > +
> > > > > +            assert(prop->get);
> > > > > +            value = object_property_get_qobject(obj, name, &err);
> > > > > +            assert(!err);
> > > > > +
> > > > > +            qdict_put_obj(qdict_out, name, value);
> > > > > +        }
> > > > > +    }
> > > > > +
> > > >
> > > > This could be merged with the first iteration over the features,
> > > > smth like:
> > > >
> > > >     while () {
> > > >         if ((value = qdict_get(qdict_in, name))) {
> > > >             object_property_set ...
> > > >            if (!err)
> > > >                qobject_ref(value) /* we have the weak reference */
> > > >             else
> > > >                 break;
> > > >         } else {
> > > >              value = object_property_get_qobject()
> > > >         }
> > > >         if (value) qdict_put_object(qdict_out, name, value)
> > > >     }
> > > >
> > > > This way you iterate over the table once and you do not query
> > > > for the same property twice by getting the value from the qdict_in.
> > > > If the value is not acceptable we will fail either way so should be all good.
> > > >
> > > >
> > > > > +    if (!qdict_size(qdict_out)) {
> > > > > +        qobject_unref(qdict_out);
> > > > > +    } else {
> > > > > +        expansion_info->model->props = QOBJECT(qdict_out);
> > > > > +        expansion_info->model->has_props = true;
> > > > > +    }
> > > > > +
> > > > > +    object_unref(obj);
> > > > > +
> > > > > +    return expansion_info;
> > > >
> > > > Mentioned earlier cleanup section:
> > > > cleanup:
> > > >    object_unref(obj);
> > > >    qobject_unref(qdict_out) ; /* if single loop is used */
> > > >    error_propagate(errp,err);
> > > >    return NULL;
> > > >
> > > > > +}
> > > > > --
> > > > > 2.20.1
> > > > >
> > > >
> > > > Hope I haven't missed anything.
> > > > What do you think ?
> > > >
> > >
> > > I think you need to post an entire function that incorporates all the
> > > proposed changes, or at least a diff that I can apply in order to get
> > > the entirely changed function. I also think that it's fine the way
> > > it is, so it would take a justification stronger than a potential
> > > micro optimization to get me to change it.
> > >
> >
> > The numbers I can pull out of it are not thrilling and this is not
> > on a fast path so I will not be pushing for changes.
> > Though extracting the clean-up might be worth considering -
> > for improved maintenance.
> >
> > For a reference though:
>
> It doesn't apply for me - even after fixing up the damager your mailer did
> to it. I'd be surprised if it worked though. Merging the two loops over
> features makes the output generation depend on the caller providing input.
> Did you try the arm-cpu-features test with these changes?
>

Apologies for the late reply.

Indeed, the patch got bit messed-up. Apologies for that as well.
I have been testing manually but I did try the test you have provided
and yes it fails - there is a slight problem with the case when qdict_in
is empty,but this can be easily solved still keeping the single loop.
Otherwise I have seen you have posted a new patchest so I guess we  are
dropping the idea of refactoring ?

One more question: in case of querying a property which is not supported
by given cpu model - we are returning properties that are actually valid
(the test case for cortex-a15 and aarch64 prop).
Shouldn't we return an error there? I honestly must admit I do not know
what is the expected behaviour for the qmp query in such cases.

Best Regards
Beata



> drew
>
> >
> > _______________________________________________________
> >
> > ---
> >  target/arm/monitor.c | 100 +++++++++++++++++++++++++--------------------------
> >  1 file changed, 50 insertions(+), 50 deletions(-)
> >
> > diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> > index edca8aa..0d6bd42 100644
> > --- a/target/arm/monitor.c
> > +++ b/target/arm/monitor.c
> > @@ -112,17 +112,40 @@ CpuModelExpansionInfo
> > *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> >      Object *obj;
> >      const char *name;
> >      int i;
> > +    Error *err = NULL;
> >
> >      if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> >          error_setg(errp, "The requested expansion type is not supported");
> >          return NULL;
> >      }
> >
> > -    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> > -        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> > -        return NULL;
> > +    /* CPU type => 'host' */
> > +    if (!strcmp(model->name, "host")) {
> > +        if (!kvm_enabled()) {
> > +            error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> > +            return NULL;
> > +        } else {
> > +            goto valid;
> > +        }
> > +    }
> > +
> > +
> > +    /* Case when KVM is enabled and the model is a specific cpu model ... */
> > +    if (kvm_enabled() && strcmp(model->name, "max")) {
> > +            const char *cpu_type = current_machine->cpu_type;
> > +            int len = strlen(cpu_type) - strlen("-" TYPE_ARM_CPU);
> > +
> > +            if (strlen(model->name) == len
> > +             && !strncmp(cpu_type, model->name, len)) {
> > +                error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> > +                        "with KVM on this host", model->name);
> > +                return NULL;
> > +            }
> > +
> >      }
> >
> > +valid:
> > +
> >      oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> >      if (!oc) {
> >          error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> > @@ -130,25 +153,6 @@ CpuModelExpansionInfo
> > *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> >          return NULL;
> >      }
> >
> > -    if (kvm_enabled()) {
> > -        const char *cpu_type = current_machine->cpu_type;
> > -        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> > -        bool supported = false;
> > -
> > -        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> > -            /* These are kvmarm's recommended cpu types */
> > -            supported = true;
> > -        } else if (strlen(model->name) == len &&
> > -                   !strncmp(model->name, cpu_type, len)) {
> > -            /* KVM is enabled and we're using this type, so it works. */
> > -            supported = true;
> > -        }
> > -        if (!supported) {
> > -            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> > -                             "with KVM on this host", model->name);
> > -            return NULL;
> > -        }
> > -    }
> >
> >      if (model->props) {
> >          qdict_in = qobject_to(QDict, model->props);
> > @@ -159,62 +163,52 @@ CpuModelExpansionInfo
> > *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> >      }
> >
> >      obj = object_new(object_class_get_name(oc));
> > +    qdict_out = qdict_new();
> >
> >      if (qdict_in) {
> >          Visitor *visitor;
> > -        Error *err = NULL;
> > +        QObject *value;
> >
> >          visitor = qobject_input_visitor_new(model->props);
> >          visit_start_struct(visitor, NULL, NULL, 0, &err);
> >          if (err) {
> > -            object_unref(obj);
> > -            error_propagate(errp, err);
> > -            return NULL;
> > +            visit_free(visitor);
> > +            goto cleanup;
> >          }
> > -
> >          i = 0;
> >          while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > -            if (qdict_get(qdict_in, name)) {
> > +            value = qdict_get(qdict_in, name);
> > +            if (value) {
> >                  object_property_set(obj, visitor, name, &err);
> > -                if (err) {
> > +                if (!err) {
> > +                    qobject_ref(value);
> > +                } else {
> >                      break;
> >                  }
> > +
> > +            } else {
> > +               value = object_property_get_qobject(obj, name, &err);
> >              }
> > -        }
> >
> > +            if (value) {
> > +                qdict_put_obj(qdict_out, name, value);
> > +            }
> > +        }
> >          if (!err) {
> >              visit_check_struct(visitor, &err);
> >          }
> >          visit_end_struct(visitor, NULL);
> >          visit_free(visitor);
> >          if (err) {
> > -            object_unref(obj);
> > -            error_propagate(errp, err);
> > -            return NULL;
> > +            goto cleanup;
> >          }
> > +
> >      }
> >
> >      expansion_info = g_new0(CpuModelExpansionInfo, 1);
> >      expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
> >      expansion_info->model->name = g_strdup(model->name);
> >
> > -    qdict_out = qdict_new();
> > -
> > -    i = 0;
> > -    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > -        ObjectProperty *prop = object_property_find(obj, name, NULL);
> > -        if (prop) {
> > -            Error *err = NULL;
> > -            QObject *value;
> > -
> > -            assert(prop->get);
> > -            value = object_property_get_qobject(obj, name, &err);
> > -            assert(!err);
> > -
> > -            qdict_put_obj(qdict_out, name, value);
> > -        }
> > -    }
> > -
> >      if (!qdict_size(qdict_out)) {
> >          qobject_unref(qdict_out);
> >      } else {
> > @@ -225,4 +219,10 @@ CpuModelExpansionInfo
> > *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> >      object_unref(obj);
> >
> >      return expansion_info;
> > +
> > +cleanup:
> > +    object_unref(obj);
> > +    qobject_unref(qdict_out);
> > +    error_propagate(errp, err);
> > +    return NULL;
> >  }
> > --
> > 2.7.4
> >
> > BR
> > Beata
> >
> > > Thanks,
> > > drew
> >
