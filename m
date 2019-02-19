Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3514107wrx;
        Tue, 19 Feb 2019 07:13:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZndywCEwzZIl2uzMMsRmzMbANM9fD5qfDLv1PcvRTD/GH/dXCox2QVytQNNMn42PxtvVSN
X-Received: by 2002:a25:2495:: with SMTP id k143mr13451389ybk.74.1550589206520;
        Tue, 19 Feb 2019 07:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550589206; cv=none;
        d=google.com; s=arc-20160816;
        b=tVcVMbkhv8CvwZt+iL0HawovhVOR5U/hR5WeCA2HwD7Qb03Fr/vVRJKfJVlrCqTBUj
         ekNZvdqTlX/YgZosvAP0R9f701mBW8HtCpwloGIuYRoUco4OQNChWbZJd5K1UqcXzObn
         4qNFwK9krMRZXLBRO1yvU8IXNTcNQfvnRNsZUrdYgbSNFZBc5+sAuKIg65PSb5ytAzWv
         iP7mMvDcmWvyM/X2w05eo8YcCB5q0ucYS293RDnZI/s4QUbAjD2DduYDay20MB9CDuwO
         9+zZduRHcXK4XLgF7o2bFlLI59ofMh8F9nC+RrVE1cJHQSeWrCIxyT8BxwsWEZwv6uSx
         fVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WUyXUUU0zT0AWig5rYfd0mzvvgVpIXUfB0BmtrsnEOs=;
        b=U1wxMgtgTMazHv2siiAIq2RC3aigNXC/9Ok0Khr83S6XTr9a2K7nbtrwH/C4oBSCII
         Y3h6LoQZM4fdvNjvPpK8czLS9ifm2swOVZ8Ljk+g/EQ52wdsqh3M4umerTILcOH2O3z7
         TlNEr3Z04BItxzODEzBZabgRmnyxDGGNHedVeK/Gg9D5/8dLvFJ26fgod9/R8iYFplgn
         ZBbRlaycjzG2nUDZY1oocFhOTBfoIr65drwSBKlKvjmcPpISDG89ICuYIvvhb+Ob/EiX
         TsOOO6FolP3/5TA1gpm2dg8x/wUc+wbXadCL4fUEItlBw0YJKQsppz5Q2lgVsi5Z4pu9
         NiYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zsepxkhb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k71si9093684ywa.354.2019.02.19.07.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 07:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zsepxkhb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw75J-0000OI-Sv
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 10:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw755-0000Mu-MM
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:13:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw754-0007Il-Br
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:13:11 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw753-0007Hg-VK
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:13:10 -0500
Received: by mail-ot1-x342.google.com with SMTP id i5so34648372oto.9
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 07:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WUyXUUU0zT0AWig5rYfd0mzvvgVpIXUfB0BmtrsnEOs=;
	b=zsepxkhbRN86g/IrZ05Z0/5jSCi8Dmsy9aYp9tewPnzAMptgAndWAiQW7Xc9g9pmuh
	rEYPYJY2G3z+PBQO1OdkHhM1d1M6te3+yhtmjC7cHHnoMW7Z2A0UtSpF/3pWLvcAGUM8
	fhEKSPdEv+kBftsCeBkGDL++Bontk2nlDR8hiFWCvnKNwJcFHZiSsdApRsdp4tZm2ywj
	+ckH/g+vZeYPIvubtEyv15QyntkOW7+5SXTKTZNHJaevICh0ItE56wkWQAvoQEpumMyt
	fij/Kc/y6TLE9Q3/cvomD0zqlqmxjjXXEldVsCjd7levgtxpSYZ7x22FGz7raWCNGNjl
	AiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUyXUUU0zT0AWig5rYfd0mzvvgVpIXUfB0BmtrsnEOs=;
	b=ud0zjazMEmklU2OAcq2gsB9fukZ1IGSyFClk+6Gp5R5+wiXgk4xfc0tykLMJWrwWxa
	le1kwm9mJTxyAPJFF4pnLv3BnqWWIR/G6NqFN4CnNacX0CEx9+ink8+sdedh1NAq9M53
	Of3qo3yjeEcE4w+bWhs0LmkmdLPAgrMDpRwQrcf2xCfhg9kHb4bjR7OB88/LOVayNQLI
	5RtfOwPSDIQIUtNM8aGr9kr4pvcI00uDWE64HLPKX/p1qb8dd4TgxpNWJGl3lyszzGft
	gPtmNV5wzLKOf744E5yx5rcotOBgLkY6vVRTOkJzNJAIbLfGe81tg+L53vsbRofRyHZ/
	ggMA==
X-Gm-Message-State: AHQUAua0FxEdicsLFHuNWZjUChK/u5kJlZySeybOv53lkRoHFF7YERyc
	B4YX3tQSO1vsV4dIvD7vvsx4M7o6aDVmMB11Wm7Lhg==
X-Received: by 2002:aca:b341:: with SMTP id c62mr2593274oif.112.1550589188641; 
	Tue, 19 Feb 2019 07:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20190219144621.450-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190219144621.450-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Feb 2019 15:12:55 +0000
Message-ID: <CAFEAcA98f=vibRvCNuq2qp_Hbj83LeZZPOMd-qLxxXYrPMOcEQ@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] target/arm: Stop unintentional sign
 extension in pmu_init
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gptFig5S/1MK

On Tue, 19 Feb 2019 at 14:46, Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> This was introduced by
>     commit bf8d09694ccc07487cd73d7562081fdaec3370c8
>     target/arm: Don't clear supported PMU events when initializing PMCEID1
> and identified by Coverity (CID 1398645).
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
