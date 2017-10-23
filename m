Received: by 10.223.197.9 with SMTP id q9csp10157986wrf;
        Sun, 22 Oct 2017 20:27:01 -0700 (PDT)
X-Received: by 10.200.50.45 with SMTP id x42mr17641093qta.114.1508729221041;
        Sun, 22 Oct 2017 20:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508729221; cv=none;
        d=google.com; s=arc-20160816;
        b=NaZ1RlW392p//2TMbVXeX2pkQF9PmOPBf89KO/hyahzOkVLIIPkCKDnlPVTsTEJQzH
         94PsKUpRP2BAJuNAiNhyitI4+/fq9/5lxarbIlyE4p32W8Hl+2opKSjHutBfYmLqHfwK
         +GfHjTcKo2lwcAlM6LXVqMJrpsLkwm2Z4KxTQcJ3bVAVA9M9/Q/QOCRDvqGNj3sYeXp8
         rY4k8V0QNf3x03tDMJDHoE3pyMgUCioIvSlYhc9dcsa+2r5crfpG9DhHMMRUb9frphfz
         SpGgZ+D0S9oy/P46+OIWXsxBrbaAirPCDqEo3xbl8JWcMvhSk1Mc+t+/s9DILnCT6Gaz
         0KsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DPX4GiFPQiKCRb0l7U8d6THDhhA1ejU5xM8+O785qVM=;
        b=CH0g6HXbYHMZoLNCuMU3Xitjd4sym5O4gzAH252jGEgcqCNrcxNmlJ9D7FDWvpaY+s
         uLtMvHwCC3phgbYuIeCVTxor13FZMtIfvx+INmWqYoT/eERa7ctejI1XpxCOgbTZvOaz
         UUkv7jA8xYGE9/R8aLCO8uzDy+8VcrB+qSQf/ZWIUMxFmwVx/d+P4/DcMAh1ltSjATdi
         PNO4r1RNC2vl9ll7ojonBJsbmcKXPu/aGrc2W1TUFZjI7nYH3TExOIu/WOea2vRTUrEd
         rr+ERFjw5nb06xaqUKOC+aTIUEVaBA7MJMdz4V6Ey2Adb9F1I0mWYpueXetoPnU37V8d
         OhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=lwWMkSOV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g15si5495853qtf.204.2017.10.22.20.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 20:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=lwWMkSOV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6TOE-00040K-Od
	for alex.bennee@linaro.org; Sun, 22 Oct 2017 23:26:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6TNK-0003gu-Ur
	for qemu-devel@nongnu.org; Sun, 22 Oct 2017 23:26:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6TNJ-0002QK-ME
	for qemu-devel@nongnu.org; Sun, 22 Oct 2017 23:26:02 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:44444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e6TNJ-0002Q6-GS; Sun, 22 Oct 2017 23:26:01 -0400
Received: by mail-vk0-x22c.google.com with SMTP id d12so10320913vkf.1;
	Sun, 22 Oct 2017 20:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=J8LHohkJTV7eR9KisbTIuCvstU3lBXc5SRxaPvrG5As=;
	b=lwWMkSOVPWM5QEYEvXeoqnD3joiA8pFeOtTguAjAdJdACooIrhQk/wXN+hD6fJ0HMF
	tMriOIkfYBHY5FBhgt1SmNiltXaoe7NSXJQy+raqyy0VVtKZ7rmYsEST+XgHCX6Q/CXm
	MbWbuct8Z3cUagKb+C9gxgoviW5BaR3Dj3RNihk+GJ8y0ZeuqlJdCZdKKOvvbumdrZ+U
	+fpjRJNlGMs+flvrCKPhenOOnSDqJZe6a+By42eX20Mzt493S0fjBkWBtH5gT6+91s4P
	AX/x+eWvn9iO//WzFu7GlRltG9klXtgo+dCWmEzRvdu1TSwIjozO2xlZcMozZlqp+MNt
	EMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=J8LHohkJTV7eR9KisbTIuCvstU3lBXc5SRxaPvrG5As=;
	b=E21kUIu99G9uaYOoJjVvOhMJY5ytytX6torJ7JCick2MQQMiqbcQhSLMg6YSv6vf9R
	jNxQqHQ3SQL3fm+l1nfH7wYTUfU3f+n1NeNCrxd9ZXgqThpXdqjSf6C9wfsVAqA8OHlE
	JoK+g2wxjVGotl5BTnbGx5v0djXT7RhEteWsRr3GNSCf2QHakj8QRRuYQXYBjcE3FVzI
	RpE1F4PTXoWLBlRZ5exSonEMY2egWQhm4sVXlwrbgdPL/pMdOKhCt9pOfdYsILGGR9T8
	jdZ7ckMKOFxaphWcj+u7cfeQvF7mKjjjhtlyfFhX6bhb4p21LJ3FAQgverR9amCMCMwU
	JJ8A==
