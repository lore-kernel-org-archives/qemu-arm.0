Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAA9C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:24:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohnJ-0004oL-8r; Tue, 28 Jul 2026 09:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohnF-0004nO-NR
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:24:26 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohnE-0004e3-F6
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:24:25 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-667b0ced2d3so5143533d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785245063; cv=none;
 d=google.com; s=arc-20260327;
 b=efaI+kw5PyOVHH9xZm8LpjcmpG+zA1Cx8y2SeoTMDqIYrX82Hcvp2/Mgf4e3ePd9rJ
 Yg3DjklhTumJ7Gw5Sg+vpfkKz0rjf52ynZohcxH3NeT1fXYZp7QucbC3qSOB0rc0GAKa
 Ufb7XqGYyrF5aOkC+0dFwBlwcqoW3fXIONDN6t5vURPyG+PguwDxI/Ju367hQglA10oH
 76V+R92vEWaFwSlMhI82x2kyXVuCMTjNUYBoivMD8OkK53gPdJw+5DEQS9DGuP5P6+ae
 bKc50UrZ0VYwanxAOBj/UWzIWj2XZVxqCnI4l3YEAkroNKetg9vUSBUDGjnx/cuaiDMe
 AYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xvyndu7eTw/bUjKhq9s6smtSUffhS0AnwTzNAk8PaRg=;
 fh=WwGxyMibQEv0MNg+ZVvzM6ImlKYCnbZ/idkrx+lrGBg=;
 b=pxkV0hc3BEaIOr5947JgB232bWoLon2ZmPWCdO9R0xukWqmL9zSGeKvjoQoSzoQcDU
 rm90fSxlJZUkoD0Ig8mFPIzEpNCWlHP8oWgPTlmIDfVacJmroOj5o5htVuWT5ozSYW7y
 xn4qgb21dFFCaiLxWyJF9nV8iDqBskjbTlFHkrJRpGYEr0Ia1ks0GY7WjinV1COZIr5J
 twjsPHwERg9Hwrw0s2sc3nojB45O1wJDe79oZIAGhs2TsLmZ85Vf5IXxXv0f07+qiNGR
 w6scaEMeJb83RiJuyWMcaUjcTLWMSdjaleNZaM3EMd0Sluxz5mvNhg/3Q3JphasTs3sq
 Uqug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785245063; x=1785849863; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xvyndu7eTw/bUjKhq9s6smtSUffhS0AnwTzNAk8PaRg=;
 b=ZdfZwhcw1wKo6ETcUyxrV37hXD89XplEYssy47RlEQi5x6+Tr4JTHqJi0tV9bdCICi
 tqe7g+YoNYomwodQVlTgaR1BJKnkPfyWkO0U9v5DTWgpPzJWyaiai7aXraHqm+DXXcpf
 c5IOYrnioh5HBq8HJ8Jtum02zHkpgupPAIului5d4gYJiIJxRyK1cjsS6HbA2yHtDm2m
 GRhNjAJ7q7tP1BaguQWiws82dG4+Vl9zfs1b8btr6mF3SQinzOO3BJARHRKMaHwmSxmN
 snmughWSIQXFlod/hchPa9i6YEDF8/fNqrMFMF08QevvEmWTmUgG9q//AnWtXsqj1kdh
 aTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785245063; x=1785849863;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xvyndu7eTw/bUjKhq9s6smtSUffhS0AnwTzNAk8PaRg=;
 b=BPCjLMLxAs6+33oEg830VdYezHI9Kfv4BZmlqgcLD3FZixeMjlxM0LtbEI4JsZyp1M
 1dUoPeClckPuvj4GXoFNHfbgP1e5hVB99+Bk+++9li6D/Y9Q5Sm2WZOPHgaY7OjfjgK8
 IM94hUUqmLJPgYMUzkicVYxZx3dqeV9fD+v7cnRFQ7v8G3qI/fYXDhYEMDEqKMyEZnxo
 qD6ZcYUbHJkGSNL1TZAJ23gpfp+zfDqPhwEzdRzGXCY4n9mTxmgGH2ruUiChHZI/6CM4
 pErRKJYxm8s7trZB3PWGligV4eGVUR1ESQdc7wB3O4RHFzCtifT0v8jLMXumHC0iG1wL
 nAaQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpiwNB8rc9R/6Bww2EbSLFp88x42X+XGeDR7LeA+0QHTI3p9oHOrtul9uUhZOx2Hf1E8U60NfH58Q==@nongnu.org
X-Gm-Message-State: AOJu0YzZ+0hJrK90KMpmrm1Li1M3jiyOxcdKFvf1CZumfj8sG45Qgn9Z
 ymYEWf/ujGLdecwI+rZE63u9hcWo72lkMXYxMJZvVSwv+zlxmGJ8ZscitaXiOPlgPeacD1JnhLz
 rL1Icc8WJ5+J/SGERb5CJ86Q0pS/ciZU2SSH3epXKiYA8Kmif3XUO
X-Gm-Gg: AR+sD120s30Zx90kSU2UJTZnZwPeGj1HZJJbfeg91EL4yLZnIDVCeunclA9ieQ37lt4
 JpiM5L1++3Yy/3jbAf6kHbDhh42xAbNvNVRHfpGOhwIy0LekuQbVzF1QGuv03KHWA1s4ng/bs5G
 BHKg2FeX9reMXbW42DENQiQ4QLDl7/vholJV534qc2HNARH18Z4a50yasjQ87pXWX0ztEka+met
 hnhUQDNlf4gJ6zZWP93r4OTquwWcOO2iIOdtorRwA/ErlcrVR/XLt2ms0ssMfTMwYLfkxGuWAP/
 KRfxcrfWtxAUjjoDpzq07IBOUjmxRdtwz2Ysxr5ruS2EjxsUG9hc5xfplOz4/cc1UGizySBDMwk
 Vjx0jONoCVA/NuWl3CaU5NKS/I9vnuhaF79PCWAY=
X-Received: by 2002:a05:690e:1a53:b0:667:8b90:356b with SMTP id
 956f58d0204a3-669058544d8mr620580d50.93.1785245063242; Tue, 28 Jul 2026
 06:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-10-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:24:11 +0100
X-Gm-Features: AUfX_mxhiP5F9T4G9BdBkN9MbjdFGDkoFBSFVv8-gtMQp5LdrhpGBPPVtTDUGlw
Message-ID: <CAFEAcA9DgwOfiCj2hsb3QZNCimfrzrzs2cxmC3bx+yYBxKmWLQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] target/arm: Implement {S,SU,US,U}TMOPA (4-way)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme-defs.h |  5 +++++
>  target/arm/tcg/sme_helper.c      | 14 ++++++++++++++
>  target/arm/tcg/translate-sme.c   |  9 +++++++++
>  target/arm/tcg/sme.decode        |  5 +++++
>  4 files changed, 33 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

