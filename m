Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E043CD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 19:19:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMscv-00009r-6d; Tue, 12 May 2026 15:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMsck-0008TI-2A
 for qemu-arm@nongnu.org; Tue, 12 May 2026 15:18:34 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMsci-0000HG-BZ
 for qemu-arm@nongnu.org; Tue, 12 May 2026 15:18:33 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-65db820588aso2413388d50.2
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 12:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778613511; cv=none;
 d=google.com; s=arc-20240605;
 b=BdFvlOCu03xEXd5/xH69eeTklazEq/2Sjuqy1lLNJ9CvR2SNRUAXGgoUayBRz899VE
 Tg+Gfzdo5TYpS/AUgL3VAHt25hXkI77lkn8BkFz9I+KXhMnCqQY+Ezpb91+SyDggykZd
 bkWJimrKZw2JYumqdQZfywz2ifxu9hjf6z8RCXsR31xABavbHOQO/8wRwY21To9fupEJ
 qT4yfo7tC18cTcUfN9qrIW1RiuuHuYXQFrYo4OLVUIiT09LD9zIl9cxQLQFQ5vHY4qCt
 VwIpfhxzulpJABJMIf3GjivjDqsxcaC/X49oFU4cxSN2cRSMANJ48SGZ+o5ecD/zG3r3
 9mlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Xkcxdo+XkZKK1gJ+1DsaxJ1v8iMmDGIYTeh7Mq8MqZE=;
 fh=jeHZCYREg1x+R6aMMP84DX71ZpVxCB+utobZcVtqZMI=;
 b=QmO+UECFKR/Rr+Z0IQi3GUkZ1et0BB2IDIfTKrkQUr2ktSyw/HmgrhA08t8w+KiNYs
 ouIVqA95mMZxdixpV3uZQnDPVcx4lcTf/9+trtdncYeQgYBg/nGKW8juJIGBgI02zeyp
 QDzacO252iBwF1Jj8QpYBKVvl8UacC4jCSc59gw3nhFeuRQl7p11Sap+3ukNt6Mzoa3c
 kD1VK2hpJXy+4OUqtKPFlySm+7jF0WKgeP66BGg5BVVA0UHo+gKay/+2Xz5580b17tE4
 jZDTAdrYN8GO6c8eQwCjqf0DJ4MgDcVbcg+LW2xVie7CKpv/aW/pvYkUO5rgPvobQtti
 LiNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778613511; x=1779218311; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xkcxdo+XkZKK1gJ+1DsaxJ1v8iMmDGIYTeh7Mq8MqZE=;
 b=MrpXB5t1KTkuz1pwNxjvguOrq9rPK3jwqHDeCPYAHVfChNsdcHS0thQT4DYvf4Na6H
 Wg2m6A+9HkohtdKLu2WA/qkq+CcpeYZauG5lzjuqc0UYpK+pQYQ9hX0dE3WwDXQFWXzH
 SHJwof60DpLM822ZwTIqqH159ybUYBTyP+kMa1+CUPdEcec6lwPqbsiXhX2prOAdxOZ8
 9VXUMsH3/r1m4r5xMxowBdY40hgk7ZidTxM4aKhcp8LDTbkEbGl2WuFpd505YTipFYuh
 /0LyeKG+B4Qaxe2L1iAz6mH21WujcR2AfM1q8kwAB2oXfGl0Ke6LrrKQB7fAjb1M0Srf
 7qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778613511; x=1779218311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xkcxdo+XkZKK1gJ+1DsaxJ1v8iMmDGIYTeh7Mq8MqZE=;
 b=HbLW5FcqQA5Nw998Adr/7wcONmZqgqhvr2WoYy/Rm1fpg1on6pfy2XwdBRl/YYkoaA
 9VvwjSPoPJ59WbfhpRkZO7PaaTS0BJt2yjmYIOJVHkGgOufw4dQuvy6085JCgLVcwzOy
 +zQXD23TwoDClimPUvI79Nmio4T7idun9ZBVa65moG0RwGQol6CgyRpscg8VcvgaIgSf
 KPZMtwoOY+0lEwhLqRzq4juJ4L5Bt93/DIZ03t49cqQk+suqmKtUWPIUUV5SMtoBgffO
 be7o3q2uZKKf/6XrHXTigenUTbqNL+HglfLzgmM4eh6tG+b4t9zqQie+Qj/+AXXcY+0q
 sZwA==
