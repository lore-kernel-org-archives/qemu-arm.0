Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E73EA8550
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 09:24:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vztJv-0001rE-43; Tue, 10 Mar 2026 05:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vztJt-0001qs-UG
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 05:24:05 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vztJr-0004nU-LF
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 05:24:05 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ad79df972so12225715d50.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 02:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773134642; cv=none;
 d=google.com; s=arc-20240605;
 b=EH9KMJBIaysv/zJVnkmaDOZUpAYT5wLVYkCNgTqoUI/9ntsbc6v7aATK5hFkqgAdtv
 N6h8Jo9BB0eAcKDckhLKvFcGk6C+trP70n18mIyDLrGKiy3+/hNSU/b6MtC22bn3fG3y
 DxFGTckDPnTxNxuMAX831ZJB0zgz3WnMF00j6ju8IkzHgPhDGMOBCZKYmtT2J0ZuiuAr
 FXmcKLq0AST10kjp270GamUBXHtj185kIxlzbZ5eKqw9HTwKMIXSKTfGZGHhOoPn2k3g
 uubfmfsh7SWZO6AljwQVnGsJJqT12I1MESuldlnI1MxBLBrIADZ0oJtJQruEXsIaMpJf
 wGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ePYl0PVMV0NyGzAzR4pZ0F8jALjktyZFJN+6lYjs76o=;
 fh=gh60yUo6NiUjmO0hWXXZkfDf1o7rXfxaYq7XQQErZEI=;
 b=KyisXtiFuZePvTj6nRGabLACGvFLkoQaAuO8RmvaYMUsWmmzxze92n9UceUKdBWjJH
 Iqy7gCoaJsthnDHf6S0EQ0jbDWauKX5TTHwqyQdxseviBF0XDQc3CZTJKx1IjzZX6eqS
 rr8R7J1WHUPnjZYkL2/hFEND+JCNiDYOTtHohW8bFUGpDp4DGfyo77yricwhH3WNfd2L
 vsNkhWw6zPdEMWObbHwTm62ykmvDwaazuU1RML0DoHi39pD+zIAuoBdxwaWJ4FLx48Ht
 Z4EJZtck0yzy7skEW0rvWK/qT21zOomD43kHyNRCL1QkoTRhexN4duJtVXvmgqwTfdoS
 O8EQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773134642; x=1773739442; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePYl0PVMV0NyGzAzR4pZ0F8jALjktyZFJN+6lYjs76o=;
 b=KQZhXvAj0iZ/EaAsLdD1GNh36AczwPqdC8N9R374COdJ8We92gHCpiPx3wQm++WFtj
 Os1q6pmLfAwRxgfL7q+akZxXNdcKZ5EC0A6oMGIGwLcje/oegCM9VGGlOG5eOguX/W7q
 fiBYHOS6CiTihHPuau7Mzcd9Eus5xH9l3fctmTAgDZPyHCk+pkqbr8tJ36YqvnQr5cSf
 IyBvvxxRY1K0C0GJX/+3DD54nLbyRbTaJZ2ZQ6Jg7rjlOY1+S/Jl8DYOPsTlj5W9rCGg
 WXeb9Kh1vLcJFU7s0MKx7K+UWVquo5XYL4yVTlL0EC38vo9CmtroUksPqRMc2vkFTUaz
 tZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773134642; x=1773739442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ePYl0PVMV0NyGzAzR4pZ0F8jALjktyZFJN+6lYjs76o=;
 b=Oiatl0h7awAqsltx7Qe5lk1jbJcUgDkj3hBRv1gkkhc4KuRnsTL5pjHyzsbHZ8ZFJD
 PVBkp5FWvw5hMvT6pzQ9JBIYKe8bVl1iEDJ+kmnkgZihNTEry2yv6JpU8COJmhPC9Q7N
 m3F47XclW0rSHYT8G6lEJ3okynNBCYbf3dJANy8jVginveiMjou/tD+Js0/0eyb3Q1gd
 uqx+5/mcbMh2Cyx0g1WOFbd35gxqPFlOhcxwTOjSggjrv41SAK4uy9XjUzNOM0BC2doO
 iYtdpKEskSdKj2HS9GAc8ES3DjfeweOwXbJEsobxUFNRnvit3AXU/NfFEzrdXcFuPXVa
 iK0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd48eiR9R/aG6+uw5BqUsW89oEUjswn4nse9UXQlBqH1Js/oKZo784vO9pp0zphUte/Gpn16mhsg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7Kt6ZdQb9P4lG6iIO0MYQRa3Cy8lElQ1M046Wk+IaWDsNu9ay
 lPN5mgvajMZRwqOFTSZUspcA2Q2MuabLSXXwf4XuN9thJBvqxGrDHgPUC9IP38w0BOKEaTyZMZ1
 uPKwdVh6udNh64PTTtjR+GZTfqgapusKbA9Ihi/Bu5g==
