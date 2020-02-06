Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1373721lfp;
        Thu, 6 Feb 2020 04:24:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvhyPWbTVcLaaxH55SIpStoTslVdW0Iq4p9MGJXAEgAiYHNN4jyyJ4q/4BW8EzlZ9OTT5I
X-Received: by 2002:a37:b883:: with SMTP id i125mr2316464qkf.64.1580991870804;
        Thu, 06 Feb 2020 04:24:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580991870; cv=none;
        d=google.com; s=arc-20160816;
        b=mXJ8obcaZ0NU2adMMQGpcYvfCcz1Y2FcOrF8PBTg/obQDzXqkF3oNzETQJpvccRH2v
         0RUGHEBi3JEvACz2PKarphdQBY9seTX5YAySMzRYwkorwx+JSKZBI34WEE05MNSFfVl3
         13tzK6aXy8lIeE1vQ9WCJfIPIuRJel7eTedba1qFUO1kgioXoa4Nj7lIQAdlUKxdfWiZ
         vRJKkOAkH1gjhzPHr8fFd8Ig/PDPCmig505WE1wp9+EO9DuCzRR9sUvqEP1ztaJYPIun
         9ZW0gK5UGNd0Nzwa90zYFB8t3xr0sZ9vK7jyMeY5ldwaDqXAI/Uz/ThKnsbp+A/4FJgu
         /UrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=1cua+EsoqXFGIxrbgIHXJi62xMvkrJx03spr156Xa/g=;
        b=PS/Eu3z9geyAIU1C5l0vKr1HY/lWNQSV9uqZNk74Ykjy8Wqa/J0nFUIhW0NIWFvyUz
         WWs4ggXmVGFp2ZitfeHwD6TEKfydqEIYQlD0cTd11xfhU6G1l9kQJVuqvzoDvUvPWTVH
         Gy4Z+/ikIsv2aolsiCKcaYJvkr9W2b8j2Mve2EKQetzknslUTSRSZ9qzfKca6KZ70c6M
         7iDhiFBeWHO5ZgaWzhUACNOMpqmbSD4F6WTAIMiUVYS0Pxq5Ke+ZThE1iWAG2vsM4suO
         tjeM1Y9kaH1KLDRmNBx4SOMDh2TdJtIHy2Ko2eq1OICqsdm7+Bs4qea/hq0nhF80CUwM
         /rtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si1453871qkn.112.2020.02.06.04.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:24:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgCs-0003TF-95
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1izgCm-0003T8-6m
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:24:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1izgCl-0000VI-3D
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:24:24 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15551)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1izgCk-00007R-Sa; Thu, 06 Feb 2020 07:24:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 08B4D746383;
 Thu,  6 Feb 2020 13:24:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D9C9074637F; Thu,  6 Feb 2020 13:24:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D859274569F;
 Thu,  6 Feb 2020 13:24:19 +0100 (CET)
Date: Thu, 6 Feb 2020 13:24:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 04/30] hw/arm/raspi: Extract the RAM size from the
 board revision
In-Reply-To: <20200206011756.2413-5-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2002061321480.71431@zero.eik.bme.hu>
References: <20200206011756.2413-1-f4bug@amsat.org>
 <20200206011756.2413-5-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-125707739-1580991859=:71431"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wHfelO9O/Dqk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-125707739-1580991859=:71431
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Feb 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> The board revision encode the amount of RAM. Add a helper
> to extract the RAM size, and use it.
> Since the amount of RAM is fixed (it is impossible to physically
> modify to have more or less RAM), do not allow sizes different
> than the one anounced by the manufacturer.
>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Alistair Francis <alistair@alistair23.me>
>
> hw/arm/raspi.c | 15 ++++++++++++---
> 1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 13d41dfce6..2f5cd32c5e 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -13,6 +13,7 @@
>
> #include "qemu/osdep.h"
> #include "qemu/units.h"
> +#include "qemu/cutils.h"
> #include "qapi/error.h"
> #include "cpu.h"
> #include "hw/arm/bcm2836.h"
> @@ -48,6 +49,12 @@ FIELD(REV_CODE, MANUFACTURER,      16, 4);
> FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
> FIELD(REV_CODE, STYLE,             23, 1);
>
> +static uint64_t board_ram_size(uint32_t board_rev)
> +{
> +    assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style =
*/
> +    return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
> +}
> +
> static int board_processor_id(uint32_t board_rev)
> {
>     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style *=
/
> @@ -190,15 +197,17 @@ static void raspi_init(MachineState *machine, uin=
t32_t board_rev)
> {
>     RasPiState *s =3D g_new0(RasPiState, 1);
>     int version =3D board_version(board_rev);
> +    uint64_t ram_size =3D board_ram_size(board_rev);
>     uint32_t vcram_size;
>     DriveInfo *di;
>     BlockBackend *blk;
>     BusState *bus;
>     DeviceState *carddev;
>
> -    if (machine->ram_size > 1 * GiB) {
> -        error_report("Requested ram size is too large for this machine=
: "
> -                     "maximum is 1GB");
> +    if (machine->ram_size !=3D ram_size) {
> +        char *size_str =3D size_to_str(ram_size);
> +        error_report("This machine can only be used with %s", size_str=
);

Reword error message so it says it has problem with memory as this is not=
=20
clear from the above and user getting it after a command line does not=20
have context to tell what the printed number means.

Regards,
BALATON Zoltan


> +        g_free(size_str);
>         exit(1);
>     }
>
>
--3866299591-125707739-1580991859=:71431--
