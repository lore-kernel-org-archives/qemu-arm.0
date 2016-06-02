Received: by 10.25.27.66 with SMTP id b63csp617302lfb;
        Thu, 2 Jun 2016 02:59:51 -0700 (PDT)
X-Received: by 10.55.207.74 with SMTP id e71mr31998701qkj.64.1464861591524;
        Thu, 02 Jun 2016 02:59:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30si16302595qkp.218.2016.06.02.02.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 02:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8PPq-0003xU-VA
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 05:59:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8PPj-0003x4-JW
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 05:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8PPe-0000J3-MH
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 05:59:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8PPe-0000Iu-EC; Thu, 02 Jun 2016 05:59:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5817BC00DDE7;
	Thu,  2 Jun 2016 09:59:37 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-100.brq.redhat.com
	[10.40.204.100])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u529xXOJ001796; Thu, 2 Jun 2016 05:59:34 -0400
Date: Thu, 2 Jun 2016 11:59:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602115930.6945e5d6@igors-macbook-pro.local>
In-Reply-To: <20160601174309.GA13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
	<20160601174309.GA13503@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 02 Jun 2016 09:59:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 1/8] target-i386: cpu: move features
 logic that requires CPUState to realize time
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
X-TUID: td7lPQ7oVA0x

On Wed, 1 Jun 2016 14:43:09 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:
[...]

> > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > index 3fbc6f3..6159a7f 100644
> > --- a/target-i386/cpu.c
> > +++ b/target-i386/cpu.c
> > @@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
> >      }
> >  }
> >  
> > +/* Features to be added */
> 
> Please add something like "Features to be added. Will be replaced
> by global variables in the future".
> 
> > +static FeatureWordArray plus_features = { 0 };
> > +/* Features to be removed */
> > +static FeatureWordArray minus_features = { 0 };
> > +
> 
> I see that this hack is replaced by the following patches, but is
> there an easy way to remove the CPUState argument from
> x86_cpu_parse_featurestr() before we introduce these static
> variables? (No problem if there's no way to do that, as long as
> the static variables are explicitly documented as a temporary
> hack)
It's hack to keep legacy +- semantic (i.e. it overrides feat1=x,feat2)
local to x86 that probably would stay here forever.
I should add comment that explains why +- can't be replaced
with normal properties.

I don't plan to replace plus/minus_features with anything nor to
make this variables a global ones to spread +- x86/sparc legacy
format everywhere.
 
What I would do though before enabling -device/device_add for X86CPU is
to disable +- handling for new machine types so that CPUs would
follow generic property semantic of device used everywhere else.

> 
> >  /* Parse "+feature,-feature,feature=foo" CPU feature string
> >   */
> >  static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> > @@ -1939,13 +1944,7 @@ static void
> > x86_cpu_parse_featurestr(CPUState *cs, char *features, {
> >      X86CPU *cpu = X86_CPU(cs);
> >      char *featurestr; /* Single 'key=value" string being parsed */
> > -    FeatureWord w;
> > -    /* Features to be added */
> > -    FeatureWordArray plus_features = { 0 };
> > -    /* Features to be removed */
> > -    FeatureWordArray minus_features = { 0 };
> >      uint32_t numvalue;
> > -    CPUX86State *env = &cpu->env;
> >      Error *local_err = NULL;
> >  
> >      featurestr = features ? strtok(features, ",") : NULL;
> > @@ -2019,18 +2018,6 @@ static void
> > x86_cpu_parse_featurestr(CPUState *cs, char *features, }
> >          featurestr = strtok(NULL, ",");
> >      }
> > -
> > -    if (cpu->host_features) {
> > -        for (w = 0; w < FEATURE_WORDS; w++) {
> > -            env->features[w] =
> > -                x86_cpu_get_supported_feature_word(w,
> > cpu->migratable);
> > -        }
> > -    }
> > -
> > -    for (w = 0; w < FEATURE_WORDS; w++) {
> > -        env->features[w] |= plus_features[w];
> > -        env->features[w] &= ~minus_features[w];
> > -    }
> >  }
> >  
> >  /* Print all cpuid feature names in featureset
> > @@ -2912,12 +2899,25 @@ static void x86_cpu_realizefn(DeviceState
> > *dev, Error **errp) CPUX86State *env = &cpu->env;
> >      Error *local_err = NULL;
> >      static bool ht_warned;
> > +    FeatureWord w;
> >  
> >      if (cpu->apic_id < 0) {
> >          error_setg(errp, "apic-id property was not initialized
> > properly"); return;
> >      }
> >  
> > +    if (cpu->host_features) {
> > +        for (w = 0; w < FEATURE_WORDS; w++) {
> > +            env->features[w] =
> > +                x86_cpu_get_supported_feature_word(w,
> > cpu->migratable);
> > +        }
> > +    }
> > +
> > +    for (w = 0; w < FEATURE_WORDS; w++) {
> > +        cpu->env.features[w] |= plus_features[w];
> > +        cpu->env.features[w] &= ~minus_features[w];
> > +    }
> > +
> >      if (env->features[FEAT_7_0_EBX] && env->cpuid_level < 7) {
> >          env->cpuid_level = 7;
> >      }
> > -- 
> > 1.8.3.1
> > 
> 

