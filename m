Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF05606A339
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t3ITy+ZP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPLuZ-0004j9-Rg; Fri, 06 Nov 2026 10:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLuX-0004iC-Uo
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:31:25 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLuV-0007AS-Tr
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:31:25 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b305e10ac7so6152237b3.0
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 07:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793979082; cv=none;
 d=google.com; s=arc-20260327;
 b=EFyIPrIdEmXF2HfH5peszl/d79weivtBme5gwmgPyBoqHhttz6eqjKLfX8jlOXeY61
 Uq2TsTt0bkLE9S/fdxQ46FeVpoyQcvU8/TTl0EV0fBgNkhqPmN1rjoEooz8pKnh3iHnd
 a6qfKwyLDiPyBDXLHmKw2IU273Kwtvuo6eMzRJ0dGt/4Zwdxs4QKVRWv/1m4GIu3Zjg0
 0rtR27Er8SPmdMueO6mIjDESEbMG+EfvJgdlfD3DQM4+jgElBpUbRPLifPtKaBm+MlH4
 CWxNAE7mLjbeJB5KvZ0PRw4YXnYgy5tL7lKfgnKeo2Sk37GNfXK2JufIkL8g9ZUovcjD
 mXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nbMewXiO61ml5gFWEqWb2NSo5jAl7EVEeUa88Ab1Zoo=;
 fh=A36FGnyMS9Z+4Kwdlwfhh0ChKiiJ8mLqcfDNMNz3BX4=;
 b=B6L2JuF1hKG6FIAb+aT5cXMX5F4BEtdF9ZSSN/5fEgtN8mQ9l0aP3ZR8rpNqc4UpFg
 I8ARAMKVdxHVxltnbF2z5x+3kDWJ5TpoVByKQaZAAeFp+J427xOiPNq53F2Da9wRan3x
 R33OxKl/QgytEORRzrtEAJH7saurFctYiFgyc+ngwKCMwaUF/pRvqM1hP1xSVSxrJunB
 lCm+9MuDHNyhStc89AM/ryVeFCLHgo1lsoLorIBLb5rjCPmKInsK0lddiDfAD0Ovhfp6
 JZWWOhlYz+XpuVxvGaXYRgqeKPtQKeiYsZZVfa3noH1JVHyuQGK8/YIhJkHDiAHEaYJ9
 tqsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793979082; x=1794583882; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nbMewXiO61ml5gFWEqWb2NSo5jAl7EVEeUa88Ab1Zoo=;
 b=t3ITy+ZPxCReM5EZVRejQ7MPPW8ygjm4Z6eIeqzFfjlgypUJ1fTyW2okSpMNXhRwMp
 Q06lme7ygGeQ34yuJh8YyazG2biCyBDIyXxojtvnTkqWQ8p4URXsgBkwOqKyal+alXlM
 nWm2x0LP9TedSmWWIkcMm278HzLidLdPQ/dw4a1Ad/quOK5K/LedQ+cEFx3yPphgaAId
 K/ZkMWJlHlnYECoTWUs7mSMWIJv5kl+arRO7tkvLEQ+/FoI1uor+DzEY9q/XYL4EddZj
 SHOvGF8X6s0cvuCP8K9NSET+lpKgUUZmJz4yEmtGWlscov7UWte48vNIc1fEDV9wfroP
 0Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793979082; x=1794583882;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nbMewXiO61ml5gFWEqWb2NSo5jAl7EVEeUa88Ab1Zoo=;
 b=wYrbP//cBEgPV0nVjVrMWgHjHdKNr7Y8HFSQzIz9fnqKXqzT86U3i8FnteM/nQGx9t
 hEIxePct0CBQlHBrXGAv14j9oV6JuGujhDpHzxQck+9/W42QbbbrqGJBlTGq3pTpI96W
 tA6+agJPKS8KDp0Z7KKQjFHUvCGgs8bgME1eK02+yEFPc/T8niwzmqdZEJhKU/YHjqve
 OiDFCBQ96nSVY+xMmaG7bOr54dQbqbkYZ2yJRqzuGnLb81yD9t3u1o6gCdt/rvKPNgcg
 0mNL62SQTHUQBa0vMFtlcaJUxZQsXyc1/wPgxvgNCp+NCpdJj/TRn1P38GiBPqJrD60m
 lLcA==