X-Gm-Message-State: AMCzsaXAQ/vL81ghaUwfOut5e5w2SCZnZzosynPegTe46UvpkmR3TpoU
	dKp7SbhVnXyJTHYvkuULpwOhg15LB5YR6YYi4es=
X-Google-Smtp-Source: ABhQp+R5rOMCE5u6yVFll/XFwTL96x09j6LbQ9gGiJeXGBNc9ed70w7HaMn+/8mlsT8IEzy0frE4jm9DqKnGDlHivLw=
X-Received: by 10.31.60.211 with SMTP id j202mr8076663vka.134.1508729160924;
	Sun, 22 Oct 2017 20:26:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Sun, 22 Oct 2017 20:26:00 -0700 (PDT)
In-Reply-To: <20171022184847.xgkhvteu67ajxq3d@starbug-vm.ie.oracle.com>
References: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
	<20171022184847.xgkhvteu67ajxq3d@starbug-vm.ie.oracle.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 23 Oct 2017 08:56:00 +0530
Message-ID: <CALHRZuoFkPwZ+fwCktKEC=itat0pM78jqzzSeghB+0HA2sMQfA@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22c
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead code
 reported by Coverity
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 06SgiqLI0NO0

Hi Darren,

On Mon, Oct 23, 2017 at 12:18 AM, Darren Kenny <darren.kenny@oracle.com>
wrote:

> On Sun, Oct 22, 2017 at 06:58:02PM +0530, Subbaraya Sundeep wrote:
>
>> Fixed incorrect frame size mask, validated maximum frame
>> size in spi_write and removed dead code.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>> v3:
>>         Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
>>         register and logged incorrect value too in guest error(suggested
>>    by Darren).
>> v2:
>>    else if -> else in set_fifodepth
>>    log guest error when frame size is more than 32
>>
>> hw/ssi/mss-spi.c | 18 ++++++++++++++----
>> 1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>> index 5a8e308..e1b6227 100644
>> --- a/hw/ssi/mss-spi.c
>> +++ b/hw/ssi/mss-spi.c
>> @@ -76,9 +76,10 @@
>> #define C_BIGFIFO            (1 << 29)
>> #define C_RESET              (1 << 31)
>>
>> -#define FRAMESZ_MASK         0x1F
>> +#define FRAMESZ_MASK         0x3F
>> #define FMCOUNT_MASK         0x00FFFF00
>> #define FMCOUNT_SHIFT        8
>> +#define FRAMESZ_MAX          32
>>
>> static void txfifo_reset(MSSSpiState *s)
>> {
>> @@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
>>         s->fifo_depth = 32;
>>     } else if (size <= 16) {
>>         s->fifo_depth = 16;
>> -    } else if (size <= 32) {
>> -        s->fifo_depth = 8;
>>     } else {
>> -        s->fifo_depth = 4;
>> +        s->fifo_depth = 8;
>>     }
>> }
>>
>> @@ -301,6 +300,17 @@ static void spi_write(void *opaque, hwaddr addr,
>>         if (s->enabled) {
>>             break;
>>         }
>> +        /*
>> +         * [31:6] bits are reserved bits and for future use.
>> +         * [5:0] are for frame size. Only [5:0] bits are validated
>> +         * during write, [31:6] bits are untouched.
>> +         */
>> +        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %d
>> provided."
>> +                         "Maximum frame size is %d\n",
>> +                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);
>>
>
> Nitpicking here really, but shouldn't the %d be %u since value is a
> uint32_t?
>
> Ok I will change to %u.

Thanks,
Sundeep


> Thanks,
>
> Darren.
>
>
> +            break;
>> +        }
>>         s->regs[R_SPI_DFSIZE] = value;
>>         break;
>>
>> --
>> 2.5.0
>>
>>
>>
