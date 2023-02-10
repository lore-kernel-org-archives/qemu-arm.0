Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1779210ejb;
        Fri, 10 Feb 2023 04:00:22 -0800 (PST)
X-Google-Smtp-Source: AK7set96nOJm0qHFjk4YV+fCQuvL4+5Xy4lOu9681r/Lz8MEixglLFVHWINf55fYNzCpRcaz1jLU
X-Received: by 2002:a05:6214:5013:b0:56b:ed80:6bec with SMTP id jo19-20020a056214501300b0056bed806becmr27944734qvb.20.1676030422513;
        Fri, 10 Feb 2023 04:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676030422; cv=none;
        d=google.com; s=arc-20160816;
        b=LrBC7g6455EFyRMGox8HWVYsmYCkLdrUeajqgyxlX2xH1tD8hO7ZRr1YMJG0SXBE8G
         akPMKmHuPLBJ4uhZhBf59MnpY4KLhlYRC1vUVv4vN9MVFYlOvTFm+S4DpGg7AHLLwS01
         S4UdkHzI2ommJIw5n3vU5l9gzvz8L08abkdCTMjQArDGqHNO3Qp0d11muhpvRCAQ9ayM
         902NxhV3VViRRekQAOdP5LCz9CjnLfndHf0AT5/tqjgfirHQaX6TSbGSPgWLkjuYeZWr
         D2cOJo4vRy7IsQhuUqUz3Ljkdx66tr4DKLjUhHSrIUuQT2kAbVlgSovJqGly6S2JUinE
         wYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DDZ67SLNNPRsaZN9bHK+bGZcgO93TL52PIhwm17RW2E=;
        b=MiM8ofZbSjgFZ+nkizLzN01VMRiKuQ/gyta9vBFCbbPpGoZJfl6hFgeDzyLONucL/q
         OWRXcfxNGq1M70KRv7l39cxaFNaSrmquYGH4gJxIIM3CqLM2/75PnlikL+m279zeWgd7
         p4srzR/u4VWXu2c2n9ZiIAjbtMGiDt31uS7vaUc89IUxV2USX0lTmcs7qvyRvVKVybbO
         CnYRB+Y3GRQmUEmjqNptD6T6AdltEhsneD24NisJKYIVF3mjSIzZiYEdj2PscFcfyZsO
         qiABEwCfG7UiVVZSmk4gyHlgpIZghtJkl8JnO4/+CLCisiqDemvuKNV4ThRtVkp2JZqD
         eLmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xisb4DHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n185-20020a37bdc2000000b006ff0a81ae8csi3732966qkf.65.2023.02.10.04.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 04:00:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xisb4DHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQS4K-0005Gp-5W; Fri, 10 Feb 2023 06:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQS4I-0005GV-9p
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 06:59:54 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQS4G-0003JI-6J
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 06:59:54 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so5280047pjb.5
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 03:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DDZ67SLNNPRsaZN9bHK+bGZcgO93TL52PIhwm17RW2E=;
 b=xisb4DHQ8zhCtHzS8smBAIbLfsMon7d/HU4BBpwyd6R/JRjNmzbViISsEeZsM7bhzc
 w2W9SrNFTiLZaYA3fmqyuf7O8FKn3UaK22J2gYYHVtkqCQ4XKR1LKAAQOOrSMLcfB4cj
 Sh+kCAyk71QDIenps73rvjjEq9WplK4tV8Nw0BrcosWcn2ovgIaKErh7zJGFtuJ2zKSz
 p8saOlNx+NrtvNM/pTp07hRQ35Z/EZEek4JLXUoAZrVHO3xs2PG9KTKD3s8lw0zgYN2p
 RrvyjzJpmWCAmME+a7oJlRz4OBcc+0iRTVtAgyaosgTCU+xHEAFTST9JZRCcbaJd92TN
 ddMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DDZ67SLNNPRsaZN9bHK+bGZcgO93TL52PIhwm17RW2E=;
 b=Wz0kVsOL7ZfcRI28P5QnaqT9R0usi5gsH35a+gl9qxH0rsl4IQj8SIiPmsOyZyTvjx
 jH91Zxl1LKHAaYhZVfkU9QntSPqHAT36uzGZrBw2zOSIWUTa6W7nGpppoACANTxun9j5
 hSPTOb4QnzR4RLDPvaoh9mP+abt5saMy6NIyK/bxpgiBlfacw9WQ2eAt2UYq+zyOcPHA
 ggVYzm4ITRxm2DbsP9LUxSnflZlJY5Jp8sD+0G48cg4/G3bRRrMHK7F/X43DtBYNdeya
 jxz2BPnDI+yyKrmOAPmv8FJpAee7irmEaHvowSHw2U++Jw/iPiHiUeKLBpANCRRXJp06
 8v/g==
