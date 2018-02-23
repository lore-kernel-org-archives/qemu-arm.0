Received: by 10.28.71.27 with SMTP id u27csp792921wma;
        Fri, 23 Feb 2018 08:33:04 -0800 (PST)
X-Google-Smtp-Source: AH8x225eEC9sh1CA/GkbuR+UQJOn2JT+o9Mf1gf4jtBRS0vlW/K/G0qHtHi5aV8xRx7pHoNVLpxK
X-Received: by 10.129.51.68 with SMTP id z65mr1415366ywz.347.1519403584122;
        Fri, 23 Feb 2018 08:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519403584; cv=none;
        d=google.com; s=arc-20160816;
        b=LjBVWIziUeCX7ZnkpzCYD/rAryWaR8vhgvCO1xGmh8IpAGaMc+PruTInlAyIndASoZ
         zo8+JNQKVpDpDwmyHib+eoIyTxFcXztuehzQr8U+Y9vScIGJbnW/wp+Fau95i0NSs0nZ
         NTG73rV5dBt5HdW0Ds0vn/C77K+Zzyk/2wLxfza94qbkwKtmgUtHbCFffy/zsL25xnzb
         yCG0NM3BnrXIRE43f2wwgiz+ylU7Qu4vIa59ga3DG9YwRHMxgwi9RcqiHjOAASn+vOPQ
         YC6Ah9zfnIy9Ngy3xGVnyXQckEJF+PMneWZ1FG4HGRwn/MIu7/l9eawYXXaOG7Y6ANGA
         Quxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fCZcQkwPlu/kGrnCdFQENBp3XUXOqUldo0ZL2jKjv/w=;
        b=qJky2eoF6jF/xn7NPOSbRtUtDBX/egBVEAnflimfqVJ8L7YkTJ6tl0U0l8Hht4btHn
         3dv43Vw/aZIeY+epmKHfP8MRS3GnEP0ZO4QTY5UtloBmAfRmAjTbiwExbmLOgMEPV29M
         PO451M30bLF4oigtHVyrT9/fs5kE6ThBZZq47DH24la6vr8Ut/t/4wXxKWqbCIM9Df39
         yr4mFKlwlnrRgPjFRiGJB5jdfVDchM6y0ymcv8FzvPDsG+J9PXZ4OdwA5FacqC0ZRPOL
         R0CTLd590T+6elfpZ6AvJj/tgpbrYt9wsneVf0ZUp89A0v2ntA4B1cBGEbxZrFgcUrra
         htaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cSqvV5EF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b204si195899ywc.64.2018.02.23.08.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cSqvV5EF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGHP-0002zn-H6
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:33:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGEE-0000dB-6Y
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGED-0005rw-2C
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:29:46 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:34773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGEC-0005rP-LE
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:29:44 -0500
Received: by mail-pg0-x243.google.com with SMTP id m19so3549102pgn.1
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fCZcQkwPlu/kGrnCdFQENBp3XUXOqUldo0ZL2jKjv/w=;
	b=cSqvV5EFWDpqOVS7+6QSmMPJwrNvgZwNX15VlMS/zLjTOO0lnRHYGhGSzmbGtw/Fpx
	Sz/fCB4fsMZtcYqNLrvSo14oPu1GxMbEzgwpMqcLxYAy/3zuL7UP1Gko6rONqHlY+0xT
	6IcUYg1qXUg9uFXajz7RyZ70tMZ20Y3g2cdIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fCZcQkwPlu/kGrnCdFQENBp3XUXOqUldo0ZL2jKjv/w=;
	b=c/Xa94dTW2PMCEAUOq7OVyBE/d8+a0MApGAa4fS0KeRNl3WMJVhxPoso+Vt4bJEj7f
	Ut1356qGSx56vsByTxOBbacbirk4El60qElJXLlObCcsh9UD5wP/1Kv7wWKc15CAazzM
	op1ltPWmu4YFFIrMTzp4yO3W2HNPa3vGjRJ069GwVzEwdqkIy3qNuN1ReZPBrcloev4Y
	DF3QlMdaQnvVGyjN140DGUug0CTeujGuQOUetWQngDkCcZ7o1lgZ8TgHnlDbHZDRshJj
	/jMnL1qel+2/KraPEGTSV6BJWGoJQArPHLiSZ65ZC5egE/KJKyrCjodDSESChQ2uJf7D
	eFBQ==
X-Gm-Message-State: APf1xPCvYE1EM07MXZSGwvsBnYiH66LP2fmYKyGoIly2k8ZuEhkG51JF
	FBbe8393PpaVtkXUA89qNOEMy4VCgijuXc/jNcVnsnKg
