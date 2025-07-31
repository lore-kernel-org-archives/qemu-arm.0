Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F1CC87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 18:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhYQb-0002Uk-NW; Thu, 31 Jul 2025 14:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhWf5-0000C9-5o
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 13:01:47 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhWf1-0000E6-D2
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 13:01:45 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e8e1f488b37so1184947276.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753981302; x=1754586102; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=me/mcRpGRyDw2yXTWov3FFQsXEY+h9trHI1uj53phXE=;
 b=BPYE/IQWVtiVyKVv/6OiCr6RO/83heFGudE3g8rviI7uFpCFyQb3CL/WxU40MizDwq
 7PeWFIS46djQuwf6R5H9+TmvOWeC0uDlrH4zipTNiaegDDo00sW3hBjQz05nTDMD8ilv
 LT0gyaLt2RiylWI4tXpkygMkUnb2jZ98WdyMZkwvOQa5+8KVvpvn4jf/l4cXgbnbHDql
 Q9TbdJsgu08U8MxUTKDUO9YHoSES+Tl2E1wCu0IpzgnbXBOHHxndEx+ErdM3suP7ukjU
 7s3+TwGoPZoSPKHgZfIqxM81qSBF+gfkjEKDwNEcALHvjV7AIp19TO/sbhuQZnORQ1il
 4wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753981302; x=1754586102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=me/mcRpGRyDw2yXTWov3FFQsXEY+h9trHI1uj53phXE=;
 b=Jcn6TbbVS+6ri9rNmvmwYSlCkfNnerivGaZNiVGFDr6paZnLpm+YHwc9jO03iqi/9j
 QedDph58RwaVJD6wubfkyr0goQfj0xDwPQemmGtpeFmdOUQtE9/VbSgiOArTS7cyspUB
 ficS+kNPNTkoo8l6IpIONWkKkjf3VDfRewnTKCsBH2DJrIwpwzc9x3s9oOoYW63VWgDO
 /b5jszG5ploeLuX8ykrFdPtFsBXj3uLP/h6TklZEAeD8VmMGFZxDIEDcpWIguhTfatK9
 KAnHkiGrxkat1JmFdAlJb44E65ij0Bme0nkQhSYSTBFoi29pgxCzIEoeCUkx8GLS9zW5
 6fVQ==
X-Gm-Message-State: AOJu0Yx3sdmnYo7ocOrlkOvIrEZpk+jYt2jsoJVZbC+R2PPabPzyruR3
 Qz2Wrp0afiTx3K29aF2LHuVrH4M4z4y/S4APbeCM2TWHAMRBZa0KCrpZuOHKqb2NLpZiCycHyGg
 iDeyowYhFp3RV5QpIbrbgEXgZp0WgElj/HsomyvTscTsjuWXfpMeo
X-Gm-Gg: ASbGncvkPzyaRkWkD3sGO/0UK78R9/KXA9VjcP6VwveGrN+3Sa2ospyWckcGeAy90lk
 4KSsKmy72mPiI4M9zHigt72bKyGfQ+QGoFeAealRteLf3rrNVbSPeysfKJ9ZKvChPWu2WGw2kx0
 EPfWJkOw9S4xGL9gR5A+Y9JW9TKdpk4VUCEEESd2L2pDGOep4ksDhX2a73z4+JVmaIni9P7H83U
 3XMGXE3
X-Google-Smtp-Source: AGHT+IELZX+yU2WjSDkZiCLoQyZVLJyYIRkkcXV5jn1eACPsq+AuNRYDdd3zbwEMv1Hs8Ijpenzd8yLijWq0vsqQrpQ=
X-Received: by 2002:a05:690c:6f83:b0:71a:51f:81ba with SMTP id
 00721157ae682-71a466bdf92mr115631307b3.31.1753981301427; Thu, 31 Jul 2025
 10:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250729161650.43758-1-zenghui.yu@linux.dev>
 <20250729161650.43758-2-zenghui.yu@linux.dev>
 <CAFEAcA-hOWhKKhWLjD1pWyb+V8SPdOOuW0jWKN=wmn+mo=SBPw@mail.gmail.com>
In-Reply-To: <CAFEAcA-hOWhKKhWLjD1pWyb+V8SPdOOuW0jWKN=wmn+mo=SBPw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jul 2025 18:01:30 +0100
X-Gm-Features: Ac12FXxfmpOh9S8elWqKRp9-MMiLJOkpf1c2XZY4EA8_K0w2e56YwEQMpvWXPcE
Message-ID: <CAFEAcA8wpRgTxeYxqVg0-9UN3Hv=mQwvatOyPYbx41=ZBkZGuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc/arm_gicv3_kvm: Remove writes to ICPENDR
 registers
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 31 Jul 2025 at 17:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 29 Jul 2025 at 17:17, Zenghui Yu <zenghui.yu@linux.dev> wrote:
> >
> > As per the arm-vgic-v3 kernel doc [1]:
> >
> >     Accesses to GICD_ICPENDR register region and GICR_ICPENDR0 registers
> >     have RAZ/WI semantics, meaning that reads always return 0 and writes
> >     are always ignored.
> >
> > Remove the useless writes to ICPENDR registers in kvm_arm_gicv3_put().
> >
> > [1] https://docs.kernel.org/virt/kvm/devices/arm-vgic-v3.html
>
> The kernel doesn't implement any state behind these
> registers today, but that doesn't inherently mean it
> will never do so or that it never did do so.
> Since we have the state fields in the GICv3State struct (for the
> benefit of TCG) and the kernel defines the accessors for it,
> I prefer to leave this code in QEMU, and leave it up to the
> kernel whether it provides any state behind them.

Ah, having read the second patch I realise I misunderstood
this one. Yes, the ISPENDR registers are special because
the kernel implements them as "just write the state" rather
than with "first clear them via the C register and then write
the set bits via the S register". So this is correct.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

