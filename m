Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2077293lfb;
        Tue, 20 Apr 2021 05:38:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk3gRK9TttDQrC7iveCxY8HDQtWVRgJlkCRnin0vIdjmvFFBLR9EZggCllQ4eXfkzKpmuv
X-Received: by 2002:a67:fbd5:: with SMTP id o21mr18826057vsr.41.1618922311201;
        Tue, 20 Apr 2021 05:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618922311; cv=none;
        d=google.com; s=arc-20160816;
        b=AAQ/bxEt+Yi7eWSv3iY8Be4ugOsaedUhBDIRPaO+geZidOi5r4O2xDqwk9yw9c9dmS
         y3F36knbRynKzE6B3cgnFKvrUuAY1RN5/Mwsmz5Iuxvc9xfT+pHocPL7GFghobQj+8Wi
         B/l02og4/LNzyQFKhVKBTOCpgnwhdiCoNGt0X4HfBAYeIj3UQCztyNzBUypghjVQR49Q
         XvelDoMIg2CBmQImxUbp2pfGi5ME1jK+7lF7YQcr/z6Y7h00EWsDIXeIRaGBf5t2FkaS
         hRbB6uhELLf/NS0aC2ae7YyGa55FyBu/3G/aOXVeeF4dfFd4iUvIKpdpXiy1nAuZdJUr
         2erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4QLJ/taxcevY56Ez95Fms1Q2DF1IqZzpUnk4oTbP87M=;
        b=jqD2PC3Jz9hW0zk+Y0yU02NyEZD5lLBzDqBFgsyhAKmQpxhXJjqGRHjx15ZLcPkn7v
         MFOKKV04MUiLs86khtIJHUNdhWmZIktumUlHXHtLljScCqAJV7Tnkkk5zXFykHGbOHGp
         n97D+zm2yhxbINf+bCXRS2O+Lfi1Pk9y1NkHvtyGy2k60AGYgCNs5zz8qMyV/3nYUMhp
         Q3ZWVUEFx37cjtSqrrI0vH2vNz0E8hVgSGf36pfBXOVxEQfesRSzlWAGcUK0km/vLRjV
         Ko0ZneexVcEQdKkHS8KJTpMjgIhEnKQMjPQFmAF4Z9vnW99m+XgJ6rnggpMhRxnARpb4
         CLiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P4Utweq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si3375986vkb.77.2021.04.20.05.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 05:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P4Utweq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYpeA-0005ne-H9
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 08:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpdk-0005ZQ-N2
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:38:04 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpdh-00078C-2M
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:38:04 -0400
Received: by mail-ej1-x635.google.com with SMTP id w3so58072020ejc.4
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4QLJ/taxcevY56Ez95Fms1Q2DF1IqZzpUnk4oTbP87M=;
 b=P4Utweq2mRVynJF9qUoygoIZX/rIa53RZdKo9xHmE7vggkNi0uiMdU9ysUd27av1F7
 Q68CTPYPRouTtjSVlHj4grIlf4PUNSuQocMgbGcJAfA1HREfcPbZXTAnc2ErrEO+5s2m
 t+80fMQCcz2bJ5XfrZ5/Wxjbkpx3ei5WCzGSNVA7Fx+yS/AP5HiABqD1SZbkbZz5d8jh
 S4B/JVD5pl+h3dZJLqgfpIQv+nQsAxud4CO3bhKmjPjv2NqPkm6d2+ofEeWo5Y91JPjo
 CSWPKondPVS4SwY2VbonHlbHN9u/B9+HTH9xiyLC5YXimptESnOUjX3fZXDwAtQIBZNp
 o/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QLJ/taxcevY56Ez95Fms1Q2DF1IqZzpUnk4oTbP87M=;
 b=nlAkwUjQY6oBI+gnQXVM3vwcbeTLoG3oK6zfiNnIXYtmAC6uy2fSSVSVtxIwCMdFPl
 ZeNNBLt2Z3HlznBzq4rvvegazmf0maPm6/zRutn1iXLK08nTSq9djkd935vcBnlRch7F
 fRlStBzUrjHi5E7bV0AdMtspwRzTgK/hsZB/Ktw/E+9Y/OgLsrB3xooLL2RahrpD8o91
 1Ps5YBy5hodabvjsSF1JMLicq2h7G9cybt8EganMSa7u2Ahp+rGth8abs1cTWW/qG7wp
 e+oUalo5ddI7FvTGry1A8f6VbHUaqwenCjyqJuJw2A4hrT8OS3nb/cy2tarJAdZ2tQSj
 jOLA==
X-Gm-Message-State: AOAM532+73HWZf6QMUp33054vohCSNkGt2sC1hpeh/p4bskqth9+8wtc
 To4VUCwFg6t5MrnLT5+fe/T4wsADrguEUn5fA4nMuQ==
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr28127513eje.250.1618922279627; 
 Tue, 20 Apr 2021 05:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210331111900.118274-1-cohuck@redhat.com>
In-Reply-To: <20210331111900.118274-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 13:37:07 +0100
Message-ID: <CAFEAcA-Zt8U4mQmgjHiNDMUiH3tkVRKEtD-acW0rze1WYnmzKg@mail.gmail.com>
Subject: Re: [PATCH for-6.1] hw: add compat machines for 6.1
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SRh9pehFdFRp

On Wed, 31 Mar 2021 at 12:19, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Add 6.1 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  7 ++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 69 insertions(+), 6 deletions(-)

I have a pending patch for arm for 6.1 which will need to update
hw_compat_6_0[]. Does anybody mind if I take this patch via
target-arm.next, or do you already have it queued for s390?
(If so I'll just wait for it to hit master: the pending patch
I have is not urgent.)

thanks
-- PMM
