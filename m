Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1625154lfb;
        Thu, 31 Mar 2022 01:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkPIR1uFVmK5DlvcqWY929KI2ZldI/qttXdepJaVCreSYHtdUvwKfAyoJxK34m/IYjaIsT
X-Received: by 2002:a37:a3d1:0:b0:67e:81c3:5073 with SMTP id m200-20020a37a3d1000000b0067e81c35073mr2487659qke.294.1648716444569;
        Thu, 31 Mar 2022 01:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648716444; cv=none;
        d=google.com; s=arc-20160816;
        b=tU7RlXBek9s0wH9ttDGbL5tici4gTKQO27fkf4lU2L5qMDuLVsL/kC+N/B+nLFd6Sq
         x0P/8hK8vYJYK+ZxKqSJUZSqrLhZcAfVoFz881NjwiRpxMy2kGEcPVT6d5arcXNq/WwJ
         QYok8RVVAgZwDga+Dvp4o5ObO5ePpQ5KVV/l7AFLNomiY3KLdgCQ91qkwveVRIANFj3I
         s6AOVERwQtsLIhsrxYeL6gN+hprvkVEIG411EZnvQhVUIp5Bk7QgsdxV4f2GHg0rYNZc
         G1Pcawcca6LagBiD/qJjxPm0eW7ZiNOZJVWGtE6cJsmSdZ31RsBBQ310Hn3YSag8QIap
         v8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUbkAba0suRYzsDtAPVRmCBnA1HNbkcgdNMXySR3zSY=;
        b=DWreaQIyjsGGVQx/jjyDbs1E9+xR3Pi1tGbcvctnAP+fkbqrfDzKKwTdypDnpW8+CK
         HlTPj2COkFyLs5i/e8GoFffzqHIPjgfSqkiOR1XAuPr+fPTefMW8glpmHJGWkEAW2kvn
         Akb2wqSe53jJxLEVNrG4gHgNXAJ7WoLxpRBtMv2Sz4Ye7aiIhHawIx+dL9JGBO3mJ3A4
         zGF2n+uCb0ZiJCV6/xNnq8bnHXq/ElHmpyYh/vVgLd+PpAZxRKPzSE53mRE9NEJdPT2d
         8FjOYtZ9wgyjYkie+ghFohXIzmdLcRHfH4ZT3N5+forthNcnhNpz4TlXRVhNnMVrIisR
         an8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfV+Z62d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t67-20020a375f46000000b0067e4be23a46si12637844qkb.651.2022.03.31.01.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 01:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfV+Z62d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZqSi-0001F4-3x
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 04:47:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqSC-0001Az-NG
 for qemu-arm@nongnu.org; Thu, 31 Mar 2022 04:46:52 -0400
Received: from [2607:f8b0:4864:20::112c] (port=45177
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqSB-0007w4-5H
 for qemu-arm@nongnu.org; Thu, 31 Mar 2022 04:46:52 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2e6650cde1bso245687657b3.12
 for <qemu-arm@nongnu.org>; Thu, 31 Mar 2022 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUbkAba0suRYzsDtAPVRmCBnA1HNbkcgdNMXySR3zSY=;
 b=UfV+Z62d1eRcG1vGCyVrUrog21yaMg7SE53WYgxqwCSucwJY23qz9ASjRX9kzZhggB
 NymnmrbA/e8rCqsEWDJ1EA3so4+8BLWj+a1byuXWiKRk4z6BR41aR/lRIYnU4j4yBw5m
 CUyzH2MUK3k5vyPNXLMxnXG3ReF2HvYz+JrBOp4DxbemhzVPtugEAwccU1rnCNVhhoBX
 C0sGRvZEyBWseS3h3dMq69SBkiiQLc7CL/ZuVS3S0Ko2gpKp6e3Lmb7VMcaItE/F7Apr
 FRAdT8pDIskOcpgWYA8caAntYyLO+wiHrV1Vk5SgSjUx24HIKCWVBNRaszSui7ckWjJY
 bZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUbkAba0suRYzsDtAPVRmCBnA1HNbkcgdNMXySR3zSY=;
 b=OOl/9E8YBNOct/mTWz3Ow6Nq58lkyI069k3c4GEKd6wdoIA43AItAXpA/eBw9Zpf4I
 gmUhOF/HTnpMWpiAnTwz6epUy8wKtgu3vFOJhdSho02x9oyMs/k7kauG58utLJjwFnV6
 2gOLVN9ckynmDgJX9d35v80H++C0U05SJrFaGbYG4bH9bVaEvgYexARJ2eP6kt/WcZ6H
 PU+eXtCwgHpIth0OKYLkQE4BL2nJFZ2La9VPA8ED4hsbZci7tSqn2FI27gHA1Lt3lJzj
 v2qhhAaUJ1BR/7f+tDmoDtIE39xAkHk8rtuYcIZH8/lNOE29saKCeTx97zkzSYtGaQDZ
 Q3TQ==
X-Gm-Message-State: AOAM531ykzcBLwCuRy1CgbvzyzYAopyVNOt54llrdLCtuKVinVAS5aAp
 TZ90QDfrXNu1ehxb4jMyaTtmz9mPjPz/VtI6Ebxenw==
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr3906637ywm.329.1648716410257; Thu, 31
 Mar 2022 01:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
In-Reply-To: <20220327093427.1548629-1-idan.horowitz@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:46:39 +0100
Message-ID: <CAFEAcA_cT6HrCpBXtyJNYTsaaK0kPE1_Z-EAKpiWfOz9WGUjgA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bug fixes related to secure 2 stage translation
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aaDQv45l25Fj

On Sun, 27 Mar 2022 at 10:34, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
>
> Idan Horowitz (3):
>   target/arm: Check VSTCR.SW when assigning the stage 2 output PA space
>   target/arm: Take VSTCR.SW, VTCR.NSW into account in final stage 2 walk
>   target/arm: Determine final stage 2 output PA space based on original
>     IPA
>


Applied to target-arm.next, thanks. (I fixed a couple of typos in
the patch 3 commit message.)

-- PMM
