Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6120635wrt;
        Tue, 16 Oct 2018 09:02:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60WrCRrmh6xKjzi9eH48+TW39P59zi3Rjx8ZrVuIADFa1hKKRupVJiKqvAJkekG8Qq2dYrm
X-Received: by 2002:a37:19cd:: with SMTP id 74-v6mr20640967qkz.253.1539705776846;
        Tue, 16 Oct 2018 09:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539705776; cv=none;
        d=google.com; s=arc-20160816;
        b=lwZQYPqda2AR7R2AIdi8PowFJqrpnwxfNxhSgr1qweidjYJi5vGgUWe7g4HX0UVIAt
         I+cFmq8LsMpcNt0r0dnv4gD207uWZtuSSWJTToHhVYySMl1YNgqhgh3bLhoAsXU8tJI1
         8449Hj8IE2PpxuuEgXUxBAXikBAV+Y/RfaG95NLjuISIU8Ucb+5EGktK6NWl+v+cCcsi
         gQdWorWnd4rHfD/ZSUWzYLjitEehpV/P4ku1iN5hGyefrTqhqWCjqY31Uj8gCdAHp3eh
         +fDr909cZCkN2nHhFKp2wt/7Go197n5/U2QsW/hirYIqgSkYQZsiXixqXn3dJ7wI+T17
         LKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=Sz+bnrWbnMMJU3QRC0IdTqirq4FzXBuI7O3CR6FooqA=;
        b=xmQ4n2VcdAnISmw8UMlgqLGZsTmTf+BmTrymzM2xSuxgvPrl0vexQcewhvIyh9xhDf
         5gEeV/0Qe3T++b24vwBQyjvfUVG2b69zTIpH1d5H7PNY62WUm1JYBxNvk9Vzki+/lALU
         vPmmf7fC3mbuXFrmjXoMUl1X/w0ar4niEHfKRvTJr7K2iomsILBekb2EoilVB+mpujDa
         tF9f6ORSRiND+B5//MMwbWhD6Wy2sGTfUtYWQqvHJqOQEhQ3dM65Lo6zlr2BMd8l9TK+
         q3eGx7qKmXOsWoZIOnMzDDG4ejNYYs6eVIFs5WTejDkXg24exfmOwt5RLTN3RDUwwwoJ
         IY1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a193-v6si11327213qkb.20.2018.10.16.09.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 09:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCRo8-0004Nz-CZ
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 12:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andre.przywara@arm.com>) id 1gCRns-0004K2-53
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 12:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andre.przywara@arm.com>) id 1gCRnn-0000Qe-8P
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 12:02:40 -0400
Received: from foss.arm.com ([217.140.101.70]:46500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andre.przywara@arm.com>)
	id 1gCRnm-0008UH-St; Tue, 16 Oct 2018 12:02:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA43D341;
	Tue, 16 Oct 2018 09:02:27 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 589953F71C;
	Tue, 16 Oct 2018 09:02:26 -0700 (PDT)
Date: Tue, 16 Oct 2018 17:02:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Message-ID: <20181016170206.500a12de@donnerap.cambridge.arm.com>
In-Reply-To: <b8a89518794b4436af0c151ed10de4fa@dornerworks.com>
References: <b8a89518794b4436af0c151ed10de4fa@dornerworks.com>
Organization: ARM
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/boot: Increase compliance with
 kernel arm64 boot protocol
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
	Julien Grall <julien.grall@arm.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sD67p6U6kcWK

On Tue, 16 Oct 2018 15:06:29 +0000
Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com> wrote:

Hi, 

> "The Image must be placed text_offset bytes from a 2MB aligned base
> address anywhere in usable system RAM and called there."
> 
> For the virt board, we write our startup bootloader at the very
> bottom of RAM, so that bit can't be used for the image. To avoid
> overlap in case the image requests to be loaded at an offset
> smaller than our bootloader, we increment the load offset to the
> next 2MB.
> 
> This fixes a boot failure for Xen AArch64.

Thanks for that, works for me.

> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre.
