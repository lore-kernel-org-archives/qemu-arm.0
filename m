Received: by 10.25.208.211 with SMTP id h202csp1725951lfg;
        Mon, 7 Mar 2016 20:34:31 -0800 (PST)
X-Received: by 10.140.19.52 with SMTP id 49mr32900652qgg.103.1457411671718;
        Mon, 07 Mar 2016 20:34:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p105si1249521qgp.1.2016.03.07.20.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 20:34:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad9Lr-0003K7-9h
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 23:34:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9Lo-0003Jg-HM
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9Ln-0000F7-No
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:34:28 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9Ln-0000Ev-J4
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:34:27 -0500
Received: by mail-vk0-x236.google.com with SMTP id e185so4319179vkb.1
	for <qemu-arm@nongnu.org>; Mon, 07 Mar 2016 20:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YDdOWLhxlx11oLbwq0A5b54ofnO0dy510/cSf4snjVE=;
	b=S06Ja1s1XcIc6EEUeNojbsUueEAuTinnrD25xDk51pth2muCCU9fSUXmZ2O0wJJyXF
	dlyHG66EYWseH6F+BjIFe2obRQRl4cZVHlBJnijikgnjpnnmV5GSO91eldwR/fxXH7y7
	MmqdY95IxFSFaPtHU0IMlQqa5L20WaXKheJOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YDdOWLhxlx11oLbwq0A5b54ofnO0dy510/cSf4snjVE=;
	b=KOJFdkLwf25bpGufPMoATweaN02CFs5e13XUuHzede5oX8rmQKaH7JjonMOKx8ikik
	qEc/CbEEu5W4fgEfvN8WQeXS+uSn7iv38I2fuEVfuI1NSXOHDd1SjmrAYFZO9mVIXwUR
	9IEwU3MdbhU0q6gAIpYpD2bZ5N11+hOi1/LcUdlrvfAS9wSCxqVa3PucC8ENWzlQ7NS1
	nWPE3ZomvuMt/RV96nbtWv8Sb3ouT3WrDxBnxfwmJBMRhXtePcaPtsRu9S+36MMJzfB6
	vf2S3Aj1r2qyaOWmH+cg4PotepyCHELe7yZ+L87THm7+gl4nJKp5sf31rtRaA6i85ibw
	Q4sA==
X-Gm-Message-State: AD7BkJJQUgbOFZ2buqjlK3N7wFpaF5gQlLlLr+DPt32bIOel5KapW9eKz5P4SIzjYl4AOSSDoPtf9LJ4MjR3n3gE
X-Received: by 10.31.194.130 with SMTP id s124mr24286703vkf.92.1457411667204; 
	Mon, 07 Mar 2016 20:34:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 7 Mar 2016 20:34:07 -0800 (PST)
In-Reply-To: <1457029479-11312-5-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1457029479-11312-5-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 11:34:07 +0700
Message-ID: <CAFEAcA_0Drfy04SDytRZo_SKF7WLORh+xP9ZYVriZiXQGQZ5Vw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 4/5] bcm2835_property: implement
 framebuffer control/configuration properties
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
X-TUID: gOEJ0fYBTxrD

On 4 March 2016 at 01:24, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> The property channel driver now interfaces with the framebuffer device
> to query and set framebuffer parameters. As a result of this, the "get
> ARM RAM size" query now correctly returns the video RAM base address
> (not total RAM size), and the ram-size property is no longer relevant
> here.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
