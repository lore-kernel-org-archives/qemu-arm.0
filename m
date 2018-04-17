Received: by 10.28.4.212 with SMTP id 203csp3828837wme;
        Tue, 17 Apr 2018 06:35:56 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48uIF/ZK4lTcUrT9y+eOvJeetkFSZ/fDpiTHRdgyP/m66Wl03qk3Vs267oUIGkiMm2Es888
X-Received: by 10.55.47.2 with SMTP id v2mr2335229qkh.249.1523972156674;
        Tue, 17 Apr 2018 06:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523972156; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHH88bfCz1rHaKZeR/ZOf5Hm0IK2ZHKunJjXpxme7GtOju9zW9+ZVJii+SG81LhnT3
         hv31On6Ije/KQH4O6JXKuU8aBE2jlbr2HhvlZQm/LcWG1BV7niO74RK8iDJOSNXWMxU/
         Y3TT+67X9yG5UUGRfyR+Ma7p7UG8Ra2FP6hsAJM+XmgwN8fVxXac8A2+Zey8BjNflW8B
         4pGTMg4EcOi8KcU60NFAQw1YBUPaEN+aJkLsjMJLe5cPRpeWKhkbgOyC1RSXtw8ztgRh
         79ya2GXVdNlv4CmWQ8fCGI7BKWZ+SKJp8/IG/XtDWNiyArdu8HkGsI5KhLfQNYhge7XR
         u1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GjOKyEhrt7e4CXILDtyNtbNhKIFEccihnGY1OTRL27Y=;
        b=BZvZC9Fpw2ioZR1431Z7hY2oFhB6WnJE6OtPZeRIItcwnHC9SyH4W1r2cHbmpOKXkC
         BQWD5N/TT0Jn6n7d3++8W9ktQpvdvdP/LDVmsX6W4F7de8qJ+3pGkVjE5iZ7pl6q6KZT
         zd5LlXUAH4aHy60/sEKJNxA4jRJYcs8AdjZipze5gYmynVJWfQBYcqGs/lOnm0LAzQOI
         33oyGnQ7yZp2Y/6J3NfCKu02JRkBHKKGKLM7yblnieBu6p+SA8C/fKC/xeIo3mabE9aW
         6T6IUhKftpTNOzhUbFP5GHs62/VAOVwXUuHD2Slv3aPdJ0a5gAv6lsskxnI3iPG4SOcZ
         d1hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JvrHYAcj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si1214073qtf.225.2018.04.17.06.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 06:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JvrHYAcj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8Qm4-0005H8-6F
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 09:35:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8Qkq-0004j5-TN
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 09:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8Qkp-0001ER-K1
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 09:34:40 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8Qkp-0001E4-Dt
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 09:34:39 -0400
Received: by mail-oi0-x241.google.com with SMTP id p62-v6so1603606oie.10
	for <qemu-devel@nongnu.org>; Tue, 17 Apr 2018 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GjOKyEhrt7e4CXILDtyNtbNhKIFEccihnGY1OTRL27Y=;
	b=JvrHYAcjkuFcoxJ7xepfsCaMDebtbm/wG843wJ8bOIDuk6DfwRQvSPatZgAWkRVm2F
	4GF7n8zqcz95qRSrlK78rOQnp98Q2wiaXG2/0zrW3/FH4N46qNQOBZyRZEERdsHXtZiE
	Lf4LvqV8bSiejWSw3oqTCjQpC3wX/mwtBi2ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GjOKyEhrt7e4CXILDtyNtbNhKIFEccihnGY1OTRL27Y=;
	b=Y4Lw1yxyqIDX1u2LNX/CX6JrDKHzMHzQXdbAAi5/fuwCDqXT65DLkAiGuPP1I6hQtW
	YyxQIl7+Df4iQJIXtiVoLLLnF/HTvHgh0ym9ZNkT8nupKi6fjm/RDGksP2EqRaAds20h
	avmUqgA3kEKk+FOXcmlKQqdG9Q94PqqrXh7+ydXamSS8hxzJA+NajMMp8WfroZSmzrWY
	n1ToVVzt0I+kC2K6y6+RmWCVRSBq9mz1AXTrApvQk5uXDBa2vKUYsg0zMU+SkZKzmb5f
	svYJgXZBhomE7aXK1dGfWGk9YQAAWrpsqR5lykMGuT8cKTc5AL92vC2NeK40nc/H+QV/
	8Gvw==
