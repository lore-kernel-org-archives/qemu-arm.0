Received: by 10.28.71.27 with SMTP id u27csp3696469wma;
        Tue, 6 Feb 2018 04:03:00 -0800 (PST)
X-Google-Smtp-Source: AH8x227MJuCfrSkBekAYbgEQ6UKfWjvj0zrMmUQiv0ekgAjRBT1UoTczWqvT/ZVVd2cOA6WpwDA+
X-Received: by 10.37.65.9 with SMTP id o9mr1162822yba.483.1517918579985;
        Tue, 06 Feb 2018 04:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517918579; cv=none;
        d=google.com; s=arc-20160816;
        b=0MlCExELRWzW/FR/yIVmIFqJCRnkFwi2jZPyDpU9RGT75IrsDwXx8U6klzSpjd811L
         L8Vw33K8xkePaxQSNNYOn/GsTsx3yz6Ge+R1E1kZrStKGZWYzr+rY5zqC9MQvLour2U5
         BR3MllNyFTH1Hfr1mLxr5jrr3CRDHJU8Y8ruvjOcWSm5NfIodDeruMCPxCR6CAaOAJTR
         C7f1LFR4Ii4zFCE0vFAthBQb3Fc18zAiamReWqch8aqsHMsYeyi0bUV6yrAvjsf6yc8v
         827hS3cAkgG77z4hrdVHOy9AYHhhmRrVuvfbBpaqrtR1NWgQAT8mB8lmAGTOOJBLy4hj
         ntDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=0I/JOKgFRaP6Cp1V9VrCi9I6qZBEfCpYQfBuyTJKLJE=;
        b=Bx/vHcWERaB1MYgRfQD//8Abi0W2mdXw2EJeBl7HbKTB4qRxFtRDx/Y9lJ7iFbdXAy
         lKXj3iJmKl+E2RPSgblbOij/WChHp9taQmQWKmvX28600Wzv00WbqkgLf/K9OabBLpSq
         Qqae4SkMw9ZK22GhgLw2MjlQNcRZYwXSNd+aQ+xi21gG1cV7sIbzIqwQge7GzBVDt9z1
         S4u21rIkifjSZNNtfkYaV4Bdrq5V8DUxg0OjR+v3xqg4cg2MXzNYrfoU0YmRJ2dxBtbp
         55MlGYCzwy/rhh5NvxLegVv6Lf8AR4ZM94rhj27d2DSPwI6OHFhIMSFpso62tJgrtthw
         809Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=WwvNNhpS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si1833971ybe.492.2018.02.06.04.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 04:02:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=WwvNNhpS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej1xj-0006mS-GI
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 07:02:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej1wO-00069t-O2
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 07:01:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej1wF-0001mQ-5B
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 07:01:36 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej1wF-0001mD-0W; Tue, 06 Feb 2018 07:01:27 -0500
Received: by mail-qk0-x241.google.com with SMTP id c82so1916519qka.0;
	Tue, 06 Feb 2018 04:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ycY6RLQuhQg8ZZmk8jjvwQKlOFa9WccLXkExcblZeS8=;
	b=WwvNNhpStVuVAj1CAYcKno/jebT9bYYlGlh5QkAfrrRN5oezMMQFqp3hiKhpud6t+7
	6JeDxgA0SAjbIGn6+HP68AOwdn47uhXuAeDGCPlEj84zYAyJbFaoIzloYfhFnA502tj8
	LQh/x7AvVkegN8/vblAgssIxPW7sZtOljJcmtoxi/j1RvXCmBGVyeFChF2hIn5hDEDOn
	6p125Fc44/NqYf1kTrV8ZWNXKQ7mcBlemLa8BpBwWTqwFS2O94ZPz5VsuQ4pISj5VS2Q
	riHUhhBFZVUn7cwL7oBTqIThmETnHBvN0wfA3TscXH2YVLEmp0WxpjwLr9r5BAm0MwG3
	/iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=ycY6RLQuhQg8ZZmk8jjvwQKlOFa9WccLXkExcblZeS8=;
	b=JRinGD9JAM1su3O16MsQOS8dsNWNVnT05oR4ZaO37/cK6MMowk/PKilCm4aUAc2Ir8
	m7A+7WvnULC2UaKyXw2sSnv5K3d8AoZgVWg6YpSHKHYrqvVlBKqxS4ayxP5+wLrvZM6U
	DHzvYbBAasCCzdiUjlrkDCuaTQQSEt1DvL03gSqQsYYay918SJRtXEUaIORid09f7dTs
	AAVUF/oXMT2XUsx3/lnTdGfwKonTEa8dhPF2xM9jEXaGdePI4xapwjHLyzNLpVryHT1M
	yPUk90913b4zZ75sDAZgPSrPUTOyaghIWAYb1Wf+4O8t6s6R53dxWFAXVcwqZ6EwnUId
	rilw==
