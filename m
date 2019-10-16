Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7288864wrm;
        Wed, 16 Oct 2019 08:17:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+2fBuF7V/R1c8Hp8/tUuLwQa014724oNNrlDV5kNQmw+NBZP/pxpszlSKtD80QyxKQ4Jo
X-Received: by 2002:ac8:469a:: with SMTP id g26mr45519862qto.277.1571239064971;
        Wed, 16 Oct 2019 08:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571239064; cv=none;
        d=google.com; s=arc-20160816;
        b=dyf7VK3mWJ1kblCMkPJA/tJkEumZimUzpWhiMODrHUjjPQJaWGKSMA9XBSTkx5el/B
         6KYc8lalatv6JxpXMnX3hcuEIDf6gQgSYaltaHOsJXNGNlCZJhd5L1D2VWoUg3O3vO5m
         iQhU8o+TsY5XGxww/9etClaSQD1u4Nvnv9WTPvFlSVWQYLAScUGDGK9GIZ2SDNhNt9gU
         d73KftLFycZiri/BU2JQAEUN8Fizwz/G+SrhkPXUCo/clsgZcgLJcP57z0epD6GuPnDA
         w0yqYDYbjjcQUXTGmdGfFUvHP6xhKVaE1y+t4mSfjEPwyh6LHerB+LqiLa8r1aFtJ2Rp
         6Anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fVqVr8xOM2cIrVn7XO0Okwx+3PIBMIjAVAgDOndiQv4=;
        b=epZGD6zQOOTcdTlHZlx3lW8KfVVF39BiUoCRHguz3kdt0aUbCbsfWABZwS3yeEGn1F
         VpiSeGgWgPKRbMLOwyq+CO2q0OMjeyGMiJ5wnnLPLGbx5oLLrw6AtqFk80UB+F8blYTo
         WKi8Ra4jGW1iHPIN9VxXNG6/tDFEg1KvGR9RX9opty0gZGUzCw6V9Cd8/DUejHEX757f
         QZrRlquC7UcVtOBNrP0X3lCV1HeOJps/loCjga8Jv/RuWLHizw70oCXL5fRxOn392NqC
         p9DA3oM7/GIkxsWdWx+Wq6Q3KwqzZf4mZeJon28Rynhv5xQyueT51KidvhKSzsO9mN7i
         /rvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOwA6jyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z134si25068883qkb.84.2019.10.16.08.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 08:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOwA6jyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKl3Y-0008RH-1x
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 11:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iKl32-0008Lp-GP
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 11:17:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iKl30-0005r2-AX
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 11:17:12 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:44972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iKl30-0005q8-0z
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 11:17:10 -0400
Received: by mail-il1-x142.google.com with SMTP id f13so2989837ils.11
 for <qemu-arm@nongnu.org>; Wed, 16 Oct 2019 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fVqVr8xOM2cIrVn7XO0Okwx+3PIBMIjAVAgDOndiQv4=;
 b=GOwA6jyohxWl7yusz3/bRaCrxSZAqyqp+M7HBbTrukl+XboCeQNK4NfZkCJDPsij8E
 C0BsXJDPKR9TCowLRZ3H69ra+MEfyJW13uuEvAJ6KZ94EmA/cy+sPl8l/Zv0eH1eaSgR
 k29uAqOPZHawArxc9QAN1arFXE+Fz/EULxREn7iLDcG6edRaQ3lt5dHqCRlkdTHGuvaN
 qqozAfO+BWQ2c4Cfq7U2BbVm5nGzNFaO3tg6pZ8CBm0pJhnRYqA+3PtHhhAsMHnb+nVb
 5VDl1mElhF/lrED+KfmB2SGtwfMv+TxaMz/ERbrn5rJseBAJ7lEIZGSQOZrznHfw7/vd
 q8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fVqVr8xOM2cIrVn7XO0Okwx+3PIBMIjAVAgDOndiQv4=;
 b=evimLGz7sCtoeegLdIcq8Wf3jLyEph4k5KwXJOTjEfivW6JT3MFgXxXGOHFUiGSsVk
 U9azDqak2nEJwVaOHoSKo70j881JmANicOxyeu3Vd67UgUc3Lt84+6KEvcYde3QRAuJ4
 JBEBh8GCBoF4L7p+B5O+2YKdadVpqHOjrfxoDFOZWPMe3/CWFWmMvW0TyxDDKN7ZbPmY
 nNV3fL5OzdoGEesTzEbJ6/ivviTE/nIse7mppxtaW/VT1ZO7N6d3C0VW7NSnvXRfbcjQ
 vrA5bC2fsaQYqaVev/5uaKnBdOultU3J1q4xjqlqnzFvGTvLSgJoQnp3DbmKzWejwiLn
 PgTg==
