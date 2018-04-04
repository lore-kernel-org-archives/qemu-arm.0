Received: by 10.28.71.155 with SMTP id m27csp4768888wmi;
        Wed, 4 Apr 2018 04:52:01 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/Rk8UfTXjnzbjrCt+eMp5icWV3qhnyCXQTpw5UQDZS1iTcEJJljCrUCWHj6D3SDOgCMw6q
X-Received: by 10.200.56.76 with SMTP id r12mr26748175qtb.125.1522842721756;
        Wed, 04 Apr 2018 04:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522842721; cv=none;
        d=google.com; s=arc-20160816;
        b=c3Xzny6UaXu46q8oOxER6eIeLiy3xTLuvd4M6+yKsQJtVJke3tQ+3IdKaFZkuJ5VCZ
         ptCoFic9kmOZxX5qpS+tVSV5KTEh2KW+cTrxreOJXRufkHM7W4jPTq+sH75hBFTzofVk
         dLXe9ljuDOYh7x3Tt6vDPYE/bPMkNijekW+A1XuTx0mwwwOWvC19V/O3cNxZnTaF8Aoj
         M9UhS1t2N3SWR80u/BQq71dgpW4n6v8x/IuYGeeBVPcMlo+43KAKewM3kR7guDmHmPqV
         eRoujeZ65fcy8Fm1m1Rg6S+dlVEcE8LFWy+oZtG8Ks/F9i89RsD50/SSNrqRL2Pm7mjO
         TqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=AUNj4pXPlKrLyidyo4wQxwfpwZ+cAkvALOpYaW6YhbU=;
        b=r4HZ7qQASRdE4wv/TIr6+gVD/3iKSJcpmQrmb8/F8s5GgYy8jWUgdK2scEfl2klQAk
         DR24OPZARSrXTLUHRVYXC5P6HWcy1HyrxHqhOD/BUeF/X+xtWf8ut9MvafW+woMJK/Nn
         HSh2Pd9z/BfJVYE9EK3z1kx2GK6bj1rN85kf3PIoL+9xG/9jK4xoNLSOsICfVJ2O10TK
         /Rse4LzjJhMAskPvGcd8Wws9nomFXA0Q0xAmc4n3CA5PN4xFpUSGaSddk3m225oHzp81
         PG3FS12SeRqaHWHFPotlHHHQ3bTq5gVIe0oJpyuUkdeYW9D5KhP9YNaOcH/xDpbnysRV
         mGbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=apU1t5pC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p24si3288592qtc.221.2018.04.04.04.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 04:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=apU1t5pC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3gxN-0005j0-9x
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 07:52:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3gwE-00051z-QJ
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3gwD-0006ww-SH
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 07:50:50 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3gw6-0006lu-HJ; Wed, 04 Apr 2018 07:50:42 -0400
Received: by mail-qk0-x244.google.com with SMTP id u9so8661386qkk.11;
	Wed, 04 Apr 2018 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AUNj4pXPlKrLyidyo4wQxwfpwZ+cAkvALOpYaW6YhbU=;
	b=apU1t5pC56qTmMFDnRVEt1LRBX8LHveWbjo17xc2Zhiw2dvQ/6L3LB59hbPc1NwrG5
	b8BlPLuTTvZ8p2d4dTmz9DaoSNavmMxR2W6IPPweOPI+eJ/vC+1zNsN1EzxTdQYLU1D5
	KL/Z2NwfMKC8vSSrkutPOUw0l6xElAeg/1ikgW/TFdTw9yEC40zhFTVhlfg/Lyqwt1sI
	CCXyToYXntXP+YsTH3Rn5vvYQJ+tf4tb44QQIOjN1BqAL185J9zOrLiWL66AjRWC9unP
	fU/cvHOmzWPV1B7onznINzcfTgyQdHXc8gFj3aCQlqpCrYCEd+QJgp7T3NFRBSaVIxu9
	kCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=AUNj4pXPlKrLyidyo4wQxwfpwZ+cAkvALOpYaW6YhbU=;
	b=qzOA3BctRUn2LKO5PYKyxIfI3k7jYRZ2HbuSnli44Gsx/495pk4MhfnYEfJtEjb5zQ
	OsSoPiO+fo7wEigfGJdFz/ra/WBF2njtnNELdB2WCWcWgwLttZZpkRepwHfscPCtLu0O
	IbBWZcmOhF08pSloYlNRc5c2/DPPnsSkObTlxtqY0tTmm8F6e9XtLbNhhQ+vxMsvcxsk
	CT6C48PSeH7/uDWTtDp1SHTlCB37TzRgnv4r6QgR/aArBOitVmlgVJAVtVKz4r6xZbwr
	hrLomBYm1tjUDACDu1qWY21qzR+Z4gB5SPc4qLc1g3nnXcd2Xmaxt5Dxm9ja1pjbBrk3
	qRqg==
X-Gm-Message-State: ALQs6tAk1zMVzsNlC7c2PoMzoYuNgT1Qw2HpWMUw+GmT1hggfWclFcqT
	x+LUEVaay7eD0+7wAnymOjI=
