Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp208956lfo;
        Tue, 2 Feb 2021 07:24:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3mtObd4nSdBTH/a2EDPV6OmTAWO4fGD4g7j5skpCgeFmW2bW+ox8DRE4Mn4hZIZbjMxOS
X-Received: by 2002:a25:581:: with SMTP id 123mr20293003ybf.186.1612279461610;
        Tue, 02 Feb 2021 07:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612279461; cv=none;
        d=google.com; s=arc-20160816;
        b=b6APdL8lx9JSXSi5WbeZAqFYW0BryVeYAG1jNEkKNkAgWDvAId2myAj88zIegqn4CJ
         /rcUvQZsXWNE5sRz+/GgCvDR+UOXTCvPQx2ih4rCRanGPKvUG84ZHEhPaVIeM712jjnB
         k7fivvQ0YN0bKvxeAXioq4pF1L+dCQxvkafQQ9JFrJk10/XcRbLiZmH0eLwKZ0ZK/FeY
         vb6yCtvp40mX4NpPpD+7GNWU7JFL9K234EA+wypiKy0HfvK686DufAPPmAdYHYTlsh0X
         jgIPCQEjAo0VD5wJqgq4haolqbWBTOKMreYkQv0MEKPN5ZHpxfOle6Pw4v9pzbXPxRR3
         Fxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bN4w6xbMIUA+ZUGv136519BHvwmxs47yo8pMTYvgCAI=;
        b=08ME4TYkDXC0kvziax/QQyABIJKBez0ld8VY7ROQWxgFS7Ifulxc91pt7+t0VLy5II
         lG11QT5GtyP3CTflM2bPsqeTxkH3c6LLOs3JVusrPYCYyoXcocmKprl3myTS9v7cWHBy
         MKpzjqN5DWlRa5mOyvQ0fsoIR79LK3wJSYdjaQ/xhAgVySkdYHOvCRC0IeGYjitxteE+
         NKuh6P+ORi5JIE9gfwwo6Takb0A03gsdB48rrU8x2yLEamEq8A/7A9Gkxu7CiM7o8ceu
         YSaJsHvZqxatq0C/U9XUyi/DoDcPX6tjuzei6m7+3o4QSa2LNywgRcrBWEup2BGZjc6r
         Dx6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bB3XKUqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j134si9698242ybg.284.2021.02.02.07.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bB3XKUqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xXQ-0005Mh-W9
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6xFC-0004xE-Jp
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 10:05:30 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6xFA-0003GE-L3
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 10:05:30 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lg21so3140543ejb.3
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 07:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bN4w6xbMIUA+ZUGv136519BHvwmxs47yo8pMTYvgCAI=;
 b=bB3XKUqghLOc6FcJJ0QiMrlAVMRS6e97pOair2PSFwyxuDh0Yj9IPJXGQz98bl12T2
 R/kYE6IFXrulQZLwjq/U6gqquSqVlOCJ5kELIygdjLVaWcPPC5GLVctLKntQ9shssp5X
 F3L5UOuYks1UgPyVnv23QwGsn+t/EQJC6XUQMVXCuFlDNJao37RpA4CBir59jwvZbuH6
 XBYQJwgGnbYi+X6EzcsJxWLowBL3z0peDzLiouskF8+hrgmAUnJbBJ0xMkehLpzIXi8j
 KXZTVmDpFSwxwmOAmrQ0bkjFFDRjAUbhb/DRXeNFcQsvy7ISx+JK1CM8e7CzKbICYXLP
 69Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bN4w6xbMIUA+ZUGv136519BHvwmxs47yo8pMTYvgCAI=;
 b=GpO/8Q6ilj8aqe1uOTZsgLHNETABYxQMrrK4+8v4o7dQgM4YVl5+lda57nBjp26RO2
 SUGa/867XF9uTGkSQZFgcCyQ2MbSqAnhrNc82xFl/XaZLh+5tcPmMIg8LlsOt+mUL0n2
 hnH5l3ROAMhoO7J2fFxQwXqSpmNjPT0Pj5WoYWr0VfS6YOrmeQIg3LfRKuCPiLACi3U8
 kTSqDNTkXvNoWjwk/9hlNlP7gjfTmU2hw3GfzoELuQTs7AkXaKb/dsbceOMpLMlKKOkp
 lqKwSyIYVHUQvw7eqAMo1xc4K7OlFUgHpcF2IRuHR53OI+Y1r/GFkLuJSXUC/k/zpAiI
 UEpA==
X-Gm-Message-State: AOAM531QbkVhJd9Hpql02AgQskfvC69qs9CrC0eEwyeZucfvPdPOByZo
 h63ynGA1hi78P5y5+/zF5GObAZDTvWfAGV0HLhnsWQ==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr23070181ejt.56.1612278326504; 
 Tue, 02 Feb 2021 07:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-12-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 15:05:15 +0000
Message-ID: <CAFEAcA_Y4W-zGpE7YWVnTmwtK73DWwDb1K8DLxfz4M5tbX1W1Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] exec: Add support for TARGET_TAGGED_ADDRESSES
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uMF2UGN+yecR

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The AArch64 Linux ABI has always enabled TBI, but has historically
> required that pointer tags be removed before a syscall.  This has
> changed in the lead-up to ARMv8.5-MTE, in a way that affects the
> ABI generically and not specifically to MTE.
>
> This patch allows the target to indicate that (1) there are tags
> and (2) whether or not they should be taken into account at the
> syscall level.
>
> Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
> pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
> in the arm64 kernel source.
>
> The prctl syscall is not not yet updated, so this change by itself
> has no visible effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index e62f4fba00..1df9b93e59 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
>  #define TARGET_ABI_FMT_ptr "%"PRIx64
>  #endif
>
> +static inline abi_ptr untagged_addr(abi_ptr x)
> +{
> +#ifdef TARGET_TAGGED_ADDRESSES
> +    if (current_cpu) {
> +        return cpu_untagged_addr(current_cpu, x);
> +    }
> +#endif
> +    return x;
> +}

Can we use thread_cpu here instead of current_cpu ?
I'm more confident that for linux-user that is always valid
than I am about current_cpu (which is documented as only valid
inside cpu_exec(); we used to deliberately NULL it out when
we're not actually in the middle of guest code execution,
but I think we have stopped doing that at some point.)

thanks
-- PMM
