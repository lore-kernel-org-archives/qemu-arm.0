Received: by 10.28.4.212 with SMTP id 203csp1903399wme;
        Thu, 3 May 2018 06:26:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoNE4+hO3b3iZzfxTNbrigQ/0aKBkwL3NxXdm8qcZXeUolOc89Iedh5eNYA3s/9IwPOebW0
X-Received: by 10.55.128.196 with SMTP id b187mr2552741qkd.47.1525354007181;
        Thu, 03 May 2018 06:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525354007; cv=none;
        d=google.com; s=arc-20160816;
        b=RHQbJfu+sgMjQJEqpMXJqAbenOCeYSbq/5xaDIne1wV2vHImeNDwnPHeoR7SiFhvot
         HhCEY/rZ/VNw4hCJnPHSFNTK+kL+5d8BYp4E2dCwCprl5SgkRHbVqcu7YZAW4R6rb2hM
         k+pt9bDJtaELt3yj/Pk1JtR+AvN/DDSf8pRNXj5dGXZz2c0xmfmS1IXOrq8LwBzcPrpj
         ehHTjTzQESc11wHQ7TByyPZ00Nc08+KbYpvl3eMlGUaWopXfc0S9rrnJmh0AGRcXYmr7
         ZmP5elaMMaqwgaY3ylFNKxwChx0fbKmvjnqrzNy8ZSHaxU46a2RuFpTGyyHJxYXmf9+m
         uJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7vRz10ionup3WiCHcKtOOaHE0/0zM8WXRDIsr2zKnx4=;
        b=CQTEpXnvpaFzSaeVH1EyTusPMf5Wx4NGrYqP5bBf+eCWkwQcnN8vsPFU/Sg1UpHDoC
         2tKZrSF3voCTqxR1tFfG9ZQVcGMxcEHROIc/9wBeo2lgH8q8BNb91klC+MGgrB6LlKF2
         FTT6E/nrxDXlxuzqFZtOSLma10VRwSVrNkUA2Qf2ckTCKeFjoxyg9L6B9K+7BUgr8cV5
         /RYMit19qvZ3ugfyInewEp7GVDp1LD6OgYc8PTlgFDmzwnZ0pDVV/7WPv980VpwVKoWr
         L7fJGA/Li5biH6GijAoFQcVmFqyGxcg68V5estpsYw3R6jEDZVhLL4gw8FYLADU5QHEI
         JEig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AsozRn7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17-v6si489510qtd.149.2018.05.03.06.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 06:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AsozRn7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEEFy-0000Su-NM
	for alex.bennee@linaro.org; Thu, 03 May 2018 09:26:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEEFr-0000SL-H0
	for qemu-arm@nongnu.org; Thu, 03 May 2018 09:26:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEEFq-00034a-IN
	for qemu-arm@nongnu.org; Thu, 03 May 2018 09:26:39 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:41453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEEFq-00034I-D7
	for qemu-arm@nongnu.org; Thu, 03 May 2018 09:26:38 -0400
Received: by mail-ot0-x241.google.com with SMTP id t1-v6so20592609oth.8
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7vRz10ionup3WiCHcKtOOaHE0/0zM8WXRDIsr2zKnx4=;
	b=AsozRn7nSUzpVbJxjM1WnP74kegaSKV2eIM/HF54Eas3x3MWsjXRuqtnnr7JM/dQJ5
	j81y+P0fs5t4qWkSzdrxXxettpuUb7M/EV6zKRPWOmE8/e+TIh3Cyu19YcmYdKlylQah
	2wJt5Tr7+yp5gqqXiKP06Yi7bS0E1MSWR2iFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7vRz10ionup3WiCHcKtOOaHE0/0zM8WXRDIsr2zKnx4=;
	b=GYdMvoQsPgCC8FF0UocDVyfgADZRX1HHY2dZ76OOhKuWzgqlTsCpBJ4uo2S8JDeYCX
	Ah35Y28u711P1VBBsWuZzaVSg8t0M6zVaJDAYiSEQcAOICzvB94LDmPBJILFSEYF05sb
	LlgDaltwjh8WzJkkcRHtPt+HkbI4cpXnT3R/r6D6swz8/BCS/Z/8aMCZDea+q6oCla3/
	C5mWbxQlcgrhNvkrBGOVq4c9f9v9Q8T7CBY3W3mj0lw7nTyMkrXghkUqPsYZlxmaDWK/
	vnwcG7aYKZbFPOp/PLlkm5XTnK25WB2lPuU/nPel1oEyv9AFiduw5mkR6itAw6949m/K
	lffQ==
X-Gm-Message-State: ALQs6tCZlOtYJGc968J1x73p/N6BZax3qCF9rtez4KQ72kMlNnjTOJrk
	hKiU1jZpfNCoEj8JEcHENTO/KomygocKlbJ3wUpq6Q==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr15508696oth.205.1525353997643; 
	Thu, 03 May 2018 06:26:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 06:26:17 -0700 (PDT)
In-Reply-To: <20180427002651.28356-5-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 14:26:17 +0100
Message-ID: <CAFEAcA-wq3kasUe8pkdUJXNJYNnLABrPgeQE4fokSLL995SFkg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH 4/9] tcg: Introduce atomic helpers for
 integer min/max
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
X-TUID: 3zvgA0MfLWcQ

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Given that this atomic operation will be used by both risc-v
> and aarch64, let's not duplicate code across the two targets.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h | 71 +++++++++++++++++++++++++++++++++++++++++++++
>  accel/tcg/tcg-runtime.h     |  8 +++++
>  tcg/tcg-op.h                | 34 ++++++++++++++++++++++
>  tcg/tcg.h                   |  8 +++++
>  tcg/tcg-op.c                |  8 +++++
>  5 files changed, 129 insertions(+)

> @@ -233,6 +270,39 @@ ABI_TYPE ATOMIC_NAME(add_fetch)(CPUArchState *env, target_ulong addr,
>          ldo = ldn;
>      }
>  }
> +
> +/* These helpers are, as a whole, full barriers.  Within the helper,
> + * the leading barrier is explicit and the trailing barrier is within
> + * cmpxchg primitive.
> + */
> +#define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
> +ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
> +                        ABI_TYPE xval EXTRA_ARGS)                   \
> +{                                                                   \
> +    ATOMIC_MMU_DECLS;                                               \
> +    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
> +    XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
> +    smp_mb();                                                       \
> +    ldn = atomic_read__nocheck(haddr);                              \

I see you're using the __nocheck function here. How does this
work for the 32-bit host case where you don't necessarily have
a 64-bit atomic primitive?

> +    do {                                                            \
> +        ldo = ldn; old = BSWAP(ldo); new = FN(old, val);            \
> +        ldn = atomic_cmpxchg__nocheck(haddr, ldo, BSWAP(new));      \
> +    } while (ldo != ldn);                                           \
> +    ATOMIC_MMU_CLEANUP;                                             \
> +    return RET;                                                     \
> +}

I was going to suggest that you could also now use this to
iimplement the currently-hand-coded fetch_add and add_fetch
for the reverse-host-endian case, but those don't have a leading
smp_mb() and this does. Do you know why those are different?

thanks
-- PMM
