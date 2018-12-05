Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9496316wrt;
        Wed, 5 Dec 2018 07:16:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UoH56ir9yg1m4l79kZXpqnDs316i3kLoDLauSIiFAUgyxm5qeXFO1/4zh1ovGo79ILNUtm
X-Received: by 2002:a0c:f8c7:: with SMTP id h7mr24672256qvo.134.1544022972329;
        Wed, 05 Dec 2018 07:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544022972; cv=none;
        d=google.com; s=arc-20160816;
        b=hsRGtLLZL5R2N0+QL3UfryK2D5oJdGjOUun7NoCTyec/WDGSq6r+XbKHYMPQRaH28p
         0ezVOSpqa6ie/Su8kM78C4RnW1PuECsO4+q+HkUqWoLFOCqD9PwS2/bC0CE5AAwXkaTb
         My1wAQc3NnMGL5PBOay+ZhHC3VCAet/u3nNa6l28y6u+JiCrwgQgge/HXYLfuaGOHdFP
         NZW0iaohscQ4t5EqRLe5Q03xTTifbwLWGaSBa9k9tuu9HfpFEfCXz/O2WEeMYLv/K/Tl
         NFQfeUciMeGExxC8Xr9lxkI0fJMZlfqOzNYPGs5bu3hO4oQAnREPHLUSBnL11/IqF75F
         s/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmaU0rrXihVd2hgFnNwY2WjnVGQA3s9e3S9F3DG2QQc=;
        b=Y17823WewXOZmlFleXh5yx3+O6PB7ucUWgcm22knHcC3/6Ao8FpTsqcyexEtPWwEDE
         hjBDiApgz0cE2k9myyoi8/iCX3otVlZ5CvqY6uRXJlFQvSp3RzzmsBZScoO5xjI9Oojz
         DDiq+YdACpl71ZrXtT+IpcaFYM3Oles0IaoYZFnFfZC2PXfWCd597YnabptNTaSp3vRF
         Vtb0RlGqkUFeTvgQ158cM095ggLOM0GLUm6AZrBD1KDjrYXd22Xy1+IbR3Sm0MG2gob7
         hFecbiXLjC5cnN82I2DNqDRjz+akjLOVj75cGtSP3W5Kfng9MS4KWWtdCqMTGR89G8bQ
         FWsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Np6FKMyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e35si2677385qve.41.2018.12.05.07.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 07:16:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Np6FKMyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUYuJ-0003aC-Pl
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 10:16:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUYtx-00035V-BX
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 10:15:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUYfY-0000AV-LK
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 10:00:59 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUYfY-00009x-B0
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 10:00:56 -0500
Received: by mail-oi1-x241.google.com with SMTP id m6so17736167oig.11
	for <qemu-arm@nongnu.org>; Wed, 05 Dec 2018 07:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gmaU0rrXihVd2hgFnNwY2WjnVGQA3s9e3S9F3DG2QQc=;
	b=Np6FKMyddtFRJvtI4JPVk4k67JIdmjnbCJ4FMotK9gmI6M4hdD0V8qzLD3N4b7xaI3
	RI7T9ZIu2j0NC9Sl7xSGXV/kmrqlv6rfqaxY/N1rJ01ilFV+kNmJMzJkq/3x6epgVUi8
	v6mOnh/zLPkxGRSeR4+CKDj5kmcrCuqZounMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gmaU0rrXihVd2hgFnNwY2WjnVGQA3s9e3S9F3DG2QQc=;
	b=M4l4FvoY9bJa4Zdmdvb9SAoFYx2BuLzzLeT1lVCxv0AqRyNOnPXCzHBhNqpk0AERiO
	EhBWX5N9BEZ07TE8ptajy9MnDH7u8FTyKjiCtPNqcNPY8HhyhkdFMhmPU28DUQbMLIb5
	xGPZ70PBCHzydI8A3gq6Uj+ArfBaoe2qjlVhXlPYa4OwtxEcyBLHfmaaT7yYZo0Cf9I4
	Yl+JqxIvw5hwQklhtmMqsXbmwDhHbsjLxUzX+QsQHUPc6/DDyFWIh4vnDAnbnfPdO0Jv
	mWxlcx+d9dqJIkXhbF38oLccYqmIFLZ7mv1pwrc95KjaNL/MwJNwJv6kN1Ntepsi+dJ9
	uX5g==
X-Gm-Message-State: AA+aEWZovHu8YXx/QIK/GzBe9ehZEenQ//FWHMBpqj4ctn+YoWx/cgTY
	5DBIaeJ2F+WI7Ih3AxPW7dvaarztIhZ+NQZYwEMkEg==
X-Received: by 2002:aca:c501:: with SMTP id v1mr14260163oif.48.1544022055020; 
	Wed, 05 Dec 2018 07:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-8-aaron@os.amperecomputing.com>
	<CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
	<20181203204452.GB5549@quinoa.localdomain>
	<CAFEAcA900U3amGOGRKGNu+-j9EDhdrZ1U1U5MtoW5BeTo74iOQ@mail.gmail.com>
	<05205391-27bf-c6be-bc71-648eee127c47@linaro.org>
	<20181205130047.GC5549@quinoa.localdomain>
In-Reply-To: <20181205130047.GC5549@quinoa.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Dec 2018 15:00:43 +0000
Message-ID: <CAFEAcA8bz20d4LrtEs=iRSJSZ_x5ERU0H0BiYvz4z=+c4v_WvA@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YOcpAmDRAVXY

On Wed, 5 Dec 2018 at 13:00, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> On Dec 03 16:57, Richard Henderson wrote:
> > Yes.  It would appear that this feature should be controlled by
> > ID_DFR0.PerfMon.  So,
> >
> >   if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4)
> >
> > once the appropriate FIELDs are added to cpu.h.
> >
> > Since this test is not used within translate*.c, there is no need to move
> > id_dfr* into ARMISARegisters.  Since these are only aliases, they do not affect
> > migration, and so do not (yet) need to be filled in by kvm.
>
> Sounds reasonable to me. One clarification - do we also need to guard
> against the 0b1111 value for ID_DFR0.PerfMon, which implies an
> implementation-defined, non-PMUv3 PMU, or is it safe to assume no one
> will attempt that flavor in QEMU?

We should check for 0xf, yes, following the recommended check
logic described in the Arm ARM section "Alternative ID scheme used
for the Performance Monitors Extension version". It doesn't
seem likely that we'll end up with the 0xf case but we might
as well avoid the question in advance...

thanks
-- PMM
