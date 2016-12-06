Received: by 10.25.159.131 with SMTP id i125csp1988420lfe;
        Tue, 6 Dec 2016 01:48:48 -0800 (PST)
X-Received: by 10.55.186.3 with SMTP id k3mr59765970qkf.47.1481017728003;
        Tue, 06 Dec 2016 01:48:48 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f61si11290504qtd.103.2016.12.06.01.48.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Dec 2016 01:48:47 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C02FFC0AAB3E;
	Tue,  6 Dec 2016 09:48:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB69mgOR026789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 6 Dec 2016 04:48:44 -0500
Date: Tue, 6 Dec 2016 10:48:41 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, marc.zyngier@arm.com, christoffer.dall@linaro.org,
        andre.przywara@arm.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        peter.maydell@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests RFC 00/15] arm/arm64: add ITS
 framework
Message-ID: <20161206094841.2wi34yfapalf6fth@kamzik.brq.redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 06 Dec 2016 09:48:46 +0000 (UTC)
X-TUID: jFPSVPLTzu9h

On Mon, Dec 05, 2016 at 10:46:31PM +0100, Eric Auger wrote:
> This series proposes a framework to test the virtual ITS.
> This is based on Drew's v7 series [1]. The last patch tests
> several ITS commands (collection/device mapping, interrupt
> translation service entry creation and LPI trigger through INT
> command). At this point we don't use any external PCIe device
> to write into the GITS_TRANSLATER register.
> 
> The bulk of the code derives from the ITS driver code so all
> the credit is due to Marc.
> 
> Many other ITS commands could be tested. Also existing MMIO
> accesses could be enhanced into standalone tests. Current focus
> was to make it functional.
> 
> The code deserves more cleanup with respect to cacheability
> attributes in general.
> 
> Tested on Cavium ThunderX [2].
> 
> Best Regards
> 
> Eric
> 
> [1] [kvm-unit-tests PATCH v7 00/11] arm/arm64: add gic framework
> 
> [2] sample command line:
> 
> $QEMU -machine virt,accel=kvm -cpu host \
>  -device virtio-serial-device \
>  -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
>  -display none -serial stdio \
>  -kernel arm/gic.flat \
>  -smp 8 -machine gic-version=3 -append 'its'
> 
> Eric Auger (15):
>   libcflat: Add other size defines
>   arm/arm64: gicv3: Add some re-distributor defines
>   arm/arm64: ITS skeleton
>   arm/arm64: ITS: BASER parsing and setup
>   arm/arm64: GICv3: add cpu count
>   arm/arm64: ITS: Set the LPI config and pending tables
>   arm/arm64: ITS: Init the command queue
>   arm/arm64: ITS: enable LPIs at re-distributor level
>   arm/arm64: ITS: Parse the typer register
>   arm/arm64: ITS: its_enable_defaults
>   arm/arm64: ITS: create device
>   arm/arm64: ITS: create collection
>   arm/arm64: ITS: commands
>   arm/arm64: gic: Generalize ipi_enable()
>   arm/arm64: ITS test
> 
>  arm/Makefile.common        |   1 +
>  arm/gic.c                  | 101 +++++++++++-
>  lib/arm/asm/gic-v3-its.h   | 238 +++++++++++++++++++++++++++
>  lib/arm/asm/gic-v3.h       |  84 ++++++++++
>  lib/arm/asm/gic.h          |   1 +
>  lib/arm/gic-v3-its-cmd.c   | 399 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/arm/gic-v3-its.c       | 305 ++++++++++++++++++++++++++++++++++
>  lib/arm/gic-v3.c           |   2 +
>  lib/arm/gic.c              |  30 +++-
>  lib/arm64/asm/gic-v3-its.h |   1 +
>  lib/libcflat.h             |   3 +
>  11 files changed, 1154 insertions(+), 11 deletions(-)
>  create mode 100644 lib/arm/asm/gic-v3-its.h
>  create mode 100644 lib/arm/gic-v3-its-cmd.c
>  create mode 100644 lib/arm/gic-v3-its.c
>  create mode 100644 lib/arm64/asm/gic-v3-its.h
> 
> -- 
> 2.5.5
> 
>

Thanks for this Eric! I'm glad to see we're getting more GIC test
coverage written, even before v8 of the gic series is posted :-)
v8 will be rebased on some sysreg stuff Wei is doing for the PMU
series, that's why it's held up. I'll need to set plenty of time
aside to learn enough in order to review all the 'ITS:' patches
in this series. Apologies if I can't get to it right away.

Thanks again,
drew
