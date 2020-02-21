Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1760595lfg;
        Fri, 21 Feb 2020 04:46:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyhUltGKf1NYXd+5DQM/0oaqa1ywGy2nmEUoyxoByDXAssSJirX4qF3D62vLHluUfGpCk9
X-Received: by 2002:a37:a982:: with SMTP id s124mr32417575qke.496.1582289167888;
        Fri, 21 Feb 2020 04:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582289167; cv=none;
        d=google.com; s=arc-20160816;
        b=ETLwDffa2tDgPfAXGQBIq/C5dVEwTFVt248fV91nBdPsefIBHi7fkRu/oghsTfYG99
         kDdATdZBEUe6t42s7KgBB32ndQW8+L3YTbNYKN0cHYicVlXi8fu0naioTLTZNc6JV+b1
         bAT84tg0YPwYrXmX6iZoJ2MJNrrM+2DzL+Hg1CgaIfApBStKIeAAyrgHme08mGoJplk4
         yGUSjoTHpGCU0wGFbM57dMh5oPMdZ8YTsqzvE132HHBNpkEWqAudj5SMsIvFWrEHawrF
         j93z/wXuyDy7y9EfLBHxJLnBAvizXd98tFkj39R/8SYhuortUeSBmOPSDCU5eU0xaaTE
         Zgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Djx9rl/AfYCC77uS8T0Ho/X4cM5kemGxOv/M/pC4lzo=;
        b=tckLh7MLIgjNVLc/UvOdFy2vGrWz+OmIj9CtBSdyt1YBGpyqfBGHxEOVdoLJoAiCVT
         Z81NERCCY3FZnwWp/ob3wNY9sookMwD4nIBrgzrsxaGnFk+Cvuoes5lpAfXkUXz/wLM6
         W3GEwNtwNWZL8IAif0DbwCOkssf9ZhiiqoGy3VuIlLdMJE53dMKXpapeZdPyD24jxnF9
         PpXTNsk8YJ+YLTt7Stv9Fo30OUNQEObCB5sWzUerVp0ZT2cE1tBL9VJBdyt6KfjNq7ic
         ZZwuCopAgu0u446+EWaj5GHQ/yO2zbA/PaxPlqugq6zR+7rc6xLC392dLb+F1RtCmxUQ
         gO3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aoVvETrn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si1286804qvw.80.2020.02.21.04.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 04:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aoVvETrn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j57h1-0006kT-CQ
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 07:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51333)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j57fe-0005xt-Fy
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:44:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j57fd-0008NF-Al
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:44:42 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37625)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j57fd-0008Mx-3n
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:44:41 -0500
Received: by mail-ot1-x342.google.com with SMTP id b3so1868048otp.4
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Djx9rl/AfYCC77uS8T0Ho/X4cM5kemGxOv/M/pC4lzo=;
 b=aoVvETrncyOg8+zBL5ZR9o45GtbY/WcZ2aYe5o54JoQOhuO1Fi4FdoEGXrjMnB+58c
 qjfXF1xczVFLqKOsiflOL4Wo8kNYRjj+4lz5MbxWiGPOaApSztCKlQBTv4vPVn0SsGtO
 ZIWXkc+WIAXuTvTkHGACsy05RxiUyM0OsIw4ALugdGSO92vDspBj2Om5B/wYjkhLexC7
 2BxnswkB9HE3zwHewzfY0d5nIUyF4z3GLqLhkjoUA+DOe4fO8rC9Fn6hdZy66Kpr1eEe
 1oMPlEB6N557OQevrb013wGRBkH5Zqwb03MdOyeWNSelPcHRl2ROz89X7nwWn6quvsJy
 D94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Djx9rl/AfYCC77uS8T0Ho/X4cM5kemGxOv/M/pC4lzo=;
 b=ZtRJcHTPJctnnQhUTzXndvMUWJIu/Dmci6Kf37LwfyOvR1I28hFOpKFHVscMKqSOE7
 Ep8fVSEKucGqr76LIBQzU84ZCiXbz7/fFeawqe4eHYaPDUBj2ZzorTxA+t3XtzhB1tGq
 uFXcznz+8SR/aGuYtQeJ1l9bCVOcta2QbM5tRXcxtRxYO0jQ4dlW+ZjfcdXooQB7ly7g
 ppeqeDEhBeV8O3YbkAfHUeuERUoO1RjFUc7BEh/m/jSIyMYmM+RzYpBnLtKA/zQ9VSd9
 Vb/rmdaC//J0iqFJsHCq6seg404hk/bdnftPUCfwTEYNVcM3sGp1Ojih2BS2tMQ6nC+h
 254A==
X-Gm-Message-State: APjAAAUdAUjoGFP9Z7EhxwVeLcutEsbdGwgNu74WeHLPF8WbfBGXhQiw
 FOcG61xKgWKfothA8vtLi5rgasEu473mheLaKyC4pg==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr28281012ota.232.1582289080384; 
 Fri, 21 Feb 2020 04:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
In-Reply-To: <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 12:44:29 +0000
Message-ID: <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 34/bjQOwOdlq

On Fri, 21 Feb 2020 at 11:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 21/02/20 11:21, Peter Maydell wrote:
> > Before you do that, I would suggest investigating:
> >  * is this a problem we've already had on x86 and that there is a
> >    standard solution for
> Disconnected sockets always lose data (see tcp_chr_write in
> chardev/char-socket.c).
>
> For connected sockets, 8250 does at most 4 retries (each retry is
> triggered by POLLOUT|POLLHUP).  After these four retries the output
> chardev is considered broken, just like in Gavin's patch, and only a
> reset will restart the output.
>
> >  * should this be applicable to more than just the socket chardev?
> >    What's special about the socket chardev?
>
> For 8250 there's no difference between socket and everything else.

Interesting, I didn't know our 8250 emulation had this
retry-and-drop-data logic. Is it feasible to put it into
the chardev layer instead, so that every serial device
can get it without having to manually implement it?

thanks
-- PMM