X-Forwarded-Encrypted: i=1;
 AL+hErFmq72DRXr/3v+ZBGxOYjfxhch8WPNYuVuObTyi/OgGWlK8aEVH3zoCMQBCvTxo7lbfyxxFDpALUA==@nongnu.org
X-Gm-Message-State: APuU4Z+Zb5IsJpciGZkzatQn57T90N+2QgWfYr+3tc7xJHAw+KOGPpRf
 M0/dlxuRIZ/mnh82uovlCG/BSyeTBX7a3S0FSDIND3Tdl2cmJVA7YxDKfDC0u0mg7pPzRvuWO0D
 YOlf2qAxXkXquF84cXB9QmfEsKB24/H3vhoHzPghRqg==
X-Gm-Gg: AYBFou3pioMe0IqILIpK4dLUA9xW6j4fMhejaUSOzeZrSw4JtJmhl1+YTZtOwjeAkfJ
 CRj7Me4J6pt8c3ylBsBycS2RtzjTQ+pYovc1RAlnxbaKAS1oURz4CJuYZTHP0bdA5QAuLrOg/V3
 jOi9ow5NZA22efeCcmrBvuxOUp0TN+vkYxCCvEudjPjslGByJx8Pdinlf82gtWWRyLXb13f0bI2
 NseasFC3nnKaxsfCoP+6EMbM9vSK12q69IzFfPK3d//lolLNcbtXedSkGsrL7mOIH8y/Z7O9uc3
 OY76o68/TB1AWyG8xTZuiUyoYL2j8OS7sr7uqG9fvIvLgUAgEQ3Kygy2S6zZVEmHvGzn/rMvWrh
 3Q2YkEbdLHe4fpB4HgKNqamrxmlvqzFFzDTzcpyv78rOLcgfOFgapANT6PW/fnCeNGNnH2CDIWo
 B3hpsVz0DsPL8q9X/e5nyn
X-Received: by 2002:a05:690c:386:b0:8a8:6fac:1525 with SMTP id
 00721157ae682-8b341ac9315mr17573587b3.46.1793979082406; Fri, 06 Nov 2026
 07:31:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103145254.1543907-1-schober@cs.fau.de>
In-Reply-To: <20261103145254.1543907-1-schober@cs.fau.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 15:31:10 +0000
X-Gm-Features: AclHuK_PqW5yJQV_oGL2ZaCo-OYw1AiZLNTCGnuB22N_QxsgOtEK92_RQijFRqs
Message-ID: <CAFEAcA-wA_qKKXUaOBqqmb8M0QteUG3HcigC27pcupGbCmZzgA@mail.gmail.com>
Subject: Re: [PATCH] arm/cpu: fix GIC v3 flag for a64fx
To: Ferdinand Schober <schober@cs.fau.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 at 14:54, Ferdinand Schober <schober@cs.fau.de> wrote:
>
> The a64fx CPU model wrongfully set GIC bits in the
> processor feature register (ID_AA64PFR0).
>
> I traced this back to e31c70ac04001df5e540b79843834277e283fa71,
> where A64FX got added.
>
> This bit is supposed to get set conditionally in id_aa64pfr0_read,
> depending on whether or not a gicv3 is present, from what I can tell.
> Qemu picks gic-version=2 by default, while v3 gets advertised due to this flag.
> Recent EDK2 firmware accesses ICC_SRE_EL2 in this case and crashes.
>
> Clear the GIC field, as the other CPU models do.
>
> Cc: qemu-stable@nongnu.org
> Fixes: e31c70ac0400 ("target-arm: Add support for Fujitsu A64FX")
> Signed-off-by: Ferdinand Schober <schober@cs.fau.de>
> ---



Applied to target-arm.next, thanks.

-- PMM

