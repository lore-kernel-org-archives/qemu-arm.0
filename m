Received: by 10.25.208.194 with SMTP id h185csp937885lfg;
        Mon, 25 Apr 2016 07:06:37 -0700 (PDT)
X-Received: by 10.55.151.199 with SMTP id z190mr17924383qkd.172.1461593197334;
        Mon, 25 Apr 2016 07:06:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si3140260qge.108.2016.04.25.07.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 07:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auh9n-0007Ob-Bq
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 10:06:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1auh9l-0007LR-37
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 10:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1auh9f-0008Go-AX
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 10:06:33 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:17081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1auh9f-0008GK-5K; Mon, 25 Apr 2016 10:06:27 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 5C0BB29316250;
	Mon, 25 Apr 2016 15:06:20 +0100 (IST)
Received: from [10.20.78.64] (10.20.78.64) by hhmail02.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.266.1;
	Mon, 25 Apr 2016 15:06:22 +0100
Date: Mon, 25 Apr 2016 15:06:07 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>
Message-ID: <alpine.DEB.2.00.1604241428540.21846@tp.orcam.me.uk>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.64]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 5/9] target-mips: Activate IEEE 274-2008
 signaling NaN bit meaning
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
X-TUID: tpLDPZDMhWkl

On Mon, 18 Apr 2016, Aleksandar Markovic wrote:

> Functions mips_cpu_reset() and msa_reset() are updated so that flag
> snan_bit_is_one is properly set for any Mips FPU/MSA configuration.
> For main FPUs, CPUs with FCR31's FCR31_NAN2008 bit set will invoke
> set_snan_bit_is_one(0). For MSA, as it is IEEE 274-2008 compliant
> from it inception, set_snan_bit_is_one(0) will always be invoked.

 I have skimmed over the series -- have you lost MIPSr3 support (writable 
FCSR ABS2008 and NAN2008 bits) in porting?

  Maciej
