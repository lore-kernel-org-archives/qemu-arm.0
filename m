Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp357638ejy;
        Thu, 22 Sep 2022 08:14:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gCMkvbSLIFHMytEnlALJ1GUG+TvYiqkRHa+5OTeZtScDlVAmhku0MH3LhO99bh1MFsHe6
X-Received: by 2002:ac8:5cd5:0:b0:35b:bbd1:20ea with SMTP id s21-20020ac85cd5000000b0035bbbd120eamr3175100qta.549.1663859648610;
        Thu, 22 Sep 2022 08:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663859648; cv=none;
        d=google.com; s=arc-20160816;
        b=03W2bQrE2DM5kmk2sKsckpepLaC2GnuJZFUlP7ZFNhuBvAz4eZSUTYWMAaDYSoupWS
         JyaRHMKhL3Fei6mtwYwOd2U/1iVPZJUqqIV1g3YzvtEqXn4Jv8Es4dJK/nevlkOwkUAO
         G5thn81JWffawfNs/F9Vr0jj0PTrTf3/8zJ6PJSiEInAg/I9z3+a7zwd8WfxWa7kMuSv
         5JeUP5nvb3DztVlDWRfC49h1DWku0ScP/ylkoqbJIsxxefjZNs96jGevwIwBs8fB710k
         xgsm99i0De+c1v6LD/8JUuMsjHsvZxNkBD0O6tqDm1KAXslm8BHj/OE9TICEFqal+w56
         ttgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fsV7eS4USxpKc1nQ54y7IcHgkqrSV3V3QPYg29FrWp4=;
        b=Gkj08krvuapmoQX61foPQdYNUu2gMf1IIjAhydrpM7pyV5xctfOsA74Z1MD/HsHfQm
         MlVH8kiPjKay6jFUiUR45ZrfLb81pSiXkarCChVMkMNZxjKCAu5dVWllbEqGLbIWstWN
         DppKFOlqYnO74pY/3qBK6THNs8XtaUbkxdb0z0IKRgsftf3sPvdDg6AFngCx4hmbMPA5
         ZYf7AkQ9ioY1AO+Ferzvdq/wQ+WkmGwQCJxAuPVNM1L44+TeR6hjwEu3Nojs3521faG3
         UZEQ1FeUFY1Nd2i7x2TyimjN4CnmnZ/Pn7DC1X0oSD0aBp2f+5Jlb0Nu3nw/Jnyuw1HF
         2UQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfiRIwP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l28-20020ac8459c000000b0035baf834a59si3429262qtn.221.2022.09.22.08.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 08:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfiRIwP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obNtw-0001N3-3f
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 11:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMm0-0007t9-Mc
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 10:01:53 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMly-00038o-FD
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 10:01:52 -0400
Received: by mail-ej1-x635.google.com with SMTP id bj12so21202607ejb.13
 for <qemu-arm@nongnu.org>; Thu, 22 Sep 2022 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fsV7eS4USxpKc1nQ54y7IcHgkqrSV3V3QPYg29FrWp4=;
 b=AfiRIwP1LJykPq6SCBloKSGoS/gcMNRPP0XJdZXjjATXsunOMIye/gTQTrEC8STOd6
 l2OkG2tRQDkbztAU/UMazpcIcIjeGBK6/gPHOhooZOrOmA2UQfNPRcPQpJp6y29lnMlf
 u4P+6DSMOe8CgLUQ7L/Lm5Dgndxw2+N+/Q1DnIT+RhiTDmixToA2zU21tbFSDsgOHB6t
 GHiRf1RI0975UXug3F+JgbhP21BAyuEjQvNIvWMLYEOjDdoTYrg0YyohCsfn1kmgUlXC
 Np5iTCbf16c3t0a0yT01NZLtq5es2pIFHN65H3wxpG6vGEacoAs251htiFHUBQNQBgDM
 jEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fsV7eS4USxpKc1nQ54y7IcHgkqrSV3V3QPYg29FrWp4=;
 b=kDxtNr/N5upTlikCfFKizLh96HA78PvlTlpXAqb7WM3BDuw8IJ7Gq9833fkMXf43Ba
 U7/MwLv59KUsvS7gvtOZEC2SuNZqwlefmX49wsO3VAp+s3MygzQrc/Keg3/CmGYPmoup
 ER7toxYu1hG5+okX+74sBmCVwTal8jiP288vfzL5kirKE6tVgboRApjvMtbkoAdBInmB
 JgE3gVrXcHiO7zcLAyu+p6uyM+FIFldVskYLQKbz1NYfJVIocSdLnFI/USaKZ5b5CkK4
 bV9seKxNhYoTcDGCfPlNRLow3Xx5I23Vg11cVM/6yAbg3wCCpD7s88+6V4F85rYeGK9J
 wMJA==
X-Gm-Message-State: ACrzQf2fjswzS/wo9h7M2tQIlGYAs/HR6T76PXwuZYGJl7hD2ZUPU+qO
 f+K+Q2+s2FurrgdYX57E/055t9YNuF3ZvGivwILdaw==
X-Received: by 2002:a17:906:730f:b0:781:6a70:ea4 with SMTP id
 di15-20020a170906730f00b007816a700ea4mr3017559ejc.36.1663855308756; Thu, 22
 Sep 2022 07:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-3-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:01:37 +0100
Message-ID: <CAFEAcA9WHFT8imd7-3bZCkBuXtq_Kh0Tuqsri35yAHFF_kvQRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] target/arm: Change gen_goto_tb to work on
 displacements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0mgKZXc30qH8

On Tue, 6 Sept 2022 at 11:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
>  target/arm/translate.c     | 10 ++++++----
>  2 files changed, 27 insertions(+), 23 deletions(-)
>

> @@ -14965,7 +14967,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          switch (dc->base.is_jmp) {
>          case DISAS_NEXT:
>          case DISAS_TOO_MANY:
> -            gen_goto_tb(dc, 1, dc->base.pc_next);
> +            gen_goto_tb(dc, 1, curr_insn_len(dc));

Why does this one need to be curr_insn_len() when all the others
in translate-a64.c used a hardcoded 4 ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
