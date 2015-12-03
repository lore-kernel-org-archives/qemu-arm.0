Received: by 10.182.158.201 with SMTP id ww9csp3735941obb;
        Thu, 3 Dec 2015 05:44:39 -0800 (PST)
X-Received: by 10.140.36.232 with SMTP id p95mr11049281qgp.55.1449150279065;
        Thu, 03 Dec 2015 05:44:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v21si2716709qka.79.2015.12.03.05.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 05:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:35332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4UBa-0001NF-MX
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 08:44:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4UBY-0001M7-FT
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 08:44:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4UBX-0005sa-Hr
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 08:44:36 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4UBX-0005sH-EA
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 08:44:35 -0500
Received: by vkca188 with SMTP id a188so45726623vkc.0
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FEgH3IpwPz6egZiQvV5xsijFWn7BWiVEgAYXlGnwwNo=;
	b=ljaqBid2KkSSuSCTYsxzKou10bQzhpjoYkNUGFfg8ZiQpS3zLDNCHVjkBuHIL83osi
	DoIUYV2zUEWSQwafNN5qS17cfLqovza17xmK3XYyxBImqsSMwP1HhMKjOtZGGMFYdw4k
	vuhX47GN8sAxmYrpurh+sXmJs6y2FGC7CP8jIvzKabmCgIvYj/lTj+3v225YCq9c9vZc
	pQkBM0MAUr+TiJR4gOl2VNKSBileEUjVbSlwvrFM5zPjF7xrQx0wFAxnFITSw0yCw3pU
	2E/BSFQMhKsNU7w4Qc8ZBM+lyVzNgm29c+eOPP2hyn5qj5bNo2Kptxhmfnv3OTPHeYSM
	v1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FEgH3IpwPz6egZiQvV5xsijFWn7BWiVEgAYXlGnwwNo=;
	b=KX1DD2Qg7AIW17/eLqnQQ1PyQirmE3t6F6Yp25+hP4LTsrDCBBwNI+fRZhfloQjRqm
	LjeLXOxfPXLsbFW6CvZiPflc5teeqJWaFJtLW5joM471PD8ppmWKUiM+lEgXOsAG0ybB
	v4Ly82a6D2qomu0bxFmoGAo5lNgDVPci6bjfv789kmtnbKx3hc6rw20+0JJB7zAPKq7i
	vGbJIdSo4CoGNS+Qp9Waznq+s+V3wo//pFkp/knwX55ifzFG/ucDRdqH28wkLVpA+wWp
	OYBqCwPfXBdlyJYDZlUDjQbyrfVLiwsBeX6yHavnDtVadAD47jAczoC8F3Yy9x5v8FKX
	1E+Q==
X-Gm-Message-State: ALoCoQlTWnhbHxVPlNYG8jPxAi/6i3cEERnr8lJEEoaO+BbQPS44YqKZsNOF8h1l5vRfc/7g4kYH
X-Received: by 10.31.16.214 with SMTP id 83mr5508169vkq.139.1449150275057;
	Thu, 03 Dec 2015 05:44:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 05:44:15 -0800 (PST)
In-Reply-To: <1448411877-22019-5-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-5-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 13:44:15 +0000
Message-ID: <CAFEAcA9Dtc2yc=xdyuiYrXxUffgtr7nRMpU86XXQfHkArDJaGA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v2 4/6] dump: allow target to set the
	physical base
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
X-TUID: zyGpoU+sZaZG

On 25 November 2015 at 00:37, Andrew Jones <drjones@redhat.com> wrote:
> crash assumes the physical base in the kdump subheader of
> makedumpfile formatted dumps is correct. Zero is not correct
> for all architectures, so allow it to be changed.
>
> (No functional change.)
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
