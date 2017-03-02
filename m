Received: by 10.25.0.147 with SMTP id 141csp346715lfa;
        Thu, 2 Mar 2017 07:59:09 -0800 (PST)
X-Received: by 10.237.39.158 with SMTP id a30mr18624448qtd.65.1488470349752;
        Thu, 02 Mar 2017 07:59:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l67si7233286qte.51.2017.03.02.07.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 07:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjT8F-0000rL-5L
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 10:59:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjT8B-0000r8-R3
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 10:59:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjT8B-0002NK-5a
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 10:59:03 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjT8A-0002Mc-V0
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 10:59:03 -0500
Received: by mail-wm0-x22d.google.com with SMTP id t193so15740336wmt.1
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 07:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wuDF0xM3mnInuxZo3fjmlRGMFptELpsn/9nztpkYF7c=;
	b=U12G+ggssR+0dM1bk+JIhPMsubwHjCd+YIZOt/IxeR4PnsgV8dXZkqaLwfBPMBPu1F
	vcGfmhRHBZSqyDFmFBPb6HWO/j3NiCbRQY6Js28Tqd16SzdByMPpKzi9fwRZXZBG9SvA
	ixtpSgib5KriRNIRFWMm2omMbx4XBSuHLGbtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wuDF0xM3mnInuxZo3fjmlRGMFptELpsn/9nztpkYF7c=;
	b=UXNyyMRgU+eXT4Qd9gCoPQI2ciREOYbMJVLJ1g9bK0eXmeoW0Rt1ItzCr07IMrwj9p
	wWdG7aPenoSZoYFKOKAVkp1248F6CSJBvXJVJmHTps97RdgjqLO5I9ZLIvsXmqVcfli4
	pX58ZfezBlK6rDkqDjM+FkEtgTGo2suBe/GzXXJb7mD3qALZVJXadieBVh/tK9jzBmbG
	QTzwn32BUBOQNZ5Np5ncoD8jn5UPeQ94Rgzd23XOO0E7J12dLFnFTYE2427ZlAkM2fz+
	ROc2sZFsnAB2KZRrzd/DRCvAU44CxBW0w7TywZ+1YuDbQvEiWBQKApO89GSygZ5cq59T
	2Seg==
X-Gm-Message-State: AMke39nUKs27/9LWK9aVAJXenpxuWUPdTQ7Xm7tKZI5y+NP8Nh1sMR+hYP59Zf4I8PvTOSAjp2/KJZj5samnF7W4
X-Received: by 10.28.157.67 with SMTP id g64mr8647115wme.111.1488470341711;
	Thu, 02 Mar 2017 07:59:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 07:58:41 -0800 (PST)
In-Reply-To: <20170228215801.10472-2-Andrew.Baumann@microsoft.com>
References: <20170228215801.10472-1-Andrew.Baumann@microsoft.com>
	<20170228215801.10472-2-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 15:58:41 +0000
Message-ID: <CAFEAcA_FiuYxR16TJgNwCz=FYkuXjBNZfizZxAuDGrCAV54fZQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: implement armv8 PMUSERENR
 (user-mode enable bits)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nJZJfHZ9Ohae

On 28 February 2017 at 21:58, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> In armv8, this register implements more than a single bit, with
> fine-grained enables for read access to event counters, cycles
> counters, and write access to the software increment. This change
> implements those checks using custom access functions for the relevant
> registers.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

This looks good to me. Since it is a bug fix I think we can
put it into 2.9. Applied to target-arm.next.

thanks
-- PMM
