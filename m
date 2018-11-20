Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp598281wrt;
        Tue, 20 Nov 2018 06:03:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5cojAuhEhDMxwutTAnztFPIDmkLRDXNsUzmUn4rxTCc54qbpExpQUL4hrYW8K30H/c9bSNx
X-Received: by 2002:a67:f294:: with SMTP id m20mr888252vsk.81.1542722638645;
        Tue, 20 Nov 2018 06:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542722638; cv=none;
        d=google.com; s=arc-20160816;
        b=E940rZrV17/RrjXjpqDk9eiwR2S2VetvKUkgL+BMqiMVJyiqonou9tVCrmivLSdOJ9
         RhSKgr7TOBKlDmt4In6ReEM4UtjxuLqKJMTm4I3bkjW4LgFnjZxPEZEO/kBvvbJFVn4z
         j6nxiFMWgjHLrvzGWrlAVg2rj8EbaarhAs4yC7lCqj9xZWGoxDpptrXcxOIxGhq2mn8d
         /BnF3GLUsFxgGUrfwH+uL615z4npuYXWt7RzQXR+HggrIdCM6z2DTP/XPo33tAm31y0i
         u4y2j5OLajhhc7sgLJKAPX+V9/C/8fsWbIM+qpR2HFKTFvNuglhl5VqltXVqMSQ2Ep6K
         t/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=UnBq1hQDK19UDjs1pR3RXvqRxhUWIMFLZUb9OLQglJM=;
        b=0Un1AiU3WjwaOvtJTo9AQzGSXGcpuHBjCR7gfNY4fkcv9F2YoIyLMTCbFR4sVHtLWa
         GVjDYceaIGnS1yQhybUl9KAAu9gjr0Yv2ymSX5jvXVRqnKpp13/eESd8208bWqtOT+Th
         D3LRm/OQ7EQ4xE1HuWB7PQL+nfCR8H2WAQkJHWlAbuAYoBLbRSYYpjCHOQXjnEOEv1V4
         SDhwbPJbcRr27TbSexw7uqoOu6W+8PQkdQFJG1+G72KoHrKVwcnt8aBsLD+gvqnXQWAd
         tD2nXc9jp2Kr+eym5HR6sD2PeQHctGU4da0dVrm2rHkYJFyyjRveEjyNg/y+8xCx0m4u
         5Zpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jGz+Rvsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q14si14177978vsi.29.2018.11.20.06.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jGz+Rvsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP6dA-0001rb-Tv
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:03:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6cz-0001qB-Uq
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:03:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6cy-0004Vw-3a
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:03:45 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP6cx-0004VE-Tx
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:03:44 -0500
Received: by mail-ot1-x341.google.com with SMTP id 40so1732490oth.4
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UnBq1hQDK19UDjs1pR3RXvqRxhUWIMFLZUb9OLQglJM=;
	b=jGz+Rvsjk5v6iCeKDc5kDVslZtDGU4eZ71dc01/OwrVbSz2SRFX0RJPs2zsY1nXYuU
	9r/I9LcaDxQy+9KYJzFjC7XW+fqMPfpkdD+572LwTuozJsPj052w/2FRDUVAELHGA5x4
	oB+5I8bwA32DW8nVDHflH9ZhMi9vTqAh16qvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UnBq1hQDK19UDjs1pR3RXvqRxhUWIMFLZUb9OLQglJM=;
	b=ZTwAlQbhYDivGtOKdhPIlz+pEcqxCWBYrAp8nkW0uY5X1aEcE9mm4xHd7NsdnqtCRi
	6NH8edqPbnbNa3xFqVoicz0VP8zMHoRr2qLpJ/OH3UrAkowaMPsrLgipA+ZsDz8RelC4
	WTK43+yLthdfyO8KIuBV1n4Itr663FqXs95GMcKGPQnXvg8UXI86Pm2RrV1Um0miJ4uC
	9mOiCboOtcWa1DhcQOh+9zt02cMZNwF1eNPwKxYqyA0LAl/pXIo4fPVl1geCFeaBRQiy
	CfEL5vXxLiRIMIW7eceCAsYk+TBMUMOuWZ+rhl9vJRDcEhETA/+rQ1WJCR2UwgZiaQDM
	vrtg==
X-Gm-Message-State: AA+aEWYXPrIMWr1P6Geyzu7ktLuIeZfcA2+1xElZj59RlgUhAiybxljR
	B3qbLvfTv27VBCtUAJMJKem4XySyQa3azMt8XK7oZw==
X-Received: by 2002:a9d:2cd3:: with SMTP id e19mr1132711otd.363.1542722623264; 
	Tue, 20 Nov 2018 06:03:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:03:22
	-0800 (PST)
In-Reply-To: <20181113165247.4806-5-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:03:22 +0000
Message-ID: <CAFEAcA9X5oZJHjc4mdgnnQHXyULXH_ZhLErubPWbZqbEywXi2A@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 04/13] target: arm: Move all interrupt and
 exception handlers into their own file
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZ78ojJ2ZBFG

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> Most of them are TCG dependent so we want to be able to not build them
> in order to support TCG disablement with ARM.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> ---
>  target/arm/excp_helper.c | 550 +++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c      | 531 -------------------------------------
>  target/arm/Makefile.objs |   2 +-
>  3 files changed, 551 insertions(+), 532 deletions(-)
>  create mode 100644 target/arm/excp_helper.c
>
> diff --git a/target/arm/excp_helper.c b/target/arm/excp_helper.c
> new file mode 100644
> index 0000000000..38fe9703de
> --- /dev/null
> +++ b/target/arm/excp_helper.c
> @@ -0,0 +1,550 @@
> +/*
> + * Exception and interrupt helpers.
> + *
> + * This code is licensed under the GNU GPL v2 and later.

*or* later. Wording matters in licensing. Same for other new
files added in this series.

> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */

thanks
-- PMM
