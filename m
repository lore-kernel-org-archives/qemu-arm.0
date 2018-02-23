Received: by 10.28.71.27 with SMTP id u27csp777315wma;
        Fri, 23 Feb 2018 08:18:04 -0800 (PST)
X-Google-Smtp-Source: AH8x227SULBq5W52L0/jma6E7SYA196+9DFQKi76D9GLqGWvDabLuPFMIqFERizjL5RphhIr953Y
X-Received: by 10.13.231.132 with SMTP id q126mr1474038ywe.388.1519402684568;
        Fri, 23 Feb 2018 08:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519402684; cv=none;
        d=google.com; s=arc-20160816;
        b=YTbHmYrs4Nep70aWsTldBAXQOQE+HYnX8xTYmS3X3JFOY4r5B8HnR2CUjHS14XA6sO
         8zNMhBO2Jv4VwsZA5iyr5DUDqV9t/9jjcHe2VJpExSQRJBkRcdMtct8kxYYoDBDiDc5d
         zRbDiyswzUUHO1VGxUQQU3qQEZB2KyBn8unthR/ExbVNxnblSard5nx+adlaShWtQfPF
         6gONZOojNF/JuAp0mLJ6Vo0mee9yTspaL5zb73wGBrsZNSv9QhAl0wRmeh6vm+7Xyayw
         JczwF+x7UtgT9vDxxThUMeEQprVffErebtRx6+zpIbsKzB1HnYvMgchl09qtZsg9Budn
         Ysbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ovy6WQ/jTzR08FzzAS0cZ1c3ThCc6iwXhgS/H8fS/EU=;
        b=q0+ZwoGsDdLmQmoxImwbWH6qdAY4P2EDgoCCLhMrZu/2FucIUudizcNL4Ka7uM4/eK
         4T0cu7nwYZa3J6aDqVenHXEfUz0E+rNojZUmiyhvEZkTWvFTIJAg4h/EEafsp9jd8IcN
         1TQgosJOW1uqwg90eXg7Q21Dnd1fo935qrJ7HKmAQQjulEMqdX6qlW7NTzuWiw1iuCCs
         We+YqqmswbbPlb47A3qrNf97ndf/Q/LS9/AkxpF5bfWivSslTLuwZihQaLD2K36VmhFk
         k+pddStbufyso6yHq855Ch2iIznzJ8Mpz2MM3B9Mxo1zTzW/2m2VRRRDSQti49/FgV20
         Gg9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cPQCozOo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e18-v6si459164ybn.370.2018.02.23.08.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cPQCozOo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epG2t-0006pD-U5
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:18:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFcI-0007av-08
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:50:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFcH-0004NM-63
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:50:34 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:42943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epFcH-0004MD-1P
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:50:33 -0500
Received: by mail-pg0-x241.google.com with SMTP id y8so3496408pgr.9
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ovy6WQ/jTzR08FzzAS0cZ1c3ThCc6iwXhgS/H8fS/EU=;
	b=cPQCozOoOeEqqFIBKgurQrlHIQ/CzW5yKmHqoJ+VHY8nz1KoHKLvJnVJQmt665bbSA
	ZPN5T1x0ZQi8bp5lUAH5AAeWdSikODnCGLwtt5rTWfHlo3gAkuxaoyLMhQw1eQp0yFIH
	dK43HXyh4Qgz1aJSsqbLoeE2K10nU24NggV4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ovy6WQ/jTzR08FzzAS0cZ1c3ThCc6iwXhgS/H8fS/EU=;
	b=QSUodmky6hYVX2gmiBsUDNN5B3xJW+7T3VJ3MQkQyd+g1s/oxOFMc07YcjSFM+95Gz
	3wJ5XniwzojGde6OPPoYO+RPRwyTp3c9grEgWlxWlP5u9dKpZiylGCWWBDwTq7fD6n6E
	C39j2u2Q3HYBpgIIwMnQQJUj/IAAu2jEMKv+6E2iPZw5ejXMEJ4tdsBhT8MMd8eE7KbQ
	wfysOTQpYfvgV89BCVqipAbw9U+jrnwAla4htE6U4IKbeKpN7gQPwxJNTIrZfW12KCYC
	ZeLPoJbb3peXYlkyaxnrQSvrj9R8PwD20Ohfn50TGvs7ryKv4XqnsGc7IzM1F7WxwGWh
	cyhg==
X-Gm-Message-State: APf1xPASWcMWJvs/v9Wyuq7nvXrylhoLSmpsXPbD6pYeajI4tS18dkW/
	5zYTJ7j6gx8dW/daXeGhObWShcZoYw0Rs8UtycU0dg==
X-Received: by 10.99.175.8 with SMTP id w8mr1308392pge.390.1519401031937; Fri,
	23 Feb 2018 07:50:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 07:50:11 -0800 (PST)
In-Reply-To: <20180217182323.25885-34-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 15:50:11 +0000
Message-ID: <CAFEAcA_RcXrciEx5BG=XoW=ygCQJ-QOVFJ8fNEW=BNCX3PFENQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [PATCH v2 33/67] target/arm: Implement SVE reverse
 within elements
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SyoDom3bgyu6

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 ++++++++++++++
>  target/arm/sve_helper.c    | 41 ++++++++++++++++++++++++++++++++++-------
>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  7 +++++++
>  4 files changed, 93 insertions(+), 7 deletions(-)

> +/* Swap 16-bit words within a 32-bit word.  */
> +static inline uint32_t hswap32(uint32_t h)
> +{
> +    return rol32(h, 16);
> +}
> +
> +/* Swap 16-bit words within a 64-bit word.  */
> +static inline uint64_t hswap64(uint64_t h)
> +{
> +    uint64_t m = 0x0000ffff0000ffffull;
> +    h = rol64(h, 32);
> +    return ((h & m) << 16) | ((h >> 16) & m);
> +}
> +
> +/* Swap 32-bit words within a 64-bit word.  */
> +static inline uint64_t wswap64(uint64_t h)
> +{
> +    return rol64(h, 32);
> +}
> +

Were there cases in earlier patches that could have used these? I forget.
I guess they're not useful enough to be worth putting in bswap.h.

> @@ -1577,13 +1611,6 @@ void HELPER(sve_rev_b)(void *vd, void *vn, uint32_t desc)
>      }
>  }
>
> -static inline uint64_t hswap64(uint64_t h)
> -{
> -    uint64_t m = 0x0000ffff0000ffffull;
> -    h = rol64(h, 32);
> -    return ((h & m) << 16) | ((h >> 16) & m);
> -}
> -

Better to put the function in the right place to start with.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
