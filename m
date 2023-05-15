Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6450843ejq;
        Mon, 15 May 2023 04:54:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mROphD0BOLy1JsbCFpBz7ybV+d4H1nLn0bPhQYUK9vCrVgQKsDAcgLzAWJjEnqy3yvrxU
X-Received: by 2002:ad4:5be5:0:b0:621:1de:4024 with SMTP id k5-20020ad45be5000000b0062101de4024mr53138115qvc.43.1684151683958;
        Mon, 15 May 2023 04:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684151683; cv=none;
        d=google.com; s=arc-20160816;
        b=Oue9yu/agBAZCTQlxWN+QktdkGH9xXQrMk1Ae0YTr+G7VbBKH+EpeSkg4SD/ok4gcJ
         hJaJQCyZmubB5uRfgEOophpHtvmJzFVpEWAMirK1a0QQlwyiRutq9TtG+pako+jitp8M
         6hiJAmSAG33ybXDmpnfWyAt8xY8oMC96AOlL4cVnrn9YLW5yvlRHvrISkB8c6A2PosiL
         MqsY6MTQRZ89IgNhPEoSAHqoomNdmaWwX6xlQ8cCpjHryZ7xxjied5JABVuidASgi6//
         jOrpxa2iKcgHorDX/rhq5IPYBTJx+yN5A6Iq11pd3+kXcXTEU5sAZsQ7zqMF+OCMZIlG
         EoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FvAESZF+lG8+10R09a8j0dn6TL6Y3U38pLmp3+1pcMc=;
        b=u/pl+E3olouGKcMeWcamjbcBC+YaevCTzKNp36brb72XKTuX2PIFbh70iARb0yIpCc
         9Zh4DzDNtC/WJYi7qE3zW+N4xbS6Vt+54RTlyCIcgqEefgMhm4d/ZIM3q0gwbvt20w9t
         5ZDgoC9XcB4MJNsMspVHNnguzGI+Ng5YfrkoA698FkhHQEVshzYS5JKdXFSLJ0ODTgUh
         9z0+QzNLYKTdOSQPJc0TPOd/Y/EFXNzLX6Y2T2f0aywwni2W9esyKxgUbOL44EGh7ZNv
         7W5Eeagw0iEntec1DUAyoFDeePMLHaKaK+ZS/2Ni+f31H5h62a9ht4UFYLs0bOx+zHVx
         mLLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pBhF2D+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020a056214040100b0061b6d63b1a3si9709295qvx.408.2023.05.15.04.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 04:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pBhF2D+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyWmX-0001pd-6c; Mon, 15 May 2023 07:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyWmW-0001pN-Ga
 for qemu-arm@nongnu.org; Mon, 15 May 2023 07:54:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyWmU-0001LN-UP
 for qemu-arm@nongnu.org; Mon, 15 May 2023 07:54:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50c8d87c775so17517511a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684151661; x=1686743661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvAESZF+lG8+10R09a8j0dn6TL6Y3U38pLmp3+1pcMc=;
 b=pBhF2D+WlfqUjAGPLInn62IsTjc8EPn/vLOhlU0Yw/lnym0ARc9Wwob3+t1QW2xdcU
 1HbEipMFqmRY39EAUA1NCt/s4k8bHXsmUDhZmX3gdmIFagbsB5a31YiY6Lu8C0WcQHZZ
 wmfrC62NACtflyG/ny35ln/DBvXKEH5AhcoFCLq2TqVntWwQyKlkwk9637pr5NcQ44nn
 A0vEouvDo72Ea9z/m9PWMsk4faGiS5iD56VWi6xfFIPd1hrvRhBvbdE6kZSKOGWG6iBq
 aodjKRsfPLrGaZaV+H0DPmTDrnkjoh1PydK+9LvF5bDw1fCanmRT95suxEfKD81NFHfO
 Uvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684151661; x=1686743661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvAESZF+lG8+10R09a8j0dn6TL6Y3U38pLmp3+1pcMc=;
 b=HsykIclxj9Xhw6+iUATIvOJEpfpXcobGMpKE67zFU2ufMTVmuM6IvDJR4pFCyyf4MZ
 /JpvvFYXTIf2qE8kJKb9/ZCgydOEHvBP1q2EBVv0tyy/45ZnuOyPqiGHh5W6dxd2eY0F
 IbIUhATEsefS/lpnTPwxzds8b3XW28iwqzSzx3GEGVFhA5fZm4ovhUkpFC6hYvU4NIVo
 a+k+W0XcdHPIVZBaxIltr51LE+1UDNoxEWWNdxT5FYYjTdAF1l5DhhuMz2c2hQZVIO4G
 b0U0tPEjVXcoFANnTmERJV0aeAVEutBcohIjOJdcndWJEnjKrXX93j8/LRtzxIzVn56T
 h4mQ==
