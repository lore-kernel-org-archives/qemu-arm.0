Received: by 10.223.161.27 with SMTP id o27csp841469wro;
        Tue, 24 Oct 2017 10:48:15 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TaRlU+KstvJDyf5lSzbxmE+PyINMEHmRYcocaaATGPKxB55zydF49CGc9c6Eo0I4ClZQQQ
X-Received: by 10.37.196.1 with SMTP id u1mr10783162ybf.378.1508867294924;
        Tue, 24 Oct 2017 10:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508867294; cv=none;
        d=google.com; s=arc-20160816;
        b=Opc65hlnh3tZQkifPpY2XSnJLapfjWRenTqDgM0G+r7KP/03qwxdzQnNxQGp99Mn+Q
         MZOjvxxV3J44L7C2apANdeirTwVx3UzUOA3pp9SvJLwNKBXTPWgByysb/El5oFH7GINx
         WWnM5B23TAsI+r0dovEplekztkCLQjiGM1tPUeAROskwSindXFIyjp7Iei8YD9vmaSkC
         IldxYHxmgDznFVeE74A6A5glc67Un4bvA6YXZooNL8EAPXbvBS4NT4w0hNHINmFscfFW
         WSiglMa5KGLYUzq/pwxDF2sQNGYb/9A5snGT84c4wP24EhQ0/Iy9r7NfEHYNyOWTm3lp
         wk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=CaSDuIZ58MMR34ugYz8TAq01XIh2ogE2rFEiJlA439I=;
        b=GO3tUUhNleTmtNBGtdfQLzK6BndPwl6ae6QUfBMUz65l8SASbbpvXH9iW3kXbKPHz7
         g9uY/HFJHyarsWdpWp4JvC37bJfyfox9OIaWZe/QWpPEW4YAIOTq5y+0VHEMHYa4ys48
         FwHKwQxOYZEV7Y8oXRbGwTf6g7RTsKqzC3tokkqC/TwLvZ6ZmzsqXJ18TGz20TRXSCWJ
         e5V7ZvzJnxvg9fCDj+vhFCP9KRK1ArgdcRl/ykZMjYW5AsgJk1ECXvy0FTDrrR5bl4Lv
         3PX9hJKS/kbSHikkWokneUBLqmAtcallNq0am5Dq4UkF7Ds6sDyKY7LDpLaPwMh0T6FQ
         /jAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si122378ywe.576.2017.10.24.10.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 10:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e73JG-0004Q0-DX
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 13:48:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e73J5-0004OT-2Z
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e73J1-0000Cj-8X
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:48:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:56508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e73J1-0000Bp-2p; Tue, 24 Oct 2017 13:47:59 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 97DC521913;
	Tue, 24 Oct 2017 17:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97DC521913
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 24 Oct 2017 10:47:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9Zcm4tEbYXJhsp=ZDCoQDZjd53XuM6T+cxfL7fj5QxCw@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710241046350.574@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA_-b5kb=_jDeDbCGugmzvcuUGKvWV0myThVJuTDbg9jNA@mail.gmail.com>
	<CAFEAcA9Zcm4tEbYXJhsp=ZDCoQDZjd53XuM6T+cxfL7fj5QxCw@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v2] fix WFI/WFE length in syndrome register
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHFa2uLg0voP

On Tue, 24 Oct 2017, Peter Maydell wrote:
> On 24 October 2017 at 16:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 21 October 2017 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >> diff --git a/target/arm/translate.c b/target/arm/translate.c
> >> index 4da1a4c..a89518f 100644
> >> --- a/target/arm/translate.c
> >> +++ b/target/arm/translate.c
> >> @@ -12325,12 +12325,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
> >>              /* nothing more to generate */
> >>              break;
> >>          case DISAS_WFI:
> >> -            gen_helper_wfi(cpu_env);
> >> +        {
> >> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);
> >
> > This won't work, because dc->insn is only populated by the translate-a64.c
> > A64 translator, not by the A32/T32 code. I guess 'principle of least
> > surprise' suggests we should populate it for Thumb and ARM too.
> 
> ...and also, this code path is used for both A32 and Thumb instruction
> sets, so just looking at the top bit of dc->insn isn't sufficient, because
> you might have the A32 encoding with a cond field with the top bit clear.
> You can either look also at dc->thumb, or alternatively have a new
> field is_16bit in DisasContext which you populate in arm_tr_translate_insn()
> and thumb_tr_translate_insn().

Thank you for the explanation. I went for changing this line to:

  TCGv_i32 tmp = tcg_const_i32((dc->thumb &&
                               (dc->insn & !(1U << 31))) ? 4 : 2);

and I have also added a call to tcg_temp_free_i32, and dc->insn = insn
in arm_tr_translate_insn and thumb_tr_translate_insn.

I'll send another patch.
