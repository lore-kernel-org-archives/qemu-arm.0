Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp386532lfg;
        Thu, 19 Aug 2021 07:35:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuhqXhpX/vO1XkIk8FLfn/DppvCP+o4p+YXsVXxqI0JPK/SsT0/WajAMy0IFKXR9QHKIXz
X-Received: by 2002:ab0:49a4:: with SMTP id e33mr11224609uad.12.1629383745964;
        Thu, 19 Aug 2021 07:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383745; cv=none;
        d=google.com; s=arc-20160816;
        b=oWrautjIyhMPKK+capXJ6xTfzKSPgSHnaSHM2MEnCsNn8lE+Awle6v01mw19LvMup6
         WJKVtJGg+elEJxic4gHbp8GlnKpjazRKpudW9n932pSXsgvxfHqQ1B9ZLetu98i4Nbvz
         b3OWbKakUpOfhG3BZkFkKiCv+50oE6kwc4vYkz9Toa0lYaJ0/2kRPABiTeB2MtyLhZLB
         mzgpgIjAEc1eE8ba6w7TqaRCGuhWpGi7g12X5jqOcpDFsvynrLrPZSyzQ3v4BF1fK6nZ
         94C47sD/+kDeG8XyJc+BgfA6ge2SoBrqZ2tlUnpo7amGInAhQRN6papFOZsmztmQC8yl
         ZIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IvQN0Tc6cPwNo9BrXAMN1aSviUPuEZ3mh7l4K8hxG+0=;
        b=LbzaKMdhyZ/xKISJZM0vjeiCvy6BjedsfYgPzwNcGcr1H8zxy80AW6PsMQkUWUynMv
         agmcJA2ZGW6OWMsfucHk4hwlo4qEnr1S6LD40B9VjhgG6bw1Csuv64ZLasrZjzQgyn+2
         qeV/FcW2BpNAu7FWHv5mu0yynihtFVx7rgWKxN8oeEvGL3E2AzgbiPEX0oFZoDv10MLo
         8zVPjS/sHiT1BWTXfznPnIbPDjodwx5cO9ShNRupZIGeueQRs1gmMcbX7+93FxEYO1RM
         vE4tSRpppejIxCFDhWdk54ykPilV4z6pSYplHKKLERUuLd8qzylOY0+Iq8pw4r2IqnpC
         HaVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r9qOcyAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si1902018vsr.379.2021.08.19.07.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r9qOcyAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGj8x-0006nF-RS
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGj8J-0005gB-5j
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:35:03 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGj8H-0001LI-9y
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:35:02 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gr13so13395650ejb.6
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IvQN0Tc6cPwNo9BrXAMN1aSviUPuEZ3mh7l4K8hxG+0=;
 b=r9qOcyAhQqKt/HltAHz/alxcZvFZrpuo8egWxaRjUeVOgKeZje5dMEFg4fZpTbrYsk
 XOjYTGBaXSqFRb1eyvD5MD2soByLxoy36VwFqwDmwbyJbP2aARAwJIxBnWEqM/LJDT53
 RWOsPlLC395NzWzh3T8r3SvRGIm4RoUcmtUJxG/3yZi+VbYslyGLUeRdxBPHTm8Xr/kP
 3PYMNjFuZUUTAKiwSMnHDlWLGgkDPCmPtC13v2MsFr2yPtGP6sdJ4icF5qYlFmMyZ7zY
 /fkaMbqPU5BCsd1fqrxfZkQE0QsMkGhO7rAJdtA1LG6xI4czJoA/JuNnv9jXubicVqaE
 Ok6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IvQN0Tc6cPwNo9BrXAMN1aSviUPuEZ3mh7l4K8hxG+0=;
 b=NlS4/e6jvTevmEx9Ad5QLLvVKbAyjjWy8O74QzFO788N7IhamXI3kg9WQAd2ZoA1vZ
 fQTAbFHrX3VRVwoJaf67wRJ7tdZ0AM0k/177ljvh/JM/XcbwTfKd2DmaxV8uSPaucA20
 QHh2tHtwlIQBB8U2tsXQ4uQhCx6G+mXjX1Y92ZRH62OQRjUGBrxBmGD9+fe3i0/+3A2a
 c5TD3fi6PeN/8tqnejLhS7OKikqSjPy+KmAXu6mrDD+bWBSmnQPTJiEqRmOJdtVLhjNX
 igrrhM36gG0I4Xje4Xs6XnIEEQAbpJJSrJ3QaD3fGOi3+5Th041i4dd+qaV5mb7+UP80
 MEVg==
X-Gm-Message-State: AOAM532stHUlCGcmTsr+P55r06ERNDUcaOrxKTPVd55084Pu+GlG/3tP
 TEoVboJnOB6JnHkHrHFH9fkMr7THIAUHoVZJZn+N73Yf6eQ8Zg==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16508294ejn.56.1629383699124; 
 Thu, 19 Aug 2021 07:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-7-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:34:12 +0100
Message-ID: <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +D2YbcV9y3Ik

On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We already have a global AddressSpace created along with the
> global get_system_memory(): address_space_memory. Return it
> directly instead of creating the same AS with a different name.
>

> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 16a2b518d8d..e4506b5a0d5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2941,6 +2941,10 @@ AddressSpace *address_space_create(MemoryRegion *r=
oot, const char *name)
>  {
>      AddressSpace *as;
>
> +    if (root =3D=3D get_system_memory()) {
> +        return &address_space_memory;
> +    }

But most ASes aren't set up with address_space_create().
This doesn't do anything for the common case where the
AS is initialized with address_space_init().

This also seems to me to be the tail wagging the dog. If we think
'info mtree' has too much duplicate information (which it certainly
does) then we should make mtree_info() smarter about reducing that
duplication. Off the top of my head, we could change the code that
prints ASes to do something like:

   hashtable =3D an empty hashtable;
   QEMU_FOREACH(as, ...) {
       qemu_printf("address-space: %s\n", as->name);
       name =3D lookup as->root in hashtable;
       if (name) {
           qemu_printf("...same as address-space %s\n", name);
           continue;
       }
       add (as->root, as->name) to hashtable;
       mtree_print_mr(as->root...);
       qemu_printf("\n");
   }

thanks
-- PMM
