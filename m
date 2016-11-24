Received: by 10.25.150.194 with SMTP id y185csp246145lfd;
        Thu, 24 Nov 2016 08:31:37 -0800 (PST)
X-Received: by 10.55.78.147 with SMTP id c141mr3167686qkb.4.1480005097568;
        Thu, 24 Nov 2016 08:31:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s59si15514660qtd.111.2016.11.24.08.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Nov 2016 08:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9wvx-00078o-12
	for alex.bennee@linaro.org; Thu, 24 Nov 2016 11:31:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1c9wuy-00077N-HK
	for qemu-devel@nongnu.org; Thu, 24 Nov 2016 11:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1c9wuu-0002Be-Fu
	for qemu-devel@nongnu.org; Thu, 24 Nov 2016 11:30:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51892
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cornelia.huck@de.ibm.com>)
	id 1c9wuu-0002BM-9o
	for qemu-devel@nongnu.org; Thu, 24 Nov 2016 11:30:32 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAOGTuWp127833
	for <qemu-devel@nongnu.org>; Thu, 24 Nov 2016 11:30:31 -0500
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
	by mx0b-001b2d01.pphosted.com with ESMTP id 26wxhs8ybu-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 24 Nov 2016 11:30:30 -0500
Received: from localhost
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Thu, 24 Nov 2016 16:30:27 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 24 Nov 2016 16:30:22 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id D894A1B08067; 
	Thu, 24 Nov 2016 16:32:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id uAOGUHlM52101264; Thu, 24 Nov 2016 16:30:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 778BA4C05C;
	Thu, 24 Nov 2016 15:28:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA63B4C052;
	Thu, 24 Nov 2016 15:28:34 +0000 (GMT)
Received: from gondolin (unknown [9.152.224.150])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Nov 2016 15:28:34 +0000 (GMT)
Date: Thu, 24 Nov 2016 17:30:19 +0100
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
In-Reply-To: <20161124015119.GS17795@umbus.fritz.box>
References: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
	<20161122223450.GD21830@thinpad.lan.raisama.net>
	<20161123171047.GA27297@thinpad.lan.raisama.net>
	<20161124015119.GS17795@umbus.fritz.box>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112416-0016-0000-0000-0000027025D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112416-0017-0000-0000-000023F0BEEA
Message-Id: <20161124173019.1d3f1b39.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-24_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611240289
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] -nodefaults and available buses (was Re: [RFC
 00/15] qmp: Report supported device types on 'query-machines')
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Markus Armbruster <armbru@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, libvir-list@redhat.com,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jia Liu <proljc@gmail.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z0jP7t27WIDi

On Thu, 24 Nov 2016 12:51:19 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Nov 23, 2016 at 03:10:47PM -0200, Eduardo Habkost wrote:
> > (CCing the maintainers of the machines that crash when using
> > -nodefaults)
> > 
> > On Tue, Nov 22, 2016 at 08:34:50PM -0200, Eduardo Habkost wrote:
> > [...]
> > > "default defaults" vs "-nodefault defaults"
> > > -------------------------------------------
> > > 
> > > Two bad news:
> > > 
> > > 1) We need to differentiate buses created by the machine with
> > >    "-nodefaults" and buses that are created only without
> > >    "-nodefaults".
> > > 
> > > libvirt use -nodefaults when starting QEMU, so knowing which
> > > buses are available when using -nodefaults is more interesting
> > > for them.
> > > 
> > > Other software, on the other hand, might be interested in the
> > > results without -nodefaults.
> > > 
> > > We need to be able model both cases in the new interface.
> > > Suggestions are welcome.
> > 
> > The good news is that the list is short. The only[1] machines
> > where the list of buses seem to change when using -nodefaults
> > are:
> > 
> > * mpc8544ds
> > * ppce500
> > * mpc8544ds
> > * ppce500
> > * s390-ccw-virtio-*
> > 
> > On all cases above, the only difference is that a virtio bus is
> > available if not using -nodefaults.
> 
> Hrm.. that's odd.  Well, it makes sense for the s390 which has special
> virtio arrangements.  

I don't think it makes much sense for s390 either... is this a 'virtio'
bus or a 'virtio-{pci,ccw}' bus? The transport bus should be present
with -nodefaults; the virtio bus is basically a glue bus for virtio
devices...

> However, the others are all embedded ppc
> machines, whose virtio should be bog-standard virtio-pci.  I'm
> wondering if the addition of the virtio "bus" is a side-effect of the
> NIC or storage device created without -nodefaults being virtio.

I'd suspect the default NICs (which are virtio at least in the s390
case).

