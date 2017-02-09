Received: by 10.25.77.65 with SMTP id a62csp189410lfb;
        Thu, 9 Feb 2017 13:51:07 -0800 (PST)
X-Received: by 10.55.121.134 with SMTP id u128mr5609364qkc.12.1486677067463;
        Thu, 09 Feb 2017 13:51:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si9022825qtb.169.2017.02.09.13.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 13:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbwcK-0000PE-Uj
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 16:51:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbwb6-0008Cr-J9
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 16:49:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbwb1-0002Ra-NK
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 16:49:48 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbwb1-0002RQ-JV; Thu, 09 Feb 2017 16:49:43 -0500
Received: by mail-qt0-x242.google.com with SMTP id h53so2306882qth.3;
	Thu, 09 Feb 2017 13:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=DxTDpzOuY2FUYiviCAXU7wslrRDJBRycDHKoO91+PmM=;
	b=dJqwLp2YjWPYgqPV38LVkm5D1T9KJXt8N1f4XtnChGQzrSqk3Fwm8vOAxi+m9cJYBP
	0Su7UN1jkHwC98TfiPtd2xetWeTd2msCPuPWaAq1TDY0a1Gs9/e9zlPaA7KBeif0qJg+
	qlr4kVMKaDAIQ+JEdWJFN1pk8FZ4uLxTY2c10IjgQKn+zZv1Dq9IwKMQlsD2vT4vg/tr
	9EjkyQpxje3S/nX/Xg/6Qlrw27obsV5Edrs396cg2k5TfYy+/n7R1ipfwqTVXFG8qwMg
	yM28mq8mKR+DrpvmrY1tOUjt2ZP1Pxzi3YEX0ITwHgcIuwRmqvC2QD4E5b3MnjM9Kztc
	GlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DxTDpzOuY2FUYiviCAXU7wslrRDJBRycDHKoO91+PmM=;
	b=tzbKwl3KegbyRRid0YKTdEHkPmdGzI+snEpqQiw1ItZ/Ae3QaSWgC1fuHmZyWAhfjR
	my8TcAk2hgKB1X8YcWcNWm1bHeltBxRHqGMQ+CdLiFj8DshRkYck2xhoU0ZTwab7Jqrz
	AajHVMXjhElrfduEZvJm57kEguAKYR9+9Ah7oIhhtKT3X8xN+5bdeNuoMskVAI+C/xIe
	hU0GJoA21nUU6MVOkXIQZl4RAdOLF6FHl/nTnvRcrqbRc5QqdXR0g4HIZfzlbpHVO6kV
	1mkpJyM12s2pEAsyx4UOgXLcp0HO+4Ru8jvq7WAHCUMfBDm2larFwsZJbzVWQasvPE7p
	ftbA==
X-Gm-Message-State: AMke39maJPEDOAAGEeWl3jAYumWNZc4eiAIILRJkcB1Z6CR3BJjI6Mve533hsLYGRzDrYQ==
X-Received: by 10.200.54.247 with SMTP id b52mr5616463qtc.124.1486676982928;
	Thu, 09 Feb 2017 13:49:42 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	c19sm10312664qtc.29.2017.02.09.13.49.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 13:49:42 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1486648058-520-1-git-send-email-clg@kaod.org>
	<1486648058-520-5-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c3edd594-8feb-a06f-d239-2d7580cfb883@amsat.org>
Date: Thu, 9 Feb 2017 18:49:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486648058-520-5-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/4] aspeed/smc: use a modulo to
 check segment limits
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M769Omko9DDt

On 02/09/2017 10:47 AM, Cédric Le Goater wrote:
> The size of a segment is not necessarily a power of 2.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/ssi/aspeed_smc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 70177078a8f2..cb515730c5ad 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -475,15 +475,15 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
>      AspeedSegments seg;
>
>      aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
> -    if ((addr & (seg.size - 1)) != addr) {
> +    if ((addr % seg.size) != addr) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid address 0x%08x for CS%d segment : "
>                        "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
>                        s->ctrl->name, addr, fl->id, seg.addr,
>                        seg.addr + seg.size);
> +        addr %= seg.size;
>      }
>
> -    addr &= seg.size - 1;
>      return addr;
>  }
>
>
