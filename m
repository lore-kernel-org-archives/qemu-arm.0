Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp783710wrd;
        Fri, 17 Aug 2018 17:56:16 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzsFC6aW57c5KWp7wSC8+s0RhxyZB6zolEGNsuq6A6A2X+ipnoKD8mz3QlEzgTL24LITWVe
X-Received: by 2002:a0c:d7c3:: with SMTP id g3-v6mr32460704qvj.85.1534553776112;
        Fri, 17 Aug 2018 17:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534553776; cv=none;
        d=google.com; s=arc-20160816;
        b=o7vv6GDdD99KfRF3PdYBsM6EUs9iNRQWTBhwXtL9TdGcP5iL+CyQLoCnk6tNt9zgDM
         nhzjzm4pAhoxIotmQM9XZUk5ghlO5XdiZmj1EPvKeJGxDTDN3ZdldAfObQpMWgrrA7hE
         daK92VnPcaojtKe5SRyEV+AcGkTKp2OOc+bsy+DejYbfa5/+y1zqpPDXCYyZKdC5N/yk
         hpQiOF+IpMwMz6Kp11tz/xoA57B1q+dFuW4kNR1aBPYUiP2yuzs2U7Uhx7JKCpj4+Sds
         FR2jMKGQzFLiSDRXFYFe1da3P2uMuIdbvGDkUHTIx0LtvJhP+17wTxfnocokazOzkzHE
         S35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VTS3dyY5GoTggdIhPrqPlYpMmRLCgFvN9xXb6jawwYQ=;
        b=qStEzA7OO9MsP1KxAZgIHiO1mueNM1CDRO52U8lZWrVr4dwGUrjT4ysW5y3ULvQ68C
         WcBoqvUsB+/dZHkS6e+vfFsBgCpJoyPZJnv8Bn2Mij0ddETQppkkKujRqS6Re4k/dZhQ
         FonYzdnF78W95YD6YS6QjkBs13Z/GvrGZIUSYTdTPC0ielhN6MS3EOL7dNcWpScyE87p
         WGzTXPUn2NYDEk5WUD40H/nUY/aLguuxIQ9iZM/OXRb7Z8I232tHmRsbGdv8vy7xiDF/
         Vetl4KB+RWn30Mve/QIbP56/z5gDwIb2Z0BObjvTu0Wm/248XDc3cq644sV5cSP7i3mz
         zD9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UOzBQaJg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i125-v6si1787561qkd.227.2018.08.17.17.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 17:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UOzBQaJg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqpXL-0002Fa-K3
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 20:56:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpVA-0001Kc-U6
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 20:54:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpKp-0000Pf-LK
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 20:43:23 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:35865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpKp-0000OC-G4; Fri, 17 Aug 2018 20:43:19 -0400
Received: by mail-vk0-x241.google.com with SMTP id y9-v6so4031732vky.3;
	Fri, 17 Aug 2018 17:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VTS3dyY5GoTggdIhPrqPlYpMmRLCgFvN9xXb6jawwYQ=;
	b=UOzBQaJg0z0vU4Q0VBjojpvdW6qe/DjZsqK8rEMvC1W+1cAIEfQlm65nzbL4h+p9RH
	nWmtxHc85bGa4sNwB3YFSPCL9J7/rtw5/IuVVADebFpi75UDPpjCsYDLwgLReYos12j5
	u70FVTbRdAxHljaOOlonb7wHgK1GKaCzZE9lUIe256haSjY5/nVwGHSxrcYW4YmkHOKa
	mZ0NV8Ay5YRHu8SjxOPikcwhPzw4j2P0Fk7GpF5nG1mrvAjxQmLLpDKELLt1qvr93tqZ
	PRFZbjbqtmdLQeoAmWiVEc02qZNqnBWSiv1o3vqfvKC8cuozlNKk6rNsvw97fi++SJkT
	hFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VTS3dyY5GoTggdIhPrqPlYpMmRLCgFvN9xXb6jawwYQ=;
	b=nfc3HWnIQ2bAlMf5uFbpNcApkKghbO4773lzopArdZjitEtis8jCJLmNgJDXFShFlU
	BlvhUNh5EZo1RVaMSkfjPqi/VH8P2sRGLnkFTXlXamgL42FXhz1rs1UZYgHFMvK+M8zz
	dMJ3aE8wIsNQGsqef5IEmHn+Nnmeth2orj3pAP9d94uhbr7aEenl4JXVcpxI0oMbhsLP
	bUrpWwtHuUBo3eSly2Jn4P0tL09PsomK1KArQudMXLLfoCG+QEE7Z3rUuCWNG5cnLQlV
	z1wu4uvbRQUWIL84KTZQlcU7l0CgvsoXgy4NFl2Mv5Tepa4kMLPkM5W7LPFd+bPwZKfm
	lEGQ==
