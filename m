Received: by 10.80.166.35 with SMTP id d32csp245832edc;
        Thu, 13 Oct 2016 00:40:10 -0700 (PDT)
X-Received: by 10.55.33.21 with SMTP id h21mr5836151qkh.297.1476344410144;
        Thu, 13 Oct 2016 00:40:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si5747356qkc.181.2016.10.13.00.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 00:40:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buacb-0006Lr-K3
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 03:40:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buacV-0006I6-DC
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 03:40:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buacP-0006iq-KG
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 03:40:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1buacP-0006iM-Bj; Thu, 13 Oct 2016 03:39:57 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 735B968803;
	Thu, 13 Oct 2016 07:39:56 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-78.brq.redhat.com [10.40.204.78])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9D7doev028606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Oct 2016 03:39:53 -0400
Date: Thu, 13 Oct 2016 09:39:50 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161013073950.jqezn4k5yqdnmujg@hawk.localdomain>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
	<1476205699-28857-7-git-send-email-peter.maydell@linaro.org>
	<20161012133326.cnzch6lbgeyficqe@kamzik.brq.redhat.com>
	<CAFEAcA87yQcFrx6ibowhRK2xpgNTsn07Afjh_=R761THX9AnGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA87yQcFrx6ibowhRK2xpgNTsn07Afjh_=R761THX9AnGw@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 13 Oct 2016 07:39:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/7] target-arm: Make page
 size a runtime setting
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
Cc: Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KRKlq967mNHm

On Wed, Oct 12, 2016 at 02:40:30PM +0100, Peter Maydell wrote:
> On 12 October 2016 at 14:33, Andrew Jones <drjones@redhat.com> wrote:
> > On Tue, Oct 11, 2016 at 06:08:18PM +0100, Peter Maydell wrote:
> >> Rather than defining TARGET_PAGE_BITS to always be 10,
> >> switch to using a value picked at runtime. This allows us
> >> to use 4K pages for modern ARM CPUs (and in particular all
> >> 64-bit CPUs) without having to drop support for the old
> >> ARMv5 CPUs which had 1K pages.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> >> +    if (!set_preferred_target_page_bits(pagebits)) {
> >> +        /* This can only ever happen for hotplugging a CPU, or if
> >> +         * the board code incorrectly creates a CPU which it has
> >> +         * promised via minimum_page_size that it will not.
> >> +         */
> >> +        error_setg(errp, "This CPU requires a smaller page size than the "
> >> +                   "system is using");
> >
> > I'm not sure about this. IIUC, then with this it won't be possible to
> > create a board that sets up its cpus with the preferred target page bits
> > greater than the cpu's default set above, even when the cpu supports it.
> > For example, I may want a board that will only use AArch64 cpus with 64K
> > pages. In that case I'd like to set the minimum to 16 bits, but then that
> > would result in this error. I think we should only set the default when a
> > preference hasn't already been given. And, maybe we should also provide
> > a maximum to sanity check against? (side note: if we provide a maximum,
> > then we could use it in arch_dump.c for the dump info's block size,
> > which must be the maximum page size the cpu supports.)
> 
> If we had a CPU which supported only 64K pages then we would
> make this if-ladder set pagebits appropriately. But we don't
> have any of those, so it's a bit moot. If the CPU can be
> configured by the guest to use 4K pages then the board
> must not have set the preferred-page-size to something
> larger, or the guest will fall over when it tries it.
> That's what this check is protecting against.

Fair enough and understood, but there is a case where we can know
what page size to use. When booting with -kernel we can probe the
kernel image's header (see Documentation/arm64/booting.txt) If the
magic number matches, then we can check the header flags to see
what the kernel page size is.

An API like the one in this series would be useful for setting
the page size to match the guest kernel's, but only if the API
doesn't override the selection.

> 
> The CPU's maximum page size isn't very interesting for this
> patchset, because we only care about the minimum (which is
> what the TLB needs to use). If the board code was somehow
> buggy and requested a page size greater than the CPU's
> maximum, then it will also be greater than the CPU's
> minimum, and be caught by this error message.

Agreed we don't need a maximum as it is now. I think we may
if we allow preferences to be greater than the minimum though.

Thanks,
drew
