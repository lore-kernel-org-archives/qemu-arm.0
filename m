Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2252140ejb;
        Tue, 30 May 2023 08:18:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VHZTTR9M/0dJ5G1N1+cwy6Bb2fUy2Hj2+xcDkf/BVFBeMjJIx/rnYe8i2O8yaKRUl0y9r
X-Received: by 2002:a05:620a:2d81:b0:75b:23a1:831a with SMTP id tr1-20020a05620a2d8100b0075b23a1831amr2194949qkn.21.1685459931175;
        Tue, 30 May 2023 08:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685459931; cv=none;
        d=google.com; s=arc-20160816;
        b=mDTh7eLXYXR8dB4mm34GaTGgEMj8OYqKUDqoR6ZCvslD3p88TiQ+sg7GziW69nn+L7
         z/PtnLmulG/aVEL/HL8B2cOBIvA3p5uKzYNnwJ5K62fUmbSn21cVpCf1YzKAXru52k1h
         trOoyIUzhRmkT8iqc9yZOjmW8uG4NtFiahUbi5CIsFgFfz/FqL65oXF3kC39sYe14nPZ
         aUoE5XjFUODTs0+tS+OgLkGG+esxF/0yMRflKPyT/dBEg+zM9IaQg1KxhCyLg+bW83OB
         kVxrkjR1wviwl39qiPmN+JCXSuhrMUCS1crj7hkP5uUWHpy8T/23llWYKXYmUwbpFqs8
         bklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tVORMHIcX6LuKdvbuhlEaqupobkYB9pBO6CCzD1eKNs=;
        b=Txscqno9SgpdpbQci79R4rKm34tzgVhNsP3khqrF3ByY6RG9L39s29/zyYJQuCfoMO
         LOUWsz0cdSZjN7t3+AyTUR+9tNG6yXMZaFkWEjIZHDwqv/zDj6gpxdBTdbEcf5dUwsBF
         5AUP7Pzvik7yhsizC+sXmAlXNYxvTTh7XXeFLmYrnyYBhmmZf9c4NPkFsswJs/Q34fgI
         NoCBrajvJ2Zarwh0PQu4HhmkX64eIm1hpioVHbkSNQBZbzMSRNMIrdhhHO7qFsjIwwHp
         rjEMTjGoI7pnmGNQ1GJT6KZpK319iYA9xdVkx3+yfEiSXgfEdj7pyM9WnZz65xAFGhk+
         AM5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJM7YHov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26-20020a05620a151a00b007582117618fsi6580132qkk.359.2023.05.30.08.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJM7YHov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q417S-00050r-3u; Tue, 30 May 2023 11:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q417Q-0004uT-HK
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:18:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q417N-0007O9-6J
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:18:40 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso8285469a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685459915; x=1688051915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tVORMHIcX6LuKdvbuhlEaqupobkYB9pBO6CCzD1eKNs=;
 b=HJM7YHov1KXF8blUZzHKAmJQ5ypZdpuCsqyOlRvX/Hoy7FV0CiupsP/b5wg2Mii9uD
 3keiKsMaME1qxDf8ka3WOxhFYdeKqewLgMoZfEcsfC33CxR4WSTDIxGOmn+ajk9nCq0S
 VwhT8X1mwnpsz+BC2tktQpcUAVeSKAW5h+VqpiwJsJiLZ5EDi0xzlmHKYzrZbgG+Yx0R
 QOVdDP8yYGfnA9M7/UtmcQHqfU+/YiU25FOxmlH5+bTf6BZ9Vg/hGPO04z6xx/DgdSCu
 8ttiklK7CBYIRiUFj80k8yFo21fSXUrI6tVs3ujkMCXjpaikoqogvZjSF5iSxd3dU3AV
 6NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685459915; x=1688051915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tVORMHIcX6LuKdvbuhlEaqupobkYB9pBO6CCzD1eKNs=;
 b=Umw2rXnhWeJO3mofXg7IImbvQj6b270oPzX/sNzkho4s22d/cCWl7ftzXfMMpK+H1H
 VAMB0/HVam0YmNmF1/tNio6hx2b2AFAt4/mJhjsoObOBVwXZ03wiu6i254QK041SlHW2
 kLE26zLJ56zzfMjK6u4QtUj5uu9/SyrzcT0+bmiHCLoj4GTox3dt4b2452lYl0FJNdql
 +Qug3Do7bFVs3kevW0VtSWCt8IGgByPp5pMjjzJQKr9ytBOOR7wBLUemsuQWQwZAftt9
 n/o+upzjJPE3k26seiqw5c+9ehkFcQWNS0SwsxRIqKMYMwR8Vpx6y+boIKERqIiAoqxT
 GTow==
X-Gm-Message-State: AC+VfDwg5e/boCJ5fzMWDW73kF1VHHHS+4ehLoj/3L3eHg+IYbJDVGJr
 mzEUB88jNCqZZ4qRfH8OKGsiNmJCZttSnRwxkvHynw==
X-Received: by 2002:aa7:d850:0:b0:514:9dd7:4bcc with SMTP id
 f16-20020aa7d850000000b005149dd74bccmr1811366eds.14.1685459915506; Tue, 30
 May 2023 08:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-3-richard.henderson@linaro.org>
 <CAFEAcA8E_wbiL=xxc=qzfbhBjTsGVxpMGYex_Ezsn_=47DJP3w@mail.gmail.com>
 <5192c74b-38fb-7f2e-7b27-58d210c1b087@linaro.org>
 <CAFEAcA8tPuFMz8BZ5P-SJS42q8E_TZ1_5DJL-0kOvzeT-Fymmw@mail.gmail.com>
 <a7ba5e1c-ca59-b114-229a-07930f6ba683@linaro.org>
 <CAFEAcA_BS4b1MR=7zwVXB+eTXcVc2QhvzcvsoQn9mZ-xeps41w@mail.gmail.com>
 <528627e2-f4d5-fd44-a57b-23b37ca79935@linaro.org>
In-Reply-To: <528627e2-f4d5-fd44-a57b-23b37ca79935@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:18:24 +0100
Message-ID: <CAFEAcA83A5Bj6SqcvXjEDtnCg2jdjAmM5zBhK8RDThoyyx31sw@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] accel/tcg: Fix check for page writeability in
 load_atomic16_or_exit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P87IWAaJC/11

On Tue, 30 May 2023 at 16:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/30/23 07:48, Peter Maydell wrote:
> > On Tue, 30 May 2023 at 15:29, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 5/30/23 07:06, Peter Maydell wrote:
> >>>> This is about falling through to the cmpxchg below: if !PAGE_WRITE_ORG, then the page is
> >>>> really not writable, we will SIGSEGV, and handle_sigsegv_accerr_write will kill the process.
> >>>
> >>> Right, but if !PAGE_WRITE_ORG then that implies also !PAGE_WRITE,
> >>> so we do that even without this change ?
> >>
> >> But !PAGE_WRITE does not imply !PAGE_WRITE_ORG.
> >
> > Hmm. In what situation do we mark a page writeable when the
> > guest didn't ask for it to be writeable ?
>
> I don't know -- it seems backward, I know.
>
> I *think* it's a race condition, where PAGE_WRITE changes.
> That's what the test case is trying to provoke, anyway.

That sounds like the theory I had earlier, that we
don't have the mmap lock, so the other thread can
get in and turn the RO-only-because-of-the-JIT page
back to RW, so we don't want to do the non-atomic
access for the "RO-only-because-of-JIT" cases.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
