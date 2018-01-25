Received: by 10.28.71.27 with SMTP id u27csp1755691wma;
        Thu, 25 Jan 2018 03:42:15 -0800 (PST)
X-Google-Smtp-Source: AH8x227tIAmRSXXKvH7Rrb34UH5cmiRzYqrGBhGZ7Y+uJBsVp+ejvZwEq9jhu/c42HqTb6Xu9uSm
X-Received: by 10.129.130.196 with SMTP id s187mr7916522ywf.101.1516880535344;
        Thu, 25 Jan 2018 03:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516880535; cv=none;
        d=google.com; s=arc-20160816;
        b=bDP4HgbH4q5RAta3k5gu9GEKs42wlHBk26eLFGtGppfxVSUEUSSdTlNJj1liUzPq3s
         vISTNEFwelycE/E6RRLT5niXf6RrOMnivgLMP0ttPWk9u4P3SeqPCp6m5QxQ9GkAwY6A
         GUmem1S74VobS2pcPqcuNwD6we7Mq/ZQfJLd56ut2AGVwgcHrYfRjyBsOGwNqPHSZ2j0
         t4KzyeD9hKCtHDyVS2wwo2o2owTryhoH2W2HgeWT5oCv6dhqkbD5Xg6hFnKdp7K2v2/k
         BHH98k+5vtSd0dNhNiHmMD2/nhnswQ6KxTBjTU7U8mcVKWUbZjQu7JFREInnJthe0cxy
         Zo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qWj3rHmgnncWQmJUZP4gGaNJyiAbYG1w8M68Zt99aoM=;
        b=b2PfvPPSvPRGtr3TKVWc71a9YbLkHjOTD+hUa4lbK+Iryt+BRJ//qoHZhMycK7mvkx
         EXPBPODZ+uEbHG9c684epCXdUkTvX9KSviEphKd7n3icroaMutwtsCpmv8wg0oFeBgpO
         r7C4p07MXsS9Y5QybnVtOntXYnlQfH1PapP+ZLJL69dFx7llSxP47GerJ97rM7+YAYXX
         zoqSPPrUuGQeRsfU8hPYkhNPdbdiS1sqabju7XLdWieJA9/LCgsZ/thXbhDNCdSf44Sh
         5YQpHcy8onKsBYxPmI2fFfvhW4wEIg7mEDSeiny4GScnSFWUMJ3Gc2gNqZ8fbTfz83I/
         qMYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G8hJ2WL6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b26si561358ybe.667.2018.01.25.03.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Jan 2018 03:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G8hJ2WL6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eefv4-0000iG-LF
	for alex.bennee@linaro.org; Thu, 25 Jan 2018 06:42:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eefn6-0003C1-1B
	for qemu-devel@nongnu.org; Thu, 25 Jan 2018 06:34:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eefn5-0005Kz-5S
	for qemu-devel@nongnu.org; Thu, 25 Jan 2018 06:34:00 -0500
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:46416)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eefn5-0005Kc-01
	for qemu-devel@nongnu.org; Thu, 25 Jan 2018 06:33:59 -0500
Received: by mail-ot0-x22a.google.com with SMTP id t35so6404822otd.13
	for <qemu-devel@nongnu.org>; Thu, 25 Jan 2018 03:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qWj3rHmgnncWQmJUZP4gGaNJyiAbYG1w8M68Zt99aoM=;
	b=G8hJ2WL63Jzits6PM+XtWmywfqcllPGQaG4A82YR/9K6OytEWVdIwBLUBU3yi7cmFD
	d8tK3RQS7tasBRfNd5x5K3Ly5InF2hUoTbQ9dr8rdbw4EnFlYm/ZpZADLjOFs4ViFZm/
	hsAteH52dyN22wGpdib4Qo10jcL6xH23FiKX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qWj3rHmgnncWQmJUZP4gGaNJyiAbYG1w8M68Zt99aoM=;
	b=cOH4N5LSDLU5wyJ28h8gkqtpuBMHYv0O6rM2+asFimTvidzwC3Orwm1nLHmM4pAF5U
	Vv3NF20eBwoPx5qxvSaP1j80bDw4vDEKclBZL1oY54a+EtzcXVqWkAQ+GzP5WUmlx657
	F0HP+VZanlPYG7ZMuAZ0WPKThq+HGaruL5UmDilgtwvO9neUUM8t3nD822hhxJY5e9eH
	tRFybXUDXzqeUy8yNWqOE4lClugO0mI3PZJUJaZCrRAJFP/FFKPEmtTHlj1gMTPZ94Bo
	iexy6VDY6K1PP3c+XRiKRlFmQeofF+GW+yU3AwcgliLGp/LWW5EHnNyi0pnjSj3NBcwB
	WwHA==
X-Gm-Message-State: AKwxytdGIWhp3P/UG1Kz1LjRMh4fWGp82f7U1x1JQ0aM8TZVRKxJskrK
	PEzW3F3NQlPBszKz5Xr8Zj6uEQ6z/krKoNCeYRPtRA==
X-Received: by 10.157.29.229 with SMTP id w34mr10791150otw.24.1516880037983;
	Thu, 25 Jan 2018 03:33:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Thu, 25 Jan 2018 03:33:37 -0800 (PST)
In-Reply-To: <20180123225654.5764-1-linus.walleij@linaro.org>
References: <20180123225654.5764-1-linus.walleij@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jan 2018 11:33:37 +0000
Message-ID: <CAFEAcA8CHWkHwkXYsfKMwH_UVFGhs+0ZEdvXX_j8JFxSfU4nfw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-devel] [PATCH] pl110: Implement vertical compare/next
 base interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mvx6e+wh0Ik3

On 23 January 2018 at 22:56, Linus Walleij <linus.walleij@linaro.org> wrote:
> This implements rudimentary support for interrupt generation on the
> PL110. I am working on a new DRI/KMS driver for Linux and since that
> uses the blanking interrupt, we need something to fire here. Without
> any interrupt support Linux waits for a while and then gives ugly
> messages about the vblank not working in the console (it does not
> hang perpetually or anything though, DRI is pretty forgiving).
>
> I solved it for now by setting up a timer to fire at 60Hz and pull
> the interrupts for "vertical compare" and "next memory base"
> at this interval. This works fine and fires roughly the same number
> of IRQs on QEMU as on the hardware and leaves the console clean
> and nice.
>
> People who want to create more accurate emulation can probably work
> on top of this if need be. It is certainly closer to the hardware
> behaviour than what we have today anyway.

Yeah, I think that "fire every 60Hz" is good enough for now.

Applied to target-arm.next (with the long lines checkpatch
complains about folded).

thanks
-- PMM
