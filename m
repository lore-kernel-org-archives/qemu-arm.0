Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6382696lfc;
        Tue, 16 Feb 2021 03:20:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSZcsxGAdcKl27XBHGgWcEwrqyRB8B3wLR8owLdfyz5msab5YIDOOJuEmMqhTBX7Eghd9h
X-Received: by 2002:a5b:d0b:: with SMTP id y11mr29261706ybp.64.1613474434584;
        Tue, 16 Feb 2021 03:20:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613474434; cv=none;
        d=google.com; s=arc-20160816;
        b=MPdOn6BJPaAOD41pn/qaAxl1uyhpqOb2aid3zZTiUXRL7UNMCedth9dA3QfFyXbjef
         6Z33f1bg+eFSeBnaZE9o+spAQEF3fTfISPe5Z6yEE0TrcH9UN4TkeT/oKZXKsBhgpOwK
         pgDSmA9+whl4MLEa2HYHQTpzDycYThU60KlXweMDud+ln61LPpY76yGj8St5iYbxIYVi
         hzRVDsYjtuFa/5erKlEDrPS1C1XhoWcgzRWOEeZAAoAaCw1cBomHjzAOGM+6rBO7Nriy
         Afhf9xjjtQSrR5ftVhKmvQ6sSitOEooYGIFMJP+zy/kIo5BIE2mHopotia71pMHfQ782
         74lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cr4QwzwU2wpdvusmlXrL1U64H0zNGQ44GZVIK5iBXQI=;
        b=tIYdlucK/1u2A4DETTad23L6a6leSj3+p7GraKPK4O26GVdxFjPm5ASPvfs8XLKult
         BOfMpY9F7LGbZox25Tc51mxRlkYTLvwB3GA7isC1aX3FSYtshsOvN6Fd3okJB4gabb1Q
         ynK+ql/axYKALmagrpKrK3LKcSBobPvoOIzpI4qb7OXMmevvNj4VYWO9ejVumB412XI0
         iBDJ225gCk5AAsG77FXPynmiBLWgEKjQ2szirkzCZbdn9BEal0PEteIf+Pflv7xDllLO
         8aJiozjnbSkQj0nqwS6SOKtjVne+AbzrefIfFWP5wlNx075uA7hHbS/kyjCs+O0Dz5BC
         sQQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gGvGQtsW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si17856006ybk.386.2021.02.16.03.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 03:20:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gGvGQtsW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lByPC-0000AB-0a
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 06:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByP4-000090-Mg
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 06:20:26 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByP3-0003nR-2b
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 06:20:26 -0500
Received: by mail-ej1-x62f.google.com with SMTP id n13so9282976ejx.12
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cr4QwzwU2wpdvusmlXrL1U64H0zNGQ44GZVIK5iBXQI=;
 b=gGvGQtsWohl3lOirr2B3sFLI5bivTmqrmMQG+db53QN+x1u4wnuG9I8qFvSU8LunjM
 QUkkb5H34CYfOb4vZloLXGBYX8OtGH2zB8dIGVrLRs1F9VgiHmwQUH4vwpK4VfMp2yMN
 VjoGqNoIbFyBSPfDA/bAZjYZoo5/zskrS2elM2wKU9NqFbmDtA6Lv5MIcRHkkZKRRFCU
 FsSm5VG5a2QMft2cLxtBtCcCg5eH9FMJPuiO6B5GopavJfcYqbfoRLoB4IEQfKUhFgR5
 61MjHOjA2Aro3PuTIwJhLjhkyeq6fE7WGj8B++cFS4r7n/rOI6ywzrinpmgAUtpK0uZn
 Fcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cr4QwzwU2wpdvusmlXrL1U64H0zNGQ44GZVIK5iBXQI=;
 b=omajTxOYS2GMESu9/oKEekqnJmEatThUDEpwSs307Z266pzDs4qGPiDRBZDOzeEBoq
 CBDjwxSnjCIMLZQEanoAS3QMk5gD8G0m5fAbi7MBVqa6NkyGWTP9IDl1x8JpaeBUiccr
 3TW0aFs2A3by0bw2HZo4OB/KEu69tjNj+JpLNh2xs9QdYtD8lKwcz22P7LIGHDknbT+7
 s87TnJt0S8cK5Rlwkd7vjeu0g7Lo2t3T0NSwoYuEXXeajMgH98rs7j2THELtvlTVGhCo
 kilVW7535IByckYCL7loKJDc+t1+9HrOXRC8OUJw4BrcqSLyDxCi3sUsQtd3WlM5PBqW
 zHBA==
X-Gm-Message-State: AOAM533VlfwMXe8+y2RCLMEXQXgCXWpJDnXiUAXP2crZ9S8FV9w41sXT
 DCYdrVrpoSya7MxksP/ZDDDWyjaIlGEpaXn8uPKHbg==
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr19409713ejg.382.1613474423172; 
 Tue, 16 Feb 2021 03:20:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 11:20:11 +0000
Message-ID: <CAFEAcA9ex-yxv82ixBahQSuYphiasGtGB59nmpYZR3WXgSqw6g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] target/arm: Add MTE support to KVM guest
To: Haibo Xu <haibo.xu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GCRhzP1SqCfD

Adding the migration maintainers to the cc list, because
the real meat of this patchset is "how should the migration
of MTE tags be integrated into the migration/ram.c code",
which is pretty well out of my area of expertise...

thanks
-- PMM

On Mon, 8 Feb 2021 at 03:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> This series add support for MTE(Memory Tagging Extension)[1]
> in KVM guest. It's based on Steven Price's kernel KVM patches
> V7[2], and has been tested to ensure that test case[3] can be
> passed in a KVM guest. Basic pre-copy migration test also passed
> between two MTE enabled kvm guest.
>
> This is a RFC patch series becuase:
> (1) Need to add some arm MTE specific codes to the ram migration
>     loop. There may be better way to do that in a more abstract way.
> (2) Only pre-copy migration is supported and tested currently,
>     post-copy as well as compress/zero page migration are still WIP.
>
> All kinds of feedbacks are very welcomed, especially for the migration
> support.
>
> Note:
> (1) To support MTE migration, tags for one page are appended to
>     the page data during ram save iteration which make it easier
>     to sync the page data and tags.
>
> [1] https://community.arm.com/developer/ip-products/processors/b/
>     processors-ip-blog/posts/enhancing-memory-safety
> [2] https://lwn.net/Articles/842827/
> [3] https://elixir.bootlin.com/linux/latest/source/Documentation/
>     arm64/memory-tagging-extension.rst
>
> Haibo Xu (5):
>   Update Linux headers with new MTE support
>   Add basic MTE support to KVM guest
>   Add APIs to get/set MTE tags
>   Add migration support for KVM guest with MTE
>   Enable the MTE support for KVM guest
>
>  hw/arm/virt.c             | 44 +++++++++++++-------
>  include/hw/arm/virt.h     |  2 +
>  include/migration/misc.h  |  1 +
>  linux-headers/linux/kvm.h | 15 +++++++
>  migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
>  target/arm/cpu.c          |  2 +-
>  target/arm/kvm.c          |  9 ++++
>  target/arm/kvm64.c        | 31 ++++++++++++++
>  target/arm/kvm_arm.h      |  2 +
>  9 files changed, 176 insertions(+), 16 deletions(-)
