Received: by 10.28.71.155 with SMTP id m27csp2126240wmi;
        Thu, 12 Apr 2018 09:48:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+W0Kkw2A0s0bXm/muGcb0DxQsaVfrdaW91fVA6aJBfLor1LLnUVgtaf58cOIFDl0AS4LNY
X-Received: by 10.200.24.177 with SMTP id s46mr2273982qtj.239.1523551720800;
        Thu, 12 Apr 2018 09:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523551720; cv=none;
        d=google.com; s=arc-20160816;
        b=TLK3M7xV9R35S55X2lGU6+9Sd6RSh7WrRppxc1kX1yNeYu4Fl+phuLWWXBoWg4TUQs
         TlBVFsfesECFPvhekbhppxEK9uhoxEQy4YRqaQ7vzriBE0bOeiYdYibDOQ3wkBDYMGlH
         SrPHmBYWUsk1SaPBa9yHfEYTae9489XvboEcDbyKw3q39JI8lNxbkC00FX1dof8AR67c
         JczYTfxcHQIMVLTh+DejGS7vGd9WPqCOdWHfEmMD7plAAyTDj3SX2dhmDIVk8UAUD4mU
         ZnO3n1Ug7JZR7K+i4LyW1OvlZtoC5O4MsCeac8WkJvNYvW4HxrncAzZcqCgi+xdl/2pF
         umEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gsGY+0UZVoPSA8mo2nl7visSF7d9DDz5rSVCRqlxbqc=;
        b=xngQKiKyLdTJktW9QvewA5uzQlfnyx+qCnAHhCX1iJlWk6nUHLOKNWbPGGt0uaBpEN
         av0MZ8DnWdEPgmlw846/5JaP0/L6yzsVKhf0HzdRF3Fec6m6gatPeoyqHsErpUDXVkwC
         iMZQCguCklqpMJerdTImaArLnepkGbGElIa7Z6M1R4bK5KO2ukYVb/wiMdaTrGkOTEmD
         H+QsHjmFZdG86uAKLXjCFzNCCdF1Dqt4TKjLd0twqEgBBi3mNxe2433/jQZE+ghnlrRD
         wjoA++Pc71Xd32bw0pIPAlcukmINE1zJNjjbwwqzQ1p0XDc4dnK6rGgBFHjPEiNnXDCD
         ROLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SYmU846d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si4974267qtp.482.2018.04.12.09.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SYmU846d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fOq-0001YL-BU
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:48:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fIL-0004V3-Ow
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 12:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fIL-0001Gd-2U
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 12:41:57 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fIK-0001GK-Sv
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 12:41:56 -0400
Received: by mail-oi0-x244.google.com with SMTP id z8-v6so5793102oix.2
	for <qemu-devel@nongnu.org>; Thu, 12 Apr 2018 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gsGY+0UZVoPSA8mo2nl7visSF7d9DDz5rSVCRqlxbqc=;
	b=SYmU846dUmgbrgI/MGvF6KrTPGALFveAe/YI9uBbWjMwXkqHTV+iUmmonR763OCg/t
	mJ49QismoQissChddvPchQXlJPzT/pSYQTfnWQ5IrYrbfCkogh4K0KvC92Z1/3RYpl9A
	Sor3fLjmAZQDsASY1ndV8EUbn1lKJz0zm4J1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gsGY+0UZVoPSA8mo2nl7visSF7d9DDz5rSVCRqlxbqc=;
	b=gQRZTS3EsKspPDDK2NauUHzjMLshgqHLd07icJ07fdEKVelkOLwEKwnTikiw2WnBoe
	Qqwt8B6vK0geE4igAt9s9QV+sZiHMEzfL5eGlbptFV78AA3muKZKFq3gHZGJQLy1HSBa
	AnRdVsgU6Ap3k1oKOtDmd5E5wyRyZerf4uwSRbp9MYhJQQ11mOe3Po2uM5tHBZEG8y0W
	kOi4XPDYc4HhUMjHZi8UIbWKKS3bWc+vyeBpiBQjWakiMcNyvJRaOY/YWZEqWlaW+3Wl
	PXsqYWUYH1NTs+2MNZ/O2MZg6XUMvYJ57cXfp9df/6gVTnTYzUbBBNzOSx3vHq9PucRQ
	+4BA==
X-Gm-Message-State: ALQs6tD1B86L7YrFpbUiuY/cDLdnVG5GWb473WnOTsRbYoEuC5Oii3MV
	7Eau1Pws9vzMAi5vReHp3gL6q7RMTvuTq7HvwXknFQ==
X-Received: by 2002:aca:b2c3:: with SMTP id
	b186-v6mr5857640oif.337.1523551316072; 
	Thu, 12 Apr 2018 09:41:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:41:35
	-0700 (PDT)
In-Reply-To: <1521232280-13089-12-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-12-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:41:35 +0100
Message-ID: <CAFEAcA8pBXYQjbqOdSt5g1kwHbiax6iuirLOZZ0LBNxH9Ne5WA@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH v3 11/22] target/arm: Fix bitmask for
 PMCCFILTR writes
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L0wMgE8lsSvz

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> It was shifted to the left one bit too few.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 50eaed7..0102357 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1123,7 +1123,7 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
>      uint64_t saved_cycles = pmccntr_op_start(env);
> -    env->cp15.pmccfiltr_el0 = value & 0x7E000000;
> +    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
>      pmccntr_op_finish(env, saved_cycles);
>  }
>

I wonder why we got that one wrong.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Strictly speaking, bit 26 (M) should be visible only in
the AArch64 view of the register, not the AArch32 one,
but that's a separate issue.

thanks
-- PMM
