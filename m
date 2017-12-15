Received: by 10.223.159.74 with SMTP id f10csp218259wrg;
        Fri, 15 Dec 2017 02:17:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBotMqwqUlwNa8TRjSUpDEGZ/QJWLKtE9Lhpw+UowdqTT+tdkKGBJ6YVsCwKHuwE2V7JMd1KP
X-Received: by 10.129.125.212 with SMTP id y203mr6609242ywc.510.1513333053456;
        Fri, 15 Dec 2017 02:17:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513333053; cv=none;
        d=google.com; s=arc-20160816;
        b=H/oSI7PJMiBES92q+eOH/S/WccH6XZvbEz8q+JANYoTK6TsKsENtVcxp0ocoMxcZQL
         r4fXyfObmyBYOh7en3MD7SoZl6bzuIJSKOw8VZHZZh1HZWwpnNNuzxtS9j140Lwsee2Y
         yLcCiSKI2RYzK1HBwkpoel3K/zSsKZzZ4SrSLfmWrRFbIXlzXaE4aRv+XLjgmNLmsRHJ
         5tuH4U0cL6iKdwxTyNqWGhRmtpfckONXUJUkKjHLPnwwgUS5Tw9gpZ8xhUbW+T8fRZsx
         1CiB6Etb5/+vXiWmeGp6Edhdb1qDPP8C0iG2lDRybD1rCHREx1ku2wranyYTYTbxQYc4
         07eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=5SrmZm0E7rQeLs413SppQaMmjlY6e1smVItluN5suK0=;
        b=xBFqZnPGlmy0MmUVYGxfwCB5NWimJG7/b/gyPKtMgh0VXYjRIPNKOAdt2jTFxgXPr5
         FOnMxXZQqPv1wDbtLGouDv6a3vJ3j2Z5DlqbyZd+tF0j2EIRdRtn4eef43EqraJhYOFS
         pvXBdu9V+Y/3bu2OLRgc6lNhCikp2m/UziFc11HGisAqC/x6LX4FFi9oEhItQ/56FeRl
         yV8UHm1JBUXN3/pKx0eU2ZG6X91lVJU1BVA3IQed3arF52xA4P9bHZcaI2/bTHibu/kk
         kGHZRVOW0qMznM3/MzpuF/PRrKUFQ4VhqIqnxh6ktVc8eQD/Nx77tHu0qVbre+SCLFDe
         MhSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cy0nf9Q8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w72si1273538ybg.743.2017.12.15.02.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 02:17:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cy0nf9Q8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePn3c-0000k5-RO
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 05:17:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePn1y-00007r-VR
	for qemu-devel@nongnu.org; Fri, 15 Dec 2017 05:15:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePn1u-0004ZE-W0
	for qemu-devel@nongnu.org; Fri, 15 Dec 2017 05:15:50 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePn1u-0004YX-Qu; Fri, 15 Dec 2017 05:15:46 -0500
Received: by mail-qt0-x242.google.com with SMTP id u10so11451731qtg.2;
	Fri, 15 Dec 2017 02:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5SrmZm0E7rQeLs413SppQaMmjlY6e1smVItluN5suK0=;
	b=cy0nf9Q8Nrg8yiAJbVbkxdrqPc2xoWeOOmIjwEcicGiO0f1uW2Yh47Mh7/aBU/LnN7
	vtYKbg50MOwy8Q9OtiGtDYWqHnGRUx1JSiyJqmHOsdEhL2k9NbjI3+wzoAL5wlIfz2m+
	dgs95Q0+l/KiXHb9u0A0ikaTwOG/qMP9mQrdBd+efi+WlP/tbSyAB6OiAfmcQgxIBl9w
	DRCnAXKfsgHmYLNF9wf5ed8jmclRMa5SSte+jeh3CsrP+PoPREAZ36vnJy62s9+oXq/g
	KUFqbdVRMhsxNL/LUE8A7ZxQdI/PxqsHpyg5J0Ks6ZWON04rks2r7IIDGrXXy4ysNCG4
	QELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5SrmZm0E7rQeLs413SppQaMmjlY6e1smVItluN5suK0=;
	b=N7PnbCc7t/ZXo7omfeeUzpbrfsorcEOPjNvzJmg0XG5lQz34JmPy7wLb8c7gjOeWz4
	GQJbwUdX/jhz1x8JJHOeALJ6ZAimeCzHeAeIcaf9qAtBiLpPiqsb/TVyZwM2Am9TUyRv
	tm64OXxirB5l7r/VOLsVj4A4+6HBLPl+b0fTny3Z6iCrT2B0y76be7fkVIFlmh7akQuf
	tqXm/M9KBUqJ+cOMCB8Wb6z2kUzuiMokrk4gMtHvuWKMJDcANLSMvCkfaz/2y/CDxE8T
	Ve+FaFA6q/nMS5NUyuY8Cjqh8kcoG5C8KRRGwOroItIFuvjShePF1F/LflE/fnjvtsoM
	GaFQ==
X-Gm-Message-State: AKGB3mKxI9BRgjO3ksFHHqfLre39BOiUaZ6iiC8GtoqUSlle1WYq63TF
	iLpABAghzymvTgmOYVgpBd4=
X-Received: by 10.200.36.212 with SMTP id t20mr21338468qtt.202.1513332946354; 
	Fri, 15 Dec 2017 02:15:46 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	r24sm1117799qki.59.2017.12.15.02.15.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Dec 2017 02:15:45 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-6-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9b5f2a4a-2cdf-d3c1-c7b6-0c1ab7e7dabc@amsat.org>
Date: Fri, 15 Dec 2017 07:15:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171214145255.31545-6-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH v2 05/15] imx_fec: Use ENET_FTRL to
 determine truncation length
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fcZnPiRZmBFu

Hi Andrey,

On 12/14/2017 11:52 AM, Andrey Smirnov wrote:
> Frame truncation length, TRUNC_FL, is determined by the contents of
> ENET_FTRL register, so convert the code to use it instead of a
> hardcoded constant.
> 
> To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
> increase the value of the latter to its theoretical maximum of 16K.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c         | 4 ++--
>  include/hw/net/imx_fec.h | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 56cb72273c..50da91bf9e 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>      crc_ptr = (uint8_t *) &crc;
>  
>      /* Huge frames are truncted.  */
> -    if (size > ENET_MAX_FRAME_SIZE) {
> -        size = ENET_MAX_FRAME_SIZE;
> +    if (size > s->regs[ENET_FTRL]) {

Shouldn't this be:

       if (size > s->regs[ENET_FTRL] + 1) {

> +        size = s->regs[ENET_FTRL];

and:

           size = s->regs[ENET_FTRL] + 1;

>          flags |= ENET_BD_TR | ENET_BD_LG;
>      }
>  
> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
> index 67993870a2..a390d704a6 100644
> --- a/include/hw/net/imx_fec.h
> +++ b/include/hw/net/imx_fec.h
> @@ -86,7 +86,6 @@
>  #define ENET_TCCR3             393
>  #define ENET_MAX               400
>  
> -#define ENET_MAX_FRAME_SIZE    2032
>  
>  /* EIR and EIMR */
>  #define ENET_INT_HB            (1 << 31)
> @@ -155,6 +154,8 @@
>  #define ENET_RCR_NLC           (1 << 30)
>  #define ENET_RCR_GRS           (1 << 31)
>  
> +#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
> +
>  /* TCR */
>  #define ENET_TCR_GTS           (1 << 0)
>  #define ENET_TCR_FDEN          (1 << 2)
> 
