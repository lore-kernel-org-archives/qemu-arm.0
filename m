Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3799541lfg;
        Tue, 11 May 2021 02:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCKArxnyKo6g/J5IpC/ke9jhKX/r9TD4xpv10xw3+C+WEyeq4TMBYr8fdlsVyJfdc5RuTT
X-Received: by 2002:a05:620a:20d7:: with SMTP id f23mr7215219qka.484.1620725299930;
        Tue, 11 May 2021 02:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620725299; cv=none;
        d=google.com; s=arc-20160816;
        b=zurmyBrPdB4vfZ35vy7wLWmkWOvf6O7V3h1CjB9H7sAf/063PLKSE5Z5ndV6KWRJLS
         TpK2abBKdITAwutHdvYcJh8L1ErIzIp/+dDug3cUJBp2kw0q8kIo0m54VlpkZV/r46py
         vlQkCwAQ9VPANqpycPU+K321ddfCY416W+JZYuVwK/J2EYIVJ/1t9Cx27fwyycbDQTJj
         qBU6G6yHdhiS3R+CzZ6feerBmZSMYWS304dQY605bjpwn4V0pOv6bUpk0ODddF8301QC
         36wyRQtmpfuKiTbzUiQIXVd9H9N/18PT5MiABdIt9vgEd85WNhSvcQNyuD9Ely7pKIqT
         9zXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5yvXhbJtVqGWNybLiBSZ9WIxhPhjDKQ5VNXtWIJ33s=;
        b=Rx3AXBzu5S3v+Bee9EPa15tAZeIeU6pAXjALpcEXaB7FF7fMyam9lP0hl9XMbGojj4
         HAKMWrTpdEBUy7Jcx/NvVWyJKdy6+IXbxExntiRjT+75FRurIkeKb3zVcSSdzLkFOsC0
         XOGURtwocMsFfheBZOWAy6xHgPfVJ2dTmxtsHOkkzQIOmL7irjgdDdyOWXrPuInES77g
         EPQytRbhFoMIQoQbGx0AwV9sfFrrT1zFcxEQAqyLXv+Apj4okqUBUh24FKO4KGXLRBRf
         L32k+fzN/WHv0Q9A+v9Rx2mw7RGd7BkSjClkRh4ASYomhztTK9XM3OcYhir7ZxrM7rZN
         oBZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZCumT8YV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si9207201qtw.174.2021.05.11.02.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 02:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZCumT8YV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgOgd-0004oX-89
	for alex.bennee@linaro.org; Tue, 11 May 2021 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO0L-0005qs-RA
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:44:39 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO0H-0001EX-DK
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:44:37 -0400
Received: by mail-ed1-x534.google.com with SMTP id j26so18229879edf.9
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5yvXhbJtVqGWNybLiBSZ9WIxhPhjDKQ5VNXtWIJ33s=;
 b=ZCumT8YVoOgf4U0JxCjyNazyZ0TQu68njtq2xwNPzV8M7yIuCRCFWdQJIHng2590sJ
 V9cL3J6Hxc3pPZ0Zl4hmgNOOGDzSfxi7x7cP7UIcH7cjbUa4S9NY3SQwz/3Hd3t9ZuQZ
 dDwxlzU5WqLyqdhZ5xBpYwbEz8hY6rhTmBuD9BVdq52Z78qXQoYew03ocx60F9rtISGw
 KnaL0EAY9UXRN+ZI2O40rANSXRtQ7XXjzmTxNlSZ8q4wTinj18WfSylc1wJRwO3Nxpzm
 4a2OKo/tT1597vCAPmPp2XJExghIRr0SyMP/5baAxLQQJait/wNuF7yKL5fkVRMvN/Xj
 nXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5yvXhbJtVqGWNybLiBSZ9WIxhPhjDKQ5VNXtWIJ33s=;
 b=gqa5zAeSbxuHxkaVoA+GLz4cYzoJgdW+JbCf9J77J1eTTuIfXhCRkculCj1mitnTBB
 G2kEzYm9gtd2UZkfNWCRB/uAugC6sjKXEe//m4QNgufkR+du8CDBbZ+Emqah9t/tGvD0
 DNpzqHlC0uvApaAE1Dv7Qd/65DiHiWCcfk9UhwfQupbSQfLj4Tn9AAm6pe4YHB+RCy4+
 ZC0ilckIOBOw9g/77lqmK7laeMduKa3mdKsXHI3W/2C5nbW1tOQt3q77GJtQzTv2QTId
 bIekXS6hivQP+rbLXEFYcQrUAqh5Xkz73yK/qlFcwDL2q3cdZ8XGKii9ak2vDX+1g6AB
 XN7Q==
