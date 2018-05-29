Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3567881wre;
        Tue, 29 May 2018 06:25:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKAN1oPiplb5WAeoymOvzMO923bZaaSntJ7pWceQseGhvQqADWxsLwXhLAoOCdXMOlwrKcv
X-Received: by 2002:a37:6894:: with SMTP id d142-v6mr15045116qkc.348.1527600318307;
        Tue, 29 May 2018 06:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527600318; cv=none;
        d=google.com; s=arc-20160816;
        b=O9+Chxam9u3R8zsIx/ScTGZ1k8u0dNMFUytO1zH2BsyPwyoytLlMiGDe/DDmxwMfTQ
         3957UIRwVaLbFoU+fW1bsz4m8dDWQXnyMGXi17/gEYmt3zaDQ1gh7KYN9WeYQLTuZSsh
         rtV5E/8dnkxaSPvLBYqbqkZ0gtrURC3rQXt+6Jx9Sj5K9wKIpV4h1sMb5/K1WZAD974h
         SbW//CJuP0LmiXJJl7MfaWTnPh8GC5Sz7ktAPKi8GvrcR7oWU1JCKGJDXgADx+eJfTzs
         CY4cK2Z5S9/wPtj52M0WxADlGmEpGu7khS2EwY5MwZanZ58emROquwM6VtbRS6MNri0L
         c/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=MQ5l33LFwWCQFS+P8+GCpwTkN1h//inrPi6Th5yvMWk=;
        b=wqBg6Hugv4ztzWj2vDsF+b+VwZH4AgneLZUnOiimGUAiRPKx6p7orWnc/OmUOEEAjM
         CnBNqBPv3xD4lR2LDCTgiYaUj09ITPjNB3zdU6B4Xxs/A0C+hmV5R/5mezkpghJ6EMhT
         +PcE1WQ5zEWkWMBcnoqRtE8AgLtUslCCX1Ab6E7hOnjqkQ+J9PJInL2IG03SsNRY1GMn
         JDsZ6L9Y8W6vPK2vwfdOKvFPki7aoSZuO4Soms1Q/fdBhATgl2ixw6Tv7Dz0l0TN372X
         0k7bCdq4vCHeTcCu9IZy1s7P2AyCEDG1ZJc3wIvwm8FnpozGMN1a3qJZ/rLrZdinHeCl
         W89A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PFjVGeyb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c43-v6si4662635qta.21.2018.05.29.06.25.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:25:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PFjVGeyb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNecn-0005vn-P1
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:25:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNecR-0005ul-Ol
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNecO-0007vG-F2
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:24:55 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNecO-0007uh-AQ; Tue, 29 May 2018 09:24:52 -0400
Received: by mail-qt0-x242.google.com with SMTP id e8-v6so18579378qth.0;
	Tue, 29 May 2018 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MQ5l33LFwWCQFS+P8+GCpwTkN1h//inrPi6Th5yvMWk=;
	b=PFjVGeybMB0+6FeXjql8ZfP8pBWiOrAdVvwQFj4/F4txiYZRjLte6gS2OfnfmdTK+6
	9MwYmloKGruSoJzmO70rUB+DBAOemPKZcW0PSddiOLanc3n4xH0jYeWS+tweKcjRyW5L
	KUqEHuDjGDEWoDP90xfCSMKDYVCSoxrHlMMBhdBx1wl+2TJcTDDsQllmCIGAXjUI9qmn
	NvTsS4lt3CVG+8q7NuMLG3j1dQVYDUowhnMkVDZavIe7DK5RuaKCOvXQ/RmApGizkIBa
	b+rV46mQKRuUuHgtK6HrqtDizuKO5PHKmkrAgGOki5gXbtH4zS0DLoxQwfkOcbxL4JKJ
	jApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MQ5l33LFwWCQFS+P8+GCpwTkN1h//inrPi6Th5yvMWk=;
	b=X26rV5Nh/LIT4pGy1IRcJMuO6tYSibXP7CJaUw8H8gqd8No8+nSr7I89Q7J/ZkEFE/
	ygLkozuVJh41o6WTrY/XvAhhePGmkBnv+QlK7CLtRZH4eE6yvUuuG1D1K06DyvfcZNGa
	U6Bf64RgnsaLe2KF/M0HfqtwNqWh8IwN5Z3hszk7+JkqtHuab3krlCdVG3ndEZChFrrr
	wlOlvpYe4lZKJC7dlFlbaplLb18rlvRZk5kD9SbZY7tSoNJ3oX6hdsCLWHyG3cPa6uir
	h1BhS61MJNUXTtWjKsx8+feva7v54VeDUOu1/vQ2fYkhJ/U0tmIvsCm82pFxQA7EJHfA
	wiCQ==
