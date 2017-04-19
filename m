Received: by 10.25.0.144 with SMTP id 138csp235082lfa;
        Wed, 19 Apr 2017 05:05:56 -0700 (PDT)
X-Received: by 10.55.207.208 with SMTP id v77mr2313366qkl.189.1492603555997;
        Wed, 19 Apr 2017 05:05:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p35si2087511qta.186.2017.04.19.05.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 05:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0oMt-0003y3-FQ
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 08:05:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1d0oMh-0003wl-O6
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 08:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1d0oMc-0008R1-Vz
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 08:05:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cornelia.huck@de.ibm.com>)
	id 1d0oMc-0008QG-NM
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 08:05:38 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v3JC3al1083341
	for <qemu-arm@nongnu.org>; Wed, 19 Apr 2017 08:05:37 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
	by mx0a-001b2d01.pphosted.com with ESMTP id 29x74mhg9w-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 19 Apr 2017 08:05:37 -0400
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Wed, 19 Apr 2017 13:05:31 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 19 Apr 2017 13:05:25 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v3JC5O9O39977170; Wed, 19 Apr 2017 12:05:24 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 804594205F;
	Wed, 19 Apr 2017 13:04:24 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C832342076;
	Wed, 19 Apr 2017 13:04:23 +0100 (BST)
Received: from gondolin (unknown [9.152.224.84])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 19 Apr 2017 13:04:23 +0100 (BST)
Date: Wed, 19 Apr 2017 14:05:22 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20170419014207.GT25239@thinpad.lan.raisama.net>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
	<20170419002926.GC23273@umbus.fritz.box>
	<20170419014207.GT25239@thinpad.lan.raisama.net>
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
x-cbid: 17041912-0012-0000-0000-0000050F70AD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041912-0013-0000-0000-0000181BFCD1
Message-Id: <20170419140522.391f0b50.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-04-19_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1704190107
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [RFC v2 3/6] pci: Rename and change signatures of
 pci_bus_new() & related functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-arm@nongnu.org,
	=?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WC5QYKncXrC9

On Tue, 18 Apr 2017 22:42:07 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Apr 19, 2017 at 10:29:26AM +1000, David Gibson wrote:
> > On Tue, Apr 18, 2017 at 07:17:21PM -0300, Eduardo Habkost wrote:
> > > pci_bus_new*() and pci_register_bus() work only when the 'parent'
> > > argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
> > > are meant to initialize a bus that's in a PCI host bridge.
> > > 
> > > The new function names are:
> > > * pci_host_bus_init() (replacing pci_bus_new())
> > > * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
> > > * pci_host_bus_init_irqs() (replacing pci_register_bus())
> > 
> > I like the idea, but I'm not terribly convinced by these names.
> > Aren't functions which allocate objects usually called whatever_new()
> > rather than whatever_init()?  And pci_register_bus() appears to do
> > more than just initialize irqs.
> 
> I agree the names aren't terribly clear. This is what they are
> supposed to mean:
> 
> * pci_host_bus_init(phb) initializes phb->bus.
> * pci_host_bus_init(phb) initializes phb->bus using an
>   already-allocated object.
> * pci_host_bus_init_irqs() does the same as pci_host_bus_init(),
>   but also calls pci_bus_irqs().
> 
> I plan to submit API documentation comments later. I am open to
> alternative name suggestions.
> 

pci_host_bus_init_irqs() sounds as if it would only init irqs. What
about:

pci_host_bus_new()
pci_host_bus_new_inplace()
pci_host_bus_new_with_irqs()

(the last one might be a bit long, though, especially as it takes so
many arguments already)

