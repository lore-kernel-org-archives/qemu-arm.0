Received: by 10.25.208.211 with SMTP id h202csp5767lfg;
        Fri, 4 Mar 2016 03:14:52 -0800 (PST)
X-Received: by 10.140.230.18 with SMTP id a18mr9745054qhc.3.1457090092055;
        Fri, 04 Mar 2016 03:14:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si3210296qka.2.2016.03.04.03.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 03:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:40327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abnh5-0004l7-Fj
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 06:14:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abnh2-0004ja-9Q
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 06:14:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abnh1-000322-80
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 06:14:48 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abnh0-00031b-11
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 06:14:47 -0500
Received: by mail-vk0-x231.google.com with SMTP id e6so50409180vkh.2
	for <qemu-arm@nongnu.org>; Fri, 04 Mar 2016 03:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kMLm69i+ktvj4EMCy6mtJ60szgw4TakqJJ9BLXr0fHc=;
	b=X6oLIua2q3ZoWJrlEOrYRrbz7dQy235HlafFfb+j5ZrKR/dYVjXurnvwER0hFVHT+p
	912AoxaVkA+QUJGyfJPdLPPcMt9BV/LGveVagO/KZ/Zbc4TDrcxfVFV0y0Ta3JUUEFF/
	ft4TFLGSNbYdnqCwx5iEp694s7f1gVgGJk0k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kMLm69i+ktvj4EMCy6mtJ60szgw4TakqJJ9BLXr0fHc=;
	b=cgiAX4Cbpd5ynjJn5OhPnQAoQZWei3jyaHjJULf6Um/OJcRL0QVwOI0VGOpn3Pf6Qr
	PObBwimwe1ZaWuTBsq1Bo7l5Sd8OAC9zmcbgnKbIUZEIDpb+WAiwIMizCrl4UcBRvugI
	WIxhLPks6ujSv1O+YQ9UW0HYHWMVdE8Ajh1LTmo4xfu+b+TCxUlg4TRZ/z/IGNZlO5oM
	UI1y2ZFAgBYpgVOguI2pwTCESlJ4sZA7l6z9Rj5llxLAq1DSKMQi5hzCrQ48I0ulhmx2
	hXnWNELWPD/6DeApFgCPSyL7nEELZtPUvzuRzQ0LF3sjkv1iJ8+JzRcthQjAJ21NMmcO
	rQPA==
X-Gm-Message-State: AD7BkJKtN+ZUxj/r6Ve/JrB3VAFKpLR0Y9tu9ZWoDAC4aPLKDCYHl8Np3n3xvPgS5crvlsmTtVCQsR/nECnukRok
X-Received: by 10.31.8.210 with SMTP id 201mr5896334vki.90.1457090085582; Fri,
	04 Mar 2016 03:14:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 4 Mar 2016 03:14:26 -0800 (PST)
In-Reply-To: <20160222224251.GA11654@beta.comsecuris.com>
References: <20160222224251.GA11654@beta.comsecuris.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2016 11:14:26 +0000
Message-ID: <CAFEAcA-pPdUSggMA1zUm+jU2_VkGYpr2wOBKU890w0FSdEszbw@mail.gmail.com>
To: Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] Fix bug: SRS instructions would trap to EL3
 in Secure EL1 even if specified mode was not monitor mode. [RESUBMIT DUE TO
 MISSING SIGN-OFF]
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
X-TUID: UUnLGZsKLBXV

On 22 February 2016 at 22:42, Ralf-Philipp Weinmann
<ralf+devel@comsecuris.com> wrote:
> According to the ARMv8 Architecture reference manual [F6.1.203], ALL
> of the following conditions need to be met for SRS to trap to EL3:
> * It is executed at Secure PL1.
> * The specified mode is monitor mode.
> * EL3 is using AArch64.
>
> Signed-off-by: Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>

Thanks, nice catch. Did you find this by code inspection or
by some sort of test program or real guest code?

>      /* SRS is:
> -     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
> +     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1 and
> +     *   mode is monitor mode

I tweaked this to say "specified mode is monitor mode" just to be
slightly clearer that we're not testing the mode we're currently in.
I have applied it to target-arm.next; thanks!

-- PMM
