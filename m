Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74B3CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:03:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsMk-0003Xl-N1; Tue, 09 Jun 2026 05:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsMj-0003Vs-Gl
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:03:21 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsMh-0007Rn-Qi
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:03:21 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-660390acd71so5173949d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995799; cv=none;
 d=google.com; s=arc-20240605;
 b=FWFr0k+zmZ3TuDVjfkElArrRdFhUO7oSIrhOHlr8k7Grebtu9kxNrvrpXUmeicQawZ
 TXZZL+5P+d48RyHeMQAIL9gCxlOJzAuubTvtnyNhqI6clHOcOD7cKwjxJ15V7XD8Oqsn
 qLhhobi2b0AEAvowBNOl3j9R8pmDOq994vnIBIE4ZfAR/BlXrnnLAK9HnvzDj9MH3+0b
 1EjyslJuyurZG85dWQzBo4WfAoY2en+nwTdvc2BdCHaDt+++Qc9+JuLUEQYaEtizZa4s
 qvc9ZC+vGWhOrLlkb4S7yJWA4HswjJ/+V6kfCbNcb6nrmRm8UKjZxL23SZWfVSbTY79t
 r+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7vFFNgG6Y1h/fjTGy+dIXyOOOesTIEGCz6t9x/u55ns=;
 fh=m4MyHfTnFfOtDTQzc914sztsfAobxJYboQSXMkdK+ro=;
 b=iUDufX4AHumVsIZSTQHT1MvR1vAeOOD9RSZuk2FKz3nIP8LzEIeC3gtXaJZbaWnPXF
 6WV6Q5OKbDtCDsz55CCG4AjUyeb2BUesKSAf4ZHOlJOrHgjE6YqHsBn4qAUTsgO6LGWi
 KesLWlRjneD0hVxSAGC9zatIBOa5MAlCKQYaen5VlKku3AJKZPI3LhIxOR27S3rhWtM8
 dhCvaorKX+pEDyiGqdlkhGnGQCiZRGmjakE5LxEg5bfnxEmT+52Pyt5oTcnmWYfhPQzp
 p6hjMPHU+xlif79zHaQgLSjMytTjjektLQzjDsBmJ+++PixgWgzjuODJfG8NiJjHnYFU
 LvdQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780995799; x=1781600599; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7vFFNgG6Y1h/fjTGy+dIXyOOOesTIEGCz6t9x/u55ns=;
 b=vltaHCY4Kv+Tfp0gKNEPpTB4BcOycTTFfJA0eiF1+Jh3CHBJ6ncUmOZui9QQe89bYh
 w2AVmIHT8jG4PUBcSLCqx+MfGHPXGFuzV5+Q2gzygfmIbZjl9LgATWoeX0qsNX5HRRzK
 1huZlKQJh/Ba5dLuYvI08kPR9XLlic+InU6AUEleGgzU9EDPN+0i7g7k3YSOcmiOIUto
 6aLRnctM81/SXP8Nz8LO9XYyKx+dcYJCLBlbsavoDpRvT5/Cl2H04aqyl+tfnlzxaBrt
 xj3nL/fGoCR3Qj+i8onlW/TsvEBV6ormLyuJ1fcZA03u/u/gS3eEB+kiz969eWsGDIff
 MDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780995799; x=1781600599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vFFNgG6Y1h/fjTGy+dIXyOOOesTIEGCz6t9x/u55ns=;
 b=GartrJBvmC5c3KT+8vGAKAbVE2ah0eUA6QRpKTqUKoVpyJpuZKO+5y+nvxT9kQi2CF
 8PnmSYKFEM0eHYkU548MyBZ07dicuS2SpK8g5cGUTjnzyMPiifDmYYtfyBcIBu9r8npp
 9ztynLrwGl81YoGhvhELzTfOPi35S4t4M6aMvKTF5V7HfyVxuuAfqwjtGz9O82eJWVhf
 OleU3KTN6m3AHrt4Cu/gFPSZ1PZJbDjNpqJxplOGAIOdGUyZ3K8I7ySFRJXws992wy3t
 cBGEOuUXG67oXu8/a8+kUvSLthnBVv3nEBKW4e61OnrXTGNDgEPJmyWBtlxPCitwUUYY
 6Lbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/zKb1hOfhFQH/8nSFVWljVTJRLARxOUjBnbIDJ0fPGaxe4gSBlXWKj8StA3oW7YLCjTxglSsWqNw==@nongnu.org
X-Gm-Message-State: AOJu0YwVegFxM3KR0SbiBTRUVVdOayCJv/Kfk6f3ZjQ6GAdX9O9tk474
 KNpAILm4MgpmcD01Ob3iaiMCR8IJ03WsBN1rm9iIZO6GOAttdyR04EWHlJCQEcU9Z/+hhstFuVF
 b2Fl453197mDp2uv5HGz8Hw/Mq6rVY67OkjbKXQ1bPw==
X-Gm-Gg: Acq92OE/EIjmXOclAMFHF4qyz8M/HfNV3Jk25Wofn1Qgup3/qUppUnjWOG9P2K+S/ZH
 7qiTfSE5TkfXchXA6GW5fV4fzg9rtsxW1skP63dTr8BrDol/o6o527/7FS+R1Lb2jhy5IuqmdCh
 +VYM9Y30uU1qca/9R9Vu+dmdMKDW1+2mC75V+vlUT+F5o6YRkUQElxIr/K8VfKcU+KH0xExDsKJ
 t4O5oDvPGNUAzxzK+bw7AwqW0GacVeOFyISAKiv+CWbAaZxGEMMlq3EJcdv2f83Un4iYxnWzIlW
 LWUpPsunWwgHpSnVZIV8leCOJlWPxsN2jE+2M7H9hr6BYQggkrMnm8nNRZ2pt8AUgrZ9Js7ALAY
 d2Q==
X-Received: by 2002:a05:690e:12cb:b0:660:5b90:b43f with SMTP id
 956f58d0204a3-6610afc78bamr12353051d50.18.1780995798610; Tue, 09 Jun 2026
 02:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-19-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:03:06 +0100
X-Gm-Features: AVVi8CdgDE6mL4HmO5gjahxZR8cgWbrdO2fcNxgj1fVmINtf0y7z1kAEi81iOpw
Message-ID: <CAFEAcA9G=7823dyxTNdpmx_06O-HR8=Vo7JFZK4eECNhvKVOvA@mail.gmail.com>
Subject: Re: [PATCH v9 18/45] target/arm: Implement FCVTNB, FCVTNT for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index df2b89cad6..63fd1fe3db 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4104,6 +4104,10 @@ TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
>             a, gen_helper_sve2_fcvtn_bh, false, false)
>  TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
>             a, gen_helper_sve2_bfcvtn_bh, false, false)
> +TRANS_FEAT(FCVTNB, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
> +           a, gen_helper_sve2_fcvtnb_bs, false, false)
> +TRANS_FEAT(FCVTNT, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
> +           a, gen_helper_sve2_fcvtnt_bs, false, false)

Also only streaming if SME2.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

