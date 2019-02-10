Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1825868wrq;
        Sun, 10 Feb 2019 13:40:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYG1nJD7PDdqOAX0SRxs96WdZn5AGI+N7YDiYrP3x1LvHwABUT6smiXLcIijELrWesSahAi
X-Received: by 2002:a1c:f707:: with SMTP id v7mr7079675wmh.18.1549834835679;
        Sun, 10 Feb 2019 13:40:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549834835; cv=none;
        d=google.com; s=arc-20160816;
        b=c5sDENyHJaxnk2YtvrIJk0zzl3/kYxvwSsheksazPOl/hbWjitDuIeT04hoOab1S9B
         d/Ha01kjV1/+3xGBzWXWxPQX7df+wI7+Is4pUOZzrBxn/uW0SnWVRlhbCSm7jgHwAMNf
         GzEV+QyeEfXwvZkLF2qkOXRU8mrWIGqH+SWTOLzxw38llnJZnKwij6261uPfGXvu5dUx
         zCZ79jIG9lViZAFHNFXWj/hNi6j0bQrhtJ7ZQcHAqr/w1Od5XkJsj7KE6MC0i8c5BFVm
         uScLSM2DuKH0U0qdpY6zCVSmCnHCjvhFL8BAdvOo2gMoVWVOLJaHEH9OuqZWwpWZFXPr
         k0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJwpF6IjXOIqjDK2xHhmbZ9tp3JAGZRVyyqm0n+qSiU=;
        b=Byte7pySR1++5OB05HDiJaWCcR7CFyMpp0SFGqPQmJCv+pITtlDQuxeJT8ztyeDIVW
         aDr3a8LVbh7WMLyIIjwjxnbMM4UteP3nFy71vyiTXXKuxRaf7zXlzNfwHzcS1h1OgMZ2
         JXaPaa9MkpI/aNmRmK+iiskNkUGvIpWDq1OmcEavZSCRiFdQQV2bSfavx4fws/Y7s/Fz
         OCzLI5OSxNoeSIGc+S+4JlAUa5vM4nSYgv/iFWeFVuB2S7ln2/bc/sniLWAfqlRsK/ef
         9eHfKejCumfSBevuVHbbv2KvcNqYw6xGYOY8xkfn2JUqp9G8nKWyTrjNphgxf6RxEFKd
         z5Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WqmJ57un;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si5892591wrx.301.2019.02.10.13.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 13:40:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WqmJ57un;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gswq2-0005e7-Nw
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 16:40:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gswps-0005dP-47
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 16:40:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gswpn-0006zX-Sv
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 16:40:23 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gswpn-0006yp-Nr
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 16:40:19 -0500
Received: by mail-ot1-x344.google.com with SMTP id 98so1775481oty.1
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 13:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oJwpF6IjXOIqjDK2xHhmbZ9tp3JAGZRVyyqm0n+qSiU=;
	b=WqmJ57unE1dkceNWwb0ftJxPmzRPEW7Um5cEEa2NgGrI3TWy+r3zBSaLOqgnBTUq36
	dBFPJPq7lKokM0FRRw+5tNWYC87f5M20zried2MbVR4YSw+YzyIAAQmSJEyxl3JEltHW
	+WaVi6JzKcp4DF0R8t/jN9oqLSP7CNyA/Vk6Za1QjcNsc7+m4qROf1GnCboHJY/EIgZO
	qVRJ0ptl6MCxU6g4g9MsJeG2sBtIRC+wp/1Qk2zMYfXneB2RuyOMqHBIKGn6dLt7PkL1
	IhtideAszbB9xc+/C2LI50iBVJJ1JOgb26+LF7AjQSNaCB0927tVd2WgCHId7wd6Rdto
	VILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oJwpF6IjXOIqjDK2xHhmbZ9tp3JAGZRVyyqm0n+qSiU=;
	b=Yyyzc6B8qlF7aAcPrqCdCYt/DzARbBm7IcwgoXRbC8QmuoXHjIUZOTsRrJkx4pK9rZ
	QuofDtkpXNAUZVK1nqeiocd2Hz/6xFollUID4qWDKxAkkjNQF2IZor/z4AfbUZxm+ykt
	dJdUTiivOjG6zewgH5d3sanDeeBzabccRwvmYIeDEhgQAkpHKlavdIkH4VWBvsLgavH1
	oCEgOUaK8HgN+q2nv2EGJKF5CUrjg86X6nKISz12YWomb0z9WlPJ7Z+cU4mKXaxhNNZi
	GvTLGR54in33tj2oP1BNQbTyWl6uPpx5IA8O5LO3YyL3SrbrYOOM+3d3H8pRz0kU4xxD
	vXgQ==
X-Gm-Message-State: AHQUAub0qE5vddywZHWjd0yLxDMr57wwqYNrRg4jORnJKCUT4FouNvAL
	JSG7mkH9Uru/CuFTgn2RuuoQ+SbB85xKsn67tHba3w==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr24702362otc.238.1549834818006;
	Sun, 10 Feb 2019 13:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-4-richard.henderson@linaro.org>
	<CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
	<c37e6649-b2f9-88cf-913d-d0394a635045@linaro.org>
In-Reply-To: <c37e6649-b2f9-88cf-913d-d0394a635045@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Feb 2019 21:40:06 +0000
Message-ID: <CAFEAcA-TwEh74GuvafhqFUXP_xesqC9b1oixubj=ztNa8t4a2g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 03/17] target/arm: Add MTE system registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cnT3rZVm8HZy

On Sun, 10 Feb 2019 at 01:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/5/19 11:27 AM, Peter Maydell wrote:
> >> +++ b/target/arm/translate-a64.c
> >> @@ -1668,6 +1668,17 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
> >>          s->base.is_jmp = DISAS_UPDATE;
> >>          break;
> >>
> >> +    case 0x1c: /* TCO */
> >> +        if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
> >> +            goto do_unallocated;
> >> +        }
> >> +        if (crm & 1) {
> >> +            set_pstate_bits(PSTATE_TCO);
> >> +        } else {
> >> +            clear_pstate_bits(PSTATE_TCO);
> >> +        }
> >> +        break;
> > Don't we need to break the TB here or something to pick up
> > the new value of TCO when we generate code for a following
> > load or store ? (TCO is self-synchronizing so there is no
> > requirement for an ISB before it takes effect.)
>
> Actually, we already break the TB here by default.

Do we? I didn't see any code (apart from the handling
in the DAIFSet/Clear codepaths, which aren't used for TCO).

thanks
-- PMM
