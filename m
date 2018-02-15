Received: by 10.28.71.27 with SMTP id u27csp2572560wma;
        Thu, 15 Feb 2018 05:23:01 -0800 (PST)
X-Google-Smtp-Source: AH8x227HA9qJUKwSH6trFtVWEqNIfeE+7n3Mt0yHDmJP2ziYS0DcV8x+WZ5OjFjq5AC/eCqo/uNe
X-Received: by 10.129.11.8 with SMTP id 8mr1892659ywl.156.1518700980954;
        Thu, 15 Feb 2018 05:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518700980; cv=none;
        d=google.com; s=arc-20160816;
        b=JaokYwAJPdXan2Ww0o/3nZ88GmO65zHDCC4IsebEICFA3VCBjFCdOOGuS43k1aztrX
         BA07i2K3TANDt3NaMKwJ7vSKHaAO5eoLdSYwp62id7OuAlfspbQ2zPj3i+Ukx+pnxsF3
         whSa9T5FlatNvmfEWVcClK/Hv7eLb8fIgELAJm8yrUV2l0O3cIzJT0gcr8DWNbNp2rto
         jy1k+UdBiZz0k7qXrUbOdmLrNTW//pxMuvuiyk6ybplLQp+GxkQrYABBhy4mXjKV27yj
         EDklWWLw/4SHTdMmt/LU1F92iCiuKxM92QuAn3VcBUDyz4jH7c8cmoQ0FNZhe59t0XlO
         SNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7O9scnH4y3jDydxDPjBHSLRYFglhsYUbTuXZkGxPDaE=;
        b=MM/1SdFwGHimdaLARd71xfI9FgiRz2NKSHWm+pNgfGTQ99hCQAaYFUlD0G4ZOfQ30t
         wJM31v5yzYpx3/i6mYU6IkgcLS/Ix2iCdJtJFTwn3G2Q5Ye3Uwepl16VJwqywoWik9vE
         davTwfnWfvibouVOl+iQfaZSfyVcou00q2++MEm39JYzfC89jHjA4tCsuEsghqqii+kb
         1auO6piXkW9dnybtWfXEtMUomUqxgONBGWRl7WstJpi/wZJFFPWq36UhGt3kWhJNqbih
         c2l2LmDyEAZ067woxtxsxwBXy7HOMQZMhQs2vUZf4F8c5RVlqmMtZvA47GYzamTNZISV
         6dgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNM57KxS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r12si2667539ywc.14.2018.02.15.05.23.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 05:23:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNM57KxS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emJV6-0002dS-Ei
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 08:23:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emJT9-0001Xs-H6
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emJT8-0004T4-H2
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:20:59 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1emJT8-0004SZ-CD
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:20:58 -0500
Received: by mail-ot0-x243.google.com with SMTP id q12so23333333otg.10
	for <qemu-devel@nongnu.org>; Thu, 15 Feb 2018 05:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7O9scnH4y3jDydxDPjBHSLRYFglhsYUbTuXZkGxPDaE=;
	b=aNM57KxSouT11A0PYU6/5byr5YlNkOvJ7D7AJEywnAyCKgtqaYYp/Iwu8KOa2m4Vvg
	G1BRJMTmbELF0WAY8NwaJF8rmujWTn4TsMdl4pSfDmwqOw8lPghdGtUWQocXbPUt4AoG
	cz2I03pYFa/6RM7E/ZTtv99SmDWw+bBAcuiYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7O9scnH4y3jDydxDPjBHSLRYFglhsYUbTuXZkGxPDaE=;
	b=WABFkkwKJmVgzJFL6/eMuLyMvZu8n7qfQEZDS6VKkT1vbZPGlG6CDE9v7E47tNx0Gg
	rk/HWtKu81Pq/w8JbvQZXAHHP9q/YX7lnlEYjkaVZuApyzb3Z9rVIV54+NhXgPUvQTBG
	0Uly1oh13eYRZKqFuznIMhENHMx4QwIlsKXznxv82j12huc8EqRlf+W3Vj6K9x5N1vaV
	B/TkEMmavNN5CvfWKLCVhtilKE4yUX7Hp1bouyWzQWN+XqsKtQJK0fHTBajnnUk4bhwz
	qEjbSUNQpTzNVXGnj/10YtFjsiRKz6GFYaSbxuYfsuA+2Xlto/qfpyIz3Q+XdB8hwJwQ
	WoUA==
X-Gm-Message-State: APf1xPAQuRRDdBrcHamP+xlFox5ELD6vtO0KqEzIyYGZLEX874mb2A6p
	RswyGnXIwBl+B8MCJMfMk0/D4dnaReHYQzXOwWC7HGqr
X-Received: by 10.157.68.215 with SMTP id p23mr1705495otg.91.1518700857794;
	Thu, 15 Feb 2018 05:20:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Thu, 15 Feb 2018 05:20:37 -0800 (PST)
In-Reply-To: <20180211205848.4568-7-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
	<20180211205848.4568-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2018 13:20:37 +0000
Message-ID: <CAFEAcA_1wbQukD_rQzxMWMox7wtOopUd5sVPiyxsH0th_anA_A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH v2 6/7] linux-user: Support SVE in aarch64
 signal frames
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
X-TUID: Ww02XEPbVIED

On 11 February 2018 at 20:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal.c | 348 ++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 283 insertions(+), 65 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 9a380b9e31..af953175db 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1443,35 +1443,61 @@ struct target_fpsimd_context {
>      uint64_t vregs[32 * 2]; /* really uint128_t vregs[32] */
>  };
>
> -/*
> - * Auxiliary context saved in the sigcontext.__reserved array. Not exported to
> - * user space as it will change with the addition of new context. User space
> - * should check the magic/size information.
> - */
> -struct target_aux_context {
> -    struct target_fpsimd_context fpsimd;
> -    /* additional context to be added before "end" */
> -    struct target_aarch64_ctx end;
> +#define TARGET_EXTRA_MAGIC  0x45585401
> +
> +struct target_extra_context {
> +    struct target_aarch64_ctx head;
> +    uint64_t datap; /* 16-byte aligned pointer to extra space cast to __u64 */
> +    uint32_t size; /* size in bytes of the extra space */
> +    uint32_t reserved[3];
> +};
> +
> +#define TARGET_SVE_MAGIC    0x53564501
> +
> +struct target_sve_context {
> +    struct target_aarch64_ctx head;
> +    uint16_t vl;
> +    uint16_t reserved[3];
>  };

I found this patch too hard to review. It looks like you've combined
a refactoring of how we handle the AArch64 "bunch of extra auxiliary
context records" sigframe information with the addition of the SVE
context record. Could you split that into separate patches, please?
A description of why the current code isn't sufficient would also
be helpful.

thanks
-- PMM
