Received: by 10.28.71.27 with SMTP id u27csp8734wma;
        Tue, 23 Jan 2018 14:46:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227B1QFLonI6zv2rtq2EjgmBugmCbTFT1A1NWJVOeHCmed0WtzYv/6MLEoCMnPB3oiFNQFtT
X-Received: by 10.37.246.31 with SMTP id t31mr4169071ybd.330.1516747590443;
        Tue, 23 Jan 2018 14:46:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516747590; cv=none;
        d=google.com; s=arc-20160816;
        b=nqig894bwEryGt7jsK3gruuzr9al7Gyc4o+9BcrE+y5odgLvF3GBZeeyJMFAbw5Gnw
         3+iSDmdykrFzT4XrIVSFnwrBrIzRPfvUc37ID+AyWsk4TbwE9Tn1+FA329pLI2cCBccR
         BMtu5yCc6Rnebp4JIyNWnxTTY6smRS72Lf3bOwrdZlrJpEreyWpsKxNr45gtWVtEGNGS
         3tV134KGxsmJbzQ2xF1TK1hQoWc0Qna1zEd51jGaLraafBU5D69Kn4ay8FvUsdOc7Wk1
         yGcne+jiUBOabG0Mzs+aw6nysvMz6d7WFmG0F4fzQGTrfDBnU0IEnBMViG1T0xuImWnl
         xgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=faN5jwnsXu8BmWo8CoREj+DQ5IaNtCXPyWeOZvRXXhw=;
        b=QFb0lYulqqcabN2uCUzWSWUC3F/O92DksgUWN/yGlyZrUSwEE3CNFw8Vsp6hFfTLWW
         9vN6t9/Qj/4Er8NUYRBOzE9kp8ytCmJ5BwEisIdsNzRvt7YIhDA84qEfY+7QhkcDZKsP
         +5D/V6xFPaMxcbe0UztYs4mnu2HOXwC/ZiagGGjDV1gzDdAP4j0mL6bCecxsRWqRyHpu
         fIavV4L0tjTuBvOGsj4apVHnNe7UqIpFbwEJ/JE9HL9xI6NJOmxnTCig8R0gp1+e7hTL
         IVOghc3Iotq0Ju6BnVMdjgBETtaQW+/aPSdNMW9KOrqIAALphy2bh83XRjQxx/oy1kGU
         Xw1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IZtvF58g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x23si2552244ybi.515.2018.01.23.14.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 14:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IZtvF58g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7Kn-00049t-Pn
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 17:46:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7KU-00047K-SD
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 17:46:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7KT-0003ES-Rv
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 17:46:10 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:43401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee7KQ-00039a-Cw; Tue, 23 Jan 2018 17:46:06 -0500
Received: by mail-lf0-x241.google.com with SMTP id o89so2672281lfg.10;
	Tue, 23 Jan 2018 14:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=faN5jwnsXu8BmWo8CoREj+DQ5IaNtCXPyWeOZvRXXhw=;
	b=IZtvF58gDAeavrFu3nN6JnCgV2PlLT5Zh23NnU4Mbdbq3oLemdgGsFDF3VXUQQGkW3
	0AMxiLCORh8k3mzCkNGlecZEtTuqvKw5qvnHUlWDSLdH6+mmHJcTlwz2y8JkadEtQ+it
	87D7YV/LtQrtw2URGvBXEC41odlsMz8l9wfFj0BaibJ7KOClkm6tYlU4SvwFG7ny1Cb8
	YQirSE92+GKFrdWGHkgJFaolCnkq/f83UZ7iJjnD4hAt4Lr2lqVe787wsz2nrYwPjDDa
	5P4ukruyW1TOwZbK7YeuQOEq/GwIIG08fIp6NXoZBinTblSo61zWT3L7+3XbR2hMJYeE
	52tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=faN5jwnsXu8BmWo8CoREj+DQ5IaNtCXPyWeOZvRXXhw=;
	b=JLEmantIlYO0YV+iX7/FruRUH19xiFxciwc+UZpvsAMqvT3LNJvGODNDZQXO4X6Y08
	NF+NQ4/PLBeFvWFdje2rMJlfZVNsaCVchGRY0eKMW9z4ZE8lpqr/kme89qx5heOASGYV
	AESc2z18GfYQGN4/9+NUeSiPeb6qSu39NLn0fhGfyjTac76rJQFgzM8+Qd1HDV6pUFSY
	KRh4FFZp1ZtyFMuq1Q3uEsdWgtcBm24tPTxsxoGLkNMV8cZFT/EjVGtAX/d2V0AMu7En
	dOovgTxYWM9wd6THfoavdwA9bNiOZagbv55WUZlNhDGWczo/Q5ZqO6INcXTodauY4Q52
	cj9w==
X-Gm-Message-State: AKwxyteeH1zAwfX/pLs1UoQ0XD+Mv2UYTBmaPXkPLZ2PUjD49zCgalrD
	NPYKBAZ7DmFod9TvPM+5yFGsGRDhZYefuzavJIQ=
X-Received: by 10.46.127.4 with SMTP id a4mr1995519ljd.121.1516747565033; Tue,
	23 Jan 2018 14:46:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 14:45:34 -0800 (PST)
In-Reply-To: <20180123030630.26613-8-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
	<20180123030630.26613-8-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 14:45:34 -0800
X-Google-Sender-Auth: wBYUE0dg1CPSsBu6Y8qL7Na1OAk
Message-ID: <CAKmqyKMv4vhq2RYKX7cNMy4S5PWggZfpcQxUWMPXwF2Lm4+xvw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 07/14]
 hw/arm/bcm2835_peripherals: implement SDHCI Spec. v3
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1lBbBMwA17vw

On Mon, Jan 22, 2018 at 7:06 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 12e0dd11af..0570cc4ad3 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -254,14 +254,19 @@ static void bcm2835_peripherals_realize(DeviceState=
 *dev, Error **errp)
>      memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
>
> -    /* Extended Mass Media Controller */
> -    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "ca=
pareg",
> -                            &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -
> +    /* Extended Mass Media Controller
> +     *
> +     * Compatible with:
> +     * - SD Host Controller Specification Version 3.0 Draft 1.0
> +     * - SDIO Specification Version 3.0
> +     * - MMC Specification Version 4.4
> +     *
> +     * For the exact details please refer to the Arasan documentation:
> +     *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf   =C2=AF\=
_(=E3=83=84)_/=C2=AF

I don't think we need the shrugging face in the comments.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair


> +     */
> +    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &e=
rr);
> +    object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "c=
apareg",
> +                             &err);
>      object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-qu=
irk",
>                               &err);
>      if (err) {
> --
> 2.15.1
>
>
