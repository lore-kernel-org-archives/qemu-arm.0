Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp641927wrq;
        Fri, 22 Jun 2018 03:06:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcSxfN220Smfu95VrMNdL/V0Frqv+NCE/S4sRUoq6Ut8YDLM9Jgy+puQZFg/+S4SXfPm95V
X-Received: by 2002:a0c:f68d:: with SMTP id p13-v6mr746851qvn.35.1529662001568;
        Fri, 22 Jun 2018 03:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529662001; cv=none;
        d=google.com; s=arc-20160816;
        b=SFTRBfrcCqAALJlygi5q8C5qSGU8T1wupYJst/WXxfhVLk+tNUtllINwBmSaZs85qr
         BfWFGOzgrsk1rOl4mr25vIDIYjeGsAzNKl8g/qrZL8m8dqE87Upk6WmdsDW282H7054x
         bPXPrCQyQXA6X9fv+Q2TSe7ZDaOE0LwprNVLzavDtdiWVWyxGeHvCOxSkWuDZidgnp58
         FxAl2JRDDWuHTaFy9ahRgIu848cVaEA30qgbtWlSsqdDJB4BnguskcMvLhjyU4DX8AkB
         f9YRaAHSVTXqtx0BHdNgm0B7mayTnBiw07e3+nfjkIa4xbj6RitrM9LThUJsYSe8ljXE
         qgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IjES+wGnF4h9T94l+5u6azV3KxE2KxsL+oFVThT09a0=;
        b=BisvcDyWdtCkaMm4KCyFQwAwgdZbAwAsJ+fPZOIXH2nh+Fz10rot5tFGUFFrq74REG
         VE/wcoCsF/jwpZqvBveOduuI6AOcl2AmINOwg6Ebsaz6ug7HX8/dt8vrnlxM6TPj4jC6
         LFDX8ZHuaRnRcBdkgbdqUHsruZ8pm7Xf2J0dMCjf8J2Qof4e0AIU/u1aXW9sXuTzDqQS
         i6C9Rl2Apb8ut9nVS7E00vzrGXBbw+7p0jjDp8zcx3MKiYQ6yYG1LLhntW4a1PxYxN07
         KIm+ukmyV3KxG8ACCLuMa9VPwKwpR9Qw+gG1bM4iCOSbX9ZNKEjq0ilOZIqQUQP73jVa
         /dJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JZnaWZV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29-v6si1725301qvw.269.2018.06.22.03.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JZnaWZV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWIxl-0004FB-0y
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:06:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWIxa-0004Eg-Lz
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWIxZ-0000re-PS
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:06:30 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:44084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fWIxZ-0000qh-Iv
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:06:29 -0400
Received: by mail-ot0-x244.google.com with SMTP id w13-v6so6880823ote.11
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IjES+wGnF4h9T94l+5u6azV3KxE2KxsL+oFVThT09a0=;
	b=JZnaWZV73l2MhlwCP4VKlOH4ZjtXBSi61bzfRGsTXC6sF53q4OiRUKMohfbXMi5nby
	QMam2UtW7ia0JdbkSQ9wNzklPgnpgnaBzvXccdqalZEboQ54lUeeO+OMHRdoNSt1iYIN
	YkL6I5+RSkhvCFy1FXRi/1XFrAtHb8oCRCx24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IjES+wGnF4h9T94l+5u6azV3KxE2KxsL+oFVThT09a0=;
	b=XERNpEiPWwKLb9WBNprKJl65S8aNl4ptkrZt6WeqMEtb7LmMRkzy3lMyRHXPnZ1/P/
	reJcGGSXRKhIP6SDKZyz9md7bkTYAt6xqYWsopxiO084oCOdosUtBnJqp5xCDPc/yfOH
	/J768vxv0Aiba/n45KTYydPiqNrCFnoTBhq3E4itX5bg3dnrYShhALgZ2vWpkS0DsdVC
	HdBPjPqscJHw6oBH1lsKrg7+qCdFCzk08jfVSpJQrBvyPdOwof7PLuk2ak/tKdADRQK8
	tXggrW6zHLoKGPcpqRK+9btv1COzKOkN6Ttg51Suag62Yf1U3W+z7e7qF6EMA3boBlbM
	w3Eg==
X-Gm-Message-State: APt69E0XpPc1350tF1gn7ls/q1arAOxr0wNakwcO+pVDJdubggLkEVF4
	iG97GCTU2TzZybCQ2yYGWb91YZQIfg9G2vhBJrh9dMC9
X-Received: by 2002:a9d:64c3:: with SMTP id n3-v6mr559962otl.210.1529661988819;
	Fri, 22 Jun 2018 03:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 03:06:08
	-0700 (PDT)
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jun 2018 11:06:08 +0100
Message-ID: <CAFEAcA_UvmXS9xXpJ4hEs__XMtqY47cZpnvwmwUfP6qtkJCrvg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v3 0/8] arm: implement TZ MPC
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
Cc: Eric Auger <eric.auger@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9eXv7eHs4032

On 20 June 2018 at 14:20, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hi; this is v3 of my iommu patchset. All the IOMMU stuff is now
> in master, so the remaining part is just implementing and using
> the Trustzone Memory Protection Controller in the mps2-an505.
>
> Changes from v2 to v3 (all fairly minor):
>  * add new variable to clarify sense of LUT bits
>  * only autoinc the IDX register if CTRL.AUTOINC is set
>  * NS accesses should see IDregs only
>    (The datasheet is unclear on the exact behaviour on an
>    NS access to a non-ID register, so I've made a best guess
>    and had them RAZ/WI. This behaviour is not reachable for
>    the mps2-an505 anyway, so it doesn't really matter.)



Applied to target-arm.next, thanks.

-- PMM
