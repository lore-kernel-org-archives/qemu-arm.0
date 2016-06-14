Received: by 10.25.21.96 with SMTP id l93csp270160lfi;
        Tue, 14 Jun 2016 14:54:38 -0700 (PDT)
X-Received: by 10.55.148.130 with SMTP id w124mr23133597qkd.203.1465941278853;
        Tue, 14 Jun 2016 14:54:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s201si19775500qke.179.2016.06.14.14.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 14:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCwIA-0004c5-8g
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 17:54:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCwCN-0007TE-7v
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 17:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCwCL-0002lB-4p
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 17:48:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60513)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bCwCE-0002h0-Dz; Tue, 14 Jun 2016 17:48:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E84056E798;
	Tue, 14 Jun 2016 21:48:29 +0000 (UTC)
Received: from localhost (vpn1-7-151.gru2.redhat.com [10.97.7.151])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5ELmSci031588; Tue, 14 Jun 2016 17:48:29 -0400
Date: Tue, 14 Jun 2016 18:48:27 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160614214827.GE18662@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-5-git-send-email-imammedo@redhat.com>
	<20160614194718.GJ17952@thinpad.lan.raisama.net>
	<1646409152.22421731.1465940463160.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646409152.22421731.1465940463160.JavaMail.zimbra@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 14 Jun 2016 21:48:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Handling errors caused by -global (was Re: [PATCH
 v2 4/6] cpu: use CPUClass->parse_features() as convertor to global
 properties)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter maydell <peter.maydell@linaro.org>,
	mark cave-ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	blauwirbel@gmail.com, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2X6kCubqbnvY
Message-ID: <20160614214827.8dANqyLEfkklKOWqqJAgJws9wn1HUV7CHQu6RrMg9ek@z>

On Tue, Jun 14, 2016 at 05:41:03PM -0400, Paolo Bonzini wrote:
> 
> 
> ----- Original Message -----
> > From: "Eduardo Habkost" <ehabkost@redhat.com>
> > To: "Igor Mammedov" <imammedo@redhat.com>
> > Cc: qemu-devel@nongnu.org, "peter maydell" <peter.maydell@linaro.org>, "mark cave-ayland"
> > <mark.cave-ayland@ilande.co.uk>, blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net,
> > "Markus Armbruster" <armbru@redhat.com>
> > Sent: Tuesday, June 14, 2016 9:47:18 PM
> > Subject: Handling errors caused by -global (was Re: [Qemu-devel] [PATCH v2 4/6] cpu: use CPUClass->parse_features()
> > as convertor to global properties)
> > 
> > On Thu, Jun 09, 2016 at 07:11:01PM +0200, Igor Mammedov wrote:
> > [...]
> > > -static void cpu_common_parse_features(CPUState *cpu, char *features,
> > > +static void cpu_common_parse_features(const char *typename, char
> > > *features,
> > >                                        Error **errp)
> > >  {
> > >      char *featurestr; /* Single "key=value" string being parsed */
> > >      char *val;
> > > -    Error *err = NULL;
> > > +    static bool cpu_globals_initialized;
> > > +
> > > +    /* TODO: all callers of ->parse_features() need to be changed to
> > > +     * call it only once, so we can remove this check (or change it
> > > +     * to assert(!cpu_globals_initialized).
> > > +     * Current callers of ->parse_features() are:
> > > +     * - machvirt_init()
> > > +     * - cpu_generic_init()
> > > +     * - cpu_x86_create()
> > > +     */
> > > +    if (cpu_globals_initialized) {
> > > +        return;
> > > +    }
> > > +    cpu_globals_initialized = true;
> > >  
> > >      featurestr = features ? strtok(features, ",") : NULL;
> > >  
> > >      while (featurestr) {
> > >          val = strchr(featurestr, '=');
> > >          if (val) {
> > > +            GlobalProperty *prop = g_new0(typeof(*prop), 1);
> > >              *val = 0;
> > >              val++;
> > > -            object_property_parse(OBJECT(cpu), val, featurestr, &err);
> > > -            if (err) {
> > > -                error_propagate(errp, err);
> > > -                return;
> > > -            }
> > > +            prop->driver = typename;
> > > +            prop->property = g_strdup(featurestr);
> > > +            prop->value = g_strdup(val);
> > > +            qdev_prop_register_global(prop);
> > 
> > This allows the user to trigger an assert:
> > 
> >   $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
> >   qemu-system-x86_64: hw/core/qdev-properties.c:1087:
> >   qdev_prop_set_globals_for_type: Assertion `prop->user_provided' failed.
> >   Aborted (core dumped)
> > 
> > but even if we fix the assert by setting
> > prop->user_provided=true, we have a problem. Previous behavior
> > was:
> > 
> >   $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
> >   qemu-system-x86_64: Property '.INVALID' not found
> >   $
> > 
> > after this patch, and setting prop->user_provided=true, we have:
> > 
> >   $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
> >   qemu-system-x86_64: Warning: global qemu64-x86_64-cpu.INVALID=on ignored:
> >   Property '.INVALID' not found
> >   [QEMU keeps running]
> > 
> > QEMU needs to refuse to run if an invalid property is specified
> > on -cpu. It is an important mechanism to prevent VMs from running
> > if the user is requesting for a unsupported feature that requires
> > newer QEMU.
> > 
> > Any suggestions on how to fix that?
> 
> Replace user_provided with a Error* argument to qdev_prop_register_global.
> It can be &error_abort and NULL for the current users of the function,
> while -cpu can use &error_fatal.

Brilliant. This should work.

-- 
Eduardo
