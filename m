Received: by 10.182.158.201 with SMTP id ww9csp250356obb;
        Fri, 11 Dec 2015 11:01:27 -0800 (PST)
X-Received: by 10.140.143.208 with SMTP id 199mr18003499qhp.84.1449860487319;
        Fri, 11 Dec 2015 11:01:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d77si21427055qkb.20.2015.12.11.11.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 11:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@koconnor-net.20150623.gappssmtp.com
Received: from localhost ([::1]:49159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7SwZ-0006Pm-4D
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 14:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1a7SwU-0006P6-8m
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 14:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1a7SwQ-0006P7-9r
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 14:01:22 -0500
Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234]:35999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1a7SwQ-0006Nk-6Z
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 14:01:18 -0500
Received: by qgcc31 with SMTP id c31so204898893qgc.3
	for <qemu-arm@nongnu.org>; Fri, 11 Dec 2015 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=koconnor-net.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8pTAOIhlyZOsilK1rQWrjgdJtPpWHQ1S73t8D42PdsU=;
	b=rDTfSxh1AJYuEc45MAHW8uARmsyoL4n7Qybzzg9EhwmazEfvO7WWSc9PBRx/wlxNnV
	TN9Hyc0XWghWuBM6eJEcMcYXbuGXhWxrH3coOoqc/J59bdT3roGiQclXFQOILr6WsFTC
	AAiTAAt6Ym0fgymj6gPjMl1h/iEvJp/9zE4qFOkffRmZIxrVR5TF0SAeYzXGro/ddJ8X
	A1rd3SW9WALcjeObTOLPuRImEaqLv+C73BqRXXG7oDF6uQMYV8EMfWSeOUZQ9Z5kO22w
	FL978EKIceFY/lh9wg1BDlvwv/jC1I4ynsnagSqfKy2L/NQ/ywIJqPzj2cJlnc7svxPS
	6mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=8pTAOIhlyZOsilK1rQWrjgdJtPpWHQ1S73t8D42PdsU=;
	b=HBMMhpFvmTFBGCPhULssYHva2SMUriKspm4sPD7Us0lNUb7CNUchrj3lYACmIz7CEy
	Dlh+t/q5ScW+mVCIPnCdv/u2tIJqZVFB7bySkiue/+QVcNGrUh4RPCaMquIL+oM6dryc
	xmawE9H9yFtRE5pa6dAqjHOdnzgknxx9zpxQjUX5ec9XU+HpwYPo5DbmhEYAK0O20PgQ
	vzmLSEUMMGrciO9dttqeZva/eb3WuMotry1QURD9K9IoTnCuumuE8bsXphwPVARkC5sZ
	0J9Yz8Vg8MJdqrK/8lPGDhL7wTf53YgnJ8IIy+shpim28CBLGolS4Zu45LU1cM3F9cAg
	Uj0A==
X-Gm-Message-State: ALoCoQkjLsZmXFJ3Cqh0+yRYk+86N6HMNWmgmdfBMrmRSAI25mOY3sYj65PgBVQFERWh0/i5AJEruGHKwZGWCK3pKkoQ8zpS8A==
X-Received: by 10.140.101.233 with SMTP id u96mr25461351qge.70.1449860477263; 
	Fri, 11 Dec 2015 11:01:17 -0800 (PST)
Received: from localhost
	(209-122-232-221.c3-0.avec-ubr1.nyr-avec.ny.cable.rcn.com.
	[209.122.232.221]) by smtp.gmail.com with ESMTPSA id
	r66sm8661232qhb.35.2015.12.11.11.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 11:01:16 -0800 (PST)
Date: Fri, 11 Dec 2015 14:01:15 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151211190115.GA5710@morn.lan>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-6-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-6-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::234
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 05/10] hw/sd/sdhci.c: Update to use SDBus APIs
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
X-TUID: t48wrrxZLaQ5

On Fri, Dec 11, 2015 at 04:37:06PM +0000, Peter Maydell wrote:
> Update the SDHCI code to use the new SDBus APIs.
> 
> This commit introduces the new command line options required
> to connect a disk to sdhci-pci:
> 
>  -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive

I can't review in depth right now, but I did notice

[...]
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -55,6 +55,9 @@
>          } \
>      } while (0)
>  
> +#define TYPE_SDHCI_BUS "sdhci-bus"
> +#define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)

the above PXA2XX typo

[...]
> @@ -1303,6 +1323,7 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>      memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
>              SDHC_REGISTERS_MAP_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
> +
>  }

and the above white space damage.

-Kevin
