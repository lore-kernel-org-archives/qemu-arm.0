Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp607212wrt;
        Tue, 25 Sep 2018 05:24:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62nO3Jprthv3VXIxtdaJwBF4ZzLUiADAxtOffuhOIzW8ss+uOq/ktYQGtbyDU/WL7bTYxMC
X-Received: by 2002:aed:3903:: with SMTP id l3-v6mr541990qte.315.1537878281062;
        Tue, 25 Sep 2018 05:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537878281; cv=none;
        d=google.com; s=arc-20160816;
        b=F84o1+LfcRe9EsVrB5g2efZSyPz9hPRQm+Sp51ym/cmkTcU5qO9lTunVww7/LzimoT
         GQbVD+AqbxTTUup0MIy+t+uh+FIC8/yC3X9T6I8vwnqeHEcMLsynuhSqHfRGz6Vhh3PY
         IahwPeHkm1RFi2Y4GI5/glTWvqO8obNLq867Sccx1EvtDR+rN5O1nCPuKjucupyEQzct
         +DyilAH3HKcqPxvYa12Qwj/eDKfhSRWgPZqJBtOsKn1pPTZdqWNV7ORSlhhMj5kcTLN5
         28U/qWKQDHUDcevsPDxF0yjVR+1FJHK1H7iGzjluu7vC3LnMewF21hjbb6Fb0L2xYdGe
         ZhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=2nccy14I716UvA9XAeQsqtFGvxN4vtbcGTX/+Ov0fuw=;
        b=ALcCMIchGka9DHCAFzodAjaEHqD2T9+OVFLSTI6Bro5m/gFhhu57pfaYR2gjNX5RSN
         cXig5xnAae5nEyG0jdvnbvO2zOAQid9hsEJHVYZa169swGIDeDd+XYMCufimCfjoZhmm
         mZskqaASWFuXrFJ0UMdy6bLGXggK2ro6zD+gCEEejdbMTn01FF12y56D8sdPp6QFr6Ot
         FTmg4DtMF47EBfB613qfFT7z67od+zxim5Ri6yI2GfKKpJpHqgs5I0xZHS6Mk4A4ttx/
         grwRWA2CZaYAlHtiWxPkPNef9wDVAhF9usLjadKack2ou26n8bfwoap3DnarvKnQP9Nq
         GwEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DGn/aICA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7-v6si1644997qvi.101.2018.09.25.05.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 05:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DGn/aICA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4mOO-0000y5-LC
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 08:24:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mOA-0000xi-LM
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 08:24:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mO9-0000Ac-Qz
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 08:24:26 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4mO8-0008SA-Am
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 08:24:25 -0400
Received: by mail-oi1-x241.google.com with SMTP id l82-v6so1281699oih.11
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2nccy14I716UvA9XAeQsqtFGvxN4vtbcGTX/+Ov0fuw=;
	b=DGn/aICAWYy8NXaipx8swIzj38UYjdDNgnaiASip1Peq/hEYiyv2W5bu5KvsB7KT/b
	3NNIWQ8AeYnRiGITBX9dTOAzMHdeW/z9+S1RTrAWu3X7THuACeLpLBzBFUU6EySpg76q
	Mu3jNs+OMjUV6dtMUBAl+qW+ntRtUwYf4T854=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2nccy14I716UvA9XAeQsqtFGvxN4vtbcGTX/+Ov0fuw=;
	b=hr9SSKBrzZFOIc/Ot5iYUp9CSOPevpqUoB7U9/C3+JNQiVUY3HmxEdMz1QdOSk639G
	pL3To5SvKnTSfswdI1wPmH6kojo+ZKi/ZJDzIGn/BJ3HZAOHma5UXuGbMwaKzHz/PMoB
	wpJAhvkyX9EgXsLafA+2+RZETgiFX+sgF/am+9Zs/95r3gqYfiQh9wQUFswgHz8gdGsP
	s52LZW+d+uYNkV/a0ZYlJ453W1OdJDV0IXVPBK6Ukii2ZShSEZaKzqssBljgMWXXqUM+
	dXbmLgq1WAIlZz6062FjdBWlk/r3MgAwxemCBv/VR3fjM8E0OIrKC+efSlVZb1jAh+vs
	Zweg==
X-Gm-Message-State: ABuFfojmUvPPAQr6y8ykwYo+stRT5foP1bLO/sIbcKALCQifHbyZYY+r
	Px8ydQxhhniGRargl9gaPr19JaMU6gnUQOtyesysRw==
X-Received: by 2002:aca:40d6:: with SMTP id
	n205-v6mr440174oia.35.1537878262189; 
	Tue, 25 Sep 2018 05:24:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 05:24:01
	-0700 (PDT)
In-Reply-To: <20180921161939.822-7-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-7-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 13:24:01 +0100
Message-ID: <CAFEAcA_z5qYObmkHoRTUzLTYD_ihom5gXtGgjhsD4mPsDb9GmA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2 06/11] aspeed/smc: fix default read value
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Pt4AhRHhHts

On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> 0xFFFFFFFF should be returned for non implemented registers.
>
> Also,

Use of "Also" in a commit message often indicates that it
would be better to split the commit. The two changes here
don't seem to me to have much to do with each other.

> the model should expose one control register per possible CS
> even if there is no flash device attached. When testing the validity
> of the register number in the read operation, replace 's->num_cs' by
> 'ctrl->max_slaves' which represents the maximum number of flash
> devices a controller can handle.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 1270842dcf0c..6045ca11b969 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -665,12 +665,12 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
r addr, unsigned int size)
>          addr =3D=3D s->r_ce_ctrl ||
>          addr =3D=3D R_INTR_CTRL ||
>          (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
> -        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
> +        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {

The commit message mentions changing the upper bound on the
address check here and also the unimplemented-register return
value, but this change also seems to be changing the lower bound
in the check ?

>          return s->regs[addr];
>      } else {
>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
>                        __func__, addr);
> -        return 0;
> +        return -1;
>      }

thanks
-- PMM
