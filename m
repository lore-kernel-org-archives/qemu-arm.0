Received: by 10.223.159.74 with SMTP id f10csp3941582wrg;
        Tue, 12 Dec 2017 07:18:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBosP0rRdfVv7Qw9MU58SUx8Jr9h1hC0ZQSZRgWa6piF2M4iDZxvvBn4GlgZ81IxShvfRguZ3
X-Received: by 10.129.240.2 with SMTP id p2mr2934361ywm.450.1513091908957;
        Tue, 12 Dec 2017 07:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513091908; cv=none;
        d=google.com; s=arc-20160816;
        b=Aq4qtkXHII39IPaeAhUVV4KFSVpFwi7W7OS+zvOxHVvU/b2TisTNsb1APNPjMnuLUF
         yuLnZ9cnNQp20hM5M2h+SZlOFeU0HY0h9nTjxjfVsWzC81Hu03D+qxaKhbIKuZwP8hGU
         e1fAcRIGlbikgwaXf0vLOK/JiEu/La5+NAv2RkMJdhTj33MRY9lgQmeW8k5FVyrGS2nB
         H35rApE15NL5EScFtD/RxiMmQWRDvMsqlQDDvTtl5y8iWq/nBvWZCLOIXO2Xqrp1V1QC
         DuFDcKsxYmc5ejhk9pvjYHG/AxXQFwd2CKrYKacOg7FqhVGIbU8IW/epVel9fDGzSKC9
         YCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=n807fmfH32BI7OrI3U/b8SRB7ZykxaRQNc1/llhJ2Fw=;
        b=bSXW4jW7DKS0LBA13AM0bS8QVzVVrpVZDrEcN48XS3/cca6P0TwTGzspYDVMGN6NYP
         7wROlJkrjgrSegOOWyTHeMSH896xHSkntxkCvelM478WIPZqVn2NkYOSkCuHPkB3GOdc
         U3AMiSCv2D7lxUcuSriOxrJZGQ3UlKE07CUKGBzQniFQB8wmSu1xcwT7klhyztEV3SMu
         EcBUiCGz/dVEK3SIKOh45NsMrqC0xn37nR3lOFlnxWqNUp6g5KRKy3YqKhmbVxe4n/Ry
         9dH12ARU8nibbsf18+NCz3qoeCvsvS0AHEff4OMb/6N1TRzYaG4YcJ2iry3LlBc5qdRK
         4aZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f74si3523576ywb.457.2017.12.12.07.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 07:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOmKC-0007C9-Ab
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 10:18:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOmIF-0005wj-Ep
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 10:16:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOmI9-0001RC-Oe
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 10:16:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37221)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eOmHx-0001FX-H9; Tue, 12 Dec 2017 10:16:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8BFF49016;
	Tue, 12 Dec 2017 15:16:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 811AF69318;
	Tue, 12 Dec 2017 15:16:07 +0000 (UTC)
Date: Tue, 12 Dec 2017 16:16:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
	<CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 12 Dec 2017 15:16:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another UART to the
 virt board
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F5I/Rh1xuQ+K

On Tue, Dec 12, 2017 at 02:50:50PM +0000, Peter Maydell wrote:
> On 12 December 2017 at 14:45, Andrew Jones <drjones@redhat.com> wrote:
> > Should this be
> >
> >     if (!vmc->no_second_uart && serial_hds[uart_count] != NULL) {
> >
> > A bit late now, but maybe the other UART resource allocations should have
> > been conditional on actually being wired up too?
> 
> What does x86 do?

Looks like they provide the io-ports unconditionally.

> 
> I think the conclusion we came to about UARTs in general was that
> boards should always create the devices, and the UART models
> should cope with being passed a NULL chardev backend. (This
> is like real hardware, where the 2nd UART always exists even
> if you haven't plugged a cable into the 2nd serial port on the
> back of the box.)

Yes, I guess the real hardware analogy provides the justification
for doing it this way.

OK, so this patch is fine, but it kills my suggestion for AAVMF to
only output debug messages to a debug port when the debug port is
actually useful. Now it won't be able to tell the difference unless
we can inform it some other way.

Thanks,
drew

> 
> thanks
> -- PMM
> 
