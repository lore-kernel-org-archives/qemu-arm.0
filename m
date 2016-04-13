Received: by 10.25.208.194 with SMTP id h185csp357086lfg;
        Wed, 13 Apr 2016 05:11:35 -0700 (PDT)
X-Received: by 10.140.204.214 with SMTP id z205mr1499458qha.99.1460549495578;
        Wed, 13 Apr 2016 05:11:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si17826225qkw.54.2016.04.13.05.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 05:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqJdu-000118-VE
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 08:11:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqJds-0000us-OO
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 08:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqJdp-00070w-G1
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 08:11:32 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:22468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aqJdp-00070F-9V; Wed, 13 Apr 2016 08:11:29 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 1AEAD4516D124;
	Wed, 13 Apr 2016 13:11:20 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 13 Apr 2016 13:11:23 +0100
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <570E3755.4060608@imgtec.com>
Date: Wed, 13 Apr 2016 13:11:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.169.37]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v4 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
X-TUID: QPKjIZTGR1nn

On 12/04/16 13:58, Aleksandar Markovic wrote:
> @@ -322,14 +327,14 @@ int float32_is_quiet_nan( float32 a_ )
>  | NaN; otherwise returns 0.
>  *----------------------------------------------------------------------------*/
>  
> -int float32_is_signaling_nan( float32 a_ )
> +int float32_is_signaling_nan( float32 a_, float_status *status )
>  {
>      uint32_t a = float32_val(a_);
> -#if SNAN_BIT_IS_ONE
> -    return ((uint32_t)(a << 1) >= 0xff800000);
> -#else
> -    return ( ( ( a>>22 ) & 0x1FF ) == 0x1FE ) && ( a & 0x003FFFFF );
> -#endif
> +    if (status->snan_bit_is_one) {
> +        return ((uint32_t)(a << 1) >= 0xff800000);
> +    } else {
> +        return ( ( ( a>>22 ) & 0x1FF ) == 0x1FE ) && ( a & 0x003FFFFF );
> +    }

Please correct the style while touching the lines.

Thanks,
Leon

