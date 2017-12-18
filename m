Received: by 10.223.159.74 with SMTP id f10csp2883613wrg;
        Mon, 18 Dec 2017 09:02:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBotQOcfjGqd2c53hBAJWb88bF2e+ia3BRrc9Zjbvq1wD/YW5n4PopIW1iIvvnTvU34kC8Bwc
X-Received: by 10.13.217.202 with SMTP id b193mr324564ywe.147.1513616527695;
        Mon, 18 Dec 2017 09:02:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513616527; cv=none;
        d=google.com; s=arc-20160816;
        b=08vuKopV+RCDQNKCmXgs3wWKfxMJ2MW4GCUU702I0G+mMX+TlqYPGBW0TIRTZ8oJNU
         Dqod8mMFAkWyo57yUWOxT991vbzhhio7cBqfyiCMrv9v7c/vD0VH5Zf/qnA/fWZSrGOq
         FsBSU4Mx5vIIuI98ebB/nPypPTkd4mMabsZ0lTXfMNWIT9Szv3/W9Qpqr0lWY66qofX3
         dNLQY/NpgtT80f2lCCtzFyn2mEBHy3qoI9cMKYvEAxzzB7MWr6UOgSEJNCjui/YhjmJg
         BYqBZ8kKyLhko7iTOl9RWiL4+eQJCr8HwbbQYqcISB+betutSYpMheYmUfVPlPPASBbv
         JeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=creJ53Uk6VT/boALDGeYtUBVQLnfY2Jw0jk6j5zZu9I=;
        b=MYhlizzeOPR1aKLjp+7wWv3djyMRBT8+oeihDa3mese9UsnjkAiKwcwkV2L0exiXfZ
         S1oQZmOSBJeJhw0zjwstsgbEy/g1bg5sQIPPLWR2VJVmg9iRCwkRkciV12YKpb37d5/N
         JEFNM24iwP0QyPkzGtDFtDhiikqo3C1lo9T//DL7eqtZISjUT8skweU6v3jRdPyqyBTW
         AWDetJHLCzH8DHXdjnkiMQXxkt83y9YKqv4ycnoUMGmWISQD3qEJliNK8l3oBmJmwosI
         9KdumSZBKIEcqlBv++U+EwTRjvR7b+WbYV6DtvcCMn2DfMSW46IpemdGFuNfqc8NZ9CR
         z6lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7si2528806ywe.524.2017.12.18.09.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:02:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQynn-0004Mb-2V
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:02:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQynD-00046E-1g
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQyn7-0000zR-U4
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:01:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eQyn7-0000xU-LB; Mon, 18 Dec 2017 12:01:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9270083F47;
	Mon, 18 Dec 2017 17:01:24 +0000 (UTC)
Received: from localhost (ovpn-116-227.ams2.redhat.com [10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F452692A3;
	Mon, 18 Dec 2017 17:01:23 +0000 (UTC)
Date: Mon, 18 Dec 2017 17:01:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171218170122.GS16653@stefanha-x1.localdomain>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-20-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCKkSrrNUaKEhaIQ"
Content-Disposition: inline
In-Reply-To: <20171215031547.31006-20-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 18 Dec 2017 17:01:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 19/20] sdhci: add a check_capab_sdma()
 qtest
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
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gC3FsfgdZ8Wh


--lCKkSrrNUaKEhaIQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 12:15:46AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/sdhci-test.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
> index 966bd00499..b7646bccc6 100644
> --- a/tests/sdhci-test.c
> +++ b/tests/sdhci-test.c
> @@ -12,6 +12,7 @@
> =20
>  #define SDHC_CAPAB                      0x40
>  FIELD(SDHC_CAPAB, BASECLKFREQ,               8, 8); /* since v2 */
> +FIELD(SDHC_CAPAB, SDMA,                     22, 1);
>  #define SDHC_HCVER                      0xFE
> =20
>  static const struct sdhci_t {
> @@ -21,16 +22,19 @@ static const struct sdhci_t {
>          uintptr_t addr;
>          uint8_t version;
>          uint8_t baseclock;
> +        struct {
> +            bool sdma;
> +        } capab;
>      } sdhci;
>  } models[] =3D {
>      { "arm",    "smdkc210",
> -        {0x12510000, 2, 0} },
> +        {0x12510000, 2, 0, {1} } },
>      { "arm",    "sabrelite",
> -        {0x02190000, 3, 0} },
> +        {0x02190000, 3, 0, {1} } },
>      { "arm",    "raspi2",           /* bcm2835 */
> -        {0x3f300000, 3, 52} },
> +        {0x3f300000, 3, 52, {0} } },
>      { "arm",    "xilinx-zynq-a9",   /* exynos4210 */
> -        {0xe0100000, 3, 0} },
> +        {0xe0100000, 3, 0, {1} } },
>  };
> =20
>  static uint32_t sdhci_readl(uintptr_t base, uint32_t reg_addr)
> @@ -90,6 +94,15 @@ static void check_capab_baseclock(uintptr_t addr, uint=
8_t expected_freq)
>      g_assert_cmpuint(capab_freq, =3D=3D, expected_freq);
>  }
> =20
> +static void check_capab_sdma(uintptr_t addr, bool supported)
> +{
> +    uint64_t capab, capab_sdma;
> +
> +    capab =3D sdhci_readq(addr, SDHC_CAPAB);
> +    capab_sdma =3D FIELD_EX64(capab, SDHC_CAPAB, SDMA);
> +    g_assert_cmpuint(capab_sdma, =3D=3D, supported);
> +}
> +
>  static void test_machine(const void *data)
>  {
>      const struct sdhci_t *test =3D data;
> @@ -98,6 +111,7 @@ static void test_machine(const void *data)
> =20
>      check_specs_version(test->sdhci.addr, test->sdhci.version);
>      check_capab_readonly(test->sdhci.addr);
> +    check_capab_sdma(test->sdhci.addr, test->sdhci.capab.sdma);
>      check_capab_baseclock(test->sdhci.addr, test->sdhci.baseclock);
> =20
>      qtest_quit(global_qtest);
> --=20
> 2.15.1
>=20

--lCKkSrrNUaKEhaIQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaN/RiAAoJEJykq7OBq3PIhOgH/RQ6NDZ+VLVKBX72vksd1Oyg
nVfx8ClB6cqZglOhRq1WJ/GYoqKymQMT4KJw6PAWymipC123O2he1y83D8c5vjBm
Le7vtlIaFxNt7q6QrYL1fS5jUUVrqMagLoW20+na2oVMwl4AO1CMO1ujIaIfGCyf
ZLgFA3v9T0/DBjcIn25qtzjx3HBclx5XHeSttR3yORK3ytT66PgOVBWrJLdu6u13
IFoTX/L8W/k568kLQdxMCye9H7a9ldMsqlqMQE2BVlqaYRqaWM41w4kyQmBatL5D
CN0gNscKww/diEux5VGppz2I3lxVPeZtI69MOqqrtdri/eaSIMZxjgaWucoVrD4=
=MfQz
-----END PGP SIGNATURE-----

--lCKkSrrNUaKEhaIQ--
