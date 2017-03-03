Received: by 10.25.0.147 with SMTP id 141csp341406lfa;
        Fri, 3 Mar 2017 09:07:31 -0800 (PST)
X-Received: by 10.28.193.193 with SMTP id r184mr3502201wmf.80.1488560851238;
        Fri, 03 Mar 2017 09:07:31 -0800 (PST)
Return-Path: <fred.konrad@greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id v8si15597051wrd.2.2017.03.03.09.07.31;
        Fri, 03 Mar 2017 09:07:31 -0800 (PST)
Received-SPF: pass (google.com: domain of fred.konrad@greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com;
       dkim=pass header.i=@greensocs.com;
       spf=pass (google.com: domain of fred.konrad@greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=fred.konrad@greensocs.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id EC33130AB1D;
	Fri,  3 Mar 2017 18:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1488560851;
	bh=ui8ZqcGzRfxAiyqKG5Q/kLK6rsmyQ4asTwNh7g7hcWE=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=MmXJJ3NPVktH917dL1YjeK7kRIjNMNUuaFdRxc/YCaSA6WToGM3o3RXC8B6DI3t5o
	 sGox78fdoB+by9QOqv7trKJ423DBvTb0ZnnqmYzISR4t3+UQgbkKMDZjmiXOsl9tuN
	 1oS45WI7O1NK2Vnk29p8jsUOtQriWGtzYixNerKM=
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
	with ESMTP id FiMBg6HbhJJR; Fri,  3 Mar 2017 18:07:30 +0100 (CET)
Received: from corsair.home (bd231-7-88-127-3-24.fbx.proxad.net [88.127.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: fred.konrad@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 915F630AB05;
	Fri,  3 Mar 2017 18:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1488560850;
	bh=ui8ZqcGzRfxAiyqKG5Q/kLK6rsmyQ4asTwNh7g7hcWE=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=uxaiIhCyz+d/fF+pif06Z5ABa95tE3XHnT2kW0iCaQgm5oVdh65Ly8vv5ACsbWZZT
	 RtuqR1mHrXEoyjn913qAMxtPS+bj2ddrhPASNcf597YY4Q+SUfXktsW2+V7xzc1PaQ
	 GUb25JJBJ5gx6lpVVXMInOFPkHrTiz3QwItyk9R0=
Subject: Re: [Qemu-devel] [PATCH v2 10/11] target/arm/helper: make it clear
 the EC field is also in hex
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20170302195337.31558-1-alex.bennee@linaro.org>
 <20170302195337.31558-11-alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, rth@twiddle.net, pbonzini@redhat.com,
 mttcg@listserver.greensocs.com, nikunj@linux.vnet.ibm.com,
 a.rigo@virtualopensystems.com, qemu-devel@nongnu.org, cota@braap.org,
 "open list:ARM" <qemu-arm@nongnu.org>, bobby.prani@gmail.com
From: Frederic Konrad <fred.konrad@greensocs.com>
Message-ID: <06e77aaf-491e-8345-fbc1-e1027c20252a@greensocs.com>
Date: Fri, 3 Mar 2017 18:07:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2
MIME-Version: 1.0
In-Reply-To: <20170302195337.31558-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: QVelKImHnGo3

On 03/02/2017 08:53 PM, Alex Bennée wrote:
> ..just like the rest of the displayed ESR register. Otherwise people
> might scratch their heads if a not obviously hex number is displayed
> for the EC field.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f4211b572..76b608f0ba 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6857,7 +6857,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>                    new_el);
>      if (qemu_loglevel_mask(CPU_LOG_INT)
>          && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
>                        env->exception.syndrome >> ARM_EL_EC_SHIFT,
>                        env->exception.syndrome);
>      }
> 

This seems OK to me.

Reviewed-by: KONRAD Frederic <fred.konrad@greensocs.com>
