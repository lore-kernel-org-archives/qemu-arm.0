Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp820474lfl;
        Thu, 20 Jan 2022 11:17:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye+SfvRO7NJ1vdoFBkmgSKPZ57S0CixxTcnZ7dRkBK6h4EfwIRh3J0Y0M8D4YKk5xQyjxk
X-Received: by 2002:a25:7e46:: with SMTP id z67mr704624ybc.595.1642706245599;
        Thu, 20 Jan 2022 11:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642706245; cv=none;
        d=google.com; s=arc-20160816;
        b=Uy0DG3oyBeZCu3eepwparDNi8q8lodrdBwK0QZCcYQk+Iq3FBMa8zkMn7cpNDVdSet
         Te4vmMPmcWqJscZ4pCm6+F6l5Bi9OtDbkVpKXQzpDS6TNImSeU3TJ2Qn0lBxkwDvtkoF
         0Sd7emnhW5dFDGpElg96Gy1OSi0ENHhooLY4M8j4TPRPunRB0grERBAIXJCtJY7xx8P+
         MBb+NPMq0OoRUNg9EvCJJtO2xdAWokFnbaEj/UBsSux8jlnFhW4FcZHEDLYRwqa72T9h
         Hj/AT/i22gWajxEr033hszycnB/Kexy/Wx3YMqS5hmyfHcLno6seVWq65bKV1iH1r4vy
         x60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RgRyEsErmpFPfkH/P7s/6kF8LwjDTQUfQLuqwdBKRm0=;
        b=MqhNVyDhX52CoEWA7FSuLMJgViCkKan12bU4nJYuYXDIJiFsuIPxBv1/serOr+kMMh
         kbPKN/qzoo2E/ql5u8CwFcaxItaL83ssAdiKaQJ3n2ZZj7r4VcVWAZG9FCw1oUuzehrz
         bEtrYGGqRGSSdBQoZDh/2PEfdJmpQLR0Lb+o4IsoSz7DBQf2hkIGfdq37jjphQCtZbOW
         dcgesOcJENQOu8I6snoXcHsOOYFhhYMrXGRWkAUVDFDj/vJ/SRAGg7k3gHWJyRlkjq9B
         kthFBm0FkZfK9/B7Q4r3u1RgqE6nPo8oD7OKo6yX/v2tGm96rglXtA46TV2K7L+KmKK5
         hirQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jF898bbQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si4259185ybb.781.2022.01.20.11.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 11:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jF898bbQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAcw1-0006LY-0G
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 14:17:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAYFg-0002LB-9h
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:17:25 -0500
Received: from [2a00:1450:4864:20::32d] (port=43950
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAYFL-0001nm-Cu
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:17:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so14112642wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgRyEsErmpFPfkH/P7s/6kF8LwjDTQUfQLuqwdBKRm0=;
 b=jF898bbQHaSZSD22iFNWelpnu2fw3+Edm2ch8RUTvGNV/gb+Q5mqMb04ExO+Fk8oDh
 ro8Ul1Kqie2eaVIh1Iug+bDwXqG/YOM2IyGzkdLYIAlE+CnnqTvHU4REWG22X+/3vTP9
 8Ra5JOpcObQcO0HVxZpUK/PXkWGatga65YAZKpfT3NI7IJh0oaYVagqQ1fg8WmI/p5BM
 z9yUJ+FZEtbSJL6TwXf+c/q/4NRricx/PxyAUDPwBHBIMQnw260nHKAWEcrPoZVUE9FH
 4XwYMmbURbwk3kTezamLp6IugEFMNhIcveBIIRTRKCKCy2vEdTsrB8dbVAskOd+ulF41
 2+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgRyEsErmpFPfkH/P7s/6kF8LwjDTQUfQLuqwdBKRm0=;
 b=tfL56tKAF00kmE4VjT44fJ4cM+ZV+LgSqMhwiz1h3qlzQKPUy5U4SlqfuaoH5w5U2h
 VsbSYzjK/pF3XEzMuxFhjA0srhy3xTdfi/a5RipTL+uwFtgiZKAD8/iaUSyCIM1JA3D9
 FgIDARt4wodNDEZnlxnX1jBxJsvFvwuEaopmwmE1SUs9c447uvns7ksTyPZ2GhHOIrYm
 6j1tm7OTEi1s1T4wdLBS/fdSctqfQeC/E/Ppw6JDtkQoZjcnO1id8zlUOi1ROEdkQex4
 TA5uL9ZmHsng9MH6hwejYcA2rxv3+wJDxbVD9VWw/nE9ki9vvyZ/tYRyV8jwD9WOgL6+
 u9Cw==
X-Gm-Message-State: AOAM5305qTmQwwwlq7UrcS83nc2EyO+yac+Xa00x/p7CitsVRvW7Q8zl
 hdcrDf/NmG2HBQenbmRT9gviD4AGpyG2kEHMp6ClaA==
X-Received: by 2002:adf:bb52:: with SMTP id x18mr3930484wrg.319.1642688216176; 
 Thu, 20 Jan 2022 06:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
 <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
 <CA+4MfE+nh4LRAbmT2GnNiZWTU=xfmkReNWWTgOhqWLddXdV_hQ@mail.gmail.com>
 <CAFEAcA-MnRazq5GNZSbK_a_LmF3F4dcaJWadR9ni6JeS9wPhug@mail.gmail.com>
 <CA+4MfE+EGpnXn5WHwCgT+-bE7u7ZOdNqK2bjenuheoskFZqSMw@mail.gmail.com>
In-Reply-To: <CA+4MfE+EGpnXn5WHwCgT+-bE7u7ZOdNqK2bjenuheoskFZqSMw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 14:16:45 +0000
Message-ID: <CAFEAcA-Vdhh-soGuQfUh0kB0SJovKa9BPbHSRC6wHsU8gDczTA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /LzhPhF5t5Z0

On Thu, 20 Jan 2022 at 13:25, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> On Thu, 20 Jan 2022 at 14:32, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> >
> > But the code you are effectively removing is never executed
> > for the instructions where you're changing the access function.
> > If you're proposing this as a performance improvement, can
> > you provide before-and-after benchmarks demonstrating that
> > improvement ?
> >
>
> I wanted to say that in my micro-benchmark of DC IVAC I saw a 1%
> decrease in runtime, but I failed to replicate it again now, so I must
> have accidentally ran it together with one of my other patches last
> time.
> Sorry for wasting your time with the review.

No worries.

Incidentally, it's not surprising that if you microbenchmark
the cache instructions the trap-checking appears as a large
component of it -- for QEMU cache ops are NOPs so trap checking
is the *only* thing that the instruction has to do. It's probably
worth looking at benchmarks of real workloads to try to identify
whether any particular instruction is a significant component
before spending much time on trying to improve its performance.

-- PMM
