Received: by 10.25.208.211 with SMTP id h202csp621351lfg;
        Thu, 7 Apr 2016 10:08:36 -0700 (PDT)
X-Received: by 10.55.166.194 with SMTP id p185mr4725166qke.8.1460048916537;
        Thu, 07 Apr 2016 10:08:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 71si6583990qhb.91.2016.04.07.10.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 10:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aoDQ4-0007iX-1M
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 13:08:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1aoDPf-0007Pt-Qh
	for qemu-devel@nongnu.org; Thu, 07 Apr 2016 13:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1aoDPf-0006mO-30
	for qemu-devel@nongnu.org; Thu, 07 Apr 2016 13:08:11 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:54498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1aoDPb-0006l5-Ao; Thu, 07 Apr 2016 13:08:07 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id B2C0598117A33;
	Thu,  7 Apr 2016 18:07:54 +0100 (IST)
Received: from [10.20.78.174] (10.20.78.174) by hhmail02.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.266.1; Thu, 7 Apr 2016
	18:07:57 +0100
Date: Thu, 7 Apr 2016 18:07:40 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460044851-61721-1-git-send-email-aleksandar.markovic@rt-rk.com>
Message-ID: <alpine.DEB.2.00.1604071806460.21846@tp.orcam.me.uk>
References: <1460044851-61721-1-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.174]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Cc: peter.maydell@linaro.org, proljc@gmail.com, rth@twiddle.net,
	petar.jovanovic@imgtec.com, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com, gxt@mprc.pku.edu.cn,
	afaerber@suse.de, Aurelien Jarno <aurelien@aurel32.net>,
	ehabkost@redhat.com
Subject: Re: [Qemu-devel] [PATCH 0/2] target-mips: Initiate IEEE 754-2008
 support for Mips
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
X-TUID: 8VGelYhgZ84g

On Thu, 7 Apr 2016, Aleksandar Markovic wrote:

> This patch series is based on the original set of patches proposed by Maciej
> Rozycki: http://lists.nongnu.org/archive/html/qemu-devel/2014-12/msg00968.html

 Please try and spell out my name in full, thank you.

  Maciej
