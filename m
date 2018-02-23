Received: by 10.28.71.27 with SMTP id u27csp842062wma;
        Fri, 23 Feb 2018 09:18:50 -0800 (PST)
X-Google-Smtp-Source: AG47ELuvsw7jsYvvfQC7Q+Pt6Qj6YNjqJBFbC84uSPLfYpE9uHWLzPs4EgpuMkeonYbWVSeeEY69
X-Received: by 2002:a25:6b0f:: with SMTP id g15-v6mr1619041ybc.222.1519406330218;
        Fri, 23 Feb 2018 09:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519406330; cv=none;
        d=google.com; s=arc-20160816;
        b=I/q9tr+dc1aDYgpkZEEFc7Rp/VpiSP/aw/fC8/5a7jKuwLXxNUev+m34f7zNf/Iztf
         4PeQa0OUivbafhx5ch/9jzLGGe/SAZ9Nz0lFU+IPJgnl67jPXuSr22DfsOfZ65cjqI63
         AuIA7vYUUg0hJZ6f3lNsYjfAWm8gXkhfbIqDLH5u4BFq5Ib+M+LOi7pvtVJUS02vFLr/
         L7O2XXye2J2ibbu+IW49fOJK/jycSJydBQ1FKmVRB911cycCgmy4jp/GPW8y+i7RRBzJ
         QUxne/Wrl066pCmwrD0Jpfw3iuAf02Ao1yhM+459H4H//PEq0sub+Dls4wCHg6HfUxAQ
         Jgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KEKDBLfxp3zMJM9R9n/dHGIIskUt8tFCKvCRW4t/9W0=;
        b=exhTcB5D5Cdc8c8iuHS66i820ChgJvXFl5Nuj+/+onZ243lg3X1tQM+4PrZ9moZ7u0
         LoEKSB7GWzx/zJghfeBjQQK+ZXEU8JF6b9NKrvOnOd7nq7IoFwzETPxaJTehPvietTol
         WkDEwGsSHOeyfn3HpEJiZ70g23e7/u0PoPBEpbYhZdO9Bu7VfRCG1ZnWKecOFHLvtfnV
         Sgjw4WoL3GFjfAUjCVu5wDi9rHQb06nYhlSSJF46rVB2Qq8H5vxjmwbtDjB7XpjTMlNJ
         p/SR64TZuWiD/OtpwJEucMvla9/RiPWs8D0KtdfkTSSg5lWeiSu3wx5tONTUK7Qc0Qo3
         vHKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MECW3e65;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7-v6si491200ybo.10.2018.02.23.09.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:18:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MECW3e65;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGzh-00051T-M4
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:18:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGzV-0004zx-5Z
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGzU-0003uj-8X
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:18:37 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:45886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGzU-0003tl-2W
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:18:36 -0500
Received: by mail-pl0-x242.google.com with SMTP id v9-v6so3241234plp.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KEKDBLfxp3zMJM9R9n/dHGIIskUt8tFCKvCRW4t/9W0=;
	b=MECW3e65eph4fILJvmPKvJq7NzrhBK69iSBH+GIO2pV1U1rpx/Q/XVC/C4zZ9k07PN
	VgXEJtc6yRkdxiTO4/FeI9G1mfJZ8BVQSjNSxH5BteKeCw42U1iGezSwLApuakzEM9Bo
	C29SMsm04+BdQ9+aCjSCfAwP7manVuZuDFkI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KEKDBLfxp3zMJM9R9n/dHGIIskUt8tFCKvCRW4t/9W0=;
	b=K3b/aHs3T8ySNl9a8OOHQdVVKlniUCFtp/bkx2AeCro4V2WHuaM4EVrBJ9E5GvqHcO
	McHWafKpqZjHZK5NmuRlp643f2e83HuQn71xNDlnnhVhGzRxx5g123KweDYPut08ElIp
	Qz8qaIwq7b7P8dlUA/RwkSq+uFBFfTQvCxnt3eC3G5QSI2D8x7PaB84lbwgggDq5tM+u
	iBC+llbMEL5/6NU5tWtcPlGa13AXAPZM1ox2XNrZ1gubooKKcHTLBayoZOQLQWuFIvQl
	vGJN6v5/QP5bTG+FlfxON6wdWQmscDrcIExt2c7n3DrnjPpQguYDDVSLddDB1yLdbcQW
	VKkA==
X-Gm-Message-State: APf1xPBP8KQ89vRBvhBHx0QF715+sVSI8lM2YS9svHy7mrRKg4T99uV4
	wPYUfORtAh/F2oGk8GHILw6ZMkdsm3xZsixf+0Lu+w==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr2398369plb.329.1519406315029; 
	Fri, 23 Feb 2018 09:18:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 09:18:14 -0800 (PST)
In-Reply-To: <20180217182323.25885-43-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 17:18:14 +0000
Message-ID: <CAFEAcA-pu6a=WPoRYATp=W8afMjB4TtYpmLr0x_zuuS7_cH25w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [PATCH v2 42/67] target/arm: Implement SVE Integer
 Wide Immediate - Unpredicated Group
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
X-TUID: V2FDHI4Cxf8i

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  25 +++++++++
>  target/arm/sve_helper.c    |  41 ++++++++++++++
>  target/arm/translate-sve.c | 135 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  26 +++++++++
>  4 files changed, 227 insertions(+)


>
> +# SVE integer add/subtract immediate (unpredicated)
> +ADD_zzi                00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
> +SUB_zzi                00100101 .. 100 001 11 . ........ .....         @rdn_sh_i8u
> +SUBR_zzi       00100101 .. 100 011 11 . ........ .....         @rdn_sh_i8u
> +SQADD_zzi      00100101 .. 100 100 11 . ........ .....         @rdn_sh_i8u
> +UQADD_zzi      00100101 .. 100 101 11 . ........ .....         @rdn_sh_i8u
> +SQSUB_zzi      00100101 .. 100 110 11 . ........ .....         @rdn_sh_i8u
> +UQSUB_zzi      00100101 .. 100 111 11 . ........ .....         @rdn_sh_i8u
> +
> +# SVE integer min/max immediate (unpredicated)
> +SMAX_zzi       00100101 .. 101 000 110 ........ .....          @rdn_i8s
> +UMAX_zzi       00100101 .. 101 001 110 ........ .....          @rdn_i8u
> +SMIN_zzi       00100101 .. 101 010 110 ........ .....          @rdn_i8s
> +UMIN_zzi       00100101 .. 101 011 110 ........ .....          @rdn_i8u
> +
> +# SVE integer multiply immediate (unpredicated)
> +MUL_zzi                00100101 .. 110 000 110 ........ .....          @rdn_i8s

ADD, SUB, MUL out of line with the others.

> +
>  ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
>
>  # SVE load predicate register

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
