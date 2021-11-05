Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1901078qvn;
        Fri, 5 Nov 2021 10:06:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbvaFUUmuMHiUwijm7PVCNmZ2mIaRSwlDRS7K2fZGcl3QqJRQuACO1HWKj7N3R6LehW5Ck
X-Received: by 2002:aca:b846:: with SMTP id i67mr22781648oif.105.1636132007764;
        Fri, 05 Nov 2021 10:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636132007; cv=none;
        d=google.com; s=arc-20160816;
        b=rzOx29dY5CQtWDpSPNW8TBb1+cq5PJV2qSxISpK1Gt1Hg8lL2EiMvtSGHT0mo5hhu/
         IhLDygOUbfmYcoxP4JOsrhRXU7HIK1aQ3eFjUzz/63WA1AnQdFWNsBqzxoQhXqdA8PKs
         zOck9kA6nOR1vVmEmq/Fige3av4TmDmMZRlCTGZ4s0Kktok5PhZDIC3TaAncbOtxwGq2
         WKd6yLargs0KTeyQOJD65mMOPEynUd97rl1tpCtjhSRCU422L6ZyvyIqbf3YIx5OGqPW
         Tgn+g6IwMqtLhBQWFggUEcFIsCK+YixJom8iWPlYAbNo1PC2eWcg3MgCcuUjqt5jZaBn
         OLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nUNbQ4RSWYaBn/83BaODcM8BQR19f+Zxc2obfN0eZtU=;
        b=Tvdvt+vXU+MyKSKm4kDI7w5LsvWKQoQlosQZWMPa8CZD/u8bzt6Jsj+V539fVLffWa
         foZgGteqlb5b6EAwKyv2OrOtE7Pmx6Qmz2zpzPGTYzq77kGB6tP5hQ/dSivvAyozsreT
         K3gCMoHCGr7JugBUsRcEZJuBd4WhXv5yajHed0b6KQbYmkFLSeRaydstVUmd5nRdNpJ1
         DQWLEWZaMq3/aj2oGRYZ3Ji+cmvlBk9ysw0js7pWvgOWbVjNhPBZPqg9o6gePAzRcF6V
         VuDnSoNd91sNocsyLTx0TbdQj5zmJ8/KfnV1ITv7kVy9Di5Q5Me+A7dhbJBQPzyzRLYt
         SBJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KmdsL5OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si9093659otv.222.2021.11.05.10.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KmdsL5OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2fv-0000Z8-4T
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fe-0000XE-SW
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fc-000660-0D
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id d3so14732994wrh.8
 for <qemu-arm@nongnu.org>; Fri, 05 Nov 2021 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nUNbQ4RSWYaBn/83BaODcM8BQR19f+Zxc2obfN0eZtU=;
 b=KmdsL5OOALyKxT0QroX5s8dDNIXCof+tkwYAnhXhAX3VhahIKVeUYxHQqEe5T5Xo1q
 vRX1qCjPAPPf2l33Ip1PEHpTS6b33/+P4oOs+zQXTkt+9mLSvCyeE6uuD4dDI4ZSj4p8
 4hRGKxxOkfBmovY7AR8hYpGclZyWIfjEqdt8K2dit8aSRonde99CowUkguA+dav1yN9L
 NYYUB6TKbqIP3k8hceu82/4kkjBnjkST/C3qfOWT1iEn4ZvOq9e8Xdup5uWyNUaoSNi3
 zTtDnsfYypX8zMpHImOia2CqGx/DGSbkJjTxHi2k03/NUYghx8RK2myqQo3IGAD50MDt
 Bthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nUNbQ4RSWYaBn/83BaODcM8BQR19f+Zxc2obfN0eZtU=;
 b=hBu4C7JNer23PUoplcihaBy3Y+dR16MDI8+rTr8x7wSFbYc6iwvDsXn81pkDYXT89x
 p/mks/4EexxnJtT26c8gtufQ4pjq8airl7u4ywpsHpSSEfF2Fb3RzJluFPsmL8JrsMT5
 qjBXvBeOajDxKcLR7bhk3uJpe688OAZKA72Qxzd83MA3VsNwfl36NnvOhTeIXXpqhCow
 IB65YEZGIEVsH113XjAP3UbaYsbmPFDOwL2B4VFAtXNRcjdFEF+PDVYgX+r9RpRLdujZ
 PuWqrnVCN1kFHtwsBDmFZ5K53U8gagcTi0/TrZGysH+xgEFkTTa6FIPMPQD4SXpMeFnR
 YDHA==
X-Gm-Message-State: AOAM531sCeZpCIGAjmWEe3nfpAsWhJG+Dq9RB1W1V10f7G4GVes7ripR
 cubQHy9Zs8eS3lxq3hrVQIM2QNkDUyk1f3r1nI7puQ==
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr22938974wri.376.1636131986178; 
 Fri, 05 Nov 2021 10:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-2-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:14 +0000
Message-ID: <CAFEAcA86ScZxrm8j7PC82FZgB-SimpK0fasLGey_yaUF8sDBEA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] target/arm: Hoist pc_next to a local variable in
 aarch64_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dXms14+J/6ks

On Wed, 3 Nov 2021 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
