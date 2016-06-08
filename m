Received: by 10.25.27.66 with SMTP id b63csp2620339lfb;
        Wed, 8 Jun 2016 09:30:25 -0700 (PDT)
X-Received: by 10.55.23.153 with SMTP id 25mr5544446qkx.132.1465403425860;
        Wed, 08 Jun 2016 09:30:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t14si1076756qke.280.2016.06.08.09.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 09:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAgN7-0007xu-BR
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 12:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAgN1-0007xi-RI
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 12:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAgMx-0004Qz-6T
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 12:30:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bAgMx-0004Qn-0w; Wed, 08 Jun 2016 12:30:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE1B737E62;
	Wed,  8 Jun 2016 16:30:13 +0000 (UTC)
Received: from localhost (vpn1-7-99.gru2.redhat.com [10.97.7.99])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58GUCaO010844; Wed, 8 Jun 2016 12:30:13 -0400
Date: Wed, 8 Jun 2016 13:30:11 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160608163011.GL18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-8-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465226212-254093-8-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 Jun 2016 16:30:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 07/10] target-sparc: cpu: use
 sparc_cpu_parse_features() directly
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
X-TUID: DpPIO0Tm8JnR

On Mon, Jun 06, 2016 at 05:16:49PM +0200, Igor Mammedov wrote:
> make SPARC target use sparc_cpu_parse_features() directly
> so it won't get in the way of switching other propertified
> targets to handling features as global properties.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

I would like to apply this to the x86 tree, to allow the
remaining patches to be applied. May I get an Acked-by from the
SPARC maintainers?

> ---
> SPARC target could be switched to features properties
> later but that would need quite a bit of refactoring
> in generating necessary CPU types and adding appropriate
> properties.
> ---
>  target-sparc/cpu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
> index 5b74cfc..e4089f2 100644
> --- a/target-sparc/cpu.c
> +++ b/target-sparc/cpu.c
> @@ -101,9 +101,11 @@ static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
>  #endif
>  }
>  
> +static void sparc_cpu_parse_features(CPUState *cs, char *features,
> +                                     Error **errp);
> +
>  static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
>  {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
>      CPUSPARCState *env = &cpu->env;
>      char *s = g_strdup(cpu_model);
>      char *featurestr, *name = strtok(s, ",");
> @@ -119,7 +121,7 @@ static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
>      memcpy(env->def, def, sizeof(*def));
>  
>      featurestr = strtok(NULL, ",");
> -    cc->parse_features(CPU(cpu), featurestr, &err);
> +    sparc_cpu_parse_features(CPU(cpu), featurestr, &err);
>      g_free(s);
>      if (err) {
>          error_report_err(err);
> @@ -840,7 +842,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>      scc->parent_reset = cc->reset;
>      cc->reset = sparc_cpu_reset;
>  
> -    cc->parse_features = sparc_cpu_parse_features;
>      cc->has_work = sparc_cpu_has_work;
>      cc->do_interrupt = sparc_cpu_do_interrupt;
>      cc->cpu_exec_interrupt = sparc_cpu_exec_interrupt;
> -- 
> 1.8.3.1
> 

-- 
Eduardo
