Received: by 10.25.208.137 with SMTP id h131csp75822lfg;
        Fri, 13 May 2016 01:47:35 -0700 (PDT)
X-Received: by 10.55.77.202 with SMTP id a193mr15276288qkb.48.1463129255590;
        Fri, 13 May 2016 01:47:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h188si11474288qhc.91.2016.05.13.01.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 01:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b18kx-0006LA-6j
	for alex.bennee@linaro.org; Fri, 13 May 2016 04:47:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b18ku-0006Jg-EL
	for qemu-arm@nongnu.org; Fri, 13 May 2016 04:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b18kq-0005GH-5H
	for qemu-arm@nongnu.org; Fri, 13 May 2016 04:47:31 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:56982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1b18kp-0005G8-Ux; Fri, 13 May 2016 04:47:28 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 599908DCA1D73;
	Fri, 13 May 2016 09:47:23 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.266.1; Fri, 13 May 2016 09:47:26 +0100
Date: Fri, 13 May 2016 09:47:19 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160513084719.GA28760@hhmipssw201.hh.imgtec.org>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
	<1462417489-28603-3-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA_gkX=xokbLwOGQeNHUvn-a7+oLF1=yaW6AptDTmBYWQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_gkX=xokbLwOGQeNHUvn-a7+oLF1=yaW6AptDTmBYWQA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH RESEND 2/5] hw/display: QOM'ify jazz_led.c
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nUKSgLWrt8X8

On Thu, May 05, 2016 at 01:46:13PM +0100, Peter Maydell wrote:
> On 5 May 2016 at 04:04, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> > * Drop the old SysBus init function and use instance_init
> > * Move graphic_console_init into realize stage
> >
> > Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> > ---
> >  hw/display/jazz_led.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> CCing the MIPS maintainers and the listed maintainer for this
> board so they can pick this patch up.

Since there're no changes in v2 I applied this one (with Peter's rev-by)
to target-mips queue.

Thanks,
Leon
