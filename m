Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1389901wrq;
        Fri, 15 Jun 2018 15:50:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKSPadhZG53RTYOfak44evieVVvw46X+sUopz+w1jsIKKz4Dh6CjANkHSHJeKL+uoScAjfd
X-Received: by 2002:a0c:99df:: with SMTP id y31-v6mr3179900qve.156.1529103023429;
        Fri, 15 Jun 2018 15:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529103023; cv=none;
        d=google.com; s=arc-20160816;
        b=0DfG8WgXDEtrObu24KmATqsrB+JO/Gql7csOUpFSxPsUb7AyTLl27SynFqPFV5TcXY
         xuBIxHzXPBend0j1j04XJJYuf/AMR1OYtBP72GgtpAnzc4vRuVnmYESAsr/ZhNvC5pUB
         Hqka/5iCqxTziMP1TE0e4MtowJt1C69ITJpugeNlu+STrOydQFsHVo0f4BKOtm7sdcTA
         XNedVSmRAFD5sg1rmE6N7yzYnklJ4owD2WVKscDGDo1S9RorGLBn6aDKHlUzCFRuLp3u
         fVigM7O5yZyyYsI3/mD2p4h5A3xHYcHjbmTeodiqIxecl5S3jGkY9oKPHpTW4tmB19Y2
         oTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=t+rfMC2+TwgIZWNjVlaGjkXEEDVpiLSYAFVEId2fUOU=;
        b=W26iN3YFNnbBz7ybfKYXrYZOMBmn+FfnTzdle2oQgWXzul9Yo+zgGPFLDQPah2kUWZ
         iUUUV1Q6oKyjsmkq1/2YfLXShmQbcu7U3WpUEHck6HrSwaqzFbUbSjfd6oEx8QyzM3Hu
         iF47iMQcLX1p5T8Y3KHOTOFWEgSCWZgmF8i7OIFYPr4VQ70+3anzxp1ItecP6xCc7pZT
         OPkVAx2HqQNPo98ezfHdzaz2oP4aqyi36pDBSqLs2IwUEfwUuYJH3q5Gi4gqGcPWu++h
         YQQT1w4i5Khu8xi4wO/u2PQzOnJBZhI9H+7cpIY7ahJKfwk74fG7eOEmiYlTI7W+bYFl
         NhbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=sR3bezcx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m47-v6si2875472qtk.212.2018.06.15.15.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 15:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=sR3bezcx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTxXz-0002Xu-0r
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 18:50:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fTxXs-0002XQ-54
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 18:50:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fTxXp-0007mI-1k
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 18:50:16 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:42007)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>) id 1fTxXo-0007Ww-PQ
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 18:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t+rfMC2+TwgIZWNjVlaGjkXEEDVpiLSYAFVEId2fUOU=;
	b=sR3bezcxvYEse1ybKCDTzsIZkL
	l54t34SD1Caosf1C8B7etj6GZ+9frCljY/T31lL+PGKFzDj4PRz8jP2D++d1gn8Deh3YYx+qCB/0u
	OvaSVVkkp+2p9BsNJbtknRz+KTWHS3tbs7AGfJRZkfgw2D95ujhvpQxjpql0NIu5sj3pGpKX/dzYD
	FU8ActObmPAritmAnzsjNlpggqRS34RqWbw4lrxujj75DPZJAPhv2KgKOBoHSiTCHc6fFov8OrPt4
	Fmac93bzfO2zePUOAq6PZ7KxyGonvx4irMaz41goEhU+/eVJt44B+3ZQrGp/VJQXWfOxNsWH25R0f
	Kqlc3/RA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:49756 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fTxXc-00As9z-4f; Fri, 15 Jun 2018 22:50:00 +0000
Date: Fri, 15 Jun 2018 15:49:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180615224959.GA3257@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180615181331.GA29302@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LArvcuvJA1ol

On Fri, Jun 15, 2018 at 11:13:31AM -0700, Guenter Roeck wrote:
> Hi Peter,
> 
> On Fri, Jun 15, 2018 at 02:54:33PM +0100, Peter Maydell wrote:
> > 
> > Note that for M profile QEMU, the thing you pass to -kernel
> > must be be either (a) a raw image file which starts with a
> > vector table and is intended to be loaded at address zero,
> > or (b) be an ELF file which we will load at whatever address
> > it asks, but which must include a vector table at address
> > zero, because we don't honour the ELF entrypoint address
> > but instead always load the initial SP and PC from the
> > vector table.
> > 
> That was useful.
> 
> After hacking qemu to accept the ELF start address and to set
> initial_msp to 0 (a whopping 6-line patch), I get a bit further.
> The boot now hangs because the devicetree blob is not recognized.
> Does qemu load and pass the provided dtb file ? I didn't
> immediately find any code doing it for armv7m/an385.
> 

So, I didn't find anything because it is not there. I was able to pass
the fdt in some hackish way. This is the end of the resulting log (with
-d exec):

Trace 0: 0x7fffcf797400 [00000000/210d2440/0x11280001] mps2_early_write
Trace 0: 0x7fffcf7975c0 [00000000/210d170a/0x11280001] uart_console_write
Linking TBs 0x7fffcf7975c0 [210d170a] index 0 -> 0x7fffcf797940 [210d171a]
Trace 0: 0x7fffcf797940 [00000000/210d171a/0x11280001] uart_console_write
Linking TBs 0x7fffcf797940 [210d171a] index 0 -> 0x7fffcf797ac0 [210d1728]
Trace 0: 0x7fffcf797ac0 [00000000/210d1728/0x11280001] uart_console_write
Trace 0: 0x7fffcf797c00 [00000000/210d2424/0x11280001] mps2_early_putchar
Linking TBs 0x7fffcf797c00 [210d2424] index 1 -> 0x7fffcf797e00 [210d2432]
Trace 0: 0x7fffcf797e00 [00000000/210d2432/0x11280001] mps2_early_putchar
Trace 0: 0x7fffcf797fc0 [00000000/210d1730/0x11280001] uart_console_write
Linking TBs 0x7fffcf797fc0 [210d1730] index 0 -> 0x7fffcf798080 [210d1714]
Trace 0: 0x7fffcf798080 [00000000/210d1714/0x11280001] uart_console_write
Linking TBs 0x7fffcf798080 [210d1714] index 0 -> 0x7fffcf797940 [210d171a]
Trace 0: 0x7fffcf797940 [00000000/210d171a/0x11280001] uart_console_write
Chain 0: 0x7fffcf797c00 [00000000/210d2424/0x11280001] mps2_early_putchar
Linking TBs 0x7fffcf797c00 [210d2424] index 0 -> 0x7fffcf7981c0 [210d243e]
Trace 0: 0x7fffcf7981c0 [00000000/210d243e/0x11280001] mps2_early_putchar
Linking TBs 0x7fffcf7981c0 [210d243e] index 0 -> 0x7fffcf797c00 [210d2424]
Trace 0: 0x7fffcf797c00 [00000000/210d2424/0x11280001] mps2_early_putchar

At this point it is stuck. I'll try to find out why.

Guenter
