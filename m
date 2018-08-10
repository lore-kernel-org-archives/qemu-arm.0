Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2658098wru;
        Thu, 9 Aug 2018 22:11:37 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxNbcXtbXTfwQvo7Glq6vpEUSSJzQMjJPYclWVg2IidXn2GEsvJJXaVEamDPsjJPU7o/b4V
X-Received: by 2002:ac8:3864:: with SMTP id r33-v6mr4860526qtb.24.1533877897071;
        Thu, 09 Aug 2018 22:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533877897; cv=none;
        d=google.com; s=arc-20160816;
        b=GDyIov55akB02Ta8aJqmjA+G9C+Xyj+En7NsF1W8mQrk8ibOiKhaT7hxYF4VoeN/Eg
         Lr8V5lD1Yl68aHmv2w/CTuyjlyEupo36Q4XCfhpCsFgPGtMo+B3GKoIHxjAyvvk/h58r
         ezCRAaLTgx+BABapO56ANQBNEOCRCRa1W8PAULCx2S+2LbtIfUoL0Md4dEZe2Bg2GoYF
         X/+/kzR9DvzHtYUNi3pvxgBmcDOVUVMoM7lnXqXVKldgdXPsmma781ugGJe/CoiTBFAi
         OJqtHt91bSQvU0godwquRkL7xpjucgPnGhbEZ9fVA3e0tHzZEgGIT8jdNP01aRIMbbSA
         Rl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=5DxctkTBhsSAJeZXO/DjtWYkAI9YvK9CfZlE8An0gNg=;
        b=ITgYleODYvE0JZqR9LKo2+WD1Al7tSSoa+8Mxa1y5ZG7rn5l5giMkYd6gWhbHsHgux
         mh41trnWNO97hitdrrjR0LWw9PKnml1Qj6HZDWA2aMLW5l2BsGpXUR6II6hn05bjIBzS
         sBCgmE7H15UX8wpXSyB5D2XgZg7K+XVYraGKwBmFGv51clNFJD87e36BnhjvmA6y/S5P
         ObnZa2FIU/Na9oR8yYPiEPzrok+02/nPJ1wLQubkU2tQTN5ferpuOvM1ZTZdjtGTFXma
         fPnAEHxFBAencTY3K34PfH7f85nU5NdTTjPOyrjb8SiIW5mEf6Wy2m/GTfF1NGmlYlME
         EHaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XYXx31DD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15-v6si8745537qvj.188.2018.08.09.22.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XYXx31DD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzi4-0006eN-7s
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzht-0006cy-Rl
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:11:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzhs-0000Oe-SY
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:11:25 -0400
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:37609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzhm-0000JA-KQ; Fri, 10 Aug 2018 01:11:18 -0400
Received: by mail-ua1-x942.google.com with SMTP id y10-v6so655459uao.4;
	Thu, 09 Aug 2018 22:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5DxctkTBhsSAJeZXO/DjtWYkAI9YvK9CfZlE8An0gNg=;
	b=XYXx31DDvdtjFr1+RkIw7nRDIMlOBJrmaDlH6M+yoFRGx3PZnGX85CzzFyDKY/9s0e
	c/XbmN5Sc3v/biGZ9LLXpncZ82Y8dio8Y6yEIN2GSdaQTG6tEAt4Ytk4XvlsWh4/GbXF
	caXHDCqCm/FAryU/hPc4OwTM1/o8voZFg5nBvrhZQH+fCGQncPv2v7Flp2X6VuKLislb
	+EJ8BpzEak5a4sSmf1e3ufiko6YU9HVpVlw9X78KYgVOADUuDq1xWt8Y4JcoJ6dJX2So
	XzOAxOBX+jq2BLde49pq2odcT49HOvF5B3yweSfXvdpkRQ1aKSzIFY49Ky1LRcgE4oAt
	OoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5DxctkTBhsSAJeZXO/DjtWYkAI9YvK9CfZlE8An0gNg=;
	b=Tz+Y+9Fme42rXTV806JgdEpo/1bx9YokYHmzBVq9DFBvZ+7XAgr827zkcHgF7IHPDN
	S6jkbdjCnp+V+MKVI8/1gmretLEEdx0K6IF7Kb/+ITF847f35bcFuk4bAUrGcDls7Yoz
	dGB3SOstvFuNJP0Idj+v6mhRFU8yypqbrwk3g8ZdLDbq1tdG5iG+dWPswUaKAjHNO5wk
	ka4uhLfsAXzyaaK4tNblb9nCFG+ClnI4/s9fAIE7H9KhSZuHtK1Ha8iaj91agKfZTNTC
	6UJJ5aMK0WtNwHMumt+XzitDQFg9dvIcoVZmlNtx43Vd3YLvd964GFFNYN+uv9Xv4aUu
	acnw==
X-Gm-Message-State: AOUpUlHYgguokTwgN15yT5SUX/H5jDTxoyVSMHuymD60tcM/9d4GHScj
	AtWgb5gHXN28EgeW+ixXiRc=
X-Received: by 2002:ab0:6583:: with SMTP id
	v3-v6mr3361486uam.107.1533877878108; 
	Thu, 09 Aug 2018 22:11:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	q193-v6sm2712594vkb.8.2018.08.09.22.11.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:11:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-14-peter.maydell@linaro.org>
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
Message-ID: <71afdf15-b38a-b93e-bec9-2b28fff9a273@amsat.org>
Date: Fri, 10 Aug 2018 02:11:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::942
Subject: Re: [Qemu-arm] [PATCH 13/16] hw/dma/pl080: Provide device reset
 function
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ie6NkXH6u/Fj

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The PL080/PL081 model is missing a reset function; implement it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/dma/pl080.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 8f9f3e08d9a..a7aacad74f0 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -348,6 +348,30 @@ static const MemoryRegionOps pl080_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> +static void pl080_reset(DeviceState *dev)
> +{
> +    PL080State *s = PL080(dev);
> +    int i;
> +
> +    s->tc_int = 0;
> +    s->tc_mask = 0;
> +    s->err_int = 0;
> +    s->err_mask = 0;
> +    s->conf = 0;
> +    s->sync = 0;
> +    s->req_single = 0;
> +    s->req_burst = 0;
> +    s->running = 0;
> +
> +    for (i = 0; i < s->nchannels; i++) {
> +        s->chan[i].src = 0;
> +        s->chan[i].dest = 0;
> +        s->chan[i].lli = 0;
> +        s->chan[i].ctrl = 0;
> +        s->chan[i].conf = 0;
> +    }
> +}
> +
>  static void pl080_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -393,6 +417,7 @@ static void pl080_class_init(ObjectClass *oc, void *data)
>      dc->vmsd = &vmstate_pl080;
>      dc->realize = pl080_realize;
>      dc->props = pl080_properties;
> +    dc->reset = pl080_reset;
>  }
>  
>  static const TypeInfo pl080_info = {
> 
