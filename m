Received: by 10.25.27.66 with SMTP id b63csp1963724lfb;
        Tue, 7 Jun 2016 04:55:37 -0700 (PDT)
X-Received: by 10.140.234.4 with SMTP id f4mr20506190qhc.65.1465300537076;
        Tue, 07 Jun 2016 04:55:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v128si13815478qki.61.2016.06.07.04.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 04:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAFbc-0004jV-Ed
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 07:55:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bAFMS-00026v-EM
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 07:39:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bAFMM-000201-BU
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 07:39:55 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:56941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1bAFMM-0001z0-4r; Tue, 07 Jun 2016 07:39:50 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 4AC12E0C4A5D3;
	Tue,  7 Jun 2016 12:39:43 +0100 (IST)
Received: from [10.20.78.123] (10.20.78.123) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.294.0; Tue, 7 Jun 2016
	12:39:44 +0100
Date: Tue, 7 Jun 2016 12:39:29 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
In-Reply-To: <1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
Message-ID: <alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.123]
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
	qemu-devel@nongnu.org, blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, Leon Alrae <leon.alrae@imgtec.com>,
	afaerber@suse.de, Aurelien Jarno <aurelien@aurel32.net>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y6GI2WdUuqpV

On Mon, 16 May 2016, Aleksandar Markovic wrote:

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

 A bug in SoftFloat probably -- it has only been fixed quite recently to 
handle all MIPS architecture's peculiarites correctly and this case must 
have been missed then, making data produced not necessarily identical 
between the legacy-NaN hard-float and the soft-float ABIs, even though 
intent has been for it to be.

 FAOD, you refer to SoftFloat in the most recent version of GCC, do you?

  Maciej
