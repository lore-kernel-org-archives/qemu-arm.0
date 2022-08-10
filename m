Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp148295ejf;
        Wed, 10 Aug 2022 15:03:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7UY/Zg0N5L3YekTMEDiIng0aYF27C2Knc8RM680DY5KJm9BxOlFYbiglMKTaSDnZjzy+6m
X-Received: by 2002:ac8:5755:0:b0:343:560d:f4e1 with SMTP id 21-20020ac85755000000b00343560df4e1mr5053829qtx.630.1660169035470;
        Wed, 10 Aug 2022 15:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660169035; cv=none;
        d=google.com; s=arc-20160816;
        b=1DGRWN9h4y6tBpal7cMmFnQoz2vk3DYeYBpig5ucUNbKjqBdMshmfwYEmGmc9TB8Bc
         Nv/iP/b8tT9nzgexGLEnY8EuAcCKNG8Z/fY3EX/yxmOZad673eAfd4NqkYvHN+tZ+p0v
         T+HwcvpMpVg5uUAiN2/vASdDXrRcUE+Z3cPc7GAflltmfd4Kcjw2GNtPgR5ZCEPcN9d0
         IRpOCLHiXqwcfx8CnkQl7NG6OgCSxfuX/Ut0nmKtN3NDGvq5ElX4tg7OFgF7K0ZTEuf6
         PUnv4FJW1ZJpaom+ZnU5TJ3fIwFqVZEi5INCOANpYLUiyk7z/gvL//zkK6XGM513kEn/
         Zvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DNpQsd4YfubZwp4IIujnt4Jmh8W5T0Br99zl1yh92OQ=;
        b=m3XHjC5b45tI+3/qVqgHkEQnNrSByaOd9q6toVPq2546DzJKmAzdN/4UC/tIfhp4Tx
         rgzsVgctqY+t80NsA6sKmvmpPo4t1m/Er6+dVMCMRogOnKiKM7vhx/79V0tSY4jxF6oE
         M/N6bm1hNhw50Zwlk+mzc4BePYdxgeAY7WdUBOcIDkEAbZeB2cRjfJ+p95MODaByeMnz
         QdFs1l51ND/Dq3FLD8/zCLH6R1Gn9H7M3iN+bZTVSGlWy7apbfr3+uCTsiI6HIp44IuK
         th7MVGOjJD/Yci7YlWWQMmWFh6XLg7Z1LxIf9uQ9VDngk1bO+ozqa2YtTbp7MuiUiTMB
         HiCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="DtCXwE/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27-20020ac84d5b000000b00342f6181dafsi511441qtv.397.2022.08.10.15.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 15:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="DtCXwE/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLtnu-0008Fk-Uy
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 18:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtjj-0005jy-HB; Wed, 10 Aug 2022 17:59:36 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtjh-0002tb-VY; Wed, 10 Aug 2022 17:59:35 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f11so15505102pgj.7;
 Wed, 10 Aug 2022 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DNpQsd4YfubZwp4IIujnt4Jmh8W5T0Br99zl1yh92OQ=;
 b=DtCXwE/8qa14r0TP1qUH07FikkYJj3y71cKMbzne0lkJgNJha2LFvq2uSMiRweNJTe
 a9yR7uFZ81wx6JfCV9ILXKgi+SyzSR+ZPXP76I65s1f0T6rwVjtNRczPMYDTTzAT7fgc
 3CNs6D7gwRqMuObzfRtaUO5lthBSCXRXDB2zt6C/+fuXPrcK7MDttM8czG+72sISkf9n
 ERIwf9YU5aLrHlzdjlqcsw8sSfptCx5wDD6Zrs6DartZ/dY9YzwgNRJ4Zdsc7ey8lnyJ
 osHy6hpDR62/C170mXEliUBQkq39H6fnwf9RNQa9tu+v7NcCgR3bRUT1jDhXAmZ64pMH
 v+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DNpQsd4YfubZwp4IIujnt4Jmh8W5T0Br99zl1yh92OQ=;
 b=pu66C9yewTFOnJ8+1W+Jktkj3fLhuJxPS2J5HL2mqY+aY9sQbM30r6i8UGwIHFslr8
 VjWgzm1Fv2EPGSHOVGnRP5fhYU/j6RaI0UBbx6FE/LE6VGnLYr1iOKxnX5jPQKHC9PhS
 l8TJEu7vWsUegUzEOb6A+F0yPn278FlDSF2igXk/rQvDkKH1S6J7n5QAfdiDUBiiqypD
 rt30DkeP6lCPqAZa6HVHiUvQlw7LIQaHJ7YJ7HbJw5ufq1RSkcyihEBffqvWTclF1bcs
 2DJDbrDQdAHVrnRalE4qE0v1VVRh3xKwxeKYUjdlPTYA1JQcha1AJIrrgvF5LvwTJBhe
 kXwg==
X-Gm-Message-State: ACgBeo0hI0kGfCt8dbWA9xADTvGo9EOBtCRXixVet+Qxl3BOrZuPMkN3
 0iGXNliGtos5nMMAabX6E+D85Sb7BJ+txkGVP2Y=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr24443983pgk.361.1660168771843; Wed, 10
 Aug 2022 14:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-5-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-5-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Aug 2022 07:59:05 +1000
Message-ID: <CAKmqyKM9Ws8bG4xDDNQr8A3XcafpA5RqQXwLUhsozZTzuD50Tg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] hw/core: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P+EwGJjDBD5y

On Wed, Aug 10, 2022 at 5:13 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using the qemu_fdt_setprop_strings() helper in
> hw/core code.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/guest-loader.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index c61ebc4144..7b8e32e06f 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -56,18 +56,15 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
>      qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
>
>      if (s->kernel) {
> -        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
> -        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                      (char **) &compat,
> -                                      ARRAY_SIZE(compat));
> +        qemu_fdt_setprop_strings(fdt, node, "compatible",
> +                                 "multiboot,module", "multiboot,kernel");
> +
>          if (s->args) {
>              qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
>          }
>      } else if (s->initrd) {
> -        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
> -        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                      (char **) &compat,
> -                                      ARRAY_SIZE(compat));
> +        qemu_fdt_setprop_strings(fdt, node, "compatible",
> +                                 "multiboot,module", "multiboot,ramdisk");
>      }
>  }
>
> --
> 2.35.1
>
>
