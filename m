Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3019304lfy;
        Mon, 17 Aug 2020 09:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSwIjFLAhxZ7tFgU1oZFfjZLzCUcTrDwVugKy6/URHMdwP/5ehabXC5fOXnqbiiV+OiL2p
X-Received: by 2002:a25:68d3:: with SMTP id d202mr20858821ybc.81.1597681296886;
        Mon, 17 Aug 2020 09:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597681296; cv=none;
        d=google.com; s=arc-20160816;
        b=UIujvKwdRSO84h/N+x8xzhYquO3akVI8Z4kDFXUA74dAvNxyPNM2NgTgpcgwaJvkf4
         0W0NSJRlBZHUhUBLn5jitzVWgwq2pkGouHJj2wUt6zD2yEWE4ZURT/2JSBG2d/F0UtX0
         Ggq85GQS0AxXzu7Y9jl8EFvE6SCptY+HDTzrOpeHr5n2IxJWDn+w45SLhwmpo3qVDD/1
         htrwt/TqAh0JBuEJkihON9DP1BsowW9akUhBp+Vn8qqtv47LHkmb6Ka7Ud6fYFR7ii4P
         7gzYZlT8QE0vcucB1U467orUPl8rO08hh6IZxn8sDbcxZCu6aTqsNuATjT57KrwQeZXu
         UWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9XCntgwV4W2FDTPpu1YQgq63ARJn3VQZsFMwFACLI0=;
        b=jl/bHZ2rxR/GIY2Torg0HkBYIPqhCMkyzUJqvPecbDawtoMNnN5wn73diCrNVggsZG
         Gkp44z0JigJ+u7arGohiy/WJ3ExLb63v7qtYSYTPAzif4YWU/Kahr+JKuavv3GnlKOqg
         51ENcfW1+QZ5tUDX2c/KdzJycywUA8IxKJo7qgx/3GnxqysdHMrAYB+ucAqRnoypU3Hk
         6nQhMykeebkwe86zqlobWXNCzZoTH1Uj2xKKmYo+yc9hcGdnRkODa8tosg5Bv48Ozip4
         iC4ns6ER7XOeizgkZaKtnlQ/CuaL9tznf0SAuR+/LGj7krCPwD/LghC+c0bauBa4CS8l
         0Gvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bs4HTi3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si17241348ybk.249.2020.08.17.09.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 09:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bs4HTi3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7htA-0006Pc-7x
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 12:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7hqG-0001JB-Kn; Mon, 17 Aug 2020 12:18:36 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7hqE-00050I-R4; Mon, 17 Aug 2020 12:18:36 -0400
Received: by mail-io1-xd43.google.com with SMTP id u126so18085772iod.12;
 Mon, 17 Aug 2020 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9XCntgwV4W2FDTPpu1YQgq63ARJn3VQZsFMwFACLI0=;
 b=bs4HTi3c1VSr3QBvajFKLXejfMxsMqR6knecjzwkeiEkfxA91VzONAAleXY9B/tdv7
 DCmD+MBjfmQTqb4RKHjYrUOlx0EhmfjXSaL/ozMGuZWhgn8TcxvHCfq1H15sCXnpgjHD
 /QuTmln589j3rfBXximJz7hPwz8ONvVfRxVPbkq8+8kSBzhuXpHD5MFXE/s8xZSEvwel
 XJN9A9CagnrenyLGtltfrBdmIIAo7KExQzimLiWKdX9I+2RxQba9jorzK6n1XSNhops1
 hGhB9tAiufUB9WxmF0T3hNYybpGVEU8bcTcnjPhj0WIRg3wIh7rniQ/MLFP/P4MoIvH1
 ieCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9XCntgwV4W2FDTPpu1YQgq63ARJn3VQZsFMwFACLI0=;
 b=dhjMWABabmH/SvH15EA8TR1ktXwRNZYmfLhtSjXJ/EHtOyInhnxsRIW04pirV/S+mI
 sZzUMZfXWyVfRC5pwKB2X6++xhLfuMc0slVZUatCN2wP5tg3EE7yaVaZNyWVz+DnGsj+
 blvKDkkgbPf4/3dxBZttc1UvOOaW8Cmbss6gdyBl+Zla3D3T3q0QEQ+YnvAO91XKqTEW
 qKIVFTverb/u8eEy+vVea2kr2bHRXpAt4LSsCEaCtxjLlneXnzZzMQ+XBuHP9H7w6eky
 8occLStyZbvXXu2DKAOfwHJsinrj8xilFUyKbcpc+vA7l3F+AKc5JUM8mADsSO4FQ/JH
 IKug==
X-Gm-Message-State: AOAM531GnMVhvjjHO8akcT56swMpDSXM4wYZzKitka83jdNuff2NRtfK
 cMc6xeFqzUM3HbC/okqcuqall/wyqdBkFxxbutU=
X-Received: by 2002:a02:84c1:: with SMTP id f59mr15357394jai.106.1597681113382; 
 Mon, 17 Aug 2020 09:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
 <20200817140144.373403-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200817140144.373403-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Aug 2020 09:08:02 -0700
Message-ID: <CAKmqyKNoWVxf0DPnNv0xOmhffGYmkVwqTwuvSKy0H5xvgotj_Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] target/microblaze: mbar: Transfer dc->rd to
 mbar_imm
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EvjRpTzmDmgg

On Mon, Aug 17, 2020 at 7:04 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Transfer dc->rd to mbar_imm to improve the readability when
> comparing to the specs.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/translate.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index f6ff2591c3..47637f152b 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1229,8 +1229,10 @@ static void dec_br(DisasContext *dc)
>      /* Memory barrier.  */
>      mbar = (dc->ir >> 16) & 31;
>      if (mbar == 2 && dc->imm == 4) {
> +        uint16_t mbar_imm = dc->rd;
> +
>          /* mbar IMM & 16 decodes to sleep.  */
> -        if (dc->rd & 16) {
> +        if (mbar_imm & 16) {
>              TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
>              TCGv_i32 tmp_1 = tcg_const_i32(1);
>
> @@ -1246,7 +1248,7 @@ static void dec_br(DisasContext *dc)
>              tcg_temp_free_i32(tmp_1);
>              return;
>          }
> -        LOG_DIS("mbar %d\n", dc->rd);
> +        LOG_DIS("mbar %d\n", mbar_imm);
>          /* Break the TB.  */
>          dc->cpustate_changed = 1;
>          return;
> --
> 2.25.1
>
>
