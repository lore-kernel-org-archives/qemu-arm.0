Received: by 10.25.27.66 with SMTP id b63csp850879lfb;
        Thu, 2 Jun 2016 11:23:54 -0700 (PDT)
X-Received: by 10.237.53.19 with SMTP id a19mr10721468qte.49.1464891834282;
        Thu, 02 Jun 2016 11:23:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l13si1113938qtl.80.2016.06.02.11.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 11:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8XHd-0007Js-Ng
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 14:23:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8XHZ-0007JV-Mo
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 14:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8XHU-0003g8-MA
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 14:23:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8XHU-0003g0-CC; Thu, 02 Jun 2016 14:23:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEFADC01C761;
	Thu,  2 Jun 2016 18:23:43 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-100.brq.redhat.com
	[10.40.204.100])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52INeCR021996; Thu, 2 Jun 2016 14:23:41 -0400
Date: Thu, 2 Jun 2016 20:23:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602202337.027428cc@igors-macbook-pro.local>
In-Reply-To: <20160602173427.GI19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
	<20160601174309.GA13503@thinpad.lan.raisama.net>
	<20160602115930.6945e5d6@igors-macbook-pro.local>
	<20160602143826.GD19055@thinpad.lan.raisama.net>
	<20160602185655.20d7c7e0@nial.brq.redhat.com>
	<20160602173427.GI19055@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 02 Jun 2016 18:23:43 +0000 (UTC)
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
X-TUID: zt/9SHONUnYg

On Thu, 2 Jun 2016 14:34:27 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Jun 02, 2016 at 06:56:55PM +0200, Igor Mammedov wrote:
> > On Thu, 2 Jun 2016 11:38:26 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > 
> > > On Thu, Jun 02, 2016 at 11:59:30AM +0200, Igor Mammedov wrote:
> > > > On Wed, 1 Jun 2016 14:43:09 -0300
> > > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > [...]
> > > >   
> > > > > > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > > > > > index 3fbc6f3..6159a7f 100644
> > > > > > --- a/target-i386/cpu.c
> > > > > > +++ b/target-i386/cpu.c
> > > > > > @@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
> > > > > >      }
> > > > > >  }
> > > > > >  
> > > > > > +/* Features to be added */  
> > > > > 
> > > > > Please add something like "Features to be added. Will be
> > > > > replaced by global variables in the future".
> > > > >   
> > > > > > +static FeatureWordArray plus_features = { 0 };
> > > > > > +/* Features to be removed */
> > > > > > +static FeatureWordArray minus_features = { 0 };
> > > > > > +  
> > > > > 
> > > > > I see that this hack is replaced by the following patches,
> > > > > but is there an easy way to remove the CPUState argument from
> > > > > x86_cpu_parse_featurestr() before we introduce these static
> > > > > variables? (No problem if there's no way to do that, as long
> > > > > as the static variables are explicitly documented as a
> > > > > temporary hack)  
> > > > It's hack to keep legacy +- semantic (i.e. it overrides
> > > > feat1=x,feat2) local to x86 that probably would stay here
> > > > forever. I should add comment that explains why +- can't be
> > > > replaced with normal properties.  
> > > 
> > > Oh, I assumed it would be temporary. In that case, I would like
> > > to avoid adding the static variables if possible.
> > > 
> > > > 
> > > > I don't plan to replace plus/minus_features with anything nor to
> > > > make this variables a global ones to spread +- x86/sparc legacy
> > > > format everywhere.  
> > > 
> > > Can't the +/- semantics be emulated by simply registering
> > > plus_features/minus_features after the other global properties
> > > are registered inside x86_cpu_parse_featurestr()?
> > it could be done, at the first glance it will take 2 extra parsing
> > passes
> > 
> > 1: copy featurestr, parse feat=x,feat
> > 2: copy featurestr, parse +feat
> > 3: copy featurestr, parse -feat
> 
> Why? Can't we just replace plus_features and minus_features with
> two string lists (or a QDict), and make the corresponding
> object_property_parse()/qdev_prop_register_global() calls after
> the main parsing loop?
> 
> (Didn't you do that in your old "target-i386: set [+-]feature
> using static properties" patch?)
ok, I'll do that.

> 
> > 
> > but that probably will complicate way to disable +-feat handling in
> > future, with current static vars it's just a matter of specifying
> > compat-prop for X86CPU driver in appropriate machine type.
> 
> I see. But I don't see why we need the extra machine-type cruft.
> 
> To me, the whole point of removing the old syntax is to make the
> code simpler. If we have to add even more code/complexity just to
> add a machine-type restriction (but keeping the old code there),
> I don't see the point.
> 
> I believe we should either: 1) remove it completely after people
> have time to update their scripts/libvirt; or 2) just keep it
> working on all machine-types, but print a warning every time
> people use the old syntax.
> 
> (I am not sure if we should do (1) without giving users a long
> time to adapt, so I suggest we do (2) by now)
> 
> 
> > So I'd leave it as is unless you insist on doing it like you
> > suggested above. 
> > > >  
> > > > What I would do though before enabling -device/device_add for
> > > > X86CPU is to disable +- handling for new machine types so that
> > > > CPUs would follow generic property semantic of device used
> > > > everywhere else.  
> > > 
> > > We can't do that unless we give libvirt (and users that have
> > > their own scripts) time to adapt to the new syntax
> > leaving it enabled will lead to mixed semantics in combination
> > with device_add that will be even more confusing to users
> > if users will use both:
> >  for example: -cpu cpu,-featx and -device cpu,featx=on
> > That's why I'm suggesting to make a clean break in new machine
> > type with error saying to replace legacy +-feat with canonical one.
> > For old machine types nothing would break as it would still use
> > legacy syntax and legacy cpu-add, with device_add disabled.
> 
> Just warn users very clearly, if they use the old syntax. If they
> insist in using it, they shouldn't blame us if they get confused.
> 
> > 
> > We probably can fix libvirt in sync with this QEMU release
> > if it still uses +- syntax.
> 
> I would wait for at least 1 or 2 libvirt releases before removing
> support.
> 
> But as I said above: if we are not deleting any code (and are
> adding extra code instead), I don't see the point of forcibly
> disabling it. We can just leave it there and print a warning.
ok, lets go with warning, saying"

"[+-]feature syntax is obsoleted and will be removed in future,
it's recommended to use canonical property syntax 'feature=value'"

> 
> > 
> > > (and we warn users that newer QEMU versions will require newer
> > > libvirt).
> > yep we should do it in release notes.


