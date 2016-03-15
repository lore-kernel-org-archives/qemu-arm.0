Received: by 10.25.208.211 with SMTP id h202csp718597lfg;
        Tue, 15 Mar 2016 10:24:51 -0700 (PDT)
X-Received: by 10.55.43.35 with SMTP id r35mr39352435qkh.64.1458062691753;
        Tue, 15 Mar 2016 10:24:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93si27286184qgf.85.2016.03.15.10.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 10:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afsiB-0007Vp-8M
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 13:24:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afsi8-0007VY-U6
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 13:24:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afsi8-0000RI-4P
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 13:24:48 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33540)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afsi6-0000Qe-TH
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 13:24:48 -0400
Received: by mail-vk0-x229.google.com with SMTP id k1so29781229vkb.0
	for <qemu-arm@nongnu.org>; Tue, 15 Mar 2016 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fNJ0T2H1abZ8F6li3CIQdxe628cDvSmPH+6CZE6oiKE=;
	b=iOaCPfrSD2h9WEbPaB4gWmcijTkzWIN59Wf/qtb+6UFUgOa6D9JFWPg2NXF36US/db
	CAY/K7/xpjjKQWB37j/dkF9Jx4ylg7xzdKWkkhmgGs4wrKCxwFFsdvzmuRQPw2i6eRjg
	AewjuJHwcOm5+m1S84GvN/VgYR+vbtED9D7RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fNJ0T2H1abZ8F6li3CIQdxe628cDvSmPH+6CZE6oiKE=;
	b=mmb77Ps1pyToM+D3fD9vhi7GrmyyM/UVluV0IciCwSnvdhTOAaZMrJZTCnU6xaEWcT
	o8V7PQ5xHMpwx5oNQRtcxO4lNbj24LokkbA+iKKGkS6KWxiMM0BEt1NfMXdVCJS6RvcQ
	hTumfaIinztdemjiwXferVz+WLQVArzC5jbLURx7d0tYLdSz7KuftgFgkIE1j3mRoLEL
	+TtYaiMiPtRu34eUNA/ldHCS4PR3BEEfMvyDRWnJYPjJFaAYha8Yq5PvNvlpaF6k6fc3
	6TAyPPI0hwtCf70kDvZB3c3aCfq7UJJ2Y+ltRHy/8PS4UlqtLYk1M6L62aNqtwusQMTy
	MtLA==
X-Gm-Message-State: AD7BkJLaxAuGn1s0Db9R6/KSMMiO6vRIDJam/GBHlcFBSrzUUiI65wyjk/1HrcRkrQLcXuMcxPmq5hFnIm5lqwpg
X-Received: by 10.31.3.193 with SMTP id f62mr29034847vki.27.1458062686487;
	Tue, 15 Mar 2016 10:24:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 15 Mar 2016 10:24:27 -0700 (PDT)
In-Reply-To: <1457527503-25958-1-git-send-email-afarallax@yandex.ru>
References: <1457527503-25958-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2016 17:24:27 +0000
Message-ID: <CAFEAcA-UDGLpzwYN2Y-9XskvzTcrnj00-QAuy25WyqrntTtdqQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Fix translation level on
	early translation faults
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
X-TUID: WN9azWa2xMkX

On 9 March 2016 at 12:45, Sergey Sorokin <afarallax@yandex.ru> wrote:
> Qemu reports translation fault on 1st level instead of 0th level in case of
> AArch64 address translation if the translation table walk is disabled or
> the address is in the gap between the two regions.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
> In the second version of the patch the code was rearranged
> to determine the level for the early faults in one place.
>  target-arm/helper.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Applied to target-arm.next, thanks.

-- PMM
