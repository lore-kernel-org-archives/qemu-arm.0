Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2891579ejb;
        Mon, 5 Jun 2023 09:03:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6GCIWJVEEZ7GeiuynmJ223g7ujwco1BY9/An3DCwzAboyozJfbBw+vm3NcYCdngaqV7aPD
X-Received: by 2002:a67:f745:0:b0:434:5839:bdc4 with SMTP id w5-20020a67f745000000b004345839bdc4mr296877vso.25.1685981007355;
        Mon, 05 Jun 2023 09:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685981007; cv=none;
        d=google.com; s=arc-20160816;
        b=gK55JMUllepjDAm17NVKIhRiuoU0+DAaiGZOVKGiaTLwuk1btmH1WGDuvJ7/aHGXiw
         2i9ad7Ww2krrg8tASUhsoIkallmvmknXbtUkkQ0rVg/j2vzMOKb5HbKcq6Ia52ihrdMT
         XW9C8Eu35BTqFBirrmfnNar8V29Ig9b198hNQL7cWxXm11/q51ZA+zD5nQuwPkKghLO6
         qLzBAWTq4ajDOsxxMGzsozo2Fmla4lO1vtA7eO6lKF2dBW5mhcBpvEW6am0NJgnfucPZ
         FT1qp4GN6SLNUSiPPjBEKKNbr5lJn2rq1LslO6FKzV2MI8e0X56SdpUTTEoVjp0AmSOV
         urCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XpnGBKz3w05l1nCZrcmPeB/1cPStoAENROljWzGn0p4=;
        b=MefKFK6VopYuyPjHsv6FxQ0yJBMP8QnHlp2mpmxaHskmM4PK6f0vWqOJkr3w+vJMrq
         G9rc5a2CTSETKYx48xFJIyNUWyyiIA7rhxtsS0v/rz/rmB5OeTGWs8xDS44KLJFZ+QG7
         77aFPJj3j1eKRFYcq2xue9dHUExG57/PL3xBRYCBy1GA3cN3yMJyS7LzstrBd8jzxJt2
         Ev6fczdnU3/oAosoWpPS2ZfYtQXB9QQz1Jvux+XJ3q1ef0rovd1uLk9Bwo9erLlzVFQ7
         vVdfIFqNFtvLN045uO1wnuEPTxtoiCOS1zuSgOjiHr20ecp7SpDdGa6K9b2p+GJ01uqj
         JkLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fz+6qdWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24-20020a67d918000000b00436086d3557si550746vsj.243.2023.06.05.09.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 09:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fz+6qdWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Cfm-0000lz-2q; Mon, 05 Jun 2023 12:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Cfj-0000Z3-It
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 12:03:07 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Cfg-00056i-SP
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 12:03:07 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so6451209e87.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685980983; x=1688572983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XpnGBKz3w05l1nCZrcmPeB/1cPStoAENROljWzGn0p4=;
 b=fz+6qdWCUqFxBy1Jtg+hQ5t3d6Nn9QTOtplGHKooqNpXT7XgrW8U7E2wRJvS1GLcL4
 Oi/6KCyM8yz5HRq51vvsZYtibFzgPoOHmctEO9Y3CF7yzNdndFlWDJfK456FStpFHdSw
 a0BtxruU0SxRtVzNUURSvS75a3O5K+rkmpW/IZP7IACkEDbv0Ej34qOghp19jHJzSNJn
 UQFEPw0vcAz/axgdx6OrWXorEPcBt+IV9R7IXnx3Eubxo9tswO/+3F3wfqBUKQZ8cDTi
 b5Lx0l7NC2mURdzoAAqihNjO2wQHJ/wvtkueMJ2FjeQM9G8mfN01HZH0SGB0t/cidaAr
 /A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685980983; x=1688572983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XpnGBKz3w05l1nCZrcmPeB/1cPStoAENROljWzGn0p4=;
 b=ijLcUZimKN6U6WBAtKemejn/vhcT7ZwfVXxSztuWdyg5KTmrWQRYzQPnLBx9nxf1n7
 AVwyr5Lg6/EMAqQVEEDck1ZwkLTkM8f6x9+a8K0w4VBZpDHJxJ1m8Z6FOLg21AbXLz8/
 IGR1k7wkn3mhGudlR3pxW2HpK4s/7J7mMFaMsq7CbToIAPRQwx/WJk+E8BSHd0W7yVpu
 yNf1htwOwvlNIsewAj2SUtefg58oAPeo+Bfn7YUvx0P3P4Kaeo3/gUBjLkkDMiyapr+X
 QG/0YVGfeXltcI2HUKCOBZPiL/szgJNXgwdJizoLbttBv+w0ysvoff2kyBOmIYZ7yIqw
 M56g==
X-Gm-Message-State: AC+VfDydbIwqVPSmY1ZkiDScpREHSPbL28sfo829dxw3s8mb+fSLDdzb
 TWH0vmLNb6o2/rVgpudB/X5VW8YB5toqmBay4RuLPQ==
X-Received: by 2002:ac2:4c21:0:b0:4f6:2229:b6d0 with SMTP id
 u1-20020ac24c21000000b004f62229b6d0mr2645575lfq.40.1685980982860; Mon, 05 Jun
 2023 09:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR12MB630905198DD8E69F6817544CAC4EA@DS7PR12MB6309.namprd12.prod.outlook.com>
 <87f06ed0-3ad2-6b14-6819-03a35e179682@linaro.org>
In-Reply-To: <87f06ed0-3ad2-6b14-6819-03a35e179682@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2023 17:02:29 +0100
Message-ID: <CAFEAcA8xVgcUfmphur8OV3U72ErdbPVO5gjRkoD2dnjsZ3umYw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: trap DCC access in user mode emulation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Zhuojia Shen <chaosdefinition@hotmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h3N4CkNb8EnU

On Sat, 3 Jun 2023 at 05:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/2/23 14:43, Zhuojia Shen wrote:
> > Accessing EL0-accessible Debug Communication Channel (DCC) registers in
> > user mode emulation is currently enabled.  However, it does not match
> > Linux behavior as Linux sets MDSCR_EL1.TDCC on startup to disable EL0
> > access to DCC (see __cpu_setup() in arch/arm64/mm/proc.S).
> >
> > This patch fixes access_tdcc() to check MDSCR_EL1.TDCC for EL0 and sets
> > MDSCR_EL1.TDCC for user mode emulation to match Linux.
> >
> > Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
>
> It would be nice to define the fields of MDSCR properly but either way,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
