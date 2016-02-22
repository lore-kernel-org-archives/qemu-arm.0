Received: by 10.25.208.211 with SMTP id h202csp1221315lfg;
        Mon, 22 Feb 2016 06:47:58 -0800 (PST)
X-Received: by 10.55.79.17 with SMTP id d17mr34519378qkb.56.1456152478335;
        Mon, 22 Feb 2016 06:47:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si11323103qgt.99.2016.02.22.06.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 06:47:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@koconnor-net.20150623.gappssmtp.com
Received: from localhost ([::1]:49490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXrmH-0007Pj-Kk
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 09:47:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1aXrmF-0007Oy-AD
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 09:47:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1aXrmD-0001er-3C
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 09:47:55 -0500
Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234]:32895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1aXrmB-0001eg-Pr
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 09:47:53 -0500
Received: by mail-qg0-x234.google.com with SMTP id b35so112057767qge.0
	for <qemu-arm@nongnu.org>; Mon, 22 Feb 2016 06:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=koconnor-net.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R/cdChiPUhjTLEX1+G0aOS3hxfHuNs8tHp/jxKLsjvs=;
	b=UqIcKhrrpWpkz0x42dd2kjZkq/MBCn47sOAc55XulMqrMnw3S4/AbSJ/MR1q/nqyOG
	P9SosNiK+M1JLX3HfWP6npjxRD1CaPsUPOyYdpBGsHOCEbgbybvv9Jsh1x8MzmFe9d1Q
	b2hFiQOhFyRg5nDIzWzyGN2KKB40T2G67Yf6VIKvL2WaeL8gCtetGrBliqwlu9YCodas
	JTlVRqo7ekurMEL6pxuC7COLdhuFfagzcJ9DZv/Vpi0pvISWNwq/7yJToDehBA4cx1wB
	Hkxi+ngeDR2oDoNneiD9iSxexMB7delbM3rx0wd+Uop8YsKWHHvWWDhNjAZQI1NULD/+
	kdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=R/cdChiPUhjTLEX1+G0aOS3hxfHuNs8tHp/jxKLsjvs=;
	b=Lq2qo0AMGD7pSZQqheuMwGNPJ/RG9gYJ1MJX1+l7Grnh450AZLHOkMQn9AUFNeFH05
	BWFhZFKjkJEY6zFU19ysQoVY9tYnuwHpUycrYKK2o5y0jQKPTK1W18Xo1C/aiTh8fxDw
	fPNOKsaMEtwMr9EdWXnOFJQn41XlxtN4BuMeSqZQqoZX6ijKIY3dU4Npy0Wd9laNix8f
	kQRVJzwLOp6UFYtrp/W2II1rjs/9rt54KEy1pxTUQ5QTi9ahQnW3prwy+AHx39NTmsq7
	+4SFe82tVyXm7qGXas7X4CXADYv/WJjA5Gz1JLbosvQN9kl0UYb8VtCZfXbipqV8vHYf
	nRmg==
X-Gm-Message-State: AG10YOQ7L97NgtEnIpQlzBWzv2Hr8uU+1O4h01bDZz6mi45arlBoPbPwEhCDIL1EcBDQSA==
X-Received: by 10.140.93.87 with SMTP id c81mr35461684qge.46.1456152471058;
	Mon, 22 Feb 2016 06:47:51 -0800 (PST)
Received: from localhost
	(209-122-232-221.c3-0.avec-ubr1.nyr-avec.ny.cable.rcn.com.
	[209.122.232.221]) by smtp.gmail.com with ESMTPSA id
	z124sm10288870qhz.46.2016.02.22.06.47.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 06:47:50 -0800 (PST)
Date: Mon, 22 Feb 2016 09:47:49 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20160222144749.GA6977@morn.lan>
References: <1456144729-17196-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456144729-17196-1-git-send-email-mst@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH RFC] fw-cfg: support writeable blobs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8PzjVN8yX1UI

On Mon, Feb 22, 2016 at 02:41:38PM +0200, Michael S. Tsirkin wrote:
> Useful to send guest data back to QEMU.
> The write interface is restricted to DMA.
> 
> Suggested-by: Kevin O'Connor <kevin@koconnor.net>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
>  hw/lm32/lm32_hwsetup.h    |  2 +-
>  include/hw/loader.h       |  4 ++--
>  include/hw/nvram/fw_cfg.h |  3 ++-
>  hw/arm/virt-acpi-build.c  |  2 +-
>  hw/core/loader.c          | 19 ++++++++++++-------
>  hw/i386/acpi-build.c      |  4 ++--
>  hw/nvram/fw_cfg.c         | 36 ++++++++++++++++++++++++++++--------
>  7 files changed, 48 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
> index 838754d..805b445 100644
> --- a/hw/lm32/lm32_hwsetup.h
> +++ b/hw/lm32/lm32_hwsetup.h
> @@ -74,7 +74,7 @@ static inline void hwsetup_create_rom(HWSetup *hw,
>          hwaddr base)
>  {
>      rom_add_blob("hwsetup", hw->data, TARGET_PAGE_SIZE,
> -                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL);
> +                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL, true);
>  }

Instead of supporting "writable blobs", I wonder if it would be
simpler for both firmware and qemu to implement an "ioctl" like
interface.  That is, just directly invoke a new fw_cfg callback from
fw_cfg_dma_transfer() with the data obtained via dma_memory_read().  I
think that may be more flexible because then the QEMU code doesn't
have to check for changes to a blob - it would instead be immediately
invoked upon a change.

-Kevin
