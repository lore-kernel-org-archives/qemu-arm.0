Received: by 10.223.150.237 with SMTP id u100csp1671132wrb;
        Sun, 12 Nov 2017 09:34:36 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb8GM2yIH4Arjk6REOo07/kiZSlDemweIUed6JHC47dneH3UbkTAfpzzmtu0xbugCBfXXdo
X-Received: by 10.129.162.147 with SMTP id z141mr4333020ywg.331.1510508076701;
        Sun, 12 Nov 2017 09:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510508076; cv=none;
        d=google.com; s=arc-20160816;
        b=jYuUFh6uSEVt4+dO0F7tm3BoxgRuDtrD95AxD9InTcpRp0gJtoMWXGvUQIuHdSx53u
         hfZeduecjgINAsb169//qmYMe/955VXo+gG2R/B6PvgH7FXYA866gZtqP8lo8xMwmdrO
         a9KRysWWVCtxuxZDLq3lOAn9XrHyBr4kBgN7kkBjEWmMdntdckmJEweQ8ZZdldPUUsiq
         BOYn6z5M39oRsHYAlVRai+dzJovgSNtkAbm4lG6G5DBvQfEdrkBAzjrUObWIPN1I4fIZ
         /ijZBZU4TB9HC4N6yVnqRo7W8q81totry6n8w1Ogx3Kh2koGzaYsRMjz2WdOdNEqxsgZ
         GBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4EmpVVSnTfkMDw2JFXrQxCO5Pdgddqz/gMONXq1xRwY=;
        b=pZWAhtr6QW3fRRsqwhkk/AToFvD9WEbmIto3ptOLyr+Aub7kp/jKuTWC25ciXw2KkB
         Mtke8P9kheHRjOTMn24si2F4LjNmH4ZRUL9u3YNo8v/+6whkHqv3cFP1bPP/1M7/H2CH
         CYu6GtxR356fv9Jwa+92S58LOr59u079KCFLbOF/IBab81WnlE4Fp+5vH5Bo2F7Ud9uq
         jU26BA20nX3MQip7lfizEN6E6OomXaIju0X/JqdY0sHirxhUjtj9HNG7Suj7O4C/bCkj
         8BsJtnYJV61FFWjo36wg8IfI1EJSWuug+MYdFQlAUhQq/ofjNRFWvp+voTLzUIgTbhYV
         0wGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rmVpZO9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o138si1582204yba.794.2017.11.12.09.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Nov 2017 09:34:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rmVpZO9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDw9U-0003Ib-4j
	for alex.bennee@linaro.org; Sun, 12 Nov 2017 12:34:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eDw9L-0003IH-9H
	for qemu-arm@nongnu.org; Sun, 12 Nov 2017 12:34:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eDw9I-0001UA-4i
	for qemu-arm@nongnu.org; Sun, 12 Nov 2017 12:34:27 -0500
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:50693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eDw9I-0001Tz-0H; Sun, 12 Nov 2017 12:34:24 -0500
Received: by mail-qt0-x22b.google.com with SMTP id d9so17088490qtd.7;
	Sun, 12 Nov 2017 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4EmpVVSnTfkMDw2JFXrQxCO5Pdgddqz/gMONXq1xRwY=;
	b=rmVpZO9F8KYt4JQLPnX9m72woNE+LFfbgDAWdcNOceLTi/eIT7FP5c8siV5FCHureO
	hKjPX/YZQt8JT4MWIyCP1VzAgpf4sYr6pj/gzYazSJDi3itGALf32GGWMHf4sz1rdjgy
	+n3PdwuNd4nmrfp4k+z+6Xu3Q75F9M/y6KsJ3/oqzRXhuLlwJCP7hn0H3aBSM5y34fZw
	xVKoxnhQfTp3mcAF0iOMPx/AgOuPvH3gF4JOgNsafsWYV7koYXuRGcVMxzg2zi3JfOzM
	VWacVBTkT7iN8BYwcyNVySx+4vtjyx7CXD9cxl3b4VRjtxGvZpTOaP9RwkSofM5CtQPa
	R7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4EmpVVSnTfkMDw2JFXrQxCO5Pdgddqz/gMONXq1xRwY=;
	b=qW6GcHge0RBeg9vR90+DQebw6txEQGRpeMTN4cBk4M5TdVJA3CYWM0Y6WKsmJHAaFJ
	y1/xCjotWylg281NBsCeXh8f63etk1TwpIhyW+MZgZsSq+4l6ekMls57Gufo1QiGACBG
	MNMrYcUq6WoaKPgqFGfXdMxqYyCD3r9CzBCvkOM4Gw6MY4fZeUYMrZaURMdTSHD2JImG
	yMU7jtiZoO9JLSJoIkhLBwNPEV6Qkw6BmyOyr/GZSKafhvvJhl/dHY1/ECm903BorRwA
	25itr1llCMkqMmvUjvSdoTDmNBub/eG7dovjFaVdzdW5Ln5S8WRCyYY92E/WcktZcZ8E
	cx3A==
