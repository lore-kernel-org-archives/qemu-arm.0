Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1016420wrt;
        Wed, 28 Nov 2018 05:10:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VaAJ+OuczFvVb7zF4GwlU9cmbjrkMoS9Cmq3K7H+8hNBBYHXAOgdfDAOUjF3nd0RceuMo5
X-Received: by 2002:a25:2511:: with SMTP id l17-v6mr32306749ybl.488.1543410655698;
        Wed, 28 Nov 2018 05:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543410655; cv=none;
        d=google.com; s=arc-20160816;
        b=LnElozpk6O1WB9PXmC9gL2nitO36dtMwneKS1y9/QiA2N0rLz+MNn98azEZ8aLt9Gn
         bMgOBXnlOZsVYVT3oQOIQEivvMwu+VBi1OYPQ5QxaCLev3/kZKOLfbN0NeXENxkYYuIl
         DunOCGGPBUa6NSLkIElSYjY/tmoi8SiaY+pSLWalx1HxWp7ubd0BFf8B+ZsSJMkSKQHT
         GehN2BVBWUUzgMo9DLY1seizm4yf78xipNhlzfbdrDuyR4majlKjenfw8pghTTI88xOL
         m1umRh0zrEIqxhy8MbFI0D+cecm7Sj/RcwtiYeZv+6nfofYNHnqkefZsByar/SoW9nYr
         /SKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=sXdrb/qod9B5InOBOVTeRzQ5WxCzgjVyklB/giqTw1o=;
        b=WzSnvVK5pzewDTPpgvAfJOpDRfNmhHb41ZJ1L+/e+Y0t6xeGqzjBD+cINU1Tf16omC
         rT2x7LEBvWiRn7EQrc/Al1PN/16NJYP6WTy0ptV1A8oAUdTLo/6BLTNSxWpw3IWlGMpC
         9bx2djwbSRawU3mszIacI9XHcFfPnPQNj4VWdKnVkiWJDeIxlTpfOSFKR/TBnL32VMIX
         VULJzfuX5L2EJSydVWcgZ4JxPzixEt6bKEBLZakTxyhl8IuwLZTi+XKvVqG6IGYGLo/b
         KF9YWuKpkup2sAqUJtwYsFi/ZtU0Yv7NOJ8i5B1Iduy9LZ31sQBiJLAbmvi8lau7k8cQ
         XlZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21-v6si4487116ywd.222.2018.11.28.05.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 05:10:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRzcF-0000rr-3Y
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 08:10:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gRzbX-0000QQ-Sy
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 08:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gRzbT-0002ya-QU
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 08:10:11 -0500
Received: from 6.mo6.mail-out.ovh.net ([87.98.177.69]:60019)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gRzbT-0002yJ-KL
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 08:10:07 -0500
Received: from player774.ha.ovh.net (unknown [10.109.143.183])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id E8FF019C095
	for <qemu-arm@nongnu.org>; Wed, 28 Nov 2018 14:10:05 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player774.ha.ovh.net (Postfix) with ESMTPSA id 3EAB9482B29;
	Wed, 28 Nov 2018 13:09:58 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1543397736-8198-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <27825a78-913d-3136-de1f-6cd289539b3f@kaod.org>
Date: Wed, 28 Nov 2018 14:09:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1543397736-8198-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10641161495796878256
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedruddvuddggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.177.69
Subject: Re: [Qemu-arm] [PATCH for-3.1?] hw/arm/aspeed: Fix build issue with
 clang 3.4
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XJdygamjKIEG

Hello Thomas,

On 11/28/18 10:35 AM, Thomas Huth wrote:
> When using clang 3.4.2, compilation of QEMU fails like this:
>=20
>   CC      aarch64-softmmu/hw/arm/aspeed.o
> hw/arm/aspeed.c:36:3: error: redefinition of typedef 'AspeedBoardState'=
 is a C11
>       feature [-Werror,-Wtypedef-redefinition]
> } AspeedBoardState;
>   ^
> include/hw/arm/aspeed.h:14:33: note: previous definition is here
> typedef struct AspeedBoardState AspeedBoardState;
>                                 ^
> 1 error generated.
> make[1]: *** [hw/arm/aspeed.o] Error 1
> make: *** [subdir-aarch64-softmmu] Error 2
>=20
> Remove the duplicated typedef to fix this issue.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

yes. May be for 3.1.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>  hw/arm/aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6b33ecd..5158985 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -29,11 +29,11 @@ static struct arm_boot_info aspeed_board_binfo =3D =
{
>      .nb_cpus =3D 1,
>  };
> =20
> -typedef struct AspeedBoardState {
> +struct AspeedBoardState {
>      AspeedSoCState soc;
>      MemoryRegion ram;
>      MemoryRegion max_ram;
> -} AspeedBoardState;
> +};
> =20
>  /* Palmetto hardware value: 0x120CE416 */
>  #define PALMETTO_BMC_HW_STRAP1 (                                      =
  \
>=20

