Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3015784ejb;
        Tue, 30 Apr 2024 07:45:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5YMLPX/7pNuWzVWDpoR0eY4OH9itZUJV+zT57wyhsIOp7d7gjylIL70WqwHqqJnd3tJB9QMnitSNHYioU2BEx7ZVDexEX
X-Google-Smtp-Source: AGHT+IHzrPduzLBOLHF08fzHMVabhCq1VWlAuBwLNSQWEQvaQ1nHed59/WmURqX2keihWEpRkenz
X-Received: by 2002:a05:6870:7889:b0:22e:b736:786d with SMTP id hc9-20020a056870788900b0022eb736786dmr11933115oab.31.1714488336542;
        Tue, 30 Apr 2024 07:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714488336; cv=none;
        d=google.com; s=arc-20160816;
        b=tNbRhvYaSJyc0d/S0ouWZe3aC78+2lp9BThHON5mW7mIBNJxHtZxUbqYIumFNOZZ67
         XBBmmiYpzrD7zIRT5npR59b1/gqMVw7xRTtHNjpNI/NmE5NLKrZzklIDzlp74xUuL2sn
         vdytagGh1YE6iHRc4gGPvu2qJqkdVJ9qgLQQ1j+1kCxbnWkIAU8FiolRAixiepX/4u2/
         34YoXBn9n2wAn9RCVNaaDaMCBzf0NHdyTAMqIEv0BUT/kM6XCPdjvFQhWRItTqHzNvWT
         QDtdWXrhPPRGqJu3v7/4dnks57WqMBcBiH1Q1xV9Z+X3VjYCzuJl0STn8v/kkuqa5iiQ
         GBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Vrpc54sucJbvI/K5I+Zr3ZBUWB1TIumeG6ND+o/VUJk=;
        fh=389R8xd1ff4S8SKF/j6qPdE+Th+vrQQJjfzMiYJTteg=;
        b=ih4yBW4Ldf6m8pWNxhmhYBYLTvPp7syiCgz8maCBrp3Gto+s+FILJPRlvGsScKU9yq
         aykGtHpjW9zdjZbjROxu8rOTr9WkJSzZ48GYJS4Rd10nKBP/jGO6uqW+8aMAo8g69M5I
         PiZ10ZZqLppxvxpPyxQ10fGeXDiFXrSNUmHK6VjOHD22BpkonIB0cRkY2TU2mdKebdml
         STepd2rLUYou/oN44mNWeNkx39971P1KGgYy8XmBtNIm9aJv2oKripqgxWm2T6B5WpQx
         E9FKFOcId83waI0c47w2Y5jvftbdyIrC4RPVT5Veub+BC1OwkAroZJepZjdB/Wq/E7GU
         JeOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdsFZOSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020a05622a03c800b0043affcfcf50si3712175qtx.303.2024.04.30.07.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 07:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdsFZOSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1ojb-0004oC-MZ; Tue, 30 Apr 2024 10:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1ojZ-0004nC-Jy
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:45:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1ojX-0004GF-4e
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:45:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5723edf0ae5so6216215a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714488324; x=1715093124; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vrpc54sucJbvI/K5I+Zr3ZBUWB1TIumeG6ND+o/VUJk=;
 b=gdsFZOSlxPDDC7DGKpMhHH9Z3zFbrPF6Xk5LnbIOLprk0fztxDdEnyhHtvbRxK2un0
 ZRH5KwV8YiPOltIbiiJJCFMCltj3ci+i6IWw+0jim7fsTrjgrfQj7gCtqrABlQmGVdPb
 fKDVdr/5eJuvpSbgsRrr/xib702nh7kVtVEeTlMu9jNyqxhJ624mzyVekf46zvSdGCGh
 BOV6lFKDwKDHIJF65iWGzXywZFbHt73gy6JMBdGsTnaYG1AD0WPf9NRhYO9EQwIOGC8o
 3wJjyatP33zk1D9Vqlao0K0OCbFPSJay8kDwzxIn04xOx8+cCCi5AYoilhr7TGMT0G1a
 Eu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714488324; x=1715093124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vrpc54sucJbvI/K5I+Zr3ZBUWB1TIumeG6ND+o/VUJk=;
 b=icO+Vx3l+EPQp5XE0RaEw1M0qwp7dzbjs1/Nazx1Zhy7E1UNuqrEjQrTJpRhBYrJd+
 z4kZsxYGF1et+cw/RvXHswirqnkb63M9nWR9o2t8phmPap45gzljRmf/wPZgP1PR+8g8
 Wqw0qcvbrCH17eg7Tx7YBs2MXIjqTM3qq+nciFHolxuTqvsEVfQ+YY6ogH7ru1tJ9Pd4
 2TKUvMzffaTBdji4tyeMFQ+upWq4/4xLF8qMCB00fotKv0CuDn0xwfTj77VDMFLGd6to
 1X0eyjphf31hx/tb6e0SmXv41Mq+v5QYNJRgrAxlyiZKvyvAhXEtIiZr+nEau+TduisN
 i+7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2iBd9i3yC1k1PLkEe0lwkTEDj3zq7Q7CzUrTTz4Qo145FPGhgLIyjv3kB1ubFj7ZjAq6uXuch+AFS2oPDjqovLUf6
X-Gm-Message-State: AOJu0Yx93VPKwVyf8aOlSjSMQs41uRnDUHw50bfYFDV2UXF5q6xIH3dX
 izggu1XlyAH/ViBmOZ25QKRa7IZ5wtydPC+gOUe5ZbIceQHgS+D/dMfiegAqzQUgDE6k2Vr5b+4
 /L+xxCYkQMFDgYg2i0fDKX+xB0RfCQ2nK//qxgQ==
X-Received: by 2002:a50:931a:0:b0:572:1625:ae99 with SMTP id
 m26-20020a50931a000000b005721625ae99mr2456eda.31.1714488324066; Tue, 30 Apr
 2024 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240428181131.23801-1-adiupina@astralinux.ru>
In-Reply-To: <20240428181131.23801-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 15:45:12 +0100
Message-ID: <CAFEAcA9Zkh6xi2VvMi1mSjvAnSexrQFjVamES-z34Wh9gTuRUg@mail.gmail.com>
Subject: Re: [PATCH v2] fix bit fields extraction and prevent overflow
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>, "Konrad,
 Frederic" <Frederic.Konrad@amd.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Gs4+rkd386iQ

On Sun, 28 Apr 2024 at 19:11, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Add a type cast and use extract64() instead of extract32()
> to avoid integer overflow on addition. Fix bit fields
> extraction according to documentation.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>

Thanks; I've applied this to target-arm.next, and it'll go into
a pullreq sometime this week. (I tweaked the commit message to
add a bit of the context and the docs URL from the other
email thread.)

-- PMM
