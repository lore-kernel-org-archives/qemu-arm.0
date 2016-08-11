Received: by 10.25.21.156 with SMTP id 28csp53859lfv;
        Thu, 11 Aug 2016 03:36:50 -0700 (PDT)
X-Received: by 10.55.15.169 with SMTP id 41mr9484422qkp.229.1470911810803;
        Thu, 11 Aug 2016 03:36:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s90si1178763qtd.71.2016.08.11.03.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnM2-00046t-7G
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnKG-0002xw-DK
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnKE-000285-Fv
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:34:59 -0400
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:35787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnKE-00027y-BV
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:34:58 -0400
Received: by mail-ua0-x236.google.com with SMTP id n59so111958829uan.2
	for <qemu-devel@nongnu.org>; Thu, 11 Aug 2016 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ewVLFNCmM7U97I519IixDutXodj/8ZXmVyJKpGiitsM=;
	b=bq27eC5yRPfGrbTSvyDB9+Uvi/MzKXjqdjxEm8x/6C7sxXZCG3xt1Pp1Wb+ohOQd4O
	OH0Ptf1A+BQUEkyVVzxzleRU3rfKVmkD9Z88p5Wf/zmiedhDvbHF/axBs/M+rTx5apAS
	sLnWC8FBbEVbuijfIpGk0AePqSwl+mX/OxkoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ewVLFNCmM7U97I519IixDutXodj/8ZXmVyJKpGiitsM=;
	b=O4DTNRtr87TSUvCd1CfoMIUxEMt65SFxkNQommDKlKx2j6ZdMfcosIhHGyjUUPrDk7
	GsMDKJ3xug2KjisJDpPfS+FnRAVcLn0qZU8FZAWs+ew6pwJIZ3Cfbb1/uXBqjJGdWbR8
	keBJ75aZ6tCXJurJfkElPlbH8FDQpDUqeeEN62c5XkBo9ygfPHzDyYN+Qpc3Fuuujwa7
	Y2u2g9dBHjpqVDMaAlwH3+oj3USLkU3iFI3pFJmzje5o5OY8W3kMu8eCropmSrcPwfDl
	95RvN5tlw1pbS/jIrvEZ1YMl3ohFOgfh+hNbXdHFTdTP7l3T3qlWmA1peBVhhyeK/B+8
	CGKw==
X-Gm-Message-State: AEkooutrxmWXpfaxoHDljkoxpbE9Fyc3epKL9+IUi19G58PXAJx+w5B5rlaCZhtj5xXeBLvy6k1Zc6Ru/b+g+Q98
X-Received: by 10.176.82.139 with SMTP id v11mr4583202uav.4.1470911697940;
	Thu, 11 Aug 2016 03:34:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:34:37 -0700 (PDT)
In-Reply-To: <1470158147-16378-10-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-10-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:34:37 +0100
Message-ID: <CAFEAcA8fffAD2WyCNW95Nk__cc+4aTzaFE6bu-EXZsNA4_616Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-devel] [PATCH v3 09/10] arm: add support for an ast2500
 evaluation board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8SB0DBGZlBW

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The ast2500 eval board has a hardware strapping register value of
> 0xF100C2E6 which we use for a definition of AST2500_EVB_HW_STRAP1
> below.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v2:
>
>  - removed silicon-rev and cpu-model. This is now in the SoC.
>
>  Changes since v1:
>
>  - changed AST2500_EDK to AST2500_EVB
>  - fixed white space issues
>  - added AST2500_HW_STRAP1
>
>  hw/arm/aspeed.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 80907b4244ea..e71500c64bd3 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -36,7 +36,8 @@ typedef struct AspeedBoardConfig {
>  } AspeedBoardConfig;
>
>  enum {
> -    PALMETTO_BMC
> +    PALMETTO_BMC,
> +    AST2500_EVB

Prefer trailing comma.

>  };

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
