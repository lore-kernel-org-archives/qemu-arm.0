Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2397821lfv;
        Mon, 1 Nov 2021 11:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrlARApKdk9cdvWyO41rH4dUGVBqLVVclSELZK5HM0k9lnAgPcfvWp/bhjZPjX0mggti0W
X-Received: by 2002:a05:6808:13ca:: with SMTP id d10mr627347oiw.154.1635791771394;
        Mon, 01 Nov 2021 11:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635791771; cv=none;
        d=google.com; s=arc-20160816;
        b=GZki2zNdcQITuqeBTka6B3qLs8cpeRI3oK0mCEO+MJwLYoSMDPR/cYOId2jo1YvlCW
         WQMdWgvZDsDmjoYOrYznO+3ijYHXlEajNLvu/JO04HXa9FolUsnYCOaqiaZmPdGsfoXT
         0RiR3oyiCGGdF+5yRky2sEB3d1FBy8JhW0TKdyHCp1Hlz3nwJj9WQLmrlArBtWM/SCSv
         UIkRfaE5wk1SzHxBzaNC1XB05cJeh8xiQZ7MrBn1u0Xcny1DSWwUXcNAPZOAVwOPSkjz
         IMx+qHc0aUj0LYPp0Uutsg1gFHcxxsAyXgQZ9GW+gSDw2LRp4f07CzSxGH2+45KoHz87
         xM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BRWPFWQB86a++wO4lPOeT5dVG9T6xAvfTAnsIottoe4=;
        b=UjVycFcAhmLK8u68i6zbRz50OiAX64SZHl+vNA7MNhkmRZeqs62an2KzKnf2VOa+VL
         vS9Oo6JFGTQy2xFMfNvCNuaRFmP+SBuVYXA2yhoVITmMVxEmijl4oHshB7KWWzs762UV
         fWHiRdx+QEgk36ZMiOPzHVeZLkdGJoIDztPfTkaUYnmt9ZtXufSZaXD4ZABURJsPKNKp
         MLFZQbBOUtRbqf5+lesXOvTn3rcpZx5+T11dpaw8m9WEy4pDyINFTsFCfqgDck7tijzf
         qxsCl0cFpqE2JLuGFASu6AXMctOBOAqXHqgHiNPpd6T5PRvFPHBbPAsSLzgxdnwaikG2
         iGhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IZh5Xdzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t184si13762945oib.258.2021.11.01.11.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IZh5Xdzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcAE-0005Jy-Ny
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbBi-0005fb-3Q
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:33:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbBg-0002dV-57
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:33:37 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso8471567wmc.2
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRWPFWQB86a++wO4lPOeT5dVG9T6xAvfTAnsIottoe4=;
 b=IZh5XdzyK2IQZTww5loz4KMI2eDCAw7qr0rN7gQXnbXwwMKiZd05xxzVZNz3M7wRAD
 7AeuRAorZRn2w6HcNYz+gdIe3rMXqdMOAHUvdt+VoliGyphITzfy+0Z+JqiMErQaMGle
 DfBwQ3eLKHjEh19TaRWMs8rtE4nM5vnO98PtHyVdPV7Da/Ynyj+Ms9c6swbsSmiWMbj6
 0pyoWMRrh2OOdIiTQqsK/cdr7F9sCrIvQd1O1Nu82bkn1zh5ieFOjhg2TLRlbNoREY2u
 AyHbQl7wx8WdtVfyiKsrqXvPymqcdhezctKouo5jYLUYzzTXbYshmoXSNOr/PGfz2uWb
 0crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRWPFWQB86a++wO4lPOeT5dVG9T6xAvfTAnsIottoe4=;
 b=wPi3+95SQmWJDCkbqP7yPA/e/TpaEoa9yCEd7KFvocpCTZRkbdk7LMWHIwr+Rb3sG/
 sFY90pru3t4XDrOZoVqIyH7899boOfyoyPqS1lG9FYN9P/6qo17pnIMzgM44pH5Y15FJ
 wukArOTBV85/xIlLcbI2dXZpH70LMZmgb2m+lwwEJd8Hb8/Lcjiyws7M2rfm6kU0STzg
 gkW52Xnk0QR6SBwki1fd2NK1e4geM5PDyplLwWaeP1wMC8dhvxwm/ZRrvlJrgVtH82fP
 zVW6m2ZvG7DhoBHz8mAmJs1vBmBk0QSKtKypntv6ufZthzS1XdTYCuJ+RM8zuPo53nUH
 4ISQ==
X-Gm-Message-State: AOAM530mR923hhuhT8B60auPIPEBKcN0Y9izr3hqUM+ncFp+IhM6+jkb
 pswfxj1A7B2LU4dTv5UPq16GCuOiWRMF6wHgGd8WAQ==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr354031wme.32.1635788012633;
 Mon, 01 Nov 2021 10:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-8-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-8-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:33:21 +0000
Message-ID: <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E4PmFYjszORb

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> The ID can be used to indicate SMBus modules when adding
> dynamic devices to them.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 2ab0080e0b..72953d65ef 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
>      for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
>          object_initialize_child(obj, "smbus[*]", &s->smbus[i],
>                                  TYPE_NPCM7XX_SMBUS);
> +        DEVICE(&s->smbus[i])->id = g_strdup_printf("smbus[%d]", i);
>      }

This one looks weird to me -- I'm pretty sure we shouldn't be messing
about with the DeviceState id string like that. It's supposed to be
internal to the QOM/qdev code.

-- PMM
