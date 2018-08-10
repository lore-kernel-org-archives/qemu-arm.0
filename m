Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2660172wru;
        Thu, 9 Aug 2018 22:13:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwhtcDb7qjzHVFjAxt5f5wub//LWIAZ7+KWdtTwWUuYEeBpqdBTR3Re1HmrrIQm7z/wIAdY
X-Received: by 2002:a37:c8e:: with SMTP id 136-v6mr4505619qkm.197.1533878023444;
        Thu, 09 Aug 2018 22:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533878023; cv=none;
        d=google.com; s=arc-20160816;
        b=fmBGJ/k3iVfNsKMmGtIlqOOKIxFnhskRvmreTWxjShxXSjBv9G4rgMEks6g9nOA6q6
         athy+ch7cT4o5elD0oOnae9nQFPtrSQhYknObHskR5Vr3qZFhMTfn5/FFMjF2npJFjdv
         TlxnG8zdQQS/9jidYsrqyP/UhTuisV9cAj9nMxLZFmGITn8IRjD9c4B+te9+Zeu6vPgO
         yNlmIuGvZ11EKS+YLYN/jxOB+5iTFpNU8wxcYSoeZw3mQ5MnrWrauIzGHZ6qHmzg/Tbw
         e8SMjcFNfrEvzYF0UIQDdH3Vx+YEiO6vRI92fjigKYdgGEnubsPxd5BSf7IUHBvZncTs
         2anA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=RsupT7tmMS87p0exS+ap/+NzogNwgb7YrG9OQ9nAXbE=;
        b=AVWRHzD2aZUbIijw0uvy4hYJm+zihCnVhwAGiNnobgY86sLkXRVXbcqnhajP+ZS3Gl
         T4diK+CY3qsq2R3sEzSqmeJyHAVkAnMZTKch6u+xMBo0nNQWFZ4+kMOac6Syb2IeJVc6
         a+PFVq8RwQQqsuc/L5LcWbhcTinITtLPc9syPNzYASXKVguYzGub+fI7NR/DwyyRMify
         2MxsN7/vNRZMR/YpRja6jbL2uBdoalyaK8kW95B9rP/OHKtN5j4caz7wDxK9nODQw6Px
         hwV3XBTFiaKobWlPHMC89BGqZ8yTTW/xytD6LwbRAcUAu2fk75OujaHduhsabrHffT7v
         rUhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jcMYJiNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y184-v6si2313040qkc.216.2018.08.09.22.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jcMYJiNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzk6-0008PT-M0
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzj6-0007Zr-P1
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzj5-0001JI-LM
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:12:40 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:32890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzj0-0001GW-El; Fri, 10 Aug 2018 01:12:34 -0400
Received: by mail-ua1-x944.google.com with SMTP id i4-v6so658545uak.0;
	Thu, 09 Aug 2018 22:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RsupT7tmMS87p0exS+ap/+NzogNwgb7YrG9OQ9nAXbE=;
	b=jcMYJiNsOtre/RjqNhdTFq7SUxi1RNKHNmIFNME6WTOUyHE7fMuE0+pV/ayGZPu5n7
	/hvqZTEuZQDaZ+L2G/ZRYAuRy/TQ7Tg6PhbBXt1nvypAul+0yPqOr/OqqB1FzDUR0zfp
	nigC0wC6l7rjgnKpXai0at5zk34C0cburiO1KKeZFEkdUVfKFD10DioWxL/V2NdRdN7B
	D1GTYqv5cC9h1+vrZGlReOChkvxc319eR4fjwBsrf1bbYaFQpiYJorKGfUbQYJlXERj+
	eV1r5DrPjLbAJAZ6JyFBcGASDPglK+PmL8/L2kie/+pqkB3tw9d0yj/HpdPDab2fYnTi
	ag6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RsupT7tmMS87p0exS+ap/+NzogNwgb7YrG9OQ9nAXbE=;
	b=tILjGRtyjuzDrtG3N39WNCk6MTVRarGCfI3IdynfIo6nxAOdnv5jsbdLkQwNpTsL9M
	FzHU4PSyUogm62J/Wd90N0lPIwkxsXfPPvN+kB2W6WBOcngmUSvatuGtsZ2vSzMn2O4R
	k3fncmDYPo67Hnvr8cJh+PEn9MxA7uPWlgjypgV8RyEEe/6N53GYQTnabsnr22GJ1v72
	8cKzBVvQ4Ki5nTfGjrw5b+mjR42Bqyvgu/reBsRV7BWt0srD9YwYl2FkvHCak4gTIwVA
	pWOmcBnPlaIEiNRwuFyxT9kwxLj1qtc6p/yS3gEwLl83ylFH5tKT9N6exMILFzbW4BP0
	JMSA==
X-Gm-Message-State: AOUpUlH3dLy0RJMUQTI89ITNkxTx339E4gIKX9fnlKjhEZ/2cM+fbrP7
	KkN1RqlD4VUNFVsIkiJs/Y4=
X-Received: by 2002:a1f:234c:: with SMTP id
	j73-v6mr3170058vkj.93.1533877953854; 
	Thu, 09 Aug 2018 22:12:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	d203-v6sm2570642vke.39.2018.08.09.22.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:12:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-16-peter.maydell@linaro.org>
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
Message-ID: <282c54cf-bf16-f0a2-ff04-c5324c84eb83@amsat.org>
Date: Fri, 10 Aug 2018 02:12:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH 15/16] hw/dma/pl080: Remove hw_error() if DMA
 is enabled
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
X-TUID: 0A2tc7k+K5qD

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The PL08x model currently will unconditionally call hw_error()
> if the DMA engine is enabled by the guest. This has been
> present since the PL080 model was edded in 2006, and is
> presumably either unintentional debug code left enabled,
> or a guard against untested DMA engine code being used.
> 
> Remove the hw_error(), since we now have a guest which
> will actually try to use the DMA engine (the self-test
> binary for the AN505 MPS2 FPGA image).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/dma/pl080.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 8f92550392b..ef15d3e628d 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -110,7 +110,6 @@ static void pl080_run(PL080State *s)
>      if ((s->conf & PL080_CONF_E) == 0)
>          return;
>  
> -hw_error("DMA active\n");
>      /* If we are already in the middle of a DMA operation then indicate that
>         there may be new DMA requests and return immediately.  */
>      if (s->running) {
> 
