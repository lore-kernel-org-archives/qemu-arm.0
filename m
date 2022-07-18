Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1260836lfp;
        Mon, 18 Jul 2022 05:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vasCsrAGLP8Vlrff0Wan9hnm9KCDYuO+ZZcIV/Ktib13d+kP9TG+itRF7v0NudpVkd+OcZ
X-Received: by 2002:a37:98c3:0:b0:6b5:f2a1:ab4b with SMTP id a186-20020a3798c3000000b006b5f2a1ab4bmr1048731qke.210.1658145766067;
        Mon, 18 Jul 2022 05:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658145766; cv=none;
        d=google.com; s=arc-20160816;
        b=fyWZrSFJNBI/3bVaYYJjMM/EcThEOmRqCTcHko3aHL56h0sxMB/ziKWSOs+dbK/06j
         V1cbk31dmTP1znwiMetZWvA5ldWYyHDIKGxCzccwVRxFimQXetjH2OUAchZ/lsqvV9eo
         pFTVSxpfop8lNIqXRrsyTC+8Y+psN/4XN8PP41rxZeZ145TPpll5sYQz2Lb2Vntu7cRN
         0lVzqQgr6v7/GbczSuMPMxBdxS65xhclnJl3KKUklCmA7SmnoBtNXuw/QMAg4QS3m+Sb
         I0QKjELiVLUx9hjazk83L76zHLYecdQVvX4Yo67e4DdGUeOwB+XeDMKLFLuhXCoZTabG
         SuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X+BmcDDXd/8gm8VkYyN+ipQkPc/1T3GGYMz8aERPj5k=;
        b=QwG60Zp1GJhfMz/gBxy7rQHQvAcOt32oPkO5wBd5eKnypxXSkcPduyC/ZCcdbD24D5
         1PnDS1RM3glhtVD3eCbxVls7EIHVp1anLRf+xWw6P8j3fOyBcdDEhOelwsbdBE+4KwDM
         DmT7p1lcrjFLtHtl/FGBCqzrgCHRxf3gVpMPENn3JsNHW4VvkbHe82JKh3xr430xbirF
         KgHdFPbfALqnZFRE1YMnUVlvYSfshyuYZ5G2VoCT+l+JXlfykpJliB5jtt+ych2moTq9
         HqCu0ojIDk6LjYOUHsNuo8ST0/3tBiX9pUSpg6Qqh+oZ41dKIdytXpqqtN5HxHHX5zpl
         N2UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fy3DEOMO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a37f903000000b006b58cdda5d0si5419122qkj.478.2022.07.18.05.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 05:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fy3DEOMO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPSX-00049U-IP
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 08:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPLA-0001hD-Ac
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:55:08 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPL7-0006CK-IS
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:55:06 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id l11so20249592ybu.13
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+BmcDDXd/8gm8VkYyN+ipQkPc/1T3GGYMz8aERPj5k=;
 b=Fy3DEOMOubiyjEoIy78gAZMICs8k8nDDA4e3aYMlUycJEjKTrkQzSBsHO7nN93JE4p
 TbqHWcKqUL5v9wVhHrF1lBdzpKtJNgvtMhF0nE+U7snDAlmtXBharRiEbjzcc9S938kf
 x04dsGZZz9fkC1rvA3V64ctPFWeFZnmapbpghQFCgeJuCOKO8pgvGMVVIsG/0xr+fbO4
 Gqgb61uCLGi9f0DzYvPG+BgaMrX3dcQFdLBIXaOiOYITvqKME3Qfi5ewr8rvE1fcrrqS
 pcb699k6VsVyhGElbxHTNtVFDY66m+ybzlsoK/7mYzRiGjNffbRlvoJk71iCrBQD4qfp
 5J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+BmcDDXd/8gm8VkYyN+ipQkPc/1T3GGYMz8aERPj5k=;
 b=7wloPh4b3EpQu9eUy/Q/+Xd5KNoD88+ZNJYvmm9EMTjeAZlEXgEQPq9jVMEHfPcPMJ
 kC6UHRuJqZhAVM6OkEwUos52KKK+8FpKWFRHGzhw9RCf1Qq+vLlLjz0K6Z+Vyf0Bx/iY
 51/l3XjzYydCy6QGYbrTtXEVcld93yrR7zuibprZ/XSZ/ds62SYh4l8EWrBVv42akxr7
 VhzuotH1kcHlsByPqvtgoc7ac6I6vAHLgvBxUv1zk/tGY1cwBwb0vkp1q+i8QoKJx75V
 DfHdlv+hFXAQF3D795qWcBMPxAF++Fk+tOcvCId6KPJgJs7LVhdzkibpqphxcO6NGgYs
 xb9w==
