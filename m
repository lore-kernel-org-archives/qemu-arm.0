Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A493CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 09:30:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4c6W-0004ZS-E8; Fri, 03 Oct 2025 05:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v4c6U-0004Z7-6v
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 05:29:30 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v4c6K-0002cl-Hn
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 05:29:28 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo79498166b.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1759483748; x=1760088548; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vy/tvwA0KhBlVA0wpXWM9Aqirz5rR3/wPq2Zlnq5zcY=;
 b=gPdb0kPzpfZ7jFilZlXoz9jJHDlhGudmDuNzoatz/cUwwCq3cd6R7nNu8XkEKInkkE
 MAHj2zDYO76jpN3IenIEgRdvikU6VIuvd+nsnCA7Yjyg6YLfxKmMnAn5kU7xN8diiUTN
 OuL9k8R9lrGoeVID211vTM/idEnZju+DooWqJjfotyj18v7s48VSNwK+96nOBEi61zMT
 4n3fcRZKJ34U/EGQwv6oQ5fS7VQ7J+vk+hizD5rPxRLNqyMTmNDhPWjKyAB4c/FP32ee
 koqb7bRr9A/efWvOteS81HBSTcw8/73D6qkTlSi+OpP4dwgP6E2e1zbIWrLn3RsjpPn4
 iIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759483748; x=1760088548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vy/tvwA0KhBlVA0wpXWM9Aqirz5rR3/wPq2Zlnq5zcY=;
 b=SjSavi9MyP+sm3jpRL6GoK6+dzF0t4utW+YjP+pohoAC8E6Py18EoYaNFUtpveNhfG
 YX2nMT+UTj9BLdLBx3+/cYL52vJCsHJTY+CpuRHPgFWuHR/YVVfbedvzzXvInnmj997w
 cdHtfq6+VPzd1zGGPQiLoFPD+fCuv98LRcoNjwXLz7/Vnekc/pJ1JD5uchEIZYiTigkN
 VgvFDyvnbxbABYqbpLZ8WIwRaR/aI8+7bhsshC4H1LiEXZSW30BgnHGqOSOIKzlawkkC
 Y10FqUh3f656IS6aOb4Bq6wI/JRSBevU+b1enqHPSuvVmdZvJDuDPJUBU2bCVKCCOnzb
 U32A==
X-Gm-Message-State: AOJu0YwaqEXCxA+ygdbgw/mM1b+JBCuSBisnSfgF36Pg3A9y8U3KrHL2
 G4P2qCGV9vqQ+YmKXiYheUfKFJMeiaaGopwqsOQT3frEQ2s/3sj7VCxVO+pinYawCzPPM25ZxWl
 chmlKGi/rLhYYrXlI78A4OtoJiEvruadQlzX4v7U9
X-Gm-Gg: ASbGncv7AGN6Yboosz1RabXSQjJSL9JJrPaZ0geKY+w3TEaQixojvtDQBP1h8Y8BJQB
 5LqHXtoWx5cr2xj/mVtwgqDbOyNhK4eCASmzkRaziOvmuzhnZ+Hh3cphHOAPTGtQ/p6l+ZdTSWh
 CJx1lDeMuM7vYwamNLaLeSgI3lMm1JLp7bLUKVBLqXg2n5Myb5zBpyxICLemertAAa3QQ4fUEUW
 8+l0HK/6rymSXoq9WGWCbrculuRPX0Jc/ZMC0t+0E0nxm7P3AZExcSekLtqam5P
X-Google-Smtp-Source: AGHT+IE079VKQEiHKEphnuoENyhXs7yaS3pF5UGMtptswuIGF8oeO1SFA0wXLsnNpP6NX1UD3/xHIE1qTfxe8PeXFtk=
X-Received: by 2002:a17:907:9449:b0:b48:44bc:44e7 with SMTP id
 a640c23a62f3a-b49c2d56beamr308375266b.48.1759483747718; Fri, 03 Oct 2025
 02:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251002101648.2455374-1-peter.maydell@linaro.org>
In-Reply-To: <20251002101648.2455374-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Fri, 3 Oct 2025 11:28:55 +0200
X-Gm-Features: AS18NWASPQh4vjBbQoCZ2MASxpZnRIGX_OSQGIJAClg-oBRXlPUQ92vUiVB6EXk
Message-ID: <CAJ307EhvkG4PB4wUJieeJRNzBzwdB=4y04CiiGo-=7Q-nz=KfA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] target/arm: Allow aarch64=off for TCG
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=chigot@adacore.com; helo=mail-ej1-x634.google.com
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

On Thu, Oct 2, 2025 at 12:16=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> This patchset relaxes our current constraint that we only permit
> -cpu foo,aarch64=3Doff on KVM CPUs, so that you can also use this
> to run a TCG CPU with aarch64 disabled. This is useful because
> currently if you want a 32-bit TCG CPU you're limited to either
> 'max' in qemu-system-arm or else the old v7-only CPUs like a15.
>
> I had a look at this last year, but never actually got the changes
> into a completed state before I moved onto other things. Cl=C3=A9ment
> asked about this the other day, so I figured I'd send out the
> patches I had.

Thanks for the patches.
I've been able to test a couple of our internal testsuites over ARM
Linux (based on Yocto images) using both `cortex-a53,aarch64=3Doff` and
`max,aarch64=3Doff` on the virt machine. Everything went right including
the migration features we are using (basically, "migrate" to file and
later -incoming from that file). Hence,

Tested-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

I'll let more relevant people do the review though.

Side note, IMO it would make sense to add another test under
function/arm/virt asserting this feature.

Thanks,
Cl=C3=A9ment

> The series is RFC because:
>  * I haven't tested it enough; in particular I don't think
>    I checked that the "clear the AArch64 ID register values"
>    patch doesn't break KVM aarch64=3Doff (including not breaking
>    migration). If it does we might have to make the "clear regs"
>    only be done for TCG, but that seems a bit hacky...
>  * I haven't checked that we forbid weird property combos like
>    '-cpu max,aarch64=3Doff,sve=3Don'
>
> But I did do the work of looking through the codebase at where
> we test ARM_FEATURE_AARCH64 to confirm that it really is the
> right thing to test and we weren't using it any places where we
> should instead have been checking ARM_FEATURE_V8 or something
> else instead.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   target/arm: Clear AArch64 ID regs from ARMISARegisters if AArch64
>     disabled
>   target/arm: Allow 'aarch64=3Doff' to be set for TCG CPUs
>
>  docs/system/arm/cpu-features.rst |  7 ++--
>  target/arm/cpu-features.h        |  5 +++
>  target/arm/cpu.h                 |  3 +-
>  target/arm/cpu.c                 | 61 +++++++++++++++++++++++++++++---
>  tests/qtest/arm-cpu-features.c   |  8 ++---
>  5 files changed, 70 insertions(+), 14 deletions(-)
>
> --
> 2.43.0
>

