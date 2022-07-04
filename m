Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3235313lft;
        Mon, 4 Jul 2022 06:38:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQe9xyDe4i2tTUFwI/BOGRp2bPnhdozgadOJk5vWpHfv5Yii4hDKoL9eBZeLIw39an5y8N
X-Received: by 2002:a05:6902:243:b0:66c:8e4a:4bbb with SMTP id k3-20020a056902024300b0066c8e4a4bbbmr30574299ybs.22.1656941886228;
        Mon, 04 Jul 2022 06:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656941886; cv=none;
        d=google.com; s=arc-20160816;
        b=h8/3qo+NoZPRnr9nBQeRm6UKGUXAvD0LruKusGGaduEQEdNUBAfqVZHLMpmuJt9FBl
         1rVJTmkT1GLyCKB2sgKvk9OPs4v60OrhHaYATmsV46NjPTYhF4gxlNjcD/uDmHlSaj+K
         WVSYQtJq5564QmQLmDi+P9GKP/pkxEuudaWVubsJ6KfrCr+TScezNmU8z+NTzSZtey1P
         2MD1xesuQZZ8ab59soPVuDBWQZhFn2EoHGytWlRhqoAE7kszDQdDYL3NC3LNM+o9iosX
         mo4Lfba50FKOVIayQYYekJLyq8N9gltKs/+xq3RSXG7z4YHHfmgGvv3TCjFpyHsw9Yiy
         EpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2XGmlFLlU2LAAWVA/Nr8RG/Te0V+qJbDjFOPQ71wys8=;
        b=IbOHbgWcsEcs+jgCZofCKSjI/D0dNI45BiR8DjvQhVVF4Br9JezVJkHOBUz3+tMzFy
         ebQQWPrMleIx+1UIBJibmbUEw1EwM6Zv4Vxl7Yfx9KplFXQGToa3mQ//VxV2LWdMsYUY
         snWtEff8Rb5GtWdNeMxNtY4XAb5sZCIFXtYR5Cbq3Bxozop/7lHMtuUpi1ShdMCGvnfB
         tX6n5Jn1P1OBmfbezXKpWgTZekIWppK9S/GQ9zECY+nM1fkjs8uByISmcX3XgsSN6SO9
         3/nsG+RBP4X/XjdMMYzMmGMHEcEfCQHmNqFGSbsR/E3eHrCOW9WKBLtWHEqMwT7lU+6G
         iBzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jex8S+Pn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p85-20020a254258000000b0066e38695d18si6571158yba.341.2022.07.04.06.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jex8S+Pn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MH6-0006eZ-Kj
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LlT-0001vh-K5
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:05:23 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LlR-0000HW-HW
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:05:23 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c8340a6f7so40643527b3.4
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XGmlFLlU2LAAWVA/Nr8RG/Te0V+qJbDjFOPQ71wys8=;
 b=jex8S+PnarQ0VM9QY2NtuR/BZVPQ9Tw5WetOeMiqnSvF/yLQqD7fBrCfgIrL0VTrJ5
 bHrMWBr3oMhxmhhOTvayYB2it0od/TPOvfJrV/4YIp9L0RsXQfPFU4MQ4TqMnbzZut55
 G98zKO3n3iluP6x9fznV6lASWtgZhlDsU4dbh5PRwVvVU0GZJkV2FgfyI5/+ookH0F6U
 IjjhuBQmMiUY1SsoSZFG8eg0c+cNaFX3yBGYuy5jBFT4R9NqjFbfI6wTKpyKNLGiB52V
 0tjRV3kSfpblRIJmDzFS3J698pnuAWizHdeelK040thqOPEQ91l2TBl3VpO4x+YnuZC6
 XDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XGmlFLlU2LAAWVA/Nr8RG/Te0V+qJbDjFOPQ71wys8=;
 b=vLjLd2hruF63+cb3+bX5BwpMLxKgf6+LrtquaFAilRFA3rBt6918Mq9ilH5pN82vNd
 5bAKZ0XktsAo+Ibyna5AkVCHUciNfkSXc3lEos7KEWQZBjEoig7JiOyjtIOe/+E6RG4P
 gBwgOW+76OksRQSkAwOrQedF1KCs7VudULc2kEK3kfvrbXaaatHeRCBPDlOo+Ya4m11S
 01zxvxHM05NxFyOpLe9CM9TE49S2DCb1d464tStQrJTtt2BZ0MTY3vt6Wi2Cg7g1aBon
 Eru5eDqBFGOWIYlMFQuS9bCluhJaE5veKhnU2VbdKJmad68G93I+cR5gsTmB+LlitZiJ
 w6wA==
X-Gm-Message-State: AJIora/Kmfx4rQRUNAGrVAgCL4YgYFnxDdTPJZcIUX3Fx649hHcMqVsY
 l/9+LkqWjxw8rIGGgvv8v0zfLcdykqa59NcT1J0U3g==
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr11196923ywc.64.1656939920069; Mon, 04
 Jul 2022 06:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-41-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:05:09 +0100