X-Gm-Message-State: AJIora9I8M95otMwqFXDZuNygUctGxFXjwMXusQhbpfwMelCljEeq0PQ
 X5A2dGxVcpMZk4s6vLtOkwXnm4KyKpW6x5GGDrHtdQ==
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr28953650ybv.193.1658145304361; Mon, 18
 Jul 2022 04:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-24-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:54:53 +0100
Message-ID: <CAFEAcA9oPWmq7pAABd_22BRf1E1SkOVGFTjcXVdYw0PiuwMveQ@mail.gmail.com>
Subject: Re: [RISU PATCH v4 23/29] Standardize reginfo_dump_mismatch printing
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
X-TUID: TRfsVdABGLqn

On Fri, 8 Jul 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist the "master vs apprentice" label to apprentice(), since
> we will want different labels for dumping.  Remove all of the
> "mismatch" text from reginfo_dump_mismatch -- just print "vs".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
> index 9899b36..e96dc48 100644
> --- a/risu_reginfo_ppc64.c
> +++ b/risu_reginfo_ppc64.c
> @@ -27,6 +27,15 @@
>  const struct option * const arch_long_opts;
>  const char * const arch_extra_help;
>
> +static const char * const greg_names[NGREG] = {
> +    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
> +    "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
> +   "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> +   "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
> +   [XER] = "xer",
> +   [CCR] = "ccr",
> +};
> +
>  void process_arch_opt(int opt, const char *arg)
>  {
>      abort();
> @@ -147,35 +156,21 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
>      return !ferror(f);
>  }
>
> -int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
> +void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
>  {
>      int i;
> -    for (i = 0; i < 32; i++) {
> -        if (i == 1 || i == 13) {
> -            continue;
> +
> +    for (i = 0; i < NGREG; i++) {
> +        if (greg_names[i] != NULL && m->gregs[i] != a->gregs[i]) {
> +            fprintf(f, "%6s: %016lx vs %016lx\n",
> +                    greg_names[i], m->gregs[i], a->gregs[i]);
>          }

This used to skip r1 and r13, and now it does not.

> -
> -        if (m->gregs[i] != a->gregs[i]) {
> -            fprintf(f, "Mismatch: Register r%d\n", i);
> -            fprintf(f, "master: [%lx] - apprentice: [%lx]\n",
> -                    m->gregs[i], a->gregs[i]);
> -        }
> -    }
> -
> -    if (m->gregs[XER] != a->gregs[XER]) {
> -        fprintf(f, "Mismatch: XER\n");
> -        fprintf(f, "m: [%lx] != a: [%lx]\n", m->gregs[XER], a->gregs[XER]);
> -    }
> -
> -    if (m->gregs[CCR] != a->gregs[CCR]) {
> -        fprintf(f, "Mismatch: Cond. Register\n");
> -        fprintf(f, "m: [%lx] != a: [%lx]\n", m->gregs[CCR], a->gregs[CCR]);
>      }
>
>      for (i = 0; i < 32; i++) {
>          if (m->fpregs[i] != a->fpregs[i]) {
> -            fprintf(f, "Mismatch: Register f%d\n", i);
> -            fprintf(f, "m: [%016lx] != a: [%016lx]\n",
> +            fprintf(f, "%*s%d: %016lx vs %016lx\n",
> +                    6 - (i < 10 ? 1 : 2), "f", i,
>                      m->fpregs[i], a->fpregs[i]);
>          }
>      }

thanks
-- PMM
