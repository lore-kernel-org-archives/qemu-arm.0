Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2993147wrw;
        Mon, 12 Nov 2018 03:14:35 -0800 (PST)
X-Google-Smtp-Source: AJdET5cLaow+rT6KTFwKIkXNmDO4NiEtA+ymJbWDpMBtx2PCSlFTmK5/7ya3FUhkcQaetRG/LHun
X-Received: by 2002:ac8:468f:: with SMTP id g15mr403778qto.363.1542021275622;
        Mon, 12 Nov 2018 03:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542021275; cv=none;
        d=google.com; s=arc-20160816;
        b=D6Qsv1ACKYaCx6IgoBchQTdPOunqAysNIHgH5QfEtXTMJTpf7YK8I9roT1DBrO3W96
         cVQsooAsaRAwTVV0ow/bgzT8N21ncFfvhm5nmvQghwh49UH9/BMklHzMcfPo87DQmiKt
         /6wWIPLlsYwBWmRq15CdEO9AMo8V0TF4oi/bPa2ebeg1Uvq73WebUaTp2JP9FMeFLIrQ
         sHbejxKXpo0nr9BeUvqyh0YJM19GJ2f2rMUBciopUUSRrjoHFTjMimDZBiZt3O2ku4VL
         YYkRtzgC88wwT4i0/X9hIyDfyqFFXlhFMDkkZ/EaxL6GIfAmnWL+XOcmGNMTuJzbCxr1
         KiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=3ny6Q6bVzyjJDLWWmBGRmXyeEDwuhJ76RhYl7KxINXc=;
        b=tjmBzw0sy5K+OQYspTtUudlG3MHsb1uhYQ6PkbxqpO6uY5fnG2UeTQiTmIMjCNgdfm
         3/iNxcDiGmy7PEs8JFflWbQvmR8QxIoZuPO2jebVfcy84Ti//M6Jcua2Bb+ftum/1CzN
         2BHcv4muxsbhgYMM40M6PMwRDLe3eMcWbBUJ7B2TFBibgv/p5AAAbV+4yr0N4yE5S6wk
         t149DANKyOcmOmAb1BBFoqUp/tToi96gs1YRdlyncz0p52cvAHAOfahhMOmuxDJW7Py0
         EHNb5W0junaj0oq9krxXx3E0RdVlXHVInOl5iIQf+kEPs1svPkM9hr0EwWw+sLswyt+m
         sQPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t96Kasod;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64si7252960qke.271.2018.11.12.03.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t96Kasod;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMAAt-0007tS-2l
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:14:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMAAR-0007sK-JW
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 06:14:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMAAQ-0005zv-SY
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 06:14:07 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:40920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gMAAL-0005wc-K4; Mon, 12 Nov 2018 06:14:01 -0500
Received: by mail-lj1-x243.google.com with SMTP id t22-v6so7227917lji.7;
	Mon, 12 Nov 2018 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3ny6Q6bVzyjJDLWWmBGRmXyeEDwuhJ76RhYl7KxINXc=;
	b=t96KasodBZks4lx9ClZ0LtnsGBjmBFg9l9zkfKJm1xGDJjX/v7AtI7h359k2zJBO5l
	Ij874/w4Aph8Cs5OSe8+i1aqlFA60coi3HW7A4aEUrhE+fBB6aAp1Q8uh2+l2zYaZZlz
	NnuQBFEQpITR99iOkNHGYHG2KYS2CWsCPIJsCHWWxtDlfFipzCye9GDJnbdGgOrMjH2x
	QkJBXKB1gwIbs9VCsU6R0OmXDd+phQhuEXsQ4Pcdg9jg/XSicL7YePSMwM7GVuEoL797
	/xSQORM8XGw8JFjLCliL6UVWUHHOEBRd/IjDBgPmDm9AGiHLkD+G8mfg2NemkDs26QLt
	/8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3ny6Q6bVzyjJDLWWmBGRmXyeEDwuhJ76RhYl7KxINXc=;
	b=HmNZ/bwtnJ4zYyuGwY4+MJmZwLe9adVfU1o+dCkKZU6rqu24yDbjA1Pyl/F9HsNdF4
	C8FXagU16Dj8GaBfvMHHL2bmnr+D/QYGKmbaeNI0BcQRIoimfPR4sJN0FZ48lbv4MXTQ
	AJvbsMjweNlIfBowNjnBWcFPr7t6BYU908Ke7DUfb7KMlO1BG/VDsgdm/FBfowMhKa+l
	TX+ddJT3eXn0T+1/9Ux+5Wqihhx5x+z5tmH5HDasIiaTF5EMfJjVCoRsxdggSIJJtyoN
	FeeLyBHIaoOn3eRlEqEB/h7JRt9p8WVZbBjp7A0yMFxG7DwD8uV2YlVYZGRtkdijpoyU
	B/+A==