Message-ID: <CAFEAcA_qFvXethRD6bF42SXY-n+0akZ_rhgNhj+EqmjwpwycuQ@mail.gmail.com>
Subject: Re: [PATCH v4 40/45] linux-user/aarch64: Implement SME signal handling
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: ugMAg11BpdKx

On Tue, 28 Jun 2022 at 05:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Set the SM bit in the SVE record on signal delivery, create the ZA record.
> Restore SM and ZA state according to the records present on return.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 162 +++++++++++++++++++++++++++++++++---
>  1 file changed, 151 insertions(+), 11 deletions(-)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 22d0b8b4ec..1ad125d3d9 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -104,6 +104,22 @@ struct target_sve_context {
>
>  #define TARGET_SVE_SIG_FLAG_SM  1
>
> +#define TARGET_ZA_MAGIC        0x54366345
> +
> +struct target_za_context {
> +    struct target_aarch64_ctx head;
> +    uint16_t vl;
> +    uint16_t reserved[3];
> +    /* The actual ZA data immediately follows. */
> +};
> +
> +#define TARGET_ZA_SIG_REGS_OFFSET \
> +    QEMU_ALIGN_UP(sizeof(struct target_za_context), TARGET_SVE_VQ_BYTES)
> +#define TARGET_ZA_SIG_ZAV_OFFSET(VQ, N) \
> +    (TARGET_ZA_SIG_REGS_OFFSET + (VQ) * TARGET_SVE_VQ_BYTES * (N))
> +#define TARGET_ZA_SIG_CONTEXT_SIZE(VQ) \
> +    TARGET_ZA_SIG_ZAV_OFFSET(VQ, VQ * TARGET_SVE_VQ_BYTES)
> +
>  struct target_rt_sigframe {
>      struct target_siginfo info;
>      struct target_ucontext uc;
> @@ -176,9 +192,9 @@ static void target_setup_end_record(struct target_aarch64_ctx *end)
>  }
>
>  static void target_setup_sve_record(struct target_sve_context *sve,
> -                                    CPUARMState *env, int vq, int size)
> +                                    CPUARMState *env, int size)
>  {
> -    int i, j;
> +    int i, j, vq = sme_vq(env);


Shouldn't this be sve_vq() ?

>
>      memset(sve, 0, sizeof(*sve));
>      __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
> @@ -207,6 +223,34 @@ static void target_setup_sve_record(struct target_sve_context *sve,
>      }
>  }
>
> +static void target_setup_za_record(struct target_za_context *za,
> +                                   CPUARMState *env, int size)
> +{
> +    int vq = sme_vq(env);
> +    int vl = vq * TARGET_SVE_VQ_BYTES;
> +    int i, j;
> +
> +    memset(za, 0, sizeof(*za));
> +    __put_user(TARGET_ZA_MAGIC, &za->head.magic);
> +    __put_user(size, &za->head.size);
> +    __put_user(vl, &za->vl);
> +
> +    if (size == TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
> +        return;
> +    }

I know we always set size in code we control, but it feels
a bit fragile to assume that if the size isn't the "for zero
data" case then it definitely has enough space to put all
the ZA data in it. Maybe we could assert() that the code
below isn't going to overrun size ?


> +
> +    /*
> +     * Note that ZA vectors are stored as a byte stream,
> +     * with each byte element at a subsequent address.
> +     */
> +    for (i = 0; i < vl; ++i) {
> +        uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
> +        for (j = 0; j < vq * 2; ++j) {
> +            __put_user_e(env->zarray[i].d[j], z + j, le);
> +        }
> +    }
> +}
> +
>  static void target_restore_general_frame(CPUARMState *env,
>                                           struct target_rt_sigframe *sf)
>  {
> @@ -252,16 +296,28 @@ static void target_restore_fpsimd_record(CPUARMState *env,
>
>  static bool target_restore_sve_record(CPUARMState *env,
>                                        struct target_sve_context *sve,
> -                                      int size)
> +                                      int size, int *svcr)
>  {
> -    int i, j, vl, vq;
> +    int i, j, vl, vq, flags;
> +    bool sm;
>
> +    /* ??? Kernel tests SVE && (!sm || SME); suggest (sm ? SME : SVE). */

This is fixed upstream (hasn't made it into Linus' git tree yet
but will at some point):
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=df07443f477a

so we might as well follow suit.

>      if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>          return false;
>      }
>
>      __get_user(vl, &sve->vl);
> -    vq = sve_vq(env);
> +    __get_user(flags, &sve->flags);
> +
> +    sm = flags & TARGET_SVE_SIG_FLAG_SM;
> +    if (sm) {
> +        if (!cpu_isar_feature(aa64_sme, env_archcpu(env))) {
> +            return false;
> +        }
> +        vq = sme_vq(env);
> +    } else {
> +        vq = sve_vq(env);
> +    }
>
>      /* Reject mismatched VL. */
>      if (vl != vq * TARGET_SVE_VQ_BYTES) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
