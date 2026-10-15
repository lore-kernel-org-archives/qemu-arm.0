Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37204CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHLEA-00013c-A6; Thu, 15 Oct 2026 09:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHLE6-000121-CA
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:10:30 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHLE4-0003jk-6n
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:10:30 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-87ab6e5f91eso37506047b3.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 06:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792069826; cv=none;
 d=google.com; s=arc-20260327;
 b=WQ7v4tvm0iKpmMfHXx2meB1Cmr0zTiQiv5ftncPa/46d70SxJ89fVuBTzKFbZDVTtS
 uSf25e/XfcMDDs2Dx1bepBLvmVorUTo4e1jNKhrwqOF60H/iJRFDXy046IMzdf+BKCRo
 l2WF9JbXzE1NWhgoT5OXgbYr2zX9NCdu4AM/E8KwwEQrKfj4J8f+aULTyNUChm4Q1qpG
 NCwqFC2r+IhDTq8po3Tz/3DKR5e5F5U2LMzzK1GxNnfI53FiBLssbuLyuj1atf24ckGG
 sANZheaIUYU4vXOpGNVdK2huY2Ca1drZroUTjGq3l6BJSc4hERCvFBLI1j/TwROlxPQw
 nEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qyZitC/l/N/bC1ZhIb3barLRtVwsOcUSPxwAi3cmdR4=;
 fh=qfjTwMpczCBs8hZYIEw8p4Txaqd0XHlb1h07qEsVlIw=;
 b=cdgd0xbmQxV4N6OlLdB6Ddwjp6Wm3U5I0BZV6r+3Z3HFIp0nNDZBdjMD2qazNzzAc8
 uEuOclmtsqSp9Lcnlig3Gn6vJjEQrS1107h+H9PJu1J8+CMbp8OkwC2oQ1a7+rUzqctG
 ooYZQl1msbeOyp+GB/KPXqfLHM2QTkTYQi8Evcw5w77e3je9d/0eNN23LwnC1rX0q3JK
 rTGqpbRMkowp7w2cXRLzudpZWOekZhE2atLN7C5yQO94ePG4bK3BdT0gzr99Ppcxyv3C
 EADkvkWhL/C5m8O2ts8USFokDG9P5ajnO5Z/T9SDPBWdWGwJI+wHbOKJ6psOmy80h+PY
 IDUg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792069826; x=1792674626; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qyZitC/l/N/bC1ZhIb3barLRtVwsOcUSPxwAi3cmdR4=;
 b=RuaCnIHgNU2LtASHZ3NudwSRn89XK4rMKn/IsnIl7QeFI74moe5aq3tErMMj0EEBbK
 n0X/boaJCakiY4zU7v75+Y+Upl42LSYShtbqT5I7X20N8q43O/qy+F3wQ62+2l/3qIsf
 wFGscPkkV5EAKHtq8Rw0jt2ClGrDmkdvtwy44o+tGub8UDAq3BFKi/0acYENPp+DGIcY
 EVXSuJyPEWjS1UXr6zj08XixHZYDI0YhtUiTCybDlqIMBoS28v8iSzYz1Ary6BGWOCZx
 quHgMX9Pz6/Gebs7lPkyBkN4m0okhNsBAU4Wa1CeQKZEjUZrdoHYVqwgyEUn88IblAq/
 1RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792069826; x=1792674626;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qyZitC/l/N/bC1ZhIb3barLRtVwsOcUSPxwAi3cmdR4=;
 b=b9rjh+RWvLI8t00uioxlPdTYhIxN+/jAKhJH781v2c31m75leQM5yBZZasefmaMtS6
 Hjq+YdM+FZH4pxqm/qHKUCFE3Z4WGED6oWppAf+B09Z0FycK6sfOUvghZKXB8rbeVnwY
 IRutxhdLF/hC+HGfisZJn+Xyk9Y+f+Q2d/MKfZy9UD1rSiGzwB64F8GZ+nGMVJZp0Ovf
 Xd9twnj8M/CDAncU7oUt892ezsnGeyNRh4/EdrhHGsCpdkmMm4txdecqkKahFx8UBxLI
 J0sme47xLOBScLaoqwGotVuNBIvmxYRODeCE56puuiVnZ3ZEySTr2xkThSKWg/G10YAo
 Utvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVcbKtPdwXbtzWWGNf8FA/9d7aLkqSN8sUrJC5TJGrLikdRX3+CYeiINo47+zhiNlB6R4T5HOsDw==@nongnu.org
X-Gm-Message-State: AFq9FYLbGAfqVc+2Z19pGYQHlZs/ZSTiHxMZ9IsQfMDSqQGpJmPh61fz
 uWAqNImvi9IJmgOddmyzh2/F/z8xpQHOz3FIQjGtN2Y+7sOZ/qbnEWsFrkaGBPZzjamPUQv5h2c
 a9wis/j0p67KWQBR8qPK0rb4tk1Gj1dkyajXzP43wSc6JSlv5LQVyWf0=
X-Gm-Gg: AYBFou0wGAYRbVo+7SyBm3n8jxU5MGPJ5kecABDuvHwV3AN8sqq1w7ix1rBCPoxsJ3I
 Km6+b1I8O6njkyhAzyV8GATvTKWqF9/hTPS07ROQjIKXLJ8pYUX3TlscIQ0btblkdwHWW2m2qbX
 xRY4GFvpJg/SAXRvpziWTPJh1uLvGQQUbLT1UOtSsgUzicZLycPfOgvTkRmyF9CruvmP/jQRGVN
 r/vDVwP/QVWqlvAC4/z/6OZhReHlto7nKMHfeJ9VWqN65aa8VfwesHbN7R3eKhkxznxmlUTKuFL
 9zrA0n/fEuFY8LtiXADeUKt2ljHeqTjdUgwwr5pPK7FqDcAkkabZiW/e12ZGgzNqAW9JJRMay1Z
 CjioGaReR/sjINpD4oODJv8G12GRgYXesf7IghAw=
X-Received: by 2002:a05:690c:d8c:b0:866:7724:3bcd with SMTP id
 00721157ae682-8b07ed1e667mr84520857b3.16.1792069826503; Thu, 15 Oct 2026
 06:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
 <20260923210956.52940-1-marcelomanzo@gmail.com>
In-Reply-To: <20260923210956.52940-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 14:10:14 +0100
X-Gm-Features: AclHuK-C8YX7MVoxjMcMUKV7nzmKM81fNjgM8uAnDYg3SCmj27FnJswyIckI5zg
Message-ID: <CAFEAcA--SNTzsha0GnKuL47gLy6RS3Df26TdAV7LR3hEiGR6DA@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/arm/raspi4b: RNG200 and thermal sensor
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 23 Sept 2026 at 22:09, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Hi Peter,
>
> Gentle ping on this one too -- it's been about eight weeks with no
> review yet. Happy to rebase/resend if anything's gone stale in the
> meantime, just let me know.

I'm afraid I have very little time for review of patchseries
which are board/SoC model these days, hence the delay. (If
anybody else cares to review series I'm happy to pick them up.)
Anyway, I reviewed this one; comments all minor, but it doesn't
apply to current head-of-git so will want a rebase I guess.

thanks
-- PMM