X-Gm-Message-State: AJaThX7RH6xJHCs6tGmoJ1OGtebSMJh85HsVIQyj8ZjZ9eMxUazeCeGn
	MfhDL0zKqKXfghZsHwmo+oc=
X-Received: by 10.237.35.76 with SMTP id i12mr10265518qtc.276.1510508063380;
	Sun, 12 Nov 2017 09:34:23 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	t48sm1266816qtc.10.2017.11.12.09.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Nov 2017 09:34:22 -0800 (PST)
To: P J P <ppandit@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
References: <20171111081111.32724-1-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <29f80a56-df32-0eb5-0152-683c85a7e421@amsat.org>
Date: Sun, 12 Nov 2017 14:34:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171111081111.32724-1-ppandit@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-arm] [PATCH v1] highbank: validate register offset before
 access
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
Cc: Rob Herring <robh@kernel.org>, Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Shawn Guo <shawn.guo@linaro.org>, Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iK49FUQiHh1r

Hi Prasad,

Thanks for updating this patch so quickly :)

On 11/11/2017 05:11 AM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> An 'offset' parameter sent to highbank register r/w functions
> could be greater than number(NUM_REGS=0x200) of hb registers,
> leading to an OOB access issue. Add check to avoid it.
> 
> Reported-by: Moguofang (Dennis mo) <moguofang@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/arm/highbank.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> Update: log error message(via qemu_log_mask) before returning
>   -> https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01914.html
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 354c6b25a8..8494dc6a48 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -34,6 +34,7 @@
>  #include "hw/ide/ahci.h"
>  #include "hw/cpu/a9mpcore.h"
>  #include "hw/cpu/a15mpcore.h"
> +#include "qemu/log.h"
>  
>  #define SMP_BOOT_ADDR           0x100
>  #define SMP_BOOT_REG            0x40
> @@ -117,14 +118,26 @@ static void hb_regs_write(void *opaque, hwaddr offset,
>          }
>      }
>  
> +    if (offset / 4 >= NUM_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "highbank: bad write offset 0x%x\n", (uint32_t)offset);

I'd rather use:

           "highbank: bad write offset 0x%" HWADDR_PRIx "\n", offset);

> +        return;
> +    }
>      regs[offset/4] = value;
>  }
>  
>  static uint64_t hb_regs_read(void *opaque, hwaddr offset,
>                               unsigned size)
>  {
> +    uint32_t value;
>      uint32_t *regs = opaque;
> -    uint32_t value = regs[offset/4];
> +
> +    if (offset / 4 >= NUM_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "highbank: bad read offset 0x%x\n", (uint32_t)offset);

Ditto HWADDR_PRIx.

> +        return 0;
> +    }
> +    value = regs[offset/4];

  +    value = regs[offset / 4];

With checkpatch fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  
>      if ((offset == 0x100) || (offset == 0x108) || (offset == 0x10C)) {
>          value |= 0x30000000;
> 
