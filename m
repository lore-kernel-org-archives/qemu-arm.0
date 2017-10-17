Received: by 10.223.197.9 with SMTP id q9csp4704167wrf;
        Tue, 17 Oct 2017 08:11:13 -0700 (PDT)
X-Received: by 10.200.52.56 with SMTP id u53mr19840735qtb.16.1508253073087;
        Tue, 17 Oct 2017 08:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508253073; cv=none;
        d=google.com; s=arc-20160816;
        b=Lb1vSuu1sdHrl/p99uU1iLY0feL93YvvChY0y/8Vg24ascS79GuKAOYG3OyyTZ2/M8
         ZDCq+KttNcbVD0gkJgecqSMdLAVkriGaLlDk7juX26nCxCJqisr12JsSISLzmsakS8So
         I29KkdY1tae5CoLR/8ltkt150l7Kb+X48yKfOfHpIuAYX9h7G6EpwO7RB98m+t3hPJky
         sBJi7z+6jd8TUzpHXtEmu5zEzdkiipFskZg56M3ks6ouahGJeoP2qfzdc9BTbZ4tVsdh
         DfyCnjvyNpI7FP/k9Ta4SD56xyo/9NCeA3dKiZ5w0z5TOsPDSkbqszU8H7wjqMJWPoGC
         F2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=V3Q+sJbOoPKZQzprUDszE8dXQYkQMsFKg0pgFIpQsus=;
        b=Sqc3hFsYBufUsQm0fLmoeLmMiOa+x3hhEj9kke62ZHo+MhkJve5PzSdILedW4mxsrN
         Nsbd9nuLtjOb9JZtrjFpBkJN+BmFqKsFNwsGNn5VT/UOKQfKJ0Aiph53Ez8vMUqvLGQl
         zXi7x0tkhoBtk+v2DYCv5GapD2Gj69+bBb56Kaa3CMG6TSd+OhRLfZu3yKPxrzDv6ZQq
         5YoMPbWjDARdy4hpCmiLnxOsFgrYZ3B/ACesgucmjilXoUxEKNzQH//28W/WwjsqkJlH
         BdlOLRBg86DAa0JS6cTSfpsd2UMGt4z15wwQkgYW34Df3zxafk1Bf/9IYhsoLLQZ4PJW
         RyfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PN8mLAyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11si601039qtb.463.2017.10.17.08.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PN8mLAyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TWQ-0000Yy-Rw
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:11:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TUo-00080k-W8
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 11:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TUi-00063z-W8
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 11:09:30 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:43685)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4TUi-00063E-QK
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 11:09:24 -0400
Received: by mail-wr0-x231.google.com with SMTP id p46so2047837wrb.0
	for <qemu-devel@nongnu.org>; Tue, 17 Oct 2017 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V3Q+sJbOoPKZQzprUDszE8dXQYkQMsFKg0pgFIpQsus=;
	b=PN8mLAyqGu//C8KAT1wewLnpvXRZh1tv1Tgp7frKediw+m5s/kBcS3TIri1Q/EXhHA
	kJpyWCvugTokhcXpn0cMvSYeOm7Zq4fShx5FgbMPH3hcFeFpBrGUzIMpPE3SGqOBaFWy
	654G79LG0B2XhJaUhDpYab+RwwAsu3gz4quXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V3Q+sJbOoPKZQzprUDszE8dXQYkQMsFKg0pgFIpQsus=;
	b=GzHPsc6a3rlT6OKYQ4Y/nBnSrh+NfABd9Y4GkbdRynIyPJsvDO8MOZJZ0GOiJo69Ki
	51AkAUaOHQIvKAV2/APQtiQ4s7Qbgf6mrhnbWY4ehffbvJiHKM3KiswWvWUFumW18ODh
	qBn620ncCeuXzVsugvdFgeh/tvTpUzn3a+YGo9WS09wjVgcR+Qs1OiSRuMQvNFia8dAI
	rMUVPSseIUU5iVZLXq8pe8jS2bWRgieuzCk5MMmIVHJve7TcvysxyMwaOhomw0JfuJFA
	YQB1Y/KNtul0ut3JJgg/UKEqmJhnOXcKFuuwdctkelY7DwJa3tJgx6VOwL/qZREUUMQm
	A/YQ==
X-Gm-Message-State: AMCzsaXQ6J16V3Eigwy6EMP19bfQO16jFkPuEsNuxQ21tmIzTuXOpNVS
	OJbxLaKb6rpYTcJihV7NRto6LvS2kz9wT8e3AdOf0g==
X-Google-Smtp-Source: ABhQp+TBnDyGeK7Mmy/cw2F5XWRvBADsspTyWZNK4Df3uuLHsL0JBVSltBmHxYNGvOByDkhOysrdZ+NRgUnea9O1vdI=
X-Received: by 10.223.186.201 with SMTP id w9mr3886056wrg.230.1508252963719;
	Tue, 17 Oct 2017 08:09:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 08:09:02 -0700 (PDT)
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 16:09:02 +0100
Message-ID: <CAFEAcA_f=7XjUs7BNQksidnBKofc8SxYtfjMtmfYMuPeo8NXug@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-devel] [PATCH v2 00/13] More fully implement ARM PMUv3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r0m6eCUtaAuG

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but it is
> often useful to gather counts of other events and filter them based on
> execution mode. These patches flesh out the implementations of various PMU
> registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> represent arbitrary counter types, implement mode filtering, and add
> instruction, cycle, and software increment events.
>
> I am particularly interested in feedback on the following two patches because I
> think I'm likely Doing It Wrong:
>  [1] target/arm: Filter cycle counter based on PMCCFILTR_EL0
>  [2] target/arm: PMU: Add instruction and cycle events
>
> In order to implement mode filtering in an event-driven way, [1] adds a pair of
> calls to pmu_sync() surrounding every update to a register/variable which may
> affect whether any counter is currently filtered. These pmu_sync() calls
> ultimately call cpu_get_icount_raw() for enabled instruction and cycle counters
> when using icount. Unfortunately, cpu->can_do_io may otherwise be zero for
> these calls so the current implementation in [2] temporarily sets can_do_io to
> 1. I haven't see any ill side effects from this in my testing, but it doesn't
> seem like the right way to handle this.

I've now reviewed the early stuff and provided what I hope is
a useful direction for the mode-filtering, so I'm not going to
look at the patches at the tail end on this version of the series.


> I would like to eventually add sending interrupts on counter overflow.
> Suggestions for the best direction to handle this are most welcome.

Check out how the helper.c timer interrupts are wired up
(the CPU object exposes outbound irq lines, which then get
wired up by the board to the GIC.)

thanks
-- PMM
