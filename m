Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10791639wrt;
        Thu, 6 Dec 2018 08:01:36 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UqSe59Q9GmhX8lZJtVFDAZWirarKobdneqxBuULKY9yWbHPBaOiP41NEPjwR7CI57tSZTI
X-Received: by 2002:ac8:2a55:: with SMTP id l21mr26944723qtl.95.1544112096396;
        Thu, 06 Dec 2018 08:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544112096; cv=none;
        d=google.com; s=arc-20160816;
        b=DSjhCkVb8vi9wR+La3h7hm6SkQbdtuQM8PRx+8q5uIjf8cSBVV66zfR3RS8ajWFuZH
         P7i3s3qpvNXsqDfOcID51SnSn6Fnc2aFDeM+U+l+RLU/Mu+6JTciDin5qSp/8rVo5ik0
         1JCv97q49SsOhIIXpk/Fs+C01Kia5vAWksTbCC3QnDuBgIY4Px9YL+mkcKwOFh+ATSuJ
         H7WPur4Hx3LC/68z7ogXLsJHJ/Vr0rTFnlmNc8HcteqYTspT2peOhp5zrNa3ceIQnhyB
         4bAahQjg/NdrEu812faw0UJAW5Q9fZIBdVMEtajvCZw6yhdzzSYr6G/A0FUYcChej3nG
         uThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AZk+5PXxH6CUPNq5HgKE1xuT1eN9pE95DfGWLHWz6ik=;
        b=aEvBIZtfUlb1Lpq+nvjmhbcdqwY/0mdD0/WVbXKLfOdOd5l5YJOUxBJI73sqP5wpoH
         oJ9fisFrjpA87wkXj+q/R1QlXVU875f6ZBN6kl86QNgColQQ33KqlXjTrSZ3qS9JmGs1
         yJd//eM5M3A3yUwCMUf7fcZahE+ZJ7mcOZiDMLXozlFWs0SjvUbkIZ6KWNBwf7gP8l40
         WnZzI8M9xe28lu0p8UWjCSf+hXU7ei5zDdUG9Rcy5Nx3aCw8t1AdvbgWj6X1WGjM40Hz
         lCm5OLuET5gP8tUTDGgtas7u5NX2BdSIzedrWhaInli3fe//QG74o1tK0latKkRMOOJG
         qP3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KvhWVtI3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a123si416195qkd.182.2018.12.06.08.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 08:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KvhWVtI3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUw5n-0005xd-Tu
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 11:01:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUw3e-0002tz-13
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 10:59:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUw3Z-0000XI-Jv
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 10:59:21 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUw3Z-0000Tr-Am
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 10:59:17 -0500
Received: by mail-ot1-x342.google.com with SMTP id n8so852938otl.6
	for <qemu-devel@nongnu.org>; Thu, 06 Dec 2018 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AZk+5PXxH6CUPNq5HgKE1xuT1eN9pE95DfGWLHWz6ik=;
	b=KvhWVtI3S1y7GFq8McpSmCu86NNGp5ACCwP/FW4DzIlLtjblM20OPMD8lFRXLN5Mor
	0/MsieA3AMWd9mErDJIio/Wpo0jiUJPuGfM+V/V+OVut1rTXXs1OxRCVMeYyZ/35Erai
	LXZi/ZbzImjQ12Cxjnx0hMq24oFD2jKjLKjz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AZk+5PXxH6CUPNq5HgKE1xuT1eN9pE95DfGWLHWz6ik=;
	b=oKIdSC1iRpsBo29/ynGjmLCYzJJfR0YPR3GkFzY679hS8e+Sbt2FXfroAMQ0iNQ1xf
	KQD+ai9u4Xw4YmgcTmRN/PiEKeh4W9ztmbwndlH1lw1JDzx1TCNKz9H88qF/FwFpd52y
	VxZ2wlsY0/BsOd+M+aVxPAbOPjWcUVTbvxhplQx0Rt3FaKkzCVbtKyVG8GOK40F1DEJl
	lF4ANUFw2V+0btPn2EKbndMLykoDDti2F2WSEnngf4mrbJFg35AArI0Vfd9RfNA2Svf7
	Lvv9rvRYPYMVU7klqhVbadd6RXdLjiQuIKEOT4GRtR3R2EZZnBVF4zGoRNnCZ9+oNTSU
	YtsA==
X-Gm-Message-State: AA+aEWaxHIx+OsT8mo9yri+BZsJbntdm3w6h6zZHp5URJZOBJe1XTXKF
	0ycRBJun1sKTjzafFbI1cbly9IZ76MDRnPdsbQHR6Q==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr17630576otu.352.1544111956583; 
	Thu, 06 Dec 2018 07:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-9-aaron@os.amperecomputing.com>
	<20181205153242.GE5549@quinoa.localdomain>
In-Reply-To: <20181205153242.GE5549@quinoa.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Dec 2018 15:59:05 +0000
Message-ID: <CAFEAcA8h7xXk7Vs6_pMThZ7bfkmBBfuJUhGRZvnAfGJQR3GVOg@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0
 64 bit registers, add PMCEID[23]
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3AWmVTXmbYOZ

On Wed, 5 Dec 2018 at 15:32, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> On Dec 05 08:43, Aaron Lindsay wrote:
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---
> >  target/arm/cpu.h    |  4 ++--
> >  target/arm/helper.c | 18 ++++++++++++++++--
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 304e6e47b3..4216fe22db 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -837,8 +837,8 @@ struct ARMCPU {
> >      uint32_t id_pfr0;
> >      uint32_t id_pfr1;
> >      uint32_t id_dfr0;
> > -    uint32_t pmceid0;
> > -    uint32_t pmceid1;
> > +    uint64_t pmceid0;
> > +    uint64_t pmceid1;
> >      uint32_t id_afr0;
> >      uint32_t id_mmfr0;
> >      uint32_t id_mmfr1;
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 71be6fb578..fb6939e99c 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5256,6 +5256,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >      } else {
> >          define_arm_cp_regs(cpu, not_v7_cp_reginfo);
> >      }
> > +    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4) {
>
> After further discussion on my last version, this should be
>
> if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
>         FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) != 0xf) {
>
> to guard against defining these registers for implementation-defined
> PMUs.

With that change
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
