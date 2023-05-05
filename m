Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp317208ejq;
        Fri, 5 May 2023 03:34:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ChZw72YGbh/lwl19X5cMrgWZ84PVKLnfgZeXJWLM8o0ivjq1zW7cWsiEkVApXCfd+SAu6
X-Received: by 2002:ac8:598e:0:b0:3ef:4da0:a1fc with SMTP id e14-20020ac8598e000000b003ef4da0a1fcmr1793303qte.50.1683282877658;
        Fri, 05 May 2023 03:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683282877; cv=none;
        d=google.com; s=arc-20160816;
        b=optvAlfxF88VQX30uTnDSuDPc4IHtBsiD6A2hlpGf5Jk2TZssUb9UnRRb25LNLx9w5
         ccNy2vI1fKAK8pseQHhY6OFdRIotS44FnJPSVc6IMdI+A7jYc/L9F+MfY2P1M+M2kj/+
         v13GE0bMJub2bI+1fr7u+azakj+kljZX3k6bQG/ugap/FNmZ0kJGhafA4lAJXDIJlnfX
         mfn1L7PSz7yOA1DEOywcODAE9pWHfbV8mRwgtZAGnKe/IzZYyGhyhtj57H3GWjaJNceu
         m9LUGziBp/EJIzjYKnUiHJ+PaF3YgvdR3alpWgztVTg7OXim/sc9C2UZwmKaL5q+M3UJ
         2+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HehyRZ2RNRo6V2X14vMDa6iRe3yLHGMx7sSxA2v9qUw=;
        b=v0/fs0Yy/ja29idR4hCr5iRQi6fpwv8Ep8T64um79gYqwEaqpzvKjQnXjD6r905m++
         5QRShttLlfVMAry7SRF5ecsJ192OF9n36R5qtUyytEDTa4E3Lqf2metyBRaTAa+11q86
         QLwRqzZawo2Rj4gmKxeAmGwde9CUYR9V2DlIF5w2gPcKzh3B+FFIMVXeluBV97pk3wEO
         I5s1B2U2Hq1KhAOq7uLjNBJ9uy6DgyCGlGeVGYnDgC+fJyuHGHV6Nx+rkEshgvWaLEP3
         HhL7+RBIalzOs3jvxn8jnteAzVWXdCGhLmFlQ1/iz+pDdJaiZna6OThZu5hmXH8i5GV6
         3GSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vX5he42e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020ae9f80c000000b0074d3662e30bsi563987qkh.188.2023.05.05.03.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 03:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vX5he42e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puslZ-0002LI-RA; Fri, 05 May 2023 06:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puslY-0002KO-LU
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:34:20 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puslS-0003pV-4n
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:34:20 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so3019971a12.3
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683282852; x=1685874852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HehyRZ2RNRo6V2X14vMDa6iRe3yLHGMx7sSxA2v9qUw=;
 b=vX5he42ewGq0C/Nm2kbS1CnWGPCx6BHWW3m3aEjBdPArrnbN0DMLio7hHruUtLDWng
 OghoFMSRPmM0XdYTU+BTVFBqWH6GNgdr1vl1jHwC5SAfCxGOqKM+DTRclutDrdIA7isd
 lwTgrZ3JIs+ZXp0n0aZmjQNlvqYSMeP8h8SD6alVFOBCZi9s2T7hA29hco1PYQcE9cS6
 bEeqv2EJIc8pqkb22h4EV473P8esGi4+f+hqbpzFHj9glElj6apvbT+vO0Mne1Tg83oQ
 4fcfVTX9FkgyJZlZRQxwI5aE2EA49AzeyWvVL4TzWq7cu6wdD1qw+gidBMgRg+rKlicu
 rwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683282852; x=1685874852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HehyRZ2RNRo6V2X14vMDa6iRe3yLHGMx7sSxA2v9qUw=;
 b=BG6jC1uXlg+G5YaEBbyT2XDdAHldK+m61ZMMVxB9B8zAy4dYYL9Nr312gRLiyK4z0o
 TesDom/NSQK9x7ADM+QPmag3DrP55xIp5ZM+01qDuctZTKtIvoskySLsTwASvjzrHDlt
 xCb3L7TUt3kr5bwwgK2d7+MV+EFFP0MoHwqHNu3gyz3B4GIIrs/w0PwhDn2QD7c63Ajs
 QGIebkfIB0uT5RDxZXT4IvWlCRmds6cdWWla5Jc5qGVL1AyNezzzOSFfkRhvFfse3E9G
 3c6nybUnvbJ4i1Kdk9pz5NsS4byN5T17PoaTJppsYwtsXDNFkWAYMP5sXis1BZ9gZXpR
 jrFw==
