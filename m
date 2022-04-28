Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1699936lfu;
        Thu, 28 Apr 2022 05:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZyhuN5JuhvT7ukGt6VvEUPqGAHO6dgHZVzL+ZkdGTRGuxk4qXqB+2K6ZV7+uclDLQrdUd
X-Received: by 2002:a05:6214:766:b0:456:5223:7bdc with SMTP id f6-20020a056214076600b0045652237bdcmr5353391qvz.14.1651149799558;
        Thu, 28 Apr 2022 05:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651149799; cv=none;
        d=google.com; s=arc-20160816;
        b=EvecAwJ5OIPxSc6Y9NmFRHsL4OVOwPNH0AsbeT5aEc3f20BzLotXEozrSGcwu2luNx
         yHMwXRiR8PBmIuofG7MiXdYQAdbV2CJvfe2NXQUrToxv77n1IBHafwfnJFF0ZUGtqTee
         tUZslH8/+uNBLjjZy+UlK60dBxeICXj2wMgTiUEaa3Ry0q6RboGbjyuLyTtSnDkxR333
         ynjyII6VKPIF+q7pJ05rmr+XmwemvvJHFUubA1Krj1/7w4MLUh7xCr4AH7NiTzFSbXIp
         WwI59p/1UyfdCjKP2dkaRWb5vrvbffwXdNz7mYhTnUVe0BJEZgQBaLlG8oGqNYqbNEs8
         HZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hy0RUJIKH5olUHplseJrgD3zDDmRFDcNGkKxavbE8nU=;
        b=oO8S11YiYiXhjwDoqtplXi1ymeexRz42QWZ36VUTuRKa01i/HEL+Pro5HVqsXqmor2
         QTNBghx/CpfjFCYjHQV+4WjHSlSxisdUaAldBy6Om6DHMaLk6dP2pfeeTZ81P7UJYT2X
         P8V6LnvgDbceUN68j90GmSP+CA40imDR7GvgshmUF0XD8J16e7FVFCa9IArUN57X3sif
         WjbinxVYNuF4R7hgMuzzErRJwse78D5g/f3FlGwBHj5Fpw0FbTxMFnyJWh8f/kUNCemt
         srddzpl3wKFcSOcd4dqetj1gOHmRRIzNf3Qml5xbphwMQWxca3z9z0qiz1y+lxyVyl6p
         o6Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A+wadCvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs34-20020a05620a472200b0069e891e663esi1710129qkb.80.2022.04.28.05.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 05:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A+wadCvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk3UN-0002a7-0I
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 08:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3S1-00005P-NX
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:40:54 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Rz-0007b0-AQ
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:40:52 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7c424c66cso51648587b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hy0RUJIKH5olUHplseJrgD3zDDmRFDcNGkKxavbE8nU=;
 b=A+wadCvUKma2+aTaw+iwbhupdI+UvnOVbSjE6oN2sN/hoEzNBGW1UK8SpE6iDI9vzh
 G8TPL37Cca11GX4DFG/IB0iFGm2Il8sCuWBZjdkBRCW5vW00zrecYwEYrP23sPXtaCgf
 ZxD/JVVz/zYlFYXQoICzYcOeULor/laY9Nj4ZdM2QRxRWohcvjCXe1/Y5Qx+MSRtdF5z
 7mPu5UkoIv97KU5VQlo4/env2WaGvTBz503i09mxMlFONAxhcKVfFasvxRNcHUaKa5rx
 2zSnjBPDbFEBmgzC+WsPluJyIHb2ez+HIOatMoNVtQ+nv6JMazsOr+YGBfVD8gPhZT7h
 VZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hy0RUJIKH5olUHplseJrgD3zDDmRFDcNGkKxavbE8nU=;
 b=3vRezuJQX36+CfxcVJX7KP1mjzKQ7XorPbl/E7NYoN6jL1dokKpzHOQvKsQj3s80ry
 R7+a5YY5Z3Kodxe1V7ZFSAof5Gx2w6lMzzXSG2osJ8usoirr4xQagaMNUNPF4tEh0ivP
 qadoI8/cW7PB3aU9L296/Juk+kjw8JGq35d6fBPLcerxuDXgciogl50dO/rbX0VppUi6
 pU+sDKhORarIKyHcyXIJ4gfq3JjhtwAZ1LjZwItmFdrZIWqOR+VgTXI7FVtsCLjJ1Gjg
 3DfeIFpsxK7ANXeMOb6Oke7JHGpEQOfH/X8R8MEhaRbCmaeuqzIKE05hsZlhxjlJWTmb
 cOBg==
X-Gm-Message-State: AOAM533NJ/2/bC4cES8uhllQYfAfto8UXRXF/K2wRYXu/fW+p/+zK6bl
 m+dp33eLJoRYF7CO/XnbhEiFm+UshF9OpdaNn3pqtA==
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr31707903ywc.64.1651149649636; Thu, 28
 Apr 2022 05:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220427051926.295223-1-richard.henderson@linaro.org>
In-Reply-To: <20220427051926.295223-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:40:38 +0100
Message-ID: <CAFEAcA8UGvLKPj=5AgcfLp6C7TfSJRjR7ar9TOesHixj2VmBMw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use field names for accessing DBGWCRn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Chris Howard <cvz185@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 97LzRFwy3yXZ

On Wed, 27 Apr 2022 at 06:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While defining these names, use the correct field width of 5 not 4 for
> DBGWCR.MASK.  This typo prevented setting a watchpoint larger than 32k.
>
> Reported-by: Chris Howard <cvz185@web.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h    | 12 ++++++++++++
>  target/arm/debug_helper.c | 10 +++++-----
>  target/arm/helper.c       |  8 ++++----
>  target/arm/kvm64.c        | 14 +++++++-------
>  4 files changed, 28 insertions(+), 16 deletions(-)


Applied to target-arm.next, thanks.

-- PMM
