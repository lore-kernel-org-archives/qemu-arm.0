Received: by 10.28.71.155 with SMTP id m27csp3729905wmi;
        Tue, 10 Apr 2018 05:58:16 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49pUgJ61IuFvt97FtnQsvIv/C7nuBf57quPtO93atdTv2tiyJFApUv1ucMPt6lHJcOmhmJ6
X-Received: by 10.55.184.4 with SMTP id i4mr451189qkf.250.1523365096218;
        Tue, 10 Apr 2018 05:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523365096; cv=none;
        d=google.com; s=arc-20160816;
        b=GtBPsOFdO229//a7ez0EVmaFquzPh4AkTrYAORNEDLAq6gR9vv7cso0Hky6xQM68oI
         CQa8yl5mSqRH83LlFMe2L/786OGjIVxFAonu8nfElpQtTY72c/n1yG88SMiVPfqSY2Ot
         zk0sFzJ/F0KwjP733yaylhRqDyYeL8eN5Alr4btEC7fXhzvkUenilBDWJfKW8t3E+ath
         euqw2nggLkg/lWWrPIRoXU4SNyaoWMFbXqFWlta5tGj6JA1HgSNMvdifbajtdEqsvZeW
         IrEe840pLS/pzfZ5QfRnH3Cu7/cxcHGgxX8FigsYPL/2HhgTt4mFFDB/33JdDCaNdfUV
         ornw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Rwx3SMFQn6QMA1JjeJqn4tAi7BKOPY3AJtthimwOJNU=;
        b=ZUCaitlVsaQyrI7EHjsw9V7McbflLaC/7XgFtDOCJ2MPBeMRltcm+MSkrrGNju36/R
         vFt/2JzP8P7C7c9xJwdLR4duqFaipSYBiByd0mwpQYjjEavk2jtnIpJsRbcDiin6xlX0
         78xQLrYQkfPDSM3K8+oCiWeLrHG/KyhVB9cYhv6l3O+cuY/P8Uob8Ee0kzqxYS5Ckjly
         G5rvS8rt+x2usE5y7lUgTkCQ5hC7EBstC1ft3xVwKtGgwT07LMjljsmZiU0As8WK/3GA
         LDyUytE99M5FY1rOFvyd20+IlNe4gncRp6fWoiI5url9C/SiN+kG2JU1rHKJ3hENFdl4
         OZ9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZqtVdAp9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d28si1565910qkh.274.2018.04.10.05.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Apr 2018 05:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZqtVdAp9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5sql-0002t7-Kn
	for alex.bennee@linaro.org; Tue, 10 Apr 2018 08:58:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5soW-0001YZ-V9
	for qemu-devel@nongnu.org; Tue, 10 Apr 2018 08:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5soW-00045X-3U
	for qemu-devel@nongnu.org; Tue, 10 Apr 2018 08:55:57 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42928)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5soV-00045D-Ub
	for qemu-devel@nongnu.org; Tue, 10 Apr 2018 08:55:56 -0400
Received: by mail-oi0-x241.google.com with SMTP id l190-v6so11004804oig.9
	for <qemu-devel@nongnu.org>; Tue, 10 Apr 2018 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rwx3SMFQn6QMA1JjeJqn4tAi7BKOPY3AJtthimwOJNU=;
	b=ZqtVdAp9Z73iItEKupCrtf8bIC9uIALnnz6jUFhltEfO/fA4t1t9K61Czxbz5DzPiU
	8UDe4uuXHoj8itjN9wPqe1XhosajiL+wkaT31HQd6RPQLIDFKl9WHk+CGL6qvatoK1tR
	fRoKc32VIi3AhTJCoqnOueM2L8paMUv9pWhiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rwx3SMFQn6QMA1JjeJqn4tAi7BKOPY3AJtthimwOJNU=;
	b=ZCWXZW5dBNFIQwslq4ekgHSiyNn6siswTG21xeg+D/x7TNl1BvX4f81tAfZ/EILAjw
	0oFpWolfD+m8KMF9E6bGU/va64Y4FAfJcOrqwB6j2aD8Xb8h8LM3vJN1aH3KGufr6kei
	RCzA4jsAklRiyfkBONu82XVt+/S62/6i6B0TzwUxSZaHw3G+Npt8hfxLVsHTAgixre4l
	52va6qwmJ6HflrXPICeYBoHCfukROMM9hxpZw7h/bi3r18PX9iB8ZM+k9/xtV3tSH3RU
	lKePJYNNiJITK6143WrbypRYbAaM5h7wGTqTP9X7S3mSMKJC25GsYvKAiA1sau2OATwu
	Tt8A==
