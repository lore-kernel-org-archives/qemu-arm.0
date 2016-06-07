Received: by 10.25.27.66 with SMTP id b63csp2068061lfb;
        Tue, 7 Jun 2016 08:26:16 -0700 (PDT)
X-Received: by 10.200.55.219 with SMTP id e27mr2954968qtc.93.1465313175915;
        Tue, 07 Jun 2016 08:26:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e60si15443820qtb.46.2016.06.07.08.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 08:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAItT-0008EG-AP
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 11:26:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAIl8-0008UU-WB
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 11:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAIl3-0004eM-4B
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 11:17:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bAIl2-0004e1-SV; Tue, 07 Jun 2016 11:17:33 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA57964D0F;
	Tue,  7 Jun 2016 15:17:31 +0000 (UTC)
Received: from localhost (vpn1-7-78.gru2.redhat.com [10.97.7.78])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57FHU0a029895; Tue, 7 Jun 2016 11:17:30 -0400
Date: Tue, 7 Jun 2016 12:17:29 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160607151729.GJ19055@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-7-git-send-email-imammedo@redhat.com>
	<934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
	<20160607143244.2d4ddb81@nial.brq.redhat.com>
	<5d059ff5-dadb-8f90-deb0-b864bb50ee87@redhat.com>
	<20160607145400.3dcf78b8@nial.brq.redhat.com>
	<78c0ee46-b787-e84e-45f4-d98b7b25b9a8@redhat.com>
	<20160607152658.4221ff0d@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160607152658.4221ff0d@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 07 Jun 2016 15:17:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 06/10] target-i386: print obsolete warnings
 if +-features are used
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
	Paolo Bonzini <pbonzini@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iHayoDVvfjLr

On Tue, Jun 07, 2016 at 03:26:58PM +0200, Igor Mammedov wrote:
> On Tue, 7 Jun 2016 15:00:04 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > On 07/06/2016 14:54, Igor Mammedov wrote:
> > > On Tue, 7 Jun 2016 14:36:51 +0200
> > > Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >   
> > >> On 07/06/2016 14:32, Igor Mammedov wrote:  
> > >>>>> Could you detect using +foo together with foo=off, and -foo together
> > >>>>> with foo=on?  Those are the really problematic cases, without them +foo
> > >>>>> and -foo can become synonyms for =on and =off.    
> > >>> That's (legacy)current semantic of -cpu +-foo where it overrides any foo=x,
> > >>> potentially it's possible to track foo=x locally in parser
> > >>> and then compare with +-foo both ways.
> > >>> But all we can do currently is to print warning about such use case.
> > >>>
> > >>> I think Eduardo's suggestion to just warn that +-foo is obsolete for now
> > >>> and drop support for it in several releases is sufficient(good) enough.    
> > >>
> > >> kvm-unit-tests and libvirt both use it, especially because =on and =off
> > >> are relatively new I think?  It seems like it's really widespread.  
> > > 
> > > Yep, that's why it's not removed now.
> > > Looks like libvirt would be able to switch to foo=x syntax,
> > > I can take a look at kvm-unit-tests and make it use foo=x too.  
> > 
> > And all tutorials, and all scripts.  It's really too hard.
> > 
> > I'd really prefer to make an incompatible change straight in 2.7 for the
> > case of mixed foo=x and [+-]foo.
> I've tried to make a bit more extreme incompatible change starting from 2.7
> machine type in RFC (i.e. allow only foo=x syntax).

kvm-unit-tests would be another reason to not disable it
unconditionally on pc-2.7, as it uses the default machine-type.

> But Eduardo prefers to keep current +-foo, just marking it obsolete
> so that users would have time to adapt before support for legacy +-foo
> is dropped.
> 
> Anyways, we can introduce "mixed foo=x and [+-]foo" check on top of
> this series with warning and probably switch to fail later so not
> break existing users without giving them time to adapt.

We could make it fail in the case of mixing +foo and foo=x, but
we would need to be careful to not break existing valid cases
(like "vendor=AuthenticAMD,+foo", or "+foo,pmu=on". The code that
handles "foo=x" doesn't know if the property is a feature flag or
not. I'm not sure the extra code complexity is worth it.

If we plan to to be stuck with the "[+-]foo" code forever (I am
not completely against keeping it), why not just let people mix
it with the new format? I don't see the point of making the code
more convoluted just to prevent people from mixing both.

If we don't plan to keep the [+-]foo code forever, then let's
start printing a warning as soon as possible.

(Note that I am not talking about the weird "-foo,+foo" ordering
semantics. That's something else we need to warn about and
eventually obsolete.)

-- 
Eduardo
