Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5612233lff;
        Tue, 10 Dec 2019 02:29:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXmpg6zNkcZqNJFljStI4XAldGrx1S//wlVFlr/tWgxLXNFWKxdPS1NwbeIiWF5XWCYZOo
X-Received: by 2002:a05:6830:1d7a:: with SMTP id l26mr18582309oti.138.1575973785621;
        Tue, 10 Dec 2019 02:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575973785; cv=none;
        d=google.com; s=arc-20160816;
        b=LjM52dAb9w/v/2cVGxMvyM+54FUGPCfiSr6SD0pMo5oCjJmse69Y7IZmSIWXF84qHG
         5YIn1R1iksw+DKKfCPVqZKXYLLOnxXEnzUKRYcrkPaDdPwUsfJ1Z48W5MW3BdYu5WCGS
         lndQIaDpVjSvWhEmXdrvQOYTAm5VcwXaC8Lycfb4RVxCjKGLZ5d/bgZxy9paQIi/d8Eg
         D+sp3QDm6u4ckFPMkiZeUqV8dyuveCXVJlq+3j1kO1fc9NU9YH75Nb+FcVNhhpHTO6oV
         ix59CVszdERFyc9tbyDtHhmMAikfgtVi2VJzD704+941da3u9sfmlOOvf5csCnr5XnJk
         leGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ti24g5Ml8cfyB8YPNcyhO9AecXFyWAWKkXXMl7FXl00=;
        b=A4xbt16WsipuKkcQTtWqwtxx4NldkhLwSgNr/H73qUPMv4jyW8cs8jmLT9e1aHLjNs
         kJYh5WTjCQ0NF73ywWwK8M2k2H13dCwIXuihTmNoPZOqDCxzRSc5uQLg2zfJQZ453jxU
         6Qmbn2B2Yf8U3nEe+uPIQSAvwOQHKtIESvwtbeqxlJcF1GLb/MPSQaNzH+BiZBo0e80t
         bOL4xMpkMmOkI57Y76+xYp/itG+AH8YW/BTQFZSjm6eS3/LMt+DuPIHX9jpy63ap1Yrc
         krtX/P0nLCiTaNW3YtosGgOgc1sI1C0zLlDM5eJcbvsS/AxqviwKI+RBrwYqRFK+C0pc
         ZMeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wjwluSQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si1670446oii.60.2019.12.10.02.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 02:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wjwluSQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iecm0-0000hw-Re
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 05:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iecls-0000go-5a
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 05:29:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieclr-0005qS-1U
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 05:29:36 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieclq-0005q9-Rv
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 05:29:34 -0500
Received: by mail-oi1-x244.google.com with SMTP id x195so9339170oix.4
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 02:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ti24g5Ml8cfyB8YPNcyhO9AecXFyWAWKkXXMl7FXl00=;
 b=wjwluSQ1qNM2r8wY1O0DiAsyN6DHzdrop036iklOQCL7dzWdo29Cj8x1Ol/AtaHO5/
 +9kRzICtxLb+WThzB/a65Sk6undmRl5SSUI+DbnhdwVvhtzDmikD+DKi72BaXdgLF0ge
 D2D5j5bB1wHy9IeXZ9IGPYZh8A+BGQlE/9LMIATDsHXTA1wNiLevnalEOoW9LKbTGwF3
 kEIHx/vH1mDTMaRaCK9ZF4yB49D2t/8J+39O9CrhgIaNgzcWe4RZqBvrugCBq3ADCzT1
 ydCdq156Nql2O7q0wriHO2zpNXbZt7nPSUKJoihE5Hj33YLDgPypt+LlBWfx0ryokIXC
 dV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ti24g5Ml8cfyB8YPNcyhO9AecXFyWAWKkXXMl7FXl00=;
 b=shv1QGG/tltRc7E4zG3e2jHHjzjNdAe/aJ4zkmZnOxfBwWP605zpMndM29Z8CSGTqS
 Rp+KkHZs+SZQLAneZTmfR5ZIg3efdEjZHRwPhgF/IA0SHcskeiJTPEWSXb3bHvl5aBy7
 sZSUiQn6siqKCbkYaSHXKRrpAkX0FGioSyXHWtTnzYZxp7vGlAcT/mAfbRzwL68TPHUP
 gYsa+GC8z3S0IEsDXvtUJdBpW4v1tGOuRiRLbmy7xgHDoW8rmqkIeX6kPiN9DBle6yIj
 Bjxd50Q6rJyMejuCSZ8QqaMg72cBhxvoNCc8bPRcMzTU7cUH9R22Q9mIasiSCAA8EJzi
 GlSg==
X-Gm-Message-State: APjAAAV5TCzIuaqDm/A/emg4d96Az+M45LmtoAMI93qrrABMd6dKxvfk
 odiUAHeuv2d3M06jf0qY6C0awZR4YtjYHgmN++KRdw==
X-Received: by 2002:a05:6808:996:: with SMTP id
 a22mr3143457oic.146.1575973773941; 
 Tue, 10 Dec 2019 02:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20191016143410.5023-1-drjones@redhat.com>
 <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
In-Reply-To: <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 10:29:22 +0000
Message-ID: <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Andrew Jones <drjones@redhat.com>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vskg8PTYYJ2

On Tue, 10 Dec 2019 at 09:51, Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Fri, 2019-12-06 at 16:53 +0100, Andrew Jones wrote:
> > On Fri, Dec 06, 2019 at 03:22:58PM +0000, Peter Maydell wrote:
> > > On Wed, 16 Oct 2019 at 15:34, Andrew Jones <drjones@redhat.com> wrote:
> > > > This series is inspired by a series[1] posted by Bijan Mottahedeh about
> > > > a year ago.  The problem described in the cover letter of [1] is easily
> > > > reproducible and some users would like to have the option to avoid it.
> > > > However the solution, which is to adjust the virtual counter offset each
> > > > time the VM transitions to the running state, introduces a different
> > > > problem, which is that the virtual and physical counters diverge.  As
> > > > described in the cover letter of [1] this divergence is easily observed
> > > > when comparing the output of `date` and `hwclock` after suspending the
> > > > guest, waiting a while, and then resuming it.  Because this different
> > > > problem may actually be worse for some users, unlike [1], the series
> > > > posted here makes the virtual counter offset adjustment optional and not
> > > > even enabled by default.  Besides the adjustment being optional, this
> > > > series approaches the needed changes differently to apply them in more
> > > > appropriate locations.  Finally, unlike [1], this series doesn't attempt
> > > > to measure "pause time" itself.  Simply using QEMU_CLOCK_VIRTUAL, which
> > > > only ticks when the VM is not stopped, is sufficient.
> > >
> > > So I guess my overall question is "what is the x86 solution to
> > > this problem, and why is this all arm-specific?" It would also
> >
> > x86 adjusts the counter offset by default, and I don't think there's any
> > way to turn that behavior off. I think it's too late to follow that
> > default for arm, but this series provides a way to opt into the same
> > behavior.
>
> My understanding is that turning kvm-adjvtime either on or off
> results in a different set of advantages and drawbacks, with neither
> begin a one-size-fits-all solution. So it's good that we offer a way
> for the user to pick one or the other based on their specific needs.

If this is the case, shouldn't we be looking at having the
option exist for all architectures, not just arm? Obviously
pre-existing behaviour would imply having the default have
to differ for some archs/machines.

thanks
-- PMM
