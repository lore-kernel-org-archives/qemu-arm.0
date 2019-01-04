Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp640538wrt;
        Fri, 4 Jan 2019 06:06:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W5XK22ukyJ3nDBMO0FQ43SqlusVw1SpEUFor/4kEdl8DrxWt9AttdPwz7Hj8LTiMR+9cYZ
X-Received: by 2002:ac8:2e22:: with SMTP id r31mr50224869qta.333.1546610780814;
        Fri, 04 Jan 2019 06:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546610780; cv=none;
        d=google.com; s=arc-20160816;
        b=nC6CNcTlH/VmIxDlvjlXShboYfblqIvWTVgXYuEu4sbhLRwPSK9ykbmkfaPGPQQCsp
         NV03LvAsbuxPZ+u1iubGxgcNKY7BB2wmU1ntWipSkWc6NCfqLksuFUndnoXigLtJ0Jnt
         +/vYR4c3K1JSWCslNA4xiq6yajrGWho0HTWcB4Mmt2f/EzA0T8kgkgtJ2bohE3FGPyuc
         QH9QSOetwdaeu9q5Tq6E1AkihfHbha2ERR3+Qt3vJBK/jsVmY/ixQvCnsPRW41aagQKK
         PTOEVAw58ukmubkKIB84MZ9/ko4yvHjDnLcezdsejhmqcvKUA/TS+nk3cp74X/6d0Ht2
         XuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=cNkJJxKB5EHzCd+ZrTkMTo0EwbSGk58yrUs4PNcQsqw=;
        b=YPDrJhp3QYU+87qkH9OaRS0ngMrhcV7lV9sT9U4IieoL/s2a/jn9RZhCSZPGGbbzgT
         J+ytxT2FXr/GsqveIOCz03gGmhHE6DXY6wBsploWEJcxFJY1h9RRLGzfnOyFS94v3T+K
         /8n8B5sxNiM5z+lS/l0Mi6PzKmgRhG4uhfwMiLTuScTUcf+8/E3pVMycg3SslvtapmLN
         cIea4VbfxY2J5nw6oQ+iZJ8efpv2npOJPa4YCiVfNCZoE3yuTxZgJtw7HvdNC9af17YO
         lhjCm7bcaa4TNRliInS6wrHqLRLVcancS0WkFJPKuRtTO1HZ4D83OmTK5OLN8rzC0gsS
         LfVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si2437169qta.292.2019.01.04.06.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:06:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQ7A-0004FJ-6G
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:06:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sha@pengutronix.de>) id 1gfKfx-0000Xp-D7
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 03:17:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sha@pengutronix.de>) id 1gfKfw-0007G3-F0
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 03:17:53 -0500
Received: from metis.ext.pengutronix.de
	([2001:67c:670:201:290:27ff:fe1d:cc33]:47685)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sha@pengutronix.de>) id 1gfKfw-0007ES-3g
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 03:17:52 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <sha@pengutronix.de>)
	id 1gfKfn-0007c4-G9; Fri, 04 Jan 2019 09:17:43 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <sha@pengutronix.de>)
	id 1gfKfm-0004Fl-0D; Fri, 04 Jan 2019 09:17:42 +0100
Date: Fri, 4 Jan 2019 09:17:41 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Antony Pavlov <antonynpavlov@gmail.com>
Message-ID: <20190104081741.mxdgg4dwm4l5s4ki@pengutronix.de>
References: <20190104015641.e6d525f098c5e272694faa62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190104015641.e6d525f098c5e272694faa62@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:14:52 up 205 days, 17:23, 138 users,  load average: 0.05, 0.35,
	0.31
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-arm@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:67c:670:201:290:27ff:fe1d:cc33
X-Mailman-Approved-At: Fri, 04 Jan 2019 09:06:05 -0500
Subject: Re: [Qemu-arm] barebox on Canon A1100
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
Cc: Barebox List <barebox@lists.infradead.org>, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pz9ITywHYWYC

On Fri, Jan 04, 2019 at 01:56:41AM +0300, Antony Pavlov wrote:
> Hi Sascha!
> 
> I have some good news and some bad news.
> 
> First the good news.
> 
> Barebox was used for Day 18 of QEMU 2018 advent (https://www.qemu-advent-calendar.org/2018/).
> 
> Here is a quote:
> 
>   > This is an image for QEMU's emulated Canon A1100 Arm machine:
>   > Play 2048 in the Barebox firmware environment.

Hey nice :)

> 
> The bad news.
> 
> Current master branch barebox for Canon A1100 does not work under qemu,
> barebox v2017.02.0 was used for qemu advent.
> 
> Thomas Huth reported the problem in the qemu-devel mailing
> list two months ago. Please see https://www.mail-archive.com/qemu-devel@nongnu.org/msg571887.html
> for details.
> 
> The commit a43e2bbc468a71 breaks barebox for Canon A1100:
> 
>   > commit a43e2bbc468a71fb8825e8acafb7fac7ad7c6dad
>   > Author: Sascha Hauer <s.hauer@pengutronix.de>
>   > Date:   Wed Mar 7 10:04:07 2018 +0100
>   >
>   >    ARM: return positive offset in get_runtime_offset()
> 
> Any suggestion?

Yes, try again with a recent barebox. There was a bug in this commit that
should be fixed with the following:

| commit 0230365df6601cd561c9e3e368c96222076ec9f5
| Author: Sascha Hauer <s.hauer@pengutronix.de>
| Date:   Wed Dec 12 08:55:31 2018 +0100
| 
|     ARM: fix setup_c when runtime offset is != 0
|     
|     The runtime offset has to be added to the memcpy source address and
|     substracted from the return address. This should have been changed in
|     a43e2bbc46 which changed from returning the negative runtime offset
|     into changing the positive runtime offset. Instead a43e2bbc46 only
|     changed a zero substraction ("subs r4, r0, #0") into a zero addition
|     ("adds r4, r0, #0") which was used as a equal to zero test and changed
|     nothing. This part is reverted here.
|     
|     Fixes wrong copy / return locations when setup_c is called with
|     different runtime and link addresses.
|     
|     fixes: a43e2bbc46 ("ARM: return positive offset in get_runtime_offset()")
|     
|     Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
