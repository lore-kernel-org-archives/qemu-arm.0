Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp252766wrg;
        Fri, 7 Jun 2019 07:25:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPI7puVZl1vTGdWMAgWPygsnalEOq30LDzrFsgW5xyQVkpiH773L8EWMsOM+vGHdaLJ/c2
X-Received: by 2002:a05:620a:1411:: with SMTP id d17mr2379819qkj.137.1559917546920;
        Fri, 07 Jun 2019 07:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559917546; cv=none;
        d=google.com; s=arc-20160816;
        b=PkuBji+pBdFViD8mNQKtmZ5/DnsSWCS3yb+0gnrylLFy5l9vsG86Ts65ke9CWLimUk
         LT9J4F2nVdIakOUb1LOdTwZqkb3porpCRDSme1XH5pa3FsuDtSACv3qIYjnvjtKPU7qq
         NxBQ0bFrHhSEIoJ/sIgaWvY3b1NaTD6n+gHE0rTGwyJD7J6V0A90izJmo8ld118aG25V
         k+LiCpBrd+d9rjvsT3f/kpRgDJ741Fxjv6hR3bXoQMwUpAYgNnFVT8ZtQBvJbUk7VMa6
         IluWeWhKyESG61EpjuIW9bPa65QAT2SDbrcfDZ/00adQ2oRn373MGwz1JU60NZDGfMp8
         h/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=SyJYTvWXMRqkTMfag4CgmBuk4s5wGr1C3MhGOBW7v+Q=;
        b=HBlZJSMf7iscDT6LTkvWYJtinBrawk3RnRUz4ta1dRFjolrSC3593q/2vdRic7QEM4
         lzDcCa6MLvO7i/hXyNIzU2SD7AKSGUOvxA2ixMN1XXJzkE3TI6TJE/4ffiQStbFWe+d1
         3nZu3cyC/9VXPqbw71vRRz4XUnk1lL93LMu95T/zSDv6e3MogLDe+TNRkykMqEQqEp1R
         Nks5HEywZ054WmGH8c9MxQHd2k67k1qycfFR/LULTrBNDIbctUaPQUb4PZb7HhQ2LoRb
         KtsBRRCEYIQwXd5AIwQVZbznu7zGD0bcMpxmnBTx4FMBiuuxc7mLZcAcmuyfl6mZngRW
         jPXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id l1si1187887qvn.149.2019.06.07.07.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 07:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZFoQ-0000Wl-Gd
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 10:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49464)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.rutland@arm.com>) id 1hZFXF-0004Ea-GU
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.rutland@arm.com>) id 1hZFX9-00067r-8E
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:07:58 -0400
Received: from foss.arm.com ([217.140.110.172]:39408)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <mark.rutland@arm.com>)
 id 1hZFWm-0005Qp-Km; Fri, 07 Jun 2019 10:07:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0300337;
 Fri,  7 Jun 2019 07:07:28 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A0583F71A;
 Fri,  7 Jun 2019 07:07:27 -0700 (PDT)
Date: Fri, 7 Jun 2019 15:07:21 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190607140720.GA18706@lakrids.cambridge.arm.com>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516144733.32399-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.110.172
Subject: Re: [Qemu-devel] [PATCH v2 0/4] hw/arm/boot: handle large Images
 more gracefully
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3jtRCZClrpsM

Hi Peter,

Sorry for the delay in replying to this...

On Thu, May 16, 2019 at 03:47:29PM +0100, Peter Maydell wrote:
> 
> This patchset attempts to fix https://bugs.launchpad.net/qemu/+bug/1823998
> which reports that we don't handle kernels larger than 128MB
> correctly, because we allow the initrd to be placed over the
> tail end of the kernel. AArch64 kernel Image files (since v3.17)
> report the total size they require (including any BSS area that
> isn't in the Image itself), so we can use that to be sure we
> place the initrd sufficiently far into the RAM.
> 
> Patches 1 and 2 are new since v1; patches 3 and 4 are the old
> patches 1 and 2 (and are basically unchanged since v1).
> 
> Patches 1 and 2 in this series are new. Patch 1 fixes bugs
> in the existing code where we were assuming that we could
> treat info->ram_size as the address of the end of RAM, which
> isn't true if the RAM doesn't start at address 0. (This
> generally went unnoticed thanks to the magic of unsigned integer
> underflow turning end-start calculations into very large max_size
> values for load_ramdisk_as() and friends.)
> Patch 2 adds some explicit checks that we don't try to put things
> entirely off the end of RAM (which avoids those accidental
> underflows).
> Patch 3 in this series adjusts our "where do we put the initrd"
> heuristic so that it always places it at least after whatever
> our best guess at the kernel size is. (This might still not
> be right for images like self-decompressing 32-bit kernels, where
> there's no way to know how big the kernel will be after
> decompression.)
> Patch 4 makes load_aarch64_image() return the
> kernel size as indicated in the Image file header, so that for
> the specific case of AArch64 Image files we will definitely not
> put the initrd on top of them.

With all 4 patches applied, I'm able to boot kernels with large BSS
segments (~128M, ~512M, and ~1G), and I get sensible warnings when they
are impossible to boot, e.g.

# 124M of RAM
[mark@gravadlaks:~/repro]% ./vmboot.sh ~/Image.test-128M
qemu-system-aarch64: kernel '/home/mark/Image.test-128M' is too large to fit in RAM (kernel size 155500544, RAM size 130023424)

# 150M of RAM
[mark@gravadlaks:~/repro]% ./vmboot.sh ~/Image.test-128M
qemu-system-aarch64: Not enough space for DTB after kernel/initrd

So feel free to add:

Tested-by: Mark Rutland <mark.rutland@arm.com>

Thanks for putting this together; this is _really_ useful for my testing
setup, and the warnings above are likely to save people a lot of
head-scratching in future. It would be great to see this merged. :)

Thanks,
Mark.
