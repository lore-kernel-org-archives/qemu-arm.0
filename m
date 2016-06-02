Received: by 10.25.27.66 with SMTP id b63csp679113lfb;
        Thu, 2 Jun 2016 05:22:37 -0700 (PDT)
X-Received: by 10.55.22.196 with SMTP id 65mr34810038qkw.167.1464870157042;
        Thu, 02 Jun 2016 05:22:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f78si28782383qgd.62.2016.06.02.05.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 05:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Re0-0008UQ-DA
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 08:22:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8Rdv-0008TI-Vs
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 08:22:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8Rdq-000371-UA
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 08:22:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8Rdq-00036x-M2; Thu, 02 Jun 2016 08:22:26 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECB29128271;
	Thu,  2 Jun 2016 12:22:25 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52CMNLX009973; Thu, 2 Jun 2016 08:22:24 -0400
Date: Thu, 2 Jun 2016 14:22:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602142222.307ec4ee@nial.brq.redhat.com>
In-Reply-To: <20160601184620.GE13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 02 Jun 2016 12:22:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 4/8] target-i386: cpu: consolidate calls
 of object_property_parse() in x86_cpu_parse_featurestr
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EpzWX+TrcEMh

On Wed, 1 Jun 2016 15:46:20 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Jun 01, 2016 at 06:37:26PM +0200, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  target-i386/cpu.c | 32 +++++++++++++++++---------------
> >  1 file changed, 17 insertions(+), 15 deletions(-)
> > 
> > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > index 238f69d..618aef9 100644
> > --- a/target-i386/cpu.c
> > +++ b/target-i386/cpu.c
> > @@ -1945,12 +1945,15 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >      X86CPU *cpu = X86_CPU(cs);
> >      char *featurestr; /* Single 'key=value" string being parsed */
> >      uint32_t numvalue;
> > +    char num[32];
> > +    const char *name;
> > +    char *err;
> >      Error *local_err = NULL;
> >  
> >      featurestr = features ? strtok(features, ",") : NULL;
> >  
> >      while (featurestr) {
> > -        char *val;
> > +        char *val = NULL;
> >          if (featurestr[0] == '+') {
> >              add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
> >          } else if (featurestr[0] == '-') {
> > @@ -1958,10 +1961,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >          } else if ((val = strchr(featurestr, '='))) {
> >              *val = 0; val++;
> >              feat2prop(featurestr);
> > +            name = featurestr;
> >              if (!strcmp(featurestr, "xlevel")) {
> > -                char *err;
> > -                char num[32];
> > -
> >                  numvalue = strtoul(val, &err, 0);
> >                  if (!*val || *err) {
> >                      error_setg(errp, "bad numerical value %s", val);
> > @@ -1973,11 +1974,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >                      numvalue += 0x80000000;
> >                  }
> >                  snprintf(num, sizeof(num), "%" PRIu32, numvalue);
> > -                object_property_parse(OBJECT(cpu), num, featurestr, &local_err);
> > +                val = num;
> >              } else if (!strcmp(featurestr, "tsc-freq")) {
> >                  int64_t tsc_freq;
> > -                char *err;
> > -                char num[32];
> >  
> >                  tsc_freq = qemu_strtosz_suffix_unit(val, &err,
> >                                                 QEMU_STRTOSZ_DEFSUFFIX_B, 1000);
> > @@ -1986,12 +1985,11 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >                      return;
> >                  }
> >                  snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
> > -                object_property_parse(OBJECT(cpu), num, "tsc-frequency",
> > -                                      &local_err);
> > +                val = num;
> > +                name = "tsc-frequency";
> >              } else if (!strcmp(featurestr, "hv-spinlocks")) {
> > -                char *err;
> >                  const int min = 0xFFF;
> > -                char num[32];
> > +
> >                  numvalue = strtoul(val, &err, 0);
> >                  if (!*val || *err) {
> >                      error_setg(errp, "bad numerical value %s", val);
> > @@ -2004,14 +2002,18 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >                      numvalue = min;
> >                  }
> >                  snprintf(num, sizeof(num), "%" PRId32, numvalue);
> > -                object_property_parse(OBJECT(cpu), num, featurestr, &local_err);
> > -            } else {
> > -                object_property_parse(OBJECT(cpu), val, featurestr, &local_err);
> > +                val = num;
> >              }
> >          } else {
> >              feat2prop(featurestr);
> > -            object_property_parse(OBJECT(cpu), "on", featurestr, &local_err);
> > +            name = featurestr;
> > +            val = (char *)"on";  
> 
> You don't need this hack if you do something like this:
> 
> 
>      while (featurestr) {
> -        char *val = NULL;
> +        const char *val = NULL;
> +        char *eq = NULL;
>          if (featurestr[0] == '+') {
>              add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
>          } else if (featurestr[0] == '-') {
>              add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
> -        } else if ((val = strchr(featurestr, '='))) {
> -            *val = 0; val++;
> +        } else if ((eq = strchr(featurestr, '='))) {
> +            *eq++ = 0;
> +            val = eq;
>              feat2prop(featurestr);
>              name = featurestr;
>              if (!strcmp(featurestr, "xlevel")) {
> 
> 
> >          }
> > +
> > +        if (val) {
> > +            object_property_parse(OBJECT(cpu), val, name, &local_err);
> > +        }  
> 
> I would find it easier to read if this part was inside the same
> block as the code that sets name/val.
> 
> I would find it even better if object_property_parse() was in the
> main loop body, and the +feature/-feature code placed inside an
> if/continue branch (to make it clear that it is an exception, not
> the rule). Like this:

Thanks,
I'll take your variant with your permission.

> /* untested */
> static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>                                      Error **errp)
> {
>     X86CPU *cpu = X86_CPU(cs);
>     char *featurestr; /* Single 'key=value" string being parsed */
>     char *err;
>     Error *local_err = NULL;
> 
>     if (!features) {
>         return;
>     }
> 
>     for (featurestr = strtok(features, ",");
>          featurestr;
>          featurestr = strtok(NULL, ",")) {
>         const char *name;
>         const char *val = NULL;
>         char *eq = NULL;
>         uint32_t numvalue;
>         char num[32];
> 
>         /* Compatibility syntax: */
>         if (featurestr[0] == '+') {
>             add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
>             continue;
>         } else if (featurestr[0] == '-') {
>             add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
>             continue;
>         }
> 
>         eq = strchr(featurestr, '=');
>         if (eq) {
>             *eq++ = 0;
>             val = eq;
>         } else {
>             val = "on";
>         }
> 
>         feat2prop(featurestr);
>         name = featurestr;
> 
>         /* Special cases: */
>         if (!strcmp(name, "xlevel")) {
>             numvalue = strtoul(val, &err, 0);
>             if (!*val || *err) {
>                 error_setg(errp, "bad numerical value %s", val);
>                 return;
>             }
>             if (numvalue < 0x80000000) {
>                 error_report("xlevel value shall always be >= 0x80000000"
>                              ", fixup will be removed in future versions");
>                 numvalue += 0x80000000;
>             }
>             snprintf(num, sizeof(num), "%" PRIu32, numvalue);
>             val = num;
>         } else if (!strcmp(name, "tsc-freq")) {
>             int64_t tsc_freq;
> 
>             tsc_freq = qemu_strtosz_suffix_unit(val, &err,
>                                            QEMU_STRTOSZ_DEFSUFFIX_B, 1000);
>             if (tsc_freq < 0 || *err) {
>                 error_setg(errp, "bad numerical value %s", val);
>                 return;
>             }
>             snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
>             val = num;
>             name = "tsc-frequency";
>         } else if (!strcmp(name, "hv-spinlocks")) {
>             const int min = 0xFFF;
> 
>             numvalue = strtoul(val, &err, 0);
>             if (!*val || *err) {
>                 error_setg(errp, "bad numerical value %s", val);
>                 return;
>             }
>             if (numvalue < min) {
>                 error_report("hv-spinlocks value shall always be >= 0x%x"
>                              ", fixup will be removed in future versions",
>                              min);
>                 numvalue = min;
>             }
>             snprintf(num, sizeof(num), "%" PRId32, numvalue);
>             val = num;
>         }
> 
>         object_property_parse(OBJECT(cpu), val, name, &local_err);
> 
>         if (local_err) {
>             error_propagate(errp, local_err);
>             return;
>         }
>     }
> }
> 
> 
> > +
> >          if (local_err) {
> >              error_propagate(errp, local_err);
> >              return;
> > -- 
> > 1.8.3.1
> >   
> 

