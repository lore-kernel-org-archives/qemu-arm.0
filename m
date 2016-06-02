Received: by 10.25.27.66 with SMTP id b63csp813896lfb;
        Thu, 2 Jun 2016 09:57:09 -0700 (PDT)
X-Received: by 10.55.167.133 with SMTP id q127mr22692057qke.95.1464886629889;
        Thu, 02 Jun 2016 09:57:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k97si10476249qgk.40.2016.06.02.09.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 09:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Vvh-0005hq-7k
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 12:57:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8Vvc-0005ek-9f
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:57:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8VvY-0006UP-1m
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:57:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8VvX-0006UD-Pn; Thu, 02 Jun 2016 12:56:59 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41D29A1429;
	Thu,  2 Jun 2016 16:56:59 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52Guv7M032467; Thu, 2 Jun 2016 12:56:57 -0400
Date: Thu, 2 Jun 2016 18:56:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602185655.20d7c7e0@nial.brq.redhat.com>
In-Reply-To: <20160602143826.GD19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
	<20160601174309.GA13503@thinpad.lan.raisama.net>
	<20160602115930.6945e5d6@igors-macbook-pro.local>
	<20160602143826.GD19055@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 02 Jun 2016 16:56:59 +0000 (UTC)
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
X-TUID: M+wix+6KX2EU

On Thu, 2 Jun 2016 11:38:26 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Jun 02, 2016 at 11:59:30AM +0200, Igor Mammedov wrote:
> > On Wed, 1 Jun 2016 14:43:09 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > [...]
> >   
> > > > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > > > index 3fbc6f3..6159a7f 100644
> > > > --- a/target-i386/cpu.c
> > > > +++ b/target-i386/cpu.c
> > > > @@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
> > > >      }
> > > >  }
> > > >  
> > > > +/* Features to be added */  
> > > 
> > > Please add something like "Features to be added. Will be replaced
> > > by global variables in the future".
> > >   
> > > > +static FeatureWordArray plus_features = { 0 };
> > > > +/* Features to be removed */
> > > > +static FeatureWordArray minus_features = { 0 };
> > > > +  
> > > 
> > > I see that this hack is replaced by the following patches, but is
> > > there an easy way to remove the CPUState argument from
> > > x86_cpu_parse_featurestr() before we introduce these static
> > > variables? (No problem if there's no way to do that, as long as
> > > the static variables are explicitly documented as a temporary
> > > hack)  
> > It's hack to keep legacy +- semantic (i.e. it overrides feat1=x,feat2)
> > local to x86 that probably would stay here forever.
> > I should add comment that explains why +- can't be replaced
> > with normal properties.  
> 
> Oh, I assumed it would be temporary. In that case, I would like
> to avoid adding the static variables if possible.
> 
> > 
> > I don't plan to replace plus/minus_features with anything nor to
> > make this variables a global ones to spread +- x86/sparc legacy
> > format everywhere.  
> 
> Can't the +/- semantics be emulated by simply registering
> plus_features/minus_features after the other global properties
> are registered inside x86_cpu_parse_featurestr()?
it could be done, at the first glance it will take 2 extra parsing passes

1: copy featurestr, parse feat=x,feat
2: copy featurestr, parse +feat
3: copy featurestr, parse -feat

but that probably will complicate way to disable +-feat handling in future,
with current static vars it's just a matter of specifying compat-prop
for X86CPU driver in appropriate machine type.
So I'd leave it as is unless you insist on doing it like you suggested above.
 
> >  
> > What I would do though before enabling -device/device_add for X86CPU is
> > to disable +- handling for new machine types so that CPUs would
> > follow generic property semantic of device used everywhere else.  
> 
> We can't do that unless we give libvirt (and users that have
> their own scripts) time to adapt to the new syntax
leaving it enabled will lead to mixed semantics in combination
with device_add that will be even more confusing to users
if users will use both:
 for example: -cpu cpu,-featx and -device cpu,featx=on
That's why I'm suggesting to make a clean break in new machine
type with error saying to replace legacy +-feat with canonical one.
For old machine types nothing would break as it would still use
legacy syntax and legacy cpu-add, with device_add disabled.

We probably can fix libvirt in sync with this QEMU release
if it still uses +- syntax.

> (and we warn users that newer QEMU versions will require newer libvirt).
yep we should do it in release notes.