X-Gm-Message-State: AOJu0YwOGJPg+iNBbnRq9H1qUtSwBAJ/QaNApTTlLUQ3l9+Aqt7dUvWU
 iEG6eiCiNvl5rCEKVg5yXADYz61/r+lZ+FwhIMhERrVhNOuf6r8mHxW95PISWCMii4KRWeiySMu
 +/glz/oo3MoIRtyRxT7PYpg6J9SpxCl7T+tRv9tcQWQ==
X-Gm-Gg: Acq92OG2vAazBV8vTtVj1SkIUUoEvIvI4riTeMgF1I4767H9Vm54tygV9ibyZ6Q9bBc
 qYqi5FElk+6xpTYavAsdC6W79nfKyIMu/zBoDmjl7XVl6EDG9P6EVbv3Gkw5w3LGYmvqWZUu/2M
 4NmfMAvWgSLP2jpeYCMDzn9Nuh/sN72kqH5wwhK+j9gL2+a+I3Salpp49S013HC0hwH9nh9zAZh
 zflfchBkLh0XlBX69MISVdkxEpuuHxD6a0AcgrMTPAOKmz542Z+PMzxgnz9yL8Kut9Sunf2wuyc
 K7TWUaA3/+5bZ40YFj96lxZ/7Lwfzg6cJGax5oKPTCPP0wcM6HN92JCAjFskoT/QZLI=
X-Received: by 2002:a53:ecc6:0:b0:65c:67fa:b420 with SMTP id
 956f58d0204a3-65df635cbd8mr214222d50.30.1778613510448; Tue, 12 May 2026
 12:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260410055045.63001-1-scottjgo@gmail.com>
 <20260427195516.46256-1-scottjgo@gmail.com>
 <DIGUN8EOAZ7C.3VYBVHXL4F06O@gmail.com>
In-Reply-To: <DIGUN8EOAZ7C.3VYBVHXL4F06O@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2026 20:18:19 +0100
X-Gm-Features: AVHnY4Ib3PGLLuv0WpK7hF6LMb44uUqzwHydMqom5gCeErbcuZA7o90aMz-Bsvo
Message-ID: <CAFEAcA8xfJKpp+Ut1+7V-aqbaYZOkUbUYXr9eT5Nhgt9y6XC2A@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
To: "Scott J. Goldman" <scottjgo@gmail.com>
Cc: qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov <rbolshakov@ddn.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 12 May 2026 at 17:46, Scott J. Goldman <scottjgo@gmail.com> wrote:
>
> On Mon Apr 27, 2026 at 3:55 PM EDT, Scott J. Goldman wrote:
> > Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
> > changed hvf_wfi() from blocking the vCPU thread with pselect() to
> > returning EXCP_HLT, intending QEMU's main event loop to handle the
> > idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
> > always returns false and the vCPU thread spins at 100% CPU per core
> > while the guest is idle.
> >
> > Fix this by:

> Hi Peter--
>
> Sorry to nag, just was wondering if you could take a look at this follow-up
> to your earlier review comments in:
> https://lore.kernel.org/qemu-devel/CAFEAcA9RHQ+7++=kLn2goJwcgzDnaqdkQtQBtxQ2Rw1-uiKY=g@mail.gmail.com/#t
>
> It's a bit of an unfortunate regression, so I was hoping to get some form of
> the fix in.

I'm really hoping that somebody who knows and uses hvf will
review this (and your other hvf patchset)...

-- PMM

