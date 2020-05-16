Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1358048lfb;
        Sat, 16 May 2020 05:59:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWoTfAuPnhMP6W5yvehwdGGvFtyr1LSPQN0jJPJQqkZaYH96KFztrEqIF+qxPKs5opdU0a
X-Received: by 2002:aed:2c41:: with SMTP id f59mr8204547qtd.123.1589633987399;
        Sat, 16 May 2020 05:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589633987; cv=none;
        d=google.com; s=arc-20160816;
        b=tRXjuioef6HzyQZyjZ8buvSuhySJmgOQ1IbD0sJ9lr9YllIG4OLzIJGWoRjQ9Lr7vU
         P1oi65332IzhMkDPp75KMYmiDnzkJrlYM/+cmC5yQv0QLXUobaok3PyL48TZ+7yrw4Tk
         jiYGn1rhcs3GdLlPVFXw8m0g0fqXhpsGOXk9js0hi807qZAJVy+IhmzMTLflBno2wZx+
         s7i65sE7SpRiV7cpxymOk5mHaMv+55uqR5CxJwXeDHWOPCH2LsUIGZoKYpdbvvN93cej
         2mymxZqpR96iElJQx1QlR+KcqLHx9SXQkigHc+5kWEwOcA+l3HQLKTl03hr49IXCI6Pj
         ggqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSDwTdglGBcUiYcwrNq87h8MezYP0RC9lNzjM6ntXVU=;
        b=LsRGRQh+mwMegwJBbW0gXyHx3yEDQKYYWd2GUjt15MxQ2c711iCv1V8XH27QK1trNB
         DSdE1WtSAGLlLSfbSDqRCLWCbhKVEXVmCRR+O/H5PHc9t1sUS65Os18T4F0JyhZzmeMG
         C0IwwCf3v+u562lM4/2RdicPQXTzlykb35ZwVMeXr1tIlAVtfJbO/FzrVZ9wDqu/WGia
         skkIPiYn90jCgLjKfTRJ/0ejWuktBKge1wZi+GRDje+p8pP7FPSWf6XQvruZOVK/b/st
         nbEEagDrFuso6CV/lFHm1ku0Y8wyx9AOusBBmwBQ+SfH7Mh+tzZfpQeiWT3BD4X84M+/
         jXLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LUxsuTvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b74si2811490qkg.133.2020.05.16.05.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 May 2020 05:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LUxsuTvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZwPq-0003f4-Rb
	for alex.bennee@linaro.org; Sat, 16 May 2020 08:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZwPE-0003Fd-OY
 for qemu-arm@nongnu.org; Sat, 16 May 2020 08:59:08 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZwPD-0005mw-NH
 for qemu-arm@nongnu.org; Sat, 16 May 2020 08:59:08 -0400
Received: by mail-oi1-x242.google.com with SMTP id x7so4854687oic.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2020 05:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CSDwTdglGBcUiYcwrNq87h8MezYP0RC9lNzjM6ntXVU=;
 b=LUxsuTvVLD/MdWWCaLu4Rz1+WSCXq4oJazspQb3vBNydVQVLjrXTdKmRkNno+ej3r4
 msp4bpjf8S8CcZlVI9CQbzZvnHSLZhyANMwL8wk/k0id413WVd4QDxoIfsRFNtbPnByw
 ycm+4CVat+Mla1QTn26+nMV8o6xJ3XJMPTz4bJkqTH85YlsfvwRKaxkcwSpiCUfR2IzJ
 p5MbbuA3Wz5HXgWGc/bHQ0bG0SX7wSabClJb3FaoV5sJNGzg7rpABU4Iofr7eyQiDDg9
 i0bW62PMrkCbyOw52r8wU3jGrvkHHN08rG86uS0A4jC09HiILlEM9C/IqOTJarJnOR+R
 5fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CSDwTdglGBcUiYcwrNq87h8MezYP0RC9lNzjM6ntXVU=;
 b=bGUq7FuJnVyyRLSMhermfwgs4Ldob9rxu55MCi1fjMJZzPVJVrWrJ+Up1AIm7BJqu6
 eJ09yIWufHE/sdzY7llnMODVjqYSA9KCl6k7+0ABxhkldlVmNHyEzpAGoMZgFL1ZR0cG
 LfcHCJFQtWw0GehfWfAkQ2l673iGQNWgz5yYDI1gjjfVd2BnPyZlDPkp5n5TJI0crjrP
 qtRdB7QZEqEaP+iEdYktkkfA78RnhWoa3piq+/2Pv7WgdIDx6AuWmShjd0SHN6LWypPo
 CdK8AVnCxw+Wp+mk3U40xuaMZqf/8j1hqJTmqnCT9BYESWnJIMdCIlL/Vj2V7vrRSiJ8
 UcYg==
X-Gm-Message-State: AOAM533KEvPqIrB00DT2TdV5lkyWlRLKJnzKMz+Fm+p/t09ASdPk9rJY
 2wOzOs9qIA/wiMf65v+XXdiTlz0Lz73/cl7ISr2nwA==
X-Received: by 2002:a54:400c:: with SMTP id x12mr5042216oie.146.1589633942694; 
 Sat, 16 May 2020 05:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200507202429.1643202-1-amanieu@gmail.com>
 <CAFEAcA-n8-pOcwovsS1Z3T4AMa1Nueo2yik9zX5H16QAHeE05A@mail.gmail.com>
 <CA+y5pbSueV8HQKQEZnBS4DvOvMDXUY7HMaODNhY7v-fKkJJPYw@mail.gmail.com>
 <CAFEAcA8etD+V3KrCFwvqfDuZ0x4_cW-RN423WG13iVpJBRvq4g@mail.gmail.com>
 <47fd7f16-a7ed-e3ee-9a97-b2b21f43e7b7@linaro.org>
In-Reply-To: <47fd7f16-a7ed-e3ee-9a97-b2b21f43e7b7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 May 2020 13:58:51 +0100
Message-ID: <CAFEAcA_5_98BZfTbdLTR75w=qdOVVKra3eCM0YKX_gUEJSfkkw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 Amanieu d'Antras <amanieu@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+g3/r1TyPp/

On Sat, 16 May 2020 at 05:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/15/20 2:25 PM, Peter Maydell wrote:
> >> You also need to call arm_rebuild_hflags() after modifying CPSR_E
> >> otherwise the change doesn't take effect.
> >
> > Hmm. I was expecting cpsr_write() to take care of that if we
> > updated a cpsr flag that was in the hflags, but it looks like
> > the rebuild_hflags() is in the HELPER() wrapper but not in
> > cpsr_write() itself. Richard, does anything go wrong if
> > cpsr_write() proper does the hflags rebuild ?
>
> We wind up rebuilding hflags multiple times, is all.
>
> Most of the time we call cpsr_write we also do something else that also
> requires a rebuild.  So we do it once after all updates.

The downside is that it leaves a trap which makes it really
easy to introduce bugs where hflags aren't rebuilt: as
a caller of cpsr_write() I don't really want to have to
care which cpsr flags happen to be in the hflags or not,
and it's particularly awkward that simply fixing which
flags belong in CPSR_USER suddenly means that a call
that happened to be OK before is now buggy.

thanks
-- PMM
