Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2748060ejs;
        Tue, 4 Jun 2024 00:01:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9PuqS42Tr06+Rdhhrqyukd1ABrJXVzjBLHKDcwxhwGNa6Nyblzd38VY+mCcpjAzC1iNyGY9Xqb4DDhsWV6G+q0Oe4I7zx
X-Google-Smtp-Source: AGHT+IFU0yKAeWBr+I9UG52zlN0GKfhTNhuxlMXlTrqqry566sTL9XalmxxgGj2KoOoDtkrYTHvJ
X-Received: by 2002:a05:6871:289b:b0:24f:cb66:3eae with SMTP id 586e51a60fabf-2508be172bcmr13259420fac.1.1717484506920;
        Tue, 04 Jun 2024 00:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717484506; cv=none;
        d=google.com; s=arc-20160816;
        b=UQJRCryQyo8JcWfZQU4g+RH0gFrBZ8VoRI3q+IauMvRLEa9E2oUBGBNcUd9tWhTUuo
         nM+ws+Y4XydTKyDvFiW/iltAxlRJ42LEyh4wIyk9Iy8sm4ICVpRXq1rZen/LuYD7rY1v
         UqzaR0M+/ey0ZqPc0A8SoGoAC57ky0+1KMXTD78RWFvbtXzOpfy20JUkWuaALfKF0iqV
         JgTxiogqCy+mYE0Y6N8vUCjHMNOlb1Y/EPhedRauP7JlaDfmWvCjowDTYeLbrTrsjSAv
         EAQu47S3LEQgPnUZxbzomkbf5NZlIfGEnxwK8GkobFGn3Y6dQM1J0b69GPXt8AvfOFUH
         I8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=DiU0YKK7Q5ypPT4YZX1jyasIzmH7VE8jWS1mXL4ANBg=;
        fh=1uyUZMGRcib4dPcYzw6rmRnQUmOuZgcmC+mUZX4+rPA=;
        b=mF9DvPGc0MS2i+No+eSKSFlIGR6pMovr1ijcHIvGonvLZ0YlgR8heswc7GKwzJZO+S
         jEX0PNxnJziCgSmQehfQ6VqHwjpkxonWC/dmZLqVXBSF46eqjkXodj6X0m3S+qGwKKK+
         aODgRS9EBRw6ww2xWseu6gLjwK8W7ATr8CpYUd47f1NnDU4Gs9jJnu+HYEIw59IwCSJN
         rRRBMCbiD3rPwkAbgpLA1waNv96/iOhXZZc7m83f9fjer6PBE59W4ltg6GjCdnbFbhW7
         qhbgZOjfqqI1u3rpt8m5SkUnW9Pct7iSusGdsN0jayu7bwSMdvQSbXRiVvy0On8YDmTu
         DSJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=hDX4iQuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f3062d4dsi211213485a.274.2024.06.04.00.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=hDX4iQuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOAr-0007X0-2d; Tue, 04 Jun 2024 03:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEOAp-0007PV-5e
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:01:35 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEOAn-0005pQ-Eq
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:01:34 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52b92e73e2fso3310498e87.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717484491; x=1718089291; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiU0YKK7Q5ypPT4YZX1jyasIzmH7VE8jWS1mXL4ANBg=;
 b=hDX4iQuUl59fX0lHxiaedC9GWzrJEgef4uD3q9Uq837UiXKT46xkeU9Df1utg1o7OC
 CSMbTyXadP59+Wt8JZaqAwUGRKv7FV+Cj3sh/W3LIfrU0VJZRt5kYzNIySB+Zmihpnk0
 07ouMjP9cWNily0xwITQZku8lPSu7TLa2QLbFl12repoPz5XEykrfBhTc5buxIeBJnaQ
 Amqprt3foSpM/4NVFkFB3c3iBjZpSDw0QMCweGFrhwk00zvKtfJIv2Hr/Ecf+axiQQ3t
 tPO+v/J067SNbHDePu9JtXWA+DVYEl8JfrF82pKzRLGJwbSRUneZiS4l24MzWX5JKOlC
 KkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717484491; x=1718089291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DiU0YKK7Q5ypPT4YZX1jyasIzmH7VE8jWS1mXL4ANBg=;
 b=UPzXGDZ4UrSARdAx7AHMcavVzSZ2JGrN5XSFn2ovQLeu0L2e7d/dN9J9BtsxdVBPC9
 55VgvlV1t9wreFPxc5BIIzk8TNW4dvEkusiduq0X92iLWWF84L0Xf1P+QpNCLn4x0JQm
 8rKJ9WjJ5JVKCfgaEzAr6toCTfjopwd3oXMBVRzpCXB6AYWPjbC8R42xBSPqtD6AF4X2
 u0XN/y7JV3pQZ+PxR7hQtkmDBjYBTtgd+mYA0BZt43sewJCewRJYhTUD9Z86O1p+pVNu
 Ew/hn7LCR7Rpq9/+wWsuUwJziDAoRSK7/qm2ikDaaA32sIxlI+u6vXuzaX9TCbhclrbi
 Ldbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEAqBQ0J+owumSgfMbUYMjcaVv/doIgNstcrcSialgyXNrR6t8MU8ciTjsAoWW6PZDb0H3dReweoRBs+obzSlb2XFD
