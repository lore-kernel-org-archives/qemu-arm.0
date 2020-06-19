Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp618962lfm;
        Fri, 19 Jun 2020 07:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1gjm0jRi00f+fHIPsh0lWx/1/pd3svFIMjPiJt0Ztvz/hgJTomz9pa21DsoF/oImBz/Ud
X-Received: by 2002:a25:c507:: with SMTP id v7mr6122267ybe.306.1592575427563;
        Fri, 19 Jun 2020 07:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592575427; cv=none;
        d=google.com; s=arc-20160816;
        b=StbsSDcAOkxow5AleR3n7xBV+oozXEe7NdXQWhWpzmGEWEMlMzLNZCNEpo7aGMyp0P
         b/DnAoThfVBNqb7lokx2RQvpYhIs2mUJc6WtQ27fWA5Tl5Ja4ndRoV26HmIoZaaEsIgr
         PZ318yBP84znOwT0qlgl9j/T/VlK4EdAZZsa2BiPo52763k70V1ryTP/wVPirowyQzCH
         X0xEORCVjtllPdMDqQBHONDBjs+l7vWcWlXkoAsgA3IbEWFU+volXw3xAVhew1lNZjhC
         YAmkLh6yytcswQwMjDXgtiZ4opxwfdXWSIK3Yd+SQ9ya2XZ4n4/UwtV+/ozM0kpTFdjz
         QKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f0sUEAo6S55R978ViORos1V95RvPg7zCaOE1NxZtGo8=;
        b=RyW2ne4jnUtum2CwF22f85yZWD84huUlzrOZP1nP7UqHOzivhXOEKWfqGjmpB3I4DH
         lNTLIt6nVb/q5Q0kYzQ28RNTetIdJdFxcu62y9a9CAJfnrp4Fh0jTteNV2taGj7Onk/j
         xUbmLQgigySNkc9iAfsCmI4hMPtNOF/7o/8WZsM0R1UOB4PxPDBY8Kod8FojtDfCiGxS
         1Y0KBqoIRRQEnY2OkWAs4olt8QzyfcCpzg2LgL324qYpLU+gZ72Y/REl+Qm5N9J3F4TU
         30RAVW/ZXQBV7WKghOI3qkg4PfYnj/SDIeUA1YBrwtxNO9A01W3tsoL/OM6fSefwsrEV
         EEgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C7cQKhuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w65si5329558ybg.452.2020.06.19.07.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C7cQKhuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHcQ-0002MW-Tg
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHbz-0001wC-RY
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:03:19 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:40131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHbx-0002oK-6g
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:03:19 -0400
Received: by mail-oo1-xc42.google.com with SMTP id v26so1911084oof.7
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f0sUEAo6S55R978ViORos1V95RvPg7zCaOE1NxZtGo8=;
 b=C7cQKhuOlm8Mghe9ME8BkY8DgO1wlC9ZCu5y463RM+V2zpT1oh5kc9GCflV2+r2jP5
 U5XNFDJIU/yhrpF4CII05ysH6Kz+5QzgT4dsxibcxEVTI4kgNp0r9pb9qwC+VUdzTUEs
 tafn948AlVKknb3DCOJhN3bKCMLHjU0ew/NmRqRzBd/2qNUV3tH8sKFYIZEVBvj3RBPT
 wWgRx7WZEIL+yhpodoSt35Rt8emA60yeJ2Kcm4tkj/bO0GC5AfUNLf2cv8KcH9B4UhZr
 H3gXQN32cEvlBbt7nHR3a/zSol2kN7eMRT9sscd/iwrnNp7ygmcopqe131Y+2ta9YRl2
 bz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f0sUEAo6S55R978ViORos1V95RvPg7zCaOE1NxZtGo8=;
 b=X++yNI4XTK7IcZpCVwv/23QHPZoQ07KugX4LSJVdB6Z1D8SASy63ldeP12tZPPZTb4
 4Y9OeMQ0t+y+X8NiPGYhkAlTipueT1gLRzqzuAlpthSR5u/q3/9StnFaUjKNyLWQw2Sl
 0BHw0J0Cc++2EF/NctDCze+E/n1Y1ffSaIX6eUEjfpC4tyvyFhBE903llxE7u6tu4bVs
 GaHdrRC6Uu5IpOgavg6DXH/PP6huOvNraDRwnhjnILxjUfcxFVGa0R1+Ss/qJsNmi62E
 /9UqoA7nn2dMtLmsUjMyL9QCEkrqXqyXvTs1340HQgKrujfqHhjD8EOgxhWts6grjjRN
 9k2g==
X-Gm-Message-State: AOAM532o1YH+sLS3SqkZgT2QPHnPy6lTegVKqlSAwrQxQtyvGyBL0epM
 UWmwYm0kT0vQDfPPwT+qPS3mR3ZCHGNwrD8aG5HToA==
X-Received: by 2002:a4a:9528:: with SMTP id m37mr3374456ooi.85.1592575395800; 
 Fri, 19 Jun 2020 07:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-31-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:03:04 +0100
Message-ID: <CAFEAcA8SgB6j3F6-HEZot_u13WAgu__W77vJq6FakGMGWzGLEw@mail.gmail.com>
Subject: Re: [PATCH v7 30/42] target/arm: Use mte_check1 for sve LD1R
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bbgq1JfxOtTd

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index e515646db2..4b3b879815 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -4830,16 +4830,16 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
>  /* Load and broadcast element.  */
>  static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
>  {
> -    if (!sve_access_check(s)) {
> -        return true;
> -    }
> -
>      unsigned vsz = vec_full_reg_size(s);
>      unsigned psz = pred_full_reg_size(s);
>      unsigned esz = dtype_esz[a->dtype];
>      unsigned msz = dtype_msz(a->dtype);
>      TCGLabel *over = gen_new_label();
> -    TCGv_i64 temp;
> +    TCGv_i64 temp, clean_addr;
> +
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }

This cleanup should really be its own patch.

We should probably not call gen_new_label() until after
the sve_access_check() ?

>
>      /* If the guarding predicate has no bits set, no load occurs.  */
>      if (psz <= 8) {
> @@ -4862,7 +4862,9 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
>      /* Load the data.  */
>      temp = tcg_temp_new_i64();
>      tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
> -    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
> +    clean_addr = gen_mte_check1(s, temp, false, true, msz);
> +
> +    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
>                          s->be_data | dtype_mop[a->dtype]);
>
>      /* Broadcast to *all* elements.  */
> --

This patch of the change looks good.

thanks
-- PMM
