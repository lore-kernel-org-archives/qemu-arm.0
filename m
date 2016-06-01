Received: by 10.25.27.66 with SMTP id b63csp303116lfb;
        Wed, 1 Jun 2016 10:43:23 -0700 (PDT)
X-Received: by 10.140.91.53 with SMTP id y50mr35914173qgd.104.1464803003240;
        Wed, 01 Jun 2016 10:43:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d54si35634302qtc.4.2016.06.01.10.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 10:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8AAs-0002wp-NW
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 13:43:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8AAo-0002wY-BB
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 13:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8AAj-00050O-8Q
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 13:43:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8AAj-00050E-0K; Wed, 01 Jun 2016 13:43:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AEB186265B;
	Wed,  1 Jun 2016 17:43:11 +0000 (UTC)
Received: from localhost (vpn1-7-51.gru2.redhat.com [10.97.7.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51HhAWx029822; Wed, 1 Jun 2016 13:43:11 -0400
Date: Wed, 1 Jun 2016 14:43:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160601174309.GA13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464799050-11002-2-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 01 Jun 2016 17:43:11 +0000 (UTC)
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
X-TUID: RuBhmZMiEiet

On Wed, Jun 01, 2016 at 06:37:23PM +0200, Igor Mammedov wrote:
> it will allow to make x86_cpu_parse_featurestr() a pure convertor
> of legacy features string into global properties.
> That way -cpu FOOCPU,feat1=x,feat2=y,... is parsed only once

I would write it as "will be parsed only once (this will be
implemented by the next patches)".

> and as result of x86_cpu_parse_featurestr() a corresponding set
> of global properties for specified CPU type are registered.

Global properties are not registered yet (after applying this
patch), so please explain that the static variables are a
temporary hack that will be replaced by global properties in
following patches.

> So whenever a CPU device is created, generic device machinery
> will apply that global properties for us.

I would write "apply those global properties" instead.

> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  target-i386/cpu.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 3fbc6f3..6159a7f 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
>      }
>  }
>  
> +/* Features to be added */

Please add something like "Features to be added. Will be replaced
by global variables in the future".

> +static FeatureWordArray plus_features = { 0 };
> +/* Features to be removed */
> +static FeatureWordArray minus_features = { 0 };
> +

I see that this hack is replaced by the following patches, but is
there an easy way to remove the CPUState argument from
x86_cpu_parse_featurestr() before we introduce these static
variables? (No problem if there's no way to do that, as long as
the static variables are explicitly documented as a temporary
hack)

>  /* Parse "+feature,-feature,feature=foo" CPU feature string
>   */
>  static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> @@ -1939,13 +1944,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      char *featurestr; /* Single 'key=value" string being parsed */
> -    FeatureWord w;
> -    /* Features to be added */
> -    FeatureWordArray plus_features = { 0 };
> -    /* Features to be removed */
> -    FeatureWordArray minus_features = { 0 };
>      uint32_t numvalue;
> -    CPUX86State *env = &cpu->env;
>      Error *local_err = NULL;
>  
>      featurestr = features ? strtok(features, ",") : NULL;
> @@ -2019,18 +2018,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>          }
>          featurestr = strtok(NULL, ",");
>      }
> -
> -    if (cpu->host_features) {
> -        for (w = 0; w < FEATURE_WORDS; w++) {
> -            env->features[w] =
> -                x86_cpu_get_supported_feature_word(w, cpu->migratable);
> -        }
> -    }
> -
> -    for (w = 0; w < FEATURE_WORDS; w++) {
> -        env->features[w] |= plus_features[w];
> -        env->features[w] &= ~minus_features[w];
> -    }
>  }
>  
>  /* Print all cpuid feature names in featureset
> @@ -2912,12 +2899,25 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>      CPUX86State *env = &cpu->env;
>      Error *local_err = NULL;
>      static bool ht_warned;
> +    FeatureWord w;
>  
>      if (cpu->apic_id < 0) {
>          error_setg(errp, "apic-id property was not initialized properly");
>          return;
>      }
>  
> +    if (cpu->host_features) {
> +        for (w = 0; w < FEATURE_WORDS; w++) {
> +            env->features[w] =
> +                x86_cpu_get_supported_feature_word(w, cpu->migratable);
> +        }
> +    }
> +
> +    for (w = 0; w < FEATURE_WORDS; w++) {
> +        cpu->env.features[w] |= plus_features[w];
> +        cpu->env.features[w] &= ~minus_features[w];
> +    }
> +
>      if (env->features[FEAT_7_0_EBX] && env->cpuid_level < 7) {
>          env->cpuid_level = 7;
>      }
> -- 
> 1.8.3.1
> 

-- 
Eduardo
