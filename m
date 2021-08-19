Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp378334lfg;
        Thu, 19 Aug 2021 07:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvmaXP99gaDmoPb4YYJ63gMWvNP3ZRy5d5PLOhww0MW7dYIf4ChUjbaV2LliAehA2nSkXm
X-Received: by 2002:a67:db0c:: with SMTP id z12mr10168701vsj.21.1629383200525;
        Thu, 19 Aug 2021 07:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383200; cv=none;
        d=google.com; s=arc-20160816;
        b=0pZ0RxCbsFs1l7gvhYOQf4UHNIaFtMM3c+lLtWuARmZunTTqFHLo5nW4Y8VDil0KOc
         LNJ9YxDVLnCKuf4y/lSbi8X78ifhlepLbemvQze6ss+jX3ceuOuUWOZbZSdBX//bG0zo
         kZUDPMSz8m8NXpEwRcwCPnX0gl2pjCBz8NTo2MK0CXUPBAIqGyRhVS6mcBR3myrfoaD+
         9yUP1fxZ9StlWFi2CFrihsbj664+yejWrHAtW5A1KXh5KbvUsZIGc19BJ99kIEYF89IC
         d7PSDolOYa30fBf1d2StCWFVdB1fdiR9W9Q3Gv06GK9h1vXV+IZOC/8pRwJKJOsExmwJ
         d/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mIGQ8U8i786FR1zep7CevtxmuInig+PDTXfDMPlOvEA=;
        b=h6Wpp/toQBlscj+Nc/kpWey6Yy2AnMndsHTQ7dV5p9gATcXcCSoYtPVnFNyLM9siy2
         cfhOMA+q43mYgV9X/22shapSjNDk6YbYD5noInRNEfVTIWtBHt8XFTvD4n33+SedEraO
         aGbYD6nKldRsghdWeqJrXn5hOFFeQR3GZUT1CTqAUVJ5aO2LQ9wH1vnPg75xGZ2IBLyU
         pFessAyVZud3RWqTh7QnEF9wmA3vXgMSV5E7853xnnp02WnFSL2LNCkBjzug9crmHI5u
         oKe4By9CCbk9lyc2d1QBBGJynrJPx6XFQmujnQHiPN3Yr1eROmRtKv5r8tTpOi72dhn+
         nWJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gtyWdHMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si1768053vsh.9.2021.08.19.07.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gtyWdHMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGj0B-0007z1-Qa
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGixM-0001A8-5j
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:23:44 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGixK-0000JO-If
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:23:43 -0400
Received: by mail-ej1-x630.google.com with SMTP id d11so13275692eja.8
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mIGQ8U8i786FR1zep7CevtxmuInig+PDTXfDMPlOvEA=;
 b=gtyWdHMS7VtWCek66GvmBq4t6sHLW05ECmFn4aTzmxCOF+sC+ofphuEaDCtmHXJ1Mr
 tu5JtVWiIqdbeu1j/dAj2XCx+T/0zZ6Nk14hJg1xSSxv+YTpw0TOaCQLjq5/nplztA26
 ahX5fXLEuellvujHWzJCUC32QLpRF2lc3Ubo0Nsng9qjnlxiYbtxxtWlOQIC8uTKPGuN
 7rDyvV8FmIQKvRilSHC9GJXbLCAq8v5H01JYDeFpmSaQt5ZD3A/xBka8BaxRbqxoFX0d
 Tz/qVxp4RXitkjjY2t7bEr9D+FcZYuCflL00YXHgHg/RhBclf4pghJlv5c7NXAzxD9ZN
 tv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mIGQ8U8i786FR1zep7CevtxmuInig+PDTXfDMPlOvEA=;
 b=pEmfZHNcJf+7geQJKKZQVfyACJ9LWY6zglF13eK+5V3WPDm8vpac0MGe2Hl6qv6vFl
 NrK4n4hAkurtvOWMSKC/52iS2jNpQAyNe75Iu1zBBDgFf4pHiBQPoaTSSDDtr/pGLT9v
 lwMcqtRBttjf27GO243j6u+op80rzXGl23QoR5n8OW/TyEc4SFoCFeWIDUTQB4L/2Nzv
 BGyisc4Jx+Kcb8BZtPc+COV00K+LmQRLVFQsnc5u7gib8obGgBdA3JAuTeHMiB+r8++N
 BRokCBxQ8rgLv0OMVcWMzoTfMUzVh8c+n1PzWHTkUASC1jyCO7SC2Zib4dQJwG+m8rTz
 l09Q==
X-Gm-Message-State: AOAM530vpF/JS36lzNGMnbBmQQyRrZe5wXZfzxlu96NE5BVUH6axupgx
 NmhxxksZ7J6YqaZ4VknJW9qUIG3CAGHgOBNR/kJU9g==
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr16276572ejz.250.1629383021060; 
 Thu, 19 Aug 2021 07:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-5-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:22:54 +0100
Message-ID: <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: Lp679eAlvuet

On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Replace g_malloc0() + address_space_init() by address_space_create().
> Release the resource in DeviceUnrealize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
>  hw/dma/xlnx_csu_dma.c |  9 ++-------
>  2 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index fa38a556341..9f6b3fa47c6 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error **=
errp)
>          };
>      }
>
> -    if (s->dma_mr) {
> -        s->dma_as =3D g_malloc0(sizeof(AddressSpace));
> -        address_space_init(s->dma_as, s->dma_mr, NULL);
> -    } else {
> -        s->dma_as =3D &address_space_memory;
> -    }
> +    s->dma_as =3D address_space_create(s->dma_mr ?: get_system_memory(),=
 NULL);
>      s->attr =3D MEMTXATTRS_UNSPECIFIED;
>  }

Why are these devices doing a heap allocation rather than
having an AddressSpace whatever field in their device struct ?

thanks
-- PMM
