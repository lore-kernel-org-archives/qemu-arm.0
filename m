Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3814736lfc;
        Mon, 19 Jul 2021 05:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUfanAD4Nmif6Qb4KgprtJVRpbJ6htOvQ/WPWeMki/xrMUucuzrwXv7D2kokyToCU6+6Pw
X-Received: by 2002:a05:6902:100f:: with SMTP id w15mr32199959ybt.495.1626699033508;
        Mon, 19 Jul 2021 05:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626699033; cv=none;
        d=google.com; s=arc-20160816;
        b=L9AMkcCJp6aYnOcv3yy7QknD797DWiD6rMNlx/PKlhT9qGGR9jx91lNT0x1e4lVcRd
         2MCzv9ph3p7vipMwWemRa7nTFv9meYptvRulw7yT/CKldsqfPkv4V5toy9VxRKWLd+t5
         4jn8BQQK74BsjH6+pqFkPTTw+Pl3zltPZBHt6iEtehnjNwGau/h3uVlfrzFBbdKm1JVE
         x1ovA1OVUsGSSK5wW6kRNqv7EI8/ZRS3BmD+l0IDo7ODarHEFU92zpC9jPVk3CSBXv0O
         FrRMiqLjavWvlF3kIm1DGJ9tlL9mDJEZtCgFLteUw7Glbn9jypQwrjECZYI6x16PI3K3
         XxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5HVFJE+IsSHhCFx9VZ3vRJrvdZmS+EASlcH48heScO8=;
        b=vRUN4uiYWqxSfHefZ9nFoQyzHIZE0mCe7QIBxVabGCIXhCDuk6Zufk3WxjNcMFJdXT
         DVmgXg2IAyYSU5bTLTk61bH5wnmM4mes4gx/AyEbMjkNUGdjpC5IaHUOZ1VCseStJN1L
         gskbHAeYzC81CGONTPnVbLB50biVYriOpcqWzwr+F7Fxc1oQ+kCXsJ3bLFV5+1YfPRCt
         cbWcvw7UNOnSGcDVI2cCQ/vx4hqkvJqkKCjjKbL6S+1XS+WDmQRwz007YhBJ6RcEReMp
         m3u27KiRMwQv7dVMijGU2kegYsNhWB/CVNkEOb2SAxZCuHN8vZEcb6rLt1JPSfTxAlHP
         gjPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fD2AKY0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si23244970yba.72.2021.07.19.05.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 05:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fD2AKY0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5SjA-0003ir-S9
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 08:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sih-0003iT-1t
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:50:03 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sif-0001iD-Ag
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:50:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id l26so23749041eda.10
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HVFJE+IsSHhCFx9VZ3vRJrvdZmS+EASlcH48heScO8=;
 b=fD2AKY0T4r5wZf5w10kTN0rexWx7phlKLUIH2yP36tGoZuwVa4eH7Wa93XldYNd2c9
 UeBhqrTZyHhCaC5HyNEeDXH/bgeXHgq5QdWJr/ttj1BsK8sIYVozSNCJhG1QtZm5pP/3
 wvYwwFVXSH+lkJqqbGHdzvvpvFi402BU2K7V2/6Qivh4Jht+LAzGjhcmD7H8roAwybUo
 2pAmEwV7BbVhzEXtgJMxzy2vXMOe/UAbpcu3fWiuGiI6YwKOJLk+9Vg6EBWh7/1USamB
 ZWakke2lwwd0a7baCJFWV27UCnuuw+e0hTRZJQQO9DM1PVZPFFzBIbJRFCy2JgNyv/BN
 5CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HVFJE+IsSHhCFx9VZ3vRJrvdZmS+EASlcH48heScO8=;
 b=FSnoO7MJ9TjuL52xtcJjGCccEfgHNG4riMXazDoPB6EFtERb0se38Lv8zOlSwa/2yk
 Q6wFZD35whG36Dm24QWzkRw31FNMgyzeP64v7/sEhyXV5eIwqianDW1AuIAQzgrF56ja
 hlgIQdXOd/z9bOSbSlXP5TdFPYD6SCc6wodZA9Nt+Z8EV6qEYt1OLeHg8vRI5GXAE6XK
 M7PMCaubJYAmExsoc8l79kZxJs2CRofzzmFhfethcGQNeQu2DMemaoaKvW0Rj53esF8M
 Wpy4TjeIMGFBatbMlgm3LB2ckZ/jMdqxaLaCqZ8J+/pogLKnddJ5sLOAhvYPE7oxwzzr
 tHzQ==
X-Gm-Message-State: AOAM530TKiA4N6S2RCAqjW/ngERTATv63I/2WdAi9gE/S855ONtp4nBb
 1MrNgklQRgidCo1aKQ2cEVOWGvtmWVOAE8pzf8ChiQ==
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr33704942edy.44.1626698999391; 
 Mon, 19 Jul 2021 05:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:49:18 +0100
Message-ID: <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DUt4x2opLx+F

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hello, everyone.

Hi; it looks like something with your outgoing email setup still disagrees
with QEMU's mailing list server :-(  As far as I can tell these emails didn't
make it to the list, so only people on the direct-cc list will have
seen them :-(

> These are a series of patches to enable the Fujitsu A64FX processor[1] in "machine virt".
>
> [1]
> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitecture_Manual_en_1.4.pdf
>
>
> The motivation for creating these patches was previously discussed in the following RFC.
>
> https://lore.kernel.org/qemu-devel/a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org/
>
> This patch series is a fix to enable the A64FX processor by specifying "-cpu a64fx" in "-M virt".
> In the future, we plan to implement the implementation defined register group of the HPC
> (High Performance Computing) function[2] which is implemented specific to the A64FX processor,
> but since the A64FX-related functions are not implemented in QEMU at present,
> we will first implement the minimum necessary functions.
> However, since the A64FX-related functions are currently not implemented in QEMU,
> we will first implement the minimum necessary functions.
>
> [2]
> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification_HPC_Extension_v1_EN.pdf
>
> Since this is the first time for us to contribute patches to qemu,
> we are sure that there will be some incompetence,
> but if there are any problems, we would appreciate your comments.
>
> Best regards
>
> Shuuichirou Ishii (4):
>   target-arm: Introduce ARM_FEATURE_A64FX
>   target-arm: cpu64: Add support for Fujitsu A64FX
>   tests/arm-cpu-features: Add A64FX processor related tests
>   docs/system: Add a64fx(Fujitsu A64FX processor) to supported guest CPU
>     type
>
>  docs/system/arm/virt.rst       |  1 +
>  hw/arm/virt.c                  |  1 +
>  target/arm/cpu.h               |  1 +
>  target/arm/cpu64.c             | 49 ++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/arm-cpu-features.c |  3 +++
>  5 files changed, 55 insertions(+)

thanks
-- PMM
