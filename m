Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1211463lfl;
        Wed, 16 Feb 2022 09:33:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznXly+P854CaXczjQ2I1DBpNXFjU/auJEd/6J1lUifM49w0/S7va3ddPKmw36hJndn21Lx
X-Received: by 2002:a81:7004:0:b0:2ca:287c:6bc6 with SMTP id l4-20020a817004000000b002ca287c6bc6mr3264006ywc.107.1645032781815;
        Wed, 16 Feb 2022 09:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645032781; cv=none;
        d=google.com; s=arc-20160816;
        b=AC3dwJz1kfKbJ0dDttNtocZJolU63TE3v4gYccfY4rc/ejy+P3QCb8G7a8AGdh+gVO
         6iqGXpOoyVAmHAjLAQ8heU39fPADUX5pvvGP/vOOfiiCZmElz9aivqfSe2l7IaiAnjzu
         wHBj4GOQWPRHc6xL5NM33B9aNQfWZIijoP65reC3J7Kl09VeMpN+21vPXUY4BR+xeJqP
         0Ax77MoXfv9FfTOIBfstf4ujIyKXygzQ11QjUPOPfJ6yb83jFhRMaOBYAmxNh4Yx/PAw
         IbO5J26qFXXhSimU+YoZWcsp7E//p2h0Zl4kkLgs/QeDfHCiZvLluvbsGCTCwbwCd1+Y
         qH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++fTbmkMBLkVeiR+z8tnlnrkRELylZf6wHcJGWx6mfE=;
        b=0rSEBXeQUNuyMwJ/WT6MADzn2qJYJREZu0iyUTfkP8K1iqeTjDyurnFhp7WPH2+6gx
         TQDwNqo+Rgsnyu1gMpPdvfacx69cVqHHeMGK+k5jHrMdtZTaUh/pntgJpmGTyh3UuDnl
         So/Ps0xtdzNJxgFgLO/uM78QLSPGPG4btPadMrf25ixTPy7nPwXtbH4cDYzvbRno6iNl
         DzT3XBH0bTHk+MiCcl6JG5ZtFKkQ+HBaH1c+BpMsISideUbod0AIXmccH8zF2aoUh77h
         pIRQ6xli8LTV9XcNl21+a4MZ+zw1v6o49naMlx5SXeFhyEIVexr2J4S9xOaGdbBVC66t
         h4ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ygtnFFCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m133si15900345ywm.248.2022.02.16.09.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 09:33:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ygtnFFCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKOAn-0002t7-8R
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 12:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKOAN-0002qk-KF
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 12:32:37 -0500
Received: from [2a00:1450:4864:20::32e] (port=41926
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKOAL-0006r1-HF
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 12:32:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2190844wmb.0
 for <qemu-arm@nongnu.org>; Wed, 16 Feb 2022 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++fTbmkMBLkVeiR+z8tnlnrkRELylZf6wHcJGWx6mfE=;
 b=ygtnFFCPDbWhMveKCsLHZ7eUUAxS66lnF+YsrPK25e+r1E1CrW+GQ0AH5g1gpAD+T0
 XZe074tdYuqH2bvulytPUW5SbXeELxm6KinHz7HX4QDlJhdntzy8rllEXVjTVD48C12l
 B+xdv8Qaq7SxCgDLf9j6NlG0mWiybJL0Bg9tPggy4h2oONZSiGiWljUS/y5CvixmLFqI
 83j6uEory5T+2mREw993BMAzPcBCDSy03Hf7PikU4pXMbxOrPIu92S/j3YHTIbL2sBwY
 mCzVncwvUWG/6fkqAJ1N6Lx4nTKm3lkK6bGgQtRv6GJHd+Oi/ejtkd7VJIhZUz56tGg3
 9wQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++fTbmkMBLkVeiR+z8tnlnrkRELylZf6wHcJGWx6mfE=;
 b=IijSq9fWy61a3/r89DrwGm/ykDh9Cp9RAf2HpLZAdp70Xl6D3V/uyYwB3+eQbLgPnp
 lFuX+OWlyQ+h7kwltAM2UepNWYi6E6EfnWc1oITNeX7S5kDnv+pTBbxP9Xbr1c//uYH3
 /2Ay7vbqi2O0ydAKQy5T0h7fxQqvhc34vYaUvsxHhR/CSoDaElDUFZIJHKcTKHqEezDH
 SAGw9C3nr1GDXzh5gq2pJ82OlZjRrY0Rsdus46vjh+UF0fInRWpYg6H07kN97eZu5Dyj
 1BRwKkjxYek8ApCIZ3rI4C/JVvLo/lM+SCjU5jimy96N8cnowY9haLDrbRO5mvzW10/5
 VIqw==
X-Gm-Message-State: AOAM530KqGA+nOklt9oGd4Wfofu0PgDFlBSVKRo5Vco8iIMAEBkMvqLb
 17n7H/n4xcv7z8tMGODrjM43Tv+r7dEsgw/Nd4PjJg==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr2602315wmh.21.1645032751669; Wed, 16 Feb
 2022 09:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20220209124135.69183-1-agraf@csgraf.de>
 <20220209124135.69183-2-agraf@csgraf.de>
In-Reply-To: <20220209124135.69183-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:32:20 +0000
Message-ID: <CAFEAcA9W9bcSoTjrZEPop=ztCb95n-qQ=q5=OeLAj+vdZY6JtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hvf: arm: Handle unknown ID registers as RES0
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-stable@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzwqYyBsIGxW

On Wed, 9 Feb 2022 at 12:41, Alexander Graf <agraf@csgraf.de> wrote:
>
> Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
> those reads trap into QEMU which handles them as faults.
>
> However, AArch64 ID registers should always read as RES0. Let's
> handle them accordingly.
>
> This fixes booting Linux 5.17 guests.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Ivan Babrou <ivan@cloudflare.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
