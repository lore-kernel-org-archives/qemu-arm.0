Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp143607ejc;
        Fri, 27 Oct 2023 05:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpI6xOz+0Pqkp6/KH3NwXtvVHaDJS278YlP/V+ds1vpf0eYIqhD7ucJeA/3HvvxJoTBGka
X-Received: by 2002:a05:690c:732:b0:5a8:19bf:87db with SMTP id bt18-20020a05690c073200b005a819bf87dbmr4179517ywb.25.1698408512071;
        Fri, 27 Oct 2023 05:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698408512; cv=none;
        d=google.com; s=arc-20160816;
        b=z8HTv1mqQidBHOc7jkmSzGbJ+Fcv5tZ7qPbEhCQF5Bvy3vjBTorAVhKGv0jCxMGeV1
         Zbd9+rhC3LXfvxicIonR4trSnoSH3sxXpd+dWF+3Im9qGKrfi4ayOOZl16GqJ0NHgBQo
         ih8ze3ZS4etBF6mW3GHd+q0Zn9i7KQK4hd6KxIfJdewfUZ5r+GV4FaQlRsyLdV/jFyrD
         x8MqR/Q7rl6KK5tDQdbjESQfVk8WtGQoWZZm4v9E+btgeH8BA79u2QT27jqEqhhXAmbF
         Ralg7AfavS9/yML481LfPddwt+skci1jrYRmYEMVobi32/KOYb6tcK9z3UZt+IuL2p4h
         gEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zH9tmyrWZkyUTZ5OsK8h2TLdeVdSWvEL8GnYHqnqql4=;
        fh=AOfICs4TaA8i77qnwvtNtWoKQT4eE6Az6vnhzQHu/4Y=;
        b=LZqCsIhK4zxk8rNsTOvWTYad2/fz4dDxqT3roJZV9mCVai55yhEyM3DXTeBuFZejjF
         5qNWbBSu3GG/0bJ70/ZxDaXzlTYXJQq+/RQvEXfcg9JSyHbuFT6gpKnn1W9bH8TjnGDe
         yobUO+9Vo1n/BGRyYZQvdJO0VPTPawQlyFwvk2lq1KVmfbPqWvcOS68zsaR22uWOicZp
         ol8Yb3I80M5P0m1p1iKpqrNRFYA4YSPrxH5cgP4LIe6k8M1uh9mIYcOuTMZOsC8oEnq0
         IKFXt1jBmvCq2Sh0hDb5CNbG6SZ89pgLTipqP9PJadsg9r38Yy4M9hGYTWlj23d3f8I2
         8UIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0a9isgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w64-20020a0dd443000000b005a7cce3a27dsi2199485ywd.320.2023.10.27.05.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 05:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0a9isgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwLdM-0002jZ-K4; Fri, 27 Oct 2023 08:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLdL-0002jI-2R
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:08:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLdE-00040i-O1
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:08:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so3098717a12.2
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698408483; x=1699013283; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zH9tmyrWZkyUTZ5OsK8h2TLdeVdSWvEL8GnYHqnqql4=;
 b=c0a9isgm05RfQs9tRtvJ3QRQnOTHmrR3QkagngdPWOUw8LMXCez38jNHHkIm80JVxB
 eR1tBQzP35t7rGjsJbUg2SUYYJpl2ncPRGLivTF7l2pzA/dKSu1bkXesNDHY5QJnvU2R
 OVv3z7yqErYrBBUi5GHDdUhQn6dhtLRUK4m3iXDcZwV5z3a0nmoYAlvFHGNUOmWfyfoX
 14mtOxeVL+9qUeAnM/i0+ce/b716UtNu/4MgF2D8tLZ/aFHpfzOW/zbzK+wUPZyIFdXn
 gAm79jkD1Hawf5ydCZhMKQ3V2IoVW4Xqh0/dg93/3Qgt6QtkXpvMJ/J3eRnV9DR7hyFt
 JgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698408483; x=1699013283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zH9tmyrWZkyUTZ5OsK8h2TLdeVdSWvEL8GnYHqnqql4=;
 b=f18CaJ8Djh7qIFv2r9q3NWMX3S9CWn9yGAstKDPoKnnxPp1F020oVoP9fHegPmYdni
 XcgOZajs9clFUMcD9cEAn/EYPEdGVP8vt+/zNiWt3spslhScRjfEMvoqOBiq7YwgNCLn
 GjQmfOD3gUN6TfTadmfUuPGR/VwLt/wNm7EMmzFkpzc+rCoyJKeuicL34EvIoglG9blg
 15qvqg6yqIYC1mg25WXA84mSBkKhGRb8sFHf3jafDnF6Lea8Ra/f8ZF1bIOnl+OUuzx2
 OO1Js+II6JOOislJtR8Pne98PPBRCAjTI7iCBmXc3ujWfell6MO/w3Ziqnq8+ty831wk
 rtXw==
