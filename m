Received: by 10.25.208.211 with SMTP id h202csp882694lfg;
        Fri, 1 Apr 2016 12:04:00 -0700 (PDT)
X-Received: by 10.140.18.114 with SMTP id 105mr26581624qge.41.1459537440577;
        Fri, 01 Apr 2016 12:04:00 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g91si13249569qge.28.2016.04.01.12.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Apr 2016 12:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1am4MS-0001Zl-5B
	for alex.bennee@linaro.org; Fri, 01 Apr 2016 15:04:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1am4M6-0001GJ-By
	for qemu-devel@nongnu.org; Fri, 01 Apr 2016 15:03:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1am4M5-0004pw-Is
	for qemu-devel@nongnu.org; Fri, 01 Apr 2016 15:03:38 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:45549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1am4Lx-0004oU-Js; Fri, 01 Apr 2016 15:03:29 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email Security Gateway with ESMTPS id BE9F6798D1E6D;
	Fri,  1 Apr 2016 20:03:22 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 1 Apr 2016 20:03:24 +0100
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <56FEC5D1.8020908@imgtec.com>
Date: Fri, 1 Apr 2016 20:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.169.37]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, proljc@gmail.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	kbastian@mail.uni-paderborn.de, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	miodrag.dinic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, edgar.iglesias@gmail.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gaAwWj1rG/e6

On 25/03/16 12:50, Aleksandar Markovic wrote:
>  /*----------------------------------------------------------------------------
>  | The pattern for a default generated single-precision NaN.
>  *----------------------------------------------------------------------------*/
> +float32 float32_default_nan(float_status *status) {
>  #if defined(TARGET_SPARC)
> -const float32 float32_default_nan = const_float32(0x7FFFFFFF);
> +    return const_float32(0x7FFFFFFF);
>  #elif defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_ALPHA) || \
>        defined(TARGET_XTENSA) || defined(TARGET_S390X) || defined(TARGET_TRICORE)
> -const float32 float32_default_nan = const_float32(0x7FC00000);
> -#elif SNAN_BIT_IS_ONE
> -const float32 float32_default_nan = const_float32(0x7FBFFFFF);
> +    return const_float32(0x7FC00000);
>  #else
> -const float32 float32_default_nan = const_float32(0xFFC00000);
> +    if (status->snan_bit_is_one)
> +        return const_float32(0x7FBFFFFF);
> +    else
> +        return const_float32(0xFFC00000);

Here for MIPS (when FCR31.NAN2008 is set) we should generate 0x7FC00000
for single-precision. Reference:
"MIPS Architecture For Programmers, Volume I-A: Introduction to the
MIPS64 Architecture", Imagination Technologies LTD., Document Number:
MD00083, Revision 6.01, August 20, 2014, Table 6.3 "Value Supplied When
a New Quiet NaN Is Created", p. 84

Also, for double-precision we should generate 0x7FF8000000000000.

Thanks,
Leon
