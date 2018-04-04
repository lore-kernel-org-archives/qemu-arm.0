Received: by 10.28.71.155 with SMTP id m27csp4893738wmi;
        Wed, 4 Apr 2018 06:52:19 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/Llpb4bfIHWXC+IV/JCraazMzubsEMIBKngODf/GptwONrLw7w4OBMEBIulQqrQEYTI7FY
X-Received: by 10.129.183.14 with SMTP id v14mr2063361ywh.147.1522849939761;
        Wed, 04 Apr 2018 06:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522849939; cv=none;
        d=google.com; s=arc-20160816;
        b=CGsLloQLcM8Y4HR+fpXnozGVryCM6XVnuNNiSg0KNBkdJ3KdyNCQN2g7aNd0fxah6s
         QiB5PPAEofEzz27e3+L6n88fdEh0pEn5gd8a+bjMNKCfVKlbqPL5dinKA+npoce9WYha
         jLWyjeneXC1vukVEkKLK9FyXiuIjY8chsPjNtQXc8VG5JoK9VXiNDx0U3x2gZDW6Dq2l
         NeflQ9Sk2kMunNEDBCSCbQiW4TIXM1Goj47ZnrfA3GA/r8cGrd0bXtIHuBNkOCdh2qza
         7rVDnwCFW4BzelA2FXYV+Qbbm/BMt/IGCoIDzEazZI/99yySdsEuev5WqhCQZZ9TnHI3
         ajwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+hhZlC5rOT2uvMkaM6apx7ekdrIesq5/p9Ux2eOK6IY=;
        b=bpYiLYBzxpMBpcJ8BJANPKbpgfItrIYS83BGPyrERu3sdvR3PLUHoil40j4ScDXsQn
         d+OYxALFMxcNQavfonYDUJ9+5VPQs6bL+zNcwWGKHqscrDU32TOZP6FDGey/ZiXrC0S7
         LJFo9v1P3FoRSF7Oi+AdpNE3kqWPoHowie9+kwsc2bn6qlUsRZl0voHoao8Yilk40UcN
         mQlP1PSoG13V72uymUFjxNak7Il2doEb/m/WBrJ78eKn+/VQ485nOKANacoqw5GOxtH2
         7urPeAxUoqGGvGLzva/2lXOWHMKAFIZWCNPjsk1NqFIX0h6tDuAJnOYUVQvuPnSwaGOG
         sYKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H5IC+OZG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2-v6si1058805ybm.269.2018.04.04.06.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 06:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H5IC+OZG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3ipn-0006se-97
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 09:52:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3io7-0005sk-5L
	for qemu-devel@nongnu.org; Wed, 04 Apr 2018 09:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3io2-0007aV-FD
	for qemu-devel@nongnu.org; Wed, 04 Apr 2018 09:50:35 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3io2-0007a5-12; Wed, 04 Apr 2018 09:50:30 -0400
Received: by mail-qt0-x241.google.com with SMTP id d50so15738366qtc.0;
	Wed, 04 Apr 2018 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+hhZlC5rOT2uvMkaM6apx7ekdrIesq5/p9Ux2eOK6IY=;
	b=H5IC+OZGMX6kx5A3ExiM98RxJxy+3IQOJ2z02AR9fkgYBksjffZiJISZwF/FlZGML2
	rwrQOOsoXOCPEmgnRJksJpfVfA4aUy5twHyKZyRi2PKX/ZhTfHSiZghLCmwyb4BoM98K
	xD3S7mQ8fKm6rjZkbG9GfLEgteZrUz1DNRsm6OG6Ufs9PsLevFeul0uHRId5LEhymUBq
	L4UwUelLkFCD4QPfOsWTEPvftJJ4VXuJPVkaci+dnHDPBcuxE+/aVfv4aLsxJF08dStn
	4/eSGGUusaE8lNX9zrnXw1ehUN3t5/P5gIstOA3btat6/V1A83n26I2sNGAzIVAYh+S5
	2XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+hhZlC5rOT2uvMkaM6apx7ekdrIesq5/p9Ux2eOK6IY=;
	b=j1BMWSFYkwF7Se6m0bXmRbuAGl1QPjxf9iP7BF5UKFc3IEzfd0MbjcZzBLcZH60sw3
	iCMu9fh76McieU9U/Y+ypXN18Osym7/rzQAYeEzxGl6k9SYB7DDKFlAhcdq98W+2V609
	cWYYU53YrSA0PhceY9PNCWrfanmUbBcFw55DDpazk9ewuvHcKnt+yGvBt+vWy+HHgVfs
	nRwtpcSsq0wFPV5HPvTEYEB/6ehnV4Go8Aqt6xFYGQCyNkjwT51eoysHLzoOr4MIgktM
	0W9+nvgs5tJnzEo0furA7SQ3iD+F/HhX5RDzZlDl1B5G+ezQynP8LI2rl5WBDu/FXBwV
	0HZQ==
X-Gm-Message-State: ALQs6tBT1mdPl059TA4IHj1UqQXogOZbReTXG8dLDpiPtlHcTnZfmhBY
	/jDtzJwhEa6UEJIXqvsEqnI=
