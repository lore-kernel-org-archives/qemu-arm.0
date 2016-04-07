Received: by 10.25.208.211 with SMTP id h202csp648981lfg;
        Thu, 7 Apr 2016 11:10:56 -0700 (PDT)
X-Received: by 10.194.236.198 with SMTP id uw6mr5112592wjc.42.1460052656541;
        Thu, 07 Apr 2016 11:10:56 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id b21si10137079wmb.111.2016.04.07.11.10.56;
        Thu, 07 Apr 2016 11:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 05DD61388B05;
	Thu,  7 Apr 2016 20:10:56 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFid9NQZ
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -1.788
X-Spam-Level:
X-Spam-Status: No, score=-1.788 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, HK_RANDOM_ENVFROM=0.001,
	T_DKIM_INVALID=0.01] autolearn=no autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=fail (2048-bit key) reason="fail (message has been altered)"
	header.d=gmail.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8dmG9LXkem6; Thu,  7 Apr 2016 20:10:55 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id 12BF91388B06; Thu,  7 Apr 2016 20:10:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9A0701388B05
	for <mttcg@listserver.greensocs.com>; Thu,  7 Apr 2016 20:10:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hM2GHEWhxUC8 for <mttcg@listserver.greensocs.com>;
	Thu,  7 Apr 2016 20:10:28 +0200 (CEST)
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com [209.85.220.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id A76EE1388B04
	for <mttcg@greensocs.com>; Thu,  7 Apr 2016 20:10:27 +0200 (CEST)
Received: by mail-qk0-f194.google.com with SMTP id e124so4011535qkc.3
        for <mttcg@greensocs.com>; Thu, 07 Apr 2016 11:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=A9ISj9cSOzesKgqj2RPshwFWfqCdgY11FhU64gmP3g4=;
        b=XFid9NQZlvgwwo87xCoFA/ZSwR8Mg4p2C1n3wS4rjeJd/YoRABfIw+KUhjh2cHQs5L
         WbIssMnQnfnev9MX+6twHqjQun7CBpWHaBEwhgVboT8Q8jG/thU3k8Xp7Aa/kiaAfxh/
         A5ZW8nSm45y2B+uXgiUodWMyjqEWfc3MbVjK3vVyq3UORMZIPvLYaynyCVE/DvJEq4iK
         XEzaFEl///5AtOaP54N3UYL4V+0/v97DaZqCTizEaok9E/9UFhcP6PPsJodOsaILgPn9
         qOG30WfOEW589AM7Fw63QDusB+ibJgPq02s5peLHduhWhUsJLPvjeEuZKVfzvQQmsB+m
         IcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=A9ISj9cSOzesKgqj2RPshwFWfqCdgY11FhU64gmP3g4=;
        b=mcuVFiYCPNjKe007LQxTQpS/Dqxv4BR+9sjb9SUEQI4MUOBuzW5TTwWHHnGbwzOvY2
         Hb2E/c9PFJ/KI/6yYnoS4bTuV3NO/n7CqlGCu9Eb4iFIPzvRExhHYG4BC+THVDS4xOtw
         eAYoHMsvVlWUd6GOq20NZbrpgN/o1gLbHIGq30I/kUzY4JdsPvCR1sXlwvTKY4th5UFp
         mXHK48uVSPZZCgrilMnPMMHQwfbsXDjGd51vndy6WR1TxycYlk7jdJXUxqK0M1kjyY5/
         JBgSkunrmw20Cq5BXlvAdd/WRjDp3RtH7xI7HuLo9t0NnLFITs2LFbjRSSfu06TBDjej
         Wviw==
X-Gm-Message-State: AD7BkJLsFfD83RAkrEWfU0H5hmv2lkPVMYGk8fz/ctUq6TmeGYUkmtcGkDB0ZIG3+oSL/A==
X-Received: by 10.55.82.195 with SMTP id g186mr5568953qkb.47.1460052625539;
        Thu, 07 Apr 2016 11:10:25 -0700 (PDT)
Received: from bigtime.twiddle.net (50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
        by smtp.googlemail.com with ESMTPSA id e127sm3877395qkb.34.2016.04.07.11.10.22
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 07 Apr 2016 11:10:24 -0700 (PDT)
Sender: mttcg-request@listserver.greensocs.com
Subject: Re: [PATCH] tb: consistently use uint32_t for tb->flags
To: "Emilio G. Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1460049562-23517-1-git-send-email-cota@braap.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Laurent Desnogues <laurent.desnogues@gmail.com>,
 MTTCG Devel <mttcg@greensocs.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5706A28C.3090403@twiddle.net>
Date: Thu, 7 Apr 2016 11:10:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1460049562-23517-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Validation-by: mark.burton@greensocs.com
Reply-To: Richard Henderson <rth@twiddle.net>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 133
Errors-to: mttcg-owner@listserver.greensocs.com
Precedence: list
Precedence: bulk
X-no-archive: yes
List-Id: <mttcg.listserver.greensocs.com>
List-Help: <mailto:sympa@listserver.greensocs.com?subject=help>
List-Subscribe: <mailto:sympa@listserver.greensocs.com?subject=subscribe%20mttcg>
List-Unsubscribe: <mailto:sympa@listserver.greensocs.com?subject=unsubscribe%20mttcg>
List-Post: <mailto:mttcg@listserver.greensocs.com>
List-Owner: <mailto:mttcg-request@listserver.greensocs.com>
List-Archive: <http://listserver.greensocs.com/wws/arc/mttcg>
X-TUID: W/H81g6YVPK8

On 04/07/2016 10:19 AM, Emilio G. Cota wrote:
> We are inconsistent with the type of tb->flags: usage varies loosely
> between int and uint64_t. Settle to uint32_t everywhere, which is
> superior to both: at least one target (aarch64) uses the most significant
> bit in the u32, and uint64_t is wasteful.
>
> Compile-tested for all targets.
>
> Suggested-by: Laurent Desnogues<laurent.desnogues@gmail.com>
> Suggested-by: Richard Henderson<rth@twiddle.net>
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   cpu-exec.c              |  6 +++---
>   exec.c                  |  2 +-
>   hw/i386/kvmvapic.c      |  2 +-
>   include/exec/exec-all.h |  5 +++--
>   target-alpha/cpu.h      |  2 +-
>   target-arm/cpu.h        |  2 +-
>   target-cris/cpu.h       |  2 +-
>   target-i386/cpu.h       |  2 +-
>   target-i386/translate.c |  2 +-
>   target-lm32/cpu.h       |  2 +-
>   target-m68k/cpu.h       |  2 +-
>   target-microblaze/cpu.h |  2 +-
>   target-mips/cpu.h       |  2 +-
>   target-moxie/cpu.h      |  2 +-
>   target-openrisc/cpu.h   |  2 +-
>   target-ppc/cpu.h        |  2 +-
>   target-s390x/cpu.h      |  2 +-
>   target-sh4/cpu.h        |  2 +-
>   target-sparc/cpu.h      |  2 +-
>   target-tilegx/cpu.h     |  2 +-
>   target-tricore/cpu.h    |  2 +-
>   target-unicore32/cpu.h  |  2 +-
>   target-xtensa/cpu.h     |  2 +-
>   translate-all.c         | 10 +++++-----
>   24 files changed, 32 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
