Received: by 10.25.27.66 with SMTP id b63csp2081927lfb;
        Tue, 31 May 2016 07:11:19 -0700 (PDT)
X-Received: by 10.55.154.136 with SMTP id c130mr7944964qke.79.1464703879794;
        Tue, 31 May 2016 07:11:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70si31066623qka.166.2016.05.31.07.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 07:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7kO7-0002jl-5e
	for alex.bennee@linaro.org; Tue, 31 May 2016 10:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7kNt-0002du-HD
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:11:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7kNk-0001Tj-3j
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:11:05 -0400
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:35238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7kNj-0001Sc-PF
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:10:56 -0400
Received: from localhost
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Tue, 31 May 2016 15:10:53 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 May 2016 15:10:48 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9E9E02190066; 
	Tue, 31 May 2016 15:10:21 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4VEAmoI31784972; Tue, 31 May 2016 14:10:48 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4VEAlku006558; Tue, 31 May 2016 08:10:48 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4VEAlcA006539; Tue, 31 May 2016 08:10:47 -0600
Received: from bahia.lab.toulouse-stg.fr.ibm.com
	(bahia.lab.toulouse-stg.fr.ibm.com [9.101.4.41])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id AFA4C22040A;
	Tue, 31 May 2016 16:10:47 +0200 (CEST)
Date: Tue, 31 May 2016 16:10:46 +0200
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160531161046.480345b2@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16053114-0005-0000-0000-00001A11ED0B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
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
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CCnoewRFIamk

On Tue, 31 May 2016 15:15:21 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 31/05/2016 15:10, Greg Kurz wrote:
> >>> > > +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> >>> > > +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> >>> > > +#endif    
> >> > 
> >> > These will only be correct if something else includes cpu.h.  Instead of  
> > Unless I missed something, the TARGET_* macros come from the generated
> > config-target.h header, which is in turn included by qemu/osdep.h and
> > thus included by most of the code.  
> 
> You're right.  Problems _could_ happen if virtio-access.h is included in
> a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead of
> obj-y) but include/exec/poison.h should take care of that.
> 

Exactly !

> >> > defining this, you should add
> >> > 
> >> > #include "cpu.h"
> >> > 
> >> > at the top of include/hw/virtio-access.h and leave the definitions in
> >> > target-*/cpu.h.
> >> >   
> > All this bi-endian stuff is really an old-virtio-only thing... it is
> > only to be used by virtio_access_is_big_endian(). The fact that it
> > broke silently with your cleanup series is yet another proof that
> > this workaround is fragile.  
> 
> It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so the
> TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
> 

I was referring to the current situation where virtio_access_is_big_endian()
silently lost its ability to support endian changing guests with:

--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -22,11 +22,6 @@
 
 #include "qemu/option.h"
 
-/* FIXME: Remove NEED_CPU_H.  */
-#ifdef NEED_CPU_H
-#include "cpu.h"
-#endif /* !defined(NEED_CPU_H) */
-

which then leads to the usual ENOMEM errors in the guest:

[    8.959600] blk-mq: failed to allocate request map
[    8.960171] virtio_blk: probe of virtio0 failed with error -12

> Anyway because of poison.h your solution isn't fragile either, so
> 

At least, if someone tries to include virtio-access.h in common-obj-y, she
gets a build break.

> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Paolo
> 

Thanks !

--
Greg

