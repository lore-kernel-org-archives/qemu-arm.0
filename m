Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp156199wme;
        Thu, 17 May 2018 09:01:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrVizAkc8+47eRbwRcdul7A9DwokLftJakiMWq2nWw9yrlpbaFC32UgK6uaPGFS9rivlJp7
X-Received: by 2002:a37:19c1:: with SMTP id 62-v6mr5309879qkz.399.1526572917330;
        Thu, 17 May 2018 09:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526572917; cv=none;
        d=google.com; s=arc-20160816;
        b=ckpwXXfcN9g2ZGE/Gzd/dqR5X6m0pwNxmgR0O1jYX6hbGCqd+nfqJF1duqCdfEyFPu
         x4Ao+qNPDfhER7FrigehY4XZjhpmI6Ao7y4aju9XoLToUQcrt7fSJ0znqJEKez5a+yLJ
         3VMi7bSohg+JsL6n+NZRb/71nTHjPt4AOuq4y/9xp6Nq7vg+376I1MaHDRaPKbLlS6DM
         941TXHSJ2Vz0HS5W6R99Zf6LNblaXFBEfaR4CmTlaf3i5s/j2ME9DqYqvjxS9CCkhkN1
         D2GGKWpWPloSdxOGZ/twxAaWhIAIUNjJjIlsW1k2RzVDtsam3Cc5WcO/N4kAKr57tVLI
         JtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zVF9RRzQAz0ez4lFJBD6s00t3pHE9tCUnXs6ThNtCCw=;
        b=KZq1aYAnqI4uv+Mx9NX1vWdhBSrYzQOU+FhaHZ51PTcK5RiVXn2KRE9urg7BpAL6p7
         yKdJvvuNAha+GLNsV/QK/b9+gyxdnCztCPy6h3PFfe7HPlwxgJcVUGHnCuYGsEkjGsLO
         A46uvoH9tblX2c72MUaDQNNFLUcQk8QBhBcUTm56nUy/H5c/WMH41sZHG99bDPXlcpzJ
         BQwIiymdIDg8d30wI3ZLEdauKdEHxCAFI4fMHWR0PrM/ih/hUYsj97gCPMPNQsL2biVU
         1bLL8aocT1I09Bs/aPmxdsH5QZIoHmRRKIJi9iRNRlNjQE8FSPlX9p9g41+fnl4oO2gs
         aUJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQT+aVwm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22-v6si5184768qkm.149.2018.05.17.09.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:01:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQT+aVwm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJLLo-0001Ts-RJ
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:01:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLI8-0007n8-32
	for qemu-devel@nongnu.org; Thu, 17 May 2018 11:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLI7-0000jc-8E
	for qemu-devel@nongnu.org; Thu, 17 May 2018 11:58:08 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:38197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJLI7-0000jL-2W
	for qemu-devel@nongnu.org; Thu, 17 May 2018 11:58:07 -0400
Received: by mail-oi0-x244.google.com with SMTP id k17-v6so4444103oih.5
	for <qemu-devel@nongnu.org>; Thu, 17 May 2018 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zVF9RRzQAz0ez4lFJBD6s00t3pHE9tCUnXs6ThNtCCw=;
	b=QQT+aVwmhD/Zym6UHAJ4fp4JXaUgmWEkjQISDng0W/1cnHYNGBe2dx8Ts4exx3r68i
	mdK3VOH50XCdae4SraRehigWBKIn5FI0IkmCKmWBE14xvb5VUbJbsWQP+yMg3raBPVoH
	BCpWT/1WESW57l3tBlW11pXwhx0/9K3BUdNGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zVF9RRzQAz0ez4lFJBD6s00t3pHE9tCUnXs6ThNtCCw=;
	b=B2U+OUlZg4luLwfStI3xzX4/UNO53GeGHCUuPP7pKx/X5X4t+J8+sharzXHZPzzWff
	eSsaUIqYM5BIdJhVQsq9Lruu1X38Jn6LbAvJGKJ2e5IWxb3h6Pf4Iai5ndFMp9+jjX6r
	AAjsqYyycTGEXszDL/KTZhnXeqFz/o32KxU/5ZxMX8zQ5He5TbFxzWmk3kveLmSiipYZ
	ZfUNfTc6o2UV8LGY3TT0BE10VoaSmd7Cq9kuaROUi/jeGkXh9WXdhDACd5cCZs1+JNyR
	WypV8MQC6c0HDtfAReT7OejkYL8ytwwnjGSaOt1mtlMUI5X1I9MimgJmqvAQx6IlB1W8
	Erbg==
X-Gm-Message-State: ALKqPwcSfqfNYbLOSmmeD85Xl3gPqCZIYhSk3FpIeDdnVSOwAgQYgygK
	FEaujWs3r2bfanQR//1aii7OChrG/yfj+eQ/SoOUIQ==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr3679993oih.80.1526572686327; 
	Thu, 17 May 2018 08:58:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 08:57:45
	-0700 (PDT)
In-Reply-To: <20180516223007.10256-27-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
	<20180516223007.10256-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 16:57:45 +0100
Message-ID: <CAFEAcA-Erv++skS73s6_ZCWbo=G6xLaE69wukUKyX3-KyuV=oA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH v3-a 26/27] target/arm: Extend
 vec_reg_offset to larger sizes
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
X-TUID: V1iRcDRn1VtM

On 16 May 2018 at 23:30, Richard Henderson <richard.henderson@linaro.org> wrote:
> Rearrange the arithmetic so that we are agnostic about the total size
> of the vector and the size of the element.  This will allow us to index
> up to the 32nd byte and with 16-byte elements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index dd9c09f89b..5a97ae2b59 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -67,18 +67,18 @@ static inline void assert_fp_access_checked(DisasContext *s)
>  static inline int vec_reg_offset(DisasContext *s, int regno,
>                                   int element, TCGMemOp size)
>  {
> -    int offs = 0;
> +    int element_size = 1 << size;
> +    int offs = element * element_size;
>  #ifdef HOST_WORDS_BIGENDIAN
>      /* This is complicated slightly because vfp.zregs[n].d[0] is
>       * still the low half and vfp.zregs[n].d[1] the high half
>       * of the 128 bit vector, even on big endian systems.
> -     * Calculate the offset assuming a fully bigendian 128 bits,
> -     * then XOR to account for the order of the two 64 bit halves.
> +     * Calculate the offset assuming a fully little-endian 128 bits,
> +     * then XOR to account for the order of the 64 bit units.
>       */
> -    offs += (16 - ((element + 1) * (1 << size)));
> -    offs ^= 8;
> -#else
> -    offs += element * (1 << size);
> +    if (element_size < 8) {
> +        offs ^= 8 - element_size;
> +    }
>  #endif
>      offs += offsetof(CPUARMState, vfp.zregs[regno]);
>      assert_fp_access_checked(s);

This looks right for element sizes up to 8, but I don't understand
how it handles 16 byte elements as the commit message says -- the
d[0] and d[1] are the wrong way round and don't form a single
16-byte big-endian value, so they must need special casing somewhere
else ?

thanks
-- PMM
