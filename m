Received: by 10.25.85.209 with SMTP id j200csp159334lfb;
        Fri, 10 Jun 2016 13:12:59 -0700 (PDT)
X-Received: by 10.55.215.214 with SMTP id t83mr3736155qkt.183.1465589579445;
        Fri, 10 Jun 2016 13:12:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30si7258210qgx.85.2016.06.10.13.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 13:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBSna-0008Nl-Qs
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 16:12:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bBSnO-0008Dm-EY
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 16:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bBSnH-0001VK-6X
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 16:12:45 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:53306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1bBSnH-0001Uo-0i; Fri, 10 Jun 2016 16:12:39 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id CFD17988001FF;
	Fri, 10 Jun 2016 21:12:31 +0100 (IST)
Received: from [10.20.78.140] (10.20.78.140) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Jun 2016 21:12:35 +0100
Date: Fri, 10 Jun 2016 21:12:12 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
In-Reply-To: <EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
Message-ID: <alpine.DEB.2.00.1606102045400.10382@tp.orcam.me.uk>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>,
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>,
	<alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.140]
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
X-TUID: wiyvoQ3vSlfz

On Fri, 10 Jun 2016, Aleksandar Markovic wrote:

> The changes that make QEMU behavior the same as hardware behavior (in 
> relation to CEIL, CVT, FLOOR, ROUND, TRUNC Mips instructions) are 
> already contained in this patch.

 Good, however that means that you've really combined two logically 
separate changes into a single patch:

1. A bug fix for SoftFloat legacy-NaN (original) MIPS support, which has 
   been there probably since forever (i.e. since the MIPS target was added 
   to QEMU).

2. A new feature for 2008-NaN MIPS support.

To me it really looks like the two need to be separate patches, with the 
bug fix applied first (or among any other bug fixes at the beginning) in 
the patch set, or even as a separate change marked as a prerequisite for 
the rest of the changes.

 The bug fix will then be self-contained and more prominently exposed, 
rather than being buried among feature additions.  It can then be 
independently reviewed and likely more easily accepted as long as it is 
technically correct.  It can also be cherry-picked and backported easily 
if necessary, perhaps outside the upstream tree.

 Review of the new feature set can then follow, once the bug(s) have been 
fixed.

> I just mentioned Mips-A / Mips-B / SoftFloat differences as an 
> explanation/observation related to the change in this patch.

 Maybe it's just myself, but from your description I got the impression 
that your change preserves the status quo and the explanation merely 
serves the purpose of documenting it.  Please consider rewriting it such 
that it is unambiguous that the SoftFloat bug is being fixed with your 
change.

 Obviously once you've made the bug fix a separate change, it'll become 
unambiguous naturally, as then you won't have the 2008-NaN feature along 
it obfuscating the picture.

  Maciej
