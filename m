Received: by 10.103.124.15 with SMTP id x15csp1375101vsc;
        Mon, 22 May 2017 06:09:16 -0700 (PDT)
X-Received: by 10.159.34.145 with SMTP id 17mr11885538uan.42.1495458556510;
        Mon, 22 May 2017 06:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495458556; cv=none;
        d=google.com; s=arc-20160816;
        b=gp18O4fbDa6196a6p7u2vCFIDaMdTZk5uIV+p9/CTP5Tcn6SaQHAPAKJtI9/Yn14Az
         Ps9jqbVLSRzv4mI1gz0a+7AqhKXziIW0qlfp1jUoCCT4+bgTV1Cro5ah1K5NpIE9GjyG
         R1EczwzP6C/UDA6UZRsJa9PFzjOdkCnbBW7maZfHpZSf8if99yuI7bg7b17Kmny0DT2P
         aSedJOFzghayOeEQj4b3HvcWrjDns3onWOj1SDGb6yx1R6DYC4jVBQ21z8VEEoTbFwO8
         MU/mOVCEBAsL3xFILJ8r7pKqGQVxSNEPKJqonmuBO4bJOZYWFDf5aEYuy1lQxFWQntc6
         Wixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=QM7M9/+DZDoXaQKvKQgks/f8xjrG6MeOwQWdzKogLPI=;
        b=XxTdsYHJOLz4ZmAyXeiCKpdbR0x3IhDanwmhIAoA+y4xGg1k4haqMNNUlfa8IhGq0u
         LIuJ/+BUyYGn1I8Ip8h0x8mOpTMa8k4IpDRV6RC2b+Kpy/7k6kIqtRL3g8sQ/5s2W7Tn
         qVnDaS4kxCyu62//HZvv91l5pnCIPnUWDKCEEWu6zN+Bx7ihLJYdaxELKx8HTdtywlZu
         Kwedq48nHOGYGDymWkNN7yuzrDntl3aUuw/mxXieLnfd4UUVToCeejXWJmaY6PBQemy/
         OXIIObPjH0CWMFDsV092nEUaTrD+YX5gb9iL8Z+nI3TV0p26kj5SyYt2EgMlfEhDR+o6
         hdtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si6472445uab.93.2017.05.22.06.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 06:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCn5I-0008Jw-0w
	for alex.bennee@linaro.org; Mon, 22 May 2017 09:09:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dCn5D-0008IW-I8
	for qemu-arm@nongnu.org; Mon, 22 May 2017 09:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dCn59-0003TO-F6
	for qemu-arm@nongnu.org; Mon, 22 May 2017 09:09:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dCn59-0003TB-6w; Mon, 22 May 2017 09:09:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 825AB85A07;
	Mon, 22 May 2017 13:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 825AB85A07
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 825AB85A07
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7149783A0;
	Mon, 22 May 2017 13:09:01 +0000 (UTC)
Date: Mon, 22 May 2017 10:09:00 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170522130900.GB18350@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-3-git-send-email-imammedo@redhat.com>
	<20170518185058.GP4748@thinpad.lan.raisama.net>
	<20170522090403.4b284345@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170522090403.4b284345@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 22 May 2017 13:09:02 +0000 (UTC)
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
X-TUID: rSMTGPykNHWk

On Mon, May 22, 2017 at 09:04:03AM +0200, Igor Mammedov wrote:
> On Thu, 18 May 2017 15:50:58 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Thu, May 18, 2017 at 10:09:30AM +0200, Igor Mammedov wrote:
[...]
> > 
> > > +    default_mapping = !i; /* i == 0 : no explicit mapping provided by user */
> > > +
> > >      for (i = 0; i < possible_cpus->len; i++) {
> > >          const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
> > >  
> > > -        /* at this point numa mappings are initilized by CLI options
> > > -         * or with default mappings so it's sufficient to list
> > > -         * all not yet mapped CPUs here */
> > > -        /* TODO: make it hard error in future */  
> > 
> > Did we change our mind about making it a hard error in the
> > future?
> nope, error message at the end of function says that partial mapping
> is obsoleted and will be removed. I've thought that's was sufficient
> reminder for us of what needs to be removed.

Yes, it is sufficient. I just didn't notice the message. :)

> I'll move TODO to:
> 
> +            } else {
> +                /* record slots with not set mapping */
> ++               /* TODO: make it hard error in future */ 
> +                char *cpu_str = cpu_slot_to_string(cpu_slot);
> +                g_string_append_printf(s, "%sCPU %d [%s]",

I don't mind removing the TODO comment, so it's up to you.

> 
> > 
> > >          if (!cpu_slot->props.has_node_id) {
> > > -            char *cpu_str = cpu_slot_to_string(cpu_slot);
> > > -            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
> > > -                                   cpu_str);
> > > -            g_free(cpu_str);
> > > +            if (default_mapping) {
> > > +                /* fetch default mapping from board and enable it */
> > > +                CpuInstanceProperties props = cpu_slot->props;
> > > +                props.has_node_id = true;
> > > +                machine_set_cpu_numa_node(machine, &props, &error_fatal);  
> > 
> > Is a machine_set_cpu_numa_node() call really necessary here, if
> > we are already looking at cpu_slot->props directly?
> yes, it's necessary as cpu_slot comes from:
>    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
> callback, which initializes machine::possible_cpus if necessary.
> 
> So cpu_slot is readonly and I'd prefer to keep mc->possible_cpu_arch_ids()
> returning 'const' as it's used by external callers and they shouldn't
> mess with possible_cpus content by accident.
> 
> usage of machine_set_cpu_numa_node() adds +2 more lines and it's
> proper/validating setter for node_id and will catch
> mistakes if we make them in the code.
> So I wouldn't use shortcuts here to save 2 lines.

Oh, I didn't notice cpu_slot was const. That's OK to me.

> 
>  
> > > +            } else {
> > > +                /* record slots with not set mapping */
> > > +                char *cpu_str = cpu_slot_to_string(cpu_slot);
> > > +                g_string_append_printf(s, "%sCPU %d [%s]",
> > > +                                       s->len ? ", " : "", i, cpu_str);
> > > +                g_free(cpu_str);
> > > +            }
> > >          }  
> > 
> > What about doing this instead:
> > 
> >         if (default_mapping) {
> >             /*
> >              * Default mapping was already set by board at
> >              * cpu_slot->props.node_id, just enable it
> >              */
> >             cpu_slot->props.has_node_id = true;
> >         } else if (!cpu_slot->props.has_node_id) {
> >             char *cpu_str = cpu_slot_to_string(cpu_slot);
> >             g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
> >                                    cpu_str);
> >             g_free(cpu_str);
> >         }

-- 
Eduardo
