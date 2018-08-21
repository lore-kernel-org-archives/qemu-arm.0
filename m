Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1565739wrd;
        Mon, 20 Aug 2018 23:52:30 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyqN0nx0JMdUQUFW18zHQ20saiFdHq/DtTN8iA98jCUtGCgp/LNO0jDrZEuvyco+ivH/TDj
X-Received: by 2002:a37:9242:: with SMTP id u63-v6mr42644812qkd.189.1534834350171;
        Mon, 20 Aug 2018 23:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534834350; cv=none;
        d=google.com; s=arc-20160816;
        b=Gbi3Rqqj6sq8VPrNGCQ6vBaLY+HM21sfVnDNexNmRDcyMtB3l59gRK66zrgh85w638
         2pnsSLXTj5W+PEXEnt2pA2moTYetNLg6Rd3s7xQmVAcHu849Jh7Tr1rLlmH91lH+jsEH
         5mKROb27sexqF2b289coKjEerpA/UfmXdhfZ3QUBzItPY+XcASdHrAj/NbBAfQbJPisM
         K+vp+nGIXbt9UWuHD0Dh6OeB+1HCoPbix73SGkpUuU125YKb7q9e87JxdaiatU1BQVRz
         i28GQMbNzkQqu6BImby62ZRDrx7bQX912ZS3uWUrNak8ERDEa1GyJrxlxy5zzwLRalIc
         R00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=JAld94ATAvl58OG9XbL37vK9HM0nh8lqaMJwzTJhTyc=;
        b=RaZ3tzGXeIZVwdBGGSR/rrH+kGRCJX9SZRCYphJ3Wj283hAsAF8wS+QjAFPAN+67HU
         ZbzmDBsYR3sHQhSDjZ8VgJlqinn4Av9lToXsBYUH7+9KbykW0cIvgkIIkQGf9qlS+6kN
         wAg5oGWQCH8QeKyuTfvv/rpab0SGFbXvGAcCIoEj+PNk5IG/nEijFVTGAVPjWjD7txce
         cHg8lXEwK/aUW0cmzC0kcFQze8Uvsz7e3csXBCq5VouRVtqqZqO2ifLORVTg/Y1mrFzs
         mr59dld0M1yImPYYn75ABVuELXDNPuzylcefbxTncr3zMMXgNf4zhiWLJ0NwUmSIBkj7
         nplA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CpNuPuiv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e125-v6si7876736qkd.394.2018.08.20.23.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CpNuPuiv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0Wj-0003C4-O2
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:52:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0UA-0000z7-EV
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:49:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0U6-0005Pm-El
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:49:50 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0U6-0005P3-A5; Tue, 21 Aug 2018 02:49:46 -0400
Received: by mail-vk0-x233.google.com with SMTP id l143-v6so7720001vke.1;
	Mon, 20 Aug 2018 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JAld94ATAvl58OG9XbL37vK9HM0nh8lqaMJwzTJhTyc=;
	b=CpNuPuiv98zxxNP1yFZjbz4SwrXdc9NathlkM4WOPo7AUHp70nLChQ2ep5RXBikFS7
	IXawofqajyZQur4skgxJZLThmuNvVnlQd8t9I8T0k5Rhdo+N2xQOxKYL/o9VTeXdBN5n
	upO5VLpaxOliOYrIH0oA7FT3b5ZNS9EcUNSFS8lEbCEDPoW1M4tX9O3br2VzJsBcN634
	FeRso4ZAz8BXks84WfyCgBDTlDiCjDvkpwBC5vY0NLg50dyoQKAsHgRwbzp27IWe1GK0
	4BqcEoCgq4RLh2s5X0rgcR+JEhgkhPLJyoIBNyEOA/Rwwhwg9i6waFa7/pjU2H+hQgxS
	b9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JAld94ATAvl58OG9XbL37vK9HM0nh8lqaMJwzTJhTyc=;
	b=mEVDVOioYLe3T6RYhWlfkW0bAa+rXD+wYmSyX0T6oaDpCFasRDo7hWBIEk27f3ZKak
	iPpm5ZKVidmL6v+EJrFfYQq4iBWLKVi2OGhqfPAcRKPljN6D1Yh0JdNemogc7PhLCy0c
	4+1RoJ/IYSdRUX4rIlC9pyrZKPiT+541gWH/D36pAEKLhZVw4R/c3Sca3OP3WYOBbKid
	Jb/a5PmAqP9qjiwFU7g/UaLq5OVJOJvcaULeWHKNLqfwuAt7fksRCpmNYB6lCboft1Rl
	TwYOPhYQE+D3QFaVvqJ+7kEMRQkrINYsjnSvYfUeAlD5NUOFH9XF/vD7viM1tgI4B7Qi
	qZjQ==
X-Gm-Message-State: AOUpUlFTMVAvxLJlOntMZwgmaGUAP83vLGpjTiIi3Ct376OHRjA6tIR3
	2/YcbCVVQi3hb6cCQMpl/fo=
X-Received: by 2002:a1f:1e42:: with SMTP id
	e63-v6mr21086141vke.52.1534834185483; 
	Mon, 20 Aug 2018 23:49:45 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x187-v6sm1852161vke.32.2018.08.20.23.49.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:49:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-17-peter.maydell@linaro.org>
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
Message-ID: <fe7840db-f7ec-f804-5398-bc32018f08a7@amsat.org>
Date: Tue, 21 Aug 2018 03:49:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-devel] [PATCH 16/22] hw/ssi/pl022: Set up reset function
 in class init
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gEbRxLBb3T91

On 08/20/2018 11:11 AM, Peter Maydell wrote:
> Currently the PL022 calls pl022_reset() from its class init
> function. Make it register a DeviceState reset method instead,
> so that we reset the device on system reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/ssi/pl022.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
> index 379d3093987..0b5f90b857f 100644
> --- a/hw/ssi/pl022.c
> +++ b/hw/ssi/pl022.c
> @@ -203,8 +203,10 @@ static void pl022_write(void *opaque, hwaddr offset,
>      }
>  }
>  
> -static void pl022_reset(PL022State *s)
> +static void pl022_reset(DeviceState *dev)
>  {
> +    PL022State *s = PL022(dev);
> +
>      s->rx_fifo_len = 0;
>      s->tx_fifo_len = 0;
>      s->im = 0;
> @@ -277,7 +279,6 @@ static int pl022_init(SysBusDevice *sbd)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>      s->ssi = ssi_create_bus(dev, "ssi");
> -    pl022_reset(s);
>      vmstate_register(dev, -1, &vmstate_pl022, s);
>      return 0;
>  }
> @@ -285,8 +286,10 @@ static int pl022_init(SysBusDevice *sbd)
>  static void pl022_class_init(ObjectClass *klass, void *data)
>  {
>      SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      sdc->init = pl022_init;
> +    dc->reset = pl022_reset;
>  }
>  
>  static const TypeInfo pl022_info = {
> 