X-Gm-Message-State: ALQs6tC/3ny3Z9waus4istQyuCIUsDv2QwXBZdXpxgOpGuqlvwUMjQiy
	C/n+DzNeg3pwe2Cq+z/sA1mPgdRg2CNLiVUR44HTqw==
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr215736oig.102.1523364955159; 
	Tue, 10 Apr 2018 05:55:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 05:55:34
	-0700 (PDT)
In-Reply-To: <3147e65b-b6ff-a49e-fc40-21396dcbea0c@twiddle.net>
References: <20180409140714.26841-1-peter.maydell@linaro.org>
	<3147e65b-b6ff-a49e-fc40-21396dcbea0c@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Apr 2018 13:55:34 +0100
Message-ID: <CAFEAcA_NUrah3b3E0W2T8UzsX05MBUXXv2pFMzPbb=UcyWf4TA@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH for-2.12] linux-user/signal.c: Ensure
 AArch64 signal frame isn't too small
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
Cc: Richard Henwood <richard.henwood@arm.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CGI3N53k5+3x

On 9 April 2018 at 23:05, Richard Henderson <rth@twiddle.net> wrote:
> On 04/10/2018 12:07 AM, Peter Maydell wrote:
>> In particular the dash shell
>> would segfault if the frame wasn't as big enough.
>
> Ah, that was the critical difference in my failure to replicate -- the fedora
> sysroot doesn't have dash.  As you say, the patch matches the kernel so,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> That said, what the hell is dash doing that relies on this?

I figured out what's going on, and it's not particularly weird.

The memory map at the point where we take the signal is:
4000000000-4000001000 ---p 00000000 00:00 0
4000001000-4000801000 rw-p 00000000 00:00 0
4000801000-400081d000 r-xp 00000000 08:05 24190917
  /srv/chroot/xenial-aarch64/lib/aarch64-linux-gnu/ld-2.23.so

(conveniently guest_base == 0, so host and guest addresses are
identical).

Guest SP is 0x4000800590. Without this patch, we end up with
layout.total_size == 0x480 and frame_addr == 0x4000800110.

However, the range we try to lock for writing with
lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)
is always sizeof struct target_rt_sigframe, which is 0x1250.
So we try to lock from 0x4000800110 to 0x4000801360, which
extends beyond the rw ram block and into the read-only following
memory section which has ld-2.23.so in it.

So this patch fixes the problem for non-SVE guests
by bringing the size of the signal frame we allocate on the
stack back into line with the size of the lump of memory we
verify as being writable.

It does suggest that there's another bug here that will only
manifest if we're using SVE and end up with a larger signal
frame than the default -- we will in that case do the
lock_user on a lump of memory that's smaller than we're
actually going to try to write to, because it won't include
the extra part. Do we need to switch to using lock_user and
unlock_user and passing them layout.total_size, rather than
relying on the "lock size of this struct" functions?
(I think this is not a bugfix required for 2.12, because
nothing enables ARM_FEATURE_SVE yet, and without that feature
bit we won't ever create a signal frame that's larger than
sizeof(struct target_rt_sigframe).)

thanks
-- PMM
