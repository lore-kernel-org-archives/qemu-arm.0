Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5875905lfk;
        Mon, 15 Nov 2021 05:39:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9nRM+EXIgG4tGvkUCxO6uw/VWETxJUCHBAR0I6wsp39xj8IE3PrGuPYGLr3xhbKFmh6HS
X-Received: by 2002:ab0:21c6:: with SMTP id u6mr2419061uan.132.1636983558394;
        Mon, 15 Nov 2021 05:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636983558; cv=none;
        d=google.com; s=arc-20160816;
        b=cJhkZSYP9jlocIsACHtnf/8KXr9YVitBGGajvSR2FSVG0bupRVDI4PvwRkVA4iUx53
         lgYwCP2T/raroYo3f+4gnKfn2rLPHj/jEzw4iM1ScwQWeEQ0iPyMOc6t/OSjyYDUsTrO
         qkXRcBYhY1T/jC9IwRt3iwPkwvxsX2auJ/JfUKnUMl3KPBIn/jkmMM5oa7FqOPa+cRBq
         HpLlUJ9yhbaDQ5hRMDo45m/q/NQb2l5xsTzHVdNuGkcUL4BYbGXZf/bnaH+Zh0odCdLI
         iWXGT6r2LXObJrf/8utjFawP7htwN5cwHCjK/EInI5vhw7H9sfl0drFKeHNhlZlXiUNI
         O+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
        b=mAdeveLJ8kcTKvez750N9TiUSincEKAYjp6MF13F46VMjcWB2Jy392y7PUu5rDQSCJ
         mNYlIR8zPO8vRLjzr6AtgaO+JV/+mTDU1qRDzqEIv31AwQo7xwVY76Bn/MAPoRSnXqMM
         ++GIFcp1BdbVLzbtvLnqjgFR6+tyzvhHF/KW0VT8rDfUQ8BB4E2ehnb+x7FHrIOuq7Az
         AYY6pUj3Ju6y0cKwotVFlzLvvrcadvGPRLNLTM3sIHuEvZFqVZl2YH9dWcfNNPqv9QfD
         98SWat+ILHRJxgTbGxV9gcgsXDH//AM6UZ+Zi4EQCxg7vPBMzWvgtxJmYQ43Tfb7xnnf
         387g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qZRH7NGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si5084020vsa.207.2021.11.15.05.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 05:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qZRH7NGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmcCb-0003GQ-PA
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 08:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcCI-0003Fl-D3
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:38:58 -0500
Received: from [2a00:1450:4864:20::32f] (port=54984
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcCG-0004ME-Gl
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:38:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id i12so13146853wmq.4
 for <qemu-arm@nongnu.org>; Mon, 15 Nov 2021 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
 b=qZRH7NGmp1PMciSQoyUMYVXlFymS4BExsXAseBK1B8gjNV7fhXTfSBMzGWpMUvhW33
 ObFcgmCeoLByoNeaNhtvBwJ254GuzHATVvjBBtZHYMjgrlIklX0TiqCeCvXo/HJQFgZT
 RtDmcu0GZJQ1korC7xr1allEf3AuqyaF7yAjb5tfS7wQzCCqwtHXotneub2OtKC/tSat
 slvDZ6PurEUAZqLTuziK0JygPkdx7tGK4Hmt/24//NdaHnG9FTWR0P2nFJajVIpgJ93a
 rYONTU+dCi82DRk3il1SExHOH6ouF2YbXBB8iGPL0DE8fg26aWUaN1VWZQejgimbBX0F
 LzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
 b=yfHiXCBqG8s/WrIjQAACPoPy3CoFhCUk/F2FNF9ItpiuhVAZLG8S1dwGxaPa34dduj
 uY4jLdnDVGHu9LDjnpHvqA1DEi/2F9e+ufG/dvYCj3BiT8jtJxoDq0/8jyqtWMVhlSZc
 coixmJfzAnurTQYOnbYeVwwKzyfGdS6+2gpLB60GnTULDL8S5jIWIiS3dq8vUBf3x3xN
 cG4ihnDf0FWDdEuvj6eEUmib1oOSpucSaBFXvLsczse1Y2Nmx92uDiLr7n7zbGpycCfS
 BobF1lI+oE/50iX0YTmI8/5HvN1OZtGKXQDM+elfO7Hiz6wyOPl32jD6rw42/gaqa4k/
 xn+g==
X-Gm-Message-State: AOAM531ANC/XMadrMK8omN9I1dqdC+qqIN+hZ56oD5Ql9RCj7dh5n7gx
 iw6S8HdyGG9eYiLB8b/dBaVOs/64tE+b7NfDYYLrVQ==
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr26357463wmq.32.1636983535036; 
 Mon, 15 Nov 2021 05:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-3-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:38:43 +0000
Message-ID: <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, sundeep.lkml@gmail.com, qemu-block@nongnu.org,
 andrew.smirnov@gmail.com, hskinnemoen@google.com, joel@jms.id.au,
 atar4qemu@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /db1VmoSLvnK

On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Explicit is better than implicit: use drive_get() directly.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/sysemu/blockdev.h           |  1 -
>  blockdev.c                          | 10 ----------
>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>  hw/arm/cubieboard.c                 |  2 +-
>  hw/arm/imx25_pdk.c                  |  2 +-
>  hw/arm/integratorcp.c               |  2 +-
>  hw/arm/mcimx6ul-evk.c               |  2 +-
>  hw/arm/mcimx7d-sabre.c              |  2 +-
>  hw/arm/msf2-som.c                   |  2 +-
>  hw/arm/npcm7xx_boards.c             |  6 +++---
>  hw/arm/orangepi.c                   |  2 +-
>  hw/arm/raspi.c                      |  2 +-
>  hw/arm/realview.c                   |  2 +-
>  hw/arm/sabrelite.c                  |  2 +-
>  hw/arm/versatilepb.c                |  4 ++--
>  hw/arm/vexpress.c                   |  6 +++---
>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>  hw/arm/xlnx-zcu102.c                |  6 +++---
>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>  hw/misc/sifive_u_otp.c              |  2 +-
>  hw/riscv/microchip_pfsoc.c          |  2 +-
>  hw/sparc64/niagara.c                |  2 +-
>  23 files changed, 49 insertions(+), 52 deletions(-)

This would be easier to review if it didn't try to change all of
these board/SoC models at once. Each one of them is entirely
separate review work.

-- PMM