X-Gm-Message-State: AOJu0Yw5TH/eR4kip2e5GVcNKKJBqTHz+o4ONHvYpExnTt9p1/qjViCX
 MJNGdrfA1a2gXwuRImFqAgNWDGCJomdAkoRUer5hL82SdJFQiKfw
X-Received: by 2002:a50:bb08:0:b0:530:77e6:849f with SMTP id
 y8-20020a50bb08000000b0053077e6849fmr2333178ede.27.1698408482844; Fri, 27 Oct
 2023 05:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231018181259.748819-1-nabihestefan@google.com>
In-Reply-To: <20231018181259.748819-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 13:07:52 +0100
Message-ID: <CAFEAcA8ihe-+c_NHC5BwYuaU7y9NpP=9-1aL2Brf6g+SfK6SMg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Implementation of NPI Mailbox and GMAC
 Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BuI3c59LV7AP

On Wed, 18 Oct 2023 at 19:13, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> [Changes since v3]
> Fixed comments from Hao Wu (wuhaotsh@google.com)
>
> [Changes since v2]
> Fixed bugs related to the RC functionality of the GMAC. Added and
> squashed patches related to that.
> [Changes since v1]
> Fixed some errors in formatting.
> Fixed a merge error that I didn't see in v1.
> Removed Nuvoton 8xx references since that is a separate patch set.
>
> [Original Cover]
> Creates NPI Mailbox Module with data verification for read and write (internal and external),
> wiring to the Nuvoton SoC, and QTests.
>
> Also creates the GMAC Networking Module. Implements read and write functionalities with cooresponding descriptors
> and registers. Also includes QTests for the different functionalities.
>
> Hao Wu (5):
>   hw/misc: Add Nuvoton's PCI Mailbox Module
>   hw/arm: Add PCI mailbox module to Nuvoton SoC
>   hw/misc: Add qtest for NPCM7xx PCI Mailbox
>   hw/net: Add NPCMXXX GMAC device
>   hw/arm: Add GMAC devices to NPCM7XX SoC
>
> Nabih Estefan Diaz (6):
>   tests/qtest: Creating qtest for GMAC Module
>   include/hw/net: Implemented Classes and Masks for GMAC Descriptors
>   hw/net: General GMAC Implementation
>   hw/net: GMAC Rx Implementation
>   hw/net: GMAC Tx Implementation
>   tests/qtest: Adding PCS Module test to GMAC Qtest

Hi; I'm afraid this is going to miss the 8.2 release,
because it is still missing any review from Google
or Nuvoton people.

PS: your patch 4 commit message seems to have got mangled
somehow -- it appears to be multiple commit messages
that have got concatenated. Was this intended to be
more than one patch ?

Also, for patches 1-5 which are by Hao Wu, you should
add your Signed-off-by: after theirs, to indicate that
their patch has come to QEMU via you.

thanks
-- PMM
