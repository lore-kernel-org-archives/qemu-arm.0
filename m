Received: by 10.25.0.147 with SMTP id 141csp340097lfa;
        Thu, 23 Feb 2017 10:52:51 -0800 (PST)
X-Received: by 10.237.34.14 with SMTP id n14mr10986997qtc.224.1487875971603;
        Thu, 23 Feb 2017 10:52:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14si3920929qka.137.2017.02.23.10.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 10:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgyVU-0002Da-V9
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 13:52:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyNn-0002xE-4J
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:44:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyNm-0002fd-9Z
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:44:51 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgyNm-0002fL-2j
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:44:50 -0500
Received: by mail-wm0-x235.google.com with SMTP id v77so37856882wmv.1
	for <qemu-devel@nongnu.org>; Thu, 23 Feb 2017 10:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C7T90CPhN/4C7Mw4hY2XFWCADtya9i995isqgzaSH+g=;
	b=Wy/AHn+Gpecjc9RtBoFNYg4tTc4mQagERAGpqkl+xXFMmj5WcN1ZyNTQCVltaTynqt
	kM7EbV/5PbxED5Dm6HigWrcqPO2Js6QBJ6xcZXJJAavadYzwK9jElOlXTqtQsBtPxinY
	NvMRfMD5b7Q4HJdfjCYZYhKyVMsuj9avhfA6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C7T90CPhN/4C7Mw4hY2XFWCADtya9i995isqgzaSH+g=;
	b=uRimf981xdMG3tjoiL9KGVFE51aSugnmVooTbrY35YnQEL1BVAlOmPinRbUUbu11nL
	ZDl5OYU+asIGtWf/2OxXvofpurZ9Wq2euA+fQScMjTtgpnJXP+TjaojBbfx5XnDf0By1
	2Y7tB7UVjS+YmJW5qj429iKz87uA/xtl0JSTqogs8NWfA8EYd82l6xDQSY3GvBhgDS8D
	UKl1arI4jVxl8fpfz/U9wzMO5gU6yk8lnmSgykNA9V/ld4ptgHs9jQv6Rxel6bZ4xUo+
	FqnyKrk6C1EV8g2jx+kmR3VPt4ZnTMxv5apvvbpTJkaPumrjn7UcnMJiAYmUifjMd3r/
	d9Tg==
X-Gm-Message-State: AMke39m0zhNoZKEdQ/G7Ho1Pl0mmVGPBcAfGGDaDYLsqjS0S9l/cdwB05d6ptVeVKPSTf901lnENDgmIRbjNvo8O
X-Received: by 10.28.55.199 with SMTP id e190mr5992368wma.92.1487875489053;
	Thu, 23 Feb 2017 10:44:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 23 Feb 2017 10:44:28 -0800 (PST)
In-Reply-To: <20170222112338.25492-1-clement.deschamps@antfield.fr>
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2017 18:44:28 +0000
Message-ID: <CAFEAcA8=nouAmHZbs-VBabx=kkGzdWFNJ4kFJTh2B4Uemd9_Cg@mail.gmail.com>
To: Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH v2 0/3] add sdhost and gpio controllers to
 the bcm2835 platform
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rEa5zOCF7Mk2

On 22 February 2017 at 11:23, Clement Deschamps
<clement.deschamps@antfield.fr> wrote:
> This patches add the Arasan SDHost controller and the GPIO controller to the BCM2835/36 platforms.
>
> This patches have been tested with raspbian 2015-09-24 (which uses the SDHCI controller),
> and raspbian 2017-01-11 (which dynamically switches to the SDHost controller).
>
> Note: In order to properly boot the kernel, you will first need to apply the
> BCM2835 hardware RNG patch submitted recently.

Wow, that was fast. Are these patches entirely your own work or did
you start with something from Andrew's tree or elsewhere? (I'm wondering
if we need extra signed-off-by lines in the commit messages.)

thanks
-- PMM
