Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp379247lfg;
        Thu, 19 Aug 2021 07:27:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw97RmtQkhIfgojIKuip7vJJq7bD/ghh6rQ0IguF5trtSHh0Uf9p3Ary4go8mNSS1nMpqnb
X-Received: by 2002:a67:7104:: with SMTP id m4mr12750099vsc.44.1629383256497;
        Thu, 19 Aug 2021 07:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383256; cv=none;
        d=google.com; s=arc-20160816;
        b=KhK4sRqsF4B0PalhqiOVIKqwsLyZNcnOX++JCLuuT4hhwWPkSn822FI2YwsF7/muse
         y3JrQnnuN8vVGjUbXw/y871WGhgzLp44NNbkoW+s96qY79xc2O7m9/ZvgYRCdQBjPThv
         pLU1uEzUHopmH2136+vGt5yOlrX2M5w5mGp1vKwvgTlx9TXSiz6jwAGJXmR1cNgKAVfA
         zO3svTnPwHBLQ0wPDqN4KLPYABFjfSVcEZleLCn6SvNvXyZDrMpoIm2m6YG5yEbPYvv7
         5gFg0NUmNFXHZdgejeu1raWWbinO+drAWhZdewrAarj5ITTZnuNR5J1prT62rFVtaYPj
         EGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MxJZAmiRBKVITWDVgn/EujcjGVmHLC2dZigGtYB1+XU=;
        b=kjQDt32Jqt/EX6LVdC3IbaYWoVipDi6lCnlnH8fZVa+RFnv+UvoqyttyTjTzhnRuH8
         Z9Xv3Hg6KzXi3R1f2+Qn7UMseGoIrOfvIG2NrKa7dFhyCIbwX4/dUYEa2Gcr2sxNvdTT
         X5YWnjzoNmNTBREV4qxk0/fSRyONSWhmq/Uru/86XIFzRNJqfSyxG7c3dJiVOmKvX+ye
         3SStBxOFh4NAGKdkUAA5V7BcwXdD1aq3zVr/nWRBZ6D7V4UwFh8k0V1rA9H43zzCP1kd
         NVHemp6nNkby1UYMCulH3AkaE4Ua4qjqxnpvJb+njGwNdJJrpOJ2ns5cZL6hR0vJw6aM
         /elg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIiWpPQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si377028vsk.289.2021.08.19.07.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIiWpPQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGj15-0001j0-Rf
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiyD-00041X-UI
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:24:37 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiyC-00011N-9L
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:24:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lo4so13289508ejb.7
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MxJZAmiRBKVITWDVgn/EujcjGVmHLC2dZigGtYB1+XU=;
 b=iIiWpPQ6kV+71NimJKhX72o86BcdaxxR3UcGIlcD/396QWTeZD8AGFTRhIfmt7quhP
 7ya3X41p+q1IKKHzE9NR/6Mh3oS9AQAbKjIyGm9UrMlEb1AMisR3s5bKyzY/20PsP7fH
 6OpnADAMTCRb+DUSrFpd+uZcHi4QwCTEn0UlqLYDBrDFU53M7LwMH/OHzYrLBQq/OTkK
 mwHopJ/Z5PyJMaLK1XYiBTnCVvWbgc9IgWPFWAi1z+8ZV+BLDY5mINytP/igcd0IwGA3
 rppwucyt0qEFm7OtsLvOInKHol6Y27QhdjQf+jlWWEd6cUWgA44GRzPl0cMUb3qnE1nk
 m0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MxJZAmiRBKVITWDVgn/EujcjGVmHLC2dZigGtYB1+XU=;
 b=AtZzeP6oO0DtW3+YBIxlaCnwCrZe1SeFC+m0yuZlK9wfsCcKeQqmAa6908HeemD2lO
 oaPtG2lrHze96Z81zimBR90hb6nzsC3xRkQLmufOx4h72rWFowCE350DfxeLmXw3Y+ws
 WNbEyx2gUTDN4kbqGpWPRKf2Fi0lKR4av2lApBMN7Qt8UKoBprz88quHj45uYnMSb4wE
 vNxqlWOkiV7AYxeXVnhKrvcHOkxHyUp2UdC45sJw3e2bBYJuG1P50lrXARXZCe5Mq8cc
 z2o+NG0+ECEf05rdPjk890HPc5aJhKm2BkoB1D/tzKwoqLPKWYIq32oqj8VGqorCiXaQ
 gr2Q==
X-Gm-Message-State: AOAM531EPvhUtrqrjUL0V/WZZ8eW3xc0P5+QF0t89l5h34WiNTLYiMdH
 PYDrb6Z7EtplGyor0gc5SZw0TKDrJTddwie0dYiHMA==
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr16187591ejf.85.1629383074850; 
 Thu, 19 Aug 2021 07:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-2-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:23:48 +0100
Message-ID: <CAFEAcA96oX2__WnRe7Fa02sSVgRNn7UsZy8_VxGAZc9cZ9e45w@mail.gmail.com>
Subject: Re: [PATCH 1/6] memory: Do not increase refcount on global
 system_memory region
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: DJdLHB9K1CtW

On Thu, 19 Aug 2021 at 15:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> system_memory is statically allocated in memory_map_init()
> (softmmu/physmem.c) and is never destroyed. No need to
> increment its refcount.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  softmmu/memory.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..185f978c925 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -24,7 +24,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qom/object.h"
>  #include "trace.h"
> -
> +#include "exec/address-spaces.h"
>  #include "exec/memory-internal.h"
>  #include "exec/ram_addr.h"
>  #include "sysemu/kvm.h"
> @@ -2923,7 +2923,9 @@ void address_space_remove_listeners(AddressSpace *a=
s)
>
>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char=
 *name)
>  {
> -    memory_region_ref(root);
> +    if (root !=3D get_system_memory()) {
> +        memory_region_ref(root);
> +    }

...but there's no need to have an odd special in this code either,
is there? What harm does it do if the system memory MR has a lot of
references ?

-- PMM
