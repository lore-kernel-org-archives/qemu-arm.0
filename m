Received: by 10.25.208.194 with SMTP id h185csp377309lfg;
        Wed, 13 Apr 2016 05:48:08 -0700 (PDT)
X-Received: by 10.55.39.149 with SMTP id n143mr10849370qkn.55.1460551688621;
        Wed, 13 Apr 2016 05:48:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66si16695087qkh.63.2016.04.13.05.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 05:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqKDI-0004Fu-5c
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 08:48:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqKDF-0004DG-VD
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 08:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqKDA-0008ES-VN
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 08:48:05 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:16010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aqKDA-0008EG-Q5; Wed, 13 Apr 2016 08:48:00 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 893491AE200F9;
	Wed, 13 Apr 2016 13:47:55 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 13 Apr 2016 13:47:58 +0100
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-4-git-send-email-aleksandar.markovic@rt-rk.com>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <570E3FFE.6090701@imgtec.com>
Date: Wed, 13 Apr 2016 13:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460465891-6142-4-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [192.168.169.37]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v4 3/9] softfloat: For Mips only,
 correct order in pickNaNMulAdd()
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9Dzq2P3D0bC

On 12/04/16 13:58, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>=20
> Only for Mips platform, and only for cases when snan_bit_is_one is 0,
> correct the order of argument comparisons in pickNaNMulAdd().
>=20
> For more info, see [2], page 53, section "3.5.3 NaN Propagation".
>=20
> [1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
>     The MIPS64=C2=AE Instruction Set Reference Manual",
>     Imagination Technologies LTD, Revision 6.04, November 13, 2015
>=20
> [2] "MIPS Architecture for Programmers Volume IV-j:
>     The MIPS32=C2=AE SIMD Architecture Module",
>     Imagination Technologies LTD, Revision 1.12, February 3, 2016
>=20
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  fpu/softfloat-specialize.h |   41 +++++++++++++++++++++++++++++-------=
-----
>  1 file changed, 29 insertions(+), 12 deletions(-)
>=20
> diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
> index 169246e..807ecc0 100644
> --- a/fpu/softfloat-specialize.h
> +++ b/fpu/softfloat-specialize.h
> @@ -569,19 +569,36 @@ static int pickNaNMulAdd(flag aIsQNaN, flag aIsSN=
aN, flag bIsQNaN, flag bIsSNaN,
>          return 3;
>      }
> =20
> -    /* Prefer sNaN over qNaN, in the c, a, b order. */
> -    if (cIsSNaN) {
> -        return 2;
> -    } else if (aIsSNaN) {
> -        return 0;
> -    } else if (bIsSNaN) {
> -        return 1;
> -    } else if (cIsQNaN) {
> -        return 2;
> -    } else if (aIsQNaN) {
> -        return 0;

Initially I was confused with this part of diff until I realized that
you had modified the original order in pickNaNMulAdd in patch #1 -- was
that intended?

Otherwise:

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>

> +    if (status->snan_bit_is_one) {
> +        /* Prefer sNaN over qNaN, in the a, b, c order. */
> +        if (aIsSNaN) {
> +            return 0;
> +        } else if (bIsSNaN) {
> +            return 1;
> +        } else if (cIsSNaN) {
> +            return 2;
> +        } else if (aIsQNaN) {
> +            return 0;
> +        } else if (bIsQNaN) {
> +            return 1;
> +        } else {
> +            return 2;
> +        }
>      } else {
> -        return 1;
> +        /* Prefer sNaN over qNaN, in the c, a, b order. */
> +        if (cIsSNaN) {
> +            return 2;
> +        } else if (aIsSNaN) {
> +            return 0;
> +        } else if (bIsSNaN) {
> +            return 1;
> +        } else if (cIsQNaN) {
> +            return 2;
> +        } else if (aIsQNaN) {
> +            return 0;
> +        } else {
> +            return 1;
> +        }
>      }
>  }
>  #elif defined(TARGET_PPC)
>=20

