Received: by 10.223.150.237 with SMTP id u100csp2910412wrb;
        Thu, 9 Nov 2017 11:57:50 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RhIR6WY+FUoAYKoDnx1VPDXFxM57xKsNW2btDGN0OnBS4Kv43tjv1wT55h8Ur7JIJup4EU
X-Received: by 10.129.36.209 with SMTP id k200mr654333ywk.191.1510257470575;
        Thu, 09 Nov 2017 11:57:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510257470; cv=none;
        d=google.com; s=arc-20160816;
        b=a0llhAf7I9h44kuU/FkGEoSFRYlNPRQDkdNcbtTad47S8HIqQZKQyJeB3FXy9cXbNt
         QfOy+vpBj+od56N3X5/b8S+PcK8oIdmZdOzg7IFizYPmMtDUD6FNFb9guBk7WiyUW3Wq
         Knd7W2uwjkofwg3ydeFUnFlmA5Yw7u+ZejiiRIcT2Y49kSt44UoGOaRd61W0NuY5Rilk
         t87q1SMskHddRHpxEkcnUrJUu6FuItbZi2Y3jwvJmdwjNpQWHAvPhKR+9MDwsvSqTa35
         9taY+uLsDrRlOyah/Uf7jwK6OZVdJKdg4oZsxWsyvwF+c1+QUWrtFw2j6AcAXzFWDAl0
         hCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OlWMTLir+dk4dycaTcghB5VboSCf5GvMCoSvFBYtpAc=;
        b=RG9VFGlEf0pnVSOa6BYdAzHkuWgDQamdtD/dwxbYJ+1poae4iPpYVkWlLkiKMBRa0q
         TQoDfOgpjArnXNt/ofzorVbSc1d6CT+KfMFV1Orqj1v93noCRgK1FTpIM8ts8cUFGlnH
         icoZo6JkfhFGm7j2sxu7YJWfWyEcT9tuv7nhyYPbTg85a+GiqyEtf4paj9riOIjDk/Gs
         5UNvld1icTrF+zWeuV0grKPU85IcQS3asur641piZjhqLDpZEM8Ba7XX8QitaBkjbjBL
         EYIhSuWt4CFzlDFuXWv7c1GiQwSUdVuEfZLjR+9+VrxsZqe/u9O403IZL0mBu5hvVGYt
         f4Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vj1hkwsJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s189si1831625yws.386.2017.11.09.11.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 11:57:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vj1hkwsJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCsxS-0002Gn-4X
	for alex.bennee@linaro.org; Thu, 09 Nov 2017 14:57:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCswZ-0001m2-MY
	for qemu-devel@nongnu.org; Thu, 09 Nov 2017 14:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCswY-0005mA-UK
	for qemu-devel@nongnu.org; Thu, 09 Nov 2017 14:56:55 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:50061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eCswY-0005lU-Nr; Thu, 09 Nov 2017 14:56:54 -0500
Received: by mail-wm0-x244.google.com with SMTP id b189so19410338wmd.4;
	Thu, 09 Nov 2017 11:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OlWMTLir+dk4dycaTcghB5VboSCf5GvMCoSvFBYtpAc=;
	b=Vj1hkwsJB50PPX0TP69KEaLoKJ8Ta5zPR9QZYbjwIV9s2UywNyFOSEHj/OtTrCHPNu
	bjbxu/5L64Rp+rPPIiO3TMOeaQFeJc9sF/pm4cCDlxDWVGjZi3iYc0MJSSYe+gA5zIh9
	n8GQDSaPjJNrEQrBkIx28oHXU+R9/yRqjGbjrp1grWSQOsWedZxwbteFSjn9vihQt1oA
	Luq7503XMQkjdqtzwQbJudmfnlTsj2tDqHeyzLfa8A3GheuklbzyqcyW0aMM6LzHVrAo
	k56pk52uUdLDKkzGBl+nyavalLXMDc5Wpm/+HkRcsaDZ/sDKJ3kAgzJxc+b2u3jkj8rM
	JOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OlWMTLir+dk4dycaTcghB5VboSCf5GvMCoSvFBYtpAc=;
	b=Z0ZGPqrAcC8nFmfa1uVAQVrK0uxrKxxidW06QIdH9/vBGdmJNj3DvsK84RKnSKd9QD
	e7GPHDvu76bnV4driMVJOqamcTnmtTk2G3fX8jRlLCH5KxM3Bz1XnaCh0TCHOFsCdAlp
	mxzx7UezDuRbyrhIiqxwJdlBj6xDEYzVptZ1jOSpTRmXnaCZisDpNVbgeR9qw0yjOByr
	9ABzE0sHossnPvWLXsF7ELmpMphuAUzWreKOLFhquOXlJabyt2aUoxLvvUtkovF2hXnN
	8meor/0qqgUdpc5Qhxvksn/ksSV+Jt0aG0/8IksBUXkpdJFwMaqCSqHsjGUqD/5v1OpR
	vLKQ==
X-Gm-Message-State: AJaThX5lECaHNEkPG5mcnjNqGdguOtqsKT8qpNh6lYoujcNoVgLF+/FU
	sl5TCtch5OSLhWx5Pp7pvWMEt/YdNyv5ILwuLLc=
X-Received: by 10.28.230.77 with SMTP id d74mr702581wmh.75.1510257413148; Thu,
	09 Nov 2017 11:56:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Thu, 9 Nov 2017 11:56:22 -0800 (PST)
In-Reply-To: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Nov 2017 11:56:22 -0800
Message-ID: <CAKmqyKOzUD-u=+zW3CNJO6S_=y0u-0EiBu=YQpgmXzhW7L=vXA@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /NRwUZvBv+hz

On Thu, Nov 9, 2017 at 4:02 AM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> add voluntarily myself as maintainer for Smartfusion2

This should be:
Voluntarily add myself as maintainer for Smartfusion2.

>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>

With the commit message fixed:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  MAINTAINERS | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cd4d02..dae08bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -564,6 +564,23 @@ M: Alistair Francis <alistair@alistair23.me>
>  S: Maintained
>  F: hw/arm/netduino2.c
>
> +MSF2 SoC
> +M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> +S: Maintained
> +F: hw/arm/msf2-soc.c
> +F: hw/misc/msf2-sysreg.c
> +F: hw/timer/mss-timer.c
> +F: hw/ssi/mss-spi.c
> +F: include/hw/arm/msf2-soc.h
> +F: include/hw/misc/msf2-sysreg.h
> +F: include/hw/timer/mss-timer.h
> +F: include/hw/ssi/mss-spi.h
> +
> +MSF2 SOM board
> +M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> +S: Maintained
> +F: hw/arm/msf2-som.c
> +
>  CRIS Machines
>  -------------
>  Axis Dev88
> --
> 2.5.0
>
