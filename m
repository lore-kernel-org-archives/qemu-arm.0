Received: by 10.28.4.212 with SMTP id 203csp1637935wme;
        Sat, 21 Apr 2018 02:07:48 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48pPAhHi6qqXD3MmL9fxhO6WcFjYoxRwMFY9r25UxIwETOOWWIUGZ7Y9s+IbYM5x9xtfz7H
X-Received: by 10.55.162.13 with SMTP id l13mr13528876qke.124.1524301667855;
        Sat, 21 Apr 2018 02:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524301667; cv=none;
        d=google.com; s=arc-20160816;
        b=NW5AdtiSyzm5N3gR86nflqIU1+uOz0dYbtcJyG/wmrEzc0yl7vNOzgqeWCo7iLgTbq
         rn9WN/4zMkNIyjn7+/1hQRUrU25f0s3Md5wmYzf1Pg4p+Zq6YtFJ5ik/MsymXl59HqHh
         fC/a1gUmMDuOWGEFc5X4OoCFOl1aoeVDyyJJ1DOS9T6TxnmHHpBwpxCPMhq8NGiLOI28
         wpRxH//USCBXzNUb5m2iYAyqPYUVOw8RSosJ7dLNFw9Aj6Rftqaqf7m4+/mCifdhHQL1
         LUSaBGxB6JUMXP8P8/sUUjYKNr/l0CakFc/Z7RGChI6L4xLchxxq+QZvrXKKN1doUV/T
         k/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Fg56WtP+1mkEPGsjo+Ron4XEGFKS/N5wkoD8xJdX6Yg=;
        b=FJjHzDvmwboPL+G/bDjFJdDwdiiJk9THwsQCaxeqb5Flj1dLTt189qE6mTQPD7arNq
         tONlu/OSpNVvXVO6VOZMS7ow+onP76TqsigpmJ1DSZl3F2CLAC9vinTf1Bxlp2a4Phir
         OsJtb0FwQeE4t4cZczw1XkP4Bc++/LNpXhgGDjgX1ti8hJGhDq5pKiUdH6IEvnDYJXV7
         ZJ31qIiSQfjTTQD5SFCTXNxbpBSHNRtnrqVDN2EFmcaZ371LYlmeQppIqU8ll5CQrFpT
         MJUmrgCwR3ogyPtDW9RGyGp6SYmNXuDtD1Y7ZboedjQP1RyoUQAMbOreRkAUEDWjcBmF
         EO5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7-v6si5344026qtg.300.2018.04.21.02.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Apr 2018 02:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9oUl-0001au-7b
	for alex.bennee@linaro.org; Sat, 21 Apr 2018 05:07:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1f9oUP-0001a6-0F
	for qemu-devel@nongnu.org; Sat, 21 Apr 2018 05:07:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1f9oUL-0003Ly-TK
	for qemu-devel@nongnu.org; Sat, 21 Apr 2018 05:07:24 -0400
Received: from 16.mo1.mail-out.ovh.net ([178.33.104.224]:35199)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1f9oUL-0003Ks-Kx
	for qemu-devel@nongnu.org; Sat, 21 Apr 2018 05:07:21 -0400
Received: from player796.ha.ovh.net (unknown [10.109.108.70])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 23B15F040B
	for <qemu-devel@nongnu.org>; Sat, 21 Apr 2018 11:07:20 +0200 (CEST)
Received: from zorba.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: postmaster@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id DFBEB5C009F;
	Sat, 21 Apr 2018 11:07:13 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180420124835.7268-1-peter.maydell@linaro.org>
	<20180420124835.7268-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f80b3748-12d4-de8b-1661-e07a7d33b60a@kaod.org>
Date: Sat, 21 Apr 2018 11:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180420124835.7268-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 18394671205727570738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrjeelgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.104.224
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/arm/aspeed: don't make 'boot_rom'
 region 'nomigrate'
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
Cc: Rob Herring <robh@kernel.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvfQB4Qxfz8k

On 04/20/2018 02:48 PM, Peter Maydell wrote:
> Currently we use memory_region_init_ram_nomigrate() to create
> the "aspeed.boot_rom" memory region, and we don't manually
> register it with vmstate_register_ram(). This currently
> means that its contents are migrated but as a ram block
> whose name is the empty string; in future it may mean they
> are not migrated at all. Use memory_region_init_ram() instead.
>=20
> Note that this is a cross-version migration compatibility break
> for the "palmetto-bmc", "ast2500-evb" and "romulus-bmc" machines.

Migration does not work for these.=20

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

On palmetto, romulus and ast2500-evb boards=20

Thanks

C.

> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 7088c907bd..aecb3c1e75 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -225,7 +225,7 @@ static void aspeed_board_init(MachineState *machine=
,
>           * SoC and 128MB for the AST2500 SoC, which is twice as big as
>           * needed by the flash modules of the Aspeed machines.
>           */
> -        memory_region_init_rom_nomigrate(boot_rom, OBJECT(bmc), "aspee=
d.boot_rom",
> +        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom=
",
>                                 fl->size, &error_abort);
>          memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR=
,
>                                      boot_rom);
>=20