X-Gm-Message-State: AOAM531WPgEsajV+CyTbgv573jfM5MAXindZuUrRmbfIT1b6SUTZg6dH
 UB9JaEg0Cnn2X72slItml80VeIXE0UpRjTDh351znA==
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr34350563edx.52.1620722671863; 
 Tue, 11 May 2021 01:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-7-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:43:19 +0100
Message-ID: <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/82] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ShhkZPTyGzl

On Fri, 30 Apr 2021 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Shift values are always signed (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++
>  target/arm/sve.decode      | 17 +++++++++
>  target/arm/sve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 18 +++++++++
>  4 files changed, 167 insertions(+)
>  /* Note that vector data is stored in host-endian 64-bit chunks,
> @@ -561,6 +562,83 @@ DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
>  DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
>  DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
>
> +#define do_srshl_b(n, m)  do_sqrshl_bhs(n, m, 8, true, NULL)
> +#define do_srshl_h(n, m)  do_sqrshl_bhs(n, m, 16, true, NULL)
> +#define do_srshl_s(n, m)  do_sqrshl_bhs(n, m, 32, true, NULL)
> +#define do_srshl_d(n, m)  do_sqrshl_d(n, m, true, NULL)
> +
> +DO_ZPZZ(sve2_srshl_zpzz_b, int8_t, H1_2, do_srshl_b)
> +DO_ZPZZ(sve2_srshl_zpzz_h, int16_t, H1_2, do_srshl_h)
> +DO_ZPZZ(sve2_srshl_zpzz_s, int32_t, H1_4, do_srshl_s)
> +DO_ZPZZ_D(sve2_srshl_zpzz_d, int64_t, do_srshl_d)

Should the _b version really be using H1_2 ? Elsewhere the
b/h/s/d usage is H1/H1_2/H1_4/"".

Running whatever tests you have on a bigendian host would
probably be a good idea.

Similarly below.

> +
> +#define do_urshl_b(n, m)  do_uqrshl_bhs(n, (int8_t)m, 8, true, NULL)
> +#define do_urshl_h(n, m)  do_uqrshl_bhs(n, (int16_t)m, 16, true, NULL)
> +#define do_urshl_s(n, m)  do_uqrshl_bhs(n, m, 32, true, NULL)
> +#define do_urshl_d(n, m)  do_uqrshl_d(n, m, true, NULL)
> +
> +DO_ZPZZ(sve2_urshl_zpzz_b, uint8_t, H1_2, do_urshl_b)
> +DO_ZPZZ(sve2_urshl_zpzz_h, uint16_t, H1_2, do_urshl_h)
> +DO_ZPZZ(sve2_urshl_zpzz_s, uint32_t, H1_4, do_urshl_s)
> +DO_ZPZZ_D(sve2_urshl_zpzz_d, uint64_t, do_urshl_d)
> +
> +/* Unlike the NEON and AdvSIMD versions, there is no QC bit to set. */
> +#define do_sqshl_b(n, m) \
> +   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, false, &discard); })
> +#define do_sqshl_h(n, m) \
> +   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, false, &discard); })
> +#define do_sqshl_s(n, m) \
> +   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, false, &discard); })
> +#define do_sqshl_d(n, m) \
> +   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })

Why pass in &discard rather than just NULL ? (Similarly below.)

thanks
-- PMM
