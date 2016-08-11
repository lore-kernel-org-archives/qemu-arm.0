Received: by 10.25.21.156 with SMTP id 28csp49026lfv;
        Thu, 11 Aug 2016 03:23:39 -0700 (PDT)
X-Received: by 10.55.9.147 with SMTP id 141mr9540395qkj.7.1470911019081;
        Thu, 11 Aug 2016 03:23:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l189si1131289qke.304.2016.08.11.03.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXn9G-0007ga-Bd
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:23:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn9B-0007Up-J3
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:23:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn9A-0007FQ-IZ
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:23:33 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:35863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn9A-0007FJ-EB
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:23:32 -0400
Received: by mail-ua0-x22c.google.com with SMTP id 97so112654653uav.3
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ulZPLVPL3dISzA+u9XIjGRJywJVe51X09VqCwY8ZOZI=;
	b=fcvvjaRinMJE68Mr0TUy87j+Dh5pYChTcdf67a/Okt7/MMY9S8pDV3Lh6HRAqQ/S0J
	orExl7Qn6Ia3Z+dVRQpk8YmUaNmdG7OpI9L+k2PDdU/qsFuFcJrl2KeNyN64RzRFt8qJ
	PaWawTgdYFFhM9fryqnnt+XlJ7C7YGzbYDT/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ulZPLVPL3dISzA+u9XIjGRJywJVe51X09VqCwY8ZOZI=;
	b=VlNJaPnOVj1XoaclGCNT28fvjGJ4RjTaPeyZhGHOX5D8sLipBybVYX3SRAypU2yCeJ
	MYT8cPuEZVfbdkIdt31euKZWQsJKsh2/d343iQ2l7UalQC75WyZJchnNsgzf8fisQ7Lp
	xDyRwRrRcjhaRKbaQuzPjsfdEYmblhi97oASI1fnBjXtLL/p9xvOHnzmopwa1kEUYwBn
	t7orbQ1JmRoVfLL0kO7OfW1vlklxZ6tnXzv8YuYdAxeVg5yWxyKfsRzMBRRPCeyEt47N
	ZKPLHj10oWvIazD07EjpIPrricr45Ejv8PFw1wWrmF71+D+ilB5BsTax4Yd6utbz/NV3
	71Bw==
X-Gm-Message-State: AEkooutcfUNmkdTCKjYB7YDVAqDtYGFfs4DdkXGJVi691xC6pGmghiROxmioq8Y4gShr4opDJyFu0ZjYSh5x+rNF
X-Received: by 10.31.15.67 with SMTP id 64mr4428967vkp.37.1470911012075; Thu,
	11 Aug 2016 03:23:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:23:11 -0700 (PDT)
In-Reply-To: <1470158147-16378-3-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-3-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:23:11 +0100
Message-ID: <CAFEAcA8z8aveUrRN=5VjA=saxMsd=jP1CH2iY6nUpd5bFab2Uw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH v3 02/10] ast2400: replace ast2400 with
 aspeed_soc
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BNNrigOVFTgp

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This is a name replacement to prepare ground for other SoCs.
>
> Let's also remove the AST2400_SMC_BASE definition from the address
> space mappings, as it is not used. This controller was removed from
> the Aspeed SoC AST2500, so this provides us a better common base for
> the address space mapping on both SoCs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_soc.c         | 95 ++++++++++++++++++++++-----------------=
------
>  hw/arm/palmetto-bmc.c       |  4 +-
>  include/hw/arm/aspeed_soc.h | 16 ++++----
>  3 files changed, 57 insertions(+), 58 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
