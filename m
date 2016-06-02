Received: by 10.25.27.66 with SMTP id b63csp747567lfb;
        Thu, 2 Jun 2016 07:38:42 -0700 (PDT)
X-Received: by 10.140.97.136 with SMTP id m8mr41195423qge.1.1464878322783;
        Thu, 02 Jun 2016 07:38:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t25si513111qtc.117.2016.06.02.07.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 07:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Tli-00036b-8D
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 10:38:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8Tlb-00034n-0H
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 10:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8TlV-0004qY-Nh
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 10:38:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8TlV-0004qM-I1; Thu, 02 Jun 2016 10:38:29 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F69064D0F;
	Thu,  2 Jun 2016 14:38:28 +0000 (UTC)
Received: from localhost (vpn1-7-10.gru2.redhat.com [10.97.7.10])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52EcRsl014688; Thu, 2 Jun 2016 10:38:28 -0400
Date: Thu, 2 Jun 2016 11:38:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160602143826.GD19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
	<20160601174309.GA13503@thinpad.lan.raisama.net>
	<20160602115930.6945e5d6@igors-macbook-pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160602115930.6945e5d6@igors-macbook-pro.local>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 02 Jun 2016 14:38:29 +0000 (UTC)
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
X-TUID: qvGa/gy4dw/G

On Thu, Jun 02, 2016 at 11:59:30AM +0200, Igor Mammedov wrote:
> On Wed, 1 Jun 2016 14:43:09 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> [...]
> 
> > > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > > index 3fbc6f3..6159a7f 100644
> > > --- a/target-i386/cpu.c
> > > +++ b/target-i386/cpu.c
> > > @@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
> > >      }
> > >  }
> > >  
> > > +/* Features to be added */
> > 
> > Please add something like "Features to be added. Will be replaced
> > by global variables in the future".
> > 
> > > +static FeatureWordArray plus_features = { 0 };
> > > +/* Features to be removed */
> > > +static FeatureWordArray minus_features = { 0 };
> > > +
> > 
> > I see that this hack is replaced by the following patches, but is
> > there an easy way to remove the CPUState argument from
> > x86_cpu_parse_featurestr() before we introduce these static
> > variables? (No problem if there's no way to do that, as long as
> > the static variables are explicitly documented as a temporary
> > hack)
> It's hack to keep legacy +- semantic (i.e. it overrides feat1=x,feat2)
> local to x86 that probably would stay here forever.
> I should add comment that explains why +- can't be replaced
> with normal properties.

Oh, I assumed it would be temporary. In that case, I would like
to avoid adding the static variables if possible.

> 
> I don't plan to replace plus/minus_features with anything nor to
> make this variables a global ones to spread +- x86/sparc legacy
> format everywhere.

Can't the +/- semantics be emulated by simply registering
plus_features/minus_features after the other global properties
are registered inside x86_cpu_parse_featurestr()?

>  
> What I would do though before enabling -device/device_add for X86CPU is
> to disable +- handling for new machine types so that CPUs would
> follow generic property semantic of device used everywhere else.

We can't do that unless we give libvirt (and users that have
their own scripts) time to adapt to the new syntax (and we warn
users that newer QEMU versions will require newer libvirt).

-- 
Eduardo
