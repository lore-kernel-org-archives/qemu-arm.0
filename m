Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp272839lfb;
        Tue, 29 Mar 2022 10:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLk1Jw3568yeWmACcsfyHveOwJtL8GmePmTm9CaOM/KBxXMcvabtEbVK/bLXsZj2u5gZAx
X-Received: by 2002:a81:578c:0:b0:2e6:2488:7ef8 with SMTP id l134-20020a81578c000000b002e624887ef8mr32387060ywb.519.1648574644951;
        Tue, 29 Mar 2022 10:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648574644; cv=none;
        d=google.com; s=arc-20160816;
        b=lFvuS0OJwZnq60u/Bt9akTQ7tOUsIOmB/JXiq7NYbWJBADxyx/v3fdT8eSnAVJevug
         nQXmuGRkWlPG+IJcKyedUvgng38vvYiraFO+hqxzIohHbasyu/4njuetQqTEn/OobdRw
         IJ9iv468/WxEFGX9q6OO50hIVGIvlk2obFrcpKh4jfIidpcJJxLzKKTpkd+9s9QC/EwL
         JlTZGDtOGm3BGZuue0OuV85Gy9Br9r+EByDKXM9wdwcxsy6yUKUVF5KYaaG/5YRkRjxZ
         thHUER4GBQ70aCQm5k3Q54MS/fy8UrQz+QgMyKfKQzgc9WZGIrnrQNuWblac84/DfsQv
         B/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iorf93V5jUZjrp9jYg17LkNdBcpp4HCcM5vL0uY7Kwo=;
        b=AUnj0hV/nyC5QLq8YF7f7Ugpo0HuEhlwvMmDsBv2cnNG6E+Nv6fv6ITW2qF6xWsG2b
         wNYTKQzA6zHh1KZV/7FvZpRp9u03QsLOMBAoWP/aIkjaxGP/2RikPPQ/WIfGl+hcX78x
         n+sHq8xbcmEfSRevAMOD6q38d8D85GbsHUCyq0V0RLvDSTooWlde+2k55jwNQ+8fihAT
         yej6oEdTYbmqVMZZDn38h7LjOR8XBnz4GI0BDchrELvyWd/qtzawUbvsBldVqKfp6TDn
         b/ewHobenQ1+kVBc58iYEyXfW+iypWgjuHmtLk8wn8UypoWQBJ3xqXgGhfGlDv22tCSe
         Mb2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nu694tXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23-20020a252517000000b0063ab0e86c81si15688932ybl.107.2022.03.29.10.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Mar 2022 10:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nu694tXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZFZc-0006id-7v
	for alex.bennee@linaro.org; Tue, 29 Mar 2022 13:24:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZFZP-0006hF-EP
 for qemu-arm@nongnu.org; Tue, 29 Mar 2022 13:23:51 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=37609
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZFZN-0002TC-RJ
 for qemu-arm@nongnu.org; Tue, 29 Mar 2022 13:23:51 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id m67so32744816ybm.4
 for <qemu-arm@nongnu.org>; Tue, 29 Mar 2022 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iorf93V5jUZjrp9jYg17LkNdBcpp4HCcM5vL0uY7Kwo=;
 b=nu694tXEn/T+mxLT/qkGf6vRqKQM4rXlcJSa7ainAzmIYqgyGwGBBTDw8bWNLUQH+D
 hmzSr+oDcH2GvWOIl5ZyCEz0OWqkos2uInccyah5tsxPlEUU6nCpmQvJU5Insu9FVaRx
 VdbIGHycyk8NuW+dIe9VcN6HMxqvLWWvuqfZriCiHB5HSb318diyQ9y84psE8YOd2xX3
 mEGpjKrEQfCG3Sw7biIevFEBX6aEn30GG95RV5y7aFmrgqAVCajCk/RCWZaOV0RJcfEZ
 1Tziizu5egCCvDCkbfo5gdl205h5pJzn/VBjIYPeJC/CZ61maTnm0IhY/jOzv/W9C9nt
 823g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iorf93V5jUZjrp9jYg17LkNdBcpp4HCcM5vL0uY7Kwo=;
 b=tvpCgKf3Ko+kdSKCFVYSQ8hcS7op849Vnt7uV3qbiU6uJ6ldIa56+WfeRVrsgrW5M/
 S2ZooDkfDbn/TpMUDIbgBgvtaN8oLd0D+DHDSB8tfI11XnUlxq2JoELtTrIGGZj8tcYt
 gw1HroRAMqF1XpwAWQIs5eTFuqZ4FX/hHoCbr7gZmi99GgOFeKW0e0o6Mw9GrbZZ6ZoV
 b9mnkzXPoIp29bNe/LcppGjZKkHppKAvInTu5gbJUJQ0mhGe1NRn8GuarCRG953277MC
 /Ce4QU+4plJAtK/ShvmZAnMAMZ8Yp35WYMcG2Y/DNIt/Q5XlK6Io3QIqi9UhzaAT35Iy
 LuEQ==
