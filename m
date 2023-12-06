Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp548272ejb;
        Tue, 5 Dec 2023 16:17:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFQpWIF//cl3Vlo5e2wkN5ZOXS4mSTo8jeESsBrPStxW0ZdKqJRdcVlYxGNV4tdQJI7fDx
X-Received: by 2002:a05:6870:4724:b0:1fa:2fbc:59ab with SMTP id b36-20020a056870472400b001fa2fbc59abmr8829oaq.51.1701821840013;
        Tue, 05 Dec 2023 16:17:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701821839; cv=none;
        d=google.com; s=arc-20160816;
        b=m11nb3S233cd7xRqXzObq9MktKSrN8aT6SHwx4GVXndPeEuGAW9n4z/JDE+WhuH4wC
         JCEjtJLOFK8Wp960f2dFnbu3vvX49MPE3mAX0CH/N6JL1ARgUy2BHH7pNaHMSWrmxwGn
         uP1LOxPFaBIwzK9U13DUBQFfCliL/ab03B5Esf8wZyDfw8Uv+Pz5XSfSS1PBS0LN4ZPh
         5th3R41tY5y1/KIPnMeZA4MMmLifshZGD2UbBEYchbKOE1gPaTj24KzyBckasd5kI+BO
         OndmVor/LtKJbaR7ettb84rujEIh837YTNyWc26rEU/c/nzgyO5ZUiSg5OIRALW3gcn5
         LD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Oz8vm05NI6Iz3sES+BWF1x9oyxrk0h7YmaWZb+kkWfY=;
        fh=5toIyTGcO3oNm83lrr25BUJVXW2ql9uqfwVJwGG38Hk=;
        b=gdKSU4nBNqEIoORtSk4zyYFfgX9PxwWjL1dVRHLLjJcA4moZgLNSRnmC1wMdqsi+24
         qdVBRJAsCsMnmeWgtgQ4U+Q2RQc0oDGEUtcJYiposyushh4nlZtz7hngshU1+GBpHNAU
         IAIdzkGthjrYdQIKWer66gB0WIcX3GNLjzXRKVkH53PxR8dj8d2tk0mvBbut2R4ITr1d
         hYS1h2bE6K8R0cgMOGWDcm72CFWlHTfaIxRzoyjZ2MDKVfSwgySVO+cIus6An0+7GsLv
         /hMujTwUrOCJ9CIA3BxHSAEFzImJh1jYH2PtGlIyFl5CrR3dhbr1Dd56QZrzAUw/ZNvK
         2Daw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9Henz9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a056214020800b0067a49f7a0d5si13166478qvt.549.2023.12.05.16.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Dec 2023 16:17:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9Henz9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rAfbG-0004qj-UR; Tue, 05 Dec 2023 19:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfbE-0004q6-2y; Tue, 05 Dec 2023 19:17:12 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfb8-0006eH-Ih; Tue, 05 Dec 2023 19:17:11 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54c74b3cd4cso692137a12.1; 
 Tue, 05 Dec 2023 16:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701821824; x=1702426624; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oz8vm05NI6Iz3sES+BWF1x9oyxrk0h7YmaWZb+kkWfY=;
 b=S9Henz9bkC1c8mzqUvPuBhPrnIYAPGd8NUexOvkik4gwZp3/XOTef7yJri8Jqwnbrf
 D8OVDwBBKug7lXaAUlVB2RuYOi3Fk0NgprDugSO2xeikmt2/XOtu3PDpCtpazRWkORQw
 1YfKVny1rw0gVdsok9Kvyw1JkrT/iL1AdEWLgRf08ZyJCZi5m9J5xR0cfFdfX6aRf5AF
 WwHh7zTqi1B6F1tfi2ZW8pZ/y355ylDFBe9VtzhtKReBiKcz0GEkVo+VnTjIfnwbFR66
 Q68CPufzLf6FVwhScvjN00zMdNeJT1t0aNALPDrW5Clk/wgqPm7G9zOiX/8BNUDBAhTf
 0yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701821824; x=1702426624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oz8vm05NI6Iz3sES+BWF1x9oyxrk0h7YmaWZb+kkWfY=;
 b=cRr4iJ2aG8PKhR1XfH0LOqB+OWGWCaStydw0WbTiJWrrSl0mEEl9YBUOg5LDjE1Hkr
 DwJ83k3WSHzKhjYnBPgIu5hIaqKv9XgNoPdTloYyoUxEuc6keQatZwm/b6CmXbmTI/CU
 ql/381hWMjGXlxyCMH5TaV3L6Mrz6RiKfQtG+3KFUElJp7sBKRAzPfmY/09x0wBR/nkP
 fp/SgpuWOb0iEx0vD6WLeLZUC61+ehUohCfJoJXbQ8LofT6zn370rIke/DpE76GDSnGY
 7qKo8FaFwcJi5/ZhsfC8Cse8CAoy1cW7CaBVj95UwV3zg3P+L1t5LRAJ8BO6s7m5AEgW
 el2A==
