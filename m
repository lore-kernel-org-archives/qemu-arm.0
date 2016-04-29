Received: by 10.25.208.137 with SMTP id h131csp892934lfg;
        Fri, 29 Apr 2016 07:22:50 -0700 (PDT)
X-Received: by 10.55.201.70 with SMTP id q67mr19804222qki.121.1461939770669;
        Fri, 29 Apr 2016 07:22:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b125si7623742qhd.78.2016.04.29.07.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Apr 2016 07:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aw9JR-0008UW-HB
	for alex.bennee@linaro.org; Fri, 29 Apr 2016 10:22:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1aw9Iq-0007Fj-MI
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 10:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1aw9If-0001Qr-6c
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 10:21:51 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:15242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1aw9If-0001G6-18; Fri, 29 Apr 2016 10:21:45 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id B4B60220634ED;
	Fri, 29 Apr 2016 15:21:12 +0100 (IST)
Received: from [10.20.78.91] (10.20.78.91) by hhmail02.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.266.1;
	Fri, 29 Apr 2016 15:21:15 +0100
Date: Fri, 29 Apr 2016 15:21:01 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
In-Reply-To: <EF5FA6C3467F85449672C3E735957B859169D080@BADAG02.ba.imgtec.org>
Message-ID: <alpine.DEB.2.00.1604280416341.21846@tp.orcam.me.uk>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>,
	<alpine.DEB.2.00.1604241428540.21846@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B859169D080@BADAG02.ba.imgtec.org>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.91]
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
X-TUID: hmFJumcRTj6I

On Mon, 25 Apr 2016, Aleksandar Markovic wrote:

> No, nothing is lost. The plan is to add this functionality at a later time.

 OK then, as you prefer.  Although I find the order somewhat odd as r5+ is 
a special case of r3.

  Maciej
