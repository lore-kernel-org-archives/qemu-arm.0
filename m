Received: by 10.25.27.66 with SMTP id b63csp772419lfb;
        Sat, 4 Jun 2016 09:45:12 -0700 (PDT)
X-Received: by 10.55.133.134 with SMTP id h128mr467563qkd.112.1465058712129;
        Sat, 04 Jun 2016 09:45:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u38si718535qgd.82.2016.06.04.09.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 09:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9EhD-000334-Hh
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 12:45:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9EhA-0002yK-9P
	for qemu-arm@nongnu.org; Sat, 04 Jun 2016 12:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9Eh6-0005tL-6q
	for qemu-arm@nongnu.org; Sat, 04 Jun 2016 12:45:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9Eh5-0005tA-UO; Sat, 04 Jun 2016 12:45:04 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD6CA8B135;
	Sat,  4 Jun 2016 16:45:02 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u54GixHx004332; Sat, 4 Jun 2016 12:45:00 -0400
Date: Sat, 4 Jun 2016 18:44:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160604184459.4749f961@nial.brq.redhat.com>
In-Reply-To: <20160603192622.GX19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
	<20160601174309.GA13503@thinpad.lan.raisama.net>
	<20160602115930.6945e5d6@igors-macbook-pro.local>
	<20160602143826.GD19055@thinpad.lan.raisama.net>
	<20160602185655.20d7c7e0@nial.brq.redhat.com>
	<20160602173427.GI19055@thinpad.lan.raisama.net>
	<20160603121318.7e4b625d@nial.brq.redhat.com>
	<20160603192622.GX19055@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 04 Jun 2016 16:45:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/8] target-i386: cpu: move
 features logic that requires CPUState to realize time
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
X-TUID: VJ2FRbaJfv6E

On Fri, 3 Jun 2016 16:26:22 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Fri, Jun 03, 2016 at 12:13:18PM +0200, Igor Mammedov wrote:
> > On Thu, 2 Jun 2016 14:34:27 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > On Thu, Jun 02, 2016 at 06:56:55PM +0200, Igor Mammedov wrote:  
> > > > On Thu, 2 Jun 2016 11:38:26 -0300
> > > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > >     
> > > > > On Thu, Jun 02, 2016 at 11:59:30AM +0200, Igor Mammedov wrote:    
> > > > > > On Wed, 1 Jun 2016 14:43:09 -0300
> > > > > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > > > [...]
> > > > > >       
> > > > > > > > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > > > > > > > index 3fbc6f3..6159a7f 100644
> > > > > > > > --- a/target-i386/cpu.c
> > > > > > > > +++ b/target-i386/cpu.c
> > > > > > > > @@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
> > > > > > > >      }
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > +/* Features to be added */      
> > > > > > > 
> > > > > > > Please add something like "Features to be added. Will be replaced
> > > > > > > by global variables in the future".
> > > > > > >       
> > > > > > > > +static FeatureWordArray plus_features = { 0 };
> > > > > > > > +/* Features to be removed */
> > > > > > > > +static FeatureWordArray minus_features = { 0 };
> > > > > > > > +      
> > > > > > > 
> > > > > > > I see that this hack is replaced by the following patches, but is
> > > > > > > there an easy way to remove the CPUState argument from
> > > > > > > x86_cpu_parse_featurestr() before we introduce these static
> > > > > > > variables? (No problem if there's no way to do that, as long as
> > > > > > > the static variables are explicitly documented as a temporary
> > > > > > > hack)      
> > > > > > It's hack to keep legacy +- semantic (i.e. it overrides feat1=x,feat2)
> > > > > > local to x86 that probably would stay here forever.
> > > > > > I should add comment that explains why +- can't be replaced
> > > > > > with normal properties.      
> > > > > 
> > > > > Oh, I assumed it would be temporary. In that case, I would like
> > > > > to avoid adding the static variables if possible.
> > > > >     
> > > > > > 
> > > > > > I don't plan to replace plus/minus_features with anything nor to
> > > > > > make this variables a global ones to spread +- x86/sparc legacy
> > > > > > format everywhere.      
> > > > > 
> > > > > Can't the +/- semantics be emulated by simply registering
> > > > > plus_features/minus_features after the other global properties
> > > > > are registered inside x86_cpu_parse_featurestr()?    
> > > > it could be done, at the first glance it will take 2 extra parsing passes
> > > > 
> > > > 1: copy featurestr, parse feat=x,feat
> > > > 2: copy featurestr, parse +feat
> > > > 3: copy featurestr, parse -feat    
> > > 
> > > Why? Can't we just replace plus_features and minus_features with
> > > two string lists (or a QDict), and make the corresponding
> > > object_property_parse()/qdev_prop_register_global() calls after
> > > the main parsing loop?
> > > 
> > > (Didn't you do that in your old "target-i386: set [+-]feature
> > > using static properties" patch?)  
> > It doesn't look like it will work due to broken 4d1b279b0 as
> > plus_features/minus_features are applied after:
> > 
> >     if (cpu->host_features) {                                                    
> >         for (w = 0; w < FEATURE_WORDS; w++) {                                    
> >             env->features[w] =                                                   
> >                 x86_cpu_get_supported_feature_word(w, cpu->migratable);          
> >         }                                                                        
> >     }
> > 
> > and with above moving to realize(), +-feats would be overwritten by it.
> > Lets temporary use static variables as in this patch so not to delay
> > series on not related fixes. And deal with it when 4d1b279b0 is fixed.
> > 
> > 1 way to deal with it is to wait several releases till users fix their
> > +-feats CLIs and then just drop it.  
> 
> We can fix that after getting rid the host_features hack (and
> also fix the "-cpu host,foo=off,foo=on" bug we already have).
> 
> In that case, I think we can live with the static variables
> temporarily in the meantime. Can you add a comment above the
> static variable declarations saying that they can't be replaced
> by globals yet because of the host_features hack?
Sure, thanks!