X-Gm-Gg: ATEYQzxK+BroQAFeqPgnbgAvWKIRK73wSqT3ArEc6SqLrbs7NZfaF+eSWoM/5Dysvrc
 yLGy8B+8ToEAkqI6Nfdyb4NZWddKosIpoE0POjRESdAug/sLtkKwHuwiexlZ+7esfhOpMIqg3+d
 XCbrWrAcD4Klr2FQSf6Xjkm5yyGwl79nM164Ym0t6s/7r4fKuiHd6hjs1tYURk4+B3o+M8f6HZX
 kEnosyiDwKgZs4qxqz7FPszPax9NWpz99LuZ1/1XVn2uZMGovJr2aFgAgw12aZCwL1eyOUyABgS
 uQaKrr6Mscy17pQF+iL3QY7svIJizx9sHMFFjih+JyQ3QpVpvulE0mH/wFXpeTFsrR0=
X-Received: by 2002:a05:690e:12c9:b0:649:c36a:a9bb with SMTP id
 956f58d0204a3-64d142c6c32mr13054838d50.61.1773134641897; Tue, 10 Mar 2026
 02:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260309214852.92545-1-lucaaamaral@gmail.com>
 <10F88EF8-950B-42AE-80A6-6B1E13BAD27D@unpredictable.fr>
In-Reply-To: <10F88EF8-950B-42AE-80A6-6B1E13BAD27D@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2026 09:23:50 +0000
X-Gm-Features: AaiRm52L9ai98MIgcrAa_q3ljjkdnRiXiqNAVZ8NYav1H8IGFST19uk1Yn28Zsw
Message-ID: <CAFEAcA-kie72iOi3KX-s4+rZmdNPYz5JbObY51x7CUzZVVEbHg@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: emulate ISV=0 data abort instructions
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Lucas Amaral <lucaaamaral@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 10 Mar 2026 at 01:29, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
>
>
>
> > On 9. Mar 2026, at 22:48, Lucas Amaral <lucaaamaral@gmail.com> wrote:
> >
> > On Apple Silicon, HVF exits with ISV=3D0 (no syndrome information)
> > for STP/LDP/STNP/LDNP, SIMD/FP load/stores, and DC cache
> > maintenance instructions that access MMIO regions.  The existing
> > code asserted ISV!=3D0, crashing the VM.
> >
> > Decode the faulting instruction from guest memory and emulate:
> > - Load/Store Pair (STP/LDP/STNP/LDNP) for GPR and SIMD registers
> > - Single Load/Store with writeback and SIMD/FP variants
> > - DC system instructions (NOP on MMIO regions)
> > - LDPSW (sign-extending load pair)
> >
> > For pair instructions, compute the effective virtual address from
> > the base register to handle page-straddling accesses correctly.
> > HPFAR_EL2 reports the faulting page, not the effective address,
> > so using the IPA directly would produce wrong results when an
> > STP straddles an HVF-mapped / MMIO boundary.
> >
> > Tested with virtio-gpu Venus blob resources on macOS ARM64.
> >
> > Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
> > =E2=80=94
> Hello,
>
> The idea is good, but this specific implementation is NAK for me.
>
> This ought to be in common code target/i386/emulate style instead of in s=
pecific HVF code.
>
> Oh, and using something that looks more like a regular decoder perhaps.

Yes, if we're going to do this rather than simply saying "fix your
guest to be more virtualization friendly" (which is the approach
we have so far taken with KVM) then we must:

 * be hypervisor agnostic -- KVM also could use this code,
   and I suspect whpx would like it
 * use a decodetree file to do the initial decode
   (you can probably borrow the patterns from the TCG
   decodetree files; don't try to actually share the files,
   that will be too complicated)

thanks
-- PMM

