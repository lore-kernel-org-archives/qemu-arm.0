Received: by 10.182.158.201 with SMTP id ww9csp989122obb;
        Tue, 17 Nov 2015 13:50:21 -0800 (PST)
X-Received: by 10.13.240.66 with SMTP id z63mr42764637ywe.261.1447797021876;
        Tue, 17 Nov 2015 13:50:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si28630436ywf.297.2015.11.17.13.50.21
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 13:50:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:60804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zyo8r-0002qV-Ea
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 16:50:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyo8p-0002qI-BI
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 16:50:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyo8o-00081j-Bw
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 16:50:19 -0500
Received: from mail-yk0-x230.google.com ([2607:f8b0:4002:c07::230]:34219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyo8o-00081Y-8W
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 16:50:18 -0500
Received: by ykfs79 with SMTP id s79so31499562ykf.1
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Q6U6fc4/kStGERtGDKkQ1H+/RU5PxVo9+xSB0UtVN/0=;
	b=tp7OdzHBTq6tGADibzk1uMvEfipGK8NXE8xAOL+XRQPWO8RCIFGZJ3qmC4jA7m+IwZ
	G5xVoB2NREKg0uEC9yaDZGDRM626MZ9YzxBDtXsNSH9pDCbq3SjxcnkzLqvQAdWL7ghl
	UpQ131gDbK0lpVO1N+Ef7s/2e+4PhRMHZrCFUzFGw9KA0qK0zrKkMuUvZL9/Ko1pIjiV
	Ks2qxIwavwTKkf2xOynP/ki6XTNaANoY36+k9Snd8QB+7a5WCjwoMCOZWuJ+0TTXtg/m
	v/zcakNsEprNgct2U7FQrI5OnsODhAvbwYdXYt08RuHeux38PjNQYTZKYKXzeRoeGiH3
	HfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Q6U6fc4/kStGERtGDKkQ1H+/RU5PxVo9+xSB0UtVN/0=;
	b=DdOYW7M8xWQ4Pg/rTBqIBFt262LjGLiCu3msWV1v7YqV1cUi20GBBKJ44zsBiXsKj7
	7hBQfJZBuyl1s9hDi6eyqUlO6dB4YnC2hWvm8IRuMfkAZTxbk3j2Nk+2QF/stFCjchih
	TXl35w9zE5WvM4fAtFNTq5fs6vsrOdWf+6LTIUPs+wQJuk0CWQLlqk+6bPGQ3iNmY6ZS
	59QYDB3u5v2RWvfIKF1mqfLzj2VdALPOfCX4gMb71G+l/WGfXXTCGsBwwa+Bi5r0/Pth
	WVg5A+UBJflK2195tGLkGE6QJyXIQ7BPC/wgyhY0BVdLDWlsVKDgdlTmdSPtKUMUZlH5
	P52Q==
X-Gm-Message-State: ALoCoQlE10/fsOqNQXBkanE9fE25oaRzrFuNkGs7ah0rSMu64wUlSUJ66sf/fSMaYhxyTmVJsd3u
X-Received: by 10.129.110.70 with SMTP id j67mr47179833ywc.180.1447797017715; 
	Tue, 17 Nov 2015 13:50:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 13:49:58 -0800 (PST)
In-Reply-To: <1447796430-90226-1-git-send-email-francois@getpebble.com>
References: <1447796430-90226-1-git-send-email-francois@getpebble.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 21:49:58 +0000
Message-ID: <CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
To: =?UTF-8?Q?Fran=C3=A7ois_Baldassari?= <francois@getpebble.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::230
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Fran=C3=A7ois_Baldassari?= <francois@pebble.com>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Priority masking with basepri on
	v7m
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
X-TUID: /yJKFX1BRifa

On 17 November 2015 at 21:40, Fran=C3=A7ois Baldassari
<francois@getpebble.com> wrote:
> On armv7m mcus, the BASEPRI register can be set to mask interrupts
> above a certain priority.
>
> This changeset implements that functionality by way of the NVIC which
> ultimately sets the interrupt mask in the GIC.
>
> Signed-off-by: Fran=C3=A7ois Baldassari <francois@pebble.com>

There are a lot of problems with our NVIC priority handling
right now. You might like to take a look at the patch set that
Michael Davidsaver sent out earlier this month:
https://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg01542.html

That has some problems but I think it's probably the way we're
going to go to fix up the NVIC.

thanks
-- PMM
