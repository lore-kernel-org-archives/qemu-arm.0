Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7CBCD37BE
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 15:06:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMSCw-00048Q-DS; Mon, 11 May 2026 11:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMSCu-00047C-7I
 for qemu-arm@nongnu.org; Mon, 11 May 2026 11:06:08 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMSCs-0008SH-PH
 for qemu-arm@nongnu.org; Mon, 11 May 2026 11:06:07 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-651b4d09141so4471585d50.1
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 08:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778511965; cv=none;
 d=google.com; s=arc-20240605;
 b=HheZhrOvstYwORsc4Yd0CwnHOYrKmAxRtoCfFmPAS5Z4nyxCpWAFN9ic5DVSPCnz01
 tr/HyXTtIAjrCVEYeJXPn7XPgLr/NBqwnAe7nezuySSaQmR72mxXK3x3slLGjU9sLAGw
 7zs3LFFPKJhPduf7T10oELF63gtJB/7CQMj8O9i7LoCMgYEQVu68/J0YfUqWj3vDdS5h
 mU+8EHAis9vANCWBJjHw2ZbZ+O4IXHgiSId8VwFipVm53LgUEw0FOSddpitubecKqzPe
 b7OjeE8/g5wZDQSfFQC7O9YWcGE614Vw5bk5R3bBOBcRnDlHaRPFVLEuuqKafXByG30K
 CKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uTuU+9FyNiyOJ9A+d6CfzbFA9DvI8QbQo7S071yxPgI=;
 fh=+oAiaMOlQ9JaM57E41fotpJuJhHQfLwL9twFgvKn08Y=;
 b=TCHavKmOvbTnl7f6bukcw/GCeaFmIrl9P2z8ma+xYrtN8qAKuX32lMsDttLXHtjxxU
 fUEfPl/1CoVJq+r7vxwrFtPXHVL9B43wivfAaA/NT8r9StSzZeHdVArQqMo6xmOl3B3B
 GtcUNcCtPftWMr1FwbUdn5Hb9md0v4RYxp7KFWvkYbxfaQFIYVs9E7cMxyOHB0FDvzyz
 cNLBiT9cf7+IHcswWf7uVvc9Z2tj2i8wNeSfVTAl0Pq8JrURtRtNDmNspl4S0s9trnDl
 ng1PtJ5s4cPP3rT2AdawF9rHDHDcqdzTH2CIOef3kWbXbzL0GlJ5J6eA2MpYLsZ4tlO+
 9CQQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778511965; x=1779116765; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uTuU+9FyNiyOJ9A+d6CfzbFA9DvI8QbQo7S071yxPgI=;
 b=VKZJ4PYtOCQhtwQIQ1f7a+Mesg2LGskjCqJujr3Uo/gHiUpYxDQlXM5yKrM13TE/cP
 q4Q9QVzPO89QgkI4ZpwJuVtapBoaJfxhqcxjFzlGVaZDPGHxkbuixs3Z9b2N7N1+0znY
 8i58MKAtDocUgLIDzgZEAsZIwrGbOdE8e3oL9p54g1WbGHsaP/jT3D0Dwpc3IKaJ012H
 ov/OakVZXcDQw6okpJ4lyKaqI+NjjCmTFWyhz7KpSsKLxdOOPV145s5h9LFqqZJXXYTH
 GL/LSpgTcKUKkg+vFJYOzcONH/ayoBJDqvUqtK4wu5h8vukyiVqv2eFrk0Yb7Q032Jrs
 O8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778511965; x=1779116765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTuU+9FyNiyOJ9A+d6CfzbFA9DvI8QbQo7S071yxPgI=;
 b=OHXnErzqBqyVUJFdzCSYSDmsmAoTw6JahZX78k7XAHq1eTJW9xbhZmdQsSm6PNegB0
 STtX0bxv5vWs3A6Z/ZkfgTx3lMxs5hV9sL4WsFEWsAxrmF8AI53uJke4EvPDMRCpSWNA
 db3/MPqpIf4WSwuHyZxcu8ZNqFWKqEpQdC3f2aVfTf7qRintuS374B40zsWxK4JVU7m9
 GeuQwdpH48yq2T4stGuV1K3tUEDLcWyBisssmOeSeTksCEy/7HkgySyKsHmdf9Rw8hjZ
 Iei8oAaGuHlCxcW/TwVNVpQKAiHG+BSLqrzbanB0v3oVuNWYinWMXfHDD2GLz1RlcM9k
 Rvyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9osBErDjjyQMp2dCmRRwD72mUXcKddodRaOGJitvFjrQm7t9+JahJ2Trg6e8saJxJytRwaHDV4yw==@nongnu.org
X-Gm-Message-State: AOJu0YzfOArldW+b9MGk3pD/b6YWaieSs7/e58MnHhr1+mGSd3Xyovv6
 RqwYL9YUYyIJG5SbBIGnl0O7CpS69ZxWl6G64NMpZJemE3Ifo5W9MC7DSoEhmgJSix7RaehOCyL
 Gjuu2ejIiL91x5+oBRdmJ34PMU86RqsWmZwdCB3vCqA==
X-Gm-Gg: Acq92OENw102ZDcCU6YnCiximAUmOiUh5niEFT2fp8XyjJzqZOkG7lExVJ0Z+6MEwcO
 MLLP42osD55skEdLeC8aMG5Nnn2Xh7h8o7IiFT4JQSPXxBjcbYAe4bYcV7fa0ndEAbKub37Xe6W
 WotvHszUpg2sZKenXg7JsHwp/pT01X6KRa8+YGC55ixmyIz9sBpG+OGoCDU6mTd1NJSh3DlkPGb
 LVeTGcYWRV2nD7YNtjpmtp9JqFbSCu7rq3WFVp2BnmhluIPNbqNoFM6gXCGaBH7ZrutGfXNixuO
 qInxpaLqxib2cS79k8Q3GeFiSydUOH7mQSPa81RyTHBv8boing55rLe+2odTvQTA5sA=
X-Received: by 2002:a05:690e:b8d:b0:65c:290a:d7ab with SMTP id
 956f58d0204a3-65d7e75bc01mr15098649d50.11.1778511951823; Mon, 11 May 2026
 08:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260511115918.32765-1-agarwal.vineet2006@gmail.com>
In-Reply-To: <20260511115918.32765-1-agarwal.vineet2006@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2026 16:05:40 +0100
X-Gm-Features: AVHnY4Ke91dV5vISBLDe6PVZ8kMDUUUhJaKTJCMwtNs5iNIeBaYB0pO7w9GX8GM
Message-ID: <CAFEAcA-05wGy4rkKE_01PE7SPqHv3Wk1VmUan0afBaYOhH2Osw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: fsl-imx8mm: Don't call qdev_get_machine in init
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 11 May 2026 at 12:59, Vineet Agarwal
<agarwal.vineet2006@gmail.com> wrote:
>
> Calling qdev_get_machine() from fsl_imx8mm_init() can trigger
> an assertion failure because the machine may not be created yet.
>
> Reproducer:
>
>   ./qemu-system-aarch64 -S -display none \
>       -M virt -device fsl-imx8mm,help
>
> This hits:
>
> ../hw/core/qdev.c:844: Object *qdev_get_machine(void):
> Assertion `dev' failed.
>
> Move the CPU initialization into realize(), where accessing the
> machine state is safe.
>
> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>

This is the same fix we put in for fsl-imx8mp under
commit b67d0bcdd. I've applied it to target-arm.next,
with a note added to the commit message about that
other commit.

thanks
-- PMM

