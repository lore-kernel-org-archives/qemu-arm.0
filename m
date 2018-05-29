Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3518960wre;
        Tue, 29 May 2018 05:38:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLvF27jhXu3nKZX8KEbZB5PnMux5k6ap9dYGD2V9gVAgD42u3GA3N9/MM6zRGniIb/Kkxj5
X-Received: by 2002:a37:6c02:: with SMTP id h2-v6mr14084406qkc.145.1527597513481;
        Tue, 29 May 2018 05:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527597513; cv=none;
        d=google.com; s=arc-20160816;
        b=Y32K6EyZAtao8Y8fXF1TqNlDJZD5AsKq0TEVM6U1erGyPI0N49g5nFNIFGhyqFJHt+
         OvHfqZUdLqf62N5eCqlDLn8X6quF1ihNy5D8tHAM2dABKQ7tImFkrJ6Fb3GN49qVnzoH
         Koa2PFhAuz+zmi3w4qIdiUI5eCBDkbtq7P/8AK4rhoZZGLbhpDcraXvJslKfUUNyQEY9
         zwfsVPYmoB/6+i3YHQP4dPA3Q2jUuqh9lwpYJFIKoXUB/q+aR7gsmdH1mW66TSLTK5dQ
         MkmPGDL10YdiwPKGcnAPZsJ6iKjsqcxPuNvY4CBQp6hs48k31qJiy2l8Vo8ETe4/yU0X
         6DKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZgZiY70xDQCo9LoGtDHqHo4iP1uIwVwgdQsQz518JP8=;
        b=BeO0qP1rIS5okxmzkc+fmItIdQk5bEAKfqjYHxZU10/Ms/jxuHpQI6WDSMka+bveg0
         EvAaxaJroacJ5wjCSf4x4Mmd5Lr8SdJwu8oTZCrPFIu2t1nkcb9MDf0DtoHRBz+JlqRx
         f2Maq2i8OgSj5aopWlhC2cuvApFqLa+e3XjZD3ccuoBva1+spQRxfdy4FL2yQPJ+ymmy
         bqW2NLtyzBQdHHDhP/Y0eYEMVJ4llt8tiLIUYh5yOvr8/xLMJMYmBKTT3rnKGliJbHeK
         cZNgLRS/4LOFVjf7OenxGLvR+PsFR4VRjhZaBaJ3JRjH4t6i16t5QWoA95eQun13n7+l
         gbzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lb5NAMLi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v18-v6si43386qta.163.2018.05.29.05.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 05:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lb5NAMLi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNdtZ-0008KH-1v
	for alex.bennee@linaro.org; Tue, 29 May 2018 08:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdqG-0006Bw-7p
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdqD-0007jR-5c
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:35:08 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdqD-0007jB-1G; Tue, 29 May 2018 08:35:05 -0400
Received: by mail-qt0-x244.google.com with SMTP id x34-v6so5036335qtk.5;
	Tue, 29 May 2018 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZgZiY70xDQCo9LoGtDHqHo4iP1uIwVwgdQsQz518JP8=;
	b=Lb5NAMLiqll1BAlVqZPpwI/BcDDsA71gj7pyhynouzPjQbYVnHeoroIaLc1zcshwyM
	reuggvuCaq9P3JTFj2aLG8UHbgshKlzmLqLL1qLvsDgN6yT1C91XqI1Jf7xUomvONXDG
	/qCzZUN//rRcrhvUwXFaFhpfXqtmbAcHoRBEeB9ehz9TGTClheThvheAKOo2bkDF4Zeg
	arSGS79LXp9knjrjjiYm4U8Ndp8P2OFQp8J7X/FDlhxAerAf/mjIY4dEV9Jx8n1i30M0
	jK4Mvj+Sk/aZ+F3qLpQJHhNww5MvLd1jZlYl/caBevqErXIUzSDXT0AmKM9nt2T+QeQD
	xOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZgZiY70xDQCo9LoGtDHqHo4iP1uIwVwgdQsQz518JP8=;
	b=tFgoZNLmM15H0JPnadaCv0VpVF/ONubq+wzfVyTjYPRGFgSXQQVKAy5HIa984iyy07
	DTUiWCjWzbRKNg0b/3BO6w8UC1mi30uvdM0kffa04SkD2gcBUT8fD92qU1Czl/VwXsTa
	ShKcKNU0aO6HLUF4uCd0h4o5BttLf1TFfZXzC5yBO5MoGnlzJgM+xLSJv19/MExqj8oU
	Hnrf3by1Y4YCsFVMtSm+wSv7Vc2ULvybt3qn0GK6V1QjS0i2wi7bwF7Jw2JYVIjotmO3
	yWwM87lkzNBIHRBslAvuiDUrPuKH7eia0+DR2j8tmfEXOn59td2KZPQXQ3oDAe5yoH9l
	UTnw==
X-Gm-Message-State: ALKqPwe2X219xBnjS0TiwSNxkXNYdpDIayWR1yDziTB8PX9tkhNb4xE2
	dOHWQTh+5IxYMijpOpySCe7WhUkaAjA=
X-Received: by 2002:aed:24aa:: with SMTP id
	t39-v6mr6021816qtc.253.1527597304356; 
	Tue, 29 May 2018 05:35:04 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	s15-v6sm8760497qtc.81.2018.05.29.05.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 05:35:03 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <92180a68-8fb9-dde1-cbce-5ef30eec27b6@amsat.org>
Date: Tue, 29 May 2018 09:34:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH 3/6] net/ftgmac100: fix multicast hash
 routine
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
X-TUID: aWAz/X2FAe/U

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> Based on the multicast hash calculation of the FTGMAC100 Linux driver.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/net/ftgmac100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 50af1222464a..fd7699b1c05e 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -778,8 +778,8 @@ static int ftgmac100_filter(FTGMAC100State *s, const uint8_t *buf, size_t len)
>                  return 0;
>              }
>  
> -            /* TODO: this does not seem to work for ftgmac100 */
> -            mcast_idx = net_crc32(buf, ETH_ALEN) >> 26;
> +            mcast_idx = net_crc32_le(buf, ETH_ALEN);
> +            mcast_idx = (~(mcast_idx >> 2)) & 0x3f;
>              if (!(s->math[mcast_idx / 32] & (1 << (mcast_idx % 32)))) {
>                  return 0;
>              }
> 
