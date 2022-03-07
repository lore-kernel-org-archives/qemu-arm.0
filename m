Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1512614lfo;
        Mon, 7 Mar 2022 06:04:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPSe1+DYzWZtpCdlwNRUwAXI4WPeelrunEelZ08en9ODuiNHmcSvvVPp6YqIC0Aod/evY5
X-Received: by 2002:a81:1512:0:b0:2dc:75df:f3a2 with SMTP id 18-20020a811512000000b002dc75dff3a2mr8398609ywv.139.1646661874731;
        Mon, 07 Mar 2022 06:04:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646661874; cv=none;
        d=google.com; s=arc-20160816;
        b=I2NRyivGrfSykHdaXeJt6ZUqx3XK8g4b2vvMe73C27t4yCpOMEr/p0OiFSLKX+Zlm6
         X/NaUxwPSTH4soEoqPMR/9Oa9cpkiutHKaMA3VHYnr33868Rd/EfII5eJNBQUGnQh20D
         u6i/lkc1KoELyO0Zx72fpyMl3b8RNx959BrKzR5BrhCRgl8PkBTFBzOVP/ql86Ts8NRD
         LvwFdY8+a6/MjtmqdmD4luEjlvjPMdM7IKanUiZpHdHx0OP04xTAJOLFfJvsCM7FYebg
         NFa6YwyIlb5mlqWgeMBf/rOUC5CqgqwdX4DToNbOGV8yNzR8zdJMjrkxMskwE9JpkOWO
         BdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2WZcKnxnGjVm22xGan72lcbepIcBWAFKi8sQIlaN3I=;
        b=jTxXO8cfjmho78MzTYjQ7cat9XdBSnymhk4pY/KnGtp6NQawYHfFu+VWoE7LmtCmc+
         EK0AFMI7w4xZKhC89MTu8rRBNNQKcul79QH3zdfPub96uqBWhb6AQCznXcFIGdEt1jT/
         W4wkT43iF00cw6s7/ORfOsnZ7QRHX8z+up3vFYIOXowYg1NdcSk+iPxJb79YCCqYKGsy
         vws9nkaZXaB2WYhQXg60lduFYXW+eiL0Xd5hT758uTdWLMjvWjhK6IPdPDT/3qLI+hSw
         tR/IEpwSejLH7aOCTKTvRgUcnuWQcMkUyuT+SNqMItGMX5xNuj+PtL7xiAnu/JNZ5ih8
         Ayug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gR+mP362;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62-20020a250841000000b0061da537da7dsi7655777ybi.3.2022.03.07.06.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 06:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gR+mP362;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRDyT-0004I3-V4
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 09:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDiA-0008Cj-Mt
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 08:47:43 -0500
Received: from [2607:f8b0:4864:20::1130] (port=38777
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDi8-0007Xz-VZ
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 08:47:42 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2dbc48104beso164463087b3.5
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 05:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f2WZcKnxnGjVm22xGan72lcbepIcBWAFKi8sQIlaN3I=;
 b=gR+mP362IaordgnqnZLZnU+mdUCioJh/X6wfTpyEA7UiMWO8kuObjoY9H3ozGS6wkd
 0N0diJFMuDCfNbwQJeMPOYZpApWvGne0Eqn+TxoZMEZMylp3eHaoj++VWOMNZqLIVHRG
 VkKEYiVd6UEb5+aFyK82A5LIxb1PUX0VD+onnA0kPIpHBX3igpMJrqdVv9y2tG2qZrG2
 y4UdbayVCkBR1mDMihhAPX+PE8DhGNqFLRoEdK5KniUUp0Awh7pG3IAlzwzis/KI3Ths
 ntdlDtdTwYECPaSkiWAuiCraff0PUkJTKM3x6SNsaWa/gBtsVWFxwYqA7nN5Sa02YpMt
 ECcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2WZcKnxnGjVm22xGan72lcbepIcBWAFKi8sQIlaN3I=;
 b=2oFXf0025/RoGX3PvhZAyW8n2hzYdsBTDoTImmgbPcW5fFwY90UuPh2ba9w/+oSq9I
 HLZi+y/kWlsbyYKkghUgMzROLX/2/4qwGBaL/1fJ14sZyM37BZnxBj30kZ7YxAYz8OgM
 e9SNnBPfkjgyb3X1r+a6g7kaPcm0SYNGLcfrBxHEVoSHEznqUqSORRM0TNp80QzWoU35
 c+JWfsFr6nhpfrP0bnx6oGxgumJj3MqomeT4SXFcr1obqSfthCUb1ovkJIzLGk+W/uAh
 ojFZTUlGUFQ2BNPEmBwlIAk1YqlsZHOw+lSpD8lBMhFwCuGRh/4R4N+xVKBCSfnSxkJ5
 N9qQ==
X-Gm-Message-State: AOAM53235GQX/550Ih/wtcVYLZ5w+ailMR/dqGPSNeohho0JkuXQT9sJ
 KaJ2XRH1zTN66kXlPQ1JFoqU2sLeyc/dDxK8vaS9ug==
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr8719345ywf.469.1646660859866; Mon, 07
 Mar 2022 05:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20220306194003.13030-1-richard.henderson@linaro.org>
In-Reply-To: <20220306194003.13030-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 13:47:28 +0000
Message-ID: <CAFEAcA-BZkpX663Tka0_+i=6r5jA2c4i3=rtQ2UTKDS+T=be3g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o3YFMTAQzW3O

On Sun, 6 Mar 2022 at 19:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The order of arguments between ldnt1 and ld1 are swapped in the
> architecture, and similarly for stnt1 and st1.  Swap them in the
> decode so that we have "m" be the vector operand and "n" be the
> general operand.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)


Applied to target-arm.next, thanks. It seems to me sufficiently
distinct that I won't bother squashing it with the other.

PS: the keyword gitlab looks for to auto-close issues is
"Resolves:", not "Fixes:".

-- PMM
