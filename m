Received: by 10.25.208.194 with SMTP id h185csp412996lfg;
        Wed, 13 Apr 2016 06:54:14 -0700 (PDT)
X-Received: by 10.140.221.9 with SMTP id r9mr11958963qhb.77.1460555654333;
        Wed, 13 Apr 2016 06:54:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si410331qkj.75.2016.04.13.06.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 06:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqLFF-0006sc-Ua
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 09:54:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1aqLFD-0006pK-GE
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 09:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1aqLF7-0004jJ-Dz
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 09:54:11 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:31724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1aqLF7-0004ii-7f; Wed, 13 Apr 2016 09:54:05 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 28BE23112F378;
	Wed, 13 Apr 2016 14:53:58 +0100 (IST)
Received: from BADAG04.ba.imgtec.org (10.20.40.112) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 13 Apr 2016 14:54:01 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG04.ba.imgtec.org ([fe80::b930:4082:95b0:e446%15]) with mapi id
	14.03.0266.001; Wed, 13 Apr 2016 06:53:57 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Leon Alrae <Leon.Alrae@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v4 3/9] softfloat: For Mips only, correct order in
	pickNaNMulAdd()
Thread-Index: AQHRlLr/+O/TvRltLESdQz0XZM755J+IUUwA//+bpUE=
Date: Wed, 13 Apr 2016 13:53:56 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B8591692997@BADAG02.ba.imgtec.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-4-git-send-email-aleksandar.markovic@rt-rk.com>,
	<570E3FFE.6090701@imgtec.com>
In-Reply-To: <570E3FFE.6090701@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/hVfUcXkd86

Thanks, you are right, this area is changed in patch #1 too. However, it wa=
s not intended to be that way. Patch #1 should leave this function as-is, a=
nd the entire change for this function should be in this patch. I will orga=
nize the code as intended in the next version of the series. Yours, Aleksan=
dar
________________________________________
From: Leon Alrae
Sent: Wednesday, April 13, 2016 5:47 AM
To: Aleksandar Markovic; qemu-devel@nongnu.org
Cc: proljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.cave-ayland@ilan=
de.co.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gmail.com; Aleksand=
ar Markovic; qemu-arm@nongnu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbo=
nzini@redhat.com; Miodrag Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu=
.cn; afaerber@suse.de; aurelien@aurel32.net; rth@twiddle.net; Maciej Rozyck=
i
Subject: Re: [PATCH v4 3/9] softfloat: For Mips only, correct order in pick=
NaNMulAdd()

On 12/04/16 13:58, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>
> Only for Mips platform, and only for cases when snan_bit_is_one is 0,
> correct the order of argument comparisons in pickNaNMulAdd().
>
> For more info, see [2], page 53, section "3.5.3 NaN Propagation".
>
> [1] "MIPS=AE Architecture For Programmers Volume II-A:
>     The MIPS64=AE Instruction Set Reference Manual",
>     Imagination Technologies LTD, Revision 6.04, November 13, 2015
>
> [2] "MIPS Architecture for Programmers Volume IV-j:
>     The MIPS32=AE SIMD Architecture Module",
>     Imagination Technologies LTD, Revision 1.12, February 3, 2016
>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  fpu/softfloat-specialize.h |   41 +++++++++++++++++++++++++++++---------=
---
>  1 file changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
> index 169246e..807ecc0 100644
> --- a/fpu/softfloat-specialize.h
> +++ b/fpu/softfloat-specialize.h
> @@ -569,19 +569,36 @@ static int pickNaNMulAdd(flag aIsQNaN, flag aIsSNaN=
, flag bIsQNaN, flag bIsSNaN,
>          return 3;
>      }
>
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
>
