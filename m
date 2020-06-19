Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp604177lfm;
        Fri, 19 Jun 2020 06:45:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxinSqq3HwLQTmh6rUfd9iWbTtcZsylMJfIvDKkRap8e0iq+Vmc2LdYHBSbp+dpfpj6+cJq
X-Received: by 2002:a25:d40b:: with SMTP id m11mr6068319ybf.66.1592574338603;
        Fri, 19 Jun 2020 06:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592574338; cv=none;
        d=google.com; s=arc-20160816;
        b=v95Hb8RQzgldEuOYkuvd6T5Tis+xMLzflA5axuXYD+1WEBbSoVg1ItaZFzQs82UzAp
         e0ZJqdIMLbjArPvkSqqRYtN2cwMIdS9dBVVl5a/Xw/fcipTrsbGMa5p2KDxyHtdUY3tQ
         T96RBQW6GNEfefi3iFj1R2v6TR7waQsJa4RtDCp3Ejr0zUj0YPyB2u6N5iAMfC8EATIB
         CT8UnJJIC2R5A5NKexsXlO/QglgJTf7I3aNHtRpAR0Y88wTYuYZAplYSrmTvNk5gevfW
         bQSEDSycNU+uVw2QJ5IUT102ynpvlYtMMdXzaDc5fhjmJlpa/mIiUEQPhVGyl/t3Csmv
         P91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6kZOlyIFl5oinlTCugZZ9QN7AIAt1YvTN06vkIw2kc=;
        b=wplcw+oaC0T+Bx8lgN8G1JZgsp+Nxama3Wazu3Pn0XTpTrCyhEfw41gJm94hJC+Fng
         nyENs0XjOavID9dDcyFx3zq4+ZH4ib/avrqtYLRhjNTKctbhSEhiFTwXdjRdOkV4XC2/
         SQ8yd8OJJE/TPhS+ffP1VT8qEoonh3Foou2cFSkrPgFgzIru8o/JmoFi4fdT7m4dfwLL
         SPjBSbyPwRLVm3sI1Jzi1FRS7SLzb051Hcw6A09qHKXxcrW2HeJSN4y2YV6NenKDsqu7
         swmmCj56oSEzebdOdmpzEYx6paxzb/8A0ZAm583cNQW4pj/4fnzWjN1XOs17xhkcNnjT
         R3fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="nSG/E+Wh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b204si4732428yba.489.2020.06.19.06.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 06:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="nSG/E+Wh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHKs-0000dJ-00
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 09:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHK0-0008Te-4s
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:44:44 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHJy-0007uX-9P
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:44:43 -0400
Received: by mail-ot1-x342.google.com with SMTP id s13so7298095otd.7
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z6kZOlyIFl5oinlTCugZZ9QN7AIAt1YvTN06vkIw2kc=;
 b=nSG/E+WhuxD9bDobapP733LDaLqPowWgxij337glEYA3NdfPxuNQ5ydd7nfKqOF/dJ
 pAlC18r6HsFnrUfKV8lCXqrZE52GmM1Wx9D8N/QN87lM02ZyDinPH9zElkDAhWnCDmon
 KP4iFHrclLhE7o8N7yBc6RudH3G7XPuaKI/Eu6eDnMtSY8e2QYshDU25sNkWM+17uRVD
 qgEefD0i7gKxYJDqQVw5QXG+TOzfimqysHdKxBMX9e2cAgRMnW5xMexIrsVrErtLtJ6p
 zqZuTDthvuqUbkaeoeKUDfuAgw1fNMxZ2HTq7ZQPRtZWx5ai8aO7MSgW/3lpVxYd7WWU
 zjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6kZOlyIFl5oinlTCugZZ9QN7AIAt1YvTN06vkIw2kc=;
 b=QpqDUF4GsfjPj9bGW/Tt/HmYlYZph9Q9oXZqM3dZq0I7RhHVtbjLnQ4lWGrqDSHx4q
 SquH1fgI3sNidSCc0Q5wTUOm8ZHdJXRcHAStqQOPeCSpeta7ZAsqdMEjuIC9rK548DA8
 zAYkliYCQg7feiphjrAbRBpYSTbEOAKJZ9R//a5mpA+/w0GLClggwwoSyaO9dS3IZr9T
 3Br3FfcyPMzp06qLcpcqmieot9UIa4bgZPng7LStJtnxPk9WQsURZlFONrhofTErllCP
 XZIk8I5dmxH1k5E1pXG7O+fH4FMNf9+A5nETC1imIhnZDWBT4KoQQOEJqnPk4jVCS2ux
 0oMQ==
X-Gm-Message-State: AOAM532FecRy8WgsVt/XMm/1wl41gCA9d39dn6b7YDONGny6EROjGE0o
 hhoyw3GBdMCFzrPd6aqG2beo/kvVKFmM+JPkvqOgpg==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr3133612ote.135.1592574280521; 
 Fri, 19 Jun 2020 06:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-26-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 14:44:29 +0100
Message-ID: <CAFEAcA_CMWeC=ULu7G4By13KRRJb1UVwRQMksQ-kv0oy=VDZ6A@mail.gmail.com>
Subject: Re: [PATCH v7 25/42] target/arm: Implement helper_mte_check1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sWQXr7zp89IL

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill out the stub that was added earlier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h  |  47 +++++++++++++++
>  target/arm/mte_helper.c | 126 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 172 insertions(+), 1 deletion(-)


> +/*
> + * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
> + * for the tag to be present in the FAR_ELx register.  But for user-only
> + * mode, we do not have a TLB with which to implement this, so we must
> + * remote the top byte.

"remove"

> + */
> +static inline uint64_t useronly_clean_ptr(uint64_t ptr)
> +{
> +    /* TBI is known to be enabled. */
> +#ifdef CONFIG_USER_ONLY
> +    ptr = sextract64(ptr, 0, 56);
> +#endif
> +    return ptr;
> +}
> +

> +/* No-fault version of mte_check1, to be used by SVE for MemSingleNF. */
> +bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)

If this is a no-fault version, why do we need to pass in the ra ?

> +{
> +    int bit55 = extract64(ptr, 55, 1);
> +
> +    /* If TBI is disabled, the access is unchecked. */
> +    if (unlikely(!tbi_check(desc, bit55))) {
> +        return true;
> +    }
> +
> +    return mte_probe1_int(env, desc, ptr, ra, bit55);
> +}

thanks
-- PMM
