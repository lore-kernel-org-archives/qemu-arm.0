Received: by 10.25.77.4 with SMTP id a4csp368228lfb;
        Wed, 15 Mar 2017 08:32:46 -0700 (PDT)
X-Received: by 10.200.46.208 with SMTP id i16mr3427480qta.13.1489591966256;
        Wed, 15 Mar 2017 08:32:46 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u128si1644918qkf.301.2017.03.15.08.32.45;
        Wed, 15 Mar 2017 08:32:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8924E40B40;
	Wed, 15 Mar 2017 11:31:09 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJiljLLejRGK; Wed, 15 Mar 2017 11:31:08 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7F05B40962;
	Wed, 15 Mar 2017 11:31:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1E61440BD2
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 11:31:07 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 561CZ-GZRSjq for <kvmarm@lists.cs.columbia.edu>;
 Wed, 15 Mar 2017 11:31:06 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id EA2D6400E9
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 11:31:05 -0400 (EDT)
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
 (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2ED677F359;
 Wed, 15 Mar 2017 15:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2ED677F359
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
 dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
 spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2ED677F359
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
 by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 v2FFWcSg005109
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 15 Mar 2017 11:32:40 -0400
Date: Wed, 15 Mar 2017 16:32:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Christoffer Dall <cdall@linaro.org>
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Message-ID: <20170315153237.fsozm4j3h7ykrvqj@kamzik.brq.redhat.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
 <20170128145551.sknp447ieue56xgo@hawk.localdomain>
 <20170315115044.GO1277@cbox>
 <20170315125113.erfl2gk6fwmbccsn@kamzik.brq.redhat.com>
 <20170315133645.GQ1277@cbox>
 <20170315140633.jtultotyihql7qlr@kamzik.brq.redhat.com>
 <20170315152237.GR1277@cbox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170315152237.GR1277@cbox>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 15 Mar 2017 15:32:42 +0000 (UTC)
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: kwPDlUzwX7yI

On Wed, Mar 15, 2017 at 04:22:37PM +0100, Christoffer Dall wrote:
> On Wed, Mar 15, 2017 at 03:06:33PM +0100, Andrew Jones wrote:
> > On Wed, Mar 15, 2017 at 02:36:45PM +0100, Christoffer Dall wrote:
> > > > If QEMU wants to know
> > > > whether or not the host it's running on is heterogeneous, then
> > > > it can just query sysfs, rather than ask KVM.
> > > > 
> > > 
> > > Can it?  Is this information available in a reliable way from userspace?
> > 
> > I don't know much (anything) about it, but, afaict, yes. See
> > https://lkml.org/lkml/2017/1/19/380
> > 
> > > > > I'm sure I missed some aspect of this discussion though.
> > > > 
> > > > Me too. As we discussed, it's probably time to try and hash out a fresh
> > > > design doc. It'd be good to get a clear design agreed upon before
> > > > returning to the patches.
> > > > 
> > > 
> > > Yes, it's on my list.
> > 
> > I'm happy to help with this, even to take a stab at the first draft. Just
> > let me know if you or Shannon prefer to do the draft yourselves. If you
> > don't have a preference, then I can start working on it pretty soon.
> > 
> I'd be really happy for you to draft a new design doc, and I can review
> in private or publicly first as you prefer.
>

OK, I'll hopefully have something pulled together by the end of next week.

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
