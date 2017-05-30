Received: by 10.25.0.6 with SMTP id 6csp1888636lfa;
        Tue, 30 May 2017 09:09:50 -0700 (PDT)
X-Received: by 10.55.159.195 with SMTP id i186mr13894440qke.207.1496160590615;
        Tue, 30 May 2017 09:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496160590; cv=none;
        d=google.com; s=arc-20160816;
        b=D33K173/PXU8yBBRGCCIJQpsNsZX7X3WtjOJrzlLZO7JHvPseyGS7xdlnkTHp4HS2Y
         WmzUW2uTDe0M50WYurhjmZ3nGpG5NTELDDraS5sodWnQyz6Q4sRXf2K7v3lPasDdnUF5
         Vx0Je7lkOpIHxRiYDOzcTXVUpcWksKwqB+hTal+28OcZkJ+Q13OaFpYw1/IIKtMOD9Iq
         tN4DocR1ehRJSEYkMGzRo9oXoOUazpgM4PtBKA3/MX+5ktnURktjBRy6h0g+r4mZB/eN
         tWChCvot2ypJWqv73+KFqfoRz5zi7nFx3CxNKzNU+vsqEOsxwNrVpLzPwS7C1/j4spSE
         d3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=x2NtAKcGyyME/qMrOuGKu2K/pg+sXeZv5e2yOyTsNnM=;
        b=0b/XTKIAfA8vk+k/fepKenY7xvgmipeAdjGYz/V6ljY9A9UVsrMRFhLMRoR8ohHs8U
         kGSftEHyh6sAptzVGFrpq2drAA6v99uPJ6Vrvnz54rzUycXuxm6bFhvdQIbR9KmRJycP
         LSvA09FNBeuB3Bo9uVTvPmJoKs4/Qg4r3SfADY3LWDcvA0pAJqYzV056+jXNgFhMRLVP
         TexwYZZAqbnQhISYfnP8cMRiqhatg3P4Iec8NNjyEyHKBRMHU16AsQ4tlrW4ZfXjDoeu
         3UmcsE3AfDmw+BEWWAvyqs9iot0ZGqDdW4LWdVmOi3UAag/v6EZLsm+RanXXpcsW73aZ
         DvnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5si13088594qkb.137.2017.05.30.09.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjiQ-0007tS-1j
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:09:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjiL-0007t8-28
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjiK-0000Z5-8F
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:09:45 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFjiK-0000Yn-2B
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:09:44 -0400
Received: by mail-wm0-x232.google.com with SMTP id 7so96007249wmo.1
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x2NtAKcGyyME/qMrOuGKu2K/pg+sXeZv5e2yOyTsNnM=;
	b=fGk0+kjkIb/A9snAKQ74TTqAmiqBYHVEFMjM3AICCSPyn7FmGtbK5aTDQY8bvf77lX
	fBc9D70SozdiBbUbzyRRm2JP/9CTeSGgUVbg2enZR6eEeZJS6mwArMqm5z2wBSGuojCR
	jK3tON5P8k40QFHtqVz4z8xfkqpV1tyrFhlEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x2NtAKcGyyME/qMrOuGKu2K/pg+sXeZv5e2yOyTsNnM=;
	b=cvLd4PETDM62ntkEVk7Q/MYuGLtl4vhaL13SgsqIrXaCV2qzVHt/BsJL1Q0E4LrgvR
	TiRoU0+nRck9DesJCrvKO0SD9rJDXg/13gA9DDoBHIdoD14KZ5jnD8W6pqv7DAUp7fBe
	ojfnH0NnyKPZOKhTyAuphsIh7GTHDG6WoG4nJW9qT5jfHs3/nGW4zjYrEqc4Izapb9g6
	ATjnXjs5OLarlU5EObuFuHB3SY0/5/THtcbsFKc2PrgMq9AQfO7oLsoh2q3ozxx9WVEd
	w7MZ/dxvXAr+75/tFiuvvE3rjsUPz8/T1xCFkRxhnxWuYFluSSk1otlcrK1nxmjFKWj8
	B3zQ==
X-Gm-Message-State: AODbwcDu4BBfXhPQgpwfRDHz7oUk+vmiE0GGFJc712wMSJUByCUSEGQU
	smE+yf2EvIiuvcFi3YZG/zgWHopPUODi
X-Received: by 10.28.24.202 with SMTP id 193mr2424605wmy.125.1496160582858;
	Tue, 30 May 2017 09:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 09:09:22 -0700 (PDT)
In-Reply-To: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 17:09:22 +0100
Message-ID: <CAFEAcA_LNipd3oxtcLdm7g_65E39YHKxkd--1Tf6LhVOytgY=A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [RFC v4 0/5] ARM SMMUv3 Emulation Support
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AoOaZdHGqGmu

On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
> This series introduces the emulation code for ARM SMMUv3.
> This is the continuation of Prem's work [1].
>
> This v4 is yet another visibility step as many restrictions apply
> to the model at the moment:

I had a quick scan through to see if anything leapt out
as odd, and have sent a few comments, but I'm assuming
you don't want in-depth review at this time (and hoping
that somebody else will provide it when you do want it ;-)).

thanks
-- PMM
