Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1360764lft;
        Tue, 21 Jun 2022 10:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfrKIDtepDgjEAILq8+5rKrWAyiSKTuoFxWjjOcPngRKy0ArNRU3P86tmPEoCKYtFh8HRM
X-Received: by 2002:a05:620a:448c:b0:6a7:59e3:1a5e with SMTP id x12-20020a05620a448c00b006a759e31a5emr19581497qkp.638.1655832285776;
        Tue, 21 Jun 2022 10:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655832285; cv=none;
        d=google.com; s=arc-20160816;
        b=KNNdzD4XG/As3lQpi6hqZLE4ZIkhLHTw2dKUyg5/guT/24f6OqEK4kO7ZES0lUp7AV
         QsrOmAwoMO5nSNO/ElEpGkow5a1iobrCXh9ZLgAhwmVXqiXiHcFoWx8LXUnypCtrHbNk
         VyAiVRFVpn5e4CfQEjjj6eRF5Zh0ipkSSaBhMmE05AL5SJe3LJ1uKWgaeZJ7pkh6BYD/
         JtnKfDHfLkMPb9jBn8tclgTAGNVAZqd3eTGpYCtgBT9meAjo8ETPbaTXUFm1kPs+cWja
         9YqWNRRWrbUZIiU7AzthOJa1dlMdC4V/BNc81IeY4ea5ZLgdTWN0MOiDFHxGw1pmQZvr
         ctpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=x/dYsGrgRzHNBwe6t8AZYBArxopH0NdT/0/e+BsMAF8=;
        b=hBy3RTekjXhL9tSYaps+p9tHHrG8loF3vT6HT1qnqIvpHzHrCF9KMtbDsIyii92s8s
         vLeGCdApURlXsuj6qWDIHN8uCUtm7+TSdfvSXkSh5FWs/fbUFKMCBDbXiMD/S8kazadU
         w9P8y1l4oQCL4phiI7RddQgJU5u3F8u8dhcKGvYIlIGsNXTnrfXbcKHQH+yQ2e8OhnHc
         KhITBkeU3QXfTqXPTYQMSDpkLDVV/3ScSP1MyxT/fBqmumIgldkawO4AAAQsxoUgM1i9
         wVQEPxT8GSxBapZjpC4d31K2WkQuLVQQeO7n08VerELhmTbPqeOYbp+csOmxOpFO2uV3
         W63Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXSCwMYN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf13-20020a056214250d00b0047057cf7a0csi1146130qvb.193.2022.06.21.10.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jun 2022 10:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXSCwMYN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3hcL-0004Y5-96
	for alex.bennee@linaro.org; Tue, 21 Jun 2022 13:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hbJ-0004Wg-Jk
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 13:23:42 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hbH-0000bo-V1
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 13:23:41 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id r3so25644458ybr.6
 for <qemu-arm@nongnu.org>; Tue, 21 Jun 2022 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/dYsGrgRzHNBwe6t8AZYBArxopH0NdT/0/e+BsMAF8=;
 b=EXSCwMYNOH5EqISuu7CtQgRsb7hnYaocFGQZ+0uNs8tm70tMKbCADBE0/7Phob+vz9
 dcNwFFQgS86dAZM5FhiTmTUCwRJPosYcuQJ7cbnh4TFxhcRp1U/cPg5elv+gt/L6yqb+
 1LxnEwRlbUn+irkZjNCu3XZIdY3+LMPJWlFsvydj1QGrHP1WdoKVA8xX5xEOWtmNe4yN
 x8s1W6iv08rvhgBXK0PSntdtLJN8f166EZpRPYQDGqCh3BqC9e+2r124WipTroBd6Ew+
 G2HLZeJ5gK0wlM8evn3RwTdK29uv/7h63M8faj+sputD32JBF8ATHFi47F/+mBVAmSaW
 ngFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/dYsGrgRzHNBwe6t8AZYBArxopH0NdT/0/e+BsMAF8=;
 b=34vWr1tMC/7Eg2U0NHdhPCqiq92qWma0g2dGvM8mQnhmYKxLJL+j8tU1Tvv3RDqEpR
 vD8gnNgqQhgALdJKZhmgjUt4Bl9U5mrzzSc80/F/8o9GQKmO8VsR/9KPGq0xS0C7SmdR
 EQRjbFi4NNBHYD0SJN0TcVanhJr2viF7eIVo53CYBTEBhagXA4uSMFtCUtqfQnShsnA/
 9oOZUYtr1btT817C/knA0y0Kh4/nIrYLNzIRbMpfP0WFbUIsBzCYiF7DNtP5BHbr2c52
 nAdzV9cG4JxlslShhnSpc6ys7MaBJii8/a6e+o0lySLAjKMxxCXl2mwJ16T8BYEk5TeE
 YdvQ==
X-Gm-Message-State: AJIora9twphO+9a/ASyXj5MYm61/bpNL47+HJ3EOHzZ/O8M940q7Kt9Y
 bpMckeGFDkYC1p/Ovi1h9BIrFAdBylyRbv+ALhjULw==
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr31547619ybp.479.1655832218630; Tue, 21
 Jun 2022 10:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-24-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 18:23:01 +0100
Message-ID: <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
Subject: Re: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
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
X-TUID: 7OG6c8GzdadW

On Mon, 20 Jun 2022 at 19:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These SME instructions are nominally within the SVE decode space,
> so we add them to sve.decode and translate-sve.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  1 +
>  target/arm/sve.decode      |  5 ++++-
>  target/arm/translate-a64.c | 15 +++++++++++++++
>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 1 deletion(-)

> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 62b5f3040c..13bdd027a5 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -1286,6 +1286,19 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
>      return true;
>  }
>
> +static bool trans_ADDSVL(DisasContext *s, arg_ADDSVL *a)
> +{
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (sme_enabled_check(s)) {
> +        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> +        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> +        tcg_gen_addi_i64(rd, rn, a->imm * s->svl);
> +    }
> +    return true;
> +}
> +
>  static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
>  {
>      if (!dc_isar_feature(aa64_sve, s)) {
> @@ -1299,6 +1312,19 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
>      return true;
>  }
>
> +static bool trans_ADDSPL(DisasContext *s, arg_ADDSPL *a)
> +{
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (sme_enabled_check(s)) {
> +        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> +        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> +        tcg_gen_addi_i64(rd, rn, a->imm * (s->svl / 8));
> +    }
> +    return true;
> +}
> +
>  static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
>  {
>      if (!dc_isar_feature(aa64_sve, s)) {
> @@ -1311,6 +1337,18 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
>      return true;
>  }
>
> +static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
> +{
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (sme_enabled_check(s)) {
> +        TCGv_i64 reg = cpu_reg(s, a->rd);
> +        tcg_gen_movi_i64(reg, a->imm * s->svl);
> +    }
> +    return true;
> +}

I think we should define functions that parallel the SVE
vec_full_reg_size() and pred_full_reg_size() rather than directly
looking at s->svl, for consistency with how we did the SVE code.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
