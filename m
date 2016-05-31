Received: by 10.25.27.66 with SMTP id b63csp2083526lfb;
        Tue, 31 May 2016 07:13:50 -0700 (PDT)
X-Received: by 10.55.163.200 with SMTP id m191mr3069583qke.175.1464704030571;
        Tue, 31 May 2016 07:13:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 79si31085296qhu.95.2016.05.31.07.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 07:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7kQX-0004Ux-VJ
	for alex.bennee@linaro.org; Tue, 31 May 2016 10:13:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b7kQO-0004Pa-N2
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b7kQI-00023E-Qb
	for qemu-arm@nongnu.org; Tue, 31 May 2016 10:13:40 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:56424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1b7kQI-00021F-KJ; Tue, 31 May 2016 10:13:34 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id A151B98A95755;
	Tue, 31 May 2016 15:13:25 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 31 May 2016 15:13:28 +0100
Date: Tue, 31 May 2016 15:13:14 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <20160531141313.GA30196@hhmipssw201.hh.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v6 8/9] target-mips: Add nan2008 flavor of
 <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
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
X-TUID: WxoKmcoX6zcj

On Mon, May 16, 2016 at 04:12:44PM +0200, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> New set of helpers for handling nan2008-syle versions of instructions
> <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>, for Mips R6.
> 
> All involved instructions have float operand and integer result. Their
> core functionality is implemented via invocations of appropriate SoftFloat
> functions. The problematic cases are when the operand is a NaN, and also
> when the operand (float) is out of the range of the result.
> 
> Here one can distinguish three cases:
> 
> CASE MIPS-A: (FCR31.NAN2008 == 1)
> 
>    1. Operand is a NaN, result should be 0;
>    2. Operand is larger than INT_MAX, result should be INT_MAX;
>    2. Operand is smaller than INT_MIN, result should be INT_MIN.
> 
> CASE MIPS-B: (FCR31.NAN2008 == 0)
> 
>    1. Operand is a NaN, result should be INT_MAX;
>    2. Operand is larger than INT_MAX, result should be INT_MAX;
>    2. Operand is smaller than INT_MIN, result should be INT_MAX.
> 
> CASE SOFTFLOAT:
> 
>    1. Operand is a NaN, result is INT_MAX;
>    2. Operand is larger than INT_MAX, result is INT_MAX;
>    2. Operand is smaller than INT_MIN, result is INT_MIN.
> 
> It is interesting that neither MIPS-A nor MIPS-B desired behaviors
> are in this sense identical to correspondent SoftFloat behavior.
> 
> Current implementation of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
> implements case MIPS-B. This patch relates to case MIPS-A. For case
> MIPS-A, only return value for NaN-operands should be corrected after
> appropriate SoftFloat library function is called.
> 
> Related MSA instructions FTRUNC_S and FTINT_S already handle well
> all cases, in the fashion similar to the code from this patch.
> 
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  target-mips/helper.h    |  18 +--
>  target-mips/op_helper.c | 369 +++++++++++++++++++++++++++++++++++++++++++++---
>  target-mips/translate.c | 122 +++++++++++++---
>  3 files changed, 461 insertions(+), 48 deletions(-)

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
