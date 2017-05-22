Received: by 10.103.124.15 with SMTP id x15csp1256312vsc;
        Mon, 22 May 2017 00:04:19 -0700 (PDT)
X-Received: by 10.31.160.151 with SMTP id j145mr7471671vke.92.1495436659155;
        Mon, 22 May 2017 00:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495436659; cv=none;
        d=google.com; s=arc-20160816;
        b=KICbCgC+DKPyuSuMmbdKbDbC+ueEm5uQ/L7qz5lsIp8mPfEKUiIieQ/WJthFT1ol0D
         dNJzzhwD2AYtvuBjcKlIkpPjMjbPyB864nua1dhfabd7JCDtIpoDApZ69S+TQedLOqQh
         eU/1MZWEJNYUe1DyFrbfkOcjl8dEh+A4T6Qr9UUrDzowmw7vztgvXCzv8kQHVC7pFr9/
         d3o+AfPhK9sW4ihSuyhrWeAfBkXXK/WcPyFVyD0dUt/oU5ZlVg+icKf+i9gxj3yqG0Z9
         IPjVE3boWBy6u3xETUDpAE8ZJTkvxTGTdSVOFsqbrIdRzT8oltLzxfkdGkkP6vUMwfij
         UpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=dKYMFv5CpEc/MG3M2IEhkXqZ+UmprgIV+2AK+prJC0k=;
        b=m28zrXEkiBfwMtTAnA9x+LEaxQbXPizl8BDaP+Tnqfp43QosUKnf46LffdGuRP/UB9
         4biEgpG5mfR6Qeg2swKwrwUfEbZx46yHzJxjTEJjpPMeLnuKzY/SO/Ir9Y9F6VfLFu/3
         d3dqJ/AJoVA+GcO4i0t9yISq1Atlp1m6CZ7NBNQN0YRVtnEf0jUmkwETNtTRz/jugNgj
         BMjLqZR48PEn8V+2SggxSV3Y6UkkQ1Js8k4NeP1VvKgZeayQTSLgtjvp0zekKsZbRVxa
         SVwOeFYw/a5duvgy0oycY0K4qMxwRDKHfReo8aYpp0+66OzZYRuvHOlQiuzCbTttCa2s
         2ZFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si6489310vka.68.2017.05.22.00.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 00:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dChO6-000765-OF
	for alex.bennee@linaro.org; Mon, 22 May 2017 03:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dChO0-00075h-Ti
	for qemu-arm@nongnu.org; Mon, 22 May 2017 03:04:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dChNx-0000FH-O4
	for qemu-arm@nongnu.org; Mon, 22 May 2017 03:04:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dChNx-0000EP-Fl; Mon, 22 May 2017 03:04:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C86434E4D3;
	Mon, 22 May 2017 07:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C86434E4D3
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C86434E4D3
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 303A062932;
	Mon, 22 May 2017 07:04:05 +0000 (UTC)
Date: Mon, 22 May 2017 09:04:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170522090403.4b284345@nial.brq.redhat.com>
In-Reply-To: <20170518185058.GP4748@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-3-git-send-email-imammedo@redhat.com>
	<20170518185058.GP4748@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 22 May 2017 07:04:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/3] numa: move default mapping init to
 machine
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMta5l/6xfdk

On Thu, 18 May 2017 15:50:58 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, May 18, 2017 at 10:09:30AM +0200, Igor Mammedov wrote:
> > there is no need use cpu_index_to_instance_props() for setting
> > default cpu -> node mapping. Generic machine code can do it
> > without cpu_index by just enabling already preset defaults
> > in possible_cpus.
> > 
> > PS:
> > as bonus it makes one less user of cpu_index_to_instance_props()
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/core/machine.c | 32 +++++++++++++++++++++-----------
> >  numa.c            | 26 --------------------------
> >  2 files changed, 21 insertions(+), 37 deletions(-)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index fd6a436..2e91aa9 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -700,26 +700,36 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
> >      return g_string_free(s, false);
> >  }
> >  
> > -static void machine_numa_validate(MachineState *machine)
> > +static void machine_numa_finish_init(MachineState *machine)
> >  {
> > -    int i;
> > +    int i, default_mapping;  
> 
> I suggest bool instead of int.
will do it in v2

> 
> >      GString *s = g_string_new(NULL);
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >      const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
> >  
> >      assert(nb_numa_nodes);
> > +    for (i = possible_cpus->len;
> > +         i && !possible_cpus->cpus[i - 1].props.has_node_id;
> > +         i--)
> > +        ;;  
> 
> I believe the original code was more readable, and it had only 1
> more line than this version. i.e.:
> 
>     for (i = 0; i < possible_cpus->len; i++) {
>         if (possible_cpus->cpus[i].props.has_node_id) {
>             break;
>         }
>     }
>     default_mapping = (i == possible_cpus->len);
ok, I'll do it this way

> 
> > +    default_mapping = !i; /* i == 0 : no explicit mapping provided by user */
> > +
> >      for (i = 0; i < possible_cpus->len; i++) {
> >          const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
> >  
> > -        /* at this point numa mappings are initilized by CLI options
> > -         * or with default mappings so it's sufficient to list
> > -         * all not yet mapped CPUs here */
> > -        /* TODO: make it hard error in future */  
> 
> Did we change our mind about making it a hard error in the
> future?
nope, error message at the end of function says that partial mapping
is obsoleted and will be removed. I've thought that's was sufficient
reminder for us of what needs to be removed.
I'll move TODO to:

+            } else {
+                /* record slots with not set mapping */
++               /* TODO: make it hard error in future */ 
+                char *cpu_str = cpu_slot_to_string(cpu_slot);
+                g_string_append_printf(s, "%sCPU %d [%s]",

> 
> >          if (!cpu_slot->props.has_node_id) {
> > -            char *cpu_str = cpu_slot_to_string(cpu_slot);
> > -            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
> > -                                   cpu_str);
> > -            g_free(cpu_str);
> > +            if (default_mapping) {
> > +                /* fetch default mapping from board and enable it */
> > +                CpuInstanceProperties props = cpu_slot->props;
> > +                props.has_node_id = true;
> > +                machine_set_cpu_numa_node(machine, &props, &error_fatal);  
> 
> Is a machine_set_cpu_numa_node() call really necessary here, if
> we are already looking at cpu_slot->props directly?
yes, it's necessary as cpu_slot comes from:
   const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
callback, which initializes machine::possible_cpus if necessary.

So cpu_slot is readonly and I'd prefer to keep mc->possible_cpu_arch_ids()
returning 'const' as it's used by external callers and they shouldn't
mess with possible_cpus content by accident.

usage of machine_set_cpu_numa_node() adds +2 more lines and it's
proper/validating setter for node_id and will catch
mistakes if we make them in the code.
So I wouldn't use shortcuts here to save 2 lines.

 
> > +            } else {
> > +                /* record slots with not set mapping */
> > +                char *cpu_str = cpu_slot_to_string(cpu_slot);
> > +                g_string_append_printf(s, "%sCPU %d [%s]",
> > +                                       s->len ? ", " : "", i, cpu_str);
> > +                g_free(cpu_str);
> > +            }
> >          }  
> 
> What about doing this instead:
> 
>         if (default_mapping) {
>             /*
>              * Default mapping was already set by board at
>              * cpu_slot->props.node_id, just enable it
>              */
>             cpu_slot->props.has_node_id = true;
>         } else if (!cpu_slot->props.has_node_id) {
>             char *cpu_str = cpu_slot_to_string(cpu_slot);
>             g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
>                                    cpu_str);
>             g_free(cpu_str);
>         }
