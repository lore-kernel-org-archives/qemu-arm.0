Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98868CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:24:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzFb-0005Hp-PU; Tue, 09 Jun 2026 12:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzFa-0005Gw-Fv
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:24:26 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzFY-0004kq-Tq
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:24:26 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-68c32f3c6d6so5912117a12.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022263; cv=none;
 d=google.com; s=arc-20240605;
 b=KysS/h6MvqcPRZKDABbXiRTu1CgzsGPbRwRUHYvdPPcC+aTCJtIAtQTjfTeyZ8fQHU
 W2OhE5FAGT1usiStoOLyBaeLfqKlR0HuNqKlzcyjSDVt17DR+DP62+A7hBEpyLe8Zt7E
 2tyGzMderUot/Dnpkkisd3MWXHf9/XKlpVsxvka5X2iRU+aOopU+HwwL+k02N7xmY0Sq
 aVLgxMDCUo0KpEWuc6TxUetExm+seHURpr2i0PUikw+R3mz2GpomWwCmexB3dVt1cWFM
 fO+nQVUhbpQZY2xzpGHEu1lJ0ajObvi0xuKwyNoqHSDQNDNzz6AHfTgUBvNvUTbIIlCh
 73GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ep1vlU/2XuMlZX+At9w8bi/PfPVWKQvWPJWn7IcgCKg=;
 fh=dpnvCzafHmb5LvHCGkqTPXb4Pb6yOd2LSjN9ScsgIG8=;
 b=I6BbvrW8+u76pyzVdquoFHpOKm67PKJp7MsF13gM5CVJA4Pzbu25EsSC3tGCdEpsZ0
 w7eJwEY7JVzabe32oji8sVhCSGxDSU29qg8pMGz5FD2o1FMdg66YTUiCRZ0IE8W3h0wi
 jMlQaUTpaj3faCEYInSIf7bK34ov88zcvdkQK0Tn+B6nnMLKHIB4ABoMcTPYGPAzEi7N
 LMBfgL1AOERzEj/lKqxMN+3rt/6ypR3hV7wuYY9WWclaBl+q6gmIQq8SYuRyyaxlX/sv
 er/ifK5Q0pl6GDFmC6Wv3m5yLgihf2Gw+R6g2G81j0OQSDInwoLlDg9ShZVwFTkGCzju
 ZOlA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022263; x=1781627063; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ep1vlU/2XuMlZX+At9w8bi/PfPVWKQvWPJWn7IcgCKg=;
 b=mQAwPws2DZNTOZSJK8g3YQDtYbJ6DuO0S4T6km3E778rZ2eTMv1MoLKCt40fNg/oRL
 rQsqHFcUONTBWFbheFcD03epRsxC28Rg230DZoaD6yS/PeOmoSeqvjOVBERfUv3RTbYP
 FAru+tFZrotLbH1pry7xKCUgI8N5pzxns9X4qGtHqB86RtmfPXXYRva23nBzGfZsr2Uu
 OXbQYGLKm3UOlH0Y9ZX/KdP/aSGluF05UkgPG9zgIOYrgy9uFdgbbCZEfGQkBlzq7HO6
 v5Qo69yca+blfKTQ+1gx8j83klJOL4KxZ2uctXt41bvZB7enqcGVfS8PUcf0PsJGCfFf
 iYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022263; x=1781627063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ep1vlU/2XuMlZX+At9w8bi/PfPVWKQvWPJWn7IcgCKg=;
 b=EtQnsqlrRGPnPqz1j0BQfyWLICkVl2SBa2t3Fak/JNdCzgQ+2kHMRa18QxewFlDmTK
 PalJz4oVxFE3dpa/QyWxPUxF2EhxOEv9Q0KOJPRlPJW8B9Wr/0dT17iRbyTHCBsb+0oY
 2p7HqaFoCCs8vtceqjz27fGnLSfah2LujCI4ejH/s+qVL9WhNRHlgFWQMB7wpV86+Kc6
 IDcQkZZJ8J3oi5LU7ERlMpFg0/6WZsb8zeRwZga0lYrIeVHXhBtSXxZnoRGRK6q2OyzD
 hxsk/Iu6Vq9DnQLHG5KEXGX6QXdmF7Nr1aTRIE78/xABEBLg1f8l0HoN1Zqaq5q7jBmQ
 MTvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/L+rq8Gvosjw5iyXFfBCDBx8SHGK6TYUQqtTE+t204qzt8eweOjt6sMwL66HwxBFGLLgfojuPk/w==@nongnu.org
X-Gm-Message-State: AOJu0YzzJjm8P8gIM/Ny4lMOwMqd/PokYG8mNrolhIiIK6QC7PulyjM7
 cmWrhdH/cKBpbzW59W4x+Dm3ChMkYkrFe+XHMQc2nOWR3t377l852Z8SkbLey4qw7xPq4oZGvbO
 49ullh+3Ej21uOkrW7p6vyEs5XjT1xweUuB88xAzRUZmhB2QeEVtb
X-Gm-Gg: Acq92OGowAOz/CvvrFMBiMuP6dmn2QjkLslK9j7YUmlSVjYxC2qsndUjg+0ZkfbU01s
 hwe7CoOoVrQBYP6X18laD2pY8309lto2o2peKQg9mb84Xry4gcU94XZPGFq8i5FV4VeU+q5sP+v
 IFefnqsqASqR4KtEqe60Y0yjs3RgrlRUiicw42lMI6QYeXUWs8nbKCwAGL/d9NwxHgigiwPcvnK
 C0X20QTHI6RFi44tteWgQ55aS5yKvSCpFCim5qKZxs/ohFpXW3BmywDpwMrxAF5fthzMygSI7/U
 Ae/A2nPOTkzWSAmkHYbQ0chrHMwG1yoomtIzk0TjG1Jq2/1+I3m8chAFmd7DaYR814Vzric1cvH
 aIzx1E++dZoRT
X-Received: by 2002:a17:907:9812:b0:beb:7b50:3a7e with SMTP id
 a640c23a62f3a-bf3733fbae2mr1020011666b.45.1781022263331; Tue, 09 Jun 2026
 09:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-43-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:24:09 +0100
X-Gm-Features: AVVi8CeuQL7mUuSCJ06g-VsMU8oqgdjJ0qk5__hWy1N8oQZAUOv3yQGr3cOtRw8
Message-ID: <CAFEAcA9q5ZyW0xFQbVJHdpcbeiToCPkO6RVcG4ATqGyA8aqXTw@mail.gmail.com>
Subject: Re: [PATCH v9 42/45] target/arm: Enable FEAT_F8F32MM for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 1 +
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

