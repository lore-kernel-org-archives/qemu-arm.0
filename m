Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3024414lfy;
        Mon, 17 Aug 2020 09:28:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1L3qEVVQ4JAZmR/dMP5jjztEeBZy1E99Kj0hdHwRR68oZfdxddzBH/sDX4GZ0RwATdnDS
X-Received: by 2002:a25:df92:: with SMTP id w140mr20969492ybg.455.1597681725100;
        Mon, 17 Aug 2020 09:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597681725; cv=none;
        d=google.com; s=arc-20160816;
        b=dnAZTY/y78Z8mPhBygdBqCyQbkcVIZI6rhAqs72+w6QijEh6vEeoonE3px0SU+NzxV
         TGymqkk6YQSskZjogi7xnlw8COYdYh6L1gmB5Q5zbOl3N4Tzfqk30JdZBd15RcPdWDW4
         fTPISedwOnsmxa0M1EZVjTrb2ZiRJ6VKkNHh4umTivBOuIZwFGBH6x3eeiAouidqjKru
         c+qzJ6vMbBPlR9a1PAIOs8zLDRCzChGzjK0sA30mMe8QJy+9vmYx7rgHMjxsJzkC2N8r
         Omp6blAf7EfjJyk+nFO2LgGq+s9AvnDgmRS3d7ykXKUPrJ8/6BE7TSsAfXutL9S3i+Rt
         7Fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCUv7VPVG8oN5Xmva7GVoFqSpuADxNTCe1KaU8Lql9s=;
        b=DQdhCGoekH/kPsKgyekYU/tsnU6St7B53wCGtrN1dFVa6o7Sp7DRVge9InPwUrqKfY
         v/P3/oFBtrpEKW3sPVGS8wOTt+fxXau/pFKhkoi/wXJ5izjP1L+XfuXt7rp1kTJ6R1E0
         qm4Q0rW88QFjBqwAV5GVJZiHHSkxZzOsMJk69ihDzB4X14hyzzE5awULaUlKSTf4qUoP
         2v8GWwoiaj8kuSZqzrFiWkYZCT9Yfnu7KTWQvrqyYLwh+/3RJjFrs0/ArFWNWSwi7E69
         IiDGwcukQkbawPElE+kASeMnVLO/PalkhPpT8OjjnX7vVG2vzotZ2UHKbdWegHvrBVFi
         +OZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BdGfA4kf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p194si20060668yba.137.2020.08.17.09.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 09:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BdGfA4kf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7i04-0003HQ-HB
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 12:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7huP-0001jx-8G; Mon, 17 Aug 2020 12:22:53 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:38317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7huN-0005WY-KB; Mon, 17 Aug 2020 12:22:52 -0400
Received: by mail-io1-xd43.google.com with SMTP id h4so18202436ioe.5;
 Mon, 17 Aug 2020 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCUv7VPVG8oN5Xmva7GVoFqSpuADxNTCe1KaU8Lql9s=;
 b=BdGfA4kfssBHbtNJVfS8oMg9TgYMwk5sKabh0jEkxc72w2A56F5UpE/8kjmQldg4gO
 XJQ3foK94V8/6Ebqb5CV0mRH+bx0OadJuof3uhNuC6J145+8J1q1+gsiV2F5zwxxPPIO
 cX2GV0vKy9L5a+gjK4AvaZbcvas8TSLgHLLychA7FugNj9njYF589HgmbaPNL10uyO0h
 CwzPP9jecNSYeUShKRI0U9F65FIbRy8hUt82scYdsDZT+4pSq7dO4Y9UPPMWgjvNA82c
 LCMIj8QcROiO7shD1awmZqM1wd60f0WOG1Kj3YrS3BKSPgOOGahq8eT4lys5tDh6Beur
 FYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCUv7VPVG8oN5Xmva7GVoFqSpuADxNTCe1KaU8Lql9s=;
 b=EtftYscGp8IBL1vIfsyTrCr0f9Cx7sGb6TYJgsGABmsZbVITU/GdNQb4gCO3v+nx25
 7AJUv9BYW1kY5hfBy75C4bs311tuz8SNCHUoiSENZkgV8e9XsWc59t3S6gsJh5AHQ/2S
 DUkMoq/qN/4K7VCmaxUPaYegzaW27Um5f6d8dJyfDALdNUR5tAHgQebRSjjXtd5VnGja
 rWNzA/kK445oQmuYmBLXX3XX+ifX1LW/wCwNakvawBkXwLehC90VP+EvjpL5tIxkyRHC
 4AtMavPXQjdnDIZd/GJb8v2DYf9zkZEUnVUjbRAQXiJ/RAYlckLWdpHFzjy3MB/Uhkyq
 HISA==
X-Gm-Message-State: AOAM530vZhpkwBXONiyf5RjamvcimJpGhPOlmx7IFRUyUHOz7qVe1lxv
 1BGikQlz5xjEHWkfODP8Pg/fnBN2JpeM1AfeWHU=
X-Received: by 2002:a05:6638:e90:: with SMTP id
 p16mr15542850jas.26.1597681370325; 
 Mon, 17 Aug 2020 09:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
 <20200817140144.373403-4-edgar.iglesias@gmail.com>
In-Reply-To: <20200817140144.373403-4-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Aug 2020 09:12:18 -0700
Message-ID: <CAKmqyKOnVYAUCREoK6kejyk3mTZn8+xrRXFR9XVFwBBmvx5Bcg@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] target/microblaze: mbar: Add support for
 data-access barriers
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRg2XKbJg58v

On Mon, Aug 17, 2020 at 7:02 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for data-access barriers.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/translate.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index c1be76d4c8..c58f334a0f 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1233,6 +1233,11 @@ static void dec_br(DisasContext *dc)
>
>          LOG_DIS("mbar %d\n", mbar_imm);
>
> +        /* Data access memory barrier.  */
> +        if ((mbar_imm & 2) == 0) {
> +            tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
> +        }
> +
>          /* mbar IMM & 16 decodes to sleep.  */
>          if (mbar_imm & 16) {
>              TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
> --
> 2.25.1
>
>
