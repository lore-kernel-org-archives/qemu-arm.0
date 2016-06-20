Received: by 10.25.21.96 with SMTP id l93csp1535880lfi;
        Mon, 20 Jun 2016 09:41:22 -0700 (PDT)
X-Received: by 10.55.184.5 with SMTP id i5mr23707985qkf.33.1466440882512;
        Mon, 20 Jun 2016 09:41:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si12315977qts.26.2016.06.20.09.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 09:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF2GF-00007t-Mp
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 12:41:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bF1HU-0001C4-Vk
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 11:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bF1HT-000206-B7
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 11:38:33 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bF1HS-000201-Qx
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 11:38:31 -0400
Received: by mail-vk0-x22c.google.com with SMTP id j2so200380524vkg.2
	for <qemu-devel@nongnu.org>; Mon, 20 Jun 2016 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bey80p6TIxebwwLlLrE3Gu3gxzGQEiC2bRFyPcxIwQg=;
	b=cQw26ajq0TxO3qaVpQFIR4kG4+KwMOfV6NvNKWhOjxMDf6JkUQVaQjUvls2u+Tp0Aa
	/JhwAmFOZj4kMtiHfKYDgH348SMUwReqSNXtNjV3+oDqzgXPK7BmIz+2FDVVlj7o4DJU
	KCwqJthpfAAfduJPePTDdWBBnY0gwzWUMBqhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bey80p6TIxebwwLlLrE3Gu3gxzGQEiC2bRFyPcxIwQg=;
	b=l8tHAHdPeEPNa5baJTQ7KPHYmOAV+AKgIDLva5PeBHQk2ZsGG0IcyZs2zJohWq1doF
	EMgq2G3A/K8XRaIJ8sjPLbFWNPX3M0qin3/6hhpyXCnMR/+MYi4+cCeBxBwc4PTDrXRg
	cAnhQqlgVoubo17/yyNTzLBc/lbB64UdBsQRXPV/3esUoafg1F9HzZS+iAz/KzQ6yFHw
	NLw4KgT0SwQBUs9qowp2LS+rw7HjHBC9a+QqCMvc8PJLQc+TT/qbifphycUBIC7g+YHp
	sF39K1hHoPK3NSuON1NBK2Zew4Rys9a8WaliyOalbufrPDPCjwUaqOs3hYPTBFxv6HqU
	zAwg==
X-Gm-Message-State: ALyK8tKeYTWb9tOOUSZ+Bb//uOQIWW0NVT2G2ZBl85faaRKUrxkqS9GFUSxij5QAPnRwvehAQrkgVHWABU02pavr
X-Received: by 10.31.49.9 with SMTP id x9mr5591637vkx.83.1466437110323; Mon,
	20 Jun 2016 08:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.193.141 with HTTP; Mon, 20 Jun 2016 08:38:10 -0700 (PDT)
In-Reply-To: <1466165724-7620-5-git-send-email-clg@kaod.org>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
	<1466165724-7620-5-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 16:38:10 +0100
Message-ID: <CAFEAcA_C-0MO7T8b2iyRqbj+eEe0ns-Jejo24M+dzpQj6GCvcQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-devel] [PATCH v2 4/5] ast2400: create SPI flash slaves
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DTPAQ4PFlCry

On 17 June 2016 at 13:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> A set of SPI flash slaves is attached under the flash controllers of
> the palmetto platform. "n25q256a" flash modules are used for the BMC
> and "mx25l25635e" for the host. These types are common in the
> OpenPower ecosystem.
>
> The segment addresses used for the memory mappings are the defaults
> provided by the specs. They can be changed with the Segment Address
> Register but this is not supported in the current implementation.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6a02906c8f97..a8337eb81975 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c

> +void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                             Error **errp)
> +{
> +    int i ;
> +    char name[32];
> +
> +    for (i =3D 0; i < s->num_cs; ++i) {
> +        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
> +        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
> +        DriveInfo *dinfo =3D drive_get_next(IF_MTD);

You don't want to be calling drive_get_next() in code in
hw/ssi -- that should be done at the board level, and then
the board creates the flash device and sets its drive property
and connects the flash device up to the SSI controller.

thanks
-- PMM
