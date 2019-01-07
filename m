Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3219212wrt;
        Mon, 7 Jan 2019 00:48:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN40SvKrQQzdivBrSIQNrshz6Zl0hvnEaZ6CcnuUUENM/WGb934i5hDnUKXLc830s3R4G7iO
X-Received: by 2002:a1c:5a42:: with SMTP id o63mr7846602wmb.88.1546850923328;
        Mon, 07 Jan 2019 00:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546850923; cv=none;
        d=google.com; s=arc-20160816;
        b=PlH/4opPx4EnhyKDNnAlqox9Fo5nXCj4Ug+7+xrcUc5rUH9D3TnQYi/xfuiJqvPluK
         D+/rF+YbG+fT8Turs7ozyU7hwXCj51U3WDIucUlLcEdKLuARUYga6lfKTNzXH9orOHer
         DLZGBU54QkE81Vn/1BbScSOV2SE3PVW3SGa5Esa8hGr4p/eapBaRMBJGK1siLL/Ynkgn
         EKKHyHLB7Vm55TmjzvV8rbtMeeZcrW8QIQHc8pFCo8tSzhdU5phqPsJAFZ8RVkwgsjRi
         IHVVyb+L/R+RkQriQjuFsWsIAttz2vBYCjl14hgtytKfjZExgp2mnTgqMJJd6UPsZgMI
         o4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature;
        bh=jcEht2FuH4gTN9viEohIlZZvPy+pED9CMUhR354dofg=;
        b=SL0CSPVBzD8K3ES2KgeAUkv2X9/FCTldQnPyYKlJITxHovzef1fEKz3++23fXRWiBN
         ZdPgkPhYlaXg2U1wK4gohaNH1/oQqxCMpWPFQpBELTvs+Fnbo8VcJxnaV9aFbrRNdkAX
         v+kpwk8JPZngrHuM9sb31mR8W5yhg6UqZBgJAuCxcSoolxewdqybRywmsZDqLx/OsRk+
         PB4ke6423uCdGJQ9q0444lM0HEYTn+3PQ2PloxhWHHkbIK2WZ4O/SE+9I5zyxxH3UMmk
         /EvKNixJABYFKuRkOmuSXoQLeRWhb6gHn2C7vvDoDSouun1rwLvT+dllu1xvoM+I5It5
         X1RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="4mTsS85/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xXhwutPR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xXhwutPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b69si4786156wmd.92.2019.01.07.00.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="4mTsS85/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xXhwutPR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xXhwutPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggQaQ-0002A2-Dz
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:48:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ggQaF-00029t-Ks
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:48:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ggQaD-0007GM-ML
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:48:31 -0500
Received: from greensocs.com ([193.104.36.180]:44364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ggQaB-0007Dp-Ia; Mon, 07 Jan 2019 03:48:29 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 74DED64141A;
	Mon,  7 Jan 2019 09:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546850906;
	bh=4cd45cDFbIu7DwZ0RqYcbCCzFtoWBoEAKKW+++xsYlk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=4mTsS85/OHKqRc1qBqk/zNWIuqxzvdARoNfwkx1zyeXih7uU19xetRezIbexsQ80d
	1SUX9bzyVcK2HxWcxE7mErIO0apyo27OIe7dVf0e2Mk3yhuOvPiJKogNZy+gUyRJfv
	oxYSEqeBi6BIQbmK/c8lBpklfn7ApVKju9w9bFZk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=xXhwutPR;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=xXhwutPR
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TOYuWqaSfME; Mon,  7 Jan 2019 09:48:25 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id A262464140F; Mon,  7 Jan 2019 09:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546850905;
	bh=4cd45cDFbIu7DwZ0RqYcbCCzFtoWBoEAKKW+++xsYlk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xXhwutPRWfDIJ+E9ZoKXB84MRW8NEtelZMpQ8zK9NuczX+r/LNjvDuo/08toGkJbD
	PWU2jTJ+kJQSMDINhfMlndbN8M7WBxrV3CJkdhgM73q3bw8PKmvEd5xVFuwmyBYIFy
	Yda686cLdhPLVA/nTJlRic4aISqPjK5kcr5CeNVU=
Received: from [172.16.11.100] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 379026413EF;
	Mon,  7 Jan 2019 09:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546850905;
	bh=4cd45cDFbIu7DwZ0RqYcbCCzFtoWBoEAKKW+++xsYlk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xXhwutPRWfDIJ+E9ZoKXB84MRW8NEtelZMpQ8zK9NuczX+r/LNjvDuo/08toGkJbD
	PWU2jTJ+kJQSMDINhfMlndbN8M7WBxrV3CJkdhgM73q3bw8PKmvEd5xVFuwmyBYIFy
	Yda686cLdhPLVA/nTJlRic4aISqPjK5kcr5CeNVU=
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190104142812.20444-1-edgar.iglesias@gmail.com>
	<20190104142812.20444-3-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b35dfd51-bf47-7cca-159b-0649f8caebf8@greensocs.com>
Date: Mon, 7 Jan 2019 09:48:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190104142812.20444-3-edgar.iglesias@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="cJKqJ45iR8fo8AsiVhOGC0hAlBolVKpzk"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v1 2/2] target/microblaze: Add props enabling
 exceptions on failed bus accesses
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iPYedGtzu7S7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cJKqJ45iR8fo8AsiVhOGC0hAlBolVKpzk
Content-Type: multipart/mixed; boundary="snzqRF2YJCPADlzhhn5QFk2jgtT0o5Fdu";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, frederic.konrad@adacore.com,
 alistair@alistair23.me, philmd@redhat.com, frasse.iglesias@gmail.com,
 figlesia@xilinx.com, sstabellini@kernel.org, sai.pavan.boddu@xilinx.com,
 edgar.iglesias@xilinx.com