X-Received: by 10.99.120.13 with SMTP id t13mr1893805pgc.35.1519403383447;
	Fri, 23 Feb 2018 08:29:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 08:29:22 -0800 (PST)
In-Reply-To: <20180217182323.25885-37-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 16:29:22 +0000
Message-ID: <CAFEAcA8mvCXMEBv+dLwVfQcdEeyaqSfK9EX1HzQOKfQi8+Tk2g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-devel] [PATCH v2 36/67] target/arm: Implement SVE Integer
 Compare - Vectors Group
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
X-TUID: u8m2coD3dHhK

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 86cd792cdf..ae433861f8 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -46,14 +46,14 @@
>   *
>   * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
>   * and bit 0 set if C is set.
> - *
> - * This is an iterative function, called for each Pd and Pg word
> - * moving forward.
>   */
>
>  /* For no G bits set, NZCV = C.  */
>  #define PREDTEST_INIT  1
>
> +/* This is an iterative function, called for each Pd and Pg word
> + * moving forward.
> + */

Why move this comment?

>  static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
>  {
>      if (likely(g)) {
> @@ -73,6 +73,28 @@ static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
>      return flags;
>  }
>
> +/* This is an iterative function, called for each Pd and Pg word
> + * moving backward.
> + */
> +static uint32_t iter_predtest_bwd(uint64_t d, uint64_t g, uint32_t flags)
> +{
> +    if (likely(g)) {
> +        /* Compute C from first (i.e last) !(D & G).
> +           Use bit 2 to signal first G bit seen.  */
> +        if (!(flags & 4)) {
> +            flags += 4 - 1; /* add bit 2, subtract C from PREDTEST_INIT */
> +            flags |= (d & pow2floor(g)) == 0;
> +        }
> +
> +        /* Accumulate Z from each D & G.  */
> +        flags |= ((d & g) != 0) << 1;
> +
> +        /* Compute N from last (i.e first) D & G.  Replace previous.  */
> +        flags = deposit32(flags, 31, 1, (d & (g & -g)) != 0);
> +    }
> +    return flags;
> +}
> +
>  /* The same for a single word predicate.  */
>  uint32_t HELPER(sve_predtest1)(uint64_t d, uint64_t g)
>  {
> @@ -2180,3 +2202,168 @@ void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
>          d[i] = (pg[H1(i)] & 1 ? nn : mm);
>      }
>  }
> +
> +/* Two operand comparison controlled by a predicate.
> + * ??? It is very tempting to want to be able to expand this inline
> + * with x86 instructions, e.g.
> + *
> + *    vcmpeqw    zm, zn, %ymm0
> + *    vpmovmskb  %ymm0, %eax
> + *    and        $0x5555, %eax
> + *    and        pg, %eax
> + *
> + * or even aarch64, e.g.
> + *
> + *    // mask = 4000 1000 0400 0100 0040 0010 0004 0001
> + *    cmeq       v0.8h, zn, zm
> + *    and        v0.8h, v0.8h, mask
> + *    addv       h0, v0.8h
> + *    and        v0.8b, pg
> + *
> + * However, coming up with an abstraction that allows vector inputs and
> + * a scalar output, and also handles the byte-ordering of sub-uint64_t
> + * scalar outputs, is tricky.
> + */
> +#define DO_CMP_PPZZ(NAME, TYPE, OP, H, MASK)                                 \
> +uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
> +{                                                                            \
> +    intptr_t opr_sz = simd_oprsz(desc);                                      \
> +    uint32_t flags = PREDTEST_INIT;                                          \
> +    intptr_t i = opr_sz;                                                     \
> +    do {                                                                     \
> +        uint64_t out = 0, pg;                                                \
> +        do {                                                                 \
> +            i -= sizeof(TYPE), out <<= sizeof(TYPE);                         \
> +            TYPE nn = *(TYPE *)(vn + H(i));                                  \
> +            TYPE mm = *(TYPE *)(vm + H(i));                                  \
> +            out |= nn OP mm;                                                 \
> +        } while (i & 63);                                                    \
> +        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                            \
> +        out &= pg;                                                           \
> +        *(uint64_t *)(vd + (i >> 3)) = out;                                  \
> +        flags = iter_predtest_bwd(out, pg, flags);                           \
> +    } while (i > 0);                                                         \
> +    return flags;                                                            \
> +}

Why do we iterate backwards through the vector? As far as I can
see the pseudocode iterates forwards, and I don't think it
makes a difference to the result which way we go.


Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
