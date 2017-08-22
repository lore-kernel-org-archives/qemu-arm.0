Received: by 10.223.188.70 with SMTP id a6csp5226201wrh;
        Tue, 22 Aug 2017 10:32:02 -0700 (PDT)
X-Received: by 10.55.86.199 with SMTP id k190mr2004992qkb.125.1503423122524;
        Tue, 22 Aug 2017 10:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503423122; cv=none;
        d=google.com; s=arc-20160816;
        b=cnV0oyDWEr/ss8EgOBOh4JbT0enJbd29bVsyspPcf4C8x0iOoMmxigcDHNaE1k/aLp
         w7GrA8AsJCNn5Fqa6V+kmzBBCmPKwOXgScGRwoNj5+VHf9UllHVdgfAZUW67X++ZNuhe
         QSQBAjGtfXPg6nm92fp/h6ZrM1cKeLV+vu/w1KXuwduSwEBqcSu32fif1XncrYd00Pda
         nzvHyN2DXVvgsL2A8uowRG6lXN1sdRXoN5P4lJp3fmd1iI1Ru3XkBU3b3NUUj19feHEt
         EVxB9gGOAS6zvDEccmrvtByeQWe7RJ6mTVchETtuiC8Xy5/ys7Bo5UityGldeZ3USWwC
         Nw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XCb1wrsNeDmPagpZ3TTUCDB+4vZDldV7iKdA+aF2Xm4=;
        b=zWkPy5tRT2xY6ClCRvrO2U+jkgwmw+SxdufR+wlZGDCcdYUsChBZ3HKVyxHRTjrg9n
         0DWDpdK8phkXCiC93pc7ux+ecSBEaU7AUd5L87A26ztiGor25kIS6w8H8gIyjQpkC8KT
         SWZx+Xf4oNZS4NCrn9efknsEJEWX4IrphiVD85OPEPc9uthzjDGRH2LJ3GsL5jlVV2oJ
         wNInM9ATHBzLU4cX2XXevSDaw4TzBn7TbXxRnMaS1EByYU5fopLGjrcqte9cjyfKnUrD
         /JpjiNDAy33QFsRQqXa5sCjCyAe9fqn/nY24ibk3sPPLVULj6E3Gahxh3uHv37qAZTOb
         BhIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OGgEk0MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r89si3959588qtd.481.2017.08.22.10.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 10:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OGgEk0MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkD20-0006Ll-5T
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 13:32:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkD1q-0006KA-Vy
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 13:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkD1o-00051e-DS
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 13:31:49 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:33718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkD1o-000515-7v
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 13:31:48 -0400
Received: by mail-wr0-x22c.google.com with SMTP id a47so15414018wra.0
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XCb1wrsNeDmPagpZ3TTUCDB+4vZDldV7iKdA+aF2Xm4=;
	b=OGgEk0MVCrgr+5BwjusxHsxaqbBii3STGkBez+LCzwcaVi1dfYF8XQJ2so/04GCrKu
	4hza7Azu9H2/fTg6oD5mtgSLhfztAQ7VAGHuemuN7Uiw0qdYlC9S5GsqrhwDEWkcIU2+
	VqKEuogkXXTsxG2L49a0EQ7kMruaYNJLQuQ0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XCb1wrsNeDmPagpZ3TTUCDB+4vZDldV7iKdA+aF2Xm4=;
	b=avPC6CP5+8y7TI91gHBsdZ722eg4WHMjWEC5dz7XxfFMo7i4QOYPQD+qrY0Tfc/SvT
	qm4g7/uB7TZODDygrKmkaA0YjENgtiLH0uaoKnm+giS6FPyQkHAmgL/Rb8to1dFfe5TO
	Igl9OuhOlkHMN2dv1h3oiYNmhorVzqG0LMrEfB51D5cmJTvR5yavBPaquzSdzH49cmWz
	krtKsYOk+G/8hS7KeSHeCi7LvkGnwd6WqS/W1qLQjEWXeB4TCdj1hLwxc7Av5+MLbk/m
	t2D5SNZEP7r9uKtaLfMzIiWaejHFHEJY2UBWuSLHjMCZjTgJK1HGTw1eMuk/leCWBHGE
	ilRQ==
X-Gm-Message-State: AHYfb5jyPJiqXb14T1WQF60Wgs8Oww4/mbC8z2YtHl1s7MweH4dsfzQ5
	3eDhlNL9xBmBRXS8aLbU57Jg1vtqjMaKN0w=
X-Received: by 10.223.131.197 with SMTP id 63mr976116wre.161.1503423107139;
	Tue, 22 Aug 2017 10:31:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 10:31:26 -0700 (PDT)
In-Reply-To: <1503406059-7280-1-git-send-email-thuth@redhat.com>
References: <1503406059-7280-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 18:31:26 +0100
Message-ID: <CAFEAcA-p2q=-b5nW2MF9m7dMeX+dmDqMO5OYC51RDEAiC0d6jA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH] hw/arm/aspeed_soc: Mark devices as
 user_creatable = false
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
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Jeremy Kerr <jk@ozlabs.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKpjn1kECJso

On 22 August 2017 at 13:47, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently aborts if the user is accidentially trying to
> do something like this:
>
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add ast2400
> Unexpected error in error_set_from_qdev_prop_error()
>  at hw/core/qdev-properties.c:1032:
> Aborted (core dumped)
>
> The ast2400 SoC devices are clearly not creatable by the user since
> they are using the serial_hds and nd_table arrays directly in their
> realize function, so mark them with user_creatable = false.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/aspeed_soc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 5529024..7f1be04 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -338,6 +338,8 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
>
>      sc->info = (AspeedSoCInfo *) data;
>      dc->realize = aspeed_soc_realize;
> +    /* Reason: Uses serial_hds and nd_table in realize() directly */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo aspeed_soc_type_info = {
> --
> 1.8.3.1

Applied to target-arm.next for 2.11, thanks.

-- PMM
