Received: by 10.25.27.66 with SMTP id b63csp619882lfb;
        Thu, 2 Jun 2016 03:05:10 -0700 (PDT)
X-Received: by 10.140.197.215 with SMTP id s206mr7317734qha.37.1464861910466;
        Thu, 02 Jun 2016 03:05:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si24119061qgo.49.2016.06.02.03.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 03:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8PUz-0007VD-UI
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 06:05:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8PSb-0005aa-Ow
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 06:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8PSW-0000s4-GT
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 06:02:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8PSW-0000ro-BY; Thu, 02 Jun 2016 06:02:36 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EC75709C1;
	Thu,  2 Jun 2016 10:02:35 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-100.brq.redhat.com
	[10.40.204.100])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52A2WPx007244; Thu, 2 Jun 2016 06:02:33 -0400
Date: Thu, 2 Jun 2016 12:02:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602120229.240bb47f@igors-macbook-pro.local>
In-Reply-To: <20160601174651.GB13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-3-git-send-email-imammedo@redhat.com>
	<20160601174651.GB13503@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 02 Jun 2016 10:02:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 2/8] target-i386: cpu: move
 xcc->kvm_required check to reaize time
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
X-TUID: MkpZTmNUm+4Z

On Wed, 1 Jun 2016 14:46:51 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Jun 01, 2016 at 06:37:24PM +0200, Igor Mammedov wrote:
> > it will allow to drop custom cpu_x86_init() and use
> > cpu_generic_init() instead reducing cpu_x86_create()
> > to a simple 3-liner.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> Nice, it also gets us closer to finally making X86CPU
> qmp_device_list_properties()-safe. Only one request:
> 
> > ---
> >  target-i386/cpu.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > index 6159a7f..c31afc7 100644
> > --- a/target-i386/cpu.c
> > +++ b/target-i386/cpu.c
> > @@ -2200,7 +2200,6 @@ static void x86_cpu_load_def(X86CPU *cpu,
> > X86CPUDefinition *def, Error **errp) X86CPU *cpu_x86_create(const
> > char *cpu_model, Error **errp) {
> >      X86CPU *cpu = NULL;
> > -    X86CPUClass *xcc;
> >      ObjectClass *oc;
> >      gchar **model_pieces;
> >      char *name, *features;
> > @@ -2219,12 +2218,6 @@ X86CPU *cpu_x86_create(const char
> > *cpu_model, Error **errp) error_setg(&error, "Unable to find CPU
> > definition: %s", name); goto out;
> >      }
> > -    xcc = X86_CPU_CLASS(oc);
> > -
> > -    if (xcc->kvm_required && !kvm_enabled()) {
> > -        error_setg(&error, "CPU model '%s' requires KVM", name);
> > -        goto out;
> > -    }
> >  
> >      cpu = X86_CPU(object_new(object_class_get_name(oc)));
> >  
> > @@ -2901,6 +2894,13 @@ static void x86_cpu_realizefn(DeviceState
> > *dev, Error **errp) static bool ht_warned;
> >      FeatureWord w;
> >  
> > +    if (xcc->kvm_required && !kvm_enabled()) {
> > +        char *name = g_strdup(object_get_typename(OBJECT(dev)));
> > +        *strstr(name, X86_CPU_TYPE_SUFFIX) = 0;
> 
> I am not sure if I actually like this trick, but in either case
> please use x86_cpu_class_get_model_name().
thanks for pointing out that x86_cpu_class_get_model_name() exists.

> 
> > +        error_setg(&local_err, "CPU model '%s' requires KVM",
> > name);
> > +        goto out;
> > +    }
> > +
> >      if (cpu->apic_id < 0) {
> >          error_setg(errp, "apic-id property was not initialized
> > properly"); return;
> > -- 
> > 1.8.3.1
> > 
> 

