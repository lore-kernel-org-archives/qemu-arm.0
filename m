Received: by 10.25.27.66 with SMTP id b63csp68392lfb;
        Thu, 2 Jun 2016 23:06:09 -0700 (PDT)
X-Received: by 10.140.102.117 with SMTP id v108mr1537188qge.103.1464933969618;
        Thu, 02 Jun 2016 23:06:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si1473589qkd.72.2016.06.02.23.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 23:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8iFF-0001D5-5B
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 02:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b8iFA-0001Cx-Oi
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 02:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b8iF6-0002p1-GZ
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 02:06:03 -0400
Received: from e06smtp09.uk.ibm.com ([195.75.94.105]:41415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b8iF6-0002on-5p
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 02:06:00 -0400
Received: from localhost
	by e06smtp09.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Fri, 3 Jun 2016 07:05:58 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp09.uk.ibm.com (192.168.101.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 3 Jun 2016 07:05:55 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id E3EB917D805A; 
	Fri,  3 Jun 2016 07:07:02 +0100 (BST)
Received: from d06av06.portsmouth.uk.ibm.com (d06av06.portsmouth.uk.ibm.com
	[9.149.37.217])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u5365sV75112272; Fri, 3 Jun 2016 06:05:54 GMT
Received: from d06av06.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u5365sOx030303; Fri, 3 Jun 2016 02:05:54 -0400
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u5365sAa030295; Fri, 3 Jun 2016 02:05:54 -0400
Received: from bahia.huguette.org (icon-9-167-244-222.megacenter.de.ibm.com
	[9.167.244.222])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 21B9522050E;
	Fri,  3 Jun 2016 08:05:53 +0200 (CEST)
Date: Fri, 3 Jun 2016 08:05:50 +0200
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160603080550.79ee9fd6@bahia.huguette.org>
In-Reply-To: <20160603011604.GE1087@voom.fritz.box>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
	<20160601023328.GB15455@voom.fritz.box>
	<20160602180437.02f3ed85@bahia.huguette.org>
	<20160603011604.GE1087@voom.fritz.box>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16060306-0037-0000-0000-000011348674
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.105
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
X-TUID: hei9hgQUXVgq

On Fri, 3 Jun 2016 11:16:04 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Jun 02, 2016 at 06:04:37PM +0200, Greg Kurz wrote:
> > On Wed, 1 Jun 2016 12:33:28 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Tue, May 31, 2016 at 03:15:21PM +0200, Paolo Bonzini wrote:  
> > > > 
> > > > 
> > > > On 31/05/2016 15:10, Greg Kurz wrote:    
> > > > >>> > > +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> > > > >>> > > +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> > > > >>> > > +#endif      
> > > > >> > 
> > > > >> > These will only be correct if something else includes cpu.h.  Instead of    
> > > > > Unless I missed something, the TARGET_* macros come from the generated
> > > > > config-target.h header, which is in turn included by qemu/osdep.h and
> > > > > thus included by most of the code.    
> > > > 
> > > > You're right.  Problems _could_ happen if virtio-access.h is included in
> > > > a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead of
> > > > obj-y) but include/exec/poison.h should take care of that.
> > > >     
> > > > >> > defining this, you should add
> > > > >> > 
> > > > >> > #include "cpu.h"
> > > > >> > 
> > > > >> > at the top of include/hw/virtio-access.h and leave the definitions in
> > > > >> > target-*/cpu.h.
> > > > >> >     
> > > > > All this bi-endian stuff is really an old-virtio-only thing... it is
> > > > > only to be used by virtio_access_is_big_endian(). The fact that it
> > > > > broke silently with your cleanup series is yet another proof that
> > > > > this workaround is fragile.    
> > > > 
> > > > It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so the
> > > > TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
> > > > 
> > > > Anyway because of poison.h your solution isn't fragile either, so
> > > > 
> > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>    
> > > 
> > > Should I take this through my tree?
> > >   
> > 
> > That would be great !  
> 
> Actually, that was a question for Paolo..
> 
> 

Sure, I was just expressing my interest for this possibility... :)

