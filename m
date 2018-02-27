Received: by 10.28.71.27 with SMTP id u27csp4944743wma;
        Tue, 27 Feb 2018 07:27:07 -0800 (PST)
X-Google-Smtp-Source: AG47ELvRK98uGSG0hqOH3qEYySZqCZd6fEtvW5EAtxP/rHwLwx+dWp9+gir5z4Di04/xiUk+uLBd
X-Received: by 2002:a25:28c4:: with SMTP id o187-v6mr7321954ybo.452.1519745226905;
        Tue, 27 Feb 2018 07:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745226; cv=none;
        d=google.com; s=arc-20160816;
        b=tIZFfGICzf3zQ0mRl0obFhQ9VoM6vpiCIgMFYQucBdI1LveRP1428iHJ3OgnL1kz0O
         CVkRkIwAvvKuFFqFELV8yb5KVIn2BSFJgVWTP7vyW1epfDv6hpTr/L0D/yowvYJmOMfu
         EZvLOsNUYdSfZRFeK8i71kYVQx4NC8PgzIgS9AAKTk9Y5SiRSjtUl+ZhhK9dA+HPAww8
         A9XCY0+IKUiQKGlWqnl4xnoYZe7dGnVAHHV2QjODK/wafpi1p5SRdGwl75UhRKkF4shu
         9y1Pe1RBQUOk/BRgDtV4XVHWG3gG968Q5wPavz9AI5s7ekdXQZFu9ZXloYbh79XOndlg
         GQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sqFSycOZ6TfFVN4Wyqm33odjZ0vMqAf2iaeC/Nono/Y=;
        b=m6VXRSQBracpIeGdBuF4Q8gu5x4fd+/lK0cdnsuB0O8l/Ewoo8OPqLJUSAdUuRYVLT
         c5LfS0Enl4HGvNH4n5DvuNJegtVxaUnRcUh5NiptVaN+snyKa0KJIPMmZ+OdViSyVW1L
         2i9L0SkSi3K3tqYtk5bzG6XtM5hO6mnyizSdZHnoGE4nSxd9QXKZwTe2jMXudpVCbOj4
         i2DwS2dU8hJ1TFdub++GOmxmzsjaZsHxz4MKZiuAS05xSIDMYrR7Uyub1HSMMcCxjULF
         yaKsq7rsP/18Pf+h6lpalj3/Plilqc4mTysRyLKjwQeNha4EQ+p+L0CKxu5sUvD2VwxG
         f/nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CR/+o+rB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10si1916688ywi.479.2018.02.27.07.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:27:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CR/+o+rB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqh9m-0003qt-9F
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:27:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqh1R-0004FT-SX
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:18:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqh1Q-00071v-LZ
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:18:29 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:45336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqh1Q-00071g-GR
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:18:28 -0500
Received: by mail-ot0-x244.google.com with SMTP id f11so4058680otj.12
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 07:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sqFSycOZ6TfFVN4Wyqm33odjZ0vMqAf2iaeC/Nono/Y=;
	b=CR/+o+rB6socV0oMy7BA0m1KOsi3WcSHwPZCK24a0WmZxIV68cqAdfwj/KWvZ5pJSj
	V3w+G92RwMjpJfsYMmfedwBoOiwOD9YptdV2IC/1GZFwMLP9aquhpdi7zTiXMOrcwCc/
	qzLNS1hyB2nbdF31JsBuo7LLnkb70YQ1TeE7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sqFSycOZ6TfFVN4Wyqm33odjZ0vMqAf2iaeC/Nono/Y=;
	b=V0AHQ5aN/Fm4JTXGqozhGt56TH9FIwv/lTEjAaSXSbfHCGuCxDy+dTpQ7HGjXmIUSg
	i3FM9qKyg8z7sIuqLj8X7patBi4q24ZDPldRHxlbg5p2zUHOj1w6jbbaCGZTXAxxDsWR
	Ma/tSlY6TEPj+j/vsSZhxopxzGKZ9codP4lo1EfK5+Llq1Jx8unXAaztogqKbTuEe+Dh
	2Kj7NaKp0zEcJeQImLvoJvU9888MVWvU0Ssvw/t2zOx1Y5KsJMsVJpssQr5oNC8Lnv8b
	7ggpugjKzQSZOuxVRHEwfCWWdqSu7APGSSnpfjdlDrIhmTzciKuhS0xGn3DYEkQ2e7+U
	MSUQ==
X-Gm-Message-State: APf1xPAv2pzOeOAGCo8kP1IBDhVKdozBXb78KpgDtWFn6VK4Q9+6ufKF
	kruOQxEFKJ8Drrp+AaQ0iUDu+I5lmDfhsx/GJmjdMg==
X-Received: by 10.157.46.143 with SMTP id w15mr10101594ota.205.1519744707897; 
	Tue, 27 Feb 2018 07:18:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:18:07 -0800 (PST)
In-Reply-To: <20180217182323.25885-60-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:18:07 +0000
Message-ID: <CAFEAcA_q6Ca5JT-850hR43sSmPinvvb6W_s0y8mVyjyaHGeFdQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 59/67] target/arm: Implement
 SVE Floating Point Multiply Indexed Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UKWent/F19+G

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        | 14 ++++++++++
>  target/arm/translate-sve.c | 44 +++++++++++++++++++++++++++++++
>  target/arm/vec_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 19 ++++++++++++++
>  4 files changed, 141 insertions(+)

> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index ad5c29cdd5..e711a3217d 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -24,6 +24,22 @@
>  #include "fpu/softfloat.h"
>
>
> +/* Note that vector data is stored in host-endian 64-bit chunks,
> +   so addressing units smaller than that needs a host-endian fixup.  */
> +#ifdef HOST_WORDS_BIGENDIAN
> +#define H1(x)   ((x) ^ 7)
> +#define H1_2(x) ((x) ^ 6)
> +#define H1_4(x) ((x) ^ 4)
> +#define H2(x)   ((x) ^ 3)
> +#define H4(x)   ((x) ^ 1)
> +#else
> +#define H1(x)   (x)
> +#define H1_2(x) (x)
> +#define H1_4(x) (x)
> +#define H2(x)   (x)
> +#define H4(x)   (x)
> +#endif
> +

I wasn't expecting to see these macros here. Don't we have them already?

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
