Received: by 10.28.91.67 with SMTP id p64csp1998609wmb;
        Sun, 18 Mar 2018 16:15:08 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuRVahTsDjcXg7gbQirqIa3vASjNzA0/LpswSPWtFiWzTuYSbHLxwMrdhVUEVjaBkb33vQK
X-Received: by 10.200.56.76 with SMTP id r12mr15804210qtb.125.1521414908841;
        Sun, 18 Mar 2018 16:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521414908; cv=none;
        d=google.com; s=arc-20160816;
        b=weKH43ky3QSiIM++ZYWntdQSKEhd1h9CoV8WGy9opDUeZ27W8LNQuVJ+m58NYQMTrY
         6DVKVqtpmZnp5OHgcsv8pQrMefydo64tYfyKVyJ5pcnoreRwmPYMF63MJggeSsqNcevc
         04/A53J2jT5K+KqOWd1J3A+3sOP6equ28PxJEgFXwL2otkniU6hzzL1B69Vw9N+/chfK
         5XDVg+Xo/GMtyroA8BjSC66ioG1Tdrdn4FyH8T/O9Svzz6t1Zwk3D6zO01UjlhBCte5r
         Qy02/JusowMZHGt+UPpNYJsPxiP5c0xYoCtDKv7Ks2J4Mq/1QJoI+PTWErfjS0dztxsT
         gG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=e3Vj4tMRoGY+2sO4Hj2lHwHwlfcgDNlmSMrdSOnSaic=;
        b=WxAE7s2jE2Lo6DiN2su1kOgnzEk9DLJneQA8g/9jbZU1mwJkRKINPgjRqCO5DcJ7LF
         UZY3HhED9CpzZyCC2+37d0wATVyZdJdBe4JRKdUjS7SgCkGPtpokpTiEIkZRPowcIPPI
         5SP33g2/jJh5jrE4P+G9UvkYUPiaCsQbDbRgXWIVUlNcj3wN5IBUzwTZ3PAbMr3Sofb/
         VwEnM17NdTNwD75aVt2zEmWJeph2Nw5fs5C5wPYCM890R0AnTv/UZlwWh0e2ZpBZyV11
         XMm/n4gqMGGUqnTEwIzcV5I6x54bsO8yMUi+OnnK0y67Qj+PGemGdZZhOTndaV07yDgK
         v5Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LF+MTqoj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y28si12968641qtm.465.2018.03.18.16.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 16:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LF+MTqoj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exhW8-0005SK-CX
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 19:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exhVl-0005Qa-8P
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 19:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exhVi-000079-2q
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 19:14:45 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:35072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exhVh-00006w-Rk; Sun, 18 Mar 2018 19:14:42 -0400
Received: by mail-wr0-x242.google.com with SMTP id n12so16813025wra.2;
	Sun, 18 Mar 2018 16:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e3Vj4tMRoGY+2sO4Hj2lHwHwlfcgDNlmSMrdSOnSaic=;
	b=LF+MTqojt5tvpeqPLXtmhtm8BEQciVdMBJpb92rl36gsKvtZYA0S4sfQuIZ2rh5PWa
	gUMqqFxRTEkevqk2Oy8lR/jHK6dAIWBzEiLAtKuBIs+otSTfe2eJxY6x9/oT1gbmUf1q
	YZIxuVoZYuIGj9AbFjOMny089s2t5+gYB/aIshJNq2kYwUTRaTjqW6kWxm080AbGkNcR
	ykxXxeqSZw0NiXAUHKRTSPhMbakJxqREzmFxVEngy0dVWSFB6yvTDuvo4nxb7c+3Puhs
	WC0xiHoXt7ZayLEo9Q0PcIDFS7inX52ywrYhJff8Hxzx7WRz8+2PPV+yhLUyi9IiBeKL
	MTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=e3Vj4tMRoGY+2sO4Hj2lHwHwlfcgDNlmSMrdSOnSaic=;
	b=aGN3tuioBKbN/+5su4D7H2QeYjoxo7wfC1cw3rg9+GqEMwsqhQDhtP8BIMdMA8VZmG
	v1XNLRKX3hhOwq5ZTikz1IXr517INYU8+LDUysLa39dY2crK3Oblx02MmKLfyTAGYbPn
	96/ee78om5aoHaCwE7dmTgSblrT1B3FRegReUQgHgARvdrpBAomE4lXLqv+gZWoHeXrF
	Ya6lYsd7/E0NbuKTQUJfPX6fOfyPVyTQCBZwM+Q8C4U0x1yQryqW/1Xub+hjIYeqqZ3i
	aCw2FUGLONXHtEv+j9mb6nKNgjCN0DAa/PPu5x930fxCeg3C3FFJVhR11gFZE0JYRUeA
	18xA==
X-Gm-Message-State: AElRT7FYu7YMoAdaULifhLeCAbo90OYdCdmkn+Y8dExY/dVNvhvILXrI
	Xb4CzG+C2IAnJMEsF0RvqQQ=
X-Received: by 10.223.182.16 with SMTP id f16mr7355548wre.51.1521414880641;
	Sun, 18 Mar 2018 16:14:40 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	b5sm15249078wrb.42.2018.03.18.16.14.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 16:14:39 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-15-git-send-email-alindsay@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9af89876-bf5d-4696-a430-664fcd5a02fa@amsat.org>
Date: Mon, 19 Mar 2018 00:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521232280-13089-15-git-send-email-alindsay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-devel] [PATCH v3 14/22] target/arm: Make PMOVSCLR 64 bits
 wide
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tiyzNSU/JGZN

Hi Aaron,

On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> This is a bug fix to ensure 64-bit reads of this register don't read
> adjacent data.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9c3b5ef..fb2f983 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -367,7 +367,7 @@ typedef struct CPUARMState {
>          uint32_t c9_data;
>          uint64_t c9_pmcr; /* performance monitor control register */
>          uint64_t c9_pmcnten; /* perf monitor counter enables */
> -        uint32_t c9_pmovsr; /* perf monitor overflow status */
> +        uint64_t c9_pmovsr; /* perf monitor overflow status */

This doesn't look correct, since this reg is 32b.

I *think* the correct fix is in ARMCPRegInfo v7_cp_reginfo[]:

    { .name = "PMOVSR", ...
-     ..., .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
+     ..., .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
      .accessfn = pmreg_access,
      .writefn = pmovsr_write,
      .raw_writefn = raw_write },

>          uint32_t c9_pmuserenr; /* perf monitor user enable */
>          uint64_t c9_pmselr; /* perf monitor counter selection register */
>          uint64_t c9_pminten; /* perf monitor interrupt enables */
> 

Regards,

Phil.