X-Gm-Message-State: AO0yUKVvjTx4dKF3vm7Fjk8sGf4uGNmbU1+n0W4K5LrGnoO8DaWjmyfn
 7xRGXYvhPPSFl19DbkB7I/HPTJ/Gfm+7SQeY4pkVpg==
X-Received: by 2002:a17:90a:2c07:b0:233:48e0:95e1 with SMTP id
 m7-20020a17090a2c0700b0023348e095e1mr823313pjd.137.1676030389891; Fri, 10 Feb
 2023 03:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-15-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 11:59:38 +0000
Message-ID: <CAFEAcA8w4PHhEZ_Uepm62LFq56w46gmApmX13UdJj6TJmckQrg@mail.gmail.com>
Subject: Re: [PATCH 14/22] target/arm: Handle no-execute for Realm and Root
 regimes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UBYjVyY5Xqhu

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While Root and Realm may read and write data from other spaces,
> neither may execute from other pa spaces.
>
> This happens for Stage1 EL3, EL2, EL2&0, but stage2 EL1&0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 66 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 58 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 849f5e89ca..6b6f8195eb 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -909,7 +909,7 @@ do_fault:
>   * @xn:      XN (execute-never) bits
>   * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
>   */
> -static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
> +static int get_S2prot_noexecute(int s2ap)
>  {
>      int prot = 0;
>
> @@ -919,6 +919,12 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
>      if (s2ap & 2) {
>          prot |= PAGE_WRITE;
>      }
> +    return prot;
> +}
> +
> +static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
> +{
> +    int prot = get_S2prot_noexecute(s2ap);
>
>      if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
>          switch (xn) {
> @@ -956,12 +962,14 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
>   * @mmu_idx: MMU index indicating required translation regime
>   * @is_aa64: TRUE if AArch64
>   * @ap:      The 2-bit simple AP (AP[2:1])
> - * @ns:      NS (non-secure) bit
>   * @xn:      XN (execute-never) bit
>   * @pxn:     PXN (privileged execute-never) bit
> + * @in_pa:   The original input pa space
> + * @out_pa:  The output pa space, modified by NSTable, NS, and NSE
>   */
>  static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
> -                      int ap, int ns, int xn, int pxn)
> +                      int ap, int xn, int pxn,
> +                      ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
>  {
>      bool is_user = regime_is_user(env, mmu_idx);
>      int prot_rw, user_rw;
> @@ -982,8 +990,39 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
>          }
>      }
>
> -    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
> -        return prot_rw;

Ah, this looks like it fixes the bug introduced in patch 12;
I guess some of this needs rearranging between patches.

> +    if (in_pa != out_pa) {
> +        switch (in_pa) {
> +        case ARMSS_Root:
> +            /*
> +             * R_ZWRVD: permission fault for insn fetched from non-Root,
> +             * I_WWBFB: SIF has no effect in EL3.
> +             */
> +            return prot_rw;
> +        case ARMSS_Realm:
> +            /*
> +             * R_PKTDS: permission fault for insn fetched from non-Realm,
> +             * for Realm EL2 or EL2&0.  The corresponding fault for EL1&0
> +             * happens during any stage2 translation.
> +             */
> +            switch (mmu_idx) {
> +            case ARMMMUIdx_E2:
> +            case ARMMMUIdx_E20_0:
> +            case ARMMMUIdx_E20_2:
> +            case ARMMMUIdx_E20_2_PAN:
> +                return prot_rw;
> +            default:
> +                break;
> +            }
> +            break;
> +        case ARMSS_Secure:
> +            if (env->cp15.scr_el3 & SCR_SIF) {
> +                return prot_rw;
> +            }
> +            break;
> +        default:
> +            /* Input NonSecure must have output NonSecure. */
> +            g_assert_not_reached();
> +        }
>      }
>
>      /* TODO have_wxn should be replaced with
> @@ -1556,12 +1595,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          /*
>           * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
>           * The bit remains ignored for other security states.
> +         * R_YMCSL: Executing an insn fetched from non-Realm causes
> +         * a stage2 permission fault.
>           */
>          if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
>              out_space = ARMSS_NonSecure;
> +            result->f.prot = get_S2prot_noexecute(ap);
> +        } else {
> +            xn = extract64(attrs, 53, 2);
> +            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>          }
> -        xn = extract64(attrs, 53, 2);
> -        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
>          int ns = extract32(attrs, 5, 1);
>          switch (out_space) {
> @@ -1613,7 +1656,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          }
>          xn = extract64(attrs, 54, 1);
>          pxn = extract64(attrs, 53, 1);
> -        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
> +
> +        /*
> +         * Note that we modified ptw->in_space earlier for NSTable,
> +         * and result->f.attrs was initialized by get_phys_addr, so
> +         * that retains a copy of the original security space.
> +         */
> +        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
> +                                    result->f.attrs.space, out_space);
>      }
>
>      if (!(result->f.prot & (1 << access_type))) {
> --
> 2.34.1

thanks
-- PMM