X-Gm-Message-State: ALQs6tCJvexrPHXzyHjvG0jjbCFIud0vR3NZELgQ5fAFIQr9V+JVM67S
	nlRuCwq6nkUlsXNoj9b/9mRCa7NkYBwn4oov4fDpXw==
X-Received: by 2002:aca:4ac7:: with SMTP id
	x190-v6mr913369oia.11.1523972078612; 
	Tue, 17 Apr 2018 06:34:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 06:34:18
	-0700 (PDT)
In-Reply-To: <CAOuPqTE8GsN_+REWzSt4DOiqddSbZC-kOH=WnYG3U8ge3GsLoA@mail.gmail.com>
References: <CAOuPqTE8GsN_+REWzSt4DOiqddSbZC-kOH=WnYG3U8ge3GsLoA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 14:34:18 +0100
Message-ID: <CAFEAcA_Hti-FYqEse7ubdNyVr3fPHO==e6MDv9Ym4KVYJcYTwA@mail.gmail.com>
To: Henry Wertz <hwertz10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] Patch for ARM memory barriers and getdent
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
Cc: Laurent Vivier <Laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d5m4eXqcRAnS

On 16 April 2018 at 19:44, Henry Wertz <hwertz10@gmail.com> wrote:
> Please find submitted a patch for ARM memory barriers.  This patch is
> against qemu-2.12-rc2 but I do believe it should apply for anything from
> 2.11.x to current.

Hi Henry; thanks for these patches. Please could you provide
a Signed-off-by: line for them? This says you're happy for us
to apply them to QEMU under our license, and we can't do anything
with them without one. The top part of
https://wiki.qemu.org/Contribute/SubmitAPatch
has more detail.

> I found with qemu 2.11.x or newer that I would get an illegal instruction
> error running some Intel binaries on my ARM chromebook.  On investigation,
> I found it was quitting on memory barriers.
> qemu instruction:
> mb $0x31
> was translating as:
> 0x604050cc:  5bf07ff5  blpl     #0x600250a8
>
> After patch it gives:
> 0x604050cc:  f57ff05b  dmb      ish
>
> In short, I found INSN_DMB_ISH (memory barrier for ARMv7) appeared to be
> correct based on online docs, but due to some endian-related shenanigans it
> had to be byte-swapped to suit qemu; it appears INSN_DMB_MCR (memory
> barrier for ARMv6) also should be byte swapped  (and this patch does so).
> I have not checked for correctness of aarch64's barrier instruction.

Yeah, this definitely looks like a bug -- I can't see how the code
as it stands could ever have worked (it was added in commit 40f191ab8226fdada).

> -------------------------------
> Please find submitted a patch for getdents (this system call stands for
> "get directory entries",

You'll probably have better luck if you submit patches as separate
emails rather than all in one -- the set of people who care about
reviewing TCG backend patches is different from the people who
look after the linux-user syscall emulation code.

> it is passed a file descriptor pointing to a
> directory and returns a struct with info on the entries in that
> directory.)  This patch is against qemu-2.10 series but continues to apply
> cleanly on current as of April 15 2018.  If you are running a 32-bit binary
> on 64-bit target current qemu will convert he getdents struct, but it will
> NOT in the case of 64-bit binary on 32-bit host.

In general, 64-bit binary on a 32-bit host is not supported by linux-user.
Various things are likely to go wrong for anything but the simplest
of guest binaries. You need a 64-bit host to reliably use linux-user
for a 64-bit guest binary.

I think your change isn't sufficient to handle the "target 32 bits
and host 64 bits" case, because the 64-on-32 code path that you're
using for it uses the guest's buffer size as the size of the
host buffer it allocates to pass to the host syscall. That's ok
if the host is 64 bits, because the host struct linux_dirent will
be bigger than the target's struct linux_dirent, and so we can
guarantee to fit all the host's structures into the target's
buffer (with unused space left over at the end). If you try to
use the same code for "target 64 bits and host 32 bits" then we
may have more host dirent structures in the host buffer than we
can fit into the guest buffer, and we'll end up overrunning the
end of the guest's buffer. I don't see an obvious way to support
64-on-32 here, because the record sizes are variable, not fixed,
so you can't tell in advance what sized host buffer you'd need to
be able to fit the results from the kernel into the guest's buffer.
Maybe I'm missing a clever trick?

thanks
-- PMM
