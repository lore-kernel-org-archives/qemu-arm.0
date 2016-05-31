Received: by 10.25.27.66 with SMTP id b63csp2081306lfb;
        Tue, 31 May 2016 07:10:24 -0700 (PDT)
X-Received: by 10.140.178.140 with SMTP id y134mr31945720qhy.44.1464703824071;
        Tue, 31 May 2016 07:10:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si23196259qhk.124.2016.05.31.07.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 07:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7kND-0002BB-D8
	for alex.bennee@linaro.org; Tue, 31 May 2016 10:10:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7kN7-00029m-Kr
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7kN3-0001IF-KC
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:10:17 -0400
Received: from e06smtp05.uk.ibm.com ([195.75.94.101]:38323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7kN3-0001Hp-97
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:10:13 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Tue, 31 May 2016 15:10:10 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 May 2016 15:10:06 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7F2CC219005E; 
	Tue, 31 May 2016 15:09:39 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4VEA6Ir5767468; Tue, 31 May 2016 14:10:06 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4VEA5mf011515; Tue, 31 May 2016 08:10:05 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4VEA5rd011501; Tue, 31 May 2016 08:10:05 -0600
Received: from bahia.lab.toulouse-stg.fr.ibm.com
	(bahia.lab.toulouse-stg.fr.ibm.com [9.101.4.41])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 741B322040A;
	Tue, 31 May 2016 16:10:05 +0200 (CEST)
Date: Tue, 31 May 2016 16:10:04 +0200
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160531161004.0d34a9bf@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <CAFEAcA_rsy6D25Yx4Ov+579bQOz35yYKmg9bMSewypBWYA+eYg@mail.gmail.com>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<CAFEAcA_rsy6D25Yx4Ov+579bQOz35yYKmg9bMSewypBWYA+eYg@mail.gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16053114-0021-0000-0000-00001C2724DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.101
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bXvPDdnJr27X

On Tue, 31 May 2016 14:14:15 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 31 May 2016 at 14:10, Greg Kurz <gkurz@linux.vnet.ibm.com> wrote:
> > Hence my tentative to put all the details in one place... would it
> > be ok if I include "config-target.h" to ensure we have the TARGET macros ?  
> 
> No, config-target.h is one of the headers that should never be
> included by any file except osdep.h (and scripts/clean-includes
> will check for this). You're guaranteed that it's always included
> for you.
> 

So we don't even need to include osdep.h in virtio-access.h because we
are sure all .c files that include virtio-access.h also include osdep.h
first. Correct ?

> thanks
> -- PMM
> 

