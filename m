Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4778921lfg;
        Tue, 29 Jun 2021 02:50:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+3FYWrY/9TZ5lFs1ceIclTiNq1XtNWSZr9ACrM0oWFYW0xX7QFHr3lJXKe7x2l2rBFI5P
X-Received: by 2002:a6b:f81a:: with SMTP id o26mr3223665ioh.56.1624960250811;
        Tue, 29 Jun 2021 02:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624960250; cv=none;
        d=google.com; s=arc-20160816;
        b=YBtd6sBZlQhhTjAtRYZGKs32sHq4YJntqAeuC+1djEpcnyZopAM052NP4X1mSCnd8j
         p8cOzjRH7FNc1KqKzUxEo2OYTkjBfJvRwKJGTI4kXyxB8cTllzO3GQRkZWIblrgOz6dl
         wHcdhfY9LE0xY6lefrjXFK8HwvhZm7zIxuPt9WGuH9IP/Iz8fQBS+MPw4dxPADznc7+n
         51lUITuxvj6IlAW+dXO8TefayfKU/Kjz84pu1bwWOd9WGFh4EE/SNXUCf/bu05qVMIFa
         2Px3X9nQLQXfdTpQPrtDSapl4Elk54E7GVSaxRIaesJ5R3Z5OX7myn22FxRVQ3GRi5fr
         QLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vorSwdVG0i0KPl2OP1yp5v2XNR2rdWWGV7ycT4N3POI=;
        b=qnreS2BoC/x9S0SzGfwCXs+ay/dl4TORECDNBHRX6ASIaLRFROeB8GqNRP9NGgHRd4
         OZiLp9GCjohcGJufTRCFLSulVZDS5eGBrd6ezZ2k9rQWJF7MTsWXTBKSMJrrHgKHac1V
         aEud904xZP0e1NHIePGjXTRgenL0RWE37j4ufw7TrewKUExRNG+qo9KQDUAxIpTQFN7x
         lKNf+OeN2KIEm1ajMDV51o8MkPLec4ZWpSBOQgjR2WogrbLWA2xS8OsOkyrWn2H2xRYO
         E18tX5twYVo/A/zkBsZDd+yq32QQF23M3hemQHBwPjPu1sHnQphRH4gcSIAU0Al7rXaE
         wYcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nWScd7wi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si19546676ioc.41.2021.06.29.02.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 02:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nWScd7wi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyAOI-0000J1-4f
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 05:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyAO8-0000I9-Lz
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 05:50:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyAO6-0001HY-0C
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 05:50:40 -0400
Received: by mail-ed1-x534.google.com with SMTP id h2so30489980edt.3
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vorSwdVG0i0KPl2OP1yp5v2XNR2rdWWGV7ycT4N3POI=;
 b=nWScd7wiFRo7DpLq01agugJ87wKaX5y63JENEypeowwi6tu4PQ3MAWJJRHvr8KZQVT
 hVKgRglXmpgULjGQuawX2kKKH6Bk/bQj3Edu6jN0+ONH1CHxchSV1xVWVTl5lzibLdyn
 JDQh5MLqtAvU3jBKsoN3EMqjijMs0HCUHvUZCTkR7wQqv7qQSojKgigof8y8Q64kHxsu
 wRFlTKUsQHxzEF4FDrhUg6NovKxJj4DzFfz7sasy9/nxqCrbzh4UJJj5uKBUkv2yGC3i
 MfiVV8/KSFvDjvVbJY0cHaneTEU6RFpk8RwRnWFaN/hcHk6m3HZGQoDKBXWNefMHk/1S
 TFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vorSwdVG0i0KPl2OP1yp5v2XNR2rdWWGV7ycT4N3POI=;
 b=ultLBPYs+Zr6AYo+rNPJnkyaRRgzUi2ky+AWg87gH/3Sz8LOY9azgmSCOiTrKm02LV
 L0EVQe6GzbKxRcIbYpMHkZ0d9m8HvIFYod6g7KuM21e/hGQQ1oriFfyIx/xKtXrPpu8c
 B6aJIM7ppRFhVe8lzooNoz9VY55P9IBhF63hlXWgXFLQix9SLEBnyfvZtQAS1rT3D7z7
 wXvjTdt+hHmjDzMIpgkNdyAYlWZvP0wG4UrvHPX3jYtGkhdBix75fvppkNDN8n0mwv8E
 g8bj/ZQUrPN3wbkoxy+0uUZkLw83BJKmDtSztcJ/y5frF+P8SfBOKzqX0dEvrKxsIN5l
 joDg==
X-Gm-Message-State: AOAM5307pMvMmms+Bp+GgF33Q7s75y6PoG5hR31nV6zfH1SBmTi8wW8R
 VdFSJQ4TCHJ3CMZIX4y78ax7e0jmnoR3C+9xIPrhYaOn7HvRkR9h
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr38906671edd.52.1624960236444; 
 Tue, 29 Jun 2021 02:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210629082713.31396-1-hnick@vmware.com>
In-Reply-To: <20210629082713.31396-1-hnick@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:49:59 +0100
Message-ID: <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: hnick@vmware.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ldbl3q5r2Oaa

On Tue, 29 Jun 2021 at 09:27, <hnick@vmware.com> wrote:
>
> Signed-off-by: Nick Hudson <hnick@vmware.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a66c1f0b9e..7267af7924 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>       * We don't implement the configurable EL0 access.
>       */
>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
>        .access = PL1_R, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },

This fixes the encoding for AArch64, but breaks it for AArch32,
where it is cp=14 opc1=0 crn=0 crm=1 opc2=0. Because this is one of
those system registers where the AArch64 and AArch32 encodings
don't match up, to fix the AArch64 encoding we need to replace
this ARM_CP_STATE_BOTH reginfo with separate reginfo for
ARM_CP_STATE_AA32 and ARM_CP_STATE_AA64, something like this:

    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
      .type = ARM_CP_ALIAS,
      .access = PL1_R, .accessfn = access_tda,
      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
      .type = ARM_CP_ALIAS,
      .access = PL1_R, .accessfn = access_tda,
      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdscr_el1), },

thanks
-- PMM
