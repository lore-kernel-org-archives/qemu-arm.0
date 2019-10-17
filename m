Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1270468wrm;
        Thu, 17 Oct 2019 10:44:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoeseGtdqa09p9P1aTV1HokSKgU+Mec+4lOeRnl5kEIO5IMXannyiOROe1MOcC+SFqfJCi
X-Received: by 2002:aed:25a7:: with SMTP id x36mr5108555qtc.109.1571334288389;
        Thu, 17 Oct 2019 10:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571334288; cv=none;
        d=google.com; s=arc-20160816;
        b=eThpyCa7iWfSkmHPCNYGQ4SOJGjMWk3lKUtD9NzP0WOcXSD9fUzOcGpJJxK5lXrXqn
         sMmgqBl7hB4IahviqdyzFWdQK8tZIRBpUNym7XVdeNIFKcN+ap0pxDU8iIydFetm1aoF
         Ifr7X2xtIsrx75IX7qV2UitckJzI+iC4ZeBqjw90Aa0lAT3eLAdilFbs4bC7XkEWtj2p
         Rrlia5Rht0awROcYE+ztXeYzyKXiuxsaXsszFTq2rgvWaisPObLMMQcY6sgpYOSb1ZZ/
         yb0ZiFOMtM0qzKWIrrOP5PhiR23ipZNl8UmxRrLYuLiEAYjRsPCP8InoTErcmtAqNsXr
         B82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xHx0j42+dszKfXOAWKZcC/s62cmj3o+j92PtFulr3U=;
        b=rvr6r+qv9EbL9NONcAxj8UujTbyEkUAV2AzOCvLqRZMlFwR2VRarz4yM8wNOOzgjt5
         +vFC0nsdx4amcufFHxYJMRFU1ChsLYp+nj5wTAM/nYZ17AnuezM6WpHNeD7+B4JVcbrw
         aSidzsPcz6oZgQYOgcFxQ2XGSSy6dBj+4pG3rMahNTxuR/ylNRXYXaeO0ums66qHLKfc
         MqLVDfjQIWtCZNDN3HG05ORQWxKzNUfWwABNpALIXH0A78pgGtgXitmGRIr9lPJPa1Uj
         91c/elyEoipqHOmG7fA6nS4iuH3AvRypAlGFKK4LIXWTmVJgP1RhSZne1LfcGuqIzfxp
         r5eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zGDs7B2E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o28si2140064qtt.306.2019.10.17.10.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 10:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zGDs7B2E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL9pP-0001Zd-NI
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 13:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL9A4-0003jP-1h
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 13:02:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL9A2-00010L-IY
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 13:02:03 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40277)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL9A2-000106-Dt
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 13:02:02 -0400
Received: by mail-ot1-x341.google.com with SMTP id y39so2511962ota.7
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9xHx0j42+dszKfXOAWKZcC/s62cmj3o+j92PtFulr3U=;
 b=zGDs7B2EOmdJxseG6U49S0CBXjwuVeXqnhN76ZrB19oW6M5OLTaD8BPRn0arFasfny
 Bvw63QrdlkoZb4+qdbQuI5BzrVwnEVDPOuMBfdECIoSWlxF4gWiU4qSlJsNSio9oB6zy
 xzk69iGeuwrS2ieLkrM5ibny4XxrbXchJGvvBYMMFHCB8NFBC3kT98l8KcGdDJY1msp/
 A4QXyDyd3FQtZ4DDMB05RVBqeG8KFPgeSa4+iakLwW0l4L/c407t5CDtOirTGPR9M3p6
 MOL0liFPnW8khU5D2THFabW0kOeUkMgwA/UP9+1TEyGjEUn6xcyQCj1U74KFyJal1Phh
 aRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xHx0j42+dszKfXOAWKZcC/s62cmj3o+j92PtFulr3U=;
 b=uUMVOFF1QqcqaaBIJEvjwaHlaJb28xFiRmuqDEltgRP3S+GwpMBlXXG0GomL45RBfr
 VU2qvzUX1js4+E8GKF1yaKKsvqAQvK6o2ygG+DIRSjUPT/nPMjvF05xOuRjY2+6TFJBv
 sK+IkwF/Np+gMsWM+ktIVxGwoEEWujAlEUo+oXczlZl4499NtpU4vUM8FEcAv6tUst0b
 fp2QyboMG8fSdG4HPpyc37ZekFvEJRj6xVO9/YDdRC0Razjrdy5xhfP6BwEaI6b3XSks
 Hinh++c0Ge1KVk1VMMiYPphSCqqSkwfxt5rU1Fu5UyxniA5xsHsRRTvFMB52yqrt5IRK
 jBaA==
X-Gm-Message-State: APjAAAUgu1fxASDEZs8X7tPG8nIrcV5pTmoIq4bfdQAgWh8fMrzqFhUQ
 07jI9xd9c1b+LGRFF7n/7I0Y069x64gNS8P0ce1Phw==
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr3987220otg.91.1571331721491;
 Thu, 17 Oct 2019 10:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <CAFEAcA_fmQKOk8k=Mo7MvuKvAq9Zb90xtQ0RdaxyMdLGZUwY0Q@mail.gmail.com>
 <a130df8a-5804-09a6-966c-2760b50a84c2@linaro.org>
In-Reply-To: <a130df8a-5804-09a6-966c-2760b50a84c2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 18:01:49 +0100
Message-ID: <CAFEAcA9+ryfqCzvOWagViFZw0HD9ngCpqXcd1xUktoaAHQbkOQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/20] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EqTY3Jb/7mFL

On Thu, 17 Oct 2019 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/17/19 8:26 AM, Peter Maydell wrote:
> > Don't we also need to do something to rebuild the hflags
> > for M-profile writes to the memory mapped system registers?
> > For instance rebuild_hflags_m32() bakes in state which
> > cares about env->v7m.ccr, which is set via nvic_writel(),
> > but I don't see anything whereby the write to the NVIC
> > register triggers a rebuild of the hflags value. Maybe I
> > missed it?
>
> How do you end the TB after nvic_writel(), so that the new behaviour can be
> noticed right now?  We can call arm_rebuild_hflags() within nvic_writel(), but
> it still needs to be recognized somehow.  I would expect to place one rebuild
> in the place you end the TB...

To copy my reply from irc, just for the record:

we don't end the TB specifically after a write to the NVIC.
This is permitted by the architecture: rules R_BMLS and R_WQQB from
DDI05533B.h v8M Arm ARM:

# R_BMLS The side effects of any access to the SCS that performs
# a context-altering operation take effect when the access
# completes. A DSB instruction can be used to guarantee completion
# of a previous SCS access.
#
# R_WQQB A context synchronization event guarantees that the side
# effects of a previous SCS access are visible to all instructions
# in program order following the context synchronization event.

A context synchronization event is basically an ISB or an
exception entry/exit. Since we do end the TLB on an ISB
or exception entry/exit I think we're within the architectural
rules, but we do need to do a rebuild-hflags somewhere.
At the end of  nvic_sysreg_write() seems like the best place as
it means that QEMU is internally consistent and not likely to
trip over itself.

thanks
-- PMM
