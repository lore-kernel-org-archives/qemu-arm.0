Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2091778lfy;
        Thu, 6 Aug 2020 15:57:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsRyDaoVOREWIcMPZ8kt4m4HqdeJebAXCwRmMQ7IErwB0FmnnanenMk5pnO3o+mc0IUFF1
X-Received: by 2002:a25:7401:: with SMTP id p1mr15747372ybc.10.1596754640179;
        Thu, 06 Aug 2020 15:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596754640; cv=none;
        d=google.com; s=arc-20160816;
        b=F65pBH6ki5lM8/yrANIbiicgYiB2y3pOBL+a7qBd8Fb9t6GDWV7kAxnDCHHUxKoZq0
         iakBOqb4JADxpVVBSKEUUGq4kJNqCZQC75Ra85tFW5uMvVe08DshCSWescmCXINTh+dd
         HGtB+iV34mu/kERg2nPxvD6Rpd9eETJuTJE6MeTtVOMlTJsL7o3Kqkbgi1HbnvQvoPrl
         X3u8pXAizIjaQOxZom4rsVAU6xeAZDnINJ2O1X8IpD7gk8Yg2vdCJ4hQIa4T2MvWLEEk
         B7I/S/+ZGu0pWwAeJflu8f8fujuMgHAEEfxjU9c1hdUb9w4SeVJMrLLUI1hJH4j2zzSf
         0zKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Qu2ENRZk6CkwRhGJYY8E5JdAc3goZ8oYK8L9brcXu9s=;
        b=jpiGADlOLCsSaG0SXeKon1Ty1GDwqStwdVB2Jw6WGc5211ZQjgdv9U0QNc1G/N/sKx
         qP8NOIS86Huo+mjgAx7iKN+fN/NVIlZLP3N4FRlMUxqoMDOWwfTp9a0vtheWqBCADTro
         usbxF8LdqrUkJnyAogq/eOVWxP9l6xNmmxnGzzAK2LBR8XjCIvby9c4mxvEO9j1Zbaju
         qKmKeiwOs9lcjz9fDbLeVPZcCdjkA4EWQeZri3y771CCHgAcQD9JMWgz5UjddSJ/yosp
         Ez50ZNyFcnMyHTR7czTA+Q2wFnu+ZGTu6ZiZW8ltoMlsAFS9cpg2iPSwBoNU3wOENyX0
         91PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=NNEutSj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si5956098ybn.356.2020.08.06.15.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 15:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=NNEutSj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3op5-0005pQ-GN
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 18:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3ooj-0005p2-5X; Thu, 06 Aug 2020 18:56:57 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3ooh-0007hG-HJ; Thu, 06 Aug 2020 18:56:56 -0400
Received: by mail-ej1-x643.google.com with SMTP id qc22so70841ejb.4;
 Thu, 06 Aug 2020 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qu2ENRZk6CkwRhGJYY8E5JdAc3goZ8oYK8L9brcXu9s=;
 b=NNEutSj3sdizOa4rdGh7HZz/Zx9O9d8MXEs4hXDR/GlRNQGlFG95gh/rlQmSgbGCKt
 gesZyOFn8IqWKosvUvroGmB3PHxCxUBb0yrh+QDAf+EhtBpkErg2CfJAJSvQe85qHOwh
 WSwJxS8QrzSGYv4vaJjb2rXz0sE2i8Pmh53Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qu2ENRZk6CkwRhGJYY8E5JdAc3goZ8oYK8L9brcXu9s=;
 b=Lf9To3D92ZT5obaGsrZjZ0sj9swoaT3URUyLj1AE9LqPfIu8Mf8r57yQ3APPtXX/BB
 aa60XWGAosWkuehReJs4CqTjZ9+PI3FZwdlgM3KKNTxO0GDpc7lyQ4v9CTRGedTWWEj4
 b0YCpQsRuHdl2HDUEsp+Fc8oPRRTW7cwE0Uw1IFX+tnasgZ+PmvXipgr3l+9HLYrbkaQ
 +Kk4Y9nZDcIEkQNUybWqME/KABmC7gBouNqBahXM+YBEH+sreO5bGpqvetK5Qpk7IPk3
 XCY+lSF/BfFtlB80lojSN8Yl5Wo2xazcKFMB/J36Bx7ODW2NO4C7iO+MW0Xcr40ZR/px
 OVBw==
X-Gm-Message-State: AOAM533D8upo2lhV6XWda6qh0ivNPF/Y3lz8PtKPJWiu/srGDH0UMDTQ
 ofEuT42WP5xi6pGUDA4ZvZ3JSacZnSLro74RMco=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr6509601ejd.266.1596754613333; 
 Thu, 06 Aug 2020 15:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-4-clg@kaod.org>
In-Reply-To: <20200806132106.747414-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 22:56:41 +0000
Message-ID: <CACPK8XdaTPFiv4eD=5rTUuUrw4d5c0Xjf1E8gDD48JgByXMuug@mail.gmail.com>
Subject: Re: [PATCH for-5.2 03/19] m25p80: Add support for n25q512ax3
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
X-TUID: WfVMHJdpIOVt

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Datasheet available here :
>
> https://www.micron.com/-/media/client/global/Documents/Products/Data%20Sh=
eet/NOR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 1696ab1f7821..8a3fd959e218 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -238,6 +238,7 @@ static const FlashPartInfo known_devices[] =3D {
>      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
>      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
>      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> +    { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>      { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K,=
 4) },
>      { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K,=
 4) },
>      { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K,=
 2) },
> --
> 2.25.4
>
