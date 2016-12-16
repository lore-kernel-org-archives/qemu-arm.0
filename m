Received: by 10.103.86.15 with SMTP id k15csp1324733vsb;
        Fri, 16 Dec 2016 05:07:19 -0800 (PST)
X-Received: by 10.200.47.140 with SMTP id l12mr2712500qta.51.1481893638958;
        Fri, 16 Dec 2016 05:07:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a67si3118465qkj.137.2016.12.16.05.07.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:07:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHsEG-0005me-G6
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:07:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHsD7-0001qE-6m
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:06:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHsD6-0001pZ-Ch
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:06:05 -0500
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:35267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHsD6-0001pJ-0k
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:06:04 -0500
Received: by mail-ua0-x231.google.com with SMTP id 12so37373377uas.2
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 05:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/1qja8Cl7Q6T+zbUkHJkh0pb9X5mQJZ8KwUOMA7jiDo=;
	b=FOG1YoO3o8hsYQlBR2L9vTQh698irmbxWTsXL/ROu7l/m3RuYq6IUxn4l/IYaqNngC
	vlTC8/EQ/rxoA6sn71xMYnIovf1yFU00KhfZOzgifi2IOWHkch/NxzPt/PqSD8lu9TSN
	PjDNq5oBWGSoSsfDcc7NCx4cDxVka8cpXFYxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/1qja8Cl7Q6T+zbUkHJkh0pb9X5mQJZ8KwUOMA7jiDo=;
	b=i/PzZaMk4YRhQum6Ydk07XgTgkR4p9GJQCKcZwRBoKXYx5870oNgQSEQ2O2J1HGZnP
	xLdj0jRfdPCIUVa3Ugo0VJ4sMG40ALq/YVHzpkACFwrdofPmjCPz3YASeNngS3tGIJSz
	T0iVUQto+Ly8NCm3Ygs/oxDTwOro+GE1wvnva44XEdYjXMb4GG4idLTUFUVV4NsknUDV
	Rq5J2HJ22RlSiPZJRaYOyIb9rRHaMGzNUiwMzSPWQrRvczN7HhQ4Sxs5tDbv0sfBXiQl
	Kh9b0+dggS2bOq7GeVaqyDwvDqqeX4gMKrCX5QK6szAnVAzFq7iP5D7G54WGnqpHvBg2
	eQeQ==
X-Gm-Message-State: AKaTC03jVcrYyzqkhHKdd/mCaJyGuX42Pf0Wt58L8qKO2LqoW1Uvv0BWjZvnlKiQJnATzHE9c8bOSqHeo+KdeDgL
X-Received: by 10.159.48.215 with SMTP id k23mr2476456uab.42.1481893563395;
	Fri, 16 Dec 2016 05:06:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 16 Dec 2016 05:05:43 -0800 (PST)
In-Reply-To: <1481810970-9692-1-git-send-email-clg@kaod.org>
References: <1481810970-9692-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2016 13:05:43 +0000
Message-ID: <CAFEAcA-osZfCKuftxcz1y2TXFxRrzc0gqL0K7bBb-SyWsWxxiA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [PATCH v3] target-arm: Add VBAR support to ARM1176
 CPUs
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
X-TUID: WFETyeCpzY2Z

On 15 December 2016 at 14:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> ARM1176 CPUs have TrustZone support and can use the Vector Base
> Address Register, but currently, qemu only adds VBAR support to ARMv7
> CPUs. Fix this by adding a new feature ARM_FEATURE_VBAR which can used
> for ARMv7 and ARM1176 CPUs.
>
> The VBAR feature is always set for ARMv7 because some legacy boards
> require it even if this is not architecturally correct.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Hopefully, this is correct this time ...

Yep, looks good to me. Applied to target-arm.next, thanks.

-- PMM