X-Gm-Message-State: AOUpUlESGhdK/NcCdBhBbbxBz8EaSpWVK0KBxO3/3/Ber1+yF36T9/KU
	ITKn3rkSCeAHcDoZC3+ZoRo=
X-Received: by 2002:a1f:97d4:: with SMTP id
	z203-v6mr24205618vkd.133.1534552998721; 
	Fri, 17 Aug 2018 17:43:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	r138-v6sm1167320vke.35.2018.08.17.17.43.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 17:43:18 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <ccb11ed2-4157-4f72-11e6-1e985a423feb@amsat.org>
Date: Fri, 17 Aug 2018 21:43:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 11/16] hw/dma/pl080: Support all
 three interrupt lines
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HmHMnDl4HaI

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The PL080 and PL081 have three outgoing interrupt lines:
>  * DMACINTERR signals DMA errors
>  * DMACINTTC is the DMA count interrupt
>  * DMACINTR is a combined interrupt, the logical OR of the other two
> 
> We currently only implement DMACINTR, because that's all the
> realview and versatile boards needed, but the instances of the
> PL081 in the MPS2 firmware images use all three interrupt lines.
> Implement the missing DMACINTERR and DMACINTTC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/dma/pl080.h |  6 +++++-
>  hw/dma/pl080.c         | 13 ++++++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
> index 7deb46c8578..7c6a4184833 100644
> --- a/include/hw/dma/pl080.h
> +++ b/include/hw/dma/pl080.h
> @@ -17,7 +17,9 @@
>   * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0218e/DDI0218.pdf
>   *
>   * QEMU interface:
> - * + sysbus IRQ: DMACINTR combined interrupt line
> + * + sysbus IRQ 0: DMACINTR combined interrupt line
> + * + sysbus IRQ 1: DMACINTERR error interrupt request
> + * + sysbus IRQ 2: DMACINTTC count interrupt request
>   * + sysbus MMIO region 0: MemoryRegion for the device's registers
>   */
>  
> @@ -57,6 +59,8 @@ typedef struct PL080State {
>      /* Flag to avoid recursive DMA invocations.  */
>      int running;
>      qemu_irq irq;
> +    qemu_irq interr;
> +    qemu_irq inttc;
>  } PL080State;
>  
>  #endif
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 0f79c2d8a6c..301030dd118 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -75,11 +75,12 @@ static const unsigned char pl081_id[] =
>  
>  static void pl080_update(PL080State *s)
>  {
> -    if ((s->tc_int & s->tc_mask)
> -            || (s->err_int & s->err_mask))
> -        qemu_irq_raise(s->irq);
> -    else
> -        qemu_irq_lower(s->irq);
> +    bool tclevel = (s->tc_int & s->tc_mask);
> +    bool errlevel = (s->err_int & s->err_mask);
> +
> +    qemu_set_irq(s->interr, errlevel);
> +    qemu_set_irq(s->inttc, tclevel);
> +    qemu_set_irq(s->irq, errlevel || tclevel);
>  }
>  
>  static void pl080_run(PL080State *s)
> @@ -352,6 +353,8 @@ static void pl080_init(Object *obj)
>      memory_region_init_io(&s->iomem, OBJECT(s), &pl080_ops, s, "pl080", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
> +    sysbus_init_irq(sbd, &s->interr);
> +    sysbus_init_irq(sbd, &s->inttc);
>      s->nchannels = 8;
>  }
>  
> 