X-Gm-Message-State: AC+VfDwlUE0JXoSK7vJfy+kK5l5gTso81bBg6ctqOXcmxRFN+MzeMddx
 sEWcxjfifr8/ezC14oiWbANnMmoPPrtiN4yjzVExoA==
X-Received: by 2002:aa7:d45a:0:b0:50b:c4fb:770f with SMTP id
 q26-20020aa7d45a000000b0050bc4fb770fmr23796026edr.34.1684151661319; Mon, 15
 May 2023 04:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
 <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
 <ZGIDg+8xIOGpTIO4@redhat.com>
 <wfky3jb2iuza4aom6si2jfkbgnjhalkpzmsc3x2ofjzilgtssw@ejwsuey3khif>
In-Reply-To: <wfky3jb2iuza4aom6si2jfkbgnjhalkpzmsc3x2ofjzilgtssw@ejwsuey3khif>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 12:54:10 +0100
Message-ID: <CAFEAcA_E4fUg_W9wCoZcwFR+vXCA0PPtxB5cmEFU9Jt5=zxGGg@mail.gmail.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J/swPKm3A9Lt

On Mon, 15 May 2023 at 11:54, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > > On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> > > > > Overall, IMHO, we should keep QXL restricted to as few build
> > > > > scenarios
> > > > > as possible. Given the status of SPICE, possibly we'll even want =
to
> > > > > deprecate it on x86 eventually, not add it to more arches.
> > > > >
> > > > > What are you seeing as the compelling use case that requires QXL =
to
> > > > > exist on aarch64 ?
> > >
> > > >    Thank you for your answer, it made me learn a lot. No use case, =
just
> > > > outside customer feedback on the ARM architecture qxl use has probl=
ems,
> > > > I compiled the community qemu, found that the default does not supp=
ort
> > > > qxl display, so the submitted enablement.
> > > >   I agree with you, please ignore this commit.
> > >
> > > I would still like to know why QXL isn't automatically
> > > enabled like every other PCI device...
> >
> > Historical reasons ?
>
> Yes.  Any display device with a pci memory bar is disabled on arm due
> to the caching problems.  So virtio-gpu is the best option available
> (and it IMHO still is, it works without strings attached).

They all still build as far as I can see: if you
run "qemu-system-aarch64 -device help" it lists cirrus-vga,
ati-vga, bochs-display and the rest. This is correct, too --
there's no reason to deny TCG users these devices just because
they don't work in KVM.

I'm not trying to recommend QXL particularly, I'm just
not clear (a) how technically we are arranging for it not
to be built just like any other PCI device (assuming Spice
support is present at all) or (b) whether we really want
it to not be the same as all the other available but not
necessarily recommended PCI devices. Plus however we decide
to do the Kconfig logic we should resolve the discrepancy
between what hw/i386/Kconfig does and what hw/mips/Kconfig does.
(I would tend to go for "if it can be made to work, have it
enabled, and let users decide what they want to use". We
have *lots* of things QEMU can do that are almost always
not the sensible choice...)

thanks
-- PMM
