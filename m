Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F021CD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 10:23:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSXtR-0004As-MM; Thu, 28 May 2026 06:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSXtP-0004A9-Nw
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:23:11 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSXtO-00067Y-4y
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:23:11 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65dd9b25829so9989699d50.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 03:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779963789; cv=none;
 d=google.com; s=arc-20240605;
 b=eikZweiXLBWno9g6H2viTZRtSWRwjzY6wbNt24KbwNudZiCjqIx0+cTCVfjRcmpuGw
 4uAUNY9/ac3szK6YAOxSYqirOs8ou9W01Ef+KGoFY5SVayCehKy2r/JEmNpH5hVDMYET
 QLAoZZ3ozwnvGakLNsYxB0WtQuu3fN1J5U0BfbtnWSM/DchafT0qIs0ufqDWW9VLuviw
 3NiJnIdg+4PhNVNiaa26za6qfM+SCzyaxfOnL4Vo6zUGR3jAWcIaFgPncOyhETpe8E3z
 QDB+9OlMLkrNXvhVrl0BPEcVJ9NeP3raEsd7kYm+2NxNgrQiJGtfhDOq+N6owzVYSqnm
 erhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ih0tAGC2oD+ODfyMV7mnUd5xBZ1bDG8Oxezd/MEAjeM=;
 fh=vvlJL5482+iXfQddQAecQWAhD9V9NLZArLzHsjLn1B0=;
 b=Urhy6ACJXdqX6LpRDhdridWCeMZGzZF/bJJAUSnCJBk88fPzxWCVg60KTpIiDLKjC8
 SYFoddO6rPjdmp+HjcBUMrvf2i5xxHNFaNGOzpe5btCGQn0WFlPBwPGGWxco4loH/DrW
 qVO8M37errt6aRNI06JdLiCK5ySR7u+AVh3X2ZCgNyC0IEFET1bXtfeLHzDImqixAO/e
 iT1xoVZmjkM55LkKt0/Z90wELbHKhgh2iPSBJ/KIGRhcBGm0Mq3j+8yVXI/srlHhHckH
 GpSw2y+QeQnZToFTmbGZFLnvOw6A2pWAQXazJx9Pb8Wm1Wm7Gh5LKMTToErTIUUhBByD
 aLTw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779963789; x=1780568589; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ih0tAGC2oD+ODfyMV7mnUd5xBZ1bDG8Oxezd/MEAjeM=;
 b=nbAfmwllpdqt6R6FbbG5mlNf68PXMCe3hJHi+FL/a6MKcvZiyVd6SRxrXGsFDGONqN
 yIiSdBPAIXT8SuBgoHOBzhEUZxTWj4YCIez/YWHl5JegXTerhYiJFBUEv6WE10DeYobB
 Ve0fLIWTRfx0ydpF2QyUaMu2H5GCQHFb0rsZud7ro46vHZLE5t3j0ECJXmqk1AyRVS9m
 FqDoCqobh+IdUReANkocGc3Iu49z+WntxZH2DQ7wYKL+wtfkhWOr+cyv5dw8bBc5EL3d
 MJfYUHwM4D8ZFmWo0mfQ3HD9sXOqeG3LaMLFdZQIP9W3NKVJAtK5Pz7tUULZ1EO9JBEw
 6cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779963789; x=1780568589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ih0tAGC2oD+ODfyMV7mnUd5xBZ1bDG8Oxezd/MEAjeM=;
 b=hrP//eM8lFSWttZ5TsdpLzetNgsFnElOTZelfkNnw9Chiei/nGvzGo6XioKjvrVOtz
 E9ATJPh4uTm+OveuLjruPFp9GabxmDMa4Xw233IDbl54hhJLmXslgL7vkgLUUskhs+nb
 GhkfDQsMoqV7GQYL7aOwH+Tx/sNtIv5ART0cuWFCJYRWJbKUl3jjfYLy4tJxbowwCmBM
 jxkkW3h9DU3HiGAcMHe0WLegSPHToN2njL+Y9aw9N/Abh2ySRHauECDMAZHjXuKRl9V8
 xG3GQ7XNjNE0Ld7rA2u/61VVMiN6S8AJ1kHFyGPFKifuKqvbfr021skFpDVZYCAYcwWZ
 9zHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ZYqvKuW1DDx4/kIS7oukA5KpgBAntJyi8Nmjv/EGYZOhnz+9DtX1WH2Cet4OTr9xh7gKytI5GkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy4FMVsFOOQ/Y7FDVEJswgQDID0r10sb5h0sA3crGBBSlYXt9br
 /aFaMLHAW3jjmtTwBwesnrx7UeI5sAc0l+UGstCcYmSmivOkm4+0VlYXGjIvS0riHn1UozLXsiV
 TsYxSoSI+Dkk25ogCMsC7d1zyjocLIBF4abOUys9IHQ==
