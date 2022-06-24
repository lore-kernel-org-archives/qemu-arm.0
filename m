Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp401735lft;
        Fri, 24 Jun 2022 08:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzX/JHxUwnBj/fbgmhIJU02vyLpFPWCa0GFnDT7fsXAGQc4EwoIwc8YEsGcQ2Kdt2LTyrI
X-Received: by 2002:a05:6214:29c7:b0:470:5c17:b529 with SMTP id gh7-20020a05621429c700b004705c17b529mr14422485qvb.46.1656084065910;
        Fri, 24 Jun 2022 08:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656084065; cv=none;
        d=google.com; s=arc-20160816;
        b=Sxw4eipEVPpa8MsUwGPNqqaDxq36f2XeJtWgPe3WupUFnTEiBirJVV0dAndHurvZ41
         dijYwS30HVfMnlvdT3IG2pSwPNc/ZrjDFyvsMXYGtf73JMgsKxK7mTNE1Nh06Foouxgp
         4vk4yYP7ib9dJyqwjy+2RLfQUrz4rsEy/fwU8Zcha4Z4+5NpRHgNhyEgZWbHRHDjz6ec
         Z8dGQDF9FIKKdKkIn4BuT+227LlVg6eC5XDdacDpQcMHv+sw1S4H5wEWMWN9l7Ysp/M3
         7lr17QZg2Q5YB1Ge1TkujjpFzjQ/WN4oZNGncBQBSivh07gLqL1zknseeZQMd8ItFqCw
         mj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lbDSbubxl3XKcu6DS0t3+SygjIjOCQ84yNRhq13faLY=;
        b=QBNV1BKtFZGb5ixLgizjt05i89PllvJpDBpsdwgKn0Ot5B/tOUWLrivOHbNofXwVDY
         +JKsQI3BvF9r++pvl2f5bV5hUWqaZ24A1hhfs0c875l5sUPaMejtOnKIs139u0+bMzXq
         iOV+z0aDdVd9u7fqAg+hRvk6uuJhq+rdi3ZSN1g/XDdSrFnGAQ8QZeQZCY/KWUGvUUA7
         b26R4MdNHp5dzYmLdlfwNP8teu3wKOH+rCvCCZa3sz22STvmuSNPUB78nzVB8/8D7l9Q
         yTHT7lmta59m7iNgUHKHqb9ptkFEtRYJ0+JBg+JbD2EtjI4nNVvZo6yH0fX6UdFW181R
         SUaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpHBQSYz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140d4300b0046b68b64710si1886966qvr.36.2022.06.24.08.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpHBQSYz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4l7J-0004xk-DH
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kzU-0002R4-ON
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:13:00 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kzT-00041a-7y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:13:00 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-317710edb9dso28334137b3.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbDSbubxl3XKcu6DS0t3+SygjIjOCQ84yNRhq13faLY=;
 b=MpHBQSYzZ2PvN6wU4WB2E8T/LWyf9QKS9reFcO3zv4saFsKQ6R8yrecPJVF7n/ZmlA
 u0pKZHIatleFAPH5VOao953O4+OUorlquIqOvanqwgJxOKM6wVeM7pgITVYCorepeQvk
 WD7bJSvYRP4YPKcQr/Y1I2mvwFHbGMDSGVFrykeRYFLb2MpcK+cVar4QnlpIxuL799sd
 LuLWQcNpL14dOv22NX3HgQQn8z0T5mKMBEtxfobIJYRwIl6yZDmFmv7wBWGTwe9F1GGT
 Zh2o9tfvqilxrqbVkGS2u9LkRXumy8SDptT+ZBT3A0Rsj+N2U44lZ3/inkOlwDrftw3b
 ld2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbDSbubxl3XKcu6DS0t3+SygjIjOCQ84yNRhq13faLY=;
 b=HXIaWtDVkJ75whK3WehoDpTBdN3rsusGNnXSiS9/qJJbEOQxyoBcpIwzXUQPsB0VW8
 LL0CMg63rVdVkX8OhmHHq5hSOKs+SK8fGGK6vl5eczpb+Tg1SZ2lwXDw7IObh3nZHYwj
 KbwDTs+zDQidfl+MIpAUpOs5vxJJMcBdx8+B5+IPX7UAI2arNNtxbMSYOGqZBwh0fWvR
 7oXSmUae9jB0qJBs+8GnOmHfKoI/6QYc0EgUGkbQPyTSkV0RptdSaDHnOL590/ZSYieg
 dAMVcOVlzrsiJQWSKBzEiSXd8aSPH/41SAUB3ad/nq+Z/zGgM2s9f4Oqb6XHYTBO55Ju
 aw6A==
X-Gm-Message-State: AJIora87XZgj0ceTr7zYW91JOKzKFfMqfMFGzkb/NSPXeX81x9jS6XOu
 Fj/DeuNNajtaxNEaulo5+Dc2SHmdpHxbeFJPcEaEaw==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr17504693ywd.64.1656083578007; Fri, 24
 Jun 2022 08:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-54-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-54-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:12:20 +0100
Message-ID: <CAFEAcA_Wqv9n7C0cSoycZHC8zLtnrOzLWu_ktNjN_pL+CS_Riw@mail.gmail.com>
Subject: Re: [PATCH v2 53/54] pckbd: add QEMU interface comment for I8042
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yZwk/7wFDXq0

On Fri, 24 Jun 2022 at 14:54, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the I8042 device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/hw/input/i8042.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
