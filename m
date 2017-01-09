Received: by 10.25.205.13 with SMTP id d13csp11386125lfg;
        Mon, 9 Jan 2017 00:14:29 -0800 (PST)
X-Received: by 10.233.220.131 with SMTP id q125mr78158627qkf.245.1483949669772;
        Mon, 09 Jan 2017 00:14:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h56si6079331qte.96.2017.01.09.00.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 00:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQV62-0003GZ-VS
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 03:14:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cQV5y-0003G9-RG
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 03:14:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cQV5v-0001Tx-MD
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 03:14:22 -0500
Received: from mo178.mail-out.ovh.net ([178.32.228.178]:52687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cQV5v-0001TI-GJ
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 03:14:19 -0500
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 8CADFC509
	for <qemu-arm@nongnu.org>; Mon,  9 Jan 2017 09:14:15 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 0C32C3C0096;
	Mon,  9 Jan 2017 09:14:09 +0100 (CET)
To: Marcin Krzeminski <mar.krzeminski@gmail.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
	<20170108083854.5006-4-mar.krzeminski@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <598b60e9-15a9-b4ee-b46d-aa8d03f9cef6@kaod.org>
Date: Mon, 9 Jan 2017 09:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170108083854.5006-4-mar.krzeminski@gmail.com>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 5068519906323565488
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrvdefgddvkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.228.178
Subject: Re: [Qemu-arm] [PATCH v3 3/3] block: m25p80: Improve 1GiB Micron
 flash definition
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sKFZLrxRtdyS

On 01/08/2017 09:38 AM, Marcin Krzeminski wrote:
> n25q00 and mt25q01 devices share the same JEDEC ID. The difference
> between those two devices is number of dies and one bit in extended
> JEDEC bytes. This commit adds proper entry for both devices by
> introduction the number of dies and and new 25q00 entries.
>=20
> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>


Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/block/m25p80.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index a9b025b..fb5cef3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -242,8 +242,10 @@ static const FlashPartInfo known_devices[] =3D {
>      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
>      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
>      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> -    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K) },
> -    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K) },
> +    { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4=
K, 4) },
> +    { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4=
K, 4) },
> +    { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4=
K, 2) },
> +    { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4=
K, 2) },
> =20
>      /* Spansion -- single (large) sector size only, at least
>       * for the chips listed here (without boot sectors).
>=20

