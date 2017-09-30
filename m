Received: by 10.223.197.9 with SMTP id q9csp1239449wrf;
        Fri, 29 Sep 2017 19:29:53 -0700 (PDT)
X-Received: by 10.237.33.188 with SMTP id l57mr9375984qtc.270.1506738592990;
        Fri, 29 Sep 2017 19:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506738592; cv=none;
        d=google.com; s=arc-20160816;
        b=V1GmVruG1aSJkxcrd7j8GS5EMgwsdm2z+Y2d2GbB5caSMKUsieCMFtnto+8UQkG06m
         5CPDcQP7pLT96WyLaHcyKobJCLvsapLa6l1j5+MPELINuCIIC17csdJ5dZ1qZkYVix2y
         Xp8WEsFkoRaQ4EwhglYSKKrb9pEPSehPCOLa+65L5cgo4ygjvKQda3IZZpARsZwUzREh
         Y8VWFnhPQ0iu0GFKEDKQWcQwfVBf/4eRSjMXZPiJoNdmtopmGqJtfy3RMNNls3P599g5
         VTrD3fVBDwuoIyQiKzZh9DCXpuV8WnnkSYLdVTAa1NjFJUH0/YvtseyI8xxRgZI48sOp
         TZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=QUnNAuAh/v4M3hXFm1vW0LZhLQa1VBmIvRZ9MDH16KQ=;
        b=dpBiW2PoPZOp77H0s6J9LBtlXAmmNPO3Dg+8cYe9OP4hk7HmB7fy1amUCzaZlu8ZZU
         CR4neb+gwpjugeUE/KBOjsntoehWUrqO08hqEytpFck1+hgLhJTGDyjJMCB5A3th2me8
         VMA/LJwuNRdMUljle1M92dFJ0iF7I9Biefe4aFneaumlfkhVmrzKjtmDnnpL8Oqfgi2M
         eO3JEa0spMDBQ1bxgzFmwEb97JoKu1sWTEy9yQp/OKSlyvE9fu8qqMlBPI7KACQZSe5Q
         0IgHWqmMjIPrXGU3039xx7QYr7QaSSKHhWe5RS+Ev8GTN8RzDoMYtDNdSpLlLk5SVe8B
         e0UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RYIslfC5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j19si320193qkh.286.2017.09.29.19.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RYIslfC5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7XK-0007Ip-Pg
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Uq-0005mP-JK
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 22:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Un-0007SL-P1
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 22:27:16 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Un-0007SD-JC; Fri, 29 Sep 2017 22:27:13 -0400
Received: by mail-oi0-x243.google.com with SMTP id l81so585348oib.1;
	Fri, 29 Sep 2017 19:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QUnNAuAh/v4M3hXFm1vW0LZhLQa1VBmIvRZ9MDH16KQ=;
	b=RYIslfC56pXxAadEqUwvvab7ScpbEXvy9L4cAB+ezbx5aFbr2y/2bAG220G6YYQ+Nl
	I9hydYm153+O8ZhV4iWm4oFMYSyDoj8zDMI0x0+ZAMjooKh7Vz5FE3QHbF2PnCmPMnEU
	pu0tPHCyHKOLnaOE0SQzhuB/B6JC4VMKJeb8J/5FCZRfArvPb4bmz0eXaCTDawQP0OUK
	H9eLZkOjcVPRQjmxp5IlLt2nDds8lCwlsoJdBXTwp1C+LLR2XWQ4Sy/kHsIW2VTYJ88+
	7o/tLkerST1fKiE24u46Hq2hpQdjcbuiBQBfkHdnVt5euH0XloYx0VVpps+PObP7wsfo
	XSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QUnNAuAh/v4M3hXFm1vW0LZhLQa1VBmIvRZ9MDH16KQ=;
	b=fFScFdmgrmp7deDQqRpJlzELg3xUadaWFmgd7oydJz3nzXlSt/H+wUngKgkNdzT7+j
	aIqd9oNPbnr409jEHG77bzwsOeiE78TmlJJboczxWQwXnvUVPTjT1BE2CmQsYfBhiB3A
	KEyWjVvNRXNo02jWxpPNViza/3yCrxkZmnnPVyUM7zoZSc22TwnBXRxJYaBwtRWIyUrV
	R85yNLRDvEwp1hPC86SClsZietQq+OdFU6RlIN4Tk1PfCI1x+bpcK5mt5jLOxqWy2BYW
	r8BpPo+s2RLenKY4qv0uzIMptZMOUr94wT/jcnf8V3UszXyhQ7RYX4xs95/wQPzI5GVF
	0CIg==
X-Gm-Message-State: AMCzsaW6haVL2Ftq6qxpPryd3OXp3bzwkpof4VaNhHmpFKFLt/uuflaI
	qBpAgOC4vsMNnp/XHLg+vJ0=
X-Google-Smtp-Source: AOwi7QDjCQCnBat6YWD6ThHzqhN8yAti5jXgo/6YK1nZI6BsOoA+F104QHJsO4dj5LgiGHXYGjsM3g==
X-Received: by 10.157.31.98 with SMTP id x31mr3798197otx.58.1506738433017;
	Fri, 29 Sep 2017 19:27:13 -0700 (PDT)
Received: from [192.168.109.31] ([64.125.109.186])
	by smtp.gmail.com with ESMTPSA id
	q10sm2663224oth.64.2017.09.29.19.27.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 19:27:12 -0700 (PDT)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-6-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9a757d6e-6745-9df4-7199-d55ee2510d8f@amsat.org>
Date: Fri, 29 Sep 2017 21:17:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918195100.17593-6-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH 05/17] imx_fec: Use ENET_FTRL to determine
 truncation length
X-BeenThere: qemu-devel@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@gnu.org>
List-Help: <mailto:qemu-devel-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: 1tk68hxQLQcQ

Hi Andrey,

On 09/18/2017 04:50 PM, Andrey Smirnov wrote:
> Frame truncation length, TRUNC_FL, is determined by the contents of
> ENET_FTRL register, so convert the code to use it instead of a
> hardcoded constant.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>   hw/net/imx_fec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 767402909d..989c11be5f 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1050,8 +1050,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>       size += 4;
>   
>       /* Huge frames are truncted.  */
> -    if (size > ENET_MAX_FRAME_SIZE) {
> -        size = ENET_MAX_FRAME_SIZE;
> +    if (size > s->regs[ENET_FTRL]) {
> +        size = s->regs[ENET_FTRL]; >           flags |= ENET_BD_TR | ENET_BD_LG;
>       }

for this to be ok you need to update imx_enet_write(), such:

      case ENET_FTRL:
-        s->regs[index] = value & 0x00003fff;
+        value &= 0x00003fff;
+        if (value > ENET_MAX_FRAME_SIZE) {
+            warn_report("%s: guest requested bigger "
+                        "frame size than QEMU supports "
+                        "(%u > %u)", value,
+                        ENET_MAX_FRAME_SIZE);
+            value = ENET_MAX_FRAME_SIZE;
+        }
+        s->regs[index] = value;
          break;

Regards,

Phil.
