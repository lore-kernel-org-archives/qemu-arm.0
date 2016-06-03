Received: by 10.25.27.66 with SMTP id b63csp425302lfb;
        Fri, 3 Jun 2016 12:55:07 -0700 (PDT)
X-Received: by 10.55.104.81 with SMTP id d78mr4896091qkc.189.1464983707436;
        Fri, 03 Jun 2016 12:55:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70si3356280qki.85.2016.06.03.12.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 12:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8vBS-0003TQ-Sn
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 15:55:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8vBP-0003T5-48
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 15:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8vBL-0002d3-UG
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 15:55:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8vBL-0002ct-LE; Fri, 03 Jun 2016 15:54:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2D028F4E3;
	Fri,  3 Jun 2016 19:54:58 +0000 (UTC)
Received: from localhost (vpn1-7-42.gru2.redhat.com [10.97.7.42])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u53Jsvtu019272; Fri, 3 Jun 2016 15:54:58 -0400
Date: Fri, 3 Jun 2016 16:54:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Hildenbrand <dahi@linux.vnet.ibm.com>
Message-ID: <20160603195457.GZ19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
	<20160603000209.GM19055@thinpad.lan.raisama.net>
	<20160603083621.6547bde4@thinkpad-w530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160603083621.6547bde4@thinkpad-w530>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 03 Jun 2016 19:54:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
	pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /A/Ne06POo9E

On Fri, Jun 03, 2016 at 08:36:21AM +0200, David Hildenbrand wrote:
> > On Thu, Jun 02, 2016 at 10:44:49PM +0200, David Hildenbrand wrote:
> > > > Current CLI option -cpu cpux,features serves as template
> > > > for all created cpus of type: cpux. However QEMU parses
> > > > "features" every time it creates a cpu instance and applies
> > > > them to it while doing parsing.
> > > > 
> > > > That doesn't work well with -device/device_add infrastructure
> > > > as it has no idea about cpu specific hooks that's used for
> > > > parsing "features".
> > > > In order to make -device/device_add utilize "-cpu features"
> > > > template convert it into a set of global properties, so that
> > > > every new CPU created will have them applied automatically.
> > > > 
> > > > That also allows to parse features only once, instread of
> > > > doing it for every CPU instance created.  
> > > 
> > > While I think this makes sense for most cases, we (s390x) are
> > > currently working on a mechanism to compare and baseline cpu models via
> > > a qmp interface, to not have to replicate CPU models in libvirt
> > > every time we do some changes.
> > > 
> > > To do that, we are creating temporary CPUs to handle the model
> > > parsing. So, with our current prototype, we rely on the mechanism
> > > to parse properties multiple time, as we are really creating
> > > different CPUs.  
> > 
> > This series only changes the code that exists for parsing the
> > -cpu option, and nothing else. Is this (the code that parses
> > -cpu) really what you need to reuse?
> 
> I was reading "every new CPU created will have them applied automatically".
> If I was having a basic understanding problem here, very good :)

Sorry, I misunderstood you:

So, you won't reuse the code for -cpu, but with global
properties, you are going to be affected even if you do a simple
object_new()/device_add. I see the problem, now.

I assume Igor explained it, already, and his suggestion sounds OK
to you. But I will answer your questions to confirm that this is
really the case:

> 
> The problematic part is when the properties are applied where the
> "changed" data is stored (class. vs. instance).
> 
> e.g. in terms of s390x: z13 includes both vx and tx
> -cpu z13,vx=off,tx=off

This will be translated to:
-global z13-s390-cpu.vx=off -global z13-s390-cpu.tx=off

> 
> Now, what would happen on
> a) device_add z13-s390-cpu // I assume vx=off, tx=off ?

Yes.

> 
> b) device_add z13-s390-cpu,vx=on // vx=on suddenly for all vcpus or one
> instance? I assume just this instance

It would affect all z13-s390-cpu instances.

> 
> c) device_add zBC12-s390-cpu // will I suddenly get a z13?
> Or a zBC12 without tx and vx? I assume the latter.

A zBC12 with the default values (not affected by -cpu).

> 
> d) object_new("z13-s390-cpu")); // will I get a clean z13 with tx and vx on?

The same as device_add z13-s390-cpu (a z13 without
tx and vx).

> 
> d) has to work for us. Otherwise we will have to fallback to manual
> property parsing.

It will be affected by the globals, but I assume management code
is not going to use add extra -cpu arguments when probing for CPU
model information, right?

Users will need to be aware that -cpu is equivalent to -global,
and will affect CPU information returned by query-cpu-definitions
(or similar commands).

> 
> > 
> > If all you need is to parse properties, why can't you reuse the
> > existing QOM/Device mechanisms to handle properties (the one used
> > by -device and device_add), instead of the -cpu code?
> 
> We can, if my given example works. And the global properties
> don't interfere with cpus.

They do, but only the model specified in -cpu.

> 
> > 
> > We need to use less of the infrastructure that exists for the
> > legacy -cpu option (and use more of the generic QOM/Device
> > mechanisms), not more of it.
> 
> It is better to have one way of creating cpus that two.

Unfortunately we already have two ways of creating CPUs: -cpu and
device_add. We are trying to translate -cpu to something
equivalent to generic mechanisms (-device and -global), so we
have only one underlying mechanism.

> 
> > 
> > 
> > > 
> > > While we could somehow change our mechanism I don't think this is
> > > the right thing to do.
> > >   
> > 
> > If reusing the existing parsing code is something you absolutely
> > need, we could split the process in two parts: 1) converting the
> > feature string to a list of property=value pairs; 2) registering
> > the property=value pairs as global properties. Then you coulde
> > reuse (1) only. But do you really need to reuse the parser for
> > the legacy -cpu option in your mechanism?
> 
> It's really not about the parser, more about the global properties.

Understood.

> 
> > 
> > > We will have to support heterogeneous cpu models (I think arm was one of
> > > the guys requesting this if I'm not mistaking) and it somehow
> > > contradicts to the general mechanism of device_add fully specifying
> > > parameters. These would now be implicit parameters.  
> > 
> > The -cpu interface really does contradict the general mechanism
> > of device_add. This whole series is about translating the
> > handling of -cpu to a more generic mechanism (-global), to allow
> > us to deprecate -cpu in the future. Why is that a bad thing?
> 
> It is a bad thing as soon as they affect other devices.
> If I did a -cpu z13,tx=off, I don't expect
> 
> a) a hot-plugged z13 to suddenly have tx=off

It will.

(Igor, can you confirm?)


> b) a hot-plugged zBC12 to suddenly have tx off

It won't.


I understand that this may be confusing, but that's because -smp
and -cpu don't fit the QEMU device/object models. We are moving
towards allowing CPU topologies to be created using only -device.

To do that, we are gradually translating -cpu to the generic
mechanisms used by -device/-global, so command-line options could
be easily converted to use the new mechanisms in the future.

Does that make sense?

> 
> Won't libvirt have to specify the cpu name either way in device-add?
> And your plan seems to be that the properties are suddenly implicit.
> I don't see a problem with libvirt having to specify the properties
> manually on device add.
> 
> I agree, cleaning up the parsing function indeed makes sense.
> 
> David
> 

-- 
Eduardo
