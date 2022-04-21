Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp572336lfk;
        Thu, 21 Apr 2022 11:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm1T4nUZ7Q7cWbLms9Icck2U8cPrH0be1D9g0AhqvAtsubFVXwzUYT++qevZytggVjJnD7
X-Received: by 2002:a25:ed08:0:b0:645:811b:3f04 with SMTP id k8-20020a25ed08000000b00645811b3f04mr1190962ybh.100.1650567533013;
        Thu, 21 Apr 2022 11:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650567533; cv=none;
        d=google.com; s=arc-20160816;
        b=kwryCufYxbMJEERBkaCdKI6vPDQl7RTFoNgGO8HkjGFBBpESsmWwX+AyiWOs54vgXv
         oWjDJUPG8AlX9kW+eq/o8kfdK4FunatR4npKFkMu5XMKLx44bksMrnjSETpmh6NTo43x
         MDHm9ZbCxD3Uk2TaXgDzm91AsW2u0RGGQMtmAXINJZo9nWjPDwblw0a05akXfHSRvtfM
         XfzU7b+VjpTRDu+eK/PdycC7DRqnanhRk5I7c1pDtfCLNM1Z0xtbEo4Gix11SO8z5B2q
         CUqgFXn6bSbXn0WeVi+jGxmqsBz8ECEptMnM6EU1DtfffAnutEgkESKPHS+RTo4tcaWK
         ccfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qj/nHI3qZsguMXXkfdW3xQqvOkV+57RWuo0wJN+zWbA=;
        b=AGxrOlBTbxB0LSqgmSC7CLJW8uUPh4L8l5K4bMKBuw2LQzePFTsq1DNNiV8fjBbD4m
         XgBP8SnKZFNAqSpTrBXDvYdZbcz3iLOTmV6ZAr+idp6C5bGGftvgj6ZXlhS6jjZLWmZJ
         sJ4c5zhj9CvIQVSFKEWumWPjRP1aIEmC4wuUxgiIxEAe2fkIcCvAhT+4u29I6Cx3jJkX
         6FyNcyEi+AVfGUFlGbpr5XakT+kXKwXttY+gmpyDQzkmsLS7WbIAgjX5La8P5Qr71H8a
         +UkUvy8Z8np+O3r985FSNJ3rAhk1YTYA47U++Y0olHjnpx+oiuz+A8Bu4pyiK4IEuJQS
         W4JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U/yQQ6lH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a25600b000000b0064161a277bbsi3288322ybb.375.2022.04.21.11.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 11:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U/yQQ6lH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhc0y-0000bk-BA
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 14:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc0L-0008Re-6A
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 14:58:14 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:40915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc0J-0000Hd-A7
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 14:58:12 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ec05db3dfbso62259927b3.7
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qj/nHI3qZsguMXXkfdW3xQqvOkV+57RWuo0wJN+zWbA=;
 b=U/yQQ6lHLukqnzjoCHzQzT6Sxj3eHO7y3giCDfTuBVlRAbmJHkfzwJ2VUc6qyyiVEF
 VEsGOIEWfqs7Rh7j53zfTU8kSI07NzzsBtiOYLeZZe90x5pBYjvzesd52UMbauj8ly2o
 CZDfrXacto6iF0zdwkIeC+pUnq9xqk1KYqdTpSEa16ctACTQZboo5d1EvvL/M2qqEmA8
 fWi3+Lba/zbIALXLJ5x17PDVV/Sczuj+j8zym1x4vEVKx9BIVhGBVFMN9Vwr+qlc3JPO
 tS9IqNut+HhpIyJcafQYN6pdYFHTg0cgMyoBmJoVpGON8mwMrp9MEi7tclQydGf8Oljm
 bkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qj/nHI3qZsguMXXkfdW3xQqvOkV+57RWuo0wJN+zWbA=;
 b=PNNji7pubCKbL/g7CNBEg5HBWpPztVvwzPZF/8c16Vtq736XHp6Ihl/f7S4cnNfaz2
 LAGfZGyR0rJP1ymnNyQ6g5OM0/2tc8utc0bgZ/eFByjEIE0jSKC6qCIF1d3Xhx1dybHQ
 4jpa84mHzHjZdsHvPN7XQLvL3Iee+1/e317laaou5UEqQqAnapYgwKd3rN20kffuPqtL
 OZ/1YYoFMYvL+0+C6VK1geXFzGHspn9JIsahcK7jhWeV1dl1YPO47AC2rIEDc8QXMVO7
 FtaJ4n0tEa4UPqH5FpdxbCf+XYdOZcTvysdIJI6Q3kwx5AOiErxz9qP+lJ5cUuPpLGEf
 Olmg==
X-Gm-Message-State: AOAM532Sz5J+7lM7Xxjt36xmZA8Ev09kt7cOfPWM4MC63OkGyMSs5XLC
 g/DKskIUgUjKF3A3v7RZlyTIuuNl/EmXnbi+k/7Ljg==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr1173717ywj.329.1650567490246; Thu, 21
 Apr 2022 11:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-16-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:57:59 +0100
Message-ID: <CAFEAcA9a5y4+RTpx5eL3sJdv4oDrqi4vT59gc+Dok2kQD96W8g@mail.gmail.com>
Subject: Re: [PATCH v3 15/60] target/arm: Simplify gen_sar
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tR4DllOhmtC8

On Sun, 17 Apr 2022 at 18:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_gen_umin_i32 instead of tcg_gen_movcond_i32.
> Use tcg_constant_i32 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 57631c9fa1..8d6534f9a5 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -568,12 +568,10 @@ GEN_SHIFT(shr)
>
>  static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
>  {
> -    TCGv_i32 tmp1, tmp2;
> -    tmp1 = tcg_temp_new_i32();
> +    TCGv_i32 tmp1 = tcg_temp_new_i32();
> +
>      tcg_gen_andi_i32(tmp1, t1, 0xff);
> -    tmp2 = tcg_const_i32(0x1f);
> -    tcg_gen_movcond_i32(TCG_COND_GTU, tmp1, tmp1, tmp2, tmp2, tmp1);
> -    tcg_temp_free_i32(tmp2);
> +    tcg_gen_umin_i32(tmp1, tmp1, tcg_constant_i32(31));
>      tcg_gen_sar_i32(dest, t0, tmp1);
>      tcg_temp_free_i32(tmp1);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
