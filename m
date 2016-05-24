Received: by 10.25.30.65 with SMTP id e62csp692358lfe;
        Tue, 24 May 2016 05:23:49 -0700 (PDT)
X-Received: by 10.200.42.177 with SMTP id b46mr3669249qta.97.1464092629437;
        Tue, 24 May 2016 05:23:49 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u46si2279207qtb.63.2016.05.24.05.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 May 2016 05:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3074D49479;
	Tue, 24 May 2016 12:23:48 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u4OCNhBH010087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 24 May 2016 08:23:46 -0400
Date: Tue, 24 May 2016 14:23:43 +0200
From: Andrew Jones <drjones@redhat.com>
To: Christoffer Dall <christoffer.dall@linaro.org>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        alex.bennee@linaro.org, kvmarm@lists.cs.columbia.edu
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH 00/10] arm/arm64: add gic
 framework
Message-ID: <20160524122343.qw23iihg5c2eevi5@hawk.localdomain>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
 <20160518090714.GA3827@cbox>
 <20160523152423.2zc26na33jt2abdi@hawk.localdomain>
 <20160524115819.GC3582@cbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160524115819.GC3582@cbox>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 24 May 2016 12:23:48 +0000 (UTC)
X-TUID: BXgcUIHwPeyP

On Tue, May 24, 2016 at 01:58:19PM +0200, Christoffer Dall wrote:
> On Mon, May 23, 2016 at 05:24:23PM +0200, Andrew Jones wrote:
> > On Wed, May 18, 2016 at 11:07:14AM +0200, Christoffer Dall wrote:
> > > Hi Drew,
> > > 
> > > Thanks for doing this.  I'm happy to see some tests for the GIC.
> > > 
> > > I've been pondering with how to write unit tests for all the MMIO
> > > implementations.  If you have some thoughts on how that could be easily
> > > fitted into this framework, that would probably be a good place to do it
> > > ;)
> > 
> > Hi Christoffer,
> > 
> > Sorry for my slow response, I've been on vacation. For MMIO
> > implementations, are you referring to the emulation done for
> > gicv2 accesses and for gicv3 legacy accesses? And, if so, is
> > your question how we might be able to use the same test
> > framework for both? And, if that's so, then I think this series
> > gets us pretty close already. If I'm completely off-base, then
> > please give me a quick high-level description of what you'd like
> > to be able to do.
> > 
> What I meant was testing all the MMIO accesses to the various
> distributor MMIO regions.
> 
> For example, writing full words to all registers (some value) reading
> back the value, correcting for RAZ/WI semantics, and testing that byte
> accesses to those registers where that's allowed also works.

OK, understood. We can build a table that describes each distributor
offset's allowed access types and expected read-back results for the
"default enablement" of the gic. Then, we'd run through that table
doing a refresh of the gic enabling before each offset test. This
series provides everything needed for that, except the offset table.
It should be pretty easy to add.

Now, configuring the gic differently will result in some offsets
producing different values, so we'll eventually want to extend the
table to check the same offsets using different gic enable functions
as well, but that would be pretty easy to do too.

> 
> If adding that on top of this series sounds like a good idea, someone
> should add it to the bottom of their (presumably already long) todo
> list, myself included.

They do sound like good tests to have. I've added it to the middle
of my long TODO. If somebody beats me to it, I won't complain :-)

Thanks,
drew
