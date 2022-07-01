Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1222547lft;
        Fri, 1 Jul 2022 06:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tt8CsSWuIWlyecVV85d3/Q3eRtA7XLjW3+67tsPhyWRyEuGmbcfy/0Y3NX2PNMDoUQ2Jd3
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id i4-20020a05690200c400b0064b4677331bmr15114044ybs.93.1656680499706;
        Fri, 01 Jul 2022 06:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656680499; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+X3Hex4apaBEQ30XQVf3uBdfgmJdDoPro6gRL7HoiSnOOla87ZWJAMQQj1y9SnHgP
         BjPU4QYQxd/WZmCWc81M6fKecNjYSHxtv8GLjyQlZ0ZFrAqp4FbMXz2nsY4HD43FaLmf
         xlm1F4BOB2Uirdu/mtOR6bPhU9C+YNcsPhKS+uukghhQVYjut2vDizbqlB+RaXb7f95/
         XFEri7qf+GeaIf3SOLr6PVEbR1KSuVj8j0CVl9wMHfYf3Ht89Whtu2vjkK2TuJc3nY4c
         6gX7KAofY05wIiKP4Vm/8z1PamYScWQzjFilZpMNu9ezSrNBjurDFOI6pVrW/GKbIUtF
         3VVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7WEKrK3Ve94fVsMiu4QZqG4VcezjiZgfiDKVAFq/62U=;
        b=1IaB4xXUdirFOxK2Z/jR4yBzbu5+PmqfZ/t4I9F9Fn5TT16eBIbN//vehilj4zBJJi
         ZnLMNVqY4v5I8aavhkPgPsVgb5/apU9h0T9kcWQdFHCReXibvLnbWQ18+gwVukAUDc2j
         1ofnFDVB6G5MBHvSzaVqVUhItB3EQKufL3qKDS4SmWBrQyBWCkWGFxDfZV07HJ383XcK
         EODG8h207bCfOQVYui4pkIPpsYljxhEry4b97aGxFsmdGpMBqk6LI18lAG74GVPMO/M7
         dELnshvXDKEL7/DdsQgdd2+f7xT+o0nDMADRA3f7soCeTZqtZTaWIRIKouio07jCzC59
         L2Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEkpk1Ga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u188-20020a0debc5000000b00313305aa2dbsi36812890ywe.555.2022.07.01.06.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 06:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IEkpk1Ga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7GHD-0005ez-0Y
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 09:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GGx-0005cz-Ha
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 09:01:23 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GGu-00028w-LI
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 09:01:23 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3178acf2a92so22940557b3.6
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7WEKrK3Ve94fVsMiu4QZqG4VcezjiZgfiDKVAFq/62U=;
 b=IEkpk1Gac/6s1yzy5e5xQHVPZOnV7+c8YfwhBXkTM279V6RwbdXFudluSuiejA0txr
 mlo5DVNOQf8PaX3HD/dINQATYB6Vxx4aSA4Az5lWikUhQWhXYZdP1fMLtxejEVr9yeuq
 41reaK7S42rtg/bpQGPbji0u+UjbOztHBGCmjPYNgXyMIkQGzrSWeja6NSuCHYEVML8c
 Z/StL5tQjFMOi4aCbOno2VZ9bZFiALzUAfLR5MvWYvUgJIC9PcjAXNw4Z0sGNqYqn2CL
 js4uiGlERYMK4/ImBLtOu9iVSAgDDAgK5lyw2whfoTyXVtRCVSzCf6BNkP26OFDAIhCo
 1gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WEKrK3Ve94fVsMiu4QZqG4VcezjiZgfiDKVAFq/62U=;
 b=Z/a8T6hBGk8pPIWutUUoEjtkax7mGfZSC9g6Zb9SyzVN3+kVg+KE/BbD0grAdtar5M
 ekMNLNX90CD3uxS+/iFfckJq1OlP4A2XmYFTalQcPdsd/UnoWLYI1oM1YGXaqVhZqjW/
 A60UKnGDqza36018w02Nkxb2q5AhwABCwx+dwxzYgsFWGkhu0QDN6Lf6uRLfx8ApMroH
 Ai0DeLLfSKyHlbs9OVRm0BB4GH1WdzCJA9rPTECL8wEYClzsJzI/zgefllrKXnKH2Lki
 s8q2LDtzpjKFGdPs6uLRBhSgOpX6vfxQrcnhOUX/NWHl1L1Z4KFiReSiHRYpGDFM4s5a
 Y/sw==
X-Gm-Message-State: AJIora/V+1Cf2SZv/J5Vvh8/uPNTL7g5YMMlCEA613bEbjcYORKh+Z2b
 v8pJQBliowP0/i1YAdNpzorybpb0rTX0loWLPIjYpw==
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr17146411ywd.347.1656680478212; Fri, 01
 Jul 2022 06:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-15-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:00:39 +0100
Message-ID: <CAFEAcA931o2eATDzkU1cDFuRmHPfvhVgF+b8wq=f_ZCwDj5UTw@mail.gmail.com>
Subject: Re: [PATCH v4 14/45] target/arm: Mark LD1RO as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3GvLv/+l7zf

On Tue, 28 Jun 2022 at 05:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode | 3 ---
>  target/arm/translate-sve.c | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
> index 7a0b05cf2c..33bbd13bcb 100644
> --- a/target/arm/sme-fa64.decode
> +++ b/target/arm/sme-fa64.decode
> @@ -57,6 +57,3 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
>  #       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
>  #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
>  #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
> -
> -FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
> -FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 11874a8e77..e5e9e1e0ca 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -5062,6 +5062,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
>      if (a->rm == 31) {
>          return false;
>      }
> +    s->is_nonstreaming = true;
>      if (sve_access_check(s)) {
>          TCGv_i64 addr = new_tmp_a64(s);
>          tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
> @@ -5076,6 +5077,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
>      if (!dc_isar_feature(aa64_sve_f64mm, s)) {
>          return false;
>      }
> +    s->is_nonstreaming = true;
>      if (sve_access_check(s)) {
>          TCGv_i64 addr = new_tmp_a64(s);
>          tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);

The sve.decode lines for these two trans functions:
LD1RO_zprr      1010010 .. 01 ..... 000 ... ..... ..... \
                @rprr_load_msz nreg=0
LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
                @rpri_load_msz nreg=0

don't match up with the FAIL line.

The FAIL lines correspond to unallocated encodings in the decode
tables in the main Arm ARM so we can assume this is an error in the SME
supplement.

We should use the right encoding lines in the original commit of
sme-fa64.decode and mention that in its commit message. They should
I believe be:

 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load &
replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load &
replicate 32 bytes (scalar+imm)

(differences only in bits [22:21]).

For this patch,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
