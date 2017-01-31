Received: by 10.25.77.65 with SMTP id a62csp83822lfb;
        Tue, 31 Jan 2017 10:35:42 -0800 (PST)
X-Received: by 10.55.127.2 with SMTP id a2mr22620213qkd.319.1485887742892;
        Tue, 31 Jan 2017 10:35:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w54si12561071qta.206.2017.01.31.10.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 10:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYdHK-0000CL-BM
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 13:35:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1cYcGW-0006bL-F5
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 12:30:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1cYcGV-0006Yd-GU
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 12:30:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1cYcGV-0006Y7-AM; Tue, 31 Jan 2017 12:30:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8460580F8E;
	Tue, 31 Jan 2017 17:30:46 +0000 (UTC)
Received: from t450s.home (ovpn04.gateway.prod.ext.phx2.redhat.com [10.5.9.4])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0VHUkhq008430; Tue, 31 Jan 2017 12:30:46 -0500
Date: Tue, 31 Jan 2017 10:30:44 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20170131103044.66316989@t450s.home>
In-Reply-To: <1485880595-16376-1-git-send-email-thuth@redhat.com>
References: <1485880595-16376-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 Jan 2017 17:30:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/vfio: Add CONFIG switches for
 calxeda-xgmac and amd-xgbe
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M4l0br4sJQ+7

On Tue, 31 Jan 2017 17:36:35 +0100
Thomas Huth <thuth@redhat.com> wrote:

> Both devices seem to be specific to the ARM platform. It's confusing
> for the users if they show up on other target architectures, too
> (e.g. when the user runs QEMU with "-device ?" to get a list of
> supported devices). Thus let's introduce proper configuration switches
> so that the devices are only compiled and included when they are
> really required.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 2 ++
>  hw/vfio/Makefile.objs           | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 6de3e16..a78be51 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -94,6 +94,8 @@ CONFIG_VERSATILE_PCI=y
>  CONFIG_VERSATILE_I2C=y
>  
>  CONFIG_PCI_GENERIC=y
> +CONFIG_VFIO_XGMAC=y
> +CONFIG_VFIO_AMD_XGBE=y
>  
>  CONFIG_SDHCI=y
>  CONFIG_INTEGRATOR_DEBUG=y
> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
> index c25e32b..05e7fbb 100644
> --- a/hw/vfio/Makefile.objs
> +++ b/hw/vfio/Makefile.objs
> @@ -2,7 +2,7 @@ ifeq ($(CONFIG_LINUX), y)
>  obj-$(CONFIG_SOFTMMU) += common.o
>  obj-$(CONFIG_PCI) += pci.o pci-quirks.o
>  obj-$(CONFIG_SOFTMMU) += platform.o
> -obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
> -obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
> +obj-$(CONFIG_VFIO_XGMAC) += calxeda-xgmac.o
> +obj-$(CONFIG_VFIO_AMD_XGBE) += amd-xgbe.o
>  obj-$(CONFIG_SOFTMMU) += spapr.o
>  endif

I can't say that I fully agree that this is a good idea.  How many
users are actually confused by this, versus the benefit of ensuring
that it builds across all architectures?  Do we want to make platform
also specific to ARM and spapr specific to ppc64?  Thanks,

Alex
