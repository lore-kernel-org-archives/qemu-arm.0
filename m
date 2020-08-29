Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2280213lfc;
        Sat, 29 Aug 2020 06:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWWTQZk4TJrpy5RHJiy5eqQFzBKK42a3oOf0l/TnmRMt42Senbqvad8K5qIk8Afg3cQT8H
X-Received: by 2002:a05:6902:4c6:: with SMTP id v6mr8367272ybs.499.1598709240188;
        Sat, 29 Aug 2020 06:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598709240; cv=none;
        d=google.com; s=arc-20160816;
        b=aZ5DE/ODEEFzRMwJZPZ3u5SUcwNJXa9zHIwwiZmhUysl70uKydoC2siH22P2UD3Zhf
         pWOWfr8ZQ0IlMxillVSTfRib8ice6OLEGukmfUn2DiwJ//1gCPBxcd2LTHFm94eusDSP
         f/Kt7H0aRMMwWvZfA6lBFZGWcJG7YeSjeQsy2qjYAhMXlivSBbAjDNmR1lycn2NVJcIH
         5yeIVJ5J/7Bg724fjpXFU8s+fI3spBzKcKSlrheAdWa0FN/FrdPFMafUMim9ugE1tsSu
         ffo53N2juCbaHly3eT2Nl3BhMlr591fpstWwUAQr9MW//LPnBjsG/sHmRBhLEJVW8Qkg
         bTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6X2MaBJ21+Alc6ewEhKXjcC4MPw0rJP61ITVoGTwtgw=;
        b=O5gilpsSOlxrGyUbWzBu+exuDF2f0k1YbJJOZczQzpbihSWq/YvZj4bE0mjxJFZwas
         Ygzrftf9FjQyTKdSQVfJ0a0TtSFjNx9uP3pvW6fcAPDF9txVWZ169p5qE3BWyH0se8Mq
         wOCdWJVLFOAGkVbc1eJD5k+A+A13zEpZ6zx40ELqzbGGWlc3ArrXWokkOzpzbGLpAdM5
         Ya6wpm2LQQCIgabJwjiPxtOMjLwjiFu/7MjAICIaNKDngQTUFXaJpJVn67v6ySOVHWYl
         jFYYeDsSvAITW0HjMGxnY/zqqDVarLy2YKHKXa2SAk/uXrQ9RH65j1poC/5jzkSeChd1
         gHIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYopsqdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i199si2043191yba.137.2020.08.29.06.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Aug 2020 06:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYopsqdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kC1It-0008M0-Jx
	for alex.bennee@linaro.org; Sat, 29 Aug 2020 09:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kC1IG-0007eP-V1
 for qemu-arm@nongnu.org; Sat, 29 Aug 2020 09:53:20 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kC1IF-0003Ev-Ck
 for qemu-arm@nongnu.org; Sat, 29 Aug 2020 09:53:20 -0400
Received: by mail-ed1-x542.google.com with SMTP id b2so1578863edw.5
 for <qemu-arm@nongnu.org>; Sat, 29 Aug 2020 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6X2MaBJ21+Alc6ewEhKXjcC4MPw0rJP61ITVoGTwtgw=;
 b=NYopsqdApAaWgO6PWSUHCdlZlE+1KKRrbraTStJBPx88LtRij+ppawAONSQXPUjdvt
 dW4uozf2S7AQIeTkiWYlUOl7tPFq7OaBU3L4wi1aWWzbnIbt+qh73qpOrI0PEOsmbEe/
 RsSumMpbz6m5O3bIPt8k/t6bacX2Pzd5CiqSe8dxBC3Svs8Efgp7BCAyIkS8WsSRdwHB
 xnEaM9E7xw7xC0H5+2HzI04X7j74tBikW5lQK3DJm2D3M0zGpfKdozKkyONtZDOTylXn
 w6b1CwlZPoM/szHtYhpNlSBeq1M9fd3G3uudyIJb7M4M5pE8RS10OHLLo+hFoqkU4zw5
 CWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6X2MaBJ21+Alc6ewEhKXjcC4MPw0rJP61ITVoGTwtgw=;
 b=mPG36IwVJtRHSYsNQ9QQijxDUv3KDl9qmf9PvwNA9OH9j4eVSucLCnanrogO67AV+C
 0Fqzxf5vhG063xHftriVy8TnxSeLunezFfK77KCb8wWclDqBs5qAaJBboWji15phx0P6
 Fi9nbAMh2U+v9FeRHGw4y/xwAnXgy24dxxhWvgNqSBuY4OzDnfK5igKauiKrMfnjslm7
 lhAT63XCROMa6uMIqkbE4dVcqhpI5qKK60+T9XyDKkFQLUrTVpI/TB/hB7m+0tAwcxQE
 8IlQvu/6LibsBBgao1DDFB1ip+2IFABZkmebOiCvhn7RmU3lYwZoUQnZjnZDkirgGKL5
 i5fQ==
X-Gm-Message-State: AOAM531wxN2roJVEKdTmvyNnKi66nLbDxMffL8SlcZvT7+0TjIof1zyh
 0XbKHcwuBS4PL8JuADYipmmP9zMv+pzT9X4t4GL/Sg==
X-Received: by 2002:a50:da44:: with SMTP id a4mr3619638edk.36.1598709198143;
 Sat, 29 Aug 2020 06:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
 <55675521-a61c-186c-599f-7373e9165184@linaro.org>
 <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
 <2007993d-9f64-dca5-5fd9-510c87cd8e86@linaro.org>
In-Reply-To: <2007993d-9f64-dca5-5fd9-510c87cd8e86@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Aug 2020 14:53:07 +0100
Message-ID: <CAFEAcA8cEF4s8E5k=eKs8u3hRqWKDgSwe5yA+c+uVXnCt4ixBg@mail.gmail.com>
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FqsFjMo1iZp1

On Fri, 28 Aug 2020 at 23:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/28/20 2:40 PM, Peter Maydell wrote:
> > The other approach would be to standardize on "the decodetree pattern
> > always converts the size to the data-type size, regardless of how
> > it's encoded in the insn fields", and then you could check against
> > MO_16 here. Would that be better ?
>
> That might be clearer, yes.  Otherwise it's hard to tell what "size" means
> without looking at the manual for each instance.

Do you mind if I do that as a separate patchset after this one?
I feel that will be easier than trying to weave the change into
this series...

-- PMM