X-Gm-Gg: Acq92OH5DgOTd7OMvnoXI9YQFO+RZQVMWH+eFKJfHIlcpjS2DEsoHAV9fgot8Y1uykc
 OJfTHJ0CM/eF7Lj5EUQ8Io1ajoqIjJvHqiQQDBwKGrdsGYp3iRnokSxzoHosYgrpbkMaFWQev/5
 TcFJCqYmjdm4vBhiOCXEXisFMK19ULT6MpAbcfLpmj4bTzjJZgSnf1LI0QhwZ55eqmn+T3bZFpY
 M4L+eV00CTjf8iSLfJSMwBvGtwrCPF1qUtuk2yfusJCNX5ddr0ir+5QLT71lhU7JwfelVfLNu5z
 VIaTJWavHksLOiTA3KmKh6+pQDnAy38E0NHQZ4b/POwUwAIjp+vw6y/1noE07N3LKyHrqZdKI47
 gycqH8BwsaqJJ
X-Received: by 2002:a53:ac83:0:b0:65d:6f10:d42a with SMTP id
 956f58d0204a3-65ec98a9bbamr25888606d50.39.1779963788854; Thu, 28 May 2026
 03:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
 <20260518-pr-pacbti-v1-1-8932a885b03d@foss.st.com>
In-Reply-To: <20260518-pr-pacbti-v1-1-8932a885b03d@foss.st.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 11:22:57 +0100
X-Gm-Features: AVHnY4LaMlxtA_Q4sNPBjupH8IL1E5jUJirlGtiw_jqw0bNDL6TKUDmhL6jJDXs
Message-ID: <CAFEAcA_LcEO1J8gC5kpAVeiQ-pNEr2oNsdmx_NeEZhLgbstjNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm/tcg: define cortex-m85 cpu
To: =?UTF-8?Q?Torbj=C3=B6rn_SVENSSON?= <torbjorn.svensson@foss.st.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Mon, 18 May 2026 at 17:16, Torbj=C3=B6rn SVENSSON
<torbjorn.svensson@foss.st.com> wrote:
>
> Signed-off-by: Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com>
> ---
>  target/arm/tcg/cpu-v7m.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

This patch should go last in the series -- first add
all the new features the CPU needs, and only then add
the new CPU, so there isn't a window where the user can
select the new CPU type but it isn't completely implemented yet.

> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> index dc249ce1f1..5cfda232cd 100644
> --- a/target/arm/tcg/cpu-v7m.c
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -237,6 +237,44 @@ static void cortex_m55_initfn(Object *obj)
>      cpu->ctr =3D 0x8303c003;
>  }
>
> +static void cortex_m85_initfn(Object *obj)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(obj);
> +    ARMISARegisters *isar =3D &cpu->isar;
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
> +    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
> +    cpu->midr =3D 0x411fd230; /* r1p0 */

The most recent release is r1p1, so we might as well model that:
0x411fd231.

thanks
-- PMM

