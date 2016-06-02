Received: by 10.25.27.66 with SMTP id b63csp802693lfb;
        Thu, 2 Jun 2016 09:30:24 -0700 (PDT)
X-Received: by 10.140.19.178 with SMTP id 47mr4939018qgh.83.1464885024216;
        Thu, 02 Jun 2016 09:30:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z68si38511944qkd.285.2016.06.02.09.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 09:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8VVn-0007Rh-H3
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 12:30:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b8V76-0000Ou-DY
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b8V71-00060N-5w
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:04:51 -0400
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:59414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b8V70-0005zb-R1
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:04:47 -0400
Received: from localhost
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Thu, 2 Jun 2016 17:04:45 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 2 Jun 2016 17:04:43 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 622271B0806E; 
	Thu,  2 Jun 2016 17:05:45 +0100 (BST)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
	[9.149.37.251])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u52G4gqs9896420; Thu, 2 Jun 2016 16:04:42 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u52F4iCq027557; Thu, 2 Jun 2016 09:04:44 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u52F4h4x027531; Thu, 2 Jun 2016 09:04:43 -0600
Received: from bahia.huguette.org (icon-9-167-244-222.megacenter.de.ibm.com
	[9.167.244.222])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id EBA3A220504;
	Thu,  2 Jun 2016 18:04:39 +0200 (CEST)
Date: Thu, 2 Jun 2016 18:04:37 +0200
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160602180437.02f3ed85@bahia.huguette.org>
In-Reply-To: <20160601023328.GB15455@voom.fritz.box>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
	<20160601023328.GB15455@voom.fritz.box>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060216-0017-0000-0000-000021C36D05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
Subject: Re: [Qemu-arm] [PATCH] virtio: move bi-endian target support to a
 single location
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8aXhy/sZb3H1

On Wed, 1 Jun 2016 12:33:28 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, May 31, 2016 at 03:15:21PM +0200, Paolo Bonzini wrote:
> > 
> > 
> > On 31/05/2016 15:10, Greg Kurz wrote:  
> > >>> > > +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> > >>> > > +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> > >>> > > +#endif    
> > >> > 
> > >> > These will only be correct if something else includes cpu.h.  Instead of  
> > > Unless I missed something, the TARGET_* macros come from the generated
> > > config-target.h header, which is in turn included by qemu/osdep.h and
> > > thus included by most of the code.  
> > 
> > You're right.  Problems _could_ happen if virtio-access.h is included in
> > a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead of
> > obj-y) but include/exec/poison.h should take care of that.
> >   
> > >> > defining this, you should add
> > >> > 
> > >> > #include "cpu.h"
> > >> > 
> > >> > at the top of include/hw/virtio-access.h and leave the definitions in
> > >> > target-*/cpu.h.
> > >> >   
> > > All this bi-endian stuff is really an old-virtio-only thing... it is
> > > only to be used by virtio_access_is_big_endian(). The fact that it
> > > broke silently with your cleanup series is yet another proof that
> > > this workaround is fragile.  
> > 
> > It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so the
> > TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
> > 
> > Anyway because of poison.h your solution isn't fragile either, so
> > 
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>  
> 
> Should I take this through my tree?
> 

That would be great !

--
Greg

