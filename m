Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp25874njb;
        Thu, 5 Dec 2024 02:48:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKqs3oYCGIiULY4l+ev3F8+woSGV7fN56EFOLlU6pkbYQ/X8m2zvSqL9WzHl9TTGBBeVb+Oq3O0Rnpdw==@linaro.org
X-Google-Smtp-Source: AGHT+IHkKV7pSymcQgQBZc8c3YXZI1iTgoqVqO1pb4F9QRNVhAdB7pS9luqszr06Q3qxIhgT6MrK
X-Received: by 2002:a05:6214:4001:b0:6d8:7eb9:9bd7 with SMTP id 6a1803df08f44-6d8b7434ec0mr111708376d6.43.1733395688310;
        Thu, 05 Dec 2024 02:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733395688; cv=none;
        d=google.com; s=arc-20240605;
        b=GZN3fKlNf8gp0LNfX2UTr6W3HCAqOmrqqWuF6yfNR/Vi8wL6kcHvPOwSu23bTQhaxK
         +PzKThrS0Wi4Gh6RiIyZ3p8sGVWb0y8RSEQrXRIBtunVXe8dUY+TnGL4Q1braqyhMpT4
         eOxIXJ9YQUPB6bpRhNpGpvKa2PkcpJkYRcWNXy5obrCr1DVqC2lHsT5FnX/++ZMbPw3K
         KgFfLZ/1r10ZpgP56q00qkJk37PjivCRfmMY5ImLbryMlYnc6GkxknsBIrKyAmUKZy5U
         CgRyHYGs0bsdb8qwTmZ2CVg1IFypJAE2wDMzV0EBnLJA7YvB6Y1FAlX/S3DnA+o2UfPP
         gN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4NH3Hzf0fTaq5sduurOl5BPeHl1c9YCnkktK6zCQQ2I=;
        fh=IsC1BVgh5XIKEVbNAfW3O34i4r/OfpHrSNrFPGgKQEc=;
        b=EXEsw25aIWr/yMH3qBzo0eFdeVyx0Fxz8Uwlx6pw8dxRvbk6fcgYm761EbRyMgU/s8
         hmGY2ocfQgt1ocwdsoBYm8T/yNbP+HAkQ1LQv/CpMfQQxY/zAjmn7l0qdtw/wfh5x4G7
         K+H5aNpbug9OHCgyQ9nX44y6gGYlU0ooANryoEsFnKd9VDKcBc44l+ytcX4WBjsImxie
         XvVvAnk6/sriDfOD9aM0Ch5ZTgZuHNE+NNlhzxRPpezvLAeKb+e+DKA10LExX6AMG6df
         Cx+56usKZIRIWtddYZEcZOHXpoU99kI3XuI/8JUGI0vj0AybqpF7c7fyLPsmzVKdtZf9
         ytFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xz64LB/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da69e555si13619746d6.143.2024.12.05.02.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 02:48:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xz64LB/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJ9OP-0002y2-7h; Thu, 05 Dec 2024 05:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJ9ON-0002x0-P2
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 05:47:31 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJ9OK-0005wf-Pw
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 05:47:31 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8e52so1163003a12.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 02:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733395646; x=1734000446; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NH3Hzf0fTaq5sduurOl5BPeHl1c9YCnkktK6zCQQ2I=;
 b=Xz64LB/yOjoAGE6Zwf56AYzJ2aYTo4j0ILN/DobEqiyN5TmFKSqgok4a05ePWNpz4f
 l81jTLmeXYV0OtvizUfAobJOAPZsAHp+tUPi5gfWUU57HsxuPAkSuHUF6XuwnVz9xThH
 Te7ghYuJHDBfRJmzVwtMSKlLBsb5vg7ZxMfSdDMlZW6EWXmjO/AYvqAZ366Y0nCaFslE
 h1z/5pUUb9hIRinf9FBWrreS7L0TI8PMA/v+MrrJee3yA59Slv9KlutUMcPlr5v5bd/F
 HDBEGxp8EDVSYrt0/vgcxiw9JwCl4cM0NXC+e/39JLwb8tJeFyv0xTlGiLHw1hfPZ3jF
 BnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733395646; x=1734000446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4NH3Hzf0fTaq5sduurOl5BPeHl1c9YCnkktK6zCQQ2I=;
 b=kej88KGcovW/5pqSW6vZuSK4mM5tG8i3XxXFZy2k/nAkbAFhNSp/VdiYVEF0JWcLeY
 wl3GiEg+dwtIasEuNm0BK+Xtc2OPrexg+JKx604mlhTpRuBnod50ibDCKdJsG1LZ9Kfx
 Ir+lHfQUPM5j9F+lRLGChGHk0Tdz/n0NUtinCYEquxkgkrINm+M2FuY89KuG+vBeUSx1
 UCWwsaobnp1LKTK2UPiohHUHn99V6sBuqhSo96QTdXSzCNyMGUPMbDMbZybKnhbNc2i/
 Lqv3SPk8CiwlDwFhL8WFsdvCJ7FvWM1tNJBC/7JpkpWBo32Af2Xfqe70ej1bum6ef647
 QGvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9B/EzpZlh6iPHwDho5jmDzPjRcv5hgq6kZiiF0xWFKksrgH5Awwy/5OXN6cDwed9ZPJ9jHMhPUQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNT+JKrPhXgqnpkruYtVclstPxiWcACKzgrK709OipHol09nwa
 OC3prpcap1MPWl8xpiK8Jk9Ax8ZqGQsBTWGAdXBCPbrg4BNkO2QUSuawKYKxootq5xJEmXsjYx8
 ZJMmIsVUcrpN50jrH0xUqT6QsCggn+oRjCUlgTA==
