Received: by 10.223.159.74 with SMTP id f10csp1759548wrg;
        Sun, 10 Dec 2017 10:25:00 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbYz68nx13qlTWt0C9hVgquk4pxXraNhd++jV+OZQ1PNzbjKTznHaomvL6pbWYh/gKxS1fm
X-Received: by 10.37.255.26 with SMTP id c26mr25432720ybe.252.1512930300175;
        Sun, 10 Dec 2017 10:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512930300; cv=none;
        d=google.com; s=arc-20160816;
        b=Aqazqp+/72/R77ADq4Sfz86LOycxMrvSJuLDixduA8kml228zIeWOq1o3SQEnZ8mfy
         HDszoTcA12xcdYtpqIYXx84bouZZJbBAAvyGd6xFE/N8N4wnnvDtU9xxIivgAgIYGZkc
         OT2ZNg2w55fyPtglacJcGaBgGTUlvTEGsKZfgApB6Fl8afRartgh1+WqJGsrRLaxN1Z6
         sA/1pfaO8JqugiqqsrWQgBXVBb5Pt9VVd39P4UxLwYKV5qCpYHan7qfEAqhNbHt738aT
         XjZeskf3gHMHGtR0eE1SpcOjwIkok2s+lz3CdxsNKVv8ObvRsOKY+GVdEOEjtGQ77gun
         /ADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2pZX8RJxTS76mYRrUeV9Blxgl5DUbx385xgyizL43Xo=;
        b=WWJNSvADeH5fEMNX7uC+zaqSrVi1TVcvMbvEJI+CeFplB/oyZHBN4bbzBPMdFREt40
         N7HdqvN6gQzl9tnKC3LUKlslX6/TRHEcWYlKS3oxnr23BWfYeUvBRG8SyFj5GumesbQh
         3tBrZQhMbqp6E1MOPFlYMkgn6dbfBgM47H/Lxrzexmvgv9jxTJjHhiD0Dv2URTRmX9h6
         EnIU2zCFU1GUzWfygNd7yFy3rRVAbYOOoSKLb2ELJCFo5mGh4ZPU/bYlT7G/3HjRSyEr
         yjZERO3f/eTLJ+6niqzXFyyaEXlw5E3d5xJcPaY6+uZITuaJSHQijxQ6I3aePV3VQEl+
         bsCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjiFQlUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v194si2653031ybv.484.2017.12.10.10.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Dec 2017 10:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjiFQlUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eO6Hb-0006Go-Lg
	for alex.bennee@linaro.org; Sun, 10 Dec 2017 13:24:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eO6HQ-0006G8-RA
	for qemu-arm@nongnu.org; Sun, 10 Dec 2017 13:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eO6HP-00024Y-Lz
	for qemu-arm@nongnu.org; Sun, 10 Dec 2017 13:24:48 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eO6HP-00024G-HA
	for qemu-arm@nongnu.org; Sun, 10 Dec 2017 13:24:47 -0500
Received: by mail-ot0-x244.google.com with SMTP id q3so13018160oth.2
	for <qemu-arm@nongnu.org>; Sun, 10 Dec 2017 10:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2pZX8RJxTS76mYRrUeV9Blxgl5DUbx385xgyizL43Xo=;
	b=TjiFQlUed2CKkzC8/TClg/mBXnCL3gYFKvC4ldLFKeACeNmLzU2cWSdP0vloDsmYNn
	EQb8LvmBFyv32jv/hutMsfux1CFVMCyUtr82hA8XWQZXU+lgQYaft3Yet/0fGQyhPy9g
	KCYL2KPOhw/wMM2b6m2edUXq4N5T7ddghyHsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2pZX8RJxTS76mYRrUeV9Blxgl5DUbx385xgyizL43Xo=;
	b=UhLo9L1IG2mz9EYEUCBNkSspAfwnt3h48xeQvOB4fkJo3lNnB/SP1359Xn+9CrdNZ9
	N6n5GYkkvmLOwfARPOMGxn6AENCxwWXcGpdFm3rxeyS68Y63AT8R4hBtGgGEQcUeZOjm
	BQ5lW9ct3hPTnWXqhdC9vNMe4WHj8VC8w9Nf7Yb7Z/YsY7TwcidMCGxcIz0GknBGrpOj
	haO/goB6A5olfHquHtbi+HkRSnhWiuA9EeM/cvkIDdadZL+AFodpLjjYVPpvwUl/gZ4v
	9wPg3LB8rGnl5/MTsndXRLdp1bHhG6IfreccxclQdMTwou1ba+bZMGHD1ZeP7+wOczk+
	abzg==
X-Gm-Message-State: AJaThX7NAV9gQ9E7GDnERSwgHt3ulAubBczhdzbpjeAwT6iGXOFLD5T9
	OF49SZTgv6KNiyPv/u+6FPiGGN7kUnpXRBODu7kfKA==
X-Received: by 10.157.80.24 with SMTP id a24mr30465496oth.335.1512930286805;
	Sun, 10 Dec 2017 10:24:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Sun, 10 Dec 2017 10:24:26 -0800 (PST)
In-Reply-To: <20171208230920.GA11462@flamenco>
References: <1507824216-29058-1-git-send-email-peter.maydell@linaro.org>
	<1507824216-29058-9-git-send-email-peter.maydell@linaro.org>
	<20171208230920.GA11462@flamenco>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Dec 2017 18:24:26 +0000
Message-ID: <CAFEAcA_2HH2mTrHNzyrn=e3OQgoEdCZSbL7aa+wRHi1fba-8=A@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 08/13] target/arm: Pull Thumb
 insn word loads up to top level
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvDTWjg6X+i9

On 8 December 2017 at 23:09, Emilio G. Cota <cota@braap.org> wrote:
> On Thu, Oct 12, 2017 at 17:03:31 +0100, Peter Maydell wrote:
>> Refactor the Thumb decode to do the loads of the instruction words at
>> the top level rather than only loading the second half of a 32-bit
>> Thumb insn in the middle of the decode.

> This commit breaks the debian-arm boot test (see [1]), boot dies at:
>
>> random: systemd urandom read with 4 bits of entropy available
>> systemd[1]: Caught <SEGV>, core dump failed.
>> systemd[1]: Freezing execution.
>
> Sorry I noticed this so late (-rc4), for a while I thought my development
> was causing this and didn't pay much attention to it. However, just realised
> the problem is present on master. Bisect log below.

It's missed the deadline for getting fixed in 2.11, but I'll have
a look at what's going on here.

thanks
-- PMM
