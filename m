Received: by 10.37.56.16 with SMTP id f16csp199415yba;
        Fri, 3 Jun 2016 05:14:49 -0700 (PDT)
X-Received: by 10.140.25.209 with SMTP id 75mr1880146qgt.5.1464956089026;
        Fri, 03 Jun 2016 05:14:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si2180993qke.156.2016.06.03.05.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 05:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8o00-0003bk-Dn
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 08:14:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8nzu-0003Yc-Tz
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 08:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8nzo-0003cz-SB
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 08:14:41 -0400
Received: from e06smtp06.uk.ibm.com ([195.75.94.102]:54161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dahi@linux.vnet.ibm.com>) id 1b8nzo-0003cd-Hv
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 08:14:36 -0400
Received: from localhost
	by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <dahi@linux.vnet.ibm.com>;
	Fri, 3 Jun 2016 13:14:35 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp06.uk.ibm.com (192.168.101.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 3 Jun 2016 13:14:32 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: dahi@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6EE612190063; 
	Fri,  3 Jun 2016 13:14:04 +0100 (BST)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u53CEV0A21692686; Fri, 3 Jun 2016 12:14:31 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u53CETrl015348; Fri, 3 Jun 2016 06:14:31 -0600
Received: from thinkpad-w530 (dyn-9-152-224-205.boeblingen.de.ibm.com
	[9.152.224.205])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u53CES6i015268; Fri, 3 Jun 2016 06:14:29 -0600
Date: Fri, 3 Jun 2016 14:14:26 +0200
From: David Hildenbrand <dahi@linux.vnet.ibm.com>
To: Jiri Denemark <jdenemar@redhat.com>
Message-ID: <20160603141426.6d6ad708@thinkpad-w530>
In-Reply-To: <20160603120658.GF40539@orkuz.home>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaKfW029022@mx0a-001b2d01.pphosted.com>
	<20160603120658.GF40539@orkuz.home>
Organization: IBM Deutschland GmbH
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060312-0025-0000-0000-00001F260271
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.102
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i12v7GUPmep7

> On Thu, Jun 02, 2016 at 22:44:49 +0200, David Hildenbrand wrote:
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
> 
> BTW, we don't replicate any change to QEMU CPU models in libvirt. We
> merely add new CPU models that match the current QEMU definition.
> Existing CPU models are never changed. And while the CPU models are
> currently used to check compatibility with host CPU, we will stop doing
> that in the near future and our CPU models will mostly be used for
> detecting what the host CPU is.
> 
> Jirka
> 


Hi Jirka,

thanks for that info!

unfortunately we will have to perform changes to the cpu models.
On z we have various cpu features that are confidential and only
added over time, although they are around for quite some time.
And we have features that are not implemented yet by KVM and will not
be implemented in the near future.
Therefore we will be adding features to our "flexible models"
while keeping migration safe variants with base features stable.

Some day in the future, we will also have all features around :)

Another problematic thing for us is, that we really have to rely
on a host cpu model detection using KVM. The features that
are visible in user space (similar to cpuid()) don't give any
guarantees to what we are able to virtualize.

David