X-Gm-Message-State: APf1xPDkMK5eTYV3cG4xLH81oxsYNiqJT2EbMu6s0hSwobEEfEy0fU/B
	l4jIXql3QJ7czDqDz2eQcdU=
X-Received: by 10.55.141.198 with SMTP id p189mr2712175qkd.65.1517918486300;
	Tue, 06 Feb 2018 04:01:26 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	n11sm7168261qkn.18.2018.02.06.04.01.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 04:01:25 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180206103941.13985-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f299cc78-6d7c-f66b-6662-e1498559ef21@amsat.org>
Date: Tue, 6 Feb 2018 09:01:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180206103941.13985-1-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="mA3i7GS5yF3BbUkLiRFvAc7CoLhUGrong"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] target/arm/translate.c: Fix
 missing 'break' for TT insns
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nLqsK2md05+Q

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mA3i7GS5yF3BbUkLiRFvAc7CoLhUGrong
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <f299cc78-6d7c-f66b-6662-e1498559ef21@amsat.org>
Subject: Re: [Qemu-arm] [PATCH] target/arm/translate.c: Fix missing 'break'
 for TT insns
References: <20180206103941.13985-1-peter.maydell@linaro.org>
In-Reply-To: <20180206103941.13985-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/06/2018 07:39 AM, Peter Maydell wrote:
> The code where we added the TT instruction was accidentally

"In 5158de241b0 ..."

> missing a 'break', which meant that after generating the code
> to execute the TT we would fall through to 'goto illegal_op'
> and generate code to take an UNDEF insn.>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
> Doh...
>=20
>  target/arm/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 55826b7e5a..572c4d1cb6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9926,6 +9926,7 @@ static void disas_thumb2_insn(DisasContext *s, ui=
nt32_t insn)
>                          tcg_temp_free_i32(addr);
>                          tcg_temp_free_i32(op);
>                          store_reg(s, rd, ttresp);
> +                        break;
>                      }
>                      goto illegal_op;
>                  }
>=20


--mA3i7GS5yF3BbUkLiRFvAc7CoLhUGrong
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp5mQ8ACgkQ4+MsLN6t
wN4aiBAAvWauOIxILXDXXVjX7VcRTb4/zxGy0gNbzGKUc1xhollp2g+2P7Jeq0qo
svpwPajSeeu4Bd98TcC7lFi1GVBe3l0krZTeIFbW58kgi/VahMyBXATAQJwsu9Ac
96XuMdH8l42XMfQ83KIyGgku+J2lQ270XPTqCRVw49X667kuXIlgolKWauuLJ2cf
7Aw9/kkZjG5/QHzF2Lst+OzbnLSEd5z1rfKdx6usTTLlHGBSxTCcRXAfbNSrNJ2Y
XO/AP7PzfhA+Xtl7+JIyNW11yUJwCMcSYbz2qS4X9PfuNE8FPaZnM+chGNoccZFs
B2Zbg5o3ykq/KTqqdplqM+R9q2AyhTzsU2Xy39QtiDfHopNXI5goE5I4L7rJXPiT
6gIQXrpZ70csIO9mX4h8y5HM1v/Bq8XO+EDXIkWPgcQvsH74j1FIKs595oyP4b9a
MC7cSeAuBFzB9OkupmX8zGbEReuIZQwsvrAkXy+8So7aMnXQZKKrMmcAje7VpXbW
sRiiynPoH44w04tlNtqhCAjKGP/nXaJagTpR7IqnvcRrzsewcWJgZ/MmqopNWrC7
X5a76Kcq3bLjYD1yD66wXx4J8NOYpnYLyYu9zA7x+ddcHi+akn90ywp6yuzZMnRr
vpx/voO7pOADgUcNILvRVbybPZeJBR0J6VMkK+MKzfFLBm17eYU=
=AbIQ
-----END PGP SIGNATURE-----

--mA3i7GS5yF3BbUkLiRFvAc7CoLhUGrong--
