Received: by 10.25.27.66 with SMTP id b63csp2083572lfb;
        Tue, 7 Jun 2016 09:00:38 -0700 (PDT)
X-Received: by 10.55.31.140 with SMTP id n12mr222053qkh.4.1465315234120;
        Tue, 07 Jun 2016 09:00:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si14408939qkf.188.2016.06.07.09.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 09:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAJQf-0002dw-Gs
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 12:00:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAJIN-00037e-9i
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 11:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAJIL-0005OG-DQ
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 11:51:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bAJII-0005Ms-6u; Tue, 07 Jun 2016 11:51:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EA5C20A9B;
	Tue,  7 Jun 2016 15:51:53 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-86.brq.redhat.com [10.40.204.86])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57Fpnga015514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 7 Jun 2016 11:51:51 -0400
Date: Tue, 7 Jun 2016 17:51:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160607155149.wpqsavmouhdr63iq@hawk.localdomain>
References: <1457717778-17727-1-git-send-email-wei@redhat.com>
	<CAFEAcA_FU3LdJLWrYLcv0WAugiYfnOxfDFgs6oRFVRaUEs1L-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_FU3LdJLWrYLcv0WAugiYfnOxfDFgs6oRFVRaUEs1L-g@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 07 Jun 2016 15:51:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V1 0/2] Versioning ARM virt machine types
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
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mLnT7AfcTH44

On Tue, Jun 07, 2016 at 04:17:09PM +0100, Peter Maydell wrote:
> On 11 March 2016 at 17:36, Wei Huang <wei@redhat.com> wrote:
> > We start to see more features been added to ARM virtual machine models.
> > For the purpose of backward compatibility (e.g. migration), it is time
> > to consider versioning machine types for ARM VMs. As a beginning step, this
> > patchset defines an abstract machine type for ARM VMs. The current
> > "virt" machine is re-written based on this new abstract type accordingly.
> > These patches have been verified by booting existing VMs.
> >
> > RFC->V1:
> >  * Rename the machine type to "virt-2.6", matching the imminent QEMU version
> >  * Remove mc->is_default (Peter's comment)
> 
> So is there a plan to provide a virt-2.7 for the next release?

Yup. I was planning to send it as part of a small "hw/arm/virt: add
cpu-map" series I pretty much have ready, but didn't finish and send
yet because I got distracted working on the larger plan (among other
things). The motivation (larger plan) for cpu-map is full cpu-topology
configuration, but working on that has led to an smp parameter rework
RFC (hoping to send this week...) Wei or I can just send the virt-2.7
patch now though to get it done sooner than later.

Thanks,
drew
