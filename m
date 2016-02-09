Received: by 10.25.159.19 with SMTP id i19csp1654988lfe;
        Mon, 8 Feb 2016 18:08:27 -0800 (PST)
X-Received: by 10.140.167.86 with SMTP id n83mr39920125qhn.41.1454983707592;
        Mon, 08 Feb 2016 18:08:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11si23465111qgj.90.2016.02.08.18.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 18:08:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@koconnor-net.20150623.gappssmtp.com
Received: from localhost ([::1]:50837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSxj9-0005VA-3f
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 21:08:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1aSxj6-0005UW-R0
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 21:08:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1aSxj3-0008PI-NJ
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 21:08:24 -0500
Received: from mail-qg0-x243.google.com ([2607:f8b0:400d:c04::243]:33438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1aSxj2-0008Os-Gb
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 21:08:21 -0500
Received: by mail-qg0-x243.google.com with SMTP id y89so4773377qge.0
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=koconnor-net.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0vT27FIhgK0j6BGMjJRQYCeOt1knMCVUe+eEhwwba/Q=;
	b=dox1OwylCG8F6Ew1A7NtKpAPDGZAa4vY3Go4JdPbiQ3wZx6E2zhTjKYIjBnQaC5q1a
	luMo+etdS1h19Ao+9USCPq6Qvmi1GBhxazV76j5cr086Mr6MCo+GdZAvsRMGBaI6S8Tz
	0fIZlvgrYwcLEWU7AupE6EmbXisUPmTcyGNXfrIxhnggW4/cig14AC2J6BhGrIycIl7M
	mNr5GoFI+fYbdzVRIaDikWwmydu34eyeZoorcoq1IwDqmS2opCaz8Ri0U8X72eLtZr39
	IDq5fsbL3X8ODSZoQMhhiK8tpSVCW311cYRqTB58OF6Uqig+LkxnY1FbMpG5hnI0x5jQ
	o6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0vT27FIhgK0j6BGMjJRQYCeOt1knMCVUe+eEhwwba/Q=;
	b=MwRCssa/TUeiWN5CckglapwFVkjnPLT/KEqslEFdWGz8ol37H/9SIpu8ZylgcA3PKe
	vkG++pG0oVxmv+9/L81bU5OKjUYkb65HXSDGqMJhccuKZC1BiS9DndFheHO2wcFdx7wn
	ENktMRvZ3NkfmVay17c/rVgJ2yk4ZRlzfeOdiKgMR3XsGYOd/0cVpQfDEIxYLUBS1ZjD
	EVAk89nL07u+PS/FpXD/GE3J7VtJ6Xfec7rtBh6X6hvISzk6cZRmPsOGksGj2mDcl0XX
	ajepPduXW04ldaAxoGGkHV4GTaWQHXwTyhEe+c6uMVJeqm90DamhdZz7juUQLNLpwF68
	jWaA==
X-Gm-Message-State: AG10YOT9NVQA6VdOEXttQHPcWAZDgE1lkhQqNKuhX1GGpXEuH2h8lUYbRviPsEZv5+xA0Q==
X-Received: by 10.140.176.19 with SMTP id w19mr40601125qhw.59.1454983699978;
	Mon, 08 Feb 2016 18:08:19 -0800 (PST)
Received: from localhost
	(209-122-232-221.c3-0.avec-ubr1.nyr-avec.ny.cable.rcn.com.
	[209.122.232.221])
	by smtp.gmail.com with ESMTPSA id 66sm14946714qhp.4.2016.02.08.18.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Feb 2016 18:08:19 -0800 (PST)
Date: Mon, 8 Feb 2016 21:08:18 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160209020818.GA11662@morn.lan>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::243
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/10] hw/sd: QOMify sd.c (and pxa2xx_mmci)
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
X-TUID: VMASrR2KND4y

On Fri, Jan 22, 2016 at 04:16:32PM +0000, Peter Maydell wrote:
> This series attempts to QOMify sd.c (the actual SD card model),
> including a proper QOM bus between the controller and the card.
> 
> This series removes the experimental x-drive property on sdhci-pci;
> the syntax for using that device changes:
> 
> instead of using the x-drive property:
> 
>   -device sdhci-pci,x-drive=mydrive -drive id=mydrive,[...]
> 
> we create a specific sd device (which is autoplugged into the
> sdhci-pci device's "sd-bus" bus if you don't manually connect them):
> 
>   -device sdhci-pci -drive id=mydrive,[...] -device sd-card,drive=mydrive
> 

FWIW, the series looks fine to me.

Thanks,
-Kevin
