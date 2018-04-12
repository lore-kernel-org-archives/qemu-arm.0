Received: by 10.28.71.155 with SMTP id m27csp2107020wmi;
        Thu, 12 Apr 2018 09:29:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49b05MoSxB8yJSt++RNB4eqhSSQ9Guj27N8y3qbfbiHawopAghs3eT16vjP734kqrwDXWYC
X-Received: by 10.55.105.5 with SMTP id e5mr2085596qkc.141.1523550552065;
        Thu, 12 Apr 2018 09:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523550552; cv=none;
        d=google.com; s=arc-20160816;
        b=v018Cow1x8exh76QDexT8CR5r8a8g6+CNmuE/hj+gr8rU1VbvyLlAuemtvQJQ1MEZp
         LhtEw0QLnya1PspASLbMPH354y7catELHVyU52ZnRfTWnRS3rjWJWgkAeSaG0YCZAR4h
         J7l1tjGNrHP5sxqOlE9yiqkDtF1fq1QiBQWeGOjUJcIAkIMmoC+GX0YZHW/9lgwKD7AB
         bMb9jTb8K62nuImRErCNaOpMv6lV/wx+Sj9qbm/ent5mdj2VA3QCQRc66ZO6G46NCWhN
         jiFu14Yp0QqDSWW3/yogoAsEmfLWqQGcQhoHf0biZ6myOynBUQ16L9vzb6jDW9dXnMNY
         uzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=f4rx5oZaJDqxlObFGxzQ11RGvERjgp4VYprySfoe/tU=;
        b=EmfpuIoDTtPSplEftEnfHoNGboTpaKqnDBfhBOjIjF7kKZapu7UcKcFrbzn+TQo/GU
         MLj3cklSpJLX/s9kbq+LuEKoRHLm3X+ppUS52x+2SOxnJJdlmRTvyF7WrpjbZ45KrJPu
         wyY+2X2y1a1X+iIeFqNMUaBSgMht3UhD56KYO0gf9rhE3M4c5Wq48ohwGG6mJTB1Moks
         NvYU6o8zvG0blPxNXRO5u09yUrXMOhK/DW4KJQi7l6dsxToL4D4XKDAe3ix5TtPDUNzo
         ENy2Al/QwncUDYQ2/QELBPbzorb+6QxwkLqj3ZVTRx7f9jIQTjO4SIJp++UccTIjIR66
         EaGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hdo4iO0C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k67si174331qke.56.2018.04.12.09.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hdo4iO0C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6f5z-0005i4-IZ
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:29:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6f5p-0005hH-Oq
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6f5o-0005jg-SD
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:29:01 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:37817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6f5o-0005in-Mo
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:29:00 -0400
Received: by mail-ot0-x241.google.com with SMTP id y46-v6so6684220otd.4
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f4rx5oZaJDqxlObFGxzQ11RGvERjgp4VYprySfoe/tU=;
	b=Hdo4iO0CosM6GVXwr2QQRi9O9Q6shAv+6erSszq8Bz1arxkqlnTGkkBzUKWHBdYsqK
	en13t8joh7/ySOJVgPUE2V4Cgpc598t5Yv6k+rynQcllmzHLgfYZ/TT4OYY41I6bRLNP
	DWhlxPK0qfChGdH79ftSynmWCLVHszNdQY/xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f4rx5oZaJDqxlObFGxzQ11RGvERjgp4VYprySfoe/tU=;
	b=C8h3RbLBWQBW587QyF91xLCEmj34i7cbKn1meJkcyvMl62CqPgd7RQYBHAIGo4ZaYu
	1jUElYg8T1rV7fCznUWcWPOE9PbLmAuu2agtYXmypEz7j7M1cbuW1b+CjePOAr4y+MsM
	j7PbmuxjTHbOBzI5bh7Ir7veKn2+Q0nf/idglg+ckScl5x+o1Q/sls9wlD9Sb5nOWuSH
	vsxXwkycc2G9eCEX+R3H+5x1yiV5PA6Ulqh627l6lHF1neV02MTiB6BTfuy56O+xe2qa
	OzhTl1ugtgM67Jcw4bAZ1PzWSjCj9AN9OReb4x9sCoQWG/Dyua/z4xRxYnxBByk6bXY9
	62eg==
X-Gm-Message-State: ALQs6tB/8z3FzpShUQbJt2wNmQTTH3Umrv81UVWtaUUycIFkS0g23t9r
	6/9lO/9PpzOzbasMu8POpgEDCSOhJIe4ImZl9cJJHQ==
X-Received: by 2002:a9d:3a45:: with SMTP id
	j63-v6mr1106587otc.126.1523550540064; 
	Thu, 12 Apr 2018 09:29:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:28:39
	-0700 (PDT)
In-Reply-To: <1521232280-13089-8-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-8-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:28:39 +0100
Message-ID: <CAFEAcA-NGpHKHUiQPYKofKB5CA0q3fsgMkm6kc8=dS6N4Tdn1w@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v3 07/22] target/arm: Fetch GICv3 state
 directly from CPUARMState
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lHBd8x91U2Js

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> This eliminates the need for fetching it from el_change_hook_opaque, and
> allows for supporting multiple el_change_hooks without having to hack
> something together to find the registered opaque belonging to GICv3.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 10 ++--------
>  target/arm/cpu.h          | 10 ----------
>  2 files changed, 2 insertions(+), 18 deletions(-)

I'm not wonderfully happy about this, because the original aim
here was to try to keep the GICv3 device end reasonably decoupled
from the CPU proper. On the other hand since d3a3e529626fb we've had
this pointer because we ended up needing it in the KVM reset codepath,
so we might as well use it here too. Maybe one day I'll come back
to this and clean it up.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
