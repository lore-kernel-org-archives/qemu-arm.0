Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp304996lft;
        Fri, 24 Jun 2022 06:05:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1pLdrGMNTQyVwndyy2QIhBsvClIs645+dlMfiFbVP7A7LhY3ThY4yPANHsuCK7/3lxtae
X-Received: by 2002:ac8:5b50:0:b0:305:3275:b9bf with SMTP id n16-20020ac85b50000000b003053275b9bfmr12641952qtw.498.1656075949511;
        Fri, 24 Jun 2022 06:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656075949; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYjFjrUtXtEcPJ2YkZGlVKnB9uf/OqHnAZ4PI4EDfeiHm9LPOnNLmn1OIcLnWuG4Rf
         ef9IGxV7pxjY/MkOjB6tmxd2iLwRo9FPvJArpMvp1aPVnc3+Ry9F9VJOrYdQAvS1U2s0
         xa8Kx+3ap2ERp9nYRabeUVh6ZVsnYs3uQ3J/o+WJ6pBFgNok35tNSDuAe7KRibc5uaDy
         KZPrMABQWm2LDM+q+M39GoYG/9WKDKGQ67xotHAR9fnyAslhJ6KsZymo69NhAABMO08w
         rdPwPg+GqhB6DHqXePPEuTCbEz33NpNkUh393+5flvSqISLKpMk1p0+xtoobQf12zEh1
         LxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DfDjcMR9+awmZGnO0ppivvxD0ZdOE/LSdtfasxFk6tU=;
        b=HSpR4hPvY75I8kw+qGzeZYhc/Q8nD5rcvu+6Qnnqw3s+7i4RNdMe8TFyEwEW4PIAxQ
         5NX5vu4Ta0BQOhOBXphrufKDB09etZyo3kMNbSAaGpjuZNusdVMbw//hyaJjH2ytmuWC
         rlzr3C4K1l6dOJOlXDY2r7177LeQKIU7jNW2kEMUluHqKu2rgUx6CsiQz+hQqqdMp0rP
         3H55FKQj7gRiWEns9r5nFlqP/kY/OYJUM+Cf4pKik61Vmjg7wFUX3RWBdY0yY67qEdYS
         QgFQWcx9cMnEoP3UpFynGPIVbPu/26+uXcZcDkjhxLGr2DWqiA+85+S5LJ/09RrqJKjD
         zlKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cIY8VrSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a05620a410800b006a6fa56f57asi2132568qko.401.2022.06.24.06.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cIY8VrSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4j0O-00039b-N5
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iz7-00034i-GJ
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 09:04:42 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iz2-0006wL-J2
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 09:04:28 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31772f8495fso24174507b3.4
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfDjcMR9+awmZGnO0ppivvxD0ZdOE/LSdtfasxFk6tU=;
 b=cIY8VrSoU1fzTTzha7tyc48sw1yCsAgOZJs18AIN4b9q56rP4CWXMNOYD9DCRjx9L3
 jRhLlOjO2c/Jc5P2VETkPstxY5B8UDFfY/qu4nnMNTQfcpv+YhFIMedjEJauQPUnYcK/
 CcFuvE/Sxw5qVrBwBmL3ML2NIV4QlJswzIHGChsU69cY3Y3Upw2ySRO9xZrGk/VLrE1c
 srP70a3zv58cdOcLRPMzkJ4HtTnDyiZZQuW1BW72dAgBAsKeUB/d0ImRmVd4B/+TBrMr
 OXb53XZZnPHOGhy8Ll94QVd9OGgauKC5dxtqmDsDM4mM1jLVPDTbh9uAUzAeymSZKxRI
 SQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfDjcMR9+awmZGnO0ppivvxD0ZdOE/LSdtfasxFk6tU=;
 b=MfFCcAzN/oHEsB35YnBYXHjt+yIbIfrZvzBh9IIsbmpl9R1PFVpigo1ejY12E915oD
 fpphTYBLlvvQ+b8swTKifeAp3DjvyTltHS8C+pEFNRlgMw4oBcokPF2jiX/jqMHePlhX
 D8Cy7f2VZrRKcvdLIv4ld3LOGvlKa/cpFtlKnVtWXQ8k098Bj8GOdRTD+ZWRtAbFKCCU
 r81MYz+C89hZx3vViQjVHcq4Lcczp3ZAV0C2xGTSL2JTlm9H5T4hYFSTkbANy5hMDEV1
 TcHsiQ2mmYjDRnqhT1Cexy1i5lL77gm76vqAu6abMGHvD7Iudur76snler97o1CeUhjZ
 xB2g==
X-Gm-Message-State: AJIora9wFTNw9pOgho+w1ondpP9OezvRgEcF/FTwJfRF1M1WwBMtwpuF
 nPBc4dB68WiR3IcQrQOMM8NCj3p6iKFSIXpCBQkZJ7z0WYY=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr17424705ywg.469.1656075861322; Fri, 24
 Jun 2022 06:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-39-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 14:03:43 +0100
Message-ID: <CAFEAcA-LSjXc6zk1FOn+6YmX2ZLLwg5bUGDX5MCR1S7ZvUtQ4w@mail.gmail.com>
Subject: Re: [PATCH v3 38/51] target/arm: Enable SME for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vgrd9/z45j59

On Mon, 20 Jun 2022 at 19:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that SME remains effectively disabled for user-only,
> because we do not yet set CPACR_EL1.SMEN.  This needs to
> wait until the kernel ABI is implemented.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst |  4 ++++
>  target/arm/cpu64.c            | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