X-Gm-Message-State: APjAAAVTjyTbPzV39iVSX0Wm2GQEH1PFSkX/Gede5kGgigdt/K7MFW/N
 xxXNWbbKj5nUpDYASiAYu0MEcVfwA8j9yYS2rpIXew==
X-Received: by 2002:a92:7702:: with SMTP id s2mr12010046ilc.248.1571239028945; 
 Wed, 16 Oct 2019 08:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
 <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
 <20191015105628.7ln6ph5s3vpsyfuw@kamzik.brq.redhat.com>
 <CADSWDzsKx7+4mR4pmsqi0+rddUv47q=UKwVt509B8g68UoRiMA@mail.gmail.com>
 <CADSWDzs9sdjE+-1AedPnU6o7U5XjTk=dcHf-BXQXQQkrp2O=Bw@mail.gmail.com>
 <20191016135025.k4szpqwgkhfnd6dl@kamzik.brq.redhat.com>
In-Reply-To: <20191016135025.k4szpqwgkhfnd6dl@kamzik.brq.redhat.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Wed, 16 Oct 2019 16:16:57 +0100
Message-ID: <CADSWDzuXpTHDtRmTL41CXbk9GmDHO5iEgpiRgnD=buQU+nnXcg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
X-TUID: 4EVQItuRvFR2

