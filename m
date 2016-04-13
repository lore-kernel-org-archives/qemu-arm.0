Received: by 10.25.208.194 with SMTP id h185csp364275lfg;
        Wed, 13 Apr 2016 05:23:57 -0700 (PDT)
X-Received: by 10.140.234.151 with SMTP id f145mr11492029qhc.51.1460550237787;
        Wed, 13 Apr 2016 05:23:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si2014049qge.23.2016.04.13.05.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 05:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqJpt-0007NY-A5
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 08:23:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqJpU-0006qV-76
	for qemu-devel@nongnu.org; Wed, 13 Apr 2016 08:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqJpT-0001T5-8k
	for qemu-devel@nongnu.org; Wed, 13 Apr 2016 08:23:32 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:53528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aqJpO-0001Rv-Su; Wed, 13 Apr 2016 08:23:26 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 44D3BFFA23322;
	Wed, 13 Apr 2016 13:23:21 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 13 Apr 2016 13:23:24 +0100
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-3-git-send-email-aleksandar.markovic@rt-rk.com>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <570E3A3C.6050508@imgtec.com>
Date: Wed, 13 Apr 2016 13:23:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460465891-6142-3-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [192.168.169.37]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-devel] [PATCH v4 2/9] softfloat: For Mips only,
 correct default NaN values
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, edgar.iglesias@gmail.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R0KfKH9kQk0r

On 12/04/16 13:58, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>=20
> Only for Mips platform, and only for cases when snan_bit_is_one is 0,
> correct default NaN values (in their 16-, 32-, and 64-bit flavors).
>=20
> For more info, see [1], page 84, Table 6.3 "Value Supplied When
> a New Quiet NaN Is Created", and [2], page 52, table 3.7 "Default
> NaN Encodings".
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
>  fpu/softfloat-specialize.h |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
> index 53dae9b..169246e 100644
> --- a/fpu/softfloat-specialize.h
> +++ b/fpu/softfloat-specialize.h
> @@ -97,7 +97,11 @@ float16 float16_default_nan(float_status *status)
>      if (status->snan_bit_is_one) {
>          return const_float16(0x7DFF);
>      } else {
> +#if defined(TARGET_MIPS)
> +        return const_float16(0x7E00);
> +#else
>          return const_float16(0xFE00);
> +#endif
>      }
>  #endif
>  }
> @@ -116,7 +120,11 @@ float32 float32_default_nan(float_status *status)
>      if (status->snan_bit_is_one) {
>          return const_float32(0x7FBFFFFF);
>      } else {
> +#if defined(TARGET_MIPS)
> +        return const_float32(0x7FC00000);
> +#else
>          return const_float32(0xFFC00000);
> +#endif
>      }
>  #endif
>  }
> @@ -135,7 +143,11 @@ float64 float64_default_nan(float_status *status)
>      if (status->snan_bit_is_one) {
>          return const_float64(LIT64( 0x7FF7FFFFFFFFFFFF ));
>      } else {
> +#if defined(TARGET_MIPS)
> +        return const_float64(LIT64( 0x7FF8000000000000 ));

Could you remove space after/before the parentheses, please? The
scripts/checkpatch.pl would complain here. Otherwise looks good to me.

Thanks,
Leon

> +#else
>          return const_float64(LIT64( 0xFFF8000000000000 ));
> +#endif
>      }
>  #endif
>  }
>=20

