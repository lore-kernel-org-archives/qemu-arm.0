Received: by 10.25.21.96 with SMTP id l93csp272058lfi;
        Tue, 14 Jun 2016 15:01:41 -0700 (PDT)
X-Received: by 10.140.25.150 with SMTP id 22mr22054337qgt.34.1465941701862;
        Tue, 14 Jun 2016 15:01:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si3201002qgp.106.2016.06.14.15.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 15:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCwOz-0003JV-6V
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 18:01:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCw5J-0000AG-8n
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 17:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCw5E-00012O-AO
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 17:41:20 -0400
Received: from mx6-phx2.redhat.com ([209.132.183.39]:37013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCw5E-00012F-1t; Tue, 14 Jun 2016 17:41:16 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5ELf3Gg000983;
	Tue, 14 Jun 2016 17:41:03 -0400
Date: Tue, 14 Jun 2016 17:41:03 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <1646409152.22421731.1465940463160.JavaMail.zimbra@redhat.com>
In-Reply-To: <20160614194718.GJ17952@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-5-git-send-email-imammedo@redhat.com>
	<20160614194718.GJ17952@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.100.50]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF46 (Linux)/8.0.6_GA_5922)
Thread-Topic: Handling errors caused by -global (was Re: [Qemu-devel] [PATCH
	v2 4/6] cpu: use CPUClass->parse_features() as convertor to
	global properties)
Thread-Index: kkGHxHDlJpaGgN9LjF0cD1SaHkzt4A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
Subject: Re: [Qemu-arm] Handling errors caused by -global (was Re:
 [Qemu-devel] [PATCH v2 4/6] cpu: use CPUClass->parse_features() as
 convertor to global properties)
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
Cc: peter maydell <peter.maydell@linaro.org>,
	mark cave-ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	blauwirbel@gmail.com, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c/f/McDia0Ta



----- Original Message -----
> From: "Eduardo Habkost" <ehabkost@redhat.com>
> To: "Igor Mammedov" <imammedo@redhat.com>
> Cc: qemu-devel@nongnu.org, "peter maydell" <peter.maydell@linaro.org>, "mark cave-ayland"
> <mark.cave-ayland@ilande.co.uk>, blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net,
> "Markus Armbruster" <armbru@redhat.com>
> Sent: Tuesday, June 14, 2016 9:47:18 PM
> Subject: Handling errors caused by -global (was Re: [Qemu-devel] [PATCH v2 4/6] cpu: use CPUClass->parse_features()
> as convertor to global properties)
> 
> On Thu, Jun 09, 2016 at 07:11:01PM +0200, Igor Mammedov wrote:
> [...]
> > -static void cpu_common_parse_features(CPUState *cpu, char *features,
> > +static void cpu_common_parse_features(const char *typename, char
> > *features,
> >                                        Error **errp)
> >  {
> >      char *featurestr; /* Single "key=value" string being parsed */
> >      char *val;
> > -    Error *err = NULL;
> > +    static bool cpu_globals_initialized;
> > +
> > +    /* TODO: all callers of ->parse_features() need to be changed to
> > +     * call it only once, so we can remove this check (or change it
> > +     * to assert(!cpu_globals_initialized).
> > +     * Current callers of ->parse_features() are:
> > +     * - machvirt_init()
> > +     * - cpu_generic_init()
> > +     * - cpu_x86_create()
> > +     */
> > +    if (cpu_globals_initialized) {
> > +        return;
> > +    }
> > +    cpu_globals_initialized = true;
> >  
> >      featurestr = features ? strtok(features, ",") : NULL;
> >  
> >      while (featurestr) {
> >          val = strchr(featurestr, '=');
> >          if (val) {
> > +            GlobalProperty *prop = g_new0(typeof(*prop), 1);
> >              *val = 0;
> >              val++;
> > -            object_property_parse(OBJECT(cpu), val, featurestr, &err);
> > -            if (err) {
> > -                error_propagate(errp, err);
> > -                return;
> > -            }
> > +            prop->driver = typename;
> > +            prop->property = g_strdup(featurestr);
> > +            prop->value = g_strdup(val);
> > +            qdev_prop_register_global(prop);
> 
> This allows the user to trigger an assert:
> 
>   $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
>   qemu-system-x86_64: hw/core/qdev-properties.c:1087:
>   qdev_prop_set_globals_for_type: Assertion `prop->user_provided' failed.
>   Aborted (core dumped)
> 
> but even if we fix the assert by setting
> prop->user_provided=true, we have a problem. Previous behavior
> was:
> 
>   $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
>   qemu-system-x86_64: Property '.INVALID' not found
>   $
> 
> after this patch, and setting prop->user_provided=true, we have:
> 
>   $ ./x86_64-softmmu/qemu-system-x86_64 -cpu qemu64,INVALID=on
>   qemu-system-x86_64: Warning: global qemu64-x86_64-cpu.INVALID=on ignored:
>   Property '.INVALID' not found
>   [QEMU keeps running]
> 
> QEMU needs to refuse to run if an invalid property is specified
> on -cpu. It is an important mechanism to prevent VMs from running
> if the user is requesting for a unsupported feature that requires
> newer QEMU.
> 
> Any suggestions on how to fix that?

Replace user_provided with a Error* argument to qdev_prop_register_global.
It can be &error_abort and NULL for the current users of the function,
while -cpu can use &error_fatal.

Paolo

> Maybe qdev_prop_set_globals() can collect errors in a list in
> DeviceState, and we can check for them in code that creates
> device objects (like cpu_generic_init(), qdev_device_add()), or
> in the beginning of device_set_realized().
> 
> --
> Eduardo
> 