On Wed, 16 Oct 2019 at 14:50, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Oct 16, 2019 at 02:24:50PM +0100, Beata Michalska wrote:
> > On Tue, 15 Oct 2019 at 12:56, Beata Michalska
> > <beata.michalska@linaro.org> wrote:
> > >
> > > On Tue, 15 Oct 2019 at 11:56, Andrew Jones <drjones@redhat.com> wrote:
> > > >
> > > > On Tue, Oct 15, 2019 at 10:59:16AM +0100, Beata Michalska wrote:
> > > > > On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
> > > > > > +
> > > > > > +    obj = object_new(object_class_get_name(oc));
> > > > > > +
> > > > > > +    if (qdict_in) {
> > > > > > +        Visitor *visitor;
> > > > > > +        Error *err = NULL;
> > > > > > +
> > > > > > +        visitor = qobject_input_visitor_new(model->props);
> > > > > > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > > > > > +        if (err) {
> > > > > > +            object_unref(obj);
> > > > >
> > > > > Shouldn't we free the 'visitor' here as well ?
> > > >
> > > > Yes. Good catch. So we also need to fix
> > > > target/s390x/cpu_models.c:cpu_model_from_info(), which has the same
> > > > construction (the construction from which I derived this)
> > > >
> > > > >
> > > > > > +            error_propagate(errp, err);
> > > > > > +            return NULL;
> > > > > > +        }
> > > > > > +
> > > >
> > > > What about the rest of the patch? With that fixed for v6 can I
> > > > add your r-b?
> > > >
> > >
> > > I still got this feeling that we could optimize that a bit - which I'm
> > > currently on, so hopefully I'll be able to add more comments soon if
> > > that proves to be the case.
> > >
> > > BR
> > > Beata
> >
> > I think there are few options that might be considered though the gain
> > is not huge .. but it's always smth:
> >
> > > +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> > > +                                                     CpuModelInfo *model,
> > > +                                                     Error **errp)
> > > +{
> > > +    CpuModelExpansionInfo *expansion_info;
> > > +    const QDict *qdict_in = NULL;
> > > +    QDict *qdict_out;
> > > +    ObjectClass *oc;
> > > +    Object *obj;
> > > +    const char *name;
> > > +    int i;
> > > +
> > > +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> > > +        error_setg(errp, "The requested expansion type is not supported");
> > > +        return NULL;
> > > +    }
> > > +
> > > +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> > > +        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> > > +        return NULL;
> > > +    }
> > > +
> > > +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> > > +    if (!oc) {
> > > +        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> > > +                   model->name);
> > > +        return NULL;
> > > +    }
> > > +
> > > +    if (kvm_enabled()) {
> > > +        const char *cpu_type = current_machine->cpu_type;
> > > +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> > > +        bool supported = false;
> > > +
> > > +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> > > +            /* These are kvmarm's recommended cpu types */
> > > +            supported = true;
> > > +        } else if (strlen(model->name) == len &&
> > > +                   !strncmp(model->name, cpu_type, len)) {
> > > +            /* KVM is enabled and we're using this type, so it works. */
> > > +            supported = true;
> > > +        }
> > > +        if (!supported) {
> > > +            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
> > > +                             "with KVM on this host", model->name);
> > > +            return NULL;
> > > +        }
> > > +    }
> > > +
> >
> > The above section can be slightly reduced and rearranged - preferably
> > moved to a separate function
> > -> get_cpu_model (...) ?
> >
> > * You can check the 'host' model first and then validate the accelerator ->
> >     if ( !strcmp(model->name, "host")
> >         if (!kvm_enabled())
> >             log_error & leave
> >        else
> >           goto cpu_class_by_name /*cpu_class_by_name moved after the
> > final model check @see below */
> >
> > * the kvm_enabled section can be than slightly improved (dropping the
> > second compare against 'host')
> >
> >       if (kvm_enabled() && strcmp(model->name, "max") {
> >            /*Validate the current_machine->cpu_type against the
> > model->name and report error case mismatch
> >           /* otherwise just fall through */
> >       }
> >  * cpu_class_by_name moved here ...
> > > +    if (model->props) {
> > MInor: the CPUModelInfo seems to have dedicated field for that
> > verification -> has_props
> >
> > > +        qdict_in = qobject_to(QDict, model->props);
> > > +        if (!qdict_in) {
> > > +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
> > > +            return NULL;
> > > +        }
> > > +    }
> > > +
> > > +    obj = object_new(object_class_get_name(oc));
> > > +
> > > +    if (qdict_in) {
> > > +        Visitor *visitor;
> > > +        Error *err = NULL;
> > > +
> > > +        visitor = qobject_input_visitor_new(model->props);
> > > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > > +        if (err) {
> > > +            object_unref(obj);
> > > +            error_propagate(errp, err);
> > > +            return NULL;
> > > +        }
> > > +
> > > +        i = 0;
> > > +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > > +            if (qdict_get(qdict_in, name)) {
> > > +                object_property_set(obj, visitor, name, &err);
> > > +                if (err) {
> > > +                    break;
> > > +                }
> > > +            }
> > > +        }
> > > +
> > > +        if (!err) {
> > > +            visit_check_struct(visitor, &err);
> > > +        }
> > > +        visit_end_struct(visitor, NULL);
> > > +        visit_free(visitor);
> > > +        if (err) {
> > > +            object_unref(obj);
> > > +            error_propagate(errp, err);
> > > +            return NULL;
> > > +        }
> > > +    }
> >
> > The both >> if (err) << blocks could be extracted and moved at the end
> > of the function
> > to mark a 'cleanup section'  and both here and few lines before
> > (with the visit_start_struct failure) could use goto.
> > Easier to maintain and to make sure we make the proper cleanup in any case.
> >
> > > +
> > > +    expansion_info = g_new0(CpuModelExpansionInfo, 1);
> > > +    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
> > > +    expansion_info->model->name = g_strdup(model->name);
> > > +
> > > +    qdict_out = qdict_new();
> > > +
> > > +    i = 0;
> > > +    while ((name = cpu_model_advertised_features[i++]) != NULL) {
> > > +        ObjectProperty *prop = object_property_find(obj, name, NULL);
> > > +        if (prop) {
> > > +            Error *err = NULL;
> > > +            QObject *value;
> > > +
> > > +            assert(prop->get);
> > > +            value = object_property_get_qobject(obj, name, &err);
> > > +            assert(!err);
> > > +
> > > +            qdict_put_obj(qdict_out, name, value);
> > > +        }
> > > +    }
> > > +
> >
> > This could be merged with the first iteration over the features,
> > smth like:
> >
> >     while () {
> >         if ((value = qdict_get(qdict_in, name))) {
> >             object_property_set ...
> >            if (!err)
> >                qobject_ref(value) /* we have the weak reference */
> >             else
> >                 break;
> >         } else {
> >              value = object_property_get_qobject()
> >         }
> >         if (value) qdict_put_object(qdict_out, name, value)
> >     }
> >
> > This way you iterate over the table once and you do not query
> > for the same property twice by getting the value from the qdict_in.
> > If the value is not acceptable we will fail either way so should be all good.
> >
> >
> > > +    if (!qdict_size(qdict_out)) {
> > > +        qobject_unref(qdict_out);
> > > +    } else {
> > > +        expansion_info->model->props = QOBJECT(qdict_out);
> > > +        expansion_info->model->has_props = true;
> > > +    }
> > > +
> > > +    object_unref(obj);
> > > +
> > > +    return expansion_info;
> >
> > Mentioned earlier cleanup section:
> > cleanup:
> >    object_unref(obj);
> >    qobject_unref(qdict_out) ; /* if single loop is used */
> >    error_propagate(errp,err);
> >    return NULL;
> >
> > > +}
> > > --
> > > 2.20.1
> > >
> >
> > Hope I haven't missed anything.
> > What do you think ?
> >
>
> I think you need to post an entire function that incorporates all the
> proposed changes, or at least a diff that I can apply in order to get
> the entirely changed function. I also think that it's fine the way
> it is, so it would take a justification stronger than a potential
> micro optimization to get me to change it.
>

