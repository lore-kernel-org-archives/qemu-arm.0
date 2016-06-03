Received: by 10.25.27.66 with SMTP id b63csp976995lfb;
        Thu, 2 Jun 2016 17:02:24 -0700 (PDT)
X-Received: by 10.140.220.209 with SMTP id q200mr833366qhb.18.1464912144652;
        Thu, 02 Jun 2016 17:02:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k17si796677qkl.124.2016.06.02.17.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 17:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8cZE-0006bl-4C
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 20:02:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8cZ9-0006bf-Cz
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 20:02:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8cZ4-000734-Cp
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 20:02:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8cZ4-00072z-47; Thu, 02 Jun 2016 20:02:14 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CF787AE82;
	Fri,  3 Jun 2016 00:02:12 +0000 (UTC)
Received: from localhost (vpn1-7-10.gru2.redhat.com [10.97.7.10])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5302Air014834; Thu, 2 Jun 2016 20:02:11 -0400
Date: Thu, 2 Jun 2016 21:02:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Hildenbrand <dahi@linux.vnet.ibm.com>
Message-ID: <20160603000209.GM19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 03 Jun 2016 00:02:12 +0000 (UTC)
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
X-TUID: NHRIUyTR3Yls

On Thu, Jun 02, 2016 at 10:44:49PM +0200, David Hildenbrand wrote:
> > Current CLI option -cpu cpux,features serves as template
> > for all created cpus of type: cpux. However QEMU parses
> > "features" every time it creates a cpu instance and applies
> > them to it while doing parsing.
> > 
> > That doesn't work well with -device/device_add infrastructure
> > as it has no idea about cpu specific hooks that's used for
> > parsing "features".
> > In order to make -device/device_add utilize "-cpu features"
> > template convert it into a set of global properties, so that
> > every new CPU created will have them applied automatically.
> > 
> > That also allows to parse features only once, instread of
> > doing it for every CPU instance created.
> 
> While I think this makes sense for most cases, we (s390x) are
> currently working on a mechanism to compare and baseline cpu models via
> a qmp interface, to not have to replicate CPU models in libvirt
> every time we do some changes.
> 
> To do that, we are creating temporary CPUs to handle the model
> parsing. So, with our current prototype, we rely on the mechanism
> to parse properties multiple time, as we are really creating
> different CPUs.

This series only changes the code that exists for parsing the
-cpu option, and nothing else. Is this (the code that parses
-cpu) really what you need to reuse?

If all you need is to parse properties, why can't you reuse the
existing QOM/Device mechanisms to handle properties (the one used
by -device and device_add), instead of the -cpu code?

We need to use less of the infrastructure that exists for the
legacy -cpu option (and use more of the generic QOM/Device
mechanisms), not more of it.


> 
> While we could somehow change our mechanism I don't think this is
> the right thing to do.
> 

If reusing the existing parsing code is something you absolutely
need, we could split the process in two parts: 1) converting the
feature string to a list of property=value pairs; 2) registering
the property=value pairs as global properties. Then you coulde
reuse (1) only. But do you really need to reuse the parser for
the legacy -cpu option in your mechanism?

> We will have to support heterogeneous cpu models (I think arm was one of
> the guys requesting this if I'm not mistaking) and it somehow
> contradicts to the general mechanism of device_add fully specifying
> parameters. These would now be implicit parameters.

The -cpu interface really does contradict the general mechanism
of device_add. This whole series is about translating the
handling of -cpu to a more generic mechanism (-global), to allow
us to deprecate -cpu in the future. Why is that a bad thing?

> 
> Would it be possible to do this for x86 only? Or find another way
> to handle the "create just another ordinary CPU we already have"?

Can you clarify what "create just another ordinary CPU we already
have" mean? If you are talking about creating another CPU using
what's on -cpu, nothing changes. If you are talking about
creating another CPU with different options, I suggest not
reusing the code that was written for -cpu.

-- 
Eduardo
