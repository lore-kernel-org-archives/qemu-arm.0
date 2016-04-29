Received: by 10.25.208.137 with SMTP id h131csp879774lfg;
        Fri, 29 Apr 2016 07:00:35 -0700 (PDT)
X-Received: by 10.55.116.69 with SMTP id p66mr20237459qkc.129.1461938435291;
        Fri, 29 Apr 2016 07:00:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si1256676qkl.239.2016.04.29.07.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Apr 2016 07:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aw8xu-0005d0-Qz
	for alex.bennee@linaro.org; Fri, 29 Apr 2016 10:00:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aw8xl-0005UD-Jp
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 10:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aw8xZ-0003Ck-TT
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 10:00:04 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:22804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aw8xZ-00035x-Nb; Fri, 29 Apr 2016 09:59:57 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id E3FE66C183A0E;
	Fri, 29 Apr 2016 14:59:30 +0100 (IST)
Received: from [192.168.161.74] (192.168.161.74) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 29 Apr 2016 14:59:34 +0100
Message-ID: <572368BE.1010203@imgtec.com>
Date: Fri, 29 Apr 2016 14:59:26 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-3-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-3-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [192.168.161.74]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 2/9] softfloat: For Mips only,
 correct default NaN values
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WbtUwBM6/o1

On 18/04/16 17:03, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>=20
> Only for Mips platform, and only for cases when snan_bit_is_one is 0,
> correct default NaN values (in their 16-, 32-, and 64-bit flavors).
>=20
> For more info, see [1], page 84, Table 6.3 "Value Supplied When a New
> Quiet NaN Is Created", and [2], page 52, Table 3.7 "Default NaN
> Encodings".
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
>  fpu/softfloat-specialize.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
> index e03a529..093218f 100644
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
>          return const_float64(LIT64(0x7FF7FFFFFFFFFFFF));
>      } else {
> +#if defined(TARGET_MIPS)
> +        return const_float64(LIT64(0x7FF8000000000000));
> +#else
>          return const_float64(LIT64(0xFFF8000000000000));
> +#endif
>      }
>  #endif
>  }

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
