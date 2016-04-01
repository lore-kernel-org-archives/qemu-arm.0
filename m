Received: by 10.25.208.211 with SMTP id h202csp885098lfg;
        Fri, 1 Apr 2016 12:08:44 -0700 (PDT)
X-Received: by 10.140.89.178 with SMTP id v47mr12853388qgd.11.1459537724489;
        Fri, 01 Apr 2016 12:08:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17si13190932qhc.119.2016.04.01.12.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Apr 2016 12:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1am4R1-0006S1-7S
	for alex.bennee@linaro.org; Fri, 01 Apr 2016 15:08:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1am4QT-0005fq-3l
	for qemu-devel@nongnu.org; Fri, 01 Apr 2016 15:08:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1am4QS-0005zW-8C
	for qemu-devel@nongnu.org; Fri, 01 Apr 2016 15:08:09 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:42630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1am4QN-0005xh-4B; Fri, 01 Apr 2016 15:08:03 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email Security Gateway with ESMTPS id 3A9E3F6004773;
	Fri,  1 Apr 2016 20:07:58 +0100 (IST)
Received: from [192.168.169.37] (192.168.169.37) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 1 Apr 2016 20:07:59 +0100
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>
From: Leon Alrae <leon.alrae@imgtec.com>
Message-ID: <56FEC6F0.9000803@imgtec.com>
Date: Fri, 1 Apr 2016 20:07:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [Qemu-devel] [PATCH 2/2] target-mips: Implement IEEE 754-2008
 functionality for R6 and MSA instructions
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
X-TUID: HdkGYiA2Pi0A

On 25/03/16 12:50, Aleksandar Markovic wrote:
> +#define MSA_CLASS_SIGNALING_NAN      0x001
> +#define MSA_CLASS_QUIET_NAN          0x002
> +#define MSA_CLASS_NEGATIVE_INFINITY  0x004
> +#define MSA_CLASS_NEGATIVE_NORMAL    0x008
> +#define MSA_CLASS_NEGATIVE_SUBNORMAL 0x010
> +#define MSA_CLASS_NEGATIVE_ZERO      0x020
> +#define MSA_CLASS_POSITIVE_INFINITY  0x040
> +#define MSA_CLASS_POSITIVE_NORMAL    0x080
> +#define MSA_CLASS_POSITIVE_SUBNORMAL 0x100
> +#define MSA_CLASS_POSITIVE_ZERO      0x200
> +
> +#define MSA_CLASS(name, bits)                                        \
> +uint ## bits ## _t helper_msa_ ## name (CPUMIPSState *env,           \
> +                                        uint ## bits ## _t arg)      \
> +{                                                                    \
> +    if (float ## bits ## _is_signaling_nan(arg,                      \
> +                &env->active_tc.msa_fp_status)) {                    \
> +        return MSA_CLASS_SIGNALING_NAN;                              \
> +    } else if (float ## bits ## _is_quiet_nan(arg,                   \
> +                    &env->active_tc.msa_fp_status)) {                \
> +        return MSA_CLASS_QUIET_NAN;                                  \
> +    } else if (float ## bits ## _is_neg(arg)) {                      \
> +        if (float ## bits ## _is_infinity(arg)) {                    \
> +            return MSA_CLASS_NEGATIVE_INFINITY;                      \
> +        } else if (float ## bits ## _is_zero(arg)) {                 \
> +            return MSA_CLASS_NEGATIVE_ZERO;                          \
> +        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
> +            return MSA_CLASS_NEGATIVE_SUBNORMAL;                     \
> +        } else {                                                     \
> +            return MSA_CLASS_NEGATIVE_NORMAL;                        \
> +        }                                                            \
> +    } else {                                                         \
> +        if (float ## bits ## _is_infinity(arg)) {                    \
> +            return MSA_CLASS_POSITIVE_INFINITY;                      \
> +        } else if (float ## bits ## _is_zero(arg)) {                 \
> +            return MSA_CLASS_POSITIVE_ZERO;                          \
> +        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
> +            return MSA_CLASS_POSITIVE_SUBNORMAL;                     \
> +        } else {                                                     \
> +            return MSA_CLASS_POSITIVE_NORMAL;                        \
> +        }                                                            \
> +    }                                                                \
> +}

Duplicating the class operation is unnecessary. We can just have common
function for FPU and MSA which takes additional float_status argument.

Also I noticed that this patch series doesn't provide Flush Subnormals
(the FCSR.FS bit), but probably this functionality can come later...

Leon
