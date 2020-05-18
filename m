Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3164283lfb;
        Mon, 18 May 2020 09:01:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Rh2JLoJ4Ck64ORuuqnbWnGpN81YGavzkN/xMPM1AYeR0B1lG9KfX+tvHl9AZfvFkJIhL
X-Received: by 2002:aa7:c887:: with SMTP id p7mr14027823eds.269.1589817704796;
        Mon, 18 May 2020 09:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589817704; cv=none;
        d=google.com; s=arc-20160816;
        b=DfLvws1F9MLGi7aaRjXRRqnbR7RWfqvaKRjJJMUk28sgZ+18A6w5u7t/wcpHuEdRZ1
         /xXQglgpGc7XJOyGKxLbxgpYquw1a+7jU3l6JeTmPeBwbb7Yvc/I/lucjhrSlvC4wMan
         n8PiZCMyroqLxMtjrFTIdh8jqC/gLvSRNcypbjuCVBugnz0KXTOoVerJkajeCs6linKW
         weQ20R9A8c/wb+Pap871BO/q02GaZzGgvm3EySXCvGEPSKE7y6HRFLhNYLPL/iIUKjHe
         HHb0BfWLYEjw6T5nQi5M5SZ0tBk26BB4llwly6nIc3suFp9hMy81aLXwNIZ7YhCVpVTD
         XKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+Csgbxdb0qPLhWsI6+64x/kUGz0KGGbmksUNP6HDZ5k=;
        b=ybmbu0tpV8gBh7QfnTwp1EWs/J7gObjkI9xYb64heSpZVZBhRRELs33QgZhUXTL4Id
         +l34CavyAOU7GBKBBo+96pDKoXLC0z+o+RiVKG6uHFOBTXJWJ+ZN1vg87zyHHjsHMQwe
         iybTW+GJta8gO5sMjnUJdNpRDeVevs0mZy8iX8g/MHDyfm8le5+do66SsdPCcdix/4vt
         Uq7G/cMizXmMiGCB5koKwlsUZkKOqyj+QD/PPOMhjRSf/g8NXK/tnDN/mETH8DpAsAXq
         W8h/Bi2gPSmKxBROD6EH5gbOUDgOEltSx0RJXMsnzztBHO/5OCCFn32oTIZDS5OQuuEl
         s7Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXAc1gm8;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id x24si7191560ejc.301.2020.05.18.09.01.44;
        Mon, 18 May 2020 09:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXAc1gm8;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgERQBn (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 18 May 2020 12:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQBn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 18 May 2020 12:01:43 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C39C061A0C
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 09:01:41 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id a68so8458420otb.10
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+Csgbxdb0qPLhWsI6+64x/kUGz0KGGbmksUNP6HDZ5k=;
        b=TXAc1gm8E9fWfG1aZ5JEtdBX6ZKEIniB+udkwYEaE/7YZkLO32zNrFFiKGRfUuNqJl
         XYTGH9hVJPGhW9a1wTDYps+tFPe57gj666pce4XxQrmqZqXIe3EqTxydUWyHE2AlI9Ul
         0j7JLMnFOIZHMMap8Iud3NpHglttPrbWB6wieRAKJHXvX9jdspsUAZ7A0oTdUE9bRYy3
         /N6TuMsVnmKmwofQepGq5+kMT6I2aFQZ0RqHG2L7iDkwevY1vQqtQEBLPz3Y3IGaAL4/
         J2L1gx9EdF19viSo41SfCyUT0okLiH5HHIKFcYHrDyfy2IfHaXQ76pNB5zdlv4zOuRsC
         U35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Csgbxdb0qPLhWsI6+64x/kUGz0KGGbmksUNP6HDZ5k=;
        b=mOUuuLPYJB1TqDfRmp6u0qTHxpJwtFZv9JM2BT/955JopV3bdKR4ZVxMPkgnt0aqEQ
         P9MR1rTxXMXm/eDRiO7FGTv+B+2T5h/ec5MpB3pe54b/4tWAEHsgihcHKPwcEiMdqLcY
         5EmSFxugsazbLetAb0EG9iDAdeDrngMJS6AYkyJzK5JTvFW6jyCUlRcCMOs3WczBDpDG
         yWRFuBklr61nyxIAC2KVm+NUiDvOnyXEyE6+Ru9aOOf+pykTtHfzS9b5sS1TzONk9VtU
         VgtksVo2x6awUFu3l/X9m7mN9r36m1QpUWayoy+FphupgezKv8V7u4zf1Fn5gsdFLca1
         tSog==
X-Gm-Message-State: AOAM531wo/URPsyOxdZ+Ij2Zjbc+l+p6QRF4eCiWWhJEfQlrwTRA1Fb0
        qiNdAGTbMu8VodtMIHwyHv6Kp69vKS/7XpOQLn8haA==
X-Received: by 2002:a05:6830:158b:: with SMTP id i11mr3252405otr.135.1589817700265;
 Mon, 18 May 2020 09:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200518155308.15851-1-f4bug@amsat.org> <20200518155308.15851-7-f4bug@amsat.org>
In-Reply-To: <20200518155308.15851-7-f4bug@amsat.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 18 May 2020 17:01:28 +0100
Message-ID: <CAFEAcA8tGgyYgHXT5LVGz675JMq6VWR56H++XO5gtTrcaZiDQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] accel/kvm: Let KVM_EXIT_MMIO return error
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
X-TUID: 8oNj1eWUM8xA

On Mon, 18 May 2020 at 16:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Give the hypervisor a possibility to catch any error
> occuring during KVM_EXIT_MMIO.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because maybe we simply want to ignore this error instead

The "right" answer is that the kernel should enhance the KVM_EXIT_MMIO
API to allow userspace to say "sorry, you got a bus error on that
memory access the guest just tried" (which the kernel then has to
turn into an appropriate guest exception, or ignore, depending on
what the architecture requires.) You don't want to set ret to
non-zero here, because that will cause us to VM_STOP, and I
suspect that x86 at least is relying on the implict RAZ/WI
behaviour it currently gets.

thanks
-- PMM
