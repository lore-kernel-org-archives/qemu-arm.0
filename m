Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4911333wrt;
        Mon, 15 Oct 2018 13:29:22 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61izOQamSR6f6rnqISE90Gdau/JDCvY7oVuXg37tN5emdm6XQdqZNocf/iJyvL9jhWdsxUq
X-Received: by 2002:a37:c812:: with SMTP id c18-v6mr17240874qkj.196.1539635362083;
        Mon, 15 Oct 2018 13:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539635362; cv=none;
        d=google.com; s=arc-20160816;
        b=QbbbKz9c037wGePcs0bg+AJ6X5NzZksZn5E8VDvI4CEOcCrz+owlK03WpIc6naAgZ8
         dgUXf7CWgLVGaj4946s7+OtlwinvUrpWukRJwnrXVeyVVB7nsQQ4UoGC8xjuTbTgQqxa
         cxnDU/YnHEfdsTIKTtK6DLGMigyaas35N0vgChqyv6arFJEk6/DydmDe8CDmUMvPdG6F
         f6ruQH+5QzlY6sdjexbu7CBKZ45y1uMIlVDBy2A2L7pIXKvrP3iewyl6Fl3xQZiLM2SX
         F32yZziLhqrrRNeERlocKAmdLz2exe4XRONPi10Xt90F1eToudD1dPkkdnO9winvaBSg
         Z4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Uh3jwqLLGOYJV2uzzkAtMjVPB/kjB90mKa7AGu0gQNY=;
        b=uISnNmNgcEjjAngvbPwJKEh3KsDywUpboPYr6JWUWWoF7fvYN9eEZdyH4bnmi9HHKf
         pOt2YwAVQxEegxyebQiDwmoLWjo/SKzX4deA1M02u1IIkoztclA3oGc2NrbhrzTYYp0h
         Wd3SD6GDgDNiy6i4mLYsUj+nX2IR1DP6DMF2fU4E0K9DAarcU+lsNPjjOzTcBFnd4uQ+
         8f0aiuE5pmxINbIVP8FjnvuKmnXkqdfs/7MLhCjHaTaqFflJHUeMMYA1B8fyGMytKGbA
         lVi7BnTNC+q98upnR3uwEWlQ5zl4hgIVnnPwX9L0DhtJCTqAdBkt1VqksWQbg7s2KH+7
         2SdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C6EFmveL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5-v6si9530509qkh.43.2018.10.15.13.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 13:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C6EFmveL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC9UP-0003dG-JD
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 16:29:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gC9UE-0003bq-LW
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gC9UD-0002c3-Je
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:29:10 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:44715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gC9UD-0002bK-C7; Mon, 15 Oct 2018 16:29:09 -0400
Received: by mail-qk1-x744.google.com with SMTP id y8-v6so12697680qka.11;
	Mon, 15 Oct 2018 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Uh3jwqLLGOYJV2uzzkAtMjVPB/kjB90mKa7AGu0gQNY=;
	b=C6EFmveLrHZDApjEGXK+WJlaVgdaLD0mnvmWY60FQGVrNizyeus3jC29lrvLvmb7pz
	GIsmrf19uqI/cVJzT2UtgWfbHAowCuGWDoyECzW3eEaO+eqIadxWpA6jvt+yFFPTAHGw
	o/0KC98dCSx1wCpQXq4ypvLSAEYmuzNmte5DzUoWzwsdTCwH2J6HLLwVKnpch3bCwe/S
	YUtP8FIsGSLCruUaSnCcsmCl5ddSTPl6LYHCgDMbPo910seNmEzzcbo6Exr7QdwmmDgQ
	q4sZqooYvbcV9ag1IcG2tf8sCsqrBfrTX7IAQFcsluA+bbOjuUDzhf9ahwIlq8zxOjBt
	fNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Uh3jwqLLGOYJV2uzzkAtMjVPB/kjB90mKa7AGu0gQNY=;
	b=PC4KX9/BBnM7Aac4u3Yl4206/YDxp+fPMKNLlLX0VCtH4gxXNUOowGPhZ/AFxY9SCv
	Dkd1BStMsYGekqL9i9ePjQbIQMiox/oCYLtHiu+KFOJ/QdRbvO8cceMfQM/UBZE27faJ
	pdext2IOQeg4iLZaa5lgLmRN2y8H3dSY2y0QBWvbqFiLxuCkiWPdr6DmRu2BbLcRap08
	ZqKRNHUb0GGsPO4/Z+kkNKBAc1k6m0vqGTZTyPCDy9+Cz+FlqR+k7k7TqOCYWmH0U1xQ
	Lnh4p0/kYJJ9H2YWk8guOaJPgjpcQpgJ52SbUXUmyHR75T4ODsCh2bkmng2E9AlwTNl4
	ignA==
X-Gm-Message-State: ABuFfohyNxEl9S1EQei3bkUqV9E0WJqQ8489ZFrGKpeREvffLjavWooV
	khMk+2vlJr80nstHyLKAamg=
X-Received: by 2002:a37:14d4:: with SMTP id
	81-v6mr17155380qku.201.1539635348541; 
	Mon, 15 Oct 2018 13:29:08 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	19-v6sm7007912qkd.44.2018.10.15.13.29.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 13:29:08 -0700 (PDT)
Date: Mon, 15 Oct 2018 16:29:07 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181015202906.GI3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-6-aclindsa@gmail.com>
	<4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/14] target/arm: Reorganize
 PMCCNTR accesses
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Y1avaePV5wL

On Oct 15 12:50, Richard Henderson wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > pmccntr_read and pmccntr_write contained duplicate code that was already
> > being handled by pmccntr_sync. Consolidate the duplicated code into two
> > functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> > c15_ccnt in CPUARMState so that we can simultaneously save both the
> > architectural register value and the last underlying cycle count - this
> > ensures time isn't lost and will also allow us to access the 'old'
> > architectural register value in order to detect overflows in later
> > patches.
> > 
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.h     | 26 ++++++++----
> >  target/arm/helper.c  | 96 +++++++++++++++++++++++---------------------
> >  target/arm/machine.c |  8 ++--
> >  3 files changed, 73 insertions(+), 57 deletions(-)
> 
> Ok, looking at this follow-up makes more sense than the previous patch.  Would
> it make sense to squash these two together?

I was attempting to keep the migration plumbing separate from the PMU
implementation details, but I'm not particularly partial to this
staging.

> It also makes sense why you'd need the post_save hook.

Okay. I attempted to describe this in the commit message in a way that
communicated the need for the hook without being overly verbose - but
suggestions in that area are very welcome if you think a different
commit message would help.

-Aaron
