Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1813428lfq;
        Mon, 28 Feb 2022 06:11:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz4USYMHCmCKvGk0XZAaDB4eBrVwm4JbEC9Ztid7WxSWRC1JSHP6HGrUJ5H3ASCHmLUX+5
X-Received: by 2002:a05:622a:1192:b0:2d1:e58e:7659 with SMTP id m18-20020a05622a119200b002d1e58e7659mr16735335qtk.41.1646057504887;
        Mon, 28 Feb 2022 06:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646057504; cv=none;
        d=google.com; s=arc-20160816;
        b=SndSr6lO3UXN3xZ2ATMnoVOpZ+BC35vBpJ8XCpnB5rLhcrHoCc3NbufNNUvMTYdaW8
         OtcJaYSPzjssidvw2Yl+6x5JrdzBe3nzxb5qpw3fHCTpbQseYxOsZnykNvlMceqj4YB5
         qlX9o8/roWQzB+QSyrLNdMW4xNUv23wLD6JrkHj2GFw5lHVuCdwMQhcthkj6GTEahSvh
         IIWjdaZCFNeuxAhfFRY71MruZshB5lBZ1qaRLMVt/HobBnz4ofUf8RNWxVwclQKzR2N6
         wLxzScLMbKHfj+jJYnVwvGsRsMOyuVBAeWoOHFqt7wZnK2n4Vke4ULnNG67egpGyjHi9
         iadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B5d5msIFGx1HjfhBhxyVTL5iGoQDzjnp43Drgtpwj6I=;
        b=poG/4icX4zqu9kHwArkeYnKAaux/7QV0j6MUdbocDLZBDakZxL12m2xhCOEiiv3Fr0
         CtbUwdUNVdycgF46mon+3InyGHyPvlAmsU/X7lzidcOYKt7bsvFxFGjJSYL9J80708OT
         sEMF8138RKcnDAZOqQjZVnWvRaPN+cUvmf5+e/RZRbJFWyJ0OmbNlLGSfCRobvDvFTFu
         4VjlJBJP5qgThbyzyVIUSzfdsU2ZS2hf0dseNwyINShuLpd4lBG/l4gl3btUgW2ex5yQ
         nVKBeTiCkfzLWrvV9zBW+HakikTtLc8+Vt1aYCNiCcXmYO1mOYHoCzV6Xj4K9FtYAnnh
         gddA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ALEMk5M6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bf18-20020a05690c029200b002d035ccf98csi8520479ywb.48.2022.02.28.06.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Feb 2022 06:11:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ALEMk5M6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOgka-0007Ey-9R
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 09:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgkH-0007CN-SZ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:11:25 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=38565
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgkG-0008CV-1s
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:11:25 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id u3so20743568ybh.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B5d5msIFGx1HjfhBhxyVTL5iGoQDzjnp43Drgtpwj6I=;
 b=ALEMk5M6NVPo7o6CdTOdn5+shEkJzZ43/5YC7O5yzFx6uSfeW60IAFPZmKRVUnEHcb
 xn93IfX6yuPbf0ah6n7dPUpOzyoYv/hb5d7/NUBoKugU938ag1ESe+MUgThMX2my2+Vz
 iRVkyt4gwxiIWJ0MEZ+8tfAYGA6LAGuVx4W0VBClh4DpLBXy8PwNuXvTgUqxHDSlSb0F
 EN6TQgj1I4xn0874+CIFqeOefjZkkogsf4lSRGWho8LDYNxrG5/VlDqQUMPtEEPCw2Z7
 FWFmtbLnUVbp8GFFjuYf604Jym/DdpbpeyXr9dJjwraQeMxVVs1H+vxIMwlXuly51xvp
 /iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B5d5msIFGx1HjfhBhxyVTL5iGoQDzjnp43Drgtpwj6I=;
 b=cNnt0DtWxVKbE2xNfBilLH/Qwenuq4s7Hx35G8EKNB1x8+3vnXtHXG0dyU2bfkXu2R
 92bJil8LMEBrl0Djxbs02zPs5NS8xP6jw56CnZANvxaGjTFIe1FJZQ8odb6JM0k/vluJ
 q2GIQmSo0JenBNJihtFmdIuCeweU0A7ctajFgu7xnV7hjcVZdnURrFGeD+iUEqnhS3MX
 V+ZwpiJvKA52enzMVjlJ17tAVpuTeZNwC9UsaUGFOV0dZ33iVEgNhWXqkcFKg4dCmCa2
 67W7IasDQWBIfaPtBKmureize5IydxTeSZo0go9KM+Vd865QqEHkMA8koFiGLUHiFwYZ
 V88g==
X-Gm-Message-State: AOAM531PIoBDxMpYdHDOovQ2xeyGpIgjOAHKJRU4GKWkGy+1f6IAupoB
 rKAjX1YNEUcEICvmBBwwcdMmGz4yNBhtl9nx3d7krw==
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr19148766ybk.193.1646057483040; Mon, 28
 Feb 2022 06:11:23 -0800 (PST)
MIME-Version: 1.0
References: <164603074537.20094.1732342403585879912-0@git.sr.ht>
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 14:11:11 +0000
Message-ID: <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
Subject: Re: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
To: "~ubzeme" <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PxAY1yIQPdx5

On Mon, 28 Feb 2022 at 14:07, ~ubzeme <ubzeme@git.sr.ht> wrote:
>
> I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
> virtual machine.  QEMU crashed when I started a VM with HVF accelerator
> enabled and with the device, bochs-display, added.
>
> After digging into the source code, I found that dirty-tracking in HVF
> did not work properly, which made QEMU crashed. Therefore I made this
> series of patches to fix the problem.

How does this series compare with Alex's patch to enable
hvf dirty tracking for target/arm/hvf ?
https://patchew.org/QEMU/20220203142320.33022-1-agraf@csgraf.de/

thanks
-- PMM