X-Gm-Message-State: AOJu0YybRS1HZaJPlR8zE8bjyq+pJgRs0i+kGhyL/8HkIdUwY56XKZh3
 xkm4fFuK94GB4De0sWB74KEp5zqIX78IBUr6W5bD+RHQP7vhoQ==
X-Received: by 2002:a50:8e5c:0:b0:54c:b72b:93 with SMTP id
 28-20020a508e5c000000b0054cb72b0093mr40050edx.25.1701821824317; 
 Tue, 05 Dec 2023 16:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20231124143505.1493184-1-fkonrad@amd.com>
 <20231124143505.1493184-4-fkonrad@amd.com>
In-Reply-To: <20231124143505.1493184-4-fkonrad@amd.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:16:37 +1000
Message-ID: <CAKmqyKPKwEap=DZEza=GmeVTwoGMDW=CgQeToJUKr4Ny_F03Gg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/dma/xlnx_csu_dma: don't throw guest errors when
 stopping the SRC DMA
To: Frederic Konrad <fkonrad@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, francisco.iglesias@amd.com, 
 peter.maydell@linaro.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 luc.michel@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: VcjntJZiKXR2

On Sat, Nov 25, 2023 at 1:36=E2=80=AFAM Frederic Konrad <fkonrad@amd.com> w=
rote:
>
> UG1087 states for the source channel that: if SIZE is programmed to 0, an=
d the
> DMA is started, the interrupts DONE and MEM_DONE will be asserted.
>
> This implies that it is allowed for the guest to stop the source DMA by w=
riting
> a size of 0 to the SIZE register, so remove the LOG_GUEST_ERROR in that c=
ase.
>
> While at it remove the comment marking the SIZE register as write-only.
>
> See: https://docs.xilinx.com/r/en-US/ug1087-zynq-ultrascale-registers/CSU=
DMA_SRC_SIZE-CSUDMA-Register
>
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xlnx_csu_dma.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 531013f35a..bc1505aade 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -39,7 +39,7 @@
>  REG32(ADDR, 0x0)
>      FIELD(ADDR, ADDR, 2, 30) /* wo */
>  REG32(SIZE, 0x4)
> -    FIELD(SIZE, SIZE, 2, 27) /* wo */
> +    FIELD(SIZE, SIZE, 2, 27)
>      FIELD(SIZE, LAST_WORD, 0, 1) /* rw, only exists in SRC */
>  REG32(STATUS, 0x8)
>      FIELD(STATUS, DONE_CNT, 13, 3) /* wtc */
> @@ -335,10 +335,14 @@ static uint64_t addr_pre_write(RegisterInfo *reg, u=
int64_t val)
>  static uint64_t size_pre_write(RegisterInfo *reg, uint64_t val)
>  {
>      XlnxCSUDMA *s =3D XLNX_CSU_DMA(reg->opaque);
> +    uint64_t size =3D val & R_SIZE_SIZE_MASK;
>
>      if (s->regs[R_SIZE] !=3D 0) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: Starting DMA while already running.\n", __fun=
c__);
> +        if (size || s->is_dst) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Starting DMA while already running.\n",
> +                          __func__);
> +        }
>      }
>
>      if (!s->is_dst) {
> @@ -346,7 +350,7 @@ static uint64_t size_pre_write(RegisterInfo *reg, uin=
t64_t val)
>      }
>
>      /* Size is word aligned */
> -    return val & R_SIZE_SIZE_MASK;
> +    return size;
>  }
>
>  static uint64_t size_post_read(RegisterInfo *reg, uint64_t val)
> --
> 2.25.1
>
>
