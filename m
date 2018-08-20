Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp633091wrd;
        Mon, 20 Aug 2018 05:34:08 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyMlj65Sux08jx2wXj6VD0APbDzNI+RMwIG9FDlSPTTAcpuD0EoqQ7N0+hoNatcUu/IR0+o
X-Received: by 2002:a0c:d647:: with SMTP id e7-v6mr40931887qvj.238.1534768448349;
        Mon, 20 Aug 2018 05:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534768448; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpqMkweKIkWjwP5f59OXnxQFdgTWLFVWu/7KTrpc6pwEjM7ADKUBX9lZnnC/IoyP6T
         6x2eRnwiRQAYiRUIVgbe1e5suxxJhql2Fm1yM22iYdV5BmnokHeJuYRMP37Qa7X3kTcq
         pyexQfFto21mY7QnB1MKP4M+j90/1mKZa+dgggvxHp1KXuOK2KRi+N4tjJs3EnlpspFu
         ZMofOwcHhq3Q8nKQO39lUUwZktPkEC99qQDCjKFDp6VYvMjpGlkXYZvoswCp10tb+EfQ
         hsOKeZavajt8oZcI9QAe/bgGVdjYxXL2F48gyfAZa7RpiV4g8D2vmBfSRXL8oBENlBQ6
         wOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FjlDf/RK86IeMREsWUJYw4jAJTmNiTkSUp4Lp8LOf2I=;
        b=rLgChJ08qcbegG8nl2AESfUKqHyeAvgoTKy/5vyjRm5p/uNrDBiDpKYpAsErmf6+Bh
         gHy3JtlgzXfRkBFUaJ13vl1raJky4J8Qvb+Ld0Ga5KSQAHzGHJa6dYSxwfCZxcx9SrIz
         xSeZjk/gmIh5Wc3vSyI66ulcJqCXHlOyuHD8IErLc9MjExuQexzlHpzeywPJS3CIkoin
         XNlBHsIdbIwo3P9NUFcOwq9IfPOa7iylpbaH2h7O/7paKXI/WwbUYKYXEOCJYFfZYat/
         wdKcs0kzMXPhrS3kXKjz4XoJxH1HKmmg3e3h9C/P1yQBlTTx6yTI2oIS4O074Nueekhp
         Rxpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KgNmd/M/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l63-v6si1282177qkl.193.2018.08.20.05.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 05:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KgNmd/M/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frjNn-0003AY-T5
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 08:34:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1frjNW-00035A-Oc
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 08:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1frjNV-0001SY-KJ
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 08:33:50 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41221)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1frjNV-0001RO-31
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 08:33:49 -0400
Received: by mail-oi0-x242.google.com with SMTP id k12-v6so25443867oiw.8
	for <qemu-arm@nongnu.org>; Mon, 20 Aug 2018 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FjlDf/RK86IeMREsWUJYw4jAJTmNiTkSUp4Lp8LOf2I=;
	b=KgNmd/M/uPoMFLcJuHY3HfO3A320UstWLHGw80odEzEDkJcgVrKdSHSkxXKzzP2DqM
	zH8tqh8upUBPUV/44IzKCCA1rHhBVK+6hZKPdZssfKxe3TUJUUQ+I2mhzyecBh8OYDfs
	X4PsI973ai7r6uupDb3HGFB8Ouy3keGG97+iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FjlDf/RK86IeMREsWUJYw4jAJTmNiTkSUp4Lp8LOf2I=;
	b=mIHqYX/XHynTiS0BPwsfIYYimbbX0i/JoNdiEo0mTZbJr3LJIJNbYkLmbkFpb97UKe
	w91GeL2BScA2dzNPz2A66tEHeFHrBFrQpgPzrzEMvKTG885kWnZdlzw+yB8YOpQhc1Mi
	LIqL2rnEm5PHoeZRr2qWN6HR1XYC3qgsvhhcAZ26GNgHcHooFwuJEBqV4XO2Nl5CZQXo
	bd3XN3nUkJ/vqyy/uDUV4ALo8ix3mERzIxRJZYzATjZG8oZXcCMm5QBWS+j682/ZswsE
	W0smltd+EUX6iwuzVKdQMICBUlCGr3ko57Rdl7BoP/vQ3IpOBz5L+kfS1dImhyNdBjXE
	lfuw==
X-Gm-Message-State: AOUpUlHZ2md1sl8bu2TAGPZn1XmlnJcXeqrCQhkoggVzyrY3htXfmLm1
	47tkmHiAvtcw/9GuGgKSrpniXODzW/mDfSfBmUG547TNYMsA+g==
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr12909190oia.242.1534768428384; 
	Mon, 20 Aug 2018 05:33:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 20 Aug 2018 05:33:28
	-0700 (PDT)
In-Reply-To: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
References: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Aug 2018 13:33:28 +0100
Message-ID: <CAFEAcA-gbG0xF3faXZYpkg_OyOyNcPyviDBhytzi1AkUj3FL4w@mail.gmail.com>
To: Marko Klopcic <marko.klopcic@isystem.si>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH] arm: fix reset operation on netduino2 board.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BsDR4MdG0URa

On 20 August 2018 at 12:10, Marko Klopcic <marko.klopcic@isystem.si> wrote:
> Because roms are located on aliased addresses on netduino2 (Cortex M3,
> STM32F205), PC and SP are not read from loaded kernel, which means
> that the first reset fails. This fix adds additional call to reset.
> See more details in code comment below.
>
> Signed-off-by: Marko Klopcic <marko.klopcic@isystem.si>
>
> ---
>  hw/arm/netduino2.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index f936017d4a..a2f102b14b 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -25,6 +25,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/loader.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/arm/arm.h"
> @@ -39,6 +40,32 @@ static void netduino2_init(MachineState *machine)
>
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
>                         FLASH_SIZE);
> +
> +    /*
> +      The following two calls are a workaround for problem with rom on
> aliased
> +      addresses on STM32.
> +      Kernel is loaded into Rom objects, which are stored in loader.c. Roms
> +      are copied to memory in:
> +
> +      void rom_reset() {
> +        ...
> +         cpu_physical_memory_write_rom(rom->as, rom->addr, rom->data,
> +                                       rom->datasize);
> +        ...
> +      }
> +
> +      However, since CPU reset is registered BEFORE
> +      rom_reset(), SP and PC are read from memory BEFORE roms are copied to
> +      memory. CPU reset also checks Roms for data, so this is normally not
> a
> +      problem, but in STM32 PC and SP are read from aliased memory, and
> these
> +      memory addresses are not mapped to Roms. Since ROMs are private in
> +      loader.c the only option to copy Roms to memory is through reset. So
> we
> +      first have to register Roms for reset, and then trigger system reset,
> which
> +      copies Roms to mem, so that reset vectors are in memory, when
> +      qemu_system_reset() is called again from main().
> +     */
> +    rom_check_and_register_reset();
> +    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
>  }

I agree that this is a bug, but I think this is not the right way
to fix it, as it is not specific to this particular board. We need
to either somehow ensure the reset order between the rom code
and the Arm CPU reset is enforced, or change how we do the SP/PC
load on reset of an M-profile core.

thanks
-- PMM
