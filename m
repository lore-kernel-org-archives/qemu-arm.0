Received: by 10.25.27.66 with SMTP id b63csp1400628lfb;
        Mon, 6 Jun 2016 03:01:21 -0700 (PDT)
X-Received: by 10.140.19.5 with SMTP id 5mr14180561qgg.98.1465207281271;
        Mon, 06 Jun 2016 03:01:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o66si10475637qkd.123.2016.06.06.03.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 03:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9rLU-0002zc-OI
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 06:01:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b9rJv-0001zu-5f
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 05:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b9rJp-0002JG-Sh
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 05:59:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31975
	helo=mx0b-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b9rJp-0002JC-J9
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 05:59:37 -0400
Received: from pps.filterd (m0082756.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u569wtau013539
	for <qemu-devel@nongnu.org>; Mon, 6 Jun 2016 05:59:36 -0400
Message-Id: <201606060959.u569wtau013539@mx0a-001b2d01.pphosted.com>
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23bt1pymmu-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Mon, 06 Jun 2016 05:59:34 -0400
Received: from localhost
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <dahi@linux.vnet.ibm.com>;
	Mon, 6 Jun 2016 10:59:25 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 6 Jun 2016 10:59:22 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: dahi@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3B9CD1B08070; 
	Mon,  6 Jun 2016 11:00:26 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u569xLA144302584; Mon, 6 Jun 2016 09:59:21 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u569xKut021526; Mon, 6 Jun 2016 03:59:21 -0600
Received: from thinkpad-w530 (dyn-9-152-224-205.boeblingen.de.ibm.com
	[9.152.224.205])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u569xK4f021512; Mon, 6 Jun 2016 03:59:20 -0600
Date: Mon, 6 Jun 2016 11:59:19 +0200
From: David Hildenbrand <dahi@linux.vnet.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20160603195457.GZ19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaIkv017063@mx0a-001b2d01.pphosted.com>
	<20160603000209.GM19055@thinpad.lan.raisama.net>
	<20160603083621.6547bde4@thinkpad-w530>
	<20160603195457.GZ19055@thinpad.lan.raisama.net>
Organization: IBM Deutschland GmbH
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060609-0020-0000-0000-00000207306E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16060609-0021-0000-0000-00003C446914
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-06_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=8
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1606060122
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
X-TUID: 85lOr0EARhz+


> I assume Igor explained it, already, and his suggestion sounds OK
> to you. But I will answer your questions to confirm that this is
> really the case:

Yes, this all sounds good to me, thanks for the additional explanation!
[...]

> 
> > 
> > d) has to work for us. Otherwise we will have to fallback to manual
> > property parsing.  
> 
> It will be affected by the globals, but I assume management code
> is not going to use add extra -cpu arguments when probing for CPU
> model information, right?

Yes, that's also what I figured out, this should not be a problem.

> 
> Users will need to be aware that -cpu is equivalent to -global,
> and will affect CPU information returned by query-cpu-definitions
> (or similar commands).
> 
> >   
> > > 
> > > If all you need is to parse properties, why can't you reuse the
> > > existing QOM/Device mechanisms to handle properties (the one used
> > > by -device and device_add), instead of the -cpu code?  
> > 
> > We can, if my given example works. And the global properties
> > don't interfere with cpus.  
> 
> They do, but only the model specified in -cpu.
> 
> >   
> > > 
> > > We need to use less of the infrastructure that exists for the
> > > legacy -cpu option (and use more of the generic QOM/Device
> > > mechanisms), not more of it.  
> > 
> > It is better to have one way of creating cpus that two.  
> 
> Unfortunately we already have two ways of creating CPUs: -cpu and
> device_add. We are trying to translate -cpu to something
> equivalent to generic mechanisms (-device and -global), so we
> have only one underlying mechanism.

Yes, understood. Sounds sane to me!
[...]

> I understand that this may be confusing, but that's because -smp
> and -cpu don't fit the QEMU device/object models. We are moving
> towards allowing CPU topologies to be created using only -device.
> 
> To do that, we are gradually translating -cpu to the generic
> mechanisms used by -device/-global, so command-line options could
> be easily converted to use the new mechanisms in the future.
> 
> Does that make sense?
> 

Absolutely!

David

