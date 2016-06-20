Received: by 10.25.21.96 with SMTP id l93csp1488558lfi;
        Mon, 20 Jun 2016 07:55:12 -0700 (PDT)
X-Received: by 10.55.71.138 with SMTP id u132mr22661947qka.1.1466434512792;
        Mon, 20 Jun 2016 07:55:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si48117991qkm.83.2016.06.20.07.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 07:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF0bY-0002sx-7Y
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 10:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bF0Ng-0003TW-SE
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 10:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bF0Nd-0005UR-6g
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 10:40:51 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:62564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1bF0Nd-0005Tl-03; Mon, 20 Jun 2016 10:40:49 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 3940F75CDB774;
	Mon, 20 Jun 2016 15:40:41 +0100 (IST)
Received: from [10.20.78.204] (10.20.78.204) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Jun 2016 15:40:43 +0100
Date: Mon, 20 Jun 2016 15:40:25 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
In-Reply-To: <EF5FA6C3467F85449672C3E735957B85916C0A4C@BADAG02.ba.imgtec.org>
Message-ID: <alpine.DEB.2.00.1606201528270.7182@tp.orcam.me.uk>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606102045400.10382@tp.orcam.me.uk>
	<20160614141753.GD13260@hhmipssw201.hh.imgtec.org>,
	<alpine.DEB.2.00.1606141629380.7182@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916C0A4C@BADAG02.ba.imgtec.org>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.204]
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
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5q40BYdSsKk

On Mon, 20 Jun 2016, Aleksandar Markovic wrote:

> This patch is about NaN-2008 flavor of Mips instructions CEIL, CVT, 
> FLOOR, ROUND, TRUNC only (its title is "Add nan2008 flavor...").
> 
> Legacy-NaN flavors of the same Mips instructions already operate 
> correctly, and there is nothing to be fixed.
> 
> The commit message is not description of another bug, it explains the 
> context of the change, and the content of added code segments.

 Well, if the matter does not affect MIPS emulation, then why do you think 
there's a need to mention it in the first place?

 I don't think stating what other emulation targets do in a commit 
description for a platform feature adds any value, but I think it bears 
the risk to confuse people examining code history.  Your description has 
to be meaningful for someone reading it say 10 years on from now who does 
not necessarily know the context nor has any of us available to ask.  
Please consider this.

 If you do think this mention adds value, then please make it unambiguous 
in the commit description that the third conversion variant applies to 
non-MIPS targets only.  It wasn't to me at all or I wouldn't have spoken 
out.

 Thank you.

  Maciej
