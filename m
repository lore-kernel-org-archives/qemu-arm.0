Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0461FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:05:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHHto-0003q7-I9; Mon, 27 Apr 2026 05:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHHtg-0003p3-Kc
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:05:02 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHHte-0007PS-Es
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:04:56 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65318dafbcbso9654992d50.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777280691; cv=none;
 d=google.com; s=arc-20240605;
 b=QNDzBgrS/06zcCZ3fxKGCbgZJtXePT2Eo/tccYiYS9H0zHivUvtNQBquePiwkvqZWA
 CkAInoNw0DqMHeyxqg5H6V53TxmixeJQFmiU6EmvAKpN27FCc9S1/npxY1sqoF1T8kam
 gSCV7npL6UwfdhBeBWnBIAEIciqYfb6pvEUwdUVn+nOr78MHTfYiosh7JiugPWIuBrc6
 526wIURcHxh9leUWgXVb++Wv/ExAoiOHTa16NvmirpAPJabcSjH7COvzROwLMuUkzT86
 sExZso/XmtOkJqqVvAI5vmTRkWJk9T0XQFxRcxM8M8BY+WvDFb3F+lQ0WNWKvYhOXAqt
 FmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LpYw5xfAKYbUjRA2dLrJ+YsP9hBfmAiCQXc93R3jdiY=;
 fh=wasvv0eGVZBy3gZNxaXj31ITBGw/CpGxqjprmPadPm0=;
 b=Ye2xDBV1gNl0Se9Cyb31+CD4lf718YAMXJamTfT2JoYwNU2IyVwKoHpKXn9dzi/zYq
 76x+t3CJejb9XxfAmU39yD17e6nC2IlhVeDkjqYF4k92BJC52XCg0+OHgHP4XleB79Jb
 UjczjSAqJQaYcUbQs6FQej11LSk4EVPPdp2jpWjc3mRaAVv+4cIF/KavSkAEQjIgpeom
 ifPr/IsC93EbGiLuzl/wquuZsGYjEh5AmVTxf/kwXfB+V7omBsNhbUG+TvTACz77Vokq
 lbmGgLAzxBp5Nxe7u+UYNubGkFH0jzgyPZ0C+jJdRkkIeNbwgwuVe+42eFgZrsD8sXHy
 /7qw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777280691; x=1777885491; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LpYw5xfAKYbUjRA2dLrJ+YsP9hBfmAiCQXc93R3jdiY=;
 b=GKm1PBxQGfp0sJR9ISwJ5GeFBGDneDIK48DUBmMniNkVa+zRqSi4LJ7DkHeO2vG+EK
 +RAodchHR9fFjs3fzo6STaeTEYx9ZMaYdktIOBoPQuLeOyuc7PHJnI3a0bcqDYc4BIdq
 Z9XWm2ZXhw7Db+W23NW1ETU9yKCzh92UEaKNKWZYRIddOC2VrjjbCj05grmV35erEOkY
 YUIW+LWxfyj1H/PGXByCsK8apv1Vqewey9Mtw+xkt/0kp11iZwukuKjz17ZQ/UlrvAXf
 Ql1EYd4kSxkaBz5qiBfv9IwxEBZ8M+l4kP+SHYfxEa5BYjMIxdj9qo0UK1LJLyAXrgxx
 EAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777280691; x=1777885491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LpYw5xfAKYbUjRA2dLrJ+YsP9hBfmAiCQXc93R3jdiY=;
 b=QnbNDj+vuea7y7BwLPCCVU1m1Z+eHg1AWa4HCWimQLvg3Lzc56tRBN59F0iNZPtCoR
 jZ0XTaABs28ncnox+B6fr0Opv5oaPwC+wKbmuYopQoUxBv6ptfy0wzl1VgUDl5BA58qH
 zm3ELMMEPkbxJ9GFwoqWHud6IPGkfbz0WsozgwuKrSfZSDgj6sv1EaI3Xu488pgITe/R
 Gc33bznxovZWeZaxec6N9k120BtyUBefH/UxYWLrOcxlsTvLnRSSUKVw/lHNZCWexDLn
 3FQ/qMtD0/yCHhqPrbWw3Ca3ZfHjB0ybSiUs3SrqYedUMkWkcuHPjxRfI7050zDj7c11
 fjBg==
X-Gm-Message-State: AOJu0YyrOzQozZoOjm/MbNGemMrHBkp91WYOUon+tCy3zsSMaKvoXciE
 mRV/5W3oep42Ezf0K36zDnVd/amFA3l45LH62fiFUd0s/u++aDOM/pw0Q7P/JMRBIwShCxqLWpx
 rbEqWGwqBfmQw9FEJePNhYRu3hwH1PAFJ2Xoga0hjZQ==
X-Gm-Gg: AeBDiesk+0r9Mpb2kLfdmBDfsBZsmvgzPYTWrkGBOSKK7fQI2SQjhDzXLHQRjnPt/KX
 sfznaPwL6pp1nBqpSjTfyHk8ikidE+wCyb5mh0OFzcllxib4P7LtZaiGtTDR628VRkM++wwnfdR
 7L3i45qdDSytCiGMZNPnhjcNol6Uo9jjq+7SI3asqVfKpl4Gvr5mKbmez269LK61Y1KBENpzxVc
 vyRS/Mt7dvtnCXP6YXuX5Y04kKKIi7wwIQGztF5gUfzDaRvKE2t0ww4CaDrGVFoAXGGoSTawmzf
 HcJTD/aXtIdZq9s2UDDImqnVAG0ZrkiuOYDvonL3FxRUwCGccJLW75fzoR7yP0I49u+HQBhoqym
 EpoVGCH4BczYG
X-Received: by 2002:a53:d017:0:b0:656:7c25:8927 with SMTP id
 956f58d0204a3-6567c258f1emr8733456d50.11.1777280691143; Mon, 27 Apr 2026
 02:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260420064933.64765-1-thuth@redhat.com>
In-Reply-To: <20260420064933.64765-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:04:39 +0100
X-Gm-Features: AQROBzAzJ-_Tfus8JWz8Rfv-y3VIBYCwlAqJFBCYhS0rJbK6xCvWyUywjPwL14A
Message-ID: <CAFEAcA9nuHHRKjvv+o7k6Zyi2AUUea3=trrgLY-9Lwp2kjuagw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Remove hw_error() for the unimplemented
 CM_LMBUSCNT register
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Mon, 20 Apr 2026 at 07:49, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> When writing to this register, QEMU currently aborts:
>
>  $ echo "readl 0x10000018" | ./qemu-system-arm -audiodev none,id=snd0 \
>     -M integratorcp,accel=qtest,audiodev=snd0 -display none -qtest stdio
>  [I 0.000000] OPENED
>  [R +0.001907] readl 0x10000018
>  qemu: hardware error: integratorcm_read: CM_LMBUSCNT
>  [...]
>  Aborted                    (core dumped)
>
> This is bad, a guest should ideally never be able to kill QEMU like this.
>
> Now, according to the "Intergrator/CP User Guide" from:
>
>  https://developer.arm.com/documentation/dui0159/b/porting-integrator-ap-and-im-pd1/registers
>
>  "The Integrator/AP CM_LMBUSCNT has been removed."
>
> That means this register does not seem to be implemented on real CP boards
> at all, only for older AP boards. Thus it should be fine if we simply
> ignore this register in QEMU and handle it like all other unimplemented
> registers in the "default" handler of the case statement.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3407
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

