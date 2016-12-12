Received: by 10.25.205.13 with SMTP id d13csp1550916lfg;
        Mon, 12 Dec 2016 02:11:16 -0800 (PST)
X-Received: by 10.55.119.2 with SMTP id s2mr79860945qkc.1.1481537476169;
        Mon, 12 Dec 2016 02:11:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s28si25938146qtb.186.2016.12.12.02.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Dec 2016 02:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGNZj-0005Lg-Ll
	for alex.bennee@linaro.org; Mon, 12 Dec 2016 05:11:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGNYu-0005J9-P1
	for qemu-devel@nongnu.org; Mon, 12 Dec 2016 05:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGNYt-0000v5-Sy
	for qemu-devel@nongnu.org; Mon, 12 Dec 2016 05:10:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGNYm-0000rz-Rg; Mon, 12 Dec 2016 05:10:16 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1E064E4D3;
	Mon, 12 Dec 2016 10:10:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCAABh8024513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 12 Dec 2016 05:10:13 -0500
Date: Mon, 12 Dec 2016 11:10:10 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161212101010.eb74etmg6gjcx5ew@kamzik.brq.redhat.com>
References: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
	<1481301020-21777-5-git-send-email-peter.maydell@linaro.org>
	<20161211163502.GB6352@cbox>
	<CAFEAcA_zvNvJ7K5GgPyeJ5EWRxO1XL2=rc6dv_nT6_h3qF=m6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_zvNvJ7K5GgPyeJ5EWRxO1XL2=rc6dv_nT6_h3qF=m6A@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 12 Dec 2016 10:10:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/4] hw/arm/virt: Don't incorrectly claim
 architectural timer to be edge-triggered
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eg+6GoNo1oKZ

On Sun, Dec 11, 2016 at 10:52:25PM +0000, Peter Maydell wrote:
> On 11 December 2016 at 16:35, Christoffer Dall
> <christoffer.dall@linaro.org> wrote:
> > On Fri, Dec 09, 2016 at 04:30:20PM +0000, Peter Maydell wrote:
> >> +     * For backwards-compatibility, virt-2.8 and earlier will continue
> >> +     * to say these are edge-triggered, but later machines will report
> >> +     * the correct information.
> >>       */
> >
> > Is this really necessary?
> 
> It's being conservative -- from the guest's point of view
> (any guest, not necessarily just Linux) "virt-2.8" should behave
> like the "virt" machine in the 2.8 QEMU release, including bugs,
> not providing newer devices, and so on.
> 
> Andrew would be the expert on whether this is being unnecessarily
> conservative in this specific case.

I agree that all DT and ACPI (we need the equivalent change to the GTDT)
changes should require compatibility code. We should document a list of
mach-virt change types that require machine version consideration
somewhere. I can ask our migration experts to help me pull a list
together.

Thanks,
drew
