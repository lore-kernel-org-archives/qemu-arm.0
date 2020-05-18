Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3175050lfb;
        Mon, 18 May 2020 09:13:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeOm2LdZcGEF+XvDUVq4kWESYiX2pO2OnaH4mn5x8twBvXgujRhrWk2p+W+oRl5IWoZPEU
X-Received: by 2002:a05:6402:180e:: with SMTP id g14mr13445753edy.75.1589818395609;
        Mon, 18 May 2020 09:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589818395; cv=none;
        d=google.com; s=arc-20160816;
        b=foPiBo1soRYWGn8xMxM+5xoTyFWGnVU502Jy2hexlglCyUOAG90mvJBK9sjdBKJFvD
         8Y4ZADNaRj9zWnEXocKPFK2zhfHoHYVG+tHFxnyjW7bZXhna/xoJuc+rvos8MutugR7q
         K77CugjsKOYSRcCoT9KnnL5r1pWvtMplzd8mwwekAahoq7xjWSiHsHvRaoD5UYiffdsV
         OWLKboZlxIBCTFNz/FVrzxd6ZUMxSvdlu7wDEFjcLtpgErZVHtsm93vQHD5Ggsp40/eT
         bXT3gSJQ3AfuGKk7uOJaFDBunexu3dn5IXbyCvytNpqXmV4GO5/PsmUYDvnzsmZ5B7W9
         gh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Xt6gu4+eaQuMJFPwT8oV6k+iEiCGWPUTkC6kwPqJGp8=;
        b=JLpPerGqqI4wNiP2/gB4X65c8Od47rPomC0re9ylj222C0SzvHi5lgm45rWARE05+F
         7EDdbpmabxsiUe4zF6mTTvYkhs6WKsr4Ju16bULJC3SzzV9F8fBvInNR5J0lelRt0ibT
         NS/24fd1NVR7tmzqgCLe++JKl+SFPc0+MKGn60RPNDK0t6WkT6Aw4+o71SIgdzDxITEZ
         eACzEkQ5Ra3YpeCj3shLVyXu5eT0KrEDETbY9g5+/PHwCuWBxgF+aI6OMexqIK5YbAbM
         iadfSs2LaQDewmq43lp+xpHb6lhp4c6aWAg96B1N+wHCHAsgszzZmWRWGTc+SqfOBpD4
         Lvsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ing49XgJ;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id t26si6491872edf.183.2020.05.18.09.13.15;
        Mon, 18 May 2020 09:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ing49XgJ;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgERQNO (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 18 May 2020 12:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQNO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 18 May 2020 12:13:14 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C85C061A0C
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 09:13:13 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id v17so8551009ote.0
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xt6gu4+eaQuMJFPwT8oV6k+iEiCGWPUTkC6kwPqJGp8=;
        b=Ing49XgJjmRpKG+8PpjhHETinpEQfqhJbzvsMEn9umd1V3HgL5tP6PEUtuBvcWB3SI
         +9uA4tPXHT7EnE1vN3ivWU/DZpx7Qk+Rs5r4znx/3DmozXrClPVQrkrcnz9yF2xcJH8J
         nIlp8/Z1ABLwiI290Oxz11zINpBXDK7LF9mYAu5vHY0Xutadp6mO5y2xRvNzxuN2KvhS
         Lo+tmb5EiNEIIl26pFQ/kt7Ys2IbwrxN2nfXwvKH1VuUhCMUznhG6Zo+zMPkKvtwZK1T
         lAC/9cgTSH/zn3civHv+3WOy3zd7xg1pFORtoQ0swX3b4yny1RHkm4/g1Cbe8tNN3dVf
         Kl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xt6gu4+eaQuMJFPwT8oV6k+iEiCGWPUTkC6kwPqJGp8=;
        b=ojda7SW4/VzZ20lAFdGfJcUg5Abyz15A+dRLj07N9yRJYu0ClruBwZog6mobwUrdhY
         o0SBo/WMz+UMHp1gHec25Lwa/d+Yd65lalcitSxq4QgMtKPS5VVPJnwdOcJihh86NLJu
         BgfAQZBfMqvqCOfOqATLiUayQmVT0KAJ1G0chMCuEsdBTL548+ByK6814oYY9pEtbJdL
         P+X/8p7X800Ww85NsNhIml6Wsft20CPko38KXtAdoIDYqiTyu3QbREk6falG4uwp+8cz
         DRhk3Sc7eLQKQEc4hPaSi70ATLBQo68GOBkhcKWNa1Cgv6yYflhpeOnwp7P2qPorZCir
         K9mg==
X-Gm-Message-State: AOAM533KibwHR7hV7/fXHOD6I7XUDghif/5Z/APfQ9K3uk63gQfAxGVo
        dW5tdQ+l5r3i8nc/otZWVlarDdFn6Qa8Jm3UOjlS90GFG70=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr12261051oth.221.1589818393131;
 Mon, 18 May 2020 09:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200518155308.15851-1-f4bug@amsat.org> <20200518155308.15851-2-f4bug@amsat.org>
In-Reply-To: <20200518155308.15851-2-f4bug@amsat.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 18 May 2020 17:13:01 +0100
Message-ID: <CAFEAcA8XdUMyQfXWMjr5cqc8+p8k_ECv8WpeOoE_mtDNAJENJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] exec: Let address_space_read/write_cached()
 propagate MemTxResult
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: go990CrWCGl8

On Mon, 18 May 2020 at 16:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Both address_space_read_cached_slow() and
> address_space_write_cached_slow() return a MemTxResult type.
> Do not discard it, return it to the caller.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/exec/memory.h | 19 +++++++++++--------
>  exec.c                | 16 ++++++++--------
>  2 files changed, 19 insertions(+), 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