X-Gm-Message-State: AOAM531y+cPAYhwVRcK4R+d43QhamsHVj5vPXemCBnDO1op6PLn/PrKO
 OnWeUDBrAAAbvLOugHe1CbPa2HghnTDBESIfZ/zCOg==
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr27976614ybg.193.1648574628643; Tue, 29
 Mar 2022 10:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-5-marcandre.lureau@redhat.com>
 <CAFEAcA-g=XaURutqWd6okRHb3-pz3SegaxRMG5j2s+PThQHdGQ@mail.gmail.com>
 <fa67e24a-1e6c-a3b7-0db1-ea2be261dfa3@gmail.com>
In-Reply-To: <fa67e24a-1e6c-a3b7-0db1-ea2be261dfa3@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 17:23:34 +0000
Message-ID: <CAFEAcA-uqw8FmqkpMLJT9-hbdmWi+7L8Nq5JBpKc6_yK2G=W1Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] intc/exynos4210_gic: fix format-overflow warning
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c7a9rKOfO02u

On Tue, 29 Mar 2022 at 18:08, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 28/3/22 11:15, Peter Maydell wrote:
> > On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>   hw/intc/exynos4210_gic.c | 9 +++------
> >>   1 file changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> >> index bc73d1f11524..5b6f4330a5f3 100644
> >> --- a/hw/intc/exynos4210_gic.c
> >> +++ b/hw/intc/exynos4210_gic.c
> >> @@ -289,10 +289,6 @@ static void exynos4210_gic_realize(DeviceState *d=
ev, Error **errp)
> >>       Object *obj =3D OBJECT(dev);
> >>       Exynos4210GicState *s =3D EXYNOS4210_GIC(obj);
> >>       SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> >> -    const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
> >> -    const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
> >> -    char cpu_alias_name[sizeof(cpu_prefix) + 3];
> >> -    char dist_alias_name[sizeof(cpu_prefix) + 3];
> >>       SysBusDevice *gicbusdev;
> >>       uint32_t n =3D s->num_cpu;
> >>       uint32_t i;
> >> @@ -322,8 +318,10 @@ static void exynos4210_gic_realize(DeviceState *d=
ev, Error **errp)
> >>        */
> >>       assert(n <=3D EXYNOS4210_NCPUS);
> >>       for (i =3D 0; i < n; i++) {
> >> +        g_autofree char *cpu_alias_name =3D g_strdup_printf("exynos42=
10-gic-alias_cpu%x", i);
> >> +        g_autofree char *dist_alias_name =3D g_strdup_printf("exynos4=
210-gic-alias_dist%x", i);
>
> Dubious '%x' format... Maybe change to '%u'?

Makes no difference given that EXYNOS4210_NCPUS is 2, but I guess so.

-- PMM
