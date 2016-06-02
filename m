Received: by 10.25.27.66 with SMTP id b63csp858616lfb;
        Thu, 2 Jun 2016 11:43:29 -0700 (PDT)
X-Received: by 10.237.58.137 with SMTP id o9mr3085985qte.83.1464893008054;
        Thu, 02 Jun 2016 11:43:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x14si38589qkb.231.2016.06.02.11.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 11:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8XaZ-0000oT-EA
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 14:43:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8XaU-0000lO-JR
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 14:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8XaP-000876-Iw
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 14:43:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8XaP-000872-CW; Thu, 02 Jun 2016 14:43:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52623C00DE14;
	Thu,  2 Jun 2016 18:43:16 +0000 (UTC)
Received: from localhost (vpn1-7-10.gru2.redhat.com [10.97.7.10])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52IhFHO018746; Thu, 2 Jun 2016 14:43:15 -0400
Date: Thu, 2 Jun 2016 15:43:14 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160602184314.GJ19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-2-git-send-email-imammedo@redhat.com>
	<20160601174309.GA13503@thinpad.lan.raisama.net>
	<20160602115930.6945e5d6@igors-macbook-pro.local>
	<20160602143826.GD19055@thinpad.lan.raisama.net>
	<20160602185655.20d7c7e0@nial.brq.redhat.com>
	<20160602173427.GI19055@thinpad.lan.raisama.net>
	<20160602202337.027428cc@igors-macbook-pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160602202337.027428cc@igors-macbook-pro.local>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 02 Jun 2016 18:43:16 +0000 (UTC)
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
X-TUID: orZ6ZguMNpeF

On Thu, Jun 02, 2016 at 08:23:37PM +0200, Igor Mammedov wrote:
> On Thu, 2 Jun 2016 14:34:27 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
[...]
> > > > > 
> > > > > I don't plan to replace plus/minus_features with anything nor to
> > > > > make this variables a global ones to spread +- x86/sparc legacy
> > > > > format everywhere.  
> > > > 
> > > > Can't the +/- semantics be emulated by simply registering
> > > > plus_features/minus_features after the other global properties
> > > > are registered inside x86_cpu_parse_featurestr()?
> > > it could be done, at the first glance it will take 2 extra parsing
> > > passes
> > > 
> > > 1: copy featurestr, parse feat=x,feat
> > > 2: copy featurestr, parse +feat
> > > 3: copy featurestr, parse -feat
> > 
> > Why? Can't we just replace plus_features and minus_features with
> > two string lists (or a QDict), and make the corresponding
> > object_property_parse()/qdev_prop_register_global() calls after
> > the main parsing loop?
> > 
> > (Didn't you do that in your old "target-i386: set [+-]feature
> > using static properties" patch?)
> ok, I'll do that.

Thanks!

[...]
> > But as I said above: if we are not deleting any code (and are
> > adding extra code instead), I don't see the point of forcibly
> > disabling it. We can just leave it there and print a warning.
> ok, lets go with warning, saying"
> 
> "[+-]feature syntax is obsoleted and will be removed in future,
> it's recommended to use canonical property syntax 'feature=value'"

We could print "+%s is obsolete [...] use '%s=on'" and
"-%s is obsolete [...] use '%s=off'", depending on the case. This
way, users can see more easily what's the proper syntax.

-- 
Eduardo
