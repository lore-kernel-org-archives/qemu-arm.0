Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp336310lfc;
        Tue, 25 Aug 2020 18:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoMHKaYhnKg2hYysqEBMGzs/TZqMt3KhO127Zv2Z/aiNB8jFzp0mO/qRBbcb9KTCWZfFSf
X-Received: by 2002:a25:5808:: with SMTP id m8mr18912503ybb.246.1598405294576;
        Tue, 25 Aug 2020 18:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598405294; cv=none;
        d=google.com; s=arc-20160816;
        b=GUuvxuWYEH0DunddLjeHBnx4EaMA3liiFI5UPhIjmE7LTSpbnS3M8M7YMYRC1VGTl9
         nWNJv6qNrSUVVBKG5TNkLQ+nJx3Kev+jv0nGurzq++E/KccBCh00fHtGkL1cZCXfsxeS
         RBwxKrRd+jxQMZdU1GPEc1C/Sx2s7Jy2Njg2pYFWk08BSX1KMi7FPpyoxqmdS5jUSsvU
         Y5t1hf1FdFFASs3hAZhQ7eID3JTPA2UZ5cMGuYeTr1/xsMpbyVUS5ucc0HQBQsYpe+5M
         Qwyrz4IEQm0a2+1mqPMT7FLWNH25akTyCMAj7gtBPwuIXyXIMw4lKOx1oC3BAC06/fF1
         c3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/Kn6Jr1NLsjJ2ty3jP1i3N2SUnZYCWFTZxXXEsKURHc=;
        b=ogY91ARLx23ZCrkZ9D3rLDrxfvClVw28uNjxsPkvACvnqiNCafcz2crFjb0Yo0OftS
         3XRh1/wbpUqqhAp08J59Mt+/s4mZHYxhn7wX5dJY9PKj4TSNtn1G4EfTkNjjQ0VSrj0y
         No7eP5ppyM0GCSUhbaNhhEeTfOFAqxbXjfnYNzn6bj+prpvqRgzueHeXj/vmx30Dk82C
         O6smIQZ4NMIHHrGeJUyw7WuBX6MAHiFzO41sI6vhv0zaIFB7cAOtBxhafk1UTmnMwr2u
         KNROZJHTIP6ld7BQ14I094HwlbhHY9cs2WHMvHvHNId2SDmxeRCUbz0jag3UxkzWRodb
         usPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c2v+j0vh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s32si691807ybi.97.2020.08.25.18.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 18:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c2v+j0vh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAkEY-0001v9-0o
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 21:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kAkDx-0001OG-Uv; Tue, 25 Aug 2020 21:27:37 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:44319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kAkDw-000115-Hb; Tue, 25 Aug 2020 21:27:37 -0400
Received: by mail-oo1-xc43.google.com with SMTP id g1so75891oop.11;
 Tue, 25 Aug 2020 18:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/Kn6Jr1NLsjJ2ty3jP1i3N2SUnZYCWFTZxXXEsKURHc=;
 b=c2v+j0vhCFEARrc62vmUptbxP6jBtNbaQOStS+wAb2pRBAQ8yHGmIOuF1n+2qktRN1
 6Jja1VhcAuLEaoGeQwD/F5d5T7I8TJl7nsJTKNrHYOlVcHn8/SvPe8caKkXbvfgAks0V
 HCqrg8EY3s6DKZpBxyKD5qwCB/QpbiV53cCYpy3GtUTeg11/j2TERgPc7UAZn1IeZOz4
 W79HFJ5E7jBbbkXfzKunDSJsBgpVPW05+mYfRjroF+U/FvHU9Zfkv4LRylmOvG0oVfo9
 kS8u8CMejV8cjuEjY6HhEUjzPUeBq2Gopr4F8tUVtSCH+61OJ8xMiPB65H2IiTfrUGMs
 Dgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/Kn6Jr1NLsjJ2ty3jP1i3N2SUnZYCWFTZxXXEsKURHc=;
 b=RZsmGzmTbBdPwWO230Z5YgE1BJrdlK2DRkIKcZKb2Px8SXQ25JR4NfkaaXBb/xUcK5
 8fq3GJ3oln+Rg3ZKpqIjroXahRsiR0yv5MhXvYb9R5fAZL0ex9+A3Iix8tOTZrObKSZd
 CuMolYrxOKisxRkCOXk64FeNtuzHRFts8kMwZm/yG3+t8pFxzTPw1JF1TBtLnCLZWWTn
 u8ZoJqsCiso/3IfqPHXCz8Rd5R3Rym6e4p9Y+1Uc9302Adw3FxUKfuXBfIj2FnXlRpGh
 rBkYYwSI8LZ0If1pTDl4euj6L7tdTlXm8uVnOoo84V3b+NAilI/pyBJWiv7RQDID3iQL
 WqAA==
X-Gm-Message-State: AOAM531CPDrzwjtlcLaGgdFw1d08LiuBnpx4VN51Gl5NPkK0M3XwqZtb
 jMZo0vVaZzC2N2H3uaYhxuG2yF//+jWHYM9tYh4=
X-Received: by 2002:a4a:be0c:: with SMTP id l12mr8940671oop.22.1598405254793; 
 Tue, 25 Aug 2020 18:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-3-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-3-kuhn.chenqun@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 26 Aug 2020 09:26:58 +0800
Message-ID: <CAKXe6SJapcZVnSPznGw_+DkLRv9awtXKNz1hB308s_F_yCz5kQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] hw/arm/omap1:Remove redundant statement in
 omap_clkdsp_read()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
 qemu-arm@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hyDEMdVEflx1

Chen Qun <kuhn.chenqun@huawei.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=887:30=E5=86=99=E9=81=93=EF=BC=9A
>
> Clang static code analyzer show warning:
> hw/arm/omap1.c:1760:15: warning: Value stored to 'cpu' during its
> initialization is never read
>     CPUState *cpu =3D CPU(s->cpu);
>               ^~~   ~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/omap1.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 6ba0df6b6d..02c0f66431 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -1774,7 +1774,6 @@ static uint64_t omap_clkdsp_read(void *opaque, hwad=
dr addr,
>          return s->clkm.dsp_rstct2;
>
>      case 0x18: /* DSP_SYSST */
> -        cpu =3D CPU(s->cpu);
>          return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
>                  (cpu->halted << 6);      /* Quite useless... */
>      }
> --
> 2.23.0
>
>
