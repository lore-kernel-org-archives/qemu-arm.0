Received: by 10.28.71.155 with SMTP id m27csp4774225wmi;
        Wed, 4 Apr 2018 04:58:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/Wk69/xgjQ9fdN1/K55sAeEg9hwRHtuxdV5OAzLDE+dQNsx1QZiFsMm9yMzhxeRPUqxy/L
X-Received: by 10.200.112.214 with SMTP id g22mr25764293qtp.95.1522843092046;
        Wed, 04 Apr 2018 04:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522843092; cv=none;
        d=google.com; s=arc-20160816;
        b=QX0aERj3cO2AOeVGbhbFHTSOVFO9LVgEDyNyyZLD17gTQ4IZ8VsULC6t7r7Vvoqg9y
         88gZaBJQzwjrMB6iXzsiW2j62nlhk5cvxOJ1djywzrQNMH8xnx7Mb0pSPrGlFXgu5slw
         /R9DwPT3Ozxr2UlhXNBwlL4+X/oTECJf8lHCEdrNZ7NeqT9f5xIwHv87Vxd21IIiJMlD
         MUl18cD10KAdPzTxsOTApd13wHIWg62RvWipRijQPqQk6klvZvh3O4OQoE0zc97J14W0
         v8d9rSVr/bRWXJNFsW3vCIo/SEJRPoKLhEAPHggFSOwM+/tkmUSjRVw4RBdVFOIZKMwb
         Cytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OWjS0YIEJR7i4tSmTL/5RSMy/vWYtzjZOtYmCERUs9Q=;
        b=bwuKVgqWdr4FEsf5sj9uXnUoPLk3enK7gAfRR0dAcmf/OtAW84f27UNrg6bMJ0eeNy
         tkIMX2LALKvm9Bl7MH1KLvKi7wLHyRBDsEBpl0MQJHG0v046A5EVSrw9LmxhnUtPJTPZ
         wCOeBaWDsItn8I9nb1yYjKWRv8k1RU4fPzMnpIZ6OyLAU6IPDkk1ov2xBeADpc2OerZU
         gOxHnN0xJSxpEEQBQoPVTi+uToT3OBR4CmhiacVCiQetqqfpcHaTR/LuGPjPn9ti9s0w
         +/Mt1maTFIfXHLmU3e3Tmm6boz02lRXKJhGKQvJEm+CuUCIPrd4Lf7YKogqUiGLmgbfz
         FVsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nwe6uYxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16si856267qka.455.2018.04.04.04.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 04:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nwe6uYxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3h3L-0008Lr-Im
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 07:58:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f3h3C-0008KR-1c
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f3h3B-0004ku-1g
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:58:02 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:44519)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f3h3A-0004kW-Rw
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:58:00 -0400
Received: by mail-oi0-x243.google.com with SMTP id j143-v6so18915805oih.11
	for <qemu-arm@nongnu.org>; Wed, 04 Apr 2018 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OWjS0YIEJR7i4tSmTL/5RSMy/vWYtzjZOtYmCERUs9Q=;
	b=Nwe6uYxgZKrYnF1HU/SxpV84lNTlJq0RGzh0QdTaEpnJLI+am86ay6BJ7ddRZfYUw4
	MbXvwxeQ6/ciCfJ7duEaQnx/P3i9LJJNDxhcdru8RGT2jRhiQG4weparETB2ZgM43Gu4
	aclAKobF670p2/cDjdUwKkVujWh34uah8+PLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OWjS0YIEJR7i4tSmTL/5RSMy/vWYtzjZOtYmCERUs9Q=;
	b=XddO8iC4hqzWOxRTGvziYIDM25PmAm3YfDfQVgpwAUH9XbhH8kokB6Kp9pdqXv6dG4
	QWOJH7JziQ496X8mXl1RPcOpMqN51ansXyVryZlRNS57TbK/NlmE64kZIcPYvd4e9Bf9
	lCe3oDiSC8idDsQn8mkX09ywif2TJ+BJdoHwqtVq2RQmpjnjTTAsyP6QdJqGtmeU97b9
	gU0jNEhYvrnm3CM7k4UDvh3YQNG0sEADwhnqsAKaSv8JLNnSil1aYnJGuqPBvudPqx/I
	v5EqQ3DgIzlNAT/WE2AB9c8hr39jmWrsnBPOAFY4fN+nAgjzUQ9f4b6Brp4EQjN2S0Yi
	Ea2w==
X-Gm-Message-State: ALQs6tBGCx1GOsXq5GIZF5JVGWjiETd2EJ05YaCAfidDtyP3HJ/1gpzO
	jYEjUgomDiCYizC5gAtnE/YsWMMjXx5TmSFEsYpLiw==
