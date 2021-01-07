Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp615915lfq;
        Thu, 7 Jan 2021 13:10:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIh3jyHPFn8N20pVQ5K28L777WSolvCnzpug2wG2cCWfZ+/p/NxCBVJBJVqfg7QhhRCwdv
X-Received: by 2002:a25:880a:: with SMTP id c10mr1076081ybl.456.1610053844167;
        Thu, 07 Jan 2021 13:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610053844; cv=none;
        d=google.com; s=arc-20160816;
        b=IJpnA8JRYdww6dEcg6mTJFjkEoFOLKH9OOAAcufX29LvS/ONxeVwVgqVucuKffjipt
         je8Me3xAqIRAD2kmVCiu/O8loiCe4bEkPJ+S/tCnNySLPbBcrn6Kkpd3fztdhYO75vgm
         JcBccSQH7UCUyxegYkZe6LVt6Q1LhrJ1Te/K510KbyMPSzVAVo/gVLlc0Zqb5gsJ6qF9
         V5grBqXHhz8gbAJLG+KQ6vwKM3A2RXsY1tsKxf0t4xYEcId+ED7qMH3rIUF0f7OtAeD8
         nrOAk5JJMLJUATNYtDCAxzSdasyrinI0n4kvttd5rL9S4BGMVWlW+EDN7Kv7jdv0V5MG
         XAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OMeoWbothf8/Ef4qD/ayPFIJQJ3UmD5fLaQFggFJsRo=;
        b=olBDgLRNRB3H3MaBc1w/sbGTVVnHLtdu0VPJjZgqFDbOJdUye/Aasm0wMQr9HclKKD
         8xqhODaakfdZlC64a758b1xESIibNv/6Yqhc+lHAptKD0nmtOaAawNywbolkmWmrjwA/
         S6jloqAMdczBg+o4ShSD5DlN/R3I7n+Fa95Lce2xQWFxTyYHDaCtBFaqOD2G0ule1tKA
         i5UPnlsMTvhb9aPjOJUhObQZGVSxqMEpJILyoPDaOvaMnw9991w+AtE4NsW/CoikGLut
         fUWNzL21kpj6OzNRIg7hD5gZPnmLf+zuGNJ4N3Mj28sPWoan2/kEoFl4WurlacI5o41S
         X/1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ymGFm+Ga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si7137864ybo.108.2021.01.07.13.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 13:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ymGFm+Ga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxcYN-0006m0-Jr
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 16:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcY4-0006kQ-Kt
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 16:10:24 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcY0-0003aW-Cx
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 16:10:24 -0500
Received: by mail-ed1-x532.google.com with SMTP id v26so150852eds.13
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMeoWbothf8/Ef4qD/ayPFIJQJ3UmD5fLaQFggFJsRo=;
 b=ymGFm+GaGxKYWGRArnBN2pHrJhiGfw7CJMMQGaA5dKFC/it7n5NgVkAdpj8FIWPsxO
 HmgtT104eDKYEP2hcfFCqQXQhmDeDvJDlCkFQOWTcR1a/GR68Mt/V6tNxEVaeHMaRwdB
 AR5ADhy23e5A7b827v/2bkMOGhqnSWwurKrNFQGifcaRTePcCMTVAWcIYgDA+cIhU14Q
 km0JC9zPwgtwzeCG+IKXfuB/d3h8bn54tOjWo2Z0q8DxJz5RHVq3dhlzUoniYlZQl9lk
 UDc+33Vb2/A1ZTlTvqAHvhBhadtIi8kIw+mijR2JODBa+RUqB7dp3CYGFnxL/gQSHrQh
 VJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMeoWbothf8/Ef4qD/ayPFIJQJ3UmD5fLaQFggFJsRo=;
 b=Dh10hfNatN0HgDgMOuoI36TBXt9BlWuq5ify7gmLHG7c0ICA7rzbrztkZrHH72+i52
 nJmlIqEzvwD1oer0V2guZxxLoPSC1W4V/7xbnki1tm7aPQJWYVtCe+dW+4im7lQxdbdF
 6w4P7sJNqJVtJ0qBuwLwgukAVYTUTb8gPZM4bkytnajeS/ms8CrKI0/piMToO9tIZZo9
 u+Fjy700dD5Dzu2Gsv4ixN9K4QrLsPmgeqfOrdybAJMvRkD5eYCYZP211KWhMrOmP/d+
 PtPP71Mt4LpID0H0AM7PDx9nGk7ZOUE2qGEEI1LObHmHU5eSni5QQHYTswTxxwKbXBpS
 IR2w==
X-Gm-Message-State: AOAM530gJc63s+/wWeQaryfFvtAYOpEhIDFRuyb/GYWb6/4QFj44FC5g
 j9K5HPFS0VJGqDbwHWSzBC7U+fqBdMpeAY1KUf3kxg==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2951085edv.100.1610053818967; 
 Thu, 07 Jan 2021 13:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-6-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 21:10:07 +0000
Message-ID: <CAFEAcA_BTy5z5TUkGifxSkX9xgxMTfgYwQ6daPnGvtWTnV2MFA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] hw/misc: Add QTest for NPCM7XX PWM Module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gkuSB6el02mx

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> We add a qtest for the PWM in the previous patch. It proves it works as
> expected.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