X-Gm-Message-State: AC+VfDyklUce9irXkC0SSY/YuVjAOzn0fdK4V+XUZ04JVKL3uwJeudZp
 giySiZFs6yeLMwe8KflgOFlstEFW9nRDVGYCanqh9w==
X-Received: by 2002:aa7:cf16:0:b0:50b:f654:8846 with SMTP id
 a22-20020aa7cf16000000b0050bf6548846mr858995edy.19.1683282852406; Fri, 05 May
 2023 03:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-15-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:34:01 +0100
Message-ID: <CAFEAcA_BMbNPYEoHacYk5ETJp6N9b8NKQvnZvfgrsDhH6yDOdw@mail.gmail.com>
Subject: Re: [PATCH v4 14/57] tcg/i386: Add have_atomic16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HCcbZfgNH5Po

On Wed, 3 May 2023 at 08:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
> The new variable will also be used in generated code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/cpuid.h      | 18 ++++++++++++++++++
>  tcg/i386/tcg-target.h     |  1 +
>  tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>
> diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
> index 1451e8ef2f..35325f1995 100644
> --- a/include/qemu/cpuid.h
> +++ b/include/qemu/cpuid.h
> @@ -71,6 +71,24 @@
>  #define bit_LZCNT       (1 << 5)
>  #endif
>
> +/*
> + * Signatures for different CPU implementations as returned from Leaf 0.
> + */
> +
> +#ifndef signature_INTEL_ecx
> +/* "Genu" "ineI" "ntel" */
> +#define signature_INTEL_ebx     0x756e6547
> +#define signature_INTEL_edx     0x49656e69
> +#define signature_INTEL_ecx     0x6c65746e
> +#endif
> +
> +#ifndef signature_AMD_ecx
> +/* "Auth" "enti" "cAMD" */
> +#define signature_AMD_ebx       0x68747541
> +#define signature_AMD_edx       0x69746e65
> +#define signature_AMD_ecx       0x444d4163
> +#endif

> @@ -4024,6 +4025,32 @@ static void tcg_target_init(TCGContext *s)
>                      have_avx512dq =3D (b7 & bit_AVX512DQ) !=3D 0;
>                      have_avx512vbmi2 =3D (c7 & bit_AVX512VBMI2) !=3D 0;
>                  }
> +
> +                /*
> +                 * The Intel SDM has added:
> +                 *   Processors that enumerate support for Intel=C2=AE A=
VX
> +                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit =
28])
> +                 *   guarantee that the 16-byte memory operations perfor=
med
> +                 *   by the following instructions will always be carrie=
d
> +                 *   out atomically:
> +                 *   - MOVAPD, MOVAPS, and MOVDQA.
> +                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with V=
EX.128.
> +                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when e=
ncoded
> +                 *     with EVEX.128 and k0 (masking disabled).
> +                 * Note that these instructions require the linear addre=
sses
> +                 * of their memory operands to be 16-byte aligned.
> +                 *
> +                 * AMD has provided an even stronger guarantee that proc=
essors
> +                 * with AVX provide 16-byte atomicity for all cachable,
> +                 * naturally aligned single loads and stores, e.g. MOVDQ=
U.
> +                 *
> +                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10=
4688
> +                 */
> +                if (have_avx1) {
> +                    __cpuid(0, a, b, c, d);
> +                    have_atomic16 =3D (c =3D=3D signature_INTEL_ecx ||
> +                                     c =3D=3D signature_AMD_ecx);
> +                }

If the signature is 3 words why are we only checking one here ?

thanks
-- PMM