X-Received: by 2002:aca:6157:: with SMTP id
	v84-v6mr10175896oib.12.1522843079965; 
	Wed, 04 Apr 2018 04:57:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 04:57:39 -0700 (PDT)
In-Reply-To: <6db56a4f-f877-8052-e6e7-65f3ac58a95b@amsat.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-3-peter.maydell@linaro.org>
	<6db56a4f-f877-8052-e6e7-65f3ac58a95b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Apr 2018 12:57:39 +0100
Message-ID: <CAFEAcA8_b4RyxM+-GAJK-++5f8m7hktR4nj5YygDFUJu=mtrkg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH for-2.12 2/2] hw/sd/bcm2835_sdhost: Don't
 raise spurious interrupts
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qfik85pILu0x

On 4 April 2018 at 12:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> On 03/19/2018 01:15 PM, Peter Maydell wrote:
>> The Linux bcm2835_sdhost driver doesn't work on QEMU, because our
>> model raises spurious data interrupts.  Our function
>> bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
>> called with s->datacnt =3D=3D 0, even if the host hasn't actually issued
>> a data read or write command yet.  This means that the driver gets a
>> spurious data interrupt as soon as it enables IRQs and then does
>> something else that causes us to call the fifo_run routine, like
>> writing to SDHCFG, and before it does the write to SDCMD to issue the
>> read.  The driver's IRQ handler then spins forever complaining that
>> there's no data and the SD controller isn't in a state where there's
>> going to be any data:
>>
>> [   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
>> [   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
>> (continues forever).
>>
>> Move the interrupt flag setting to more plausible places:
>>  * for BUSY, raise this as soon as a BUSYWAIT command has executed
>>  * for DATA, raise this when the FIFO has any space free (for a write)
>>    or any data in it (for a read)
>>  * for BLOCK, raise this when the data count is 0 and we've
>>    actually done some reading or writing
>>
>> This is pure guesswork since the documentation for this hardware is
>> not public, but it is sufficient to get the Linux bcm2835_sdhost
>> driver to work.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/sd/bcm2835_sdhost.c | 43 +++++++++++++++++++++++--------------------
>>  1 file changed, 23 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
>> index 79f3c5ceeb..0fd0853fa3 100644
>> --- a/hw/sd/bcm2835_sdhost.c
>> +++ b/hw/sd/bcm2835_sdhost.c
>> @@ -137,6 +137,9 @@ static void bcm2835_sdhost_send_command(BCM2835SDHos=
tState *s)
>>          }
>>  #undef RWORD
>>      }
>> +    if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN))=
 {
>> +        s->status |=3D SDHSTS_BUSY_IRPT;
>> +    }
>>      return;
>>
>>  error:
>> @@ -187,18 +190,27 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostS=
tate *s)
>>                  n++;
>>                  if (n =3D=3D 4) {
>>                      bcm2835_sdhost_fifo_push(s, value);
>> +                    s->status |=3D SDHSTS_DATA_FLAG;
>
> ^ I'd move this line in bcm2835_sdhost_fifo_push(),

The bcm2835_sdhost_fifo_push() function is also used when
pushing data into the FIFO from the guest, though
(in the handling of writes to the SDDATA register), and
we don't want to set the DATA flag in that case I think.
So we need to set the flag only at the callsites where
it's the SD card pushing data into (or removing it from)
the FIFO.

>
>> +                    if (s->config & SDHCFG_DATA_IRPT_EN) {
>> +                        s->status |=3D SDHSTS_SDIO_IRPT;
>> +                    }
>>                      n =3D 0;
>>                      value =3D 0;
>>                  }
>>              }
>>              if (n !=3D 0) {
>>                  bcm2835_sdhost_fifo_push(s, value);
>> +                s->status |=3D SDHSTS_DATA_FLAG;
>
> removing this one.
>
>>              }
>>          } else { /* write */
>>              n =3D 0;
>>              while (s->datacnt > 0 && (s->fifo_len > 0 || n > 0)) {
>>                  if (n =3D=3D 0) {
>>                      value =3D bcm2835_sdhost_fifo_pop(s);
>> +                    s->status |=3D SDHSTS_DATA_FLAG;
>> +                    if (s->config & SDHCFG_DATA_IRPT_EN) {
>> +                        s->status |=3D SDHSTS_SDIO_IRPT;
>> +                    }
>>                      n =3D 4;
>>                  }
>>                  n--;
>> @@ -207,28 +219,19 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostS=
tate *s)
>>                  value >>=3D 8;
>>              }
>>          }
>> +        if (s->datacnt =3D=3D 0) {
>> +            s->edm &=3D ~0xf;
>
> while here, let's use SDEDM_FSM_MASK.

Sure.

thanks
-- PMM
