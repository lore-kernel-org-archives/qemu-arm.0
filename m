Received: by 10.25.27.66 with SMTP id b63csp141209lfb;
        Fri, 3 Jun 2016 02:24:02 -0700 (PDT)
X-Received: by 10.140.41.83 with SMTP id y77mr196753qgy.100.1464945842122;
        Fri, 03 Jun 2016 02:24:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u33si1814956qgu.124.2016.06.03.02.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 02:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8lKj-0005F6-Es
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 05:24:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8lHQ-0002nk-BN
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 05:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8lHJ-0000GG-4Y
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 05:20:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8lHB-0000EN-Jb; Fri, 03 Jun 2016 05:20:21 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54F01332F6A;
	Fri,  3 Jun 2016 09:20:18 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u539KFWx010859; Fri, 3 Jun 2016 05:20:16 -0400
Date: Fri, 3 Jun 2016 11:20:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <dahi@linux.vnet.ibm.com>
Message-ID: <20160603112014.57782148@nial.brq.redhat.com>
In-Reply-To: <20160603083621.6547bde4@thinkpad-w530>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
	<20160603000209.GM19055@thinpad.lan.raisama.net>
	<20160603083621.6547bde4@thinkpad-w530>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 03 Jun 2016 09:20:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPC2YKHW/30+

On Fri, 3 Jun 2016 08:36:21 +0200
David Hildenbrand <dahi@linux.vnet.ibm.com> wrote:

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
> > This series only changes the code that exists for parsing the
> > -cpu option, and nothing else. Is this (the code that parses
> > -cpu) really what you need to reuse?  
> 
> I was reading "every new CPU created will have them applied automatically".
> If I was having a basic understanding problem here, very good :)
I should rephrase it to "every new CPU of given cpu type"

> The problematic part is when the properties are applied where the
> "changed" data is stored (class. vs. instance).
> 
> e.g. in terms of s390x: z13 includes both vx and tx
> -cpu z13,vx=off,tx=off
Above -cpu template will be translated into a corresponding
global properties template:

-global z13-s390-cpu.vx=off -global z13-s390-cpu.tx=off


> Now, what would happen on
> a) device_add z13-s390-cpu // I assume vx=off, tx=off ?
as with current -cpu + manual cpu_model parsing per instance,
you'll get above globals applied by the time object_new("z13-s390-cpu"))
is complete.
 
> b) device_add z13-s390-cpu,vx=on // vx=on suddenly for all vcpus or one
> instance? I assume just this instance
yes, You'll get vx=on for just this instance as it's not a global property
and it's applied after object_new() by -device/device_add
 
> c) device_add zBC12-s390-cpu // will I suddenly get a z13?
> Or a zBC12 without tx and vx? I assume the latter.
that depends on class hierarchy,
if zBC12 is inherited from z13 you'll get global properties of z13 applied.
if z13 is not parent of zBC12 then z13 global properties
are not applied to zBC12.
 
Look at qdev_prop_set_globals() and how it's used.

> d) object_new("z13-s390-cpu")); // will I get a clean z13 with tx and vx on?
nope, you'll z13 with tx and vx off

> d) has to work for us. Otherwise we will have to fallback to manual
> property parsing.
could you elaborate more why do you need (d) work
in combination with -cpu z13,vx=off,tx=off ?
Perhaps there is another way to do what you need.

Current code uses -cpu for creating homogeneous cpus of given type
(i.e.) as template and that's exactly what -global cpufoo,feat=x ... does.

> > If all you need is to parse properties, why can't you reuse the
> > existing QOM/Device mechanisms to handle properties (the one used
> > by -device and device_add), instead of the -cpu code?  
> 
> We can, if my given example works. And the global properties
> don't interfere with cpus.
if you need pure -device/device_add handling then don't use
-cpu CPUFOO,feat=x,... template as its current semantic
is to create all CPUs of type CPUFOO with feat=x,... applied

or more exactly do not use feat... part of it if you don't need
global properties.

> 
> > 
> > We need to use less of the infrastructure that exists for the
> > legacy -cpu option (and use more of the generic QOM/Device
> > mechanisms), not more of it.  
> 
> It is better to have one way of creating cpus that two.
yep, and that's where we heading to, first by making CPU a Device
and then switching to generic -device/device_add model, so use one or
another, -cpu is kept there for compat reasons and some day
we probably could kill it.

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
you should expect it though, as -cpu z13,tx=off is template
for all z13 CPUs, it's not per instance thingy

> b) a hot-plugged zBC12 to suddenly have tx off
that will not have tx off unless zBC12 is inherited from z13

> Won't libvirt have to specify the cpu name either way in device-add?
> And your plan seems to be that the properties are suddenly implicit.
> I don't see a problem with libvirt having to specify the properties
> manually on device add.
libvirt could do verbose
#1  -device CPUFOO,feat1=x -device CPUFOO,feat1=x ...
or
#2  -cpu CPUFOO,feat1=x -device CPUFOO -device CPUFOO ...
  which is equivalent of generic device syntax and not use -cpu at all:
#3  -global CPUFOO.feat1=x -device CPUFOO -device CPUFOO ...

#3 is where we are heading to by making -device/device_add available for
CPUs. If you wish to have CPUs of the same type but with different
features, don't use global properties for that features.
Just like with any other device.

> I agree, cleaning up the parsing function indeed makes sense.
> 
> David
> 

