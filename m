Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp771884nji;
        Fri, 12 Jul 2024 05:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+or3MYrMYpFdfa94hKmj4BLmR1gmQ7364JxVsT0eFnzooAIkcQtQ0pf1kKrCbTMBMVUhg28lMdQa0wtMhmprRlUB3dKeW
X-Google-Smtp-Source: AGHT+IE42sdO19gIHEZh1bdtybVX5lfP/PVbmCJe3OedSLAxbuqNp7VFWV3J0ENPG9JJe65uOgCI
X-Received: by 2002:a05:6214:d6a:b0:6b5:7e09:970c with SMTP id 6a1803df08f44-6b61bf038a9mr140051486d6.33.1720788548140;
        Fri, 12 Jul 2024 05:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720788548; cv=none;
        d=google.com; s=arc-20160816;
        b=YgnwHLVE1x43u5ZhSadsWSqqe60kIluVxo2CtAmP0KBO6ony88jC52+gjSN7UHt/83
         AWzeL5U1PTi0m68gbdGcLxDlkh4l3xvY5ifun3s/8oXYdTW5tdVE3e9lizt+rXnoOXlY
         4zsFD3qCLElAFpEEIphXJnUoNxB+y6NOMUdQz4grxqlH2qLp+TfyZgSxcKtkDGE/LTAI
         X0Fw1aoWCQEA2OuxctS7bJaJkgfuompgFW/Q7Hwe8DSCy93NElXkTpZ/F+J1IzZrrKK9
         hcXDfMNBc8fwXnmnMEg8yUwpPhvbAFppMaevaixAgB6hvbp1ZB8lPbGWucsy0tde8D4q
         Lg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vdOFy6dxjkSCrkZ+P1e1QlY6kQ0YliHjTaABQ6io8rQ=;
        fh=IqNLnIoKRiS4FrP+44GW2m4T4wuHOj5FbVrp/idA7wI=;
        b=ssZMtpIPxMISVw1GRTo8tufiPtAZFGbEZ/yTPeN9OSD1NsoA/08SslLlYHaW1vQEa4
         CeAGG+CXO1qqcoP/OUzEoYIKByht3QKJBQaPlFNJjlGdBzumxhi73iWu0mHPfUGwlhNi
         8uI+pojgEiaW7q5jcEBPaqHlA/JptY62b1s/d5d+fnQYrKHrBvQJ2aByPfk3jSY3nW/n
         9Em5EaMUSACv9ItaU4ElwU1I+TWQDk6HLpn+UO0wulokOPEd0Tt5ciOKYm4ml1xUJ/CA
         pL3PryzTZV96IplFvDqivZwIx4mH5rGUjDld8f9e2zvRLnYfC3SbHTHX6aO2L+lZufnT
         vJkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tosNO/Nu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba90102si94003716d6.263.2024.07.12.05.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 05:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tosNO/Nu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSFhm-0001iz-2F; Fri, 12 Jul 2024 08:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFhk-0001hX-La
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 08:48:52 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFhi-0001P4-LX
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 08:48:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-59589a9be92so2798481a12.2
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2024 05:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720788528; x=1721393328; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vdOFy6dxjkSCrkZ+P1e1QlY6kQ0YliHjTaABQ6io8rQ=;
 b=tosNO/Nu6xHyDgZPu1VLZpQCnWSl+TV0sBey5zxHPEb8XQvo7ROudCT9pfdVuQeYbU
 Ddcc1j9Y/HZIqXQwxSHuIyNpFB+UlBQsHf2554DPqo1Iyp9RQvs9f7JTUZqyWX6HM3Qh
 DUPXMFCY35MGkqT4e71xKQ4wt+GZrQRUnnKi2z98Xz9gTpe9wOYJXHkTt5La8engSNAq
 7f9FGIMUZ3fH6KkfIqKsdS10XtDRv2U1WZp0vt+2M7O2oKrNaBDhcHcwnFcu99DGxVNz
 udSSTpVKbl1osRFb3KPOPr8mQUId/XuJRAqxfd7HbF5fOT5w4poa0dg6I+ooKqPjAUIG
 NtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720788528; x=1721393328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vdOFy6dxjkSCrkZ+P1e1QlY6kQ0YliHjTaABQ6io8rQ=;
 b=eu8TYOenVY5s9CghY1q73mKPaSd8qWyRerQ1wWMqCo+1OjfiQVfbQofteSjjIE3ewD
 EEXfwDsmCcF1rfgD8pB2SASvklsT++kLQTl36sRSGYtZMzsXb/dGIBPPaqDpTJ3a3NYQ
 OQqdfJ+j5JQ81eVVIIKqCqLcyfqZxQvk4Nw1j/fxIBUm0HLb1FgSTYQ5KttuCv2TqtDp
 JsTEgq+lvG+EHzoJVSeb1lfkoLnHvrV83VXC6sKFHZ00G5qmTIUsMpcxn2Nkbml+HyMf
 qYlk14xyPZ3mF2whEVRnwcKlSFjnI9Gd2GRQKtluU01VFBAZMnklhMFGzBLJvx54zT0z
 tHeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFqXMt6gDfKNIHft8gSBnKk9nVBG3td75y7VT9HpK/8VI3xb1/QU3yykoxH36ltq9PmNprrAtBylBjROp4yh52Lmck
X-Gm-Message-State: AOJu0YxfRE7WIGHjSh6hIFc7HnuH2A4hfNJeVAgsruwFTEmoSTPnGfcL
 wB9JWkk2SK4eVeaqci5N3CXfwbDMFEmZfYfGyPKenUI+87sr59s94cmSW+H+Fp2pTpYfS0uBB6l
 mfdynBdSby4HUQxil6ycdfZz1HeioGPvXWMz4AQ==
X-Received: by 2002:a05:6402:34d5:b0:58d:45af:43dd with SMTP id
 4fb4d7f45d1cf-594bcba7d38mr8801006a12.36.1720788527970; Fri, 12 Jul 2024
 05:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-2-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 13:48:36 +0100
Message-ID: <CAFEAcA_BsY1mSJ=BBfHzNemQkfy9FqD_x_38RkRdST4cur5bhg@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] accel/tcg: Move {set,
 clear}_helper_retaddr to cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: q54l6h8yv/JC

On Wed, 10 Jul 2024 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use of these in helpers goes hand-in-hand with tlb_vaddr_to_host
> and other probing functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-retaddr.h | 28 ----------------------------
>  include/exec/cpu_ldst.h  | 34 ++++++++++++++++++++++++++++++++++
>  accel/tcg/cpu-exec.c     |  3 ---
>  accel/tcg/user-exec.c    |  1 -
>  4 files changed, 34 insertions(+), 32 deletions(-)
>  delete mode 100644 accel/tcg/user-retaddr.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
