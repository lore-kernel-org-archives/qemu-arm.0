Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp226178lfp;
        Fri, 15 Jul 2022 08:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcR13E79b5//nttb8prOmfb3JoGzQWTsWmD2j/+TkkRG7zV23Bci4FPNCMWFZKYnlAvCMB
X-Received: by 2002:ac8:4e83:0:b0:31e:e139:a6a8 with SMTP id 3-20020ac84e83000000b0031ee139a6a8mr1135886qtp.337.1657899980920;
        Fri, 15 Jul 2022 08:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657899980; cv=none;
        d=google.com; s=arc-20160816;
        b=O8xjYbeLunqo4s1fE8GHYXgjlbU+crH+doL4jo0QVUdhOHy/m2aNzNEqLcpi4Xts/6
         8LuE4sXgJ6liUKHzDYGXsyYG7E510M+tqQP7nP4mTctEhzThJBOIPYtSZbIaGijewcss
         pVkM3eh6lsgGpVfPlU3i5hHxzDxnIKC1QGLKKO90FU2GvDyYpZDlPiCVlbA0NoOkcX4d
         ko1uFSESD1jPdh7V4F5FIss/c8ef7NSbwEmtYn2nWOnKb8K7sQufLEKKI1ry7/Dyln7G
         Z4PNSSJB6jm3tWKo+czVZEqCd7K18NhzaxhtN+I3MG2Zee98e8fByfwhE5t1ZxSpiMZe
         UENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hRI3oAsXndDzLe4xroIUW7CwYsgULF/Lq0h7TgbMZGk=;
        b=tKxez5n+Fb8JBM0TjOWBVSiMG9c11QcqwQH0GfXpV5hKgBBTMyesQykV6+temABPMw
         Brj1qoILkGzY5aN2ElIcaeMqjgp6WGnI35HtKdRRm22GIrNv9E3su1Ppq5xI8qHCZrRv
         2eYwXn0nrWfSB7R10AQ+V2IZOPL8MwzYryKy/T1KH82m7S83MTGNY/JOn/jVAs3Bs9eE
         U0/TKYSMo+RXt97ubA1jZVqzphfH0rhSDDAqLYixQVzQKsyHR8Az18kIGam7spjCVgK7
         yI9n4qQ45rkIhHmhFrqAuvPl8PebClTK5zsBvBj8GJ38GlrYHy/AF9FYZlcxiCv6IaIj
         y9Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vcoO3mf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05622a01cd00b0031eb311c6b5si3396054qtw.146.2022.07.15.08.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 08:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vcoO3mf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCNWG-0002Jm-Dw
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 11:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNV8-00011K-Fa
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 11:45:10 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNV5-0003wO-Ch
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 11:45:10 -0400
Received: by mail-yb1-xb34.google.com with SMTP id h62so9003112ybb.11
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRI3oAsXndDzLe4xroIUW7CwYsgULF/Lq0h7TgbMZGk=;
 b=vcoO3mf4qrB9li2JXaz6s1bgGi4Y+X8DI5LXQkgIQutCCcyOe7XjIYGE9OP1cQ1Cnb
 eb0nsQOa7jULlUCJ6uCZ9RoXxflswO65Pb97x7HDo1JIV5P1Ev8Xx9Az3Cozx0Ghfnpi
 MnFxq4ARueGcg3bBJhnkkN7kO+4OpkitgFG5hx9+9aK5jxy3nPDOUZoGjqH34j5hE0yg
 QqHEJSW6t+RednC4cA3VeCbFRA46gGiW/ZLaFNJPlX8IKCWF2FyWIPugKch5eI4Cgq2Q
 ThtBCkMFOKeJdPztcfMGbEgnkGGLaL0SZn0v3axbKKDpUTe/er82ehxJ/YLGMOG2Vyu+
 VfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRI3oAsXndDzLe4xroIUW7CwYsgULF/Lq0h7TgbMZGk=;
 b=05E7zVZDqMHPswCNFzJNruYB0ZMj6h+x3qA6zB03Xq+61qEptZ9YaKEVVo6ApkUdLz
 bh+MW/uVmtMtKo4xxzqZHJ+GhYGzuF6yE3ggS/JTI+vWGkPjN9KeM4HEGY9Me/QERxM3
 AYRyPfJqYoBCxw2sin540mPgI2SlEz0wXZxKFRjTlPVXZhqqRhghYuZ+X5GHc8WFHGWQ
 JyPt412uoYIWYKDYfKomIY03nX/K+ip3lKgwKIeDbtkxzGmBXwq6rYJlTrWJpyJwhtzY
 NlQAxIpV+tWw9B3rXsBTzqhaeIuST6bGRzkkIRSKCFJf6hIW48zkh1nCOkvM04myd6RM
 IfVQ==
X-Gm-Message-State: AJIora/oNsHqvGIZZvehDVTS0H6NbxEZhMEh4cdHcpnVk4Nl/2dqtOxx
 5M+mqljDRgrh5Duls1whRe2CoeYXf2JlSYx4JaQDMA==
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr15568708ybj.479.1657899906209; Fri, 15
 Jul 2022 08:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 16:44:27 +0100
Message-ID: <CAFEAcA-DkDAvwaNOSQ3c7xTEsJcLGcp7xKsg61Jd-jUd8P7H1g@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Misc NPCM7XX patches
To: Hao Wu <wuhaotsh@google.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, armbru@redhat.com, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUwoVtd8jTJ8

On Thu, 14 Jul 2022 at 19:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> [NOTE: I'm reviving a bunch of patches that was in the process of
> upstreaming a while ago but paused.]
>
> This patch set contains a few bug fixes and I2C devices for some
> NPCM7XX boards.
>
> Patch 1~2 fix a problem that causes the SMBus module to behave
> incorrectly when it's in FIFO mode and trying to receive more than
> 16 bytes at a time.
>
> Patch 3 fixes a error in a register for ADC module.
>
> Patch 4 makes the ADC input to be R/W instead of write only. It allows
> a test system to read these via QMP and has no negative effect.
>
> Patch 5 adds a new blockdev IF type IF_OTHER.
>
> Patch 6 allows at24c_eeprom_init to take a bus as parameter so it can
> be used by more use cases (e.g. behind an I2C mux.)
>
> Patch 7 allows at24c_eeprom_init to take a drive as property, similar
> to sdhci_attach_device().
>
> Patch 8 uses the function defined in patch 5 to add the EEPROM and other
> I2C devices for Quanta GBS board.

I've taken patches 3 and 4 into target-arm.next as they're
already reviewed and standalone bugfixes. I had a comment on
patch 2. I'll leave the IF_OTHER patch (and the patches that
make use of it) to the blockdev folks to review.

thanks
-- PMM
