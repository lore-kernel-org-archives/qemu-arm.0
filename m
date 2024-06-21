Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp209198njc;
        Fri, 21 Jun 2024 08:47:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYnm450FeKXXV+jLc21GztLzB+ccDvEmvMgHnZPsgmw19MZQY+mOtDsg5KXUP8/07cuAHgdmLBdlZYPMQTA9g/5f6XkKS5
X-Google-Smtp-Source: AGHT+IH43tm+Uhsj40YJ9XLlR3e/WooN2ZRAf4AotSNl3yXekvant5FmZbOZsKqLvwvmXeTZCrMc
X-Received: by 2002:a05:6870:d38c:b0:23c:bc3a:6ccb with SMTP id 586e51a60fabf-25c9498fcb8mr9598803fac.19.1718984847395;
        Fri, 21 Jun 2024 08:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718984847; cv=none;
        d=google.com; s=arc-20160816;
        b=GlTlgW/lh9TnVcbUYkx6x0r/Gv2jLlH5LHVl1bSOxEL4S4MbjXpkDKrF4WNlSiit9+
         /ldFV/hynjUHO8VTPm7zUK2nF/rukuJsicHzrHNgkxzR27WN2hrU5yKBH03SoF+d1BVq
         GnTl46/tomiJQ8ISWuGbeo7Wi3gDMjdZuKYUnD3/EHl5RBESlEbeP6Z6UoA/rbj33m4e
         CGQ8Wq0F4ir/CI+vQAmvKh6woFvDmM2RbpJ2j6dPFjipxSHElzGmtLtL+AXYDIc/wNXo
         ZNvsxCIiKMKtg6YLWTO4Se3ogOkjDue1aGHiFwgM5XM2eG0fsaa01bOGBxiZcnWGYV2Q
         e8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0foJIqq89kkb1sR2lxAA/3c9445w60E9nij82OhyHSs=;
        fh=sPNB+wMByEmOmv0NA5LZ0sZcEjWhHctCq8XojzuPPiI=;
        b=a2xx5m4fu97t5OT5Fw72h1/U4ZpBJPokQaYt2pB9HYuat5YOdMOj6fVaD2DNJtS/t6
         7oDZ+X4PWvY2PfrgWZ8RqkOfMSfqgvrXYQiC6jAjVbCPFlHTk5C0jfSNpotQecEJ9X4k
         dJuKmABchaeo1QRwwF62g4rW5Xuvwv1hQQRDQi1M2JtnIaUn0y5IGloA4GyoSirvFU38
         PzB3IFCe+upoR11AN4d6fYLlDmR2yGx3RHBkdEDRWVBg6B/cTvNVptMd071cBL+OQuMU
         9iNVcGb8pqWI/Mfk5nmxuYI0LYhWrjifEjEvqmr0CLDBcJYbtnp7TUOzGr5v3eeSwFA0
         DSzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PqRr0RaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce882a5bsi214620685a.56.2024.06.21.08.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 08:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PqRr0RaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKgTg-00049m-7B; Fri, 21 Jun 2024 11:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKgTd-00049T-H1
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:47:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKgTc-0004lf-0F
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:47:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57d046f4afdso1161277a12.1
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718984817; x=1719589617; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0foJIqq89kkb1sR2lxAA/3c9445w60E9nij82OhyHSs=;
 b=PqRr0RaBV5QhP/SoeYzfyIB0sGeFZoZmBxI9Oxr/WR1bRiS5FFScJvZst8qZ5shRUC
 pYgbUOgTo2PiJrFFMa2IY/KZgye0+yYGK946hY52O3rVFsoNCqta+fdxi0ujBydHQSlQ
 EpZgo9lzruScpOOMpBR7vEsm4dAXxrrDQoFkQAyGTcnt9qnn5y2nTPDKakWVXrHRrBkM
 UEM5oR23f3Y10DVFg7AFX45QbsVWo0VTGQsYhXiArq274CJ2VOghepNxkxYC6G8bSHhH
 OekkMhaI/oE5xBnscC7MNkJnm4LCi+rUDV7ylSHD00bHVFhMiVHVOAnk0kwVoYYXHOZ2
 OL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984817; x=1719589617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0foJIqq89kkb1sR2lxAA/3c9445w60E9nij82OhyHSs=;
 b=iyel6T22Zj3uqWKWxdhjQ0BjyKHly6afmaNJ1xl5ABGo0SdySIfCtSp/N80+FSiusi
 4ONL8Pbq/uZ2cr8zakVOJwjRa0ubkXUYDYB+fezqrkdNkTgwYUS6IoWe5NyZ7nmuGt72
 KTfawi0o8hNHq3855cARcHFYv+Pjx77RP8dSUsK0RthlzBW8W2yrBZjVMoHGKrohrT86
 pFtL7QW5IPfgJ+j5pA8R1jvWkAZLDiTLOD1qjW23qSzksRcpm2EWUu3jkbanNr+iBu6I
 9/hfiYWe9wK3pzgNd8gMAbwOIiCSa7o9nIpvybMhT+JWaeXwsDIqBJtJ2xGN1O4syZzC
 XJKQ==
X-Gm-Message-State: AOJu0Yx8VeWFip6TN9zK/WlZseT8Xl6X/A+24167KkDBXM640svmFezN
 CjfDMJvHwa90Gyx6+4ZbZdokvbdQHlObNTtr0iyZEHjjiIao1WfLF5tN8qMy1J2l0yN5iNiYzCh
 HjXzStnXdJeN8XVHeSJMPpALc/e6AXPnbOrD738iRMitvBL4N
X-Received: by 2002:a50:d717:0:b0:57c:b810:1062 with SMTP id
 4fb4d7f45d1cf-57d07e421admr6442306a12.13.1718984817287; Fri, 21 Jun 2024
 08:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240614093026.328271-1-sai.pavan.boddu@amd.com>
 <20240614093026.328271-4-sai.pavan.boddu@amd.com>
In-Reply-To: <20240614093026.328271-4-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 16:46:46 +0100
Message-ID: <CAFEAcA-t7G0Y7GazmPV=hThRZT+w8cveNCU0kxv091+wAhXsiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] target/arm/debug_helper: Add fieldoffset for
 MDCCSR_EL0 reg
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: n4AhELlPU4Qr

On Fri, 14 Jun 2024 at 10:30, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> MDCCSR_EL0 is aarch64 varient of DBGDSCRint, so utilize the same cpreg
> offset.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>  target/arm/debug_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index 7d856acddf..5deafa4d1f 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -970,7 +970,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .access = PL0_R, .accessfn = access_tdcc,
> -      .type = ARM_CP_CONST, .resetvalue = 0 },
> +      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1)}, /* Xilinx */

MDCCSR_EL0 and MDSCR_EL1 aren't the same thing -- MDCCSR_EL0
only has bits 30 and 29 (RXfull and TXfull), not the full contents
of MDSCR_EL1.

thanks
-- PMM
