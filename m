Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1326992lfr;
        Fri, 9 Apr 2021 02:54:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmS5tothYek16gL+VPttp4lxoD7OEjdR+PWFkCusCW7Vy7XVIBhbj4zT1nrFh7l1dwoxxo
X-Received: by 2002:a25:81c3:: with SMTP id n3mr17010485ybm.420.1617962095011;
        Fri, 09 Apr 2021 02:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617962095; cv=none;
        d=google.com; s=arc-20160816;
        b=PYlynbenAMmemztNP35kbWd2ocn/47c3cKuYQwDO+cfiz3N4sKMS2EDlMSJupGTMgu
         /vzoA5bq/NxiB9jIFIVbzntlE+iBAvu52tj9xUOAj9bFAYxIJf3N7LtpN+Nxq+pvMsjl
         9S+hcwjt/p0hLlaWhUhxd3YDcy7aSKe1MwEB3mkkYXs5E/M1dJxwS5wSwT2eKpLfXKuj
         UMkLp5I6afd2Ac8eEB7I+FYBC0N7o2Rz/zt5NTNl7gdNu21s4fXeYjNQqn2xTM7nAsN8
         xxeChUHaUjHGHzYdVAh34iGuc03dU7k0yT+3Dl+WlpJLqWgiJ0gMqurqGp/VbKGEJxiR
         H/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RxV8qs/mL9BEswU9raH+M466WwQsxLw5LjXS7KMR0uE=;
        b=yzU7+YEcnDBk9fmnFHcpJRp/Hv4k4xQfzUUz8cVsihdrubvbB5BFmpe4G3khmCR+z9
         Q6tAjqpMDXiyEj2bUv0OG1tIYHdoXTIvrs170Yicv6Evy6NZLBy56K5kf/DhbMB5bzVz
         393IehL1e3T5XdGOK+9oU9K+F0+3wuLvfgdbkMUqqie80aPGbJou1oEu9dxE+lP4ae4+
         LNMcR7t4hfaSzbCOukrzLwganB8frE5zt9rxq+SjX/rAsXDi2E664gf1QDqfsNI6q5fx
         mlabOnzaW4xvof/IuKNl9Zkct30R9f2bDSiuG/tXitMYKDN+MuumUaQrJ+fnNr4XJQTC
         NlDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lkBXASXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si2469320ybk.227.2021.04.09.02.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 02:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lkBXASXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUnqo-0007L9-Cz
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 05:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUnpt-0006ov-9M
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:53:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUnpr-00048s-Gl
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:53:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id e7so5806835edu.10
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxV8qs/mL9BEswU9raH+M466WwQsxLw5LjXS7KMR0uE=;
 b=lkBXASXFJCUtt2G6vDr80mjMIooYXUBgjqoRMlGNss9B2iy56zigC6Xxi9fNCnY6f8
 I4fKeStDNGbZMcWUKNsmvYdV4BVy+T13dK/Foo0XAO4YHfFInqkCUUF9t8nCD6ngqfw4
 aVojCzUzr59M0l9+QE7EXZeA2lpbl4jYS1D15OlawS/fEFVe8CuMv6lwFFHv+ywttDpf
 zsBjSaf3IDLDNCF47bVBhmwAwb7sxmhEwpVJ8mqoKbFCrxPcjj0NhSIi1/Cj7Pi4YUs7
 GHTp4g7XMZ6YZ62T4U/8oY23xYa3hTeDUcjcxFIgReOwQFngD9Cqse/HgZiwUBiOa1u2
 jLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxV8qs/mL9BEswU9raH+M466WwQsxLw5LjXS7KMR0uE=;
 b=CrUuqEi6IpnfbCadkL7fyvCE/kiIjhsthk39oyQG2ku6SdnGs24DSbzrOxcaff3ku3
 xN1oIR3EDWShoCtdS61/g3RG27VpjUGGhVNp7/CQYq+xI0sC8jlpCd6Rc3ZHo7m6xXI0
 B0jvegqzbxR1AvpA0JPazmxiKBEJzJZ8t+/+zB+ZnFlCtO7SA3blK9n2t3ksCOKbEFgI
 9OST62+GbB5CKAOIUp2HwBFLNkGMldDoAhpSDdUHC3II7fVEvySd1KUf3hB55DsbWDaP
 zYm4U7N1vA9QW9gnluN012kV5TRkYfG6h4MqPW8qdgp1GEfqms3AOARM81EkigGqqSqN
 OFLg==
X-Gm-Message-State: AOAM53041yhTPyIkZMzawuwUF8gRZLJhufuLLz/rDrihuZnl8c9bicMK
 hsjXxWfMYlirLN4txUCCatPnd+emUt46pRs/MJXGNw==
X-Received: by 2002:aa7:d843:: with SMTP id f3mr11104483eds.52.1617962033914; 
 Fri, 09 Apr 2021 02:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
 <18c76f1b-cba5-8205-b945-bb908d460bf2@linaro.org>
In-Reply-To: <18c76f1b-cba5-8205-b945-bb908d460bf2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 10:53:12 +0100
Message-ID: <CAFEAcA-RztdFMwVvR2NsH0RF9sSMKk0AJPN7xMox0uoFFwvtpg@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] target/arm mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pziawGviQ+2H

On Thu, 8 Apr 2021 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/8/21 5:47 AM, Peter Maydell wrote:
> >> Richard Henderson (12):
> >>    accel/tcg: Preserve PAGE_ANON when changing page permissions
> >>    target/arm: Check PAGE_WRITE_ORG for MTE writeability
> >>    target/arm: Fix mte_checkN
> >>    target/arm: Split out mte_probe_int
> >>    target/arm: Fix unaligned checks for mte_check1, mte_probe1
> >>    test/tcg/aarch64: Add mte-5
> >>    target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
> >>    target/arm: Merge mte_check1, mte_checkN
> >>    target/arm: Rename mte_probe1 to mte_probe
> >>    target/arm: Simplify sve mte checking
> >>    target/arm: Remove log2_esize parameter to gen_mte_checkN
> >>    exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
> >
> > So, what should we do with this series for 6.0 ? We'll be at rc3
> > next week, and this big a change seems risky at this point
> > in the cycle. Is there anything in here that's worth extracting
> > as a for-6.0 change? (maybe patches 1, 2, 12?)
>
> Definitely 12, since that broke BTI.
>
> Patches 1 and 2 are certainly simple enough.
>
> Otherwise... the rest would be nice to have.  It's quite isolated to mte=on.
> If you defer, I guess that's fine too -- the bug report did come in quite late.

OK, I'm going to take 1, 2 and 12 into target-arm.next for 6.0, and we'll
defer the rest. AIUI the bug fixed by the remaining patches is basically
"we didn't do some tag checks we should have done in a corner case of
misaligned accesses that span two differently tagged regions", and I think
that's not a terrible bug to leave in 6.0, compared to the risk of breaking
MTE more seriously while fixing it.

thanks
-- PMM
