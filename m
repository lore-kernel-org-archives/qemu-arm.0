Received: by 10.103.86.15 with SMTP id k15csp280472vsb;
        Wed, 14 Dec 2016 10:06:50 -0800 (PST)
X-Received: by 10.200.48.120 with SMTP id g53mr99809330qte.113.1481738810740;
        Wed, 14 Dec 2016 10:06:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z4si136377qke.332.2016.12.14.10.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 10:06:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHDx2-0004r6-9K
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 13:06:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHDwy-0004q8-DM
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 13:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHDwv-00017D-9a
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 13:06:44 -0500
Received: from mail-vk0-f45.google.com ([209.85.213.45]:36430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHDwv-00016l-5W
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 13:06:41 -0500
Received: by mail-vk0-f45.google.com with SMTP id p9so39881759vkd.3
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 10:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KFV7KNJMaK7mkLY4mQnWRi8iCkHVP9xNwwE71zH9iSQ=;
	b=X50Ku0NTpEDMGSIsbqNgbveBO8ozODybwI+fCQpF4nTBY+vwnbNcvCYgBVv1IT+ilb
	3radjMcZmjxBhi+2A9kbucMB0JvzU0jT+cW8V3HpSFZCgiw7kQtlrTDhtpxxizqtxYQz
	yBtlRuEKJXBMa+w0a6GB1T1row99uqVI6/CgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KFV7KNJMaK7mkLY4mQnWRi8iCkHVP9xNwwE71zH9iSQ=;
	b=ELaItMlHudU/xnB2eCez7ddOqnXMbOSQQ2gFFG4kInG+6AJihKdfyGAhy7PDFqoGyA
	NxM+25c6WKNwRadHjXfLcGl955Rgfp/2Z8e45TM45wLjyjPZtftMCv8J1Ep+fiNaDgYz
	rWCmVwapI2pElMUwGmtBGDrIylczp0/4MNLjmxBhskxGJ9VWTU/ChbRDgDI5pb7XvfZA
	egIPxrf59DkL5faCyzcXSp0iiHdly9Kan0W27oqwMDQrR90BZRRteWnSkvPS7KX2U5Tl
	BC+BSAqZbAIZtDVxcELnsQYnnp5ql6df2iunkeZntnD2mMOE5/KOQsv+qQvFGrVe8h3e
	Ogcg==
X-Gm-Message-State: AKaTC02JzziqWMK5f4W/QbMnGQGUHfUs0sFa8JP4Nun69a3EgVPzExI83Pj1y3UPa2GTQiUiZTApHqsXdL/Bz1JG
X-Received: by 10.176.83.12 with SMTP id x12mr90116791uax.131.1481738740596;
	Wed, 14 Dec 2016 10:05:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 10:05:20 -0800 (PST)
In-Reply-To: <20161202054617.6749-4-alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
	<20161202054617.6749-4-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 18:05:20 +0000
Message-ID: <CAFEAcA8YtWWOAgAcNGVrMSWW7p9RN-X9Yhf-OBpH3bEARkH=kQ@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.45
Subject: Re: [Qemu-arm] [PATCH v3 3/7] hw/i2c: Add a NULL check for i2c
 slave init callbacks
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ypVpqTPofb1q

On 2 December 2016 at 05:46, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Add a NULL check for i2c slave init callbacks, so that we no longer need to implement empty init functions.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/pxa2xx.c   | 7 -------
>  hw/arm/tosa.c     | 7 -------
>  hw/arm/z2.c       | 7 -------
>  hw/i2c/core.c     | 6 +++++-
>  hw/timer/ds1338.c | 6 ------
>  5 files changed, 5 insertions(+), 28 deletions(-)
>

Applied this patch to target-arm.next for 2.9.

thanks
-- PMM
