Received: by 10.182.158.201 with SMTP id ww9csp108326obb;
        Wed, 9 Dec 2015 15:09:49 -0800 (PST)
X-Received: by 10.140.248.70 with SMTP id t67mr2190132qhc.97.1449702589388;
        Wed, 09 Dec 2015 15:09:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a13si11346203qkb.114.2015.12.09.15.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 15:09:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@koconnor-net.20150623.gappssmtp.com
Received: from localhost ([::1]:38153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6nrp-0002cl-1v
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 18:09:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1a6nrS-0002KE-KB
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 18:09:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1a6nrN-0004fr-Hk
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 18:09:26 -0500
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229]:33454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin@koconnor.net>) id 1a6nrN-0004fZ-9b
	for qemu-devel@nongnu.org; Wed, 09 Dec 2015 18:09:21 -0500
Received: by qgea14 with SMTP id a14so106875352qge.0
	for <qemu-devel@nongnu.org>; Wed, 09 Dec 2015 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=koconnor-net.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NBL4uaX1lOMa3ukS0dd8gXO5UjkSw0jDdNtBZbAgcaY=;
	b=tjz8ytonI37n46dJGjC6Duker0gJ2QXTKAQgzFIjwOCoSE9rLS9ESgtQ1rqVFNPoUj
	vYQGPRxJxHHHINjZYpV8ZKyFSUKLEDvAK6r6jXR4hH+gmv0A2eKxsGyJZY4Cx7j7Qj8d
	vmE+f1UJP2By4feMTQNvSryZgvdpbniUXVDj7rSHt2RHnzDLHpAOjUSgSb0QjSLBMYU2
	o1mbnWD5kKm83OzNaDyDZucKP3Ya8VEeC3CFRbbx9dnR/CudzzzvsUBrdNxwRZaJLYho
	t+9bLjkjtd8IuoaPMx+FsdIGU7PGPNXscBaMKQTz+iHyrORIfUFbsb5JB7rBu23C2KJq
	PzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=NBL4uaX1lOMa3ukS0dd8gXO5UjkSw0jDdNtBZbAgcaY=;
	b=ZORIfpWKVY/ZgeEy8onMAXk9gxFyRFnsWNqTuMvnoKBzuvIWkTVV8I0LbyN5K9p1Nl
	iG32l7udmcHe42ga1wIciEcN0LZnFwTlR38crxHvY797er7RDAjelN5pQ7CIHGamoUZl
	wCyCAiB/hTe0TJcb/l7LbooUgu5SJn8tYyVN101in2dMhiVBWiisUBBuHe7e0x4mK6Fd
	9NFLPqKH366xBLVglK+dcLKYcFqtzZKvspWt9IRAXvYj/NjtfZ3FrZ/r5lSYIb8IRhNW
	C51H+ueWMEPJUBGfoQpUvSyfMgCG5zV/1zGgVpTb9xZP/H8xrCTYFmb6iunNaiteGxlM
	xLgw==
X-Gm-Message-State: ALoCoQnORu2oN4h7fvJ8MB+zVmEcmvQ++J+E4OKwCMmHhc3Vy92E5eCMVG2BibNx+xFVaCfynoK/Bwgo4WkXTbwetIjiWiiNvg==
X-Received: by 10.140.251.215 with SMTP id w206mr2068737qhc.73.1449702560555; 
	Wed, 09 Dec 2015 15:09:20 -0800 (PST)
Received: from localhost
	(209-122-232-221.c3-0.avec-ubr1.nyr-avec.ny.cable.rcn.com.
	[209.122.232.221]) by smtp.gmail.com with ESMTPSA id
	y199sm4790880qhb.4.2015.12.09.15.09.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Dec 2015 15:09:19 -0800 (PST)
Date: Wed, 9 Dec 2015 18:09:19 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Message-ID: <20151209230918.GA14387@morn.lan>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
	<BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::229
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	=?iso-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HGBy9QZ9gxty

On Wed, Dec 09, 2015 at 10:54:38AM -0800, Peter Crosthwaite wrote:
> On Wed, Dec 9, 2015 at 10:17 AM, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> >> Sent: Tuesday, 8 December 2015 23:40
> >> On Tue, Dec 8, 2015 at 10:19 PM, Andrew Baumann
> >> <Andrew.Baumann@microsoft.com> wrote:
> >> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> >> > I do not observe this behaviour on the real Pi2 (and it breaks UEFI). The
> >> hardware semantics appear to be "if the command generates a response,
> >> but you didn't want to see it, we'll successfully complete the command and
> >> ignore the response", whereas the sdhci implementation raises an error for
> >> this as well as signalling completion. I have read the "SD Specifications Part A2
> >> SD Host Controller Simplified Specification Version 2.00", but did not find
> >> anything describing this case, so it could be that this is open to interpretation.
> >> (It could also be specified in SDHC v3.) The specific error also seems odd -- my
> >> understanding is that a "command index" error means that the index in the
> >> response didn't match the index of the issued command, but that's hardly
> >> what is happening here.

FYI the SDHCI v3 spec is available online.  Confusingly, it's listed
as an addendum instead of explicitly as the sdhci spec.  The file is
partA2_300.pdf .

-Kevin
