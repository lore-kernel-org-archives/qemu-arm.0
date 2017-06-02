Received: by 10.25.0.23 with SMTP id 23csp71719lfa;
        Fri, 2 Jun 2017 11:36:16 -0700 (PDT)
X-Received: by 10.237.63.39 with SMTP id p36mr10303201qtf.81.1496428576150;
        Fri, 02 Jun 2017 11:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496428576; cv=none;
        d=google.com; s=arc-20160816;
        b=mXavdqY+0n2w5tcsWD+gRJK3uJb0Ei1Ekk3hbQDY/Fe6qQtZ+2v3CoRo0cNojmm13f
         CRyCluBquI1mvyUfbMyhIAdFqQySsJGGXzMfn3I3q64vlUamKzrAIVVp0S26GZptfGrD
         FWhBFMTUNsthHrWRmIlrwkhhOfB+C6xRVtHrmNi+f9E7m5wXbvULWvptYDZrRziQjN1q
         M7FNgUFqhL9y56nHCUQiRVObvJzPt8/gmEVpMX6mee66tqYUNbFFmdTKYuFCzJJPbekF
         OlDhQHuNHCxuQiaff+bbj9LH7cly/TQT2HEYSdZoH7ymml1o4HVBETno9hUQilcqilo5
         zI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=5Q1lFtPcoBJ1eW1DZfJYwMYgMf5UMeDatdTokIjBaWg=;
        b=MxPWzxqzO2LSX+YlqV7n71/+oMKpNXTvYXPJkfNuZB3Ftt1u69p3Q6N0ztYaCfIqWc
         83UgiUr/fjnQbP3qDSblfb3nlQ8mt+RSH41c7i/RL3VI/yCua9mCUp4O7sda7OXoaR2E
         GtDe42frzK73Nwx7XuZT5BfGEP7Dm6uAXpLjVJsWqEy26Q7KyvSDpoPEkfH5cXdaRQ7o
         VCvWs17nBOd3Hc9FyNYP+vC28QSI0HPrtxH2XutCw1RbY6mvNFP/DXPjYCXLZBcQhQX7
         THDp9pp3qgNn5zLgLj9NH7hSTgo4GAWFPm5ntk55W2Jgy6BGi79zzrjvwjcdCix4Y7Ys
         TWHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p187si23419611qkb.319.2017.06.02.11.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 11:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGrQj-00039I-CA
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 14:36:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrQe-00037r-RX
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 14:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrQe-0004FY-1R
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 14:36:08 -0400
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:32845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrQb-0004D0-Ey; Fri, 02 Jun 2017 14:36:05 -0400
Received: by mail-it0-x244.google.com with SMTP id l145so12570547ita.0;
	Fri, 02 Jun 2017 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=5Q1lFtPcoBJ1eW1DZfJYwMYgMf5UMeDatdTokIjBaWg=;
	b=ac3sQUQrIORJprUCGyBh0uXLH/bujz8x9rinMLbSwZ8ROi1NK5gsZTepRwkQXXq6SP
	xzotMJtdd46AbqcJs3A3OXkNxolD59ld6AKj8/PWhoI8VwFjXyyNHs+VtK1xeHmlSkoM
	EHkLJa3p/Hz3sifW19GWf6oG+jizm70pLK4HsZ2rSNuk6oAj+HuIKiR8nuSorlppNu9v
	cIKvxd8/FCmAMpbKBdZI2u2czW6taOcsN1mG0k7+c7o17m/XWsdAreGH56wiwc3d3w6h
	Bl7Nyf/mVlI7g3d3E2WnXH8HPQnxHaRRvsZipaH/N+OXbcWuU7SSDU1kQp0d1pqqpl/e
	RniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5Q1lFtPcoBJ1eW1DZfJYwMYgMf5UMeDatdTokIjBaWg=;
	b=Eg5gJPBbZEL+cTt3RvdmNh02LnL8bTXDxy93I9SuEGWLqtXzk8luoyGgQtc9Pz030I
	r8Tv5iWyRq3HNFCULQYhO50dkaQ7IQt90xWqhoiVrK/TeR4j6TvsYq7P+G9zsp77+2WI
	CtbVnNX1117JbOU3Cp1Jc97ulhTMFcRhRShYgm7M1MRbMn5epJQesxeFYLzRfi8JE6hQ
	f4FzgqaoDbUyokK1xv9PxNEhT5SrIi3ByVA+pdJfSZlJMAsiepsnQ/aHvuJ0OBXgtzdH
	LLP9urAkQzztXczatL/UqSVjVnPVhYEENheyBEbCoWZKYAwHMMlN4YkkxMdHy0awBtL4
	msng==
X-Gm-Message-State: AODbwcBFAINLstgk4y+rvniNTdWTq3pDaOHt3zXq/ceMG+Ygh5utaTTx
	mazheVN4lEsANw==
X-Received: by 10.36.214.7 with SMTP id o7mr749399itg.53.1496428564742;
	Fri, 02 Jun 2017 11:36:04 -0700 (PDT)
Received: from ?IPv6:2602:30a:2c37:1a00::43? ([2602:30a:2c37:1a00::43])
	by smtp.gmail.com with ESMTPSA id k2sm1407425itk.3.2017.06.02.11.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 11:36:04 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
	<20170602163618.6369-2-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <33f0d254-c1a9-9b8e-8dbf-745d87e31c0e@amsat.org>
Date: Fri, 2 Jun 2017 15:36:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170602163618.6369-2-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-arm] [PATCH v4 2/9] hw/timer/exynos4210_mct: Fix
 checkpatch style errors
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
Cc: Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bAPPKByZdc9f

On 06/02/2017 01:36 PM, Krzysztof Kozlowski wrote:
> Fix checkpatch errors:
> 1. ERROR: spaces required around that '+' (ctx:VxV)
> 2. ERROR: spaces required around that '&' (ctx:VxV)
>
> No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/timer/exynos4210_mct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index a2ec3920f82e..2404fb737ac4 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -937,7 +937,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>  {
>      uint32_t freq = s->freq;
>      s->freq = 24000000 /
> -            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg)+1) *
> +            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg) + 1) *
>                      MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
>
>      if (freq != s->freq) {
> @@ -1162,7 +1162,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>
>      DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
>
> -    if (offset&0x4) {
> +    if (offset & 0x4) {
>          s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
>      } else {
>          s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
>
