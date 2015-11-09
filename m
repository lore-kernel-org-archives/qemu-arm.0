Received: by 10.182.105.169 with SMTP id gn9csp1240299obb;
        Mon, 9 Nov 2015 08:04:50 -0800 (PST)
X-Received: by 10.140.98.195 with SMTP id o61mr17146505qge.70.1447085090701;
        Mon, 09 Nov 2015 08:04:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f98si961292qge.78.2015.11.09.08.04.50
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 09 Nov 2015 08:04:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvow6-0004Ye-0v
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 11:04:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvovQ-0003Ht-2M
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 11:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvovP-0006Td-8q
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 11:04:07 -0500
Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232]:34376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvovP-0006TT-5N
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 11:04:07 -0500
Received: by ykfs79 with SMTP id s79so42976933ykf.1
	for <qemu-arm@nongnu.org>; Mon, 09 Nov 2015 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=035MvBeeFzTG6SEKEDEEjAgZDj4Zs6vrP5gG66sU7rY=;
	b=mO4PEMSz0b8V/FkZhjOympbRBowv1lr5y+BFpqpFp4/4tKkE10OU7+qukL/7BUF/F7
	242pq2DmxyR9yaibYe37Ioi83Lx52Q/Y3fKac7PSCRCjdYEN+bZp3GP+rV1Fkzj2FkNx
	reKXtlq9MhVbILX4LPS7HtmJWcEWMSxGpG/4LOalaDTxA84BMJ7hxXWKOumYuyZ8SqcN
	BJEt+F9c21q9T1WzAQJlschFED14ux4Fm9HlHqunvZWsyWilQBHOnd49K6QnN6XED5IJ
	pPOir875Gq05IshLNyitEyRwZKGS5/007X8ErWgGRFC6ks2c3oKfuAKBuXyPrI/bioPf
	iE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=035MvBeeFzTG6SEKEDEEjAgZDj4Zs6vrP5gG66sU7rY=;
	b=MZM5/fbMqg1djEiE75UJLj37K6nxrBPlDEtMJEO9Mqr1Scrl0VaTs9WyoCM08bcmhj
	eGGLKuKxw/A65g90MJygj1NtIVDG2dp3r65v5ip4MXSYmN+j6ba3yB8ROTZAqUgXCno4
	wWyZvwA4YUi6C9IJ86kgmQH/2RNSqdXTZgZdik+TQoiUhcpfulJQpFuyTb+iLcpyAOMD
	c/mVgc+oS3zdN/HaLjQ/QFgKSouE6+SM3j7H/GnmLI6P4DVHxy0ICQZZ2LEAqhjTj6cu
	W4jWGBiiOQ5KvmFD0sF5PPn8Jf33O+a4AIQmkmroFMdfKipMBaOMp/YDRJeL3Kd+ugIC
	UKSA==
X-Gm-Message-State: ALoCoQkJiieaX1H5Q/nkkaWhJUudK2ff+Z7r4mDbLYVo+CweGSgiUOl/AcWCbPANYHRbUnPQNfuU
X-Received: by 10.129.99.9 with SMTP id x9mr23861539ywb.345.1447085042168;
	Mon, 09 Nov 2015 08:04:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 08:03:42 -0800 (PST)
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 16:03:42 +0000
Message-ID: <CAFEAcA9Po7Gf341ODGm0Atkr2BgHR2AOuf3hrG_nT0mWp0XnTQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::232
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH for-2.5 v4 0/3] ARM: Highbank: Highbank: Add
	monitor support
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
X-TUID: tXQoOaI/Xfk8

On 9 November 2015 at 07:10, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Hi,
>
> This adds dummy monitor support to the Highbank board. It is needed by
> the Highbank kernel which expects a monitor to be present.
>
> A feature is added to arm/boot's board_setup feature, that allows the
> board_setup entry point to be entered in secure mode (which is needed
> to configure a monitor).
>
> This feature does not play nice with -cpu override, but cpu override
> is not valid for well-defined ARM SoCs. So defeature -cpu for Highbank.
>
> Regards,
> Peter
>
> See indiv. patches for detailed change logs.

Applied this version to target-arm.next, thanks.

-- PMM
