Received: by 10.25.208.137 with SMTP id h131csp2488608lfg;
        Wed, 18 May 2016 08:42:38 -0700 (PDT)
X-Received: by 10.55.8.12 with SMTP id 12mr8286088qki.200.1463586158721;
        Wed, 18 May 2016 08:42:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m27si7246717qkh.97.2016.05.18.08.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 May 2016 08:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b33cM-0008Th-85
	for alex.bennee@linaro.org; Wed, 18 May 2016 11:42:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b33cI-0008TM-Hb
	for qemu-arm@nongnu.org; Wed, 18 May 2016 11:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b33cF-0005Bd-B4
	for qemu-arm@nongnu.org; Wed, 18 May 2016 11:42:34 -0400
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:59210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b33cE-0005Aa-Vy
	for qemu-arm@nongnu.org; Wed, 18 May 2016 11:42:31 -0400
Received: from localhost
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Wed, 18 May 2016 16:42:29 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 18 May 2016 16:42:26 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id B654B17D8056; 
	Wed, 18 May 2016 16:43:26 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4IFgQNS6619442; Wed, 18 May 2016 15:42:26 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4IFgPmC007840; Wed, 18 May 2016 09:42:25 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4IFgPDa007837; Wed, 18 May 2016 09:42:25 -0600
Received: from bahia.huguette.org (sig-9-84-49-211.evts.de.ibm.com
	[9.84.49.211])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id C68A7220219;
	Wed, 18 May 2016 17:42:23 +0200 (CEST)
Date: Wed, 18 May 2016 17:42:20 +0200
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160518174220.71c24727@bahia.huguette.org>
In-Reply-To: <CAFEAcA84cHCeEMNQfk_hj=Trbzm1_VFo8QERV95hRGqypok40Q@mail.gmail.com>
References: <146357953667.8807.5432652213311565530.stgit@bahia.huguette.org>
	<CAFEAcA84cHCeEMNQfk_hj=Trbzm1_VFo8QERV95hRGqypok40Q@mail.gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051815-0005-0000-0000-000019B02600
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Subject: Re: [Qemu-arm] [PATCH v2] sysemu: support up to 1024 vCPUs
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cXYfD1oJO5oq

On Wed, 18 May 2016 16:31:31 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 18 May 2016 at 14:52, Greg Kurz <gkurz@linux.vnet.ibm.com> wrote:
> > Some PowerPC systems can already provide more than 255 hardware threads.
> > Igor also posted a patch recently, to increase the the maxcpus limit to
> > 288 for x86 targets.
> >
> > This patch bumps the limit to 1024:
> > - 1024 is already the limit for PowerPC KVM in several distros
> > - it has no visible overhead in top
> > - the limit itself has no effect on hot paths
> >
> > We only do that for pseries at the moment and keep a 255 limit for the
> > ARM Virtual Machine.
> >
> > Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> > ---
> > v2: - updated changelog
> >     - keep 255 limit in hw/arm/virt.c
> > ---
> >  hw/arm/virt.c           |    2 +-
> >  include/sysemu/sysemu.h |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 56d35c7716e7..438e09c7a57d 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1358,7 +1358,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> >       * it later in machvirt_init, where we have more information about the
> >       * configuration of the particular instance.
> >       */
> > -    mc->max_cpus = MAX_CPUMASK_BITS;
> > +    mc->max_cpus = 255;  
> 
> This change makes the code disagree with the comment immediately
> above it. As the comment says, we set max_cpus to the maximum
> QEMU supports, and then dynamically check it later when we know
> whether we have a GICv2 or GICv3 (which is what puts the limit
> on number of CPUs for this board). So I think the change is
> not needed.
> 

Thank you Peter for the clarification. I'll mention that in the
changelog in v3.

> >      mc->has_dynamic_sysbus = true;
> >      mc->block_default_type = IF_VIRTIO;
> >      mc->no_cdrom = 1;
> > diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> > index 38fb3cad35e1..89d742caa477 100644
> > --- a/include/sysemu/sysemu.h
> > +++ b/include/sysemu/sysemu.h
> > @@ -185,7 +185,7 @@ extern int mem_prealloc;
> >   *
> >   * Note that cpu->get_arch_id() may be larger than MAX_CPUMASK_BITS.
> >   */
> > -#define MAX_CPUMASK_BITS 255
> > +#define MAX_CPUMASK_BITS 1024
> >
> >  #define MAX_OPTION_ROMS 16
> >  typedef struct QEMUOptionRom {  
> 
> thanks
> -- PMM
> 

