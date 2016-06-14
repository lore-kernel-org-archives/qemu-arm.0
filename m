Received: by 10.25.21.96 with SMTP id l93csp121686lfi;
        Tue, 14 Jun 2016 07:58:54 -0700 (PDT)
X-Received: by 10.55.197.82 with SMTP id p79mr21128790qki.138.1465916334215;
        Tue, 14 Jun 2016 07:58:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si18612510qke.117.2016.06.14.07.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 07:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCpnp-0005hs-Hs
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 10:58:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bCpAI-0006tf-5W
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 10:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bCpAC-0000Sp-VP
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 10:18:02 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:63201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1bCpAC-0000Sj-Pp; Tue, 14 Jun 2016 10:17:56 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 917C63CF77FAB;
	Tue, 14 Jun 2016 15:17:51 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 14 Jun 2016 15:17:54 +0100
Date: Tue, 14 Jun 2016 15:17:53 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Message-ID: <20160614141753.GD13260@hhmipssw201.hh.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606102045400.10382@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1606102045400.10382@tp.orcam.me.uk>
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
X-TUID: bAFOzBVNwl5v

On Fri, Jun 10, 2016 at 09:12:12PM +0100, Maciej W. Rozycki wrote:
> On Fri, 10 Jun 2016, Aleksandar Markovic wrote:
> 
> > The changes that make QEMU behavior the same as hardware behavior (in 
> > relation to CEIL, CVT, FLOOR, ROUND, TRUNC Mips instructions) are 
> > already contained in this patch.
> 
>  Good, however that means that you've really combined two logically 
> separate changes into a single patch:
> 
> 1. A bug fix for SoftFloat legacy-NaN (original) MIPS support, which has 
>    been there probably since forever (i.e. since the MIPS target was added 
>    to QEMU).

I've just done another round of review and as far as I can tell these
patches don't modify the legacy-NaN MIPS behaviour. I believe Aleksandar
was referring to new functionality (i.e. 2008 NaN) only.

Regards,
Leon

> 
> 2. A new feature for 2008-NaN MIPS support.
> 
> To me it really looks like the two need to be separate patches, with the 
> bug fix applied first (or among any other bug fixes at the beginning) in 
> the patch set, or even as a separate change marked as a prerequisite for 
> the rest of the changes.
> 
>  The bug fix will then be self-contained and more prominently exposed, 
> rather than being buried among feature additions.  It can then be 
> independently reviewed and likely more easily accepted as long as it is 
> technically correct.  It can also be cherry-picked and backported easily 
> if necessary, perhaps outside the upstream tree.
> 
>  Review of the new feature set can then follow, once the bug(s) have been 
> fixed.
> 
> > I just mentioned Mips-A / Mips-B / SoftFloat differences as an 
> > explanation/observation related to the change in this patch.
> 
>  Maybe it's just myself, but from your description I got the impression 
> that your change preserves the status quo and the explanation merely 
> serves the purpose of documenting it.  Please consider rewriting it such 
> that it is unambiguous that the SoftFloat bug is being fixed with your 
> change.
> 
>  Obviously once you've made the bug fix a separate change, it'll become 
> unambiguous naturally, as then you won't have the 2008-NaN feature along 
> it obfuscating the picture.
> 
>   Maciej
