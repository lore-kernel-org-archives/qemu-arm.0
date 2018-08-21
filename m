Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1566353wrd;
        Mon, 20 Aug 2018 23:53:25 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ4amQUxhMByBBVDj98SHeGv9kMcXA8qjm49lG9CRyLsJhX07e6dxjVt6b9S1oYGeGZQDXr
X-Received: by 2002:ac8:2fc8:: with SMTP id m8-v6mr1976557qta.202.1534834405481;
        Mon, 20 Aug 2018 23:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534834405; cv=none;
        d=google.com; s=arc-20160816;
        b=tnDocWJOOeoB+nV+e9Tra5fVgwH/6ObLSUm7ztB1SfPbvPCQ/Jx9O0aw1JoP+gVP1c
         2Fv3FLBD7JcOeglVxqfaOLsRg0HbYN0hrRyqiSxMTW0TZ1FFNrHW//uOFGkpn+6ssjSW
         60jO+zvF07YJOQlSjmULhttZVKtX9c6f7CwksCCLlHmUVssarOMeLDyY78cXybSfF8Iu
         3KjR2EzqJ27ZY4pp4GL1yCFdq3Gyc/uZOBHr1EnYvbvoMxT2NiY4f2cJZFbk6eirGQUE
         zU+guWH57DhLGe/E3LB2ED72zyTOCA5LxZV2P6iM8I3ZZwDgUZDTXpwQuDeZ472jI4XE
         1o3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=vawcQVt5dzBHPAQltnF2Jv9ey8cFY4DhFLth5lx+gJw=;
        b=QrCl0IGUUZuVGMwSW8yDWABzCo1jKACR+XllyAMQIutlmB3/iWl/OalnN6iVlpHcnj
         DrKwItZLkmAOscyL24drYCYczcmDouLSr7ooWcZNJS+aNLzVZ7kkBp1RBDXazn8pcB53
         5Ept3kZHfxQDN5M4iSmbHEqc2W3eRvJZXlDB92hn5HqtayImeD8bhUu6BJEutaLekGio
         TzHzt5HxTocikTwAfGsUrBEfs6xWIBB1CMYMmCgsMja3hGTysBv7U+d0tDcXfD+x5z3W
         OhDKtzAo7tAVC4YJ5kkusDFrm2mId+b4yAY2ctVgdcyTxGfFRZj6EtYCaCY40dQhS2lC
         cwQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ji3YLuvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f42-v6si3095227qtk.237.2018.08.20.23.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ji3YLuvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0Xd-0003pb-1a
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:53:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0XO-0003o1-UJ
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 02:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0XN-0007ST-SZ
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 02:53:10 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:35302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0XJ-0007N4-Hw; Tue, 21 Aug 2018 02:53:05 -0400
Received: by mail-ua1-x944.google.com with SMTP id q12-v6so11244899ual.2;
	Mon, 20 Aug 2018 23:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vawcQVt5dzBHPAQltnF2Jv9ey8cFY4DhFLth5lx+gJw=;
	b=ji3YLuvFYxNphbjRtjUX9bT+wgFrqJDr+fANia8aN+ic5sP9co49qqb90edJj/qVLY
	loXs/rE6BPqm+M3reLFAwXvvry1JXSMuLZf7aqMvNkCoAZJgDs4SLcud53yvogeFQQbc
	d+dhcHJi8dUZJsQVK2xnejUm9Wo8dbEnpUFx08d4dDdLmi8bFYj1gkE5/amRDu2rsYkl
	OfQtIDGW3xO/VL6vwZUL1+EMpvl1+kmOxEXEZnOcPIYxDBGPu5i5AMcQ0Gqqf6FSAMsS
	3iJ/3Ks1rUVCdSMvB7PrkQlSeT0y2TqN7TFOwf1fUqrR7LbP4+26xjqd4bSXyVNWUlTw
	dKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=vawcQVt5dzBHPAQltnF2Jv9ey8cFY4DhFLth5lx+gJw=;
	b=PnnRdDVtTFNNCHE/9aTXMh+bNgf+J8UhjS1xsRBJGQZrH6E6Rw5nqciczsCjdr4c7K
	9I6jmInrwFcmV5taVF1z368hFzZPs++OR/nNdoPko5wak/mvvo6Qap1mUxOSK8KcAal0
	2dI/FTsqrC657GgUeyiukcoeOH2Wk2TKXaToiXTa8jIf5JpDxWDRg5YV5RjmV0ApEiSk
	XpNrgKOZ8J82aeKfUJEw6fGn3rUDYMEgfSjTtqeg4UNkw/6vWqlo84cfPS917ajChgim
	SGfwjCCY5I9zvKKHzAziZKZs+6kGPPgJXpLBzQ4sQZq/qpLZpCFgRhTD/cOho5AAEbMf
	vnJQ==
X-Gm-Message-State: AOUpUlF6vgOI8lQzudPV2J67MaB/hLtJ3fL+l2oN+GGRG+DGS0ta/+EA
	iUuajLzmLAftQldm3iSodKs=
X-Received: by 2002:ab0:4666:: with SMTP id
	z38-v6mr32337444uab.159.1534834384908; 
	Mon, 20 Aug 2018 23:53:04 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	r138-v6sm3621740vke.35.2018.08.20.23.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:53:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-19-peter.maydell@linaro.org>
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
Message-ID: <5da29ed5-0003-a18f-65e0-a408b5f46b92@amsat.org>
Date: Tue, 21 Aug 2018 03:53:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH 18/22] hw/ssi/pl022: Use DeviceState::realize
 rather than SysBusDevice::init
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
X-TUID: 4+WVvHrBs1dP

On 08/20/2018 11:11 AM, Peter Maydell wrote:
> Move from the legacy SysBusDevice::init method to using
> DeviceState::realize.

It would be nice to have a wiki page where each maintainer list his
deprecated/legacy API and which current API to use instead (and why,
some examples how to use or port, pointing to git commits).

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/ssi/pl022.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
> index c9989537062..3ac57f4c96a 100644
> --- a/hw/ssi/pl022.c
> +++ b/hw/ssi/pl022.c
> @@ -270,26 +270,24 @@ static const VMStateDescription vmstate_pl022 = {
>      }
>  };
>  
> -static int pl022_init(SysBusDevice *sbd)
> +static void pl022_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev = DEVICE(sbd);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      PL022State *s = PL022(dev);
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &pl022_ops, s, "pl022", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>      s->ssi = ssi_create_bus(dev, "ssi");
> -    return 0;
>  }
>  
>  static void pl022_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> -    sdc->init = pl022_init;
>      dc->reset = pl022_reset;
>      dc->vmsd = &vmstate_pl022;
> +    dc->realize = pl022_realize;
>  }
>  
>  static const TypeInfo pl022_info = {
> 
