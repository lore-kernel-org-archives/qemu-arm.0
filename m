Received: by 10.25.21.96 with SMTP id l93csp155091lfi;
        Tue, 14 Jun 2016 09:15:59 -0700 (PDT)
X-Received: by 10.140.233.4 with SMTP id e4mr20822469qhc.90.1465920959631;
        Tue, 14 Jun 2016 09:15:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2si18873208qkc.42.2016.06.14.09.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 09:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCr0Q-0005Zh-QB
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 12:15:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bCqJS-0004XV-4Y
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 11:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bCqJN-0004m9-5M
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 11:31:33 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:31748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1bCqJM-0004lv-VF; Tue, 14 Jun 2016 11:31:29 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 90824C9522447;
	Tue, 14 Jun 2016 16:31:21 +0100 (IST)
Received: from [10.20.78.165] (10.20.78.165) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Jun 2016 16:31:23 +0100
Date: Tue, 14 Jun 2016 16:30:55 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Leon Alrae <leon.alrae@imgtec.com>
In-Reply-To: <20160614141753.GD13260@hhmipssw201.hh.imgtec.org>
Message-ID: <alpine.DEB.2.00.1606141629380.7182@tp.orcam.me.uk>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606102045400.10382@tp.orcam.me.uk>
	<20160614141753.GD13260@hhmipssw201.hh.imgtec.org>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.165]
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"agraf@suse.de" <agraf@suse.de>,
	Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHbHy2OVUyoB

On Tue, 14 Jun 2016, Leon Alrae wrote:

> > 1. A bug fix for SoftFloat legacy-NaN (original) MIPS support, which has 
> >    been there probably since forever (i.e. since the MIPS target was added 
> >    to QEMU).
> 
> I've just done another round of review and as far as I can tell these
> patches don't modify the legacy-NaN MIPS behaviour. I believe Aleksandar
> was referring to new functionality (i.e. 2008 NaN) only.

 Well, if there's a bug, then it needs to be fixed rather than documented.

  Maciej
