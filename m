Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1574119wru;
        Thu, 16 Aug 2018 01:11:11 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxTUUudFzRLM7vW+AxwctMF3+MSc7mIX0B5ZcCV54FSFqBNfEzUq8+IR20U/nYb0Khm/Q8c
X-Received: by 2002:a0c:aa06:: with SMTP id d6-v6mr25438519qvb.26.1534407071386;
        Thu, 16 Aug 2018 01:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534407071; cv=none;
        d=google.com; s=arc-20160816;
        b=kmnxWcY3kd7eusLnC6Pz4DloP4qt3W3NZdkPF/iO++e5Q9Fhx3IyoTsXe90vaR3mNk
         zu8vU6+Rf1KnKfIdwHj3tVOXjv6c0Matb3bWxxBnDizeahfpMmJU0QDQShLsRIPI7vxU
         I5CkbBDgqIxSbkdl5R0e2xlUWT+169CMsWtXVsFDr1+VGTeaXFVvLH9oy32r+FPKEZSG
         i8h83RfGDv/FMaEDelFeFG6Yv25KOFOHbj/0loxEmnk7msVkx9UvEpozPMkYvwlrmlx4
         2Mrf6Y5NW+XPuE3+iqk2xdHTyb/M7f8Hip43hoJS5WkptrTaaXWbEr7WCdWQdlmspitJ
         otWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=YO8lazwqIUS08aVZNLRY9v9hQr43dQj9DsE3z7yNIcY=;
        b=FNAs51q3d2anWJnghqRv6Sap4naWNp1+d520Yhp1SBMr7wnp5NsMUOE5FOiHRjGToc
         ugdsyNlZzh5i3dsstrN1MgKqzIAewvVezgy3+CAZBzH3RJV4oyxz1oR+BkW5TnRIPs76
         IVvQZqpu31kRwmKTclt02mUmna0/e1a6yky/3lWxrQRNBIfaIk67ByiLGMFkD7KDUI4F
         1ouimTMIiwin4M4U2sMog9Dd4OhP41S4zfihpKgIKorN4KMizWQuceXxVp+T1YF/tRN3
         CuF6dO8EEbkCeg91PQmfgxvKVz2LBck9IGqJSzT0nabY7BOEt86fdCpontdJA8R75667
         Ptqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zD0UORs8;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zrdIiwBU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zrdIiwBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27-v6si3818406qty.74.2018.08.16.01.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 01:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zD0UORs8;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zrdIiwBU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zrdIiwBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqDN8-0003SB-Qp
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 04:11:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqDMx-0003Rh-Hg
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 04:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqDMs-0002Q7-Kt
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 04:10:59 -0400
Received: from greensocs.com ([193.104.36.180]:54291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fqDMs-0002Pw-9P; Thu, 16 Aug 2018 04:10:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AE8CA2386F1;
	Thu, 16 Aug 2018 10:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534407045;
	bh=PiyBneuyrB6hZh85M7pYSBp0A8b5/3kx+5uPevLObOo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=zD0UORs812hK5HHEUdFTwsL4IHQ50IOtXlJJ4rFZzKUVhsPND3LzR9QUGQE81enmW
	HyP88/yLRUlYFNKX0lt/USPL7F0Yb85iSTKyL2sNcI4U+vX7WwBRUKS7BHyZauTYml
	RPosRNfT36dYZljViVMHmDtwhiGsqV9jimuDjl/g=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zrdIiwBU;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zrdIiwBU
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIzvpaFDf518; Thu, 16 Aug 2018 10:10:44 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B259023870D; Thu, 16 Aug 2018 10:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534407044;
	bh=PiyBneuyrB6hZh85M7pYSBp0A8b5/3kx+5uPevLObOo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=zrdIiwBUojOsFqziJmaRQb2Iof3pUkveUl7wrfVVZDeb0ryIL22Qy07J7BWT6sGO5
	D/PmR5iexvrD7acB2PXuELnw+vHI5UPRx7IqQ5c5a2cFJzRJQk79cU1Eixaz1MGTxs
	BP1id5SGx0juhuLTbDxeC25x3BxbXMiubV+E6As4=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6AFF32386F1;
	Thu, 16 Aug 2018 10:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534407044;
	bh=PiyBneuyrB6hZh85M7pYSBp0A8b5/3kx+5uPevLObOo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=zrdIiwBUojOsFqziJmaRQb2Iof3pUkveUl7wrfVVZDeb0ryIL22Qy07J7BWT6sGO5
	D/PmR5iexvrD7acB2PXuELnw+vHI5UPRx7IqQ5c5a2cFJzRJQk79cU1Eixaz1MGTxs
	BP1id5SGx0juhuLTbDxeC25x3BxbXMiubV+E6As4=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-10-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f41e91ae-324e-17dc-f7c3-34c499dbe027@greensocs.com>
Date: Thu, 16 Aug 2018 10:10:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-10-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oANo8G3AxHELt1pdVopR5dxkChviLCjS8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 09/10] target/arm: Implement AArch32 ERET
 instruction
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
Cc: edgari@xilinx.com, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PoblZYyFClsT

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oANo8G3AxHELt1pdVopR5dxkChviLCjS8
Content-Type: multipart/mixed; boundary="8bBTLDRDhuvw6DUUpTF7zv0QgBn5cEvwW";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <f41e91ae-324e-17dc-f7c3-34c499dbe027@greensocs.com>
Subject: Re: [PATCH 09/10] target/arm: Implement AArch32 ERET instruction
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-10-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-10-peter.maydell@linaro.org>