The numbers I can pull out of it are not thrilling and this is not
on a fast path so I will not be pushing for changes.
Though extracting the clean-up might be worth considering -
for improved maintenance.

For a reference though:

_______________________________________________________

---
 target/arm/monitor.c | 100 +++++++++++++++++++++++++--------------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index edca8aa..0d6bd42 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -112,17 +112,40 @@ CpuModelExpansionInfo
*qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     Object *obj;
     const char *name;
     int i;
+    Error *err = NULL;

     if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
         error_setg(errp, "The requested expansion type is not supported");
         return NULL;
     }

-    if (!kvm_enabled() && !strcmp(model->name, "host")) {
-        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
-        return NULL;
+    /* CPU type => 'host' */
+    if (!strcmp(model->name, "host")) {
+        if (!kvm_enabled()) {
+            error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+            return NULL;
+        } else {
+            goto valid;
+        }
+    }
+
+
+    /* Case when KVM is enabled and the model is a specific cpu model ... */
+    if (kvm_enabled() && strcmp(model->name, "max")) {
+            const char *cpu_type = current_machine->cpu_type;
+            int len = strlen(cpu_type) - strlen("-" TYPE_ARM_CPU);
+
+            if (strlen(model->name) == len
+             && !strncmp(cpu_type, model->name, len)) {
+                error_setg(errp, "We cannot guarantee the CPU type '%s' works "
+                        "with KVM on this host", model->name);
+                return NULL;
+            }
+
     }

+valid:
+
     oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
     if (!oc) {
         error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
@@ -130,25 +153,6 @@ CpuModelExpansionInfo
*qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         return NULL;
     }

-    if (kvm_enabled()) {
-        const char *cpu_type = current_machine->cpu_type;
-        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
-        bool supported = false;
-
-        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
-            /* These are kvmarm's recommended cpu types */
-            supported = true;
-        } else if (strlen(model->name) == len &&
-                   !strncmp(model->name, cpu_type, len)) {
-            /* KVM is enabled and we're using this type, so it works. */
-            supported = true;
-        }
-        if (!supported) {
-            error_setg(errp, "We cannot guarantee the CPU type '%s' works "
-                             "with KVM on this host", model->name);
-            return NULL;
-        }
-    }

     if (model->props) {
         qdict_in = qobject_to(QDict, model->props);
@@ -159,62 +163,52 @@ CpuModelExpansionInfo
*qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     }

     obj = object_new(object_class_get_name(oc));
+    qdict_out = qdict_new();

     if (qdict_in) {
         Visitor *visitor;
-        Error *err = NULL;
+        QObject *value;

         visitor = qobject_input_visitor_new(model->props);
         visit_start_struct(visitor, NULL, NULL, 0, &err);
         if (err) {
-            object_unref(obj);
-            error_propagate(errp, err);
-            return NULL;
+            visit_free(visitor);
+            goto cleanup;
         }
-
         i = 0;
         while ((name = cpu_model_advertised_features[i++]) != NULL) {
-            if (qdict_get(qdict_in, name)) {
+            value = qdict_get(qdict_in, name);
+            if (value) {
                 object_property_set(obj, visitor, name, &err);
-                if (err) {
+                if (!err) {
+                    qobject_ref(value);
+                } else {
                     break;
                 }
+
+            } else {
+               value = object_property_get_qobject(obj, name, &err);
             }
-        }

+            if (value) {
+                qdict_put_obj(qdict_out, name, value);
+            }
+        }
         if (!err) {
             visit_check_struct(visitor, &err);
         }
         visit_end_struct(visitor, NULL);
         visit_free(visitor);
         if (err) {
-            object_unref(obj);
-            error_propagate(errp, err);
-            return NULL;
+            goto cleanup;
         }
+
     }

     expansion_info = g_new0(CpuModelExpansionInfo, 1);
     expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
     expansion_info->model->name = g_strdup(model->name);

-    qdict_out = qdict_new();
-
-    i = 0;
-    while ((name = cpu_model_advertised_features[i++]) != NULL) {
-        ObjectProperty *prop = object_property_find(obj, name, NULL);
-        if (prop) {
-            Error *err = NULL;
-            QObject *value;
-
-            assert(prop->get);
-            value = object_property_get_qobject(obj, name, &err);
-            assert(!err);
-
-            qdict_put_obj(qdict_out, name, value);
-        }
-    }
-
     if (!qdict_size(qdict_out)) {
         qobject_unref(qdict_out);
     } else {
@@ -225,4 +219,10 @@ CpuModelExpansionInfo
*qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     object_unref(obj);

     return expansion_info;
+
+cleanup:
+    object_unref(obj);
+    qobject_unref(qdict_out);
+    error_propagate(errp, err);
+    return NULL;
 }
-- 
2.7.4

BR
Beata

> Thanks,
> drew
