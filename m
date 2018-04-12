Received: by 10.28.71.155 with SMTP id m27csp2146638wmi;
        Thu, 12 Apr 2018 10:08:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48mTEHBhGo/tQIh4mdlFejCXEgeNYC8xOT50EwpZ7PvNagevp4AQX3C2zGgnX0IqxRNmBSB
X-Received: by 10.55.200.69 with SMTP id c66mr2237562qkj.150.1523552920421;
        Thu, 12 Apr 2018 10:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523552920; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDYwD+9n6qOZ18+hlECMm4EK7qF4xCeDJRICLi0P311d5SPD3+FKshZd94jtFAPsgm
         Iis4zlSNEEI66V/ZsqIz+ptnLneeFax00NbNETaAdJxOMIYuBwZcUZ5994wSBmDqQpOd
         faKAvIELGaLMwzka1kXrqEbAIG7b9TcO2a7KlvQMEigMn98F27tMOBXaPtcuWxzIrXTN
         PbKrzduYyQRnfUKw78eK+AUbxRV8ZQr084AJPoyRmjtVlLsys3lX6Ar+yQCIILADfMU8
         6b8+d54Q62/AjUvr5DWhUwtkaQkMK/eRBpu9EJVBeyCP+ySLhvYjs+3fihqySVRa6OXd
         OTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=iwCEbdHa7VTRygO46ez1EYmnE/Yh6tVNqTGg06Y951M=;
        b=TgE3JStcR8YsdTM41Hcrku7PpN0W82yLWFwTUnAHlLxcwwq8fqu8hiv1Fgc8fJvmna
         SnV9f/rGuKSS1qlDx336xjmWVe7bwYylfy+mbXUv2iJz1a+axCjHqbLC0Yr46lyIhKgC
         16qulqgpNvR8P7fXHs1NisYTOi90mVgj306nRxZpB8seUvkRymoFgrekaT45IuTzoNW/
         M1CRJBTGt+QjHJJvkKum3ozR8vAQDQ+xy6DvxDD9pPn9zZ5jg+CkFfVCBA5nqWmTBIMC
         Uz7PBdWRS1v/Gth0wR/eMhrPglmOKjboYIPOy5yx1WVfIsdyU4HoPDnu25nEOqFYKWqC
         ltvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iHP8POBF;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ByFbNjun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24si3569095qtb.58.2018.04.12.10.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iHP8POBF;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ByFbNjun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fiB-0000ND-To
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:08:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fhz-0000LD-5q
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fht-0003Ta-Em
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:08:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f6fht-0003Sz-4V; Thu, 12 Apr 2018 13:08:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0298A60817; Thu, 12 Apr 2018 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523552900;
	bh=WvdeneUaCw0ip+yogIlnfZbfi6YP1Tu49YXH8EdoTX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHP8POBFHL1F5bRlwALe20jcHMnE+fd4UMn37/vgTCg5aD10exIA8QU6WM8nLpYfC
	s0GQbmeVEJITMVJOjc7getV6c5I6PukUctQacnHpXmQa+UygdSRPoTT6GBWvszaChH
	QuDjulXrDvmmjpOg/NgNV4a6tKVJgGq/y3Uiz71k=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id A056E60C55;
	Thu, 12 Apr 2018 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523552899;
	bh=WvdeneUaCw0ip+yogIlnfZbfi6YP1Tu49YXH8EdoTX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByFbNjun7zzwRuPtX+HdqIBiAzYzCaajOx/ogNL3NZoTljljxng2Nll4I1l0T71zS
	DJ9YE70T/1yaINdYC1sr5ATfPRnamogNVB+9OLgA1NjE4GzPHgNfeaHm7/IKKqjGOx
	XCJAabZgnXr6mgG3/eDLgNkvzeMiuhDcdfnDyX+4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A056E60C55
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 12 Apr 2018 13:08:16 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180412170816.GI24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-11-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8XARzPc-YEoQVQUEoV2gL+ZOLsqzxhh36xzqjXZXniPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8XARzPc-YEoQVQUEoV2gL+ZOLsqzxhh36xzqjXZXniPw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 10/22] target/arm: Allow EL change hooks
 to do IO
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HgaQ6vmOQ+Lv

On Apr 12 17:53, Peter Maydell wrote:
> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > During code generation, surround CPSR writes and exception returns which
> > call the EL change hooks with gen_io_start/end. The immediate need is
> > for the PMU to access the clock and icount during EL change to support
> > mode filtering.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/translate-a64.c | 2 ++
> >  target/arm/translate.c     | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> > index 31ff047..e1ae676 100644
> > --- a/target/arm/translate-a64.c
> > +++ b/target/arm/translate-a64.c
> > @@ -1919,7 +1919,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
> >              unallocated_encoding(s);
> >              return;
> >          }
> > +        gen_io_start();
> >          gen_helper_exception_return(cpu_env);
> > +        gen_io_end();
> 
> You don't want to call gen_io_start() or gen_io_end() unless
> tb_cflags(s->base.tb) & CF_USE_ICOUNT) is true.
> 
> (Ditto in the other cases below.)

I assume there's nothing tricky about this and updating this as follows
is sufficient?

> > +        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> > +            gen_io_start();
> > +        }
> >          gen_helper_exception_return(cpu_env);
> > +        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> > +            gen_io_end();
> > +        }

-Aaron

> 
> >          /* Must exit loop to check un-masked IRQs */
> >          s->base.is_jmp = DISAS_EXIT;
> >          return;
> > diff --git a/target/arm/translate.c b/target/arm/translate.c
> > index ba6ab7d..fd5871e 100644
> > --- a/target/arm/translate.c
> > +++ b/target/arm/translate.c
> > @@ -4536,7 +4536,9 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
> >       * appropriately depending on the new Thumb bit, so it must
> >       * be called after storing the new PC.
> >       */
> > +    gen_io_start();
> >      gen_helper_cpsr_write_eret(cpu_env, cpsr);
> > +    gen_io_end();
> >      tcg_temp_free_i32(cpsr);
> >      /* Must exit loop to check un-masked IRQs */
> >      s->base.is_jmp = DISAS_EXIT;
> > @@ -9828,7 +9830,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
> >                  if (exc_return) {
> >                      /* Restore CPSR from SPSR.  */
> >                      tmp = load_cpu_field(spsr);
> > +                    gen_io_start();
> >                      gen_helper_cpsr_write_eret(cpu_env, tmp);
> > +                    gen_io_end();
> >                      tcg_temp_free_i32(tmp);
> >                      /* Must exit loop to check un-masked IRQs */
> >                      s->base.is_jmp = DISAS_EXIT;
> > --
> > Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> > Qualcomm Technologies, Inc. is a member of the
> > Code Aurora Forum, a Linux Foundation Collaborative Project.
> >
> 
> thanks
> -- PMM

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