Message-ID: <b35dfd51-bf47-7cca-159b-0649f8caebf8@greensocs.com>
Subject: Re: [PATCH v1 2/2] target/microblaze: Add props enabling exceptions
 on failed bus accesses
References: <20190104142812.20444-1-edgar.iglesias@gmail.com>
 <20190104142812.20444-3-edgar.iglesias@gmail.com>
In-Reply-To: <20190104142812.20444-3-edgar.iglesias@gmail.com>

--snzqRF2YJCPADlzhhn5QFk2jgtT0o5Fdu
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 1/4/19 3:28 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>=20
> Add MicroBlaze CPU properties to enable exceptions on failed
> bus accesses.
>=20
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/microblaze/cpu.c | 12 +++++++++++-
>  target/microblaze/cpu.h |  2 ++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 49876b19b3..5596cd5485 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -202,7 +202,11 @@ static void mb_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>                          (cpu->cfg.use_barrel ? PVR2_USE_BARREL_MASK : =
0) |
>                          (cpu->cfg.use_div ? PVR2_USE_DIV_MASK : 0) |
>                          (cpu->cfg.use_msr_instr ? PVR2_USE_MSR_INSTR :=
 0) |
> -                        (cpu->cfg.use_pcmp_instr ? PVR2_USE_PCMP_INSTR=
 : 0);
> +                        (cpu->cfg.use_pcmp_instr ? PVR2_USE_PCMP_INSTR=
 : 0) |
> +                        (cpu->cfg.dopb_bus_exception ?
> +                                                 PVR2_DOPB_BUS_EXC_MAS=
K : 0) |
> +                        (cpu->cfg.iopb_bus_exception ?
> +                                                 PVR2_IOPB_BUS_EXC_MAS=
K : 0);
> =20
>      env->pvr.regs[5] |=3D cpu->cfg.dcache_writeback ?
>                                          PVR5_DCACHE_WRITEBACK_MASK : 0=
;
> @@ -265,6 +269,12 @@ static Property mb_properties[] =3D {
>      DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_wri=
teback,
>                       false),
>      DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
> +    /* Enables bus exceptions on failed data accesses (load/stores).  =
*/
> +    DEFINE_PROP_BOOL("dopb-bus-exception", MicroBlazeCPU,
> +                     cfg.dopb_bus_exception, false),
> +    /* Enables bus exceptions on failed instruction fetches.  */
> +    DEFINE_PROP_BOOL("iopb-bus-exception", MicroBlazeCPU,
> +                     cfg.iopb_bus_exception, false),
>      DEFINE_PROP_STRING("version", MicroBlazeCPU, cfg.version),
>      DEFINE_PROP_UINT8("pvr", MicroBlazeCPU, cfg.pvr, C_PVR_FULL),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 03ca91007d..792bbc97c7 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -308,6 +308,8 @@ struct MicroBlazeCPU {
>          bool use_mmu;
>          bool dcache_writeback;
>          bool endi;
> +        bool dopb_bus_exception;
> +        bool iopb_bus_exception;
>          char *version;
>          uint8_t pvr;
>      } cfg;
>=20


--snzqRF2YJCPADlzhhn5QFk2jgtT0o5Fdu--

--cJKqJ45iR8fo8AsiVhOGC0hAlBolVKpzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlwzElgACgkQd8knW3Qn
Tr6DuhAAlLLjK7ik55617B5bbLGLNH/HmfUoWbS7RXxqveT3VmjwdYT6gsutzC5g
E3Od4a7ylz0uLUNH3FSVHIcBVyisB8vn/F4oJGpR+/xAPioTS7D2wYaUkz9WzfWc
H5sxXYMWTM5LSzgvM5CL5hAleIYqANKZtUctECiKRkZfaTVeP6lnomC+hdLg0Pfj
CTBwwF06ygt7ExfNrmrnEmF3LSQgge7ZLzFO0Yw9ijk8cu7l20vS1UCfA2wiLVmg
uGr1V3yZFesNZLIDy9L9dFX3zOOyz76PTU/R5CiDyJui/5IM3J7Vq7nHVx2HuR38
Lt/zUOmXXlDPOKn6mvg+R8VSuyeAbMYhGqcWF3ZEgsv6qHiG62F7uFUb/w4WzquA
y0L/wPofAnAIsD26Nf7lIiKmxjfb/IcbBZKRc7iqJmNhbIn/cXR7IdcoLvJUZMfH
r65X7toRQMiPD5wGRwncltrQ+ggDcg88qZXMFOhe/pXpFI4N6qgdUcsT+fKV5x63
zA5iZKgIDXZ1RN6h19YWF1fvTBP0nP3kmD8GhkWfKebB3ev/whV4dwT4SsfApP3Q
YPXOX/6S3fNBCwixe7Uv0z+yUKC0fv6ATLMIDR+dDZmFks+HSychD3b/3d3rlQg3
Q1NHONeIKc+4iWNeZZuWVDmXbiPXCmzrPsGUwZnyVAn1ZPZLWpk=
=TCMI
-----END PGP SIGNATURE-----

--cJKqJ45iR8fo8AsiVhOGC0hAlBolVKpzk--