X-Gm-Message-State: AOJu0Yzg2QEaIrihu7fc54o560eKmfST7P9/A7gzZbmWFVV31V3OxFLf
 qA2Rkh1nZadSklEdt3wBBZ/YO61+w8fNgSkVTG3KmEacKViTBdO4qzJL+jxijqE=
X-Received: by 2002:a05:6512:2308:b0:523:99a4:a187 with SMTP id
 2adb3069b0e04-52ba858c5f3mr161566e87.26.1717484491673; 
 Tue, 04 Jun 2024 00:01:31 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d34addsm1434175e87.27.2024.06.04.00.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 00:01:31 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so45086701fa.0; 
 Tue, 04 Jun 2024 00:01:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDIUQNS5lRFJJvYKomnZie3FeDK1ENR9Ua/i461z/E/VB29Dw+y97rT10d/eh8ReK7dOhx6P8yq4Dy8J+qWWqrRhsqzOT2s9ehsD3L0RnjKBX7PjJjSaCBIZ4=
X-Received: by 2002:a2e:7d19:0:b0:2ea:75c5:69cb with SMTP id
 38308e7fff4ca-2ea9510daa9mr61174501fa.27.1717484489907; Tue, 04 Jun 2024
 00:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240603055248.3928469-1-fea.wang@sifive.com>
 <20240603055248.3928469-4-fea.wang@sifive.com>
In-Reply-To: <20240603055248.3928469-4-fea.wang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 4 Jun 2024 15:01:18 +0800
X-Gmail-Original-Message-ID: <CANzO1D2yBbu1hWD3AqTJkNQoN_OZdeWhn4HP8O0Am0xFS=RBfQ@mail.gmail.com>
Message-ID: <CANzO1D2yBbu1hWD3AqTJkNQoN_OZdeWhn4HP8O0Am0xFS=RBfQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/dma: Add a trace log for a description loading
 failure
To: "Fea.Wang" <fea.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x134.google.com
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
X-TUID: gPeX/GvJlq5w

Reviewed-by: Frank Chang <frank.chang@sifive.com>

Fea.Wang <fea.wang@sifive.com> =E6=96=BC 2024=E5=B9=B46=E6=9C=883=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Due to a description loading failure, adding a trace log makes observing
> the DMA behavior easy.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> ---
>  hw/dma/trace-events    | 3 +++
>  hw/dma/xilinx_axidma.c | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/dma/trace-events b/hw/dma/trace-events
> index 3c47df54e4..95db083be4 100644
> --- a/hw/dma/trace-events
> +++ b/hw/dma/trace-events
> @@ -44,3 +44,6 @@ pl330_debug_exec_stall(void) "stall of debug instructio=
n not implemented"
>  pl330_iomem_write(uint32_t offset, uint32_t value) "addr: 0x%08"PRIx32" =
data: 0x%08"PRIx32
>  pl330_iomem_write_clr(int i) "event interrupt lowered %d"
>  pl330_iomem_read(uint32_t addr, uint32_t data) "addr: 0x%08"PRIx32" data=
: 0x%08"PRIx32
> +
> +# xilinx_axidma.c
> +xilinx_axidma_loading_desc_fail(uint32_t res) "error:%d"
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index b8ab5a423d..1bbb9d6c4c 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -36,6 +36,7 @@
>  #include "sysemu/dma.h"
>  #include "hw/stream.h"
>  #include "qom/object.h"
> +#include "trace.h"
>
>  #define D(x)
>
> @@ -200,6 +201,8 @@ static MemTxResult stream_desc_load(struct Stream *s,=
 hwaddr addr)
>                                              addr, MEMTXATTRS_UNSPECIFIED=
,
>                                              d, sizeof *d);
>      if (result !=3D MEMTX_OK) {
> +        trace_xilinx_axidma_loading_desc_fail(result);
> +
>          s->regs[R_DMACR] &=3D ~DMACR_RUNSTOP;
>          s->regs[R_DMASR] |=3D DMASR_HALTED;
>          s->regs[R_DMASR] |=3D DMASR_SLVERR;
> --
> 2.34.1
>
>
