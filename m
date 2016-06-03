Received: by 10.25.27.66 with SMTP id b63csp163572lfb;
        Fri, 3 Jun 2016 03:19:43 -0700 (PDT)
X-Received: by 10.55.23.72 with SMTP id i69mr2481731qkh.142.1464949182412;
        Fri, 03 Jun 2016 03:19:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c15si3042414qta.62.2016.06.03.03.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 03:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8mCb-0007Iz-Rb
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 06:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8mBZ-0006Zo-8F
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 06:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8mBK-0006UD-TZ
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 06:18:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60671
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8mBK-0006U1-On
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 06:18:22 -0400
Received: from pps.filterd (m0048817.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u53AFhaD021988
	for <qemu-devel@nongnu.org>; Fri, 3 Jun 2016 06:18:22 -0400
Message-Id: <201606031018.u53AFhaD021988@mx0a-001b2d01.pphosted.com>
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23b3aqvayx-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Fri, 03 Jun 2016 06:18:22 -0400
Received: from localhost
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <dahi@linux.vnet.ibm.com>;
	Fri, 3 Jun 2016 11:18:20 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 3 Jun 2016 11:18:18 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: dahi@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0A0171B08067; 
	Fri,  3 Jun 2016 11:19:21 +0100 (BST)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u53AIHBF6488518; Fri, 3 Jun 2016 10:18:17 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u53AIG8v028919; Fri, 3 Jun 2016 04:18:16 -0600
Received: from thinkpad-w530 (dyn-9-152-224-205.boeblingen.de.ibm.com
	[9.152.224.205])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u53AIGjZ028899; Fri, 3 Jun 2016 04:18:16 -0600
Date: Fri, 3 Jun 2016 12:18:15 +0200
From: David Hildenbrand <dahi@linux.vnet.ibm.com>
To: Igor Mammedov <imammedo@redhat.com>
In-Reply-To: <20160603112014.57782148@nial.brq.redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
	<20160603000209.GM19055@thinpad.lan.raisama.net>
	<20160603083621.6547bde4@thinkpad-w530>
	<20160603112014.57782148@nial.brq.redhat.com>
Organization: IBM Deutschland GmbH
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060310-0040-0000-0000-000001E684DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16060310-0041-0000-0000-0000207BECFA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-03_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=8
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1606030117
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
X-TUID: 5t7oVO9V2O+A

> > e.g. in terms of s390x: z13 includes both vx and tx
> > -cpu z13,vx=off,tx=off  
> Above -cpu template will be translated into a corresponding
> global properties template:
> 
> -global z13-s390-cpu.vx=off -global z13-s390-cpu.tx=off

This description makes it much clearer how you expect -cpu to behave. Thanks.
The important part for me was that -global applies to this cpu type only.

And our internal hierarchy should make sure that this is guaranteed. 
And good to known that it is a common schema we are following here.

> > d) object_new("z13-s390-cpu")); // will I get a clean z13 with tx and vx on?  
> nope, you'll z13 with tx and vx off
> 
> > d) has to work for us. Otherwise we will have to fallback to manual
> > property parsing.  
> could you elaborate more why do you need (d) work
> in combination with -cpu z13,vx=off,tx=off ?
> Perhaps there is another way to do what you need.

Say we started QEMU with -z13,vx=off,tx=off.
When I do a QMP query to e.g. compare two cpu models, say a temporary cpu
zBC12,tx=on and zBC13,tx=on is created. And the additional
parameters only affect these instances as I learned.

When I now compare them, the result will depend on the
way QEMU has been started. But most likely this is okay, as
we expect this interface to be used without any cpu model at all.

This then just has to be documented accordingly.

> 
> Current code uses -cpu for creating homogeneous cpus of given type
> (i.e.) as template and that's exactly what -global cpufoo,feat=x ... does.
> 
> > > If all you need is to parse properties, why can't you reuse the
> > > existing QOM/Device mechanisms to handle properties (the one used
> > > by -device and device_add), instead of the -cpu code?    
> > 
> > We can, if my given example works. And the global properties
> > don't interfere with cpus.  
> if you need pure -device/device_add handling then don't use
> -cpu CPUFOO,feat=x,... template as its current semantic
> is to create all CPUs of type CPUFOO with feat=x,... applied
> > It is a bad thing as soon as they affect other devices.
> > If I did a -cpu z13,tx=off, I don't expect
> > 
> > a) a hot-plugged z13 to suddenly have tx=off  
> you should expect it though, as -cpu z13,tx=off is template
> for all z13 CPUs, it's not per instance thingy
> 
> > b) a hot-plugged zBC12 to suddenly have tx off  
> that will not have tx off unless zBC12 is inherited from z13

They don't inherit, so this should be fine.

> 
> > Won't libvirt have to specify the cpu name either way in device-add?
> > And your plan seems to be that the properties are suddenly implicit.
> > I don't see a problem with libvirt having to specify the properties
> > manually on device add.  
> libvirt could do verbose
> #1  -device CPUFOO,feat1=x -device CPUFOO,feat1=x ...
> or
> #2  -cpu CPUFOO,feat1=x -device CPUFOO -device CPUFOO ...
>   which is equivalent of generic device syntax and not use -cpu at all:
> #3  -global CPUFOO.feat1=x -device CPUFOO -device CPUFOO ...
> 
> #3 is where we are heading to by making -device/device_add available for
> CPUs. If you wish to have CPUs of the same type but with different
> features, don't use global properties for that features.
> Just like with any other device.

So this should work for us, we just have to document that -global for cpus
or -cpu should not be used when trying to work with the new QMP 
queries.

Thanks for the explanation!

David

