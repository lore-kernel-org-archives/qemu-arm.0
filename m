Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp762048wru;
        Wed, 15 Aug 2018 07:40:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPy99zAeHtVujGj4h4l109dojJ834DgMW34Y8ik0oNTEF3ZS3LCr43xFDtA7KkQjfMRIBSUi
X-Received: by 2002:a0c:f685:: with SMTP id p5-v6mr23148614qvn.22.1534344023284;
        Wed, 15 Aug 2018 07:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534344023; cv=none;
        d=google.com; s=arc-20160816;
        b=s4TDKugQA6CoehKWowSHcQuGt7eY8l77VY6v9thfd96dt64rmR9xyMHXRxz9WEtSaD
         aSlqfTVt2YkXHiINLXe7TzDfzlvyluOWXoO0xG0RBVOHYcInsU8FBaiQLj3KX07dcZ9L
         v4CP4YoqEVhmRBHTx3EYTHc/h/igHfvbZVDCYg40wyR2o1YGTqEpJAsELtsXpoXfDHet
         ylWNAlbbBaf1cUuWmg8qxswDKeGJ9DOY4wIiqSPYVgMw09mgHCJFOGY5n8kg+ktoasuL
         QVytBYIJG7DqfOpqH5W22yfU+/fQeQLSzPatYP446M0YC/wfWrgttbY95t5paoy4Z3MJ
         +tTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=88ZLivXZZ8+YWgM+QtG4kJfo95G2GGKY8MxGJUw9Np4=;
        b=M1ccPPz/wFDbQNLAHelFfuXnl77FQWTKMd5nsvxCdM6si5wX9JSGRwkiuqHOGH2rBV
         OJZm0AHN8siR7q2mWbqPXSP/RsCjq3/ln6oqjJYyOkLNmePAUZusfPY8IdETUG8kTOHU
         AGnY+1RIx5mHnapb0RmNMJKICtW1WOzo8TtdIFWLU91nDRSOVblJuFTra9omzfsEjJiH
         Z/9FyTW2vS6luPHjMCsylyb2Wj+YG3pqAhx58A1RJtq1M3fakIYq/1UopoLc+QL6Bgze
         B+lwkfTyNoF2z6iFYuK+IM0gNEMQSBr7jppSE0Q6YkGXP2iZ6vgjbWOUCbYvjVOGI6Cy
         meag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufvud5hv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n200-v6si1455986qke.247.2018.08.15.07.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 07:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufvud5hv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpwyE-0007vv-NX
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 10:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpwy2-0007nZ-PH
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 10:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpwxr-0001ob-ME
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 10:40:10 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:36754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpwxX-0001VG-PJ; Wed, 15 Aug 2018 10:39:39 -0400
Received: by mail-ua1-x941.google.com with SMTP id c12-v6so1464425uan.3;
	Wed, 15 Aug 2018 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=88ZLivXZZ8+YWgM+QtG4kJfo95G2GGKY8MxGJUw9Np4=;
	b=ufvud5hvunErfLbK70Rtzez73KKyzdoZ6Ghfn7FQOctxeLGBbYugqjQcuAXzh+eWCf
	N+Nnx8PBzy6GBHYfDHl7kgIReDx02aUqVihbNUMADld2IVbVUnJHmC+LxKnhPg1+ZzQQ
	1wL9ZHOgRWFw4f8r5JqnlVcSdi80y/V79irQOND7fqG2X5A/l2kJmv8nQtFmIoAs6F4h
	rqtiw8uu4uxCUHS9d1s7QIWFuuAoAy1XgvZc6NCTqikcS4VRlY/gU9Xnuqe1yHnaEofS
	nhR0FFPetmFZhZdUib0KcT4QTuXAgiRFs4rhfHm+Lbbq3wu6Y++Jn1au4JSkmpK2P79w
	jOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=88ZLivXZZ8+YWgM+QtG4kJfo95G2GGKY8MxGJUw9Np4=;
	b=kHYtp3kWgua5Oxgca+6i9zK9ep8Xqep81EsZk+rdJXsO9TmcxdWGESGFH1oy5IsySH
	W9z2KSysdnw2J7k8UIXXicFJG/iA4jzyi5pB6UcuAfyuSCG8o2IgJYro1R6R2PVD/Q4B
	S/Ke2rDEYcfI/5BH6NfrCC+eIvjSavYqkU91A2WVFGfxPwH5dh2J9qY750ByqPqUWVXN
	MDPkA+Q4cghGN+3LiGMbbRq8LjeyfKliRL3jBeqXS3X4RHKJZLls9NI3RZom8x9Aazr9
	LcI0G4IAfVgyEhAjfl5x/snlxNMshXyCLxIwnrx1K7Nh/tBvLE7mWzNgNluYE5buwDr4
	LHfA==
X-Gm-Message-State: AOUpUlF1whnES0LFTI9Vj/39l7fuKl/OtdZ0EEow0SBqrx3XgM34k6M8
	fCrBsENfqtXIG63pJV7kC3g=
X-Received: by 2002:a1f:8355:: with SMTP id
	f82-v6mr16781092vkd.3.1534343979272; 
	Wed, 15 Aug 2018 07:39:39 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	28-v6sm8323570vkd.37.2018.08.15.07.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 07:39:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-15-peter.maydell@linaro.org>
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
Message-ID: <56981299-9424-66b1-9e3b-26bf35f58a82@amsat.org>
Date: Wed, 15 Aug 2018 11:39:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-arm] [PATCH 14/16] hw/dma/pl080: Correct bug in register
 address decode logic
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
X-TUID: p2BwikoH7Sff

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> A bug in the handling of the register address decode logic
> for the PL08x meant that we were incorrectly treating
> accesses to the DMA channel registers (DMACCxSrcAddr,
> DMACCxDestaddr, DMACCxLLI, DMACCxControl, DMACCxConfiguration)
> as bad offsets. Fix this long-standing bug.

Since this file's origin (cdbdb648b7c).

> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1637974
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This has been around for a long time, identified by code
> inspection several years ago in the LP bug. Now I have
> some guest code that actually tries to use the PL08x I
> can test the fix...
> ---
>  hw/dma/pl080.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index a7aacad74f0..8f92550392b 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -229,7 +229,7 @@ static uint64_t pl080_read(void *opaque, hwaddr offset,
>          i = (offset & 0xe0) >> 5;
>          if (i >= s->nchannels)
>              goto bad_offset;
> -        switch (offset >> 2) {
> +        switch ((offset >> 2) & 7) {

So only the first channel ever worked...

>          case 0: /* SrcAddr */
>              return s->chan[i].src;
>          case 1: /* DestAddr */
> @@ -290,7 +290,7 @@ static void pl080_write(void *opaque, hwaddr offset,
>          i = (offset & 0xe0) >> 5;
>          if (i >= s->nchannels)
>              goto bad_offset;
> -        switch (offset >> 2) {
> +        switch ((offset >> 2) & 7) {
>          case 0: /* SrcAddr */
>              s->chan[i].src = value;
>              break;
> @@ -308,6 +308,7 @@ static void pl080_write(void *opaque, hwaddr offset,
>              pl080_run(s);
>              break;
>          }
> +        return;
>      }
>      switch (offset >> 2) {

Eventually copy/pasted from here.

>      case 2: /* IntTCClear */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