X-Gm-Gg: ASbGncvKD/o2sALQuCCVZqqY7dpKuvePAgUdozuggMcgW5i6JdWFMZhv8nMscTB/Q6J
 5QLEpJxK3KffEoLUBRbvpw9+TBtK7Ge7r
X-Received: by 2002:a05:6402:35c9:b0:5d0:ef55:8451 with SMTP id
 4fb4d7f45d1cf-5d10cb565dbmr10739933a12.8.1733395646283; Thu, 05 Dec 2024
 02:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20241204202602.58083-1-philmd@linaro.org>
 <20241204202602.58083-18-philmd@linaro.org>
In-Reply-To: <20241204202602.58083-18-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 10:47:15 +0000
Message-ID: <CAFEAcA8Y6PGOJvMwQKykD4jpDjnuVO61xNFQ4k5t=z5ULjv-oQ@mail.gmail.com>
Subject: Re: [PATCH 17/20] disas: Use cpu_datapath_is_big_endian()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anton Johansson <anjo@rev.ng>, Zhao Liu <zhao1.liu@intel.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, 
 qemu-riscv@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r2pnLTP9Fg9C

On Wed, 4 Dec 2024 at 20:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Rather that using the binary endianness, use the vCPU one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  disas/disas-common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/disas/disas-common.c b/disas/disas-common.c
> index 7377de0715c..ef91c43449e 100644
> --- a/disas/disas-common.c
> +++ b/disas/disas-common.c
> @@ -7,7 +7,6 @@
>  #include "disas/disas.h"
>  #include "disas/capstone.h"
>  #include "hw/core/cpu.h"
> -#include "exec/tswap.h"
>  #include "disas-internal.h"
>
>
> @@ -61,7 +60,7 @@ void disas_initialize_debug_target(CPUDebug *s, CPUStat=
e *cpu)
>
>      s->cpu =3D cpu;
>      s->info.print_address_func =3D print_address;
> -    if (qemu_binary_is_bigendian()) {
> +    if (cpu_datapath_is_big_endian(cpu)) {
>          s->info.endian =3D BFD_ENDIAN_BIG;
>      } else {
>          s->info.endian =3D  BFD_ENDIAN_LITTLE;
> --

This looks weird, but maybe that's just the function naming?
Instruction disassembly is instructions, not data, and the
endianness isn't necessarily the same (e.g. on Armv7 and later
instructions are always little-endian even when data is
big-endian.)

-- PMM
