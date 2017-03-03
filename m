Received: by 10.25.0.147 with SMTP id 141csp340225lfa;
        Fri, 3 Mar 2017 09:05:05 -0800 (PST)
X-Received: by 10.28.111.78 with SMTP id k75mr4067957wmc.71.1488560705063;
        Fri, 03 Mar 2017 09:05:05 -0800 (PST)
Return-Path: <fred.konrad@greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id s11si15572053wra.190.2017.03.03.09.05.04;
        Fri, 03 Mar 2017 09:05:05 -0800 (PST)
Received-SPF: pass (google.com: domain of fred.konrad@greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com;
       dkim=pass header.i=@greensocs.com;
       spf=pass (google.com: domain of fred.konrad@greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=fred.konrad@greensocs.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5B07E30AB1E;
	Fri,  3 Mar 2017 18:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1488560704;
	bh=USWBqz6acFX85pl9EUfJN7WRejuR1rtDzHlmAU2cmvA=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=hdghWVJzWnA+P/2yRNBD7CRjJCPQLXVO56CjoOMY/Ebsl9LUqX6lChrQ2OMyCmrfy
	 t1LzjV/ZmYIrx0Cjoig+JJmbbtZxwD0ZHjenuyDSPM5H0qVAKNA3kULicDQN/C7vN9
	 CQkIiqe/A9uCZQKa4WJbDXsdO7VPneeLMMdwXyIY=
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -1.1
X-Spam-Level:
X-Spam-Status: No, score=-1.1 tagged_above=-999 required=6.2
	tests=[ALL_TRUSTED=-1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1] autolearn=unavailable autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f39HXlDnR2Ll; Fri,  3 Mar 2017 18:05:03 +0100 (CET)
Received: from corsair.home (bd231-7-88-127-3-24.fbx.proxad.net [88.127.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: fred.konrad@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C3CEA30AB1A;
	Fri,  3 Mar 2017 18:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1488560703;
	bh=USWBqz6acFX85pl9EUfJN7WRejuR1rtDzHlmAU2cmvA=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=w/ArH0SnibWRyWtjgV6eyPy6GWmaVBYzPnxgboqBct1BYFaDL4CbGmZgwOFG9kOj9
	 pdzejoqwu174M1Cy+7YwaDfcPdlMnkFr2823H954RBCgke9Sk7KZ/UdUHFD/JBF+L3
	 +6BzAsd+o4VUXDG2Jz4B16yQb1d5DF8QJoFkuxnk=
Subject: Re: [Qemu-devel] [PATCH v2 11/11] hw/intc/arm_gic: modernise the
 DPRINTF
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20170302195337.31558-1-alex.bennee@linaro.org>
 <20170302195337.31558-12-alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, rth@twiddle.net, pbonzini@redhat.com,
 mttcg@listserver.greensocs.com, nikunj@linux.vnet.ibm.com,
 a.rigo@virtualopensystems.com, qemu-devel@nongnu.org, cota@braap.org,
 "open list:ARM cores" <qemu-arm@nongnu.org>, bobby.prani@gmail.com
From: Frederic Konrad <fred.konrad@greensocs.com>
Message-ID: <4e71b620-8ebd-0f66-f032-64fb8cc98b9f@greensocs.com>
Date: Fri, 3 Mar 2017 18:05:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2
MIME-Version: 1.0
In-Reply-To: <20170302195337.31558-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: dvYaU2wUuA7J

Hi Alex,

On 03/02/2017 08:53 PM, Alex Bennée wrote:
> While I was debugging the icount issues I realised a bunch of the
> messages look quite similar. I've fixed this by including __func__ in
> the debug print. At the same time I move the a modern if (GATE) style
> printf which ensures the compiler can check for format string errors
> even if the code gets optimised away in the non-DEBUG_GIC case.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/intc/arm_gic.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 8e5a9d8a3e..b305d9032a 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -26,15 +26,20 @@
>  #include "qemu/log.h"
>  #include "trace.h"
>  
> -//#define DEBUG_GIC
> +/* #define DEBUG_GIC */
>  
>  #ifdef DEBUG_GIC
> -#define DPRINTF(fmt, ...) \
> -do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__); } while (0)
> +#define DEBUG_GIC_GATE 1
>  #else
> -#define DPRINTF(fmt, ...) do {} while(0)
> +#define DEBUG_GIC_GATE 0
>  #endif
>  
> +#define DPRINTF(fmt, ...) do {                                          \
> +        if (DEBUG_GIC_GATE) {                                           \
> +            fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__);      \
> +        }                                                               \
> +    } while (0)
> +

Seems a prefered way is using qemu_log instead of fprintf?

Thanks,
Fred

>  static const uint8_t gic_id_11mpcore[] = {
>      0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>  };
> 