--8bBTLDRDhuvw6DUUpTF7zv0QgBn5cEvwW
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> ARMv7VE introduced the ERET instruction, which is necessary to
> return from an exception taken to Hyp mode. Implement this.
> In A32 encoding it is a completely new encoding; in T32 it
> is an adjustment of the behaviour of the existing
> "SUBS PC, LR, #<imm8>" instruction.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/arm/translate.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 3f5751d4826..5ecc24f12fb 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8887,6 +8887,25 @@ static void disas_arm_insn(DisasContext *s, unsi=
gned int insn)
>              tcg_temp_free_i32(tmp2);
>              store_reg(s, rd, tmp);
>              break;
> +        case 0x6: /* ERET */
> +            if (op1 !=3D 3) {
> +                goto illegal_op;
> +            }
> +            if (!arm_dc_feature(s, ARM_FEATURE_V7VE)) {
> +                goto illegal_op;
> +            }
> +            if ((insn & 0x000fff0f) !=3D 0x0000000e) {
> +                /* UNPREDICTABLE; we choose to UNDEF */
> +                goto illegal_op;
> +            }
> +
> +            if (s->current_el =3D=3D 2) {
> +                tmp =3D load_cpu_field(elr_el[2]);
> +            } else {
> +                tmp =3D load_reg(s, 14);
> +            }
> +            gen_exception_return(s, tmp);
> +            break;
>          case 7:
>          {
>              int imm16 =3D extract32(insn, 0, 4) | (extract32(insn, 8, =
12) << 4);
> @@ -11144,8 +11163,16 @@ static void disas_thumb2_insn(DisasContext *s,=
 uint32_t insn)
>                          if (rn !=3D 14 || rd !=3D 15) {
>                              goto illegal_op;
>                          }
> -                        tmp =3D load_reg(s, rn);
> -                        tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
> +                        if (s->current_el =3D=3D 2) {
> +                            /* ERET from Hyp uses ELR_Hyp, not LR */
> +                            if (insn & 0xff) {
> +                                goto illegal_op;
> +                            }
> +                            tmp =3D load_cpu_field(elr_el[2]);
> +                        } else {
> +                            tmp =3D load_reg(s, rn);
> +                            tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
> +                        }
>                          gen_exception_return(s, tmp);
>                          break;
>                      case 6: /* MRS */
>=20


--8bBTLDRDhuvw6DUUpTF7zv0QgBn5cEvwW--

--oANo8G3AxHELt1pdVopR5dxkChviLCjS8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt1MYMACgkQd8knW3Qn
Tr7SpQ/8CHqZ+TQe90ZlRA1TH73UdRfQ87LJIOlLRo1eXHqr+e2IKwruiTSx1/pL
UP/itM4Ljb3BDWMznBfXA2sxGKfkCykaG7y5BS7NJ/wvswi5P7SvPTvPx6o9YYlv
iKS+ojLfx2sQU+qow7OEBgJ5kjMKMUId8m4gVhwos+8OKhlcGugJTOlY97HUMUtg
+Yh2a9bdnR+f+qHVOceD9oxVN9bGDIYXE+Jewt7v1xG1q4M3Fa7c7c8pprPRAu7q
6mhuu1dhw7w2UpTuEDhiJsoO4rcV+H/cndLnwez4Gm8yQL+RC0gQlr6/dNj9M6NJ
N1bsTMdc4NP4LYebYXD5exdS+m9WBSLZTI+vA3eDxZI60AMAOT+tWVpDNBE767mN
WA3iTk2daYsgWH2ItI9sjL7uA1L/wmF7S58tY6o7VwLM2tW2eOt4efhxKd6kxAYd
fJX/mthvnKP8NjVSW1C7D/32DV7gbE6SwTugj5wnf82IPirYvwlgjqhVv7SCYPQI
XSdb8Q6qnkC7vfc/P1tqNOvmbiJgPfwLJ7pPstHyqBaCoR29mW5TOmJPOF/JdGoh
RQ3ReWQVusG/7gbnPen54AETQMy11RVOB/vUm1ZamqZ6OqE+cn8kSnEbVf9XP3e3
3wxW6m0ASii8pJodhnr2dkm7fCoelWH/EZxqQCvMxjE2mKN6Q+c=
=Hzw6
-----END PGP SIGNATURE-----

--oANo8G3AxHELt1pdVopR5dxkChviLCjS8--
