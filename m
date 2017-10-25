Received: by 10.223.161.27 with SMTP id o27csp1741577wro;
        Wed, 25 Oct 2017 07:35:25 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RNPnR0A0G4g77TMMNNMvJFzM3JOKKCq/J4BI/y6cN/10u5RndJe4NM73wTchy23NzsCu/v
X-Received: by 10.37.175.131 with SMTP id g3mr1476111ybh.96.1508942125169;
        Wed, 25 Oct 2017 07:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508942125; cv=none;
        d=google.com; s=arc-20160816;
        b=mLCuJy4aVEJvm+HCACHbQq+smwXcG1HtyH7oQvFl7lNc0zjepwtteyg+msbLgvBbon
         9d2pp4/gJXzkChTpqny4HMOJiJa79y8x5hFtlQq4xGTEV9l+WR+zwGmTpN0vwlSQh4z/
         x9zUNRFZH5xxoTT6FLgPuS6djOKXzuDnDw/lBW/qfiyoPGvW7abucC57doWUOXpnkfrB
         L1exgpCaO+Pp47dGn+YDzZJwffo+Q6/V09vjfMlaatqDlJWsVMq34Zf6y9t2xlvllwSN
         9UlSjofLCODlSskm4s4iUm4JfHGX0+4C00xZERxl0s/BDkWskrP/quDa3G7RxLDcvI6h
         508g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5jrQgAc4ITCpI+WcPi1WMA6mn8uqs26m5kncgMcgTio=;
        b=FO+JhS4eZoIaGt5BXHVybRWTOBo8clXABWJ7pLZpDKxl89nPHtq1Rfch+iU/d6zD/7
         gw7Nt8MnfCs5mjtW/jr4nQ0kkmkq5AYfRzLGcgZz2T0PTT6eH7LeGM13dhEZ9wGBYmBr
         Hycg00yEj3sZycOxYApPoQHYCRjThEgk0AmshEV1r1jtC8ZZuEjCFxDd8D30k5/+0awK
         H+OQ7OeYypUVBmqPW/Efj38JkIpJbfP/q9ymnpX4fc9wgXkRriZ6EfiybJrvreIkmFV9
         PJJwwAOSH4RkuO377/o7rhCjxRvD7RhgYmB+ll8hMuIyvfXPGU0EfsFcsQK/PEHtcxUd
         v6jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gw5DItYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2si433854ybn.689.2017.10.25.07.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Oct 2017 07:35:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gw5DItYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7MmC-0000j0-La
	for alex.bennee@linaro.org; Wed, 25 Oct 2017 10:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7Mm5-0000iT-53
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 10:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7Mm4-00035b-3S
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 10:35:17 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:47511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7Mm3-00032X-Pn
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 10:35:16 -0400
Received: by mail-wr0-x242.google.com with SMTP id y39so210253wrd.4
	for <qemu-arm@nongnu.org>; Wed, 25 Oct 2017 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5jrQgAc4ITCpI+WcPi1WMA6mn8uqs26m5kncgMcgTio=;
	b=gw5DItYSl+F1ccBc38tpBAcO1yqkBs/mf85zDXwIl/ReM27bsMyOSZDblqu6qZbdWe
	FaMF64E5DiyKt4qmB+Kyf3iS0Tkw+1MIklnZ0p9C698lbCq+gSzF4DRiuY7t5NvFXI/g
	H6w15iG4U3AedeITgY4VAIvJF/OCSVPSwtPy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5jrQgAc4ITCpI+WcPi1WMA6mn8uqs26m5kncgMcgTio=;
	b=Con2PyyZSThWSzjj5xKf9WuCGMhY1olTPTIOQahLy6R+dvNV3DkFfClZ6lfu4Bs9Tf
	yNtGu7r+mrDdP9tV9K82TxF5Lm3foP7m67yF2Y10wJYe04d0/iiprVQa+qbVShvIH0cj
	TsO/QAOifWItM3taVGkndkDuZDCaFl3bgpQ70eP7hEBStauhhotWU+OT7w0ZZ7GrWf9+
	QYZ+NaIzIg5gjOs193fM8oNwG/fj6wjmtZ5mlWCqv6S64fsjZlORJjUhfp4//jXrcxbY
	weffDpKMVmY7/LHHZ63Kul9JJtgkw9Zf7yvRP+Gz9c4M4UeQwxtIBHSxupErcfJl4Y+U
	58Sw==
X-Gm-Message-State: AMCzsaVlApo97POyVx06C2dTHIrmPVgigeJXPUZ5NfbfHpt5JIEVkMZp
	m8irSb/HBcrmoyM8vixYnVd2kIp+yoyJBQBZFAQmKQ==
X-Received: by 10.223.143.54 with SMTP id p51mr2372155wrb.138.1508942114216;
	Wed, 25 Oct 2017 07:35:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Wed, 25 Oct 2017 07:34:53 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710241055160.574@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710241055160.574@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Oct 2017 15:34:53 +0100
Message-ID: <CAFEAcA_M2Y+Qv==YJtuA32ZZO78+nKG+uwr_+sJv++HC9NtmuQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH v3] fix WFI/WFE length in syndrome register
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ModYzKNOJHZe

On 24 October 2017 at 18:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
> WFI/E are often, but not always, 4 bytes long. When they are, we need to
> set ARM_EL_IL_SHIFT in the syndrome register.
>
> Pass the instruction length to HELPER(wfi), use it to decrement pc
> appropriately and to pass an is_16bit flag to syn_wfx, which sets
> ARM_EL_IL_SHIFT if needed.
>
> Set dc->insn in both arm_tr_translate_insn and thumb_tr_translate_insn.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4da1a4c..0a7b67c 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12124,6 +12124,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      }
>
>      insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
> +    dc->insn = insn;
>      dc->pc += 4;
>      disas_arm_insn(dc, insn);
>
> @@ -12191,6 +12192,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      }
>
>      insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
> +    dc->insn = insn;
>      is_16bit = thumb_insn_is_16bit(dc, insn);
>      dc->pc += 2;
>      if (!is_16bit) {

This isn't quite in the right place, because it's before we load the
second half of a 32 bit Thumb insn, so it won't give dc->insn the
correct full width insn value in that case.

I'm going to take this patch into target-arm.next and fix it up locally
rather than making you spin a v4.

thanks
-- PMM