X-Received: by 10.200.53.217 with SMTP id l25mr26454542qtb.317.1522849829322; 
	Wed, 04 Apr 2018 06:50:29 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id a4sm4052691qth.52.2018.04.04.06.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 06:50:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-3-peter.maydell@linaro.org>
	<6db56a4f-f877-8052-e6e7-65f3ac58a95b@amsat.org>
	<CAFEAcA8_b4RyxM+-GAJK-++5f8m7hktR4nj5YygDFUJu=mtrkg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <66fe9757-1ef7-6d3a-1bb3-fd09fc216747@amsat.org>
Date: Wed, 4 Apr 2018 10:50:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8_b4RyxM+-GAJK-++5f8m7hktR4nj5YygDFUJu=mtrkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-devel] [PATCH for-2.12 2/2] hw/sd/bcm2835_sdhost: Don't
 raise spurious interrupts
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V36irNXvw2v4

On 04/04/2018 08:57 AM, Peter Maydell wrote:
> On 4 April 2018 at 12:50, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 03/19/2018 01:15 PM, Peter Maydell wrote:
>>> The Linux bcm2835_sdhost driver doesn't work on QEMU, because our
>>> model raises spurious data interrupts.  Our function
>>> bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
>>> called with s->datacnt == 0, even if the host hasn't actually issued
>>> a data read or write command yet.  This means that the driver gets a
>>> spurious data interrupt as soon as it enables IRQs and then does
>>> something else that causes us to call the fifo_run routine, like
>>> writing to SDHCFG, and before it does the write to SDCMD to issue the
>>> read.  The driver's IRQ handler then spins forever complaining that
>>> there's no data and the SD controller isn't in a state where there's
>>> going to be any data:
>>>
>>> [   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
>>> [   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
>>> (continues forever).
>>>
>>> Move the interrupt flag setting to more plausible places:
>>>  * for BUSY, raise this as soon as a BUSYWAIT command has executed
>>>  * for DATA, raise this when the FIFO has any space free (for a write)
>>>    or any data in it (for a read)
>>>  * for BLOCK, raise this when the data count is 0 and we've
>>>    actually done some reading or writing
>>>
>>> This is pure guesswork since the documentation for this hardware is
>>> not public, but it is sufficient to get the Linux bcm2835_sdhost
>>> driver to work.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  hw/sd/bcm2835_sdhost.c | 43 +++++++++++++++++++++++--------------------
>>>  1 file changed, 23 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
>>> index 79f3c5ceeb..0fd0853fa3 100644
>>> --- a/hw/sd/bcm2835_sdhost.c
>>> +++ b/hw/sd/bcm2835_sdhost.c
>>> @@ -137,6 +137,9 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
>>>          }
>>>  #undef RWORD
>>>      }
>>> +    if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN)) {
>>> +        s->status |= SDHSTS_BUSY_IRPT;
>>> +    }
>>>      return;
>>>
>>>  error:
>>> @@ -187,18 +190,27 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
>>>                  n++;
>>>                  if (n == 4) {
>>>                      bcm2835_sdhost_fifo_push(s, value);
>>> +                    s->status |= SDHSTS_DATA_FLAG;
>>
>> ^ I'd move this line in bcm2835_sdhost_fifo_push(),
> 
> The bcm2835_sdhost_fifo_push() function is also used when
> pushing data into the FIFO from the guest, though
> (in the handling of writes to the SDDATA register), and
> we don't want to set the DATA flag in that case I think.> So we need to set the flag only at the callsites where
> it's the SD card pushing data into (or removing it from)
> the FIFO.

Ok, thanks.

> 
>>
>>> +                    if (s->config & SDHCFG_DATA_IRPT_EN) {
>>> +                        s->status |= SDHSTS_SDIO_IRPT;
>>> +                    }
>>>                      n = 0;
>>>                      value = 0;
>>>                  }
>>>              }
>>>              if (n != 0) {
>>>                  bcm2835_sdhost_fifo_push(s, value);
>>> +                s->status |= SDHSTS_DATA_FLAG;
>>
>> removing this one.
>>
>>>              }
>>>          } else { /* write */
>>>              n = 0;
>>>              while (s->datacnt > 0 && (s->fifo_len > 0 || n > 0)) {
>>>                  if (n == 0) {
>>>                      value = bcm2835_sdhost_fifo_pop(s);
>>> +                    s->status |= SDHSTS_DATA_FLAG;
>>> +                    if (s->config & SDHCFG_DATA_IRPT_EN) {
>>> +                        s->status |= SDHSTS_SDIO_IRPT;
>>> +                    }
>>>                      n = 4;
>>>                  }
>>>                  n--;
>>> @@ -207,28 +219,19 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
>>>                  value >>= 8;
>>>              }
>>>          }
>>> +        if (s->datacnt == 0) {
>>> +            s->edm &= ~0xf;
>>
>> while here, let's use SDEDM_FSM_MASK.
> 
> Sure.
> 
> thanks
> -- PMM
> 
