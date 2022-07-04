Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3160941lft;
        Mon, 4 Jul 2022 04:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sB2mCowyPl3ZNm55T2jiwg3Pid+nHRS5Tj2veHaBk7Q5pE9AM6OeJ7jyE3xIlD2CM8Plta
X-Received: by 2002:a25:8191:0:b0:668:d7cc:aaee with SMTP id p17-20020a258191000000b00668d7ccaaeemr32294619ybk.430.1656935197549;
        Mon, 04 Jul 2022 04:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656935197; cv=none;
        d=google.com; s=arc-20160816;
        b=q3hWfvMjtosVK5/+lCJf62aRTCdmagjZQaGevDsQicBXMgVGyE/VHlwo/KgMb4c5cB
         6vkZiGmc6l6LKMunHPHI+mqToainTs5t6DgFdUNAwSTM7wwg3R9x47kGgphIFPUbFaP1
         NT5T/UcYCEL8/6mL62FnxxVTPx4ySuH96UfxTHxprwB7ztj02w197sr1BsAlCDfcn77m
         U+vCy6Sign3KnoRKULIhHSl989lbrqWiSwVpIlNAGROTsOTOrjQn2WMOXeO39+lJeJ6p
         QPWyR9tOiZOuLrDgO4/hKFxeeFVJB32sTbm+P1R0uYc6ZZmID8h/RZpELQcRPnIQQGgw
         JOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tMfic92cSy2HLh69YDuv0HrdXNx+q6QBthatWY3S4/8=;
        b=NIPfYi5Urh64NCBLb0+nAx+hzCDwD83Q2lMS7nt6pBK0XKkhUHE8xdSTiNVI88gUPe
         c3nyxhgOfKwmo2pzZicggvdMkjWISryiZxH2Uy8wyj7JksOnNTKmJW9vQH+LrIrnuX6Y
         hFa9yjEnPA+qobKYHHUi0w2nBUuSx3qL2gDz36vAwoRk9gVg5BCljuHH9HKtPTjWLYL+
         54cEd+CII6ZOErryCiM/NTKawwQgz0gmvZO2gdsZON1u4Jmji0MglXaW8bo7rzMToNvG
         6rL5ltRu3aEJT8xdzygHmO68U371GniaUWiIz00yTdjeqpPtd1hCZijv1vU1Qys8CCFf
         Du8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a6/Td5ke";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h64-20020a253a43000000b00669b51bf481si41395976yba.414.2022.07.04.04.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 04:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a6/Td5ke";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8KXE-00048N-Sm
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 07:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KWS-00046r-AD
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 07:45:54 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KWQ-0002DN-C1
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 07:45:47 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i7so16404303ybe.11
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMfic92cSy2HLh69YDuv0HrdXNx+q6QBthatWY3S4/8=;
 b=a6/Td5ked2/etP+MyMTOMX9qS18LkrV3w83nLnI+tRBwbVXxwPjisysMtMm6MeP7Qb
 BZ4/aOAw9RRJhCQf4IcCHH5OTeZ9Mdly8CznT1WWFf4RjAOfm0gLbZBn/cm3nxrXsCQA
 wEFe17H8nJQ4MfCnGlIbklos27FWPLjDV0mvkxzn0zhnKgy3oUUZS1cIeaTQZsOAE2cp
 SW+dQLw1/nWKetLaSdZW3tEGm39WshOXpFQdrgs6lZw+/XkALJPkZgabhVzmUGJFssky
 Jg/3ZvNg23EW4F104IAAK2SEJpmYZKQv58JejjZQAOAsvF2ZWIEC4UqegF4YAAJv9euV
 wLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMfic92cSy2HLh69YDuv0HrdXNx+q6QBthatWY3S4/8=;
 b=2C1s7zBhJSk4t1G3yc2mROKQf7jj/cwqQuaqYgKcy54UKjLfNXnIoFIJf1joInk+h2
 /MhYJnSOle6MvsrIcoMmba/8WCR4yNJJ7oOCi7nsTCViWfg5gPD4PjS+pn3YszPb0ot1
 yTzNXBATI63ZaZNVLdFxshn5wbx2xm2/9cw0uOGp9vKseZ6IgzFMywA/iuis8QwS5AdM
 lNJGuv4bDzRP9yr1uKoJiJf/C4oOsNY2WPoszlHD5pfNgw3011BJcArSguQhcxBTAkpi
 5JMjoOmoI9YnpaLylFE/+85cgYoIHXn2HjRi5zfv3dYYBtT9ZEH2EhGTTrfl9RAp7uyz
 dVpQ==
X-Gm-Message-State: AJIora+q2GOIXnB3NpRShokdtVNXcnFeIAD+wF1x86aE7AR8jKbOlvk/
 JLs2BCgHKqKFFFwa4dN8PA6AinKQctqMdTwYMEp1KQ==
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr29965569ybr.39.1656935144810; Mon, 04
 Jul 2022 04:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-34-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 12:45:33 +0100
Message-ID: <CAFEAcA-PeBbdXQAXJboNkPMkbGk+Sb_4VXNZKXiscp1n5d9c1w@mail.gmail.com>
Subject: Re: [PATCH v4 33/45] linux-user/aarch64: Clear tpidr2_el0 if
 CLONE_SETTLS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bkZyN1yNquyR

On Tue, 28 Jun 2022 at 05:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_cpu.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
> index 97a477bd3e..f90359faf2 100644
> --- a/linux-user/aarch64/target_cpu.h
> +++ b/linux-user/aarch64/target_cpu.h
> @@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
>
>  static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
>  {
> -    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
> +    /*
> +     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
>       * different from AArch32 Linux, which uses TPIDRRO.
>       */
>      env->cp15.tpidr_el[0] = newtls;
> +    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
> +    env->cp15.tpidr2_el0 = 0;
>  }
>
>  static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
