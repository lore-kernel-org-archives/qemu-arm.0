Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp505385lfk;
        Thu, 21 Apr 2022 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDXdn3tj/iC1U94NA+gsem2wUi/SH1HouYvxHkw8NEJYjCD9tTUaaPfhXlR7eBB5zDubmR
X-Received: by 2002:a92:c249:0:b0:2cd:5e07:7725 with SMTP id k9-20020a92c249000000b002cd5e077725mr309609ilo.227.1650560826948;
        Thu, 21 Apr 2022 10:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650560826; cv=none;
        d=google.com; s=arc-20160816;
        b=ILpDIDL/qVN0ET/fYs2Rv9762VWr0M2ALORw5qnM4PQ2/HBhFHkO2Nnxv1kuSbtxa2
         dFhJ6XXIkKSe82ipwfTtkabVMWqweNiPLBQrw78jXF9dvTwXMSMx+kTr8/yVF1s7eCsX
         REyFGyQIFBM57aeout/uEVF0SDRdpTNqhaHEi/veskoIYD7ZYb+8F+Fnmkoo1dQbOhsG
         B2nJrKmBuRRkZ+q02eayuFXnggpJVEcs2h74xg7YElLJxTNttCLsPTdHxfvj5im7GtcM
         bXMrqAryB5GLce2Nc7ooomGwUS7cm0oEdfM0x/V3d1djnIAVgbyY9ijyahudUWF73kDD
         NJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHQPfwL4ar6ck6OydhQmkIf9PG0jSvjA6PVgU/Afq18=;
        b=jAVLefxV6Ob6fJiopiS6Vj4wwcqc6YJqXZFw0nw3U37cAIpiiEq+A7Bu8sWntjB5qa
         Ui+DUKMVJ++SLBldDX2YAMFwlPwzg0SvTOnBmVIf8O5WYlP8CBWy/+w7WarI4xy3PNwA
         gcF72ZlW9mp3gnIHivy1SZetnwtkCqRsWACgBWPeO+7ijJVwn0AQtxc2QluVxWzLT8bJ
         aGTC+vIKKn4MxQxAHCQ1e5zLRmuUPdruOCnHUnCy9vtmoV97gZpR/DsUeJPKhBkfVSBp
         jFvcxY8twBzHQZAkeea8Az5bZcMwcpBYZOgCs4lOeOoBMWvBUz1H1GC3Ar9hPeNyTti+
         dzkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YzB0+Y0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a056e02184600b002c7c7bfb67bsi3018731ilv.25.2022.04.21.10.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 10:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YzB0+Y0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhaGo-0005MT-Aa
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 13:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZeq-0006DT-HO
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:27:53 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:40141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZep-0000iD-3G
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:27:52 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ec05db3dfbso57837897b3.7
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHQPfwL4ar6ck6OydhQmkIf9PG0jSvjA6PVgU/Afq18=;
 b=YzB0+Y0F5GDmj4pP9KtMMC1tUJG0QkmPI2Pw+x1uJQJJx0LGCeojyckkR2voeXRLFF
 0gxLbj9fdqHroztOemCCPppRKTrjktZmty7ZjJ+jsQjwsofHUemV+8Eq85I+NVt5mxUU
 RCBf7g0Q+WFZmckKl2uC70XJ6ko3I9Tnpe9dizr7+2vUs99AU4MgXrW4dOCbX3PeH6O1
 XZfhUwF5CBWEtgYYPoyjQTCfueQ6CKtiZxniREpD6N4Pqrd3ZVwnPhMu+ws2AZQQhIXr
 sB2EEGxoM9YHRZ/2scmgeDp9INxi0dYKvz4uuyOh8sfv1XT849jxQFHXhnKnmrk2H7nX
 um5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHQPfwL4ar6ck6OydhQmkIf9PG0jSvjA6PVgU/Afq18=;
 b=fXpEEmWkWdtpDZSahS0FhMIwNnTwaWnvLS8N6VHxJH6PyyCGNw6Vg+XF09BGNzC8Nv
 PhTpG34z+ETQUGCQZFWZlfi8HUq4Wnp+v0TcUOUFA9NE1v15QjDPV9qoPPRGbMpACKU4
 tAPiLEdEXYVwNI9EDYv06vk9RXvdxyq8F+AhUWz4dLsLiP4hpHIZu2lwcRxuZ92o5GgD
 5VgFI0Az7j8zKrLKWNOKuLN9/q48P/yTRJhGVtZiK/IUoaLcfCCH49AwA5BbBA8AB5+A
 vhWzFXeTJQdXFQYZkI2CE+gFh+GvsksZKvVxo/D/YGTh2RtAkRNvHuYGxHi3oAik/ZRX
 PYZQ==
X-Gm-Message-State: AOAM532cpSV2yHAwMrJlKxiS51PREhUQYzhXDeFn1+9D/2cAZo6qjLg3
 4GKSZdUdxolO+4zHpy5yoltCytZXKHqh5mU49TzX2Q==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr461729ywj.329.1650558470144; Thu, 21
 Apr 2022 09:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-12-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:27:39 +0100
Message-ID: <CAFEAcA98E_tOiXzHiMUggNVePs1S1=iDwWnrwiSi5JR5RFo8uA@mail.gmail.com>
Subject: Re: [PATCH v3 11/60] target/arm: Split out set_btype_raw
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LjRFgw2loSJz

On Sun, 17 Apr 2022 at 18:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Common code for reset_btype and set_btype.
> Use tcg_constant_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
