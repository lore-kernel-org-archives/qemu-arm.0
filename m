Received: by 10.25.159.19 with SMTP id i19csp506922lfe;
        Sat, 6 Feb 2016 08:10:15 -0800 (PST)
X-Received: by 10.140.142.134 with SMTP id 128mr25555234qho.62.1454775014945;
        Sat, 06 Feb 2016 08:10:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si2207711qgk.115.2016.02.06.08.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 08:10:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS5R8-0001FY-B6
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 11:10:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS5R6-0001DX-RU
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS5R3-0006TR-3o
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:10:12 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS5Qw-0006Oz-VP; Sat, 06 Feb 2016 11:10:03 -0500
Received: by mail-pf0-x243.google.com with SMTP id c10so6244749pfc.0;
	Sat, 06 Feb 2016 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g9SeCRB/7YWoV3M5ATCNkP6hbpLLNNhmRjcJzT+Yl38=;
	b=MM3fCtGpx2V+DHDi6eU6YlKM5D16e8zICk8/Vk79YTOxx3p6OFIFuvhoT3iV0k/uuU
	Ljg65XyqkdcyOQHc9F5Ix8VJIpvmBl35P3hA6tTMjcSwKhcsA3wukLgiu5k7axiA9XtN
	n8rQDk+/TmzNHpGZsEgiqCqq/mjauutMUTsAIKwZbbD/egcIX5Xnkman1AiAiq6GJnMp
	x0qUTnJlZqSQWOAUd32P/KeMK+Qk7cBJna/VuYBRJ7PRsEinROJMory6JxcTgHUXrY8z
	MAV/svBwbXGeFsHBCXfQHIOpp0CdTQ+dnDuOTe0+23I6uBFNvpYNwmTaTik3QKBYNxWA
	iJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=g9SeCRB/7YWoV3M5ATCNkP6hbpLLNNhmRjcJzT+Yl38=;
	b=UO202NQHa4+4GDMmUV9E9+qcxmhSuRym2Cw378u90NPcClMPaqRw9HosavFK9rumvu
	L7KSvZssswgjVYs497cPJ5l9YF6uJWE2Bu/QMyIcqQOw+vkx4hrSB679uU5G6zyNJejr
	lrRLGacRLluCIsYlbws6UIPgOTm2i29zg460nsaBB6eqYM2ZJmzTu9c2CQAF3AchHKjG
	L+AjbSp5DFiEVbzG5w3K/nvjkChxH4H7kd9oIjq1gKWCmiKaEkBawDGb2fVxexlTZ3kk
	X6R+IXfBD27LvNtdluRyoDCUGVlOZa2vHYLRlxwhLIJd//BOkx186EL4rlKUrpmZUZpt
	W38g==
X-Gm-Message-State: AG10YOT8i6LyPbBXeWSa9GcInrY0jqpvchVWfc35yUCpMSLzGa+Y9Y1vkD7SWlDb9STVWQ==
X-Received: by 10.98.16.86 with SMTP id y83mr28602343pfi.45.1454775002195;
	Sat, 06 Feb 2016 08:10:02 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	x13sm4673518pfa.72.2016.02.06.08.10.00
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 08:10:01 -0800 (PST)
Date: Sat, 6 Feb 2016 17:03:22 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206160322.GD3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
	<20160206121756.GC3913@toto>
	<CAFEAcA-KxmVhGxk4d=+yMj5+NxCaPeGNc_3m4guB3Y72hSMcDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-KxmVhGxk4d=+yMj5+NxCaPeGNc_3m4guB3Y72hSMcDg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 3/7] target-arm: Use access_trap_aa32s_el1()
 for SCR and MVBAR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FHO6bl4p2Ylj

On Sat, Feb 06, 2016 at 01:48:19PM +0000, Peter Maydell wrote:
> On 6 February 2016 at 12:17, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > It seems to me like if EL3 is running in AArch32, then we shouldn't
> > trap accesses from Secure EL1 but I can't find that logic. Am I missing
> > something?
> 
> If EL3 is running in AArch32 then there is no Secure EL1 -- all
> of SVC, IRQ, and the other PL1 modes run at EL3 privilege,
> and arm_current_el() will return 3 in this situation.

Yep, I keep forgetting that for AArch32...

Cheers,
Edgar
