Received: by 10.25.21.96 with SMTP id l93csp2419781lfi;
        Wed, 22 Jun 2016 04:37:12 -0700 (PDT)
X-Received: by 10.55.65.81 with SMTP id o78mr37739387qka.127.1466595432050;
        Wed, 22 Jun 2016 04:37:12 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si60050854qta.40.2016.06.22.04.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 04:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFgT1-0001gX-In
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 07:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFgS4-0001Mc-3d
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFgS1-0007Ps-Vu
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:36:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bFgRw-0007N9-6U; Wed, 22 Jun 2016 07:36:04 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81AA160C1;
	Wed, 22 Jun 2016 11:36:03 +0000 (UTC)
Received: from work-vm (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MBZxLG017011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 22 Jun 2016 07:36:01 -0400
Date: Wed, 22 Jun 2016 12:35:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160622113558.GF2274@work-vm>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
	<20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
	<CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
	<20160622080234.f57jjn43tcwmvmcd@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160622080234.f57jjn43tcwmvmcd@hawk.localdomain>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 22 Jun 2016 11:36:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set minimum_page_bits
 to 12
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
	Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f5ubJPkJhAMh

* Andrew Jones (drjones@redhat.com) wrote:
> On Tue, Jun 21, 2016 at 08:47:39PM +0100, Peter Maydell wrote:
> > On 21 June 2016 at 19:45, Andrew Jones <drjones@redhat.com> wrote:
> > > On Tue, Jun 21, 2016 at 06:09:34PM +0100, Peter Maydell wrote:
> > >> Since the virt board model will never create a CPU which is
> > >> pre-ARMv7, we know that our minimum page size is 4K and can
> > >> set minimum_page_bits accordingly, for improved performance.
> > >>
> > >> Note that this is a migration compatibility break.
> > >>
> > >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > >> ---
> > >>  hw/arm/virt.c | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > >> index c5c125e..f9b51aa 100644
> > >> --- a/hw/arm/virt.c
> > >> +++ b/hw/arm/virt.c
> > >> @@ -1440,6 +1440,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> > >>      mc->block_default_type = IF_VIRTIO;
> > >>      mc->no_cdrom = 1;
> > >>      mc->pci_allow_0_address = true;
> > >> +    /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
> > >> +    mc->minimum_page_bits = 12;
> > >>  }
> > >
> > > As this breaks migration, then I guess we also need
> > >
> > > @@ -1507,5 +1510,6 @@ static void virt_machine_2_6_options(MachineClass *mc)
> > >  {
> > >      virt_machine_2_7_options(mc);
> > >      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
> > > +    mc->minimum_page_bits = 10;
> > >  }
> > >  DEFINE_VIRT_MACHINE(2, 6)
> > 
> > Doesn't hurt, but are we trying to claim migration
> > compat between different QEMU versions with the
> > versioned-machine names ?
> 
> I'm still learning how best to approach compat/migration concerns.
> I've CC'ed David to help.
> 
> Up until now my main concern has been keeping the RHEL-x.y mach-virt
> (and now upstream versioned mach-virt) type from changing as new
> features are added. In which case, I think the above makes sense
> regardless. With respect to migration I'm unsure of the claims we
> can/should make. IMO, we'd ideally be able to always migrate a
> versioned-machine (obviously running with a QEMU that supports that
> version) to a host with a later QEMU (which, being later, means it
> also supports that version)

Yes, my hope is that any versioned machine type should migrate to
a newer qemu with the same machine type set.

There are really two separate things that we state with the machine
versioning:
  a) that the guest view is the same
  b) that the migration format is the same

Dave

> Thanks,
> drew
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
