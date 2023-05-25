Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp551451ejb;
        Thu, 25 May 2023 09:03:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JnX2EGp04TrfO8QdiP8VsAS3/ULyTZv2EFJRazzgG5s58CS4xxuiY37F8ktPQ0dciG4/g
X-Received: by 2002:a05:6214:252d:b0:579:5dbc:ab6e with SMTP id gg13-20020a056214252d00b005795dbcab6emr2082958qvb.3.1685030636752;
        Thu, 25 May 2023 09:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685030636; cv=none;
        d=google.com; s=arc-20160816;
        b=FZnCHKE2hu4InuQonV2VtVKG3NWWDEKgpKY5LfSYoNsx88ZP2dIL+pLYnm9Gml57QJ
         rBMghg7vCT3Go8xDvt44XFY6YunvDFQ201dpXgqBamR/dtQow3DgMLS8DR7gmEIQZ6it
         HptKqIoW2sPNQA+mksojz4Wj6X6x26xn/IixlJESWGqCnKO+DWysUTlgKutJGjPb3Ctx
         4g6P3K+lHKtvsECpoTnYjOLI033TpCZkDUQuSxYy1kAReTNPZGfu0LL5+05KpsvAtVQz
         60hf4IHCVzWCYrm8WDhtv0Fu6OgGuI0pNaYR/AOT+9itBvg5te+9bDcR0qg4xtTU9gtY
         xZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OmpLewKxfTHYmEpCTBYX85qQ15KnVmMlHVA/vC4rmlU=;
        b=F5BttiDxugeQ532uuihgI4Lx/8lH169N75mQPpBr0YYPTQk0g75RF8kZM9raASfaSC
         5kZT+Oh2LBuUQur2Hailoy//a+uv775rrYvXeVnx1YXdCnXR5Xx51lnRu1aruSxcEhvm
         0zvRuy4/X6QnurVwvtwHIy4gfXOzigIR/pO5NYKUSHImibU/hL6IGFxohudabHogf8BQ
         k3CKwZuoJtAgRBcRyRIBonnyDF5bbKa1KNAh9VLlN4/3H3nqA93K065cGJgFjzLQ2L/Z
         hnvvTehw555e0leFfOJ5/a9JXRX1QFCCORZGCtmn5coLGrW8HQSaIObJPp6/Amn1erRr
         RdsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Am6rbaKO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo15-20020ad4594f000000b005cea8d1ce9dsi589038qvb.310.2023.05.25.09.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 09:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Am6rbaKO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q2DR9-0005Wv-S4; Thu, 25 May 2023 12:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1q2DR7-0005Ui-TW; Thu, 25 May 2023 12:03:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1q2DR1-0001PQ-GF; Thu, 25 May 2023 12:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OmpLewKxfTHYmEpCTBYX85qQ15KnVmMlHVA/vC4rmlU=; b=Am6rbaKOm0BMZtPByGGqKFip9e
 AVSKfqIgTjhElzRbMFegbRbUj4512e3Ofc65odk/EuVxFVg+Mv5Mb4tEyG2MWRC+6fywmIcSSllDV
 H3/+oSDkSaXO3oT/Aijp55xls7vtwAAJ2lfsjTyc0LuW9U1mYvJIJlyHn1NXw5YrA6gc+TmZJtQF8
 Ikf5Z/WGQijZpgwmg8i1zPb3SUZ+YHNmZpBnTcDqWqUcBEZ1uMEgD1BqURXk7rxLC/U6yLPvDKgOp
 WXuOS1PVkMwUgTubMVGai9TSZ7eJVcs8dpmdkbinap6ASWpZ7uNFhOjwbpZR0NhbNmiYKrwlQaadR
 lJMmJynUruO51Rw87bgKtHb7SC7zvbYZE/lLHpAWLszkXH1+HOhM7jNZEkw5utX8YCeVR8UvMmMYV
 B+tks20d7YiQ2hpXoNjy7UXaoDUzp5eRb8VE0QaXh4ybe0O1KM2xwyjY6u/MEEMHZHoZDBhQnLnKY
 Zu/fvOr+Pj8GMXnjF3U/izJR+aUSyqWwHW/I3DI3EJ+2TrjZaL040KlAOFcVdmY8CC5aHW/z9+EES
 WV1TWLkrg3VESg0zFVwZ7jpgf98+NkkB9s+EDUCVm7SY7O8Aq7pTg2IxiFLS6OIKNYOTWyzbhgK1M
 xc7YV17BJnR0Szi9NNCr/8GB+z9FNkElzTTHW7LK4=;
Received: from host86-130-37-216.range86-130.btcentralplus.com
 ([86.130.37.216] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1q2DQn-0002DC-GH; Thu, 25 May 2023 17:03:13 +0100
Message-ID: <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
Date: Thu, 25 May 2023 17:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230523195608.125820-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230523195608.125820-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.130.37.216
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 0/3] Trivial cleanups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f52yUc3bxUS0

On 23/05/2023 20:56, Bernhard Beschow wrote:

> This series:
> * Removes dead code from omap_uart and i82378
> * Resolves redundant code in the i8254 timer devices
> 
> v3:
> * Drop TYPE_ISA_PARALLEL since they became obsolete by
>    https://lore.kernel.org/qemu-devel/20230522115014.1110840-9-thuth@redhat.com/

Oh I didn't see that this had already been merged :/

It's not a reason to block this series, but I'd still like to see your changes to 
ParallelState and ISAParallelState merged separately since they are a better match 
for our QOM coding standards.

> v2:
> * Export ParallelState and ISAParallelState (Mark)
> 
> Testing done:
> * `make check`
> 
> Bernhard Beschow (3):
>    hw/timer/i8254_common: Share "iobase" property via base class
>    hw/arm/omap: Remove unused omap_uart_attach()
>    hw/isa/i82378: Remove unused "io" attribute
> 
>   include/hw/arm/omap.h   | 1 -
>   hw/char/omap_uart.c     | 9 ---------
>   hw/i386/kvm/i8254.c     | 1 -
>   hw/isa/i82378.c         | 1 -
>   hw/timer/i8254.c        | 6 ------
>   hw/timer/i8254_common.c | 6 ++++++
>   6 files changed, 6 insertions(+), 18 deletions(-)

Do we know who is going to pick up these series? I can send a PR if no-one minds?


ATB,

Mark.
