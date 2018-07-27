Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp623708wru;
        Fri, 27 Jul 2018 05:06:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeI+vKvHJ1n3AJFGNa5gZHch1MZuUfOeIZmVHJYv8qzEBNIkSunssnGhQyf7eUbmGWRpUSG
X-Received: by 2002:a37:6902:: with SMTP id e2-v6mr5658184qkc.0.1532693182099;
        Fri, 27 Jul 2018 05:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532693182; cv=none;
        d=google.com; s=arc-20160816;
        b=vuWu3CVGIkhbryubNm9Z+xtD9w3Pfmg3xia/NoQVoUMiN0mvPyvzcC+maD/Fle4fde
         JT5V4rJud3E3X6+7ciJ3CP14tROV2NU/YSM5gmd6DScM9nnas4L68qBXoBFgjB/OSF5+
         M7ZzFn8nCedMkdihR2BCFis38su6uPNGjmF/BIp5Xy6f5CzqRcBGmgeatugRT0MDRmLQ
         udqffVBaF7oUACYyGfwkxiRVBJlCaq/J8ah9Fc/gcEhna5XSPcKZiT9FBcJPO8Df0w9C
         MbHJPvqAQytvdRcaqRJ6hXq1eim0IAxGJXRkot+D3E99TpcTwZaN70o01XbxVIudg6mQ
         bFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=G97ue7QOQjl9ZqdCZ4zplU6ev26XpMk3SqLDyaOIpas=;
        b=xBqdyN8VAyceJNhQYM7aCKhAsc0520pvMrY6m7VenlrTj9unHzwt/W0UnbPIByPQBQ
         5L8yHcRfWuucjKnnnfyAVEb05GqgzJl9wu75VS+gfroXWyzuFE6LLKhyIau6QV8Y+p9y
         +KJFtZHXpNp/QcsUvtoKC1fb+ccQnH7USHRBsbLXM0+kXQNtaJe7mcBavDPDre67szHd
         qNYRRILYzVEDwEQTWHoEflPwwC9dOKKuhq0pDzzDPEWyOkxJ6J/IGZAEx4zZHk+DAtSA
         wjn8N5UYHtNJb7M1MrIkYJFrV1wggffkAzm9akfP5zl3kvJGbIJjGrp1p96SmgyjjfVS
         VYTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AHPIL3G7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 101-v6si353693qkr.55.2018.07.27.05.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 05:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AHPIL3G7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj1Vl-0007hB-Ki
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 08:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj1VX-0007c2-DZ
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj1VR-0000ck-Qn
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:06:07 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:44613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj1VN-0000YU-GA; Fri, 27 Jul 2018 08:05:57 -0400
Received: by mail-vk0-x241.google.com with SMTP id 125-v6so2316667vke.11;
	Fri, 27 Jul 2018 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G97ue7QOQjl9ZqdCZ4zplU6ev26XpMk3SqLDyaOIpas=;
	b=AHPIL3G76J4zjjNfGodYnM7i1mjVrrDah4B/deCvjQCEKIUmbm/4ZXJVKx2fC6QKUr
	mJbbUu52tsDTD/mMVwl3hVrMgovkAONkbl7rQ3dw5Mi9XPEXdk9t5D68avI56PtMsIjU
	rJMI1hUrntou/MtXziOj/qijbBXOoLWCeF7eNS1C1jBR6Q7OAjdaLCN2+xhWfJQap4yl
	QWt/4BlWrZyl6foNB6SSTAeSjEEgAn7XcC4oly56P8mmUO/feNx3a6M+xdgd1E2AOBfU
	8LCgoj1Xtx8pTNY901HJ4UOxaYVmf85YPS2yWuZZQGdXUJtQlqYsvEBqvOvNxQEOap3N
	rosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=G97ue7QOQjl9ZqdCZ4zplU6ev26XpMk3SqLDyaOIpas=;
	b=fEGblPEQCg1nT+VZ6DN23Qy1DbRET17GAlpH8uwNFJUPb4MP371mn2dBnALAr+/TTs
	wYXP0oRGzWyVczr0ouknplxRcsLArHmnGPK3RinyuAbXPt1zJGxtwT7I2pV6gyCwD177
	OYde3/xMw7bkoYpU7S5mlYzUWp27SlnOWLGVXxnX1ZwhCL81xgfMb70j/UFLOYf0iHtM
	xDI7CdwwVZ730i3f5qhMPIfhn2VDKtd3WvWbHqambtip2p+q1lnYUN4qWZrR6B7WTKaY
	w66x0G9dTGXpZwPgxpLY2x6FiwkLnZPR4ti6T8jRecAi5XBpGaqhvPBFs1zqAHkG2uqX
	7PaQ==
X-Gm-Message-State: AOUpUlHUxY+bT6gOMHFEzVog4fkM3HLJU7mLfI+mxGjQVVcv/Dxe6WiZ
	DJjdxEIt8AA9YjfCIfqivwc=
X-Received: by 2002:a1f:9945:: with SMTP id
	b66-v6mr3695628vke.100.1532693156769; 
	Fri, 27 Jul 2018 05:05:56 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w16-v6sm726862uam.50.2018.07.27.05.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 05:05:56 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180727113854.20283-1-peter.maydell@linaro.org>
	<20180727113854.20283-3-peter.maydell@linaro.org>
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
Message-ID: <9c2441dd-717d-0272-e386-a936bf3da17f@amsat.org>
Date: Fri, 27 Jul 2018 09:05:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727113854.20283-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: Re: [Qemu-arm] [PATCH for-3.0 2/2] hw/arm/iotkit: Fix IRQ number
 for timer1
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t0QnzT27jEno

On 07/27/2018 08:38 AM, Peter Maydell wrote:
> A cut-and-paste error meant we were incorrectly wiring up the timer1
> IRQ to IRQ3. IRQ3 is the interrupt for timer0 -- move timer0 to
> IRQ4 where it belongs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
(ARM-ECM-0601256 Table 66 Interrupt Map)

> ---
>  hw/arm/iotkit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index c76d3ed7435..8cadc8b1608 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -382,7 +382,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
> -                       qdev_get_gpio_in(DEVICE(&s->armv7m), 3));
> +                       qdev_get_gpio_in(DEVICE(&s->armv7m), 4));
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
>      object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[1]", &err);
>      if (err) {
> 
