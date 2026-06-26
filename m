Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423DDC43327
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 12:58:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd67w-0000Mp-Ak; Fri, 26 Jun 2026 08:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd67l-0000Jm-5e
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:57:37 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd67i-0000Wl-6B
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:57:35 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-662c360aa73so1016303d50.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478653; cv=none;
 d=google.com; s=arc-20260327;
 b=Jco/NmHhDApYGkFq1in9xoE2abbUH12ZtLj/pBMQ6+dWiVVpexNjKUqNOt3RDqo1U3
 cWqC5hBvvv4Fd9fbVdV6yuXR5vW5KDb11kbMp8BdUCUgpsIL0+FLvlj9rOK0Vrt3VnFx
 HiOrsF+f6xWH+raTynvlt3FB17Um9EOJzmBzJr7hYvD2rWSn77LFzcxg6bKxhPi1QAIG
 QZ+B/zLFTiqZmmL4FyQEO947ny/Xw37cv6+ercFIaWZnRjHqVRthWfjcBq0fPi3kMLIe
 pI9lC8bKin3iqwl+rbgml3gi9URJIA6OHh2Rr8rj/Zuk+Y9oIvVIskxUtUNTIPgEzpf9
 7vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rL7rtzP0qTGmTTi87bsLx3/ar4IGATB7nEg1GK9Hm9s=;
 fh=uEMIIhngscgOswzfo0VxDbXTvenp3yGacm3u4zr6C1w=;
 b=OnZIRYkzfm27jnHfgPPRN8UHkYz8z9PtiYdsBkEi1/l/yCLahYgMhYHg9iV4RAZrqE
 ag8AtZTkijpALWlzTu+zX+hm2SkO5yVOiai9Rp5uaG4mgytAfgVGb4VYAwWvD2knylxP
 v1b8XFPuNBiUz3i7AJIU0sTdTw4T7gKcA5ZVwqxJsIiQD2QsjQWR0RLafmeqgZAdjEcD
 /+8FDjIkceIOSJigAt+UseCd8aOMg0XboJkYkFW741iNDtkHVVlx0FCpIhkVk3F4Re9l
 S9g6R/2sTlzGkHw/7z/D/P21me1gXbd8BOdsODM+EnbeuKI7ngnct6CfEfz743/S7l8p
 gpQQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478653; x=1783083453; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rL7rtzP0qTGmTTi87bsLx3/ar4IGATB7nEg1GK9Hm9s=;
 b=K7liV9vb/depP5LyMZ6uw0TUcwaJIxTIHCt+CL3CUcNYXN0DV0Hi3caPZGXrTbVM2A
 rJVOL9byeNozeUaTVXsCs5NVOccPbd21NH+pG1V/K4w1y7jFywkQFpIoydnmnq7uV/6+
 lKHAihk2Vf+/b9FiIjiBJP1ZEqbf0SVGpW7Hk2ZMb05IEa3/hbI576sxFuOa032rAeRQ
 vxQmckt/NEOQy1jovLkH0APQheOVHMdeBQw8goxmzbnFn4YtpizIXE+hVUFqxdx6B1Sc
 MXATt+nqaTvNDTPOyz00j8Caqi84MwfrfFW3MKhfD9tGXilUskV9o2wluzPyj2PsQvjh
 SMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478653; x=1783083453;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rL7rtzP0qTGmTTi87bsLx3/ar4IGATB7nEg1GK9Hm9s=;
 b=eKpu5+KcTL1/GDcKS1REIvduNdGqQXP5g+4VW3RJne5GN5ts/cuPxmgDFZWIaZzVzJ
 LjPnY9UfZeubaUE/CVK5iUZlMZswrTWVCMuk/8FwZ/iQsxIgMmISlihesg/feKqnG45H
 Jhqp4Xaaj7WpMI8oy2TGXF/6cmfhiyJy4px5xSQ5sfY1rNtIrnDUxw0uiUgRGnj1V49I
 QAPyRVqerTA0x0gL+Ka2ImrV3ggDwosVBmoI9L/2HBLqz3Ne4s6sKmYv5SkWha1TGzbj
 cQVsJiwieg1hvzjHMCWPki8vybHUmLoEi8nXepAMeDmL83645wsktvzZI5hNII/GHxiM
 Rpcg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoFPT+uzsaRv6x83MQMfAY3pJfC8nq6B4+/auDPjPNH7KxAqyb/6TFyP26JS8m6SrB8qEZ53FfW6w==@nongnu.org
X-Gm-Message-State: AOJu0Yw5YP9foLvOAsq8iAFp5zy0iU4vWWoWSfTl0neNntNI4KZ9+Y9t
 maKUbPPwOwt3eJHiulg+PE07ozcSsgoX4vXrZqxOXZHs5AmJnHkmZSN1Mkx6vZI1Z4Z3JSXX56X
 yFdrRQqDWaPzeNeYLyackxxRqF7NljSMJ0NDyWIB07g==
X-Gm-Gg: AfdE7ckLlNuEikikt47kiTaHvX4xVuwjxmsrPB4WvFp8LM8QdC0tF7eAXPPJCkdfGLD
 MDDbsLYX0vfErFeA+VxjF9rIu6oIMUevubnR93Qamni+yf22xEzgdqqJycueYUSJDIdm2aTVlZJ
 geFQGqgnTpARJ9L7qR5FVL1sNWNvFD45b/pUa72NR63j12tWiSonRWC1wWFKooEsll220gwUabQ
 7E+an5riXc/NLGPxRS/2iQu75Lm7ZtYghlIj4A3agwVS6W1rMEtG+LZ/qdoW1wdtVl4uureiDNs
 e/QKGgH3BU+l0JZB395HEu1MSmxFZsf/7ZgN366Vh12uTUSfHFLLG8n+nXLT57J1o8c=
X-Received: by 2002:a05:690e:12c2:b0:664:ae69:230a with SMTP id
 956f58d0204a3-664ae692539mr253879d50.71.1782478653054; Fri, 26 Jun 2026
 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-8-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:57:20 +0100
X-Gm-Features: AVVi8CfQNaw_5bUeH1BezpwGsD0fgNlKGb_Ux3QDQnw9y5D3fxGQVzZD-mqRyrM
Message-ID: <CAFEAcA9ADv3WfxDSnv_hhUjL6BEBuFpsAc_f6fU9Pq547r3G6g@mail.gmail.com>
Subject: Re: [PATCH 07/15] target/arm: Implement FMOP4 (widening,
 4-way fp8 to fp32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 25 Jun 2026 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

