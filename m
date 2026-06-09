Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD20CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsTR-0005uH-E7; Tue, 09 Jun 2026 05:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsTQ-0005u9-Ub
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:10:16 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsTN-0000wy-Sz
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:10:16 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-660e9ff0587so2263540d50.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996211; cv=none;
 d=google.com; s=arc-20240605;
 b=DMk4uICo+gsul2r/JEjiPIMvQHtO+iXndoxF4RbZbE6Qx8biU2eqzblALYlXnelUFZ
 x1XAVd0s0Ip16wEAbmVer5HLxdTEQL6odaiN87udZs13cUF1Rk2pSiV+XTvTHy03f5n4
 Q/gD9w0+IhbF8lpY7yGbiD06XTub6N8OjbH0n6szzsNjpFZiNZeAYgHWIL9sG5RQm8VQ
 sx5v1I3o8+PRtPjcRyoliSIbMrxSSGTtPvO4e6XZTICZC66upHKZvl3/XMrojquGMu4/
 C+os/Uj0mchTkwBBLdy0RJRLQ+S7G8122i3GN1o4so1n6rAKutsopzK9TwzZGkRW+8fA
 0Kgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oZsOPcAqbTVXMA0xIZPq890j8kiqsUk0YccP4wpcdyE=;
 fh=4rH7nVA5HZ+LTGzsWNO4v7V4CjczC0L/eAikDGMhasA=;
 b=Zk/5UbeTM6vxuYatgfUeJ2VLKC0H5HDnhlXtL1Zdq3nGkdrjYjX7pQ+n1Xd6cvLVtk
 RTz38iDt8xBh65TxntIIv5HLx3aco521Wg6h6ja5W4oNFS83gmHw587Ut5tOBmIzmNkQ
 Py34QEMQigO7YHrOMMlUveArKHFgpypkTQxY1AgHoTox/nA+MRUmdBTENevOdoYb/IJc
 KihOGelNHsn/nt5+yfZNYtAjKqZxVNHDpc9Q4Bj+Dpy0pwptLSpbgj5zJb7LIY/1N66L
 /gfPZxbzfJxE03odoZ3cP5zJxNEAYPwYZzE3QsJCuelzHkVHlTrec6MwDuj88zO+YSc0
 nLfQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780996211; x=1781601011; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oZsOPcAqbTVXMA0xIZPq890j8kiqsUk0YccP4wpcdyE=;
 b=nnugn7JAn62PLMSDX8k3KaE09TkSsGQBrW2vDcpxvzyGG1czNNG1OL3dVa1ftIHk4/
 9ryk7o6t2g0FrkPdONkyXnsCv8R3KtGI1B9CHp2cORUCL7vxsgi+s9YVaL2HhpPEqVtK
 OoHugVHxiYPlAp+CJLhMPSq4R+r6HwDWb14O/2XiIq1QzPOZIqHu+5Y7xxcfkKXpECqZ
 kkhv77J687EsGzt66Pl9SSbgTEiAFRteAX0hoj/28NSiE76tk2YBgoIKhbLuj/OGZzSr
 MJ2H6BGmv1H2nogPjwfq9n7JJa3R1/5bKM5Vzo7a5Tbf/YNU+2GATIa7WSjM+47Sz5pO
 JuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780996211; x=1781601011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZsOPcAqbTVXMA0xIZPq890j8kiqsUk0YccP4wpcdyE=;
 b=Qrwb13XNZWOCPpcrsLeVL+aX63LMlMqfEqXWtTMM1USFfHB/vFNDvI06O4Xirbdtsz
 KC4j2tT96pJaS7OqNjlDsczh4xB4lg5peBE68NH2Y+xTpN9oXSfBufZvC9qmLD9soNEX
 Wz2cKS+VZQZvSb3pYrDB0zLZi6g5GuPDAKMkjKqjqj4Ll9B2ZpziuJMdQ7fYFPuBBpCL
 r0M4z01MmG3e8A39DUMbwRucoT6sChnjwrzQID9HwGeFCcq+sZc/AXeCgo+l0yTQ3In7
 fKwqVgvCX8P0US+EvE99cJw7BIkllAymADsGAJ2J3TX1g/zC3q7EFZnF1pgczgrdCeQK
 51PA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uh57nhFrXodHDI7ogbBqAlXS0BhMlobt3KuRdLQjqYv3CDr+88xsW0CPwRHWlyHAJhjJGEbK+yg==@nongnu.org
X-Gm-Message-State: AOJu0YwAhK4GZZVv1/YmkVlqve0KhrUUafDbgYuAQL0M4v3+dKFUXPUP
 amkD1nMZjeD4YwLtxcLfxPa6ux4qtCgQesqzqnmOq2Y8DIxDE+AoqYRXGhzVzmoKZm1V4bAl+bI
 Mnranzv9sGAqQ+5n+8shanCSRfrip7dV8mRThIBIB70HclgJoIXP2
X-Gm-Gg: Acq92OG6xF/kprF5q7Tsaxo/Q7k61OrAAXjzOWysy53Mg08UcWq6McBbqjNQM+xBBvi
 vfyCycx9Qgl4s1Keo1Q8QQNJItkYfodjVqTYRutxH0DcaReIHI8V+z0UuCSCW4tITY4Tl2YTpIf
 ScmwDrFe4/T9L+NbSVbicRtRq67n/e9sFfvQbcSGsPc3D9iWsF83MGJToOwTeqpYvTRFd/qHaNT
 ZgB3Fxb10Lp5zVCTSfr5kbZQExEOMNiYfsAKT4lpFyC/4Ax7ctG0FoAB6g5rVKLT4dPWLzVutSr
 64e0DnwHYu3fnGdvcNn9ZZTOVlsXk/Xymn5AWkCNnAtwXr3e6kKJ7XL9h0kvQnIGAMigRc0GMdm
 ggA==
X-Received: by 2002:a05:690e:1248:b0:660:5dc3:3fe4 with SMTP id
 956f58d0204a3-66106e5b496mr16827497d50.28.1780996210788; Tue, 09 Jun 2026
 02:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-21-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:09:59 +0100
X-Gm-Features: AVVi8CdjKfyz_ovgExGYPmjBMmAUXKj7DWVsgY5QQ94OcbkRQBKOB_CAAGbxRg0
Message-ID: <CAFEAcA-P5SOyRzLeDGCiZTJEp0eEUAaxn8=_eGJNkGxPQ0yGBA@mail.gmail.com>
Subject: Re: [PATCH v9 20/45] target/arm: Implement FCVT, FCVTN (FP32 to FP8)
 for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