X-Gm-Message-State: ALKqPwdeDkT+FUaFFK0BsMFPiRQKOdPSWBqtUEmb0TCkexQtx8PrTbSb
	lyfmkBoiko5NcDM0oY7E5TBoYRRwPQU=
X-Received: by 2002:a0c:bf12:: with SMTP id
	m18-v6mr15479952qvi.247.1527600291585; 
	Tue, 29 May 2018 06:24:51 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	l8-v6sm5668523qtf.77.2018.05.29.06.24.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 06:24:51 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-7-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1d6ade72-ef0b-54c3-22f2-af2e514edb5a@amsat.org>
Date: Tue, 29 May 2018 10:24:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-7-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH 6/6] slirp/ncsi: add checksum support
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T7IHSKIzkSsG

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> The checksum field of a NC-SI packet contains a value that may be
> included in each command and response. The verification is optional
> but the Linux driver does so when a non-zero value is provided. Let's
> extend the model to compute the checksum value and exercise a little
> more the Linux driver.

Due to
- "If the originator of an NC-SI Control packet is not generating a
checksum, the originator shall use a value of all zeros for the header
checksum field."
- "All receivers of NC-SI Control packets shall accept packets with all
zeros as the checksum value (provided that other fields and the CRC are
correct)."
- "The receiver of an NC-SI Control packet may reject (silently discard)
a packet that has an incorrect non-zero checksum."

I was tempted to suggest you to check the input checksum if any, but
"A controller that generates checksums is not required to verify
checksums that it receives." so we don't care.

> 
> See section "8.2.2.3 - 2's Complement Checksum Compensation" in the
> Network Controller Sideband Interface (NC-SI) Specification for more
> details.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  slirp/ncsi.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/slirp/ncsi.c b/slirp/ncsi.c
> index f00253641ea4..fbfb79713f23 100644
> --- a/slirp/ncsi.c
> +++ b/slirp/ncsi.c
> @@ -8,9 +8,23 @@
>   */
>  #include "qemu/osdep.h"
>  #include "slirp.h"
> +#include "net/checksum.h"
>  
>  #include "ncsi-pkt.h"
>  
> +static uint32_t ncsi_calculate_checksum(unsigned char *data, int len)

"NC-SI packet payload interpreted as a series of 16-bit unsigned integer
values."

Can you use the "uint32_t ncsi_calculate_checksum(uint16_t *data, size_t
length)" prototype instead if you respin?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +{
> +    uint32_t checksum = 0;
> +    int i;
> +
> +    for (i = 0; i < len; i += 2) {
> +        checksum += (((uint32_t)data[i] << 8) | data[i + 1]);
> +    }
> +
> +    checksum = (~checksum + 1);
> +    return checksum;
> +}
> +
>  /* Get Capabilities */
>  static int ncsi_rsp_handler_gc(struct ncsi_rsp_pkt_hdr *rnh)
>  {
> @@ -108,6 +122,9 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
>          (ncsi_reply + ETH_HLEN);
>      const struct ncsi_rsp_handler *handler = NULL;
>      int i;
> +    int ncsi_rsp_len = sizeof(*nh);
> +    uint32_t checksum;
> +    uint32_t *pchecksum;
>  
>      memset(ncsi_reply, 0, sizeof(ncsi_reply));
>  
> @@ -137,15 +154,19 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
>              /* TODO: handle errors */
>              handler->handler(rnh);
>          }
> +        ncsi_rsp_len += handler->payload;
>      } else {
>          rnh->common.length = 0;
>          rnh->code          = htons(NCSI_PKT_RSP_C_UNAVAILABLE);
>          rnh->reason        = htons(NCSI_PKT_RSP_R_UNKNOWN);
>      }
>  
> -    /* TODO: add a checksum at the end of the frame but the specs
> -     * allows it to be zero */
> +    /* add a checksum at the end of the frame (the specs allows it to
> +     * be zero */
> +    checksum = ncsi_calculate_checksum((unsigned char *) rnh, ncsi_rsp_len);
> +    pchecksum = (uint32_t *)((void *) rnh + ncsi_rsp_len);
> +    *pchecksum = htonl(checksum);
> +    ncsi_rsp_len += 4;
>  
> -    slirp_output(slirp->opaque, ncsi_reply, ETH_HLEN + sizeof(*nh) +
> -                 (handler ? handler->payload : 0) + 4);
> +    slirp_output(slirp->opaque, ncsi_reply, ETH_HLEN + ncsi_rsp_len);
>  }
> 
