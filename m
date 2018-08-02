Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2158138wru;
        Thu, 2 Aug 2018 08:39:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdLYHQe3+IE9MKOp+ucmywgTnDdv3M1sHTJsFq4rnbfIgn2d20oKLRglmF+5IDskY3rdunI
X-Received: by 2002:ac8:2a18:: with SMTP id k24-v6mr3112979qtk.219.1533224373207;
        Thu, 02 Aug 2018 08:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533224373; cv=none;
        d=google.com; s=arc-20160816;
        b=QNPus5mOLgf/EvIulPZ7MhUfic3XYVCBXvozdOap5/IiPF/2Z9nyTdtrDzmcgYncaZ
         h0mUGKDUPV1gE4Pj+wfU0b4SEiPzuL1tPcYTzE7JD1AGo0Q8vYfFMwPSabSL+XufzhtF
         YPWrwjtvTxW6zVqfKAkLTGajpg+52j4gAfma792al4gUxTw6qECIEcqdwOlpw4q5efVq
         jewT/y3/EsCeRgMXfspSiE3bnPC31WcoF/sV21M4nCfyOsSs6+EfqRvCw4huCrUPNjFm
         xXIyYK1C5c1yUbssJCInxcZW/ZAlaArPNRFI6LgKTDliUK5DSeJPIQKlvfvvoNQLfcuy
         FdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=JiZSW169yJC7QUtTM2tDhC28mC49h/oLghfQrt+3Vko=;
        b=020LBMx6x8v+e28DWb8QNDQ4vJm5GQQk3Cvkddx13qjhm1gx9xX21zB6lgnsoyBAuY
         SurwdHQ5wq4/TnyZZ7Xi5LklpHlMSjkms53VyAUaZBdoyy2w4mkoFwerjklIjoUDVKNT
         hHrvWE/wHoenKHMon3Tu9RfVVEctwjc3dFjhb76EZniyJ+ui2jqLN2+Mcg771WB6ZQUl
         KDms42+65ZYf8rLuzxbGPLbxMFbqyHKewdsfzzN+8bFgXMdsgr0kZoBDgdDJg5cn5s/d
         htdBsOs/WnaF//bDZpvLZha8HraHifRfHo5Xnh6Q7hUkpbB1iBv3cRgBNq5g6tFWqutf
         eAZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TqNVCpAa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6-v6si2013480qvn.166.2018.08.02.08.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 08:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TqNVCpAa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flFhM-0005Lu-L3
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 11:39:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1flFhB-0005Kw-AX
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 11:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1flFh8-00071g-6Q
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 11:39:21 -0400
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:45817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1flFh8-00070n-1w; Thu, 02 Aug 2018 11:39:18 -0400
Received: by mail-ua0-x243.google.com with SMTP id k8-v6so1726827uaq.12;
	Thu, 02 Aug 2018 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JiZSW169yJC7QUtTM2tDhC28mC49h/oLghfQrt+3Vko=;
	b=TqNVCpAaXJevm8GH8O/w6xO+VeSNY9cOsDjz2/76nwaRGLFk/3WIzt20zU/dd81Ngz
	I9Y2NMosMmzRlVu3ZwBvLTdwXE1sMGlPl3BP/X5igdaLQnhEIu2hjThTbzeiczhaBBfJ
	qsKngxoiBsp5Kf8B33t8WurLLGyatGkxHjBi4a8q+zr3JBtjYwhZdK7GFVsW/yFnRlL2
	F8rhxBzlYlJ2y+RRhsVyfGpJJawBJcD/xQ7EP+/UcXCbk+xHXQE39RiZPw+hfBgtul2Q
	jQhXl9i07FaKP7Bfk4ViT8DEsltvrXG6jlzJXJichNgnZIQXtbVKkSS2etlsqGvsXqWA
	0AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JiZSW169yJC7QUtTM2tDhC28mC49h/oLghfQrt+3Vko=;
	b=b5gykscTLSY/XdqiNXhKdQL3WdBTth676pWAsnC83kvvjS2W0iXRJx/vq3xRz+9oKe
	rvIhFcXvQ75PN8GGxlkOoySw2W/nfm3h/xuej4wVdP/lMtPEza1qYF6RdppT6p39AtM4
	PmeQv3QoPb8/TPGwP7vtM4rAXAcjkPUzUWEq6IRBDTzhs+SrSM9bVeGQBq8FKtuGkTvE
	f5Mwtigr7qbjNTLcUMtPgfy9HcabAB9WiO2sAXgSHT5RHNsst8HZ9t1/ugzJW3d3sAHt
	HCrSP5Ad03XXU7XmR9zwUbMGuts1URQhyPV30xlsHScsC+xndRLr2Gz8I0twBJqih5ct
	4wKw==
X-Gm-Message-State: AOUpUlEXkKDeF9U0xR7ZJW+EjgGJvI0DjbEkz8WFdzQuoBWIwYFC0MSE
	Hv4RzCQ39DE8nNWHQfUyVtSco7Pm
X-Received: by 2002:ab0:4e16:: with SMTP id
	g22-v6mr2380870uah.171.1533224357053; 
	Thu, 02 Aug 2018 08:39:17 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w16-v6sm417550uam.50.2018.08.02.08.39.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 08:39:16 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20180801123111.3595-1-richard.henderson@linaro.org>
	<20180801123111.3595-5-richard.henderson@linaro.org>
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
Message-ID: <72c08000-d0fa-1b02-a1f1-d0cb2c6d6566@amsat.org>
Date: Thu, 2 Aug 2018 12:39:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180801123111.3595-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-arm] [PATCH 4/4] target/arm: Fix typo in helper_sve_movz_d
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pmiuZ9P+BSOY

On 08/01/2018 09:31 AM, Richard Henderson wrote:
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 87594a8adb..c3cbec9cf5 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1042,7 +1042,7 @@ void HELPER(sve_movz_d)(void *vd, void *vn, void *vg, uint32_t desc)
>      uint64_t *d = vd, *n = vn;
>      uint8_t *pg = vg;
>      for (i = 0; i < opr_sz; i += 1) {
> -        d[i] = n[1] & -(uint64_t)(pg[H1(i)] & 1);
> +        d[i] = n[i] & -(uint64_t)(pg[H1(i)] & 1);

:)))

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      }
>  }
>  
> 