X-Gm-Message-State: AGRZ1gJYR3PG7IdQUSpiAqNDYlSZ2Rp+4aVhTaCYvFu23e4/ghescFZL
	pQ4FSoNy/g1H9ygjUi0Fs8t4bGAl
X-Received: by 2002:a2e:5109:: with SMTP id f9-v6mr435594ljb.52.1542021240306; 
	Mon, 12 Nov 2018 03:14:00 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	c133sm3416590lfc.45.2018.11.12.03.13.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 03:13:59 -0800 (PST)
Date: Mon, 12 Nov 2018 12:13:58 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181112111358.GE1148@toto>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
	<20181109173553.22341-2-peter.maydell@linaro.org>
	<CAFEAcA8pbw-D_9P3RYGMZbFXBFD6PzFNgrVLEb_RYQ11YuFdOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8pbw-D_9P3RYGMZbFXBFD6PzFNgrVLEb_RYQ11YuFdOQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/2] target/arm: Hyp mode R14 is
 shared with User and System
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKziPzUOtt/z

On Fri, Nov 09, 2018 at 06:15:20PM +0000, Peter Maydell wrote:
> On 9 November 2018 at 17:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Hyp mode is an exception to the general rule that each AArch32
> > mode has its own r13, r14 and SPSR -- it has a banked r13 and
> > SPSR but shares its r14 with User and System mode. We were
> > incorrectly implementing it as banked, which meant that on
> > entry to Hyp mode r14 was 0 rather than the USR/SYS r14.
> >
> > We provide a new function r14_bank_number() which is like
> > the existing bank_number() but provides the index into
> > env->banked_r14[]; bank_number() provides the index to use
> > for env->banked_r13[] and env->banked_cpsr[].
> >
> > All the points in the code that were using bank_number()
> > to index into env->banked_r14[] are updated for consintency:
> >  * switch_mode() -- this is the only place where we fix
> >    an actual bug
> >  * aarch64_sync_32_to_64() and aarch64_sync_64_to_32():
> >    no behavioural change as we already special-cased Hyp R14
> >  * kvm32.c: no behavioural change since the guest can't ever
> >    be in Hyp mode, but conceptually the right thing to do
> >  * msr_banked()/mrs_banked(): we can never get to the case
> >    that accesses banked_r14[] with tgtmode == ARM_CPU_MODE_HYP,
> >    so no behavioural change
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/internals.h | 16 ++++++++++++++++
> >  target/arm/helper.c    | 29 +++++++++++++++--------------
> >  target/arm/kvm32.c     |  4 ++--
> >  target/arm/op_helper.c |  2 +-
> >  4 files changed, 34 insertions(+), 17 deletions(-)
> 
> Rats, this bit accidentally didn't make it into this patch:
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 2b62c53f5b5..eb6fb82fb81 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -725,7 +725,7 @@ uint32_t HELPER(mrs_banked)(CPUARMState *env,
> uint32_t tgtmode, uint32_t regno)
>      case 13:
>          return env->banked_r13[bank_number(tgtmode)];
>      case 14:
> -        return env->banked_r14[bank_number(tgtmode)];
> +        return env->banked_r14[r14_bank_number(tgtmode)];
>      case 8 ... 12:
>          switch (tgtmode) {
>          case ARM_CPU_MODE_USR:
> 
> 
> (it's one of the "no behavioural change" bits).
> 


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

