Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2141237lfy;
        Thu, 6 Aug 2020 17:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMYdChXdoHb9aZZeMBMPrDw9dpDB7mBhoZrkHzE9dexhJxoavoy/+b+3HNCB5Z9ChaRGWF
X-Received: by 2002:a25:6986:: with SMTP id e128mr14950025ybc.199.1596759184679;
        Thu, 06 Aug 2020 17:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596759184; cv=none;
        d=google.com; s=arc-20160816;
        b=R5ROGZ+RWJK5oNnqEhVJTheHtcURM5eXbKPFpf+a9Ln4zBm3phx+lsk0OpSRi4/A3s
         TG+dkoqOzIGcWBdIWd1q8mTIB70LDb+TqlJARa/io0C4MoQWcv4boO8zTl/lnrxWUopE
         LdQekN2ZyQJHAAfpkkL3UVI2erALF41+dvy7gGGKqWXAI9p1X/y4EkntB9gO99FrGS55
         n+mueX+QuxRb9IdKAOkhsvBzLjuu9s73mdbAg6wbj0sNSgvECjCfZtPKIydJPkzEdqd5
         L7eHP8nWCFlMHNFevd9I6oCLDjLuQZk/d9riDzXs8PYkd1ieWsfg5Icac2ES5xU/634e
         xf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RdoJ616D1ZAhofYamDE/inbM3292XAH+lYqk5KBRI/k=;
        b=MKP9VKEXq2aO6j3/KIxU3AyiETF45fCQTfl0JVFnFSqRiZcZJKQB6nQIRfgO1CpVzi
         GnF96uZUo2eXo2ix7looBrNassZIUWyJ7ANHzyqM+16JgUUc/GdS0AESh0fgyJSBYWAF
         ZhdKi9P5d9CoeLSc+rYR306Cb5zafo/iuEaAv73zSOCXSoCjc9/3tFRAip7VNUORNxQg
         Gte8VioDhOlPkLPUybedhwpNdO2H5tCyy3cdkY/VWI/dNLWE/kwcOiuzpu+k5SnlqXi7
         wN3Acdqo8IS3nP8K9hFvgGdf4AAIW8+wMSNGCHHY2hHMRAP08oaQKl+BTrTHUetbuHqg
         vBEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="iM3fVM/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si6327373ybl.412.2020.08.06.17.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 17:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="iM3fVM/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3q0O-0001Fl-0p
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 20:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3q05-0001Es-4k; Thu, 06 Aug 2020 20:12:45 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3q02-0007Tx-H1; Thu, 06 Aug 2020 20:12:44 -0400
Received: by mail-ej1-x643.google.com with SMTP id kq25so220987ejb.3;
 Thu, 06 Aug 2020 17:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RdoJ616D1ZAhofYamDE/inbM3292XAH+lYqk5KBRI/k=;
 b=iM3fVM/VZpmBnrNqtY6e7cCQWjRYZ4d5NrxH5+V7vEh4aPpyXQ0AUfmadt9hVT/b+d
 njmbvDjqJasHN2r7ONKkRH6umPWPd5iZE47kCoToeAAO4XW3JItcWtDuHM/WIJ8R6pve
 gY8381F+4Hd3saOd27LdfIYqlHYW8yfgZwW8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RdoJ616D1ZAhofYamDE/inbM3292XAH+lYqk5KBRI/k=;
 b=mwuvtVZKPrRDn1jvC3lU7cQNb+SGuH/hEcdHU33JLkpd1cLt7D6xuT6Gk227O4bjj+
 wEDyR2TJwbcTkivcBovqP1QTza7TE+29iHporyS483YVMDSWj7ZsO+QNCwgi//NA1uPO
 lQraXsTVfP7os4NtnitvgA4HdiT+zDztnxVX+jB3WtPUMobO3avz19niQXL48HSXuZ+b
 NPF0ufxp6s9mquMgY4LRM6rsBML1GVXzflJG2CQutck+RahBeLgoK04c4bR0R220I5gb
 MoXdMiTPkOuanxfpHi3KhU8BGw5Vcpv/VA51iVpoFC6SVSPLL1WwekOFyEUY8WKf+6d3
 kqOg==
X-Gm-Message-State: AOAM531a/vgWRaiM07n32jap8BZUDXkWLfzrYXyVp1c3MkI+18Q+JKeC
 xDqsh5rB6NW61TkOqAyikwBVbhugZ8rw1Kq1l5k=
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr7122794ejz.108.1596759160503; 
 Thu, 06 Aug 2020 17:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-20-clg@kaod.org>
In-Reply-To: <20200806132106.747414-20-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Aug 2020 00:12:27 +0000
Message-ID: <CACPK8Xc4uGR5OAX=TNmjDdHD7i2mzEkhJVty8tn-Z=g6spBgGw@mail.gmail.com>
Subject: Re: [PATCH for-5.2 19/19] aspeed/smc: Open AHB window of the second
 chip of the AST2600 FMC controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SnmsohEynZ7P

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This change works around the HW default values to be able to test the
> tacoma board with -kernel command line option.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Good fix. This was required for Tacoma when we had both flash chips
enabled in the device tree, otherwise Linux would fail to probe the
entire controller leaving it with no rootfs.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 8c79a5552f93..795784e5f364 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -230,7 +230,7 @@ static void aspeed_smc_reg_to_segment(const AspeedSMC=
State *s, uint32_t reg,
>
>  static const AspeedSegments aspeed_segments_ast2600_fmc[] =3D {
>      { 0x0, 128 * MiB }, /* start address is readonly */
> -    { 0x0, 0 }, /* disabled */
> +    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -ker=
nel */
>      { 0x0, 0 }, /* disabled */
>  };
>
> --
> 2.25.4
>
