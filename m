Received: by 10.25.77.4 with SMTP id a4csp346204lfb;
        Wed, 15 Mar 2017 07:43:05 -0700 (PDT)
X-Received: by 10.200.34.250 with SMTP id g55mr3286390qta.155.1489588985634;
        Wed, 15 Mar 2017 07:43:05 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id z32si1561624qtg.133.2017.03.15.07.43.05;
        Wed, 15 Mar 2017 07:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 02D0E40BDD;
	Wed, 15 Mar 2017 10:41:29 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=ham
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuc-ay+EK2bM; Wed, 15 Mar 2017 10:41:28 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1AE2040AE8;
	Wed, 15 Mar 2017 10:41:28 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 9540C40A86
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 10:41:26 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y85gctdfjVI5 for <kvmarm@lists.cs.columbia.edu>;
 Wed, 15 Mar 2017 10:41:25 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 7E6B740A7F
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 10:41:25 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
 [10.5.11.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF2E2C04BD47;
 Wed, 15 Mar 2017 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF2E2C04BD47
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
 dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
 spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CF2E2C04BD47
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D0F2D5C1;
 Wed, 15 Mar 2017 14:42:59 +0000 (UTC)
Date: Wed, 15 Mar 2017 15:42:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Message-ID: <20170315144257.vgh3vf3k4avrbuot@kamzik.brq.redhat.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
 <20170128145551.sknp447ieue56xgo@hawk.localdomain>
 <20170315115044.GO1277@cbox>
 <20170315125113.erfl2gk6fwmbccsn@kamzik.brq.redhat.com>
 <20170315133645.GQ1277@cbox>
 <20170315140633.jtultotyihql7qlr@kamzik.brq.redhat.com>
 <CAFEAcA_O3282tyQwK=eAyc5EYPZdETE2RuZT0dnZ7NCEWwP9aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA_O3282tyQwK=eAyc5EYPZdETE2RuZT0dnZ7NCEWwP9aQ@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 15 Mar 2017 14:43:02 +0000 (UTC)
Cc: Christoffer Dall <cdall@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
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
X-TUID: Y9IgZFs69Knz

On Wed, Mar 15, 2017 at 02:21:48PM +0000, Peter Maydell wrote:
> On 15 March 2017 at 14:06, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Mar 15, 2017 at 02:36:45PM +0100, Christoffer Dall wrote:
> >> > If QEMU wants to know
> >> > whether or not the host it's running on is heterogeneous, then
> >> > it can just query sysfs, rather than ask KVM.
> >> >
> >>
> >> Can it?  Is this information available in a reliable way from userspace?
> >
> > I don't know much (anything) about it, but, afaict, yes. See
> > https://lkml.org/lkml/2017/1/19/380
> 
> AFAICT that won't work if the CPU you're trying to
> look at the ID registers for happens to be offline at
> the time you're looking at it.
>

Hmm, OK, but I think the jury is still out on whether QEMU even
needs to know this information. If we push the burden up to the
user/libvirt, than this information can be obtained [somehow] at
the higher level. The higher level can then choose to use generic,
if no vcpu affinity is desired, or, if one of the heterogeneous
cpu types is preferred for the vcpu's model, then it can also
ensure the vcpu is affined to the appropriate cpuset.

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
