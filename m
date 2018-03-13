Received: by 10.28.91.67 with SMTP id p64csp1298769wmb;
        Tue, 13 Mar 2018 16:48:21 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtzJBYQkUy0CChNrP919PtNSbgjMUwjlZRusNiymNJF7SrKtZd9AB9HjARy6XM8dFR3JnTV
X-Received: by 10.200.47.120 with SMTP id k53mr4125995qta.151.1520984901774;
        Tue, 13 Mar 2018 16:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984901; cv=none;
        d=google.com; s=arc-20160816;
        b=EQ9Pm1QGHnsctK1odjDsJP96YK3VAJWmdpHNdA2/Hec/l6wPfKvrCcQy76U5GXtdN9
         SKOrmzw6lVSEzgUKYphFDmO+0e1KFz2mYFFZE6/0nXEsHFY3H5eLIOk5pjXTTN1u++0O
         g+m78y1JBA9x+Vl+1qOAep0CO43EScMDGq/2OB8D5ETAM3cH4NIvrix9Bh8HliJXxOgb
         fTbdsLVitjfE2ES6lsIUBH859T9qf3NkW9XWQO1VQtbYuHJElOPrOKNDhip4klKyWP4e
         MKbNpti23ydhuaUBPnOoJ0aw54CMBxbSYZtojznaSUSJdd2uvrt3gUeyk/V18usrCM1/
         EPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=jOLMcSiwcifXItM3BwShhD+SI28pNjJUDJtkjkauv48=;
        b=wlEjSXrjC8mkFqnGpybTkNzfmbbH8x3LZl9ETz2f4NE31eq17r+3h1y3irSzRmiq0v
         clzDu+bdCYqsy7qWlu8n1hfBmkl15ccKLh4+qhoanFMLa9YJzYvheZCP88AtvpcmiXCd
         D367ErETK6UL11TsQ+SqZbsQ4oJd11ZBpeTW/U/tVna4CzgaBncEe9BOW2uDzqbhXU2x
         Q7zUUl3Sy/IwLURR+agvNrmcaXwfU70KaVgKh2WzzIXzwuMPz9UUT6xp1gIPWikIx5iO
         9/7J0on+eGXYwaV6VLN4k3cXDxxTlvE8aokfiP7lk/wzD86UoztxiKubpdzIZc18VL0G
         S4eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oLVPpD+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n65si1321854qte.323.2018.03.13.16.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oLVPpD+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evteX-00082Z-8F
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:48:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtEC-00007w-Bb
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtEB-0002zz-EJ
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:21:08 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:45166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtE4-0002vz-1c; Tue, 13 Mar 2018 19:21:00 -0400
Received: by mail-wr0-x241.google.com with SMTP id h2so2589967wre.12;
	Tue, 13 Mar 2018 16:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jOLMcSiwcifXItM3BwShhD+SI28pNjJUDJtkjkauv48=;
	b=oLVPpD+Q/fyOBT037jrAImzrY+lj7KBrUhAR4jw5WWpobRCaAVGpfXoe6gmWsRcjfJ
	s/wLPDv0MWGq7wafjd8SPiTnah/LQqNHBNUGIRb6GzpHMrH5/gXQnbyeqc2EG6ePOOTp
	BrTXUMVNZPPUTcYCJrNZtjWWK7Yhbn+9Kyk3WGtnlEaNdzQW23Psw9jdlUSuQTpApIZn
	tTcqHdzJzsCRdoyJ83/D7fA8mk0/7NMQoXfQrPO9/3zvZs3O4S6aTAsPP5ZmlYQaCT/o
	0hZRQ+nfaqWfLHb2BwLWrFFbrS3KpkuVgDqe7WN41+o2KjtzLLw/lFXwxE9xkNsiZzUT
	v/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jOLMcSiwcifXItM3BwShhD+SI28pNjJUDJtkjkauv48=;
	b=S0RpCzHcX9WTXzw5osuaEN1fFKXfW19r/S8UpDVs/q3pq6Chp2liVH8gCzjevuRdW0
	0y6sXs0/hzKSsNXU4GdV6t7pygvLnYa3e1wJBr0ABW1VUkQmJJYR5aZTRz6NTus+abHU
	IFb7HqsodgoO7kDQFBrNeGJF50x1N4Fwej4kxkoyd+D5P3dGfrRMmMXcprouLwPq8TDY
	ZnTYzH6rl6LDvKKf8hXVTlKOZyFPsVvXRQvIof76C4qn3K9Sa0uHml8qxXyH20v2Yxzn
	c9SvQ0ZV7fo9dA6EhK9lnAovZbFlMQmvfhaE3Cndmfn/5ovDJkytyVaXmF/H9DST9o2z
	S+tQ==
X-Gm-Message-State: AElRT7F+NJAa111h/buNRKbHl/4JBoJr1L4wLNMN8eSP09lb4MpgfL5p
	Mm94NJTwLGl8vjkHVXk/I8A=
X-Received: by 10.223.153.45 with SMTP id x42mr2039557wrb.124.1520983258978;
	Tue, 13 Mar 2018 16:20:58 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65]) by smtp.gmail.com with ESMTPSA id
	140sm1865385wmi.34.2018.03.13.16.20.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:20:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e77539c8-5c9e-4ee5-edc4-a4d044e5c476@amsat.org>
Date: Wed, 14 Mar 2018 00:20:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [PATCH 1/9] hw/arm/raspi: Don't do board-setup or
 secure-boot for raspi3
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0QEsGVvLO8/s

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> For the rpi1 and 2 we want to boot the Linux kernel via some
> custom setup code that makes sure that the SMC instruction
> acts as a no-op, because it's used for cache maintenance.
> The rpi3 boots AArch64 kernels, which don't need SMC for
> cache maintenance and always expect to be booted non-secure.
> Don't fill in the aarch32-specific parts of the binfo struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/raspi.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index a37881433c..1ac0737149 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -82,10 +82,19 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
>      binfo.board_id = raspi_boardid[version];
>      binfo.ram_size = ram_size;
>      binfo.nb_cpus = smp_cpus;
> -    binfo.board_setup_addr = BOARDSETUP_ADDR;
> -    binfo.write_board_setup = write_board_setup;
> -    binfo.secure_board_setup = true;
> -    binfo.secure_boot = true;
> +
> +    if (version <= 2) {
> +        /* The rpi1 and 2 require some custom setup code to run in Secure
> +         * mode before booting a kernel (to set up the SMC vectors so
> +         * that we get a no-op SMC; this is used by Linux to call the
> +         * firmware for some cache maintenance operations.
> +         * The rpi3 doesn't need this.
> +         */

I was expecting a much complicated fix... neat.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        binfo.board_setup_addr = BOARDSETUP_ADDR;
> +        binfo.write_board_setup = write_board_setup;
> +        binfo.secure_board_setup = true;
> +        binfo.secure_boot = true;
> +    }
>  
>      /* Pi2 and Pi3 requires SMP setup */
>      if (version >= 2) {
> 
