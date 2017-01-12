Received: by 10.25.205.13 with SMTP id d13csp1431379lfg;
        Thu, 12 Jan 2017 12:46:29 -0800 (PST)
X-Received: by 10.55.64.67 with SMTP id n64mr5730424qka.137.1484253989295;
        Thu, 12 Jan 2017 12:46:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k133si6897233qke.225.2017.01.12.12.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 12:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRmGS-0006y0-P9
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 15:46:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cRmGL-0006wa-Ec
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 15:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cRmGH-0000gM-Du
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 15:46:21 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cRmGH-0000fJ-6n; Thu, 12 Jan 2017 15:46:17 -0500
Received: by mail-lf0-x242.google.com with SMTP id v186so3435594lfa.2;
	Thu, 12 Jan 2017 12:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hIS7VwvJuHWQOzir3KN2bQNrHqayJ4h1DoigssEHL5Q=;
	b=Tu0AGqV0lkTOQJ3WBSRnrXOFbk+L5dvNic2in6TXqSI4EzazXO6zoKwHJCNyvhQ6ZW
	a/sTvQwu+bYUH4nFmZ1ipoUTY6d+QMoj+NJJ6FGG/q3FK6lb4lW83ATosU7MiZKk5uBw
	YUk7qYU/OpLYqirGozDhPAmlsg/m4k5SaIxG94PIKu1tRgaTc1gR4gw9rYiJ0ER3JbnK
	JU3lGTyJyfU7Ra0/sKSuFdlzn3Nj0ybbj7n7Qq53Ikip5tyJqK8uRg4LvMz8kVyG2kTt
	KfiM/jnXDtriQKiEur77GneGNAlza/DHFewULMaspXu5yuYqfStJ+N948JhF8MkEzHya
	lGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hIS7VwvJuHWQOzir3KN2bQNrHqayJ4h1DoigssEHL5Q=;
	b=SlkctTtQI9STUgSRteXxc9dbF63xvlSwc8b3TVzA99Zgr64c3WpukiHsNV3dMSF633
	lf5TWo/05WR2Z5hApRfExAI2feEv4Hb2FstOq7fg3Vul6mhEDicY8xziDRTGwpJgXGjB
	1scvvlxkotcixqvNy9M6nEbRvkutJI+e00IiZ7OWpZn4VvtcnkIfAdxcrdlv/41OE4dc
	aOhyeOuT1BgikENjuAVRsQX920evlKaH4LHwYpWkMHwyHwTz7f74XSVdvowQyvy3U5gg
	SVkiiACUb4Sh+wcuRAIHSnX4hkljiauwN9eh93UQaORoK3bEj/ENg+u5mwboveRQlYgl
	6JCg==
X-Gm-Message-State: AIkVDXLbUJbsUJAJQHn161h07z0jEmRXsLgQaC8YnEe9KmD3+1twSAGuDSZyYpT1eArTTw==
X-Received: by 10.25.74.196 with SMTP id x187mr5439285lfa.30.1484253975575;
	Thu, 12 Jan 2017 12:46:15 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 98sm2239087ljb.37.2017.01.12.12.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 12:46:14 -0800 (PST)
Date: Thu, 12 Jan 2017 21:46:14 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170112204613.GZ9606@toto>
References: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 0/3] target/arm: Support EL1 AArch32 guest
 under AArch64 EL2
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XP/qpzmL6/Io

On Tue, Jan 10, 2017 at 06:44:06PM +0000, Peter Maydell wrote:
> The GICv3 virt patchset is sufficient to run a 64-bit guest under
> a 64-bit host kernel. To run 32-bit guests under the 64-bit host
> you need a few more things:
>  * data aborts from AArch32 need to provide instruction syndrome info
>    to the hypervisor
>  * the AArch32 interrupt code needs to handle VIRQ and VFIQ
>  * we need a DBGVCR32_EL2 register, because Linux's EL2 code uses
>    it to context-switch AArch32 DBGVCR between guests
> 
> This patchset sits on top of the gicv3-virt patchset and is
> sufficient to run a Linux 32-bit guest under 64-bit Linux host.

Cool stuff Peter, I didn't think we were this close for this to work!

32bit hypervisors would be cool too but I'm guessing there's quite a bit
of work before that works...

Cheers,
Edgar

> 
> Git branch with the whole lot:
>  https://git.linaro.org/people/peter.maydell/qemu-arm.git aarch32-guest
> 
> 
> Peter Maydell (3):
>   target/arm: A32, T32: Create Instruction Syndromes for Data Aborts
>   target/arm: Handle VIRQ and VFIQ in arm_cpu_do_interrupt_aarch32()
>   target/arm: Implement DBGVCR32_EL2 system register
> 
>  target/arm/helper.c    |  21 +++++
>  target/arm/translate.c | 213 ++++++++++++++++++++++++++++++++++++-------------
>  2 files changed, 178 insertions(+), 56 deletions(-)
> 
> -- 
> 2.7.4
> 
