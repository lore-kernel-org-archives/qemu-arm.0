Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2609839lfb;
        Wed, 23 Mar 2022 11:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK3dIuAzIC0zfHW2H7ENXW80P6ZIJBLfCIZkq6K78XpyCMW06CbotUwLt6vHK1ILlBI2XB
X-Received: by 2002:a81:9249:0:b0:2e6:5068:88d with SMTP id j70-20020a819249000000b002e65068088dmr1344530ywg.222.1648059376906;
        Wed, 23 Mar 2022 11:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648059376; cv=none;
        d=google.com; s=arc-20160816;
        b=oYjVDjbZIfCfyHSewvSroCsGtTNOnSuD2zz6WE70fxHyIGLQ0hrh7IkZfqlKgDaZmS
         5ldU3pPP1MbPDG4EGaud7CsHkhJeBSDlGncvauKF+sJmTqdtFDRwt6WObePIJardx2Rs
         61cJYW+RAYlGfIqVwnwmyhGLvn0tUAQVBfFe+NJj7QWnMMk9RL9etTAawNl4bxqJDiX0
         Gy2dVQdyM1uUPqJA/JqdIi46DFHXkMScAJrYJW6HFZDqz7AGxz7bCl5qNV8tgxMsQ1co
         VrQsBRcZmqRzNxV7+rX/5zW5fgUWCssogbbcammsX70Pq9wVWTRoT0MwJj0fBL60u964
         rv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sfEZUcS/C98xKrVfhmHvgZOLayihYr0E27aKEaFeNsg=;
        b=AaGHBjwQg9Xm4h5Pi8k+hY97F1DlYVnSVsT3VzWHEtBthfdnCt15pqXI9JCSdLAccN
         AUSkcvlVjlN4T826J4U21725OVGZE0zUwGbDpwwQDS9pkYuXNma9xTUvAw9a019Wrhf8
         vnxCEtPu+PeCOsrTWlsT9rneurDj0rneG7i/QdXoO6Y8ALZnAcNHF2l+s+pMOPPNO/Pu
         AX+5UkTrEwRud1lweX7kOjdsA4DXz8AYREm4NW0dCds/or3uXW01gEpBJ2CFQpqeG2tc
         KJo5UyxpbmScpE4+m2kSFNgjEUoWxcs0seZxbprx7ZWmom9Zg5X3HwK+iv3W2L3jM1kz
         PsHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8I0tiiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y138-20020a0dd690000000b002e5bb9dcaabsi12180508ywd.308.2022.03.23.11.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 11:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8I0tiiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX5Wq-0000jA-7q
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 14:16:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5WP-0000hz-1X
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 14:15:55 -0400
Received: from [2607:f8b0:4864:20::112e] (port=43313
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5WM-0000Df-KT
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 14:15:48 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2e5e31c34bfso26803677b3.10
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 11:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfEZUcS/C98xKrVfhmHvgZOLayihYr0E27aKEaFeNsg=;
 b=W8I0tiiE+WkttuKYh53KNcYX2/hAMtf/pYq+R6P8hbI8KRwsvnl5ozUQa65AZYlZqC
 8UjeQ6Afpxg3+FMax5++tTdvVr3Oh0Nk3WMKou9VKSGTE0CJCZY0zEjNgDGznS0ClX5U
 S5XUwgnU4+WzUoHeV1XFF6ISkhplgGpomtJwm0qk7ncyP3BVksBkvfVXd+zMIhXyyO+q
 DWHCSFl5GM4MUL2heh2CuBm1Q8zaspw2po6OkyRERN4zmNHtoXwPrzrdmNqenhnpxHnX
 lE33QCaZ451/G3YCERq8+zWzBlaNqh0Mn3yOoMiYSvzrpHLA2Kc9l+xoofLkW0O7pQkx
 xTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfEZUcS/C98xKrVfhmHvgZOLayihYr0E27aKEaFeNsg=;
 b=GYyCoAvtRzK4YWG8mUD2tV/5EJbZVHodP0bsecVyrMlPgRoAfQcgVi4f1blKWiu1LW
 nYaaEWcj/X87cq5Derh1Ztca67oQwjH9DyAYSl6lpIOuhAeWCgOwz8h225nRyMgeC8Ax
 LuKeqYPCwacdXkS5EQOnKBiDzpMz+o9jP3QEwPqb+hG4iE4KGPwtey4xhcPrxTBuuHP+
 HgSEnjGztBPQb1qUHfJAkZJJG50IHfG59Ou3zYAhsmzthkxZ9P6voSCxKAm5zMevXPZ5
 IlerALqh/DxFAHrvOg4e5RCp4fwMtbnik0iJ1L2E1wMKIwFncWkAFr3MrDCidCIlfdSI
 uXZQ==
X-Gm-Message-State: AOAM533/ln3Q36nQqB9WqKk3Up6eu2KvKu9RHsW5ll4T/A0e3zfRXQs7
 JFBe01ttD2IJXyzdSGSFhNgzg844Y7Mfq+wsK4P9pQ==
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr1226782ywk.455.1648059344289; Wed, 23
 Mar 2022 11:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-5-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-5-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:15:31 +0000
Message-ID: <CAFEAcA-kwPQj8bzfuW8D3-Omd79bL8HD6NtsjsPUYCcjRdXhEQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/intc/exynos4210_gic: replace 'qemu_split_irq'
 with 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iz6GKg6L9egM

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/intc/exynos4210_gic.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>

Same comments apply here as for patch 3 -- this is a device,
so it needs to handle the sub-devices differently from board code.

-- PMM
