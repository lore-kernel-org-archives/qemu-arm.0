Received: by 10.25.27.66 with SMTP id b63csp79509lfb;
        Thu, 2 Jun 2016 23:38:02 -0700 (PDT)
X-Received: by 10.140.91.18 with SMTP id y18mr1649978qgd.81.1464935882462;
        Thu, 02 Jun 2016 23:38:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o48si1505957qgd.127.2016.06.02.23.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 23:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8ik5-0008As-Sa
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 02:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8iil-0006xe-E4
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 02:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8iib-0000bz-W3
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 02:36:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8iib-0000bu-Nr
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 02:36:29 -0400
Received: from pps.filterd (m0075771.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u536V5Xe025874
	for <qemu-devel@nongnu.org>; Fri, 3 Jun 2016 02:36:28 -0400
Message-Id: <201606030636.u536V5Xe025874@mx0a-001b2d01.pphosted.com>
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23b3tftb5d-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Fri, 03 Jun 2016 02:36:28 -0400
Received: from localhost
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <dahi@linux.vnet.ibm.com>;
	Fri, 3 Jun 2016 07:36:25 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 3 Jun 2016 07:36:24 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: dahi@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 90B042190056; 
	Fri,  3 Jun 2016 07:35:56 +0100 (BST)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u536aNkX5112210; Fri, 3 Jun 2016 06:36:23 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u536aMJB022038; Fri, 3 Jun 2016 00:36:23 -0600
Received: from thinkpad-w530 (dyn-9-152-224-205.boeblingen.de.ibm.com
	[9.152.224.205])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u536aMUo022030; Fri, 3 Jun 2016 00:36:22 -0600
Date: Fri, 3 Jun 2016 08:36:21 +0200
From: David Hildenbrand <dahi@linux.vnet.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20160603000209.GM19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
	<20160603000209.GM19055@thinpad.lan.raisama.net>
Organization: IBM Deutschland GmbH
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060306-0020-0000-0000-00000205E26C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16060306-0021-0000-0000-00003C3462A9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=8
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1606030072
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WbkOxV9jrMM

> On Thu, Jun 02, 2016 at 10:44:49PM +0200, David Hildenbrand wrote:
> > > Current CLI option -cpu cpux,features serves as template
> > > for all created cpus of type: cpux. However QEMU parses
> > > "features" every time it creates a cpu instance and applies
> > > them to it while doing parsing.
> > > 
> > > That doesn't work well with -device/device_add infrastructure
> > > as it has no idea about cpu specific hooks that's used for
> > > parsing "features".
> > > In order to make -device/device_add utilize "-cpu features"
> > > template convert it into a set of global properties, so that
> > > every new CPU created will have them applied automatically.
> > > 
> > > That also allows to parse features only once, instread of
> > > doing it for every CPU instance created.  
> > 
> > While I think this makes sense for most cases, we (s390x) are
> > currently working on a mechanism to compare and baseline cpu models via
> > a qmp interface, to not have to replicate CPU models in libvirt
> > every time we do some changes.
> > 
> > To do that, we are creating temporary CPUs to handle the model
> > parsing. So, with our current prototype, we rely on the mechanism
> > to parse properties multiple time, as we are really creating
> > different CPUs.  
> 
> This series only changes the code that exists for parsing the
> -cpu option, and nothing else. Is this (the code that parses
> -cpu) really what you need to reuse?

I was reading "every new CPU created will have them applied automatically".
If I was having a basic understanding problem here, very good :)

The problematic part is when the properties are applied where the
"changed" data is stored (class. vs. instance).

e.g. in terms of s390x: z13 includes both vx and tx
-cpu z13,vx=off,tx=off

Now, what would happen on
a) device_add z13-s390-cpu // I assume vx=off, tx=off ?

b) device_add z13-s390-cpu,vx=on // vx=on suddenly for all vcpus or one
instance? I assume just this instance

c) device_add zBC12-s390-cpu // will I suddenly get a z13?
Or a zBC12 without tx and vx? I assume the latter.

d) object_new("z13-s390-cpu")); // will I get a clean z13 with tx and vx on?

d) has to work for us. Otherwise we will have to fallback to manual
property parsing.

> 
> If all you need is to parse properties, why can't you reuse the
> existing QOM/Device mechanisms to handle properties (the one used
> by -device and device_add), instead of the -cpu code?

We can, if my given example works. And the global properties
don't interfere with cpus.

> 
> We need to use less of the infrastructure that exists for the
> legacy -cpu option (and use more of the generic QOM/Device
> mechanisms), not more of it.

It is better to have one way of creating cpus that two.

> 
> 
> > 
> > While we could somehow change our mechanism I don't think this is
> > the right thing to do.
> >   
> 
> If reusing the existing parsing code is something you absolutely
> need, we could split the process in two parts: 1) converting the
> feature string to a list of property=value pairs; 2) registering
> the property=value pairs as global properties. Then you coulde
> reuse (1) only. But do you really need to reuse the parser for
> the legacy -cpu option in your mechanism?

It's really not about the parser, more about the global properties.

> 
> > We will have to support heterogeneous cpu models (I think arm was one of
> > the guys requesting this if I'm not mistaking) and it somehow
> > contradicts to the general mechanism of device_add fully specifying
> > parameters. These would now be implicit parameters.  
> 
> The -cpu interface really does contradict the general mechanism
> of device_add. This whole series is about translating the
> handling of -cpu to a more generic mechanism (-global), to allow
> us to deprecate -cpu in the future. Why is that a bad thing?

It is a bad thing as soon as they affect other devices.
If I did a -cpu z13,tx=off, I don't expect

a) a hot-plugged z13 to suddenly have tx=off
b) a hot-plugged zBC12 to suddenly have tx off

Won't libvirt have to specify the cpu name either way in device-add?
And your plan seems to be that the properties are suddenly implicit.
I don't see a problem with libvirt having to specify the properties
manually on device add.

I agree, cleaning up the parsing function indeed makes sense.

David

