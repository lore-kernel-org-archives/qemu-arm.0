Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4879669wrt;
        Tue, 8 Jan 2019 10:18:02 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4rCzwfKgGoMPlOcnF6qA9sYpp4d8IXFdAKygdbWSDdfS1Wo+4YkJhQVsnRuKsoMZTRHChg
X-Received: by 2002:adf:e608:: with SMTP id p8mr2278867wrm.166.1546971482503;
        Tue, 08 Jan 2019 10:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546971482; cv=none;
        d=google.com; s=arc-20160816;
        b=pJotpHKctqYDjhu+Rk2Syma9Lqbk/ZOtvGyX3S6eYjgx/qiJNLrOwKyn6OWv/fKWzw
         Esc0+SoIJaOCo3q+yWJ1tvK+jBDVuV8lT2KtExlmyvoguQQeAUrdK7NdQQTKR1DUHW6b
         pWzlT9J5nhjejUFyCe/32oKz2rJbgDtOsJFFOvYT8ORrqq5llt6pbGomYk5FyqzryJDF
         ENsKCpt4VaJfmQsviFVrA32rOvLbIhJ5hDk0422QCM4y6H65Pc8qYKfYGeWNXNyfoJ4e
         aS2nnxfPVqeVspk5E8kNmFxyPlq5mZlPTYSFxzTXVmzDqB1OYqYhbdESwoAz58jV57uO
         DI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7avD9+PioskPR84N/R8P2gKb7czgRyoRnMPXn4gkwhE=;
        b=Mf5ZYQJXt9hXh8X2MInBbfYt2yEY3RqmuF+zUYgSSyBTVK+oNGh/lZnR6za3EY38lK
         tZ6u0/oEa6nkRSYTuLs778o3w2sOPIx4tPwa3+zh0qtPIu/Kg56y7MAPi7jRz19Pyi0k
         IZCDn8v6M4WnVTQKcEKshJBBdsNUYELPh0qAwd79pmFTGOReAfWmHCJBUaG4QXOKzb4p
         FXKwFjJIbmzsENidyRlqHS3qhe545yFwsjVVmcd87rPlUdeBZ4dhD2mEotPZffowRna7
         myfcXYoXbHPWiXRNfw2ArovzlFPBu4XpACiPBWmt6sEHArpKsqNCWxPLcTwPwxrqmI0s
         HmHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=co1C7EaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i64si7661989wmi.183.2019.01.08.10.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 10:18:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=co1C7EaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggvwt-0004Jo-Kv
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 13:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvvZ-0003Tf-6p
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvvU-0001Op-JY
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:16:36 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggvvU-0000iz-EF
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:16:32 -0500
Received: by mail-ot1-x344.google.com with SMTP id n8so4331027otl.6
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 10:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7avD9+PioskPR84N/R8P2gKb7czgRyoRnMPXn4gkwhE=;
	b=co1C7EaOlthauZOcT0IkDFYC35uWY98HpXAwAS2k3nl0VAFQiqSMek1QPfYZCCDUo6
	+41DVd5r9b2Y3YIuhcRNg4uDaZWE5RAU7kmIlhYEjIa+wZOiOcU1tDmWHwXMNYxpWK4H
	zJQRVxVEWlrQCUGd8GMToTYJPyeayKqDXRNb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7avD9+PioskPR84N/R8P2gKb7czgRyoRnMPXn4gkwhE=;
	b=hxz8IUzYYDP+pKKuaSo5wY2/c3mI46EXNmb0ulpNXcENepzytcfS4LbDbJ9GVJd8F4
	0S4uVUX+4uPJjnxVE0q/sBQa7iIjGKupvsqQFgz0xG8Ubdggc7XngpQGYscaJ7y7lMAS
	AVLMWjjFNTLsPqhiSxvOa5I8HcdPgWGYsIhmiq1bhKuXP6FppYbgZICCylHniSOp8eia
	8Qppv/ODHW1EpWRiw50Hgh440B1Omt6Og5a2P6bOvX5wuCdUHWR9mDQ8QK9DFb1R5dLU
	brC97rX0vY2yutDLoB5vNkQpFmhljs2i/Yr198lDEQmBEjTH6R3WAWK+jl/VN5B5i1YF
	zc6Q==
X-Gm-Message-State: AJcUukfw+/MWWWcAFGvqJOE/4Nw8Y47C9V4Xrwu6e5NgFHj3M2oDpPee
	e2b1PVxI0kEVhd/kzyntpp2nxTGP2urF6MSLfghSyw==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr1828758otq.316.1546971369705; 
	Tue, 08 Jan 2019 10:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20190106225035.5671-1-richard.henderson@linaro.org>
	<20190106225035.5671-4-richard.henderson@linaro.org>
	<CAFEAcA_Qp4t7xOrprhhjPSMDiPH5HNkJuVm57AfvTu53ZYOK8w@mail.gmail.com>
In-Reply-To: <CAFEAcA_Qp4t7xOrprhhjPSMDiPH5HNkJuVm57AfvTu53ZYOK8w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jan 2019 18:15:58 +0000
Message-ID: <CAFEAcA8pFrqf61U9gtx0S9N9xC=SYcMz5JhVjdohD8F4YL1oDg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 3/3] target/arm: Use vector minmax expanders
 for aarch32
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
X-TUID: uiidGG8bcGUt

On Tue, 8 Jan 2019 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 6 Jan 2019 at 22:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/translate.c | 25 +++++++++++++++++++------
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/arm/translate.c b/target/arm/translate.c
> > index 33b1860148..f3f172f384 100644
> > --- a/target/arm/translate.c
> > +++ b/target/arm/translate.c
> > @@ -6368,6 +6368,25 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
> >              tcg_gen_gvec_cmp(u ? TCG_COND_GEU : TCG_COND_GE, size,
> >                               rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size);
> >              return 0;
> > +
> > +        case NEON_3R_VMAX:
> > +            if (u) {
> > +                tcg_gen_gvec_umax(size, rd_ofs, rn_ofs, rm_ofs,
> > +                                  vec_size, vec_size);
> > +            } else {
> > +                tcg_gen_gvec_smax(size, rd_ofs, rn_ofs, rm_ofs,
> > +                                  vec_size, vec_size);
> > +            }
> > +            return 0;
> > +        case NEON_3R_VMIN:
> > +            if (u) {
> > +                tcg_gen_gvec_umin(size, rd_ofs, rn_ofs, rm_ofs,
> > +                                  vec_size, vec_size);
> > +            } else {
> > +                tcg_gen_gvec_smin(size, rd_ofs, rn_ofs, rm_ofs,
> > +                                  vec_size, vec_size);
> > +            }
> > +            return 0;
> >          }
> >
> >          if (size == 3) {
> > @@ -6533,12 +6552,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
> >          case NEON_3R_VQRSHL:
> >              GEN_NEON_INTEGER_OP_ENV(qrshl);
> >              break;
> > -        case NEON_3R_VMAX:
> > -            GEN_NEON_INTEGER_OP(max);
> > -            break;
> > -        case NEON_3R_VMIN:
> > -            GEN_NEON_INTEGER_OP(min);
> > -            break;
> >          case NEON_3R_VABD:
> >              GEN_NEON_INTEGER_OP(abd);
> >              break;
> > --
>
> This leaves the helpers neon_max_[su]{8,16} unused and deletable,
> I think? neon_max_[su]32 is used only via the #defines of
> neon_pmax_[su]32 so could be renamed to pmax. Similarly min/pmin.

...but if you wanted to do the cleanup in a followon patch
you can have
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
on this one.

thanks
-- PMM
