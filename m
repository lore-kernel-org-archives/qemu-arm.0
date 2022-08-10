Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp151202ejf;
        Wed, 10 Aug 2022 15:10:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7lLsf0kYpDsBSg6sDEuH2L+ug5KHSPevjJk0eGM59nHgF1sTPJj0W5tc4O2rXoKzejRTbS
X-Received: by 2002:a05:620a:1722:b0:6b8:5bac:4b86 with SMTP id az34-20020a05620a172200b006b85bac4b86mr22535135qkb.337.1660169401389;
        Wed, 10 Aug 2022 15:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660169401; cv=none;
        d=google.com; s=arc-20160816;
        b=TNxswZBNVfwVGbjcE69uoUoryfUWdvao1uDHxH7OlOtiBQMMzLDg50MnAjsrRSXBwg
         aJ0ih3oSHscPM4MXUDXJas0II2bGEB0+4LPlHN8w6VIDOiZYWQAgREC+a4Q6OexXCcMJ
         I+hoZA7fL/ZQIsE+3uFifufF3rdCqVlE9VCuf21f7EwwPOXPNyrvsLWoNDacqoAQvf8w
         CXXkE8iYA8ZL6w/ANxnoq29agD/2psGjDuIIc3QoubrBeIrFka1RBRcR9HtbzhXwp18B
         MkivW4lovxrVgbeyfFv5RkR6we19j8yqh7XzYHtOW+9LocGVRH1AGE4G/Q9qpMfmAd7C
         z6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=k/2YRcOxoi7I5nTaW7eja2OJWCdB8DcDvqCblDu3WJU=;
        b=Nl9tqw7o0Igfrhe+SxA1Q8BfzStIc8zA2lhgZw0drjBJqIMG8Q7paWqUfzLzSQWju/
         huIjN2auT2w2KGvvRxGJvcpj2GRXqvgJe5k9lPfvkUwGj/SiA5KVsGBOVPwsex+8cv/R
         D0hQJjB5MIzXJqA9N204Vq6hse2rwi+4yy+QHlZKDsjmovXxcnJPrdy6BFADolRrVMAO
         41ypEC+QcXLqb5kTOYZdxOR2PewgcxkDH/FVskzJ0uiR3kE4X/e7qfecR+zR9EDr1w2K
         lTKAiB8ThwKoD7Xdqn7I+zVK6Y1uj0m68DSfSWv3mNlNtBfvlct2dWHCeDlphpK+cBja
         6eqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQKHhC9Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020aed27c1000000b0031ecff58631si614269qtg.498.2022.08.10.15.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 15:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQKHhC9Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLtto-0005Fo-VG
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 18:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtsK-0003Ur-RY; Wed, 10 Aug 2022 18:08:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtsI-0004Ou-Lv; Wed, 10 Aug 2022 18:08:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o3so15434012ple.5;
 Wed, 10 Aug 2022 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=k/2YRcOxoi7I5nTaW7eja2OJWCdB8DcDvqCblDu3WJU=;
 b=LQKHhC9QGYQGIl3fxItvOadxgPkyR5cTG1S8e7lL8GMRzLC78TrGS3naIOqsZ/nJHk
 b8deJg82N3wr7YP+h9st1Dhri6xhyGwvXvckyDoeAHL+vGKYlSkG/t+5bGXh5xrZjj+1
 HMT4Yhu3x9PJF08D92D4eZqCCTfDgSxPdFMH9Eu7yTRUU/zA/pec9Hyl+m7Bown6cV/3
 MNIejkMJFXXEYTHNSAjs9c4BwSfGGXpL7CdxUOwGcKM/g0rByZZFiYrEy/FqHL6/diL/
 GXwHspkJ6PMUBmlHdSIMWzjYpiG5CiRFrUKlNpuPVazgECDg+M/Q3kFzKao+M6g+DkGx
 V6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=k/2YRcOxoi7I5nTaW7eja2OJWCdB8DcDvqCblDu3WJU=;
 b=LDydIEIkDfXhv6crYdX9lYJABjB6rJpvZleRAE1AYTmxEDHuacYBNTH5XIB/Ak+4Xh
 qFrKyjRVnp1/rEfrzO1bVeiIPCvwIae1NAhN4miXDbHXWrn8qph92iS5r4MGTBzLFpi9
 pdXEdlKg1bAy0zO4GVWqAX0E3gCmqdnMFR7I3b81agjzI9w0mi0B7ZOdSSonYKquPR9Z
 m+IIBsKd/zJjZ1s5L+B/9tDnlgHXNvZAvrlxbcmpy3MtdXur6TZuHajgiEfqOA5nHtV2
 Duwm6JXvj7LiaRRJqUI8R9/UzGGSII+TBTM4j9X6rPeCY1XVIagTRX8Uqy9aqDNt/TLE
 j2MA==
X-Gm-Message-State: ACgBeo0UfjydbQ4dpfsUQwDLGnYiL6rHa55Pc1g/P1DWDEG4yFpgAp02
 WnoIM1GM1nVNTkhyM3TI3knjvAXn0+NB+0rn9rY=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr5682711pjb.129.1660169304503; Wed, 10
 Aug 2022 15:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-6-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-6-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Aug 2022 08:07:58 +1000
Message-ID: <CAKmqyKMzNmNzPCngGEvrkq_oewipRo9KvAax=+n=nT4wXJswUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] hw/mips: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
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
X-TUID: OfAyNOk6kv5f

On Wed, Aug 10, 2022 at 4:58 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/mips/boston.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index d2ab9da1a0..759f6daafe 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -515,9 +515,6 @@ static const void *create_fdt(BostonState *s,
>      MachineState *mc = s->mach;
>      uint32_t platreg_ph, gic_ph, clk_ph;
>      char *name, *gic_name, *platreg_name, *stdout_name;
> -    static const char * const syscon_compat[2] = {
> -        "img,boston-platform-regs", "syscon"
> -    };
>
>      fdt = create_device_tree(dt_size);
>      if (!fdt) {
> @@ -608,9 +605,8 @@ static const void *create_fdt(BostonState *s,
>      platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
>                                     memmap[BOSTON_PLATREG].base);
>      qemu_fdt_add_subnode(fdt, platreg_name);
> -    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
> -                                 (char **)&syscon_compat,
> -                                 ARRAY_SIZE(syscon_compat));
> +    qemu_fdt_setprop_strings(fdt, platreg_name, "compatible",
> +                             "img,boston-platform-regs", "syscon");
>      qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
>                             memmap[BOSTON_PLATREG].base,
>                             memmap[BOSTON_PLATREG].size);
> --
> 2.35.1
>
>