X-Received: by 10.55.54.12 with SMTP id d12mr17441118qka.340.1522842641819;
	Wed, 04 Apr 2018 04:50:41 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	m103sm4392886qkh.20.2018.04.04.04.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 04:50:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6db56a4f-f877-8052-e6e7-65f3ac58a95b@amsat.org>
Date: Wed, 4 Apr 2018 08:50:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180319161556.16446-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
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
Cc: Pekka Enberg <penberg@iki.fi>, Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l1xkDt87dgUF

Hi Peter,

On 03/19/2018 01:15 PM, Peter Maydell wrote:
> The Linux bcm2835_sdhost driver doesn't work on QEMU, because our
> model raises spurious data interrupts.  Our function
> bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
> called with s->datacnt == 0, even if the host hasn't actually issued
> a data read or write command yet.  This means that the driver gets a
> spurious data interrupt as soon as it enables IRQs and then does
> something else that causes us to call the fifo_run routine, like
> writing to SDHCFG, and before it does the write to SDCMD to issue the
> read.  The driver's IRQ handler then spins forever complaining that
> there's no data and the SD controller isn't in a state where there's
> going to be any data:
> 
> [   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
> [   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
> (continues forever).
> 
> Move the interrupt flag setting to more plausible places:
>  * for BUSY, raise this as soon as a BUSYWAIT command has executed
>  * for DATA, raise this when the FIFO has any space free (for a write)
>    or any data in it (for a read)
>  * for BLOCK, raise this when the data count is 0 and we've
>    actually done some reading or writing
> 
> This is pure guesswork since the documentation for this hardware is
> not public, but it is sufficient to get the Linux bcm2835_sdhost
> driver to work.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/bcm2835_sdhost.c | 43 +++++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> index 79f3c5ceeb..0fd0853fa3 100644
> --- a/hw/sd/bcm2835_sdhost.c
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -137,6 +137,9 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
>          }
>  #undef RWORD
>      }
> +    if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN)) {
> +        s->status |= SDHSTS_BUSY_IRPT;
> +    }
>      return;
>  
>  error:
> @@ -187,18 +190,27 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
>                  n++;
>                  if (n == 4) {
>                      bcm2835_sdhost_fifo_push(s, value);
> +                    s->status |= SDHSTS_DATA_FLAG;

^ I'd move this line in bcm2835_sdhost_fifo_push(),

> +                    if (s->config & SDHCFG_DATA_IRPT_EN) {
> +                        s->status |= SDHSTS_SDIO_IRPT;
> +                    }
>                      n = 0;
>                      value = 0;
>                  }
>              }
>              if (n != 0) {
>                  bcm2835_sdhost_fifo_push(s, value);
> +                s->status |= SDHSTS_DATA_FLAG;

removing this one.

>              }
>          } else { /* write */
>              n = 0;
>              while (s->datacnt > 0 && (s->fifo_len > 0 || n > 0)) {
>                  if (n == 0) {
>                      value = bcm2835_sdhost_fifo_pop(s);
> +                    s->status |= SDHSTS_DATA_FLAG;
> +                    if (s->config & SDHCFG_DATA_IRPT_EN) {
> +                        s->status |= SDHSTS_SDIO_IRPT;
> +                    }
>                      n = 4;
>                  }
>                  n--;
> @@ -207,28 +219,19 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
>                  value >>= 8;
>              }
>          }
> +        if (s->datacnt == 0) {
> +            s->edm &= ~0xf;

while here, let's use SDEDM_FSM_MASK.

> +            s->edm |= SDEDM_FSM_DATAMODE;
> +            trace_bcm2835_sdhost_edm_change("datacnt 0", s->edm);
> +
> +            if ((s->cmd & SDCMD_WRITE_CMD) &&
> +                (s->config & SDHCFG_BLOCK_IRPT_EN)) {
> +                s->status |= SDHSTS_BLOCK_IRPT;
> +            }
> +        }

Your guesswork makes sens to me.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      }
> -    if (s->datacnt == 0) {
> -        s->status |= SDHSTS_DATA_FLAG;
>  
> -        s->edm &= ~0xf;
> -        s->edm |= SDEDM_FSM_DATAMODE;
> -        trace_bcm2835_sdhost_edm_change("datacnt 0", s->edm);
> -
> -        if (s->config & SDHCFG_DATA_IRPT_EN) {
> -            s->status |= SDHSTS_SDIO_IRPT;
> -        }
> -
> -        if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN)) {
> -            s->status |= SDHSTS_BUSY_IRPT;
> -        }
> -
> -        if ((s->cmd & SDCMD_WRITE_CMD) && (s->config & SDHCFG_BLOCK_IRPT_EN)) {
> -            s->status |= SDHSTS_BLOCK_IRPT;
> -        }
> -
> -        bcm2835_sdhost_update_irq(s);
> -    }
> +    bcm2835_sdhost_update_irq(s);
>  
>      s->edm &= ~(0x1f << 4);
>      s->edm |= ((s->fifo_len & 0x1f) << 4);
> 
