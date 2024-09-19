Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp77621njb;
        Thu, 19 Sep 2024 02:36:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSAQbGAYbbhbxsvApMSeTyEYVyQBVDgZSdrUQhv8BkYQuAFfuLhaYIpMUmrAzGoi3i/QtHCBEAgtrdug==@linaro.org
X-Google-Smtp-Source: AGHT+IHkn+W7Rn4auWra2uHNm5tp+uhPx7wzIvnTCUQqFKvavUFEv0kwZoGx/rlwJyuhfCYCT2dS
X-Received: by 2002:a05:620a:2953:b0:7a9:c0f2:86c9 with SMTP id af79cd13be357-7a9e5ee22a8mr3487653585a.5.1726738599198;
        Thu, 19 Sep 2024 02:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726738599; cv=none;
        d=google.com; s=arc-20240605;
        b=Eb3xmqnpNhSiKEeGJWCdj47XuV2SrcaTgR6HXDibfIDrtqS+pQkVr2wi04NU7zN8Ut
         oVIyOR36bbd69jfCYpYpqjnrtfEkse+KPBPEA9iWGNhX8dQqWRAjHtjfT7aCj4A6vxXY
         17y0bFfgCG57BeldfWUZ2YqMfbG4flaO4h9H75UP+jXhjlF9gE2He63iCbkvZSRESfNQ
         iAPZ7ALq+ECRIbn9DlkZrR2FDM5IcHDQlLO7T9q49QfefE+U0Jb4bHOH2UZq9kmPRnRo
         4jz9kvaA9pbaYwdesAdorQ7yPGTTjd19KUHsXvNKKaTEZIVAQKKfzkoo6jkDPCnmQsMG
         JrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lQk3wNDz3JKiyjh8ZbhDK1G2OFwi/dMyBXNc4TF75Ak=;
        fh=3Iu91n8Rib5wGmtm5wC2aW5FPaj5ejjvkQfkCeF98oE=;
        b=f6E4yWP9eu5EltISzw0MFI3iZ3vRNPjKANKyg76otAk/7kfjkkB8Kqg2waRBUoKDBT
         JMEXEDKEXQflGVF9Vd7WepHLRkF8uS1daeHn/zOFCajYaUeQ+ANnLc654RFuB4MzISH0
         IlAAkDPdlQzAmxymD9sdMnkIp1VQ19EOzuBhRt2sL5H5WJ/poqFqYR2OMZZC+GaAC1Ez
         SLlo1OalxCKL4Kja8G4jZ0m3myInR8GbLtlEgKBwZ0Hq5eRgnFs2FMqS2iGkG+Ft1BNg
         oGNyNLUqxmSx3Q9M+s6FOqcimqTT84doQHED2yAk8jrDuKl0KcSZq6fAMu1AHRu5CFzm
         u0tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O9pRIOY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb07f8913si146137385a.134.2024.09.19.02.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2024 02:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O9pRIOY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1srDaH-0000sX-Gd; Thu, 19 Sep 2024 05:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1srDaG-0000mK-0S
 for qemu-arm@nongnu.org; Thu, 19 Sep 2024 05:36:20 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1srDaB-0007Jc-1M
 for qemu-arm@nongnu.org; Thu, 19 Sep 2024 05:36:19 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f74b6e1810so5215211fa.2
 for <qemu-arm@nongnu.org>; Thu, 19 Sep 2024 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726738572; x=1727343372; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lQk3wNDz3JKiyjh8ZbhDK1G2OFwi/dMyBXNc4TF75Ak=;
 b=O9pRIOY3Igm+0ZRZQqehu1U2bFkSHyUGoIFLPOTMVAtq8dYYyXR4jBCNZS7Eue8WXl
 EVQla2fKOJnlpUXipUEdnMe2lW9tzhjO4jzFmCweTJa1LgZw7J0mpP2jPsaH++uuqFox
 K7S96txrJS2TvHOrQ52oyeXsX+EY6h8cLX7ywt+86JE3NZFagH8yOqXWitgF5NbBU2Vw
 E3o71hC3aaVdtPW+UtWv7FXrrIr8pvylRvqeB2H+BFMiNWWnT2U9zYZU2bzRUYOgfBFv
 Au8ooq47HBriqAQNmQ5ye+b1pAPotFWT7seDK2A/KasjtrFwvzN63OvROa0dkAFzYRDp
 Lu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726738572; x=1727343372;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQk3wNDz3JKiyjh8ZbhDK1G2OFwi/dMyBXNc4TF75Ak=;
 b=bJpcA/Pxpb1u87m/+5Sw1Vr2hkY1lRWY6sIUxjH4PjJ5UvFvIeIW7acFMBSCaQfOEE
 Uchfkq7zgEBuTh/XtFzN7t95VYu5ercB757XqxMHlwNNnHwT5sPZLK+JthXeVYUEhg5i
 sbTuYOZ1phCxjfmaslW1k9bgHArYe3N+7mh1ra33Abn+MZvy3YXv0jcMV4BnN9wnyKDR
 t0lljXFbf6WcwWUYCsBKSK+bX9g8wsJxykyKs7BLfmAoDeYatjZRPeV34UVgWwEGrcQv
 ZfRbS6+XnScHXM2QILTCGpAL55RKRZKboPpGKt3hRQQf7SMj2KThE7b35ZscDPbTQ/zR
 MgmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTPxKJF2u4u7yASJ23l5GEfs33xj8owBdyIJ492i+jVwCWJ/yBr+q9FJyjaH8idLF72p6lxoMNVQ==@nongnu.org
X-Gm-Message-State: AOJu0YyXPlk9apJAnjAETaTPBxYNw1QZlEkwAAr6M8OrxGDg7MCSqpLO
 qPQQXVK2p2Dedmj8Kq9xQ2yn0F78cvTsWmXDUT+tdV3MJmD3Wak8YCWJvLmbO3H/FCOCaxdgC+1
 csh1Reca5vS+DWaRGRYLPx+yUo+ZAYd5IQ6UHSQ==
X-Received: by 2002:a05:6512:2345:b0:533:4689:973c with SMTP id
 2adb3069b0e04-53678fbaf3cmr11818141e87.23.1726738571865; Thu, 19 Sep 2024
 02:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
 <20240918192254.3136903-9-tavip@google.com>
 <Zus1YzMOZD1ppO-2@mail.minyard.net>
 <CAGWr4cSvq+WnUQO3-8jyasQPhKGQCvzOYqRm5W8vRdhW9iU=xw@mail.gmail.com>
 <ZutGsQglLtK7MtRB@mail.minyard.net>
In-Reply-To: <ZutGsQglLtK7MtRB@mail.minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2024 10:36:00 +0100
Message-ID: <CAFEAcA_ZUkz8xv_PP27nD_eRL18v0cU6A7K+K57b8ML-9pmodQ@mail.gmail.com>
Subject: Re: [PATCH 08/25] hw/i2c: add support for flexcomm i2c
To: corey@minyard.net
Cc: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 stefanst@google.com, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, luc@lmichel.fr, 
 damien.hedde@dahe.fr, alistair@alistair23.me, thuth@redhat.com, 
 philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TcwrKcmhmTJK

On Wed, 18 Sept 2024 at 22:31, Corey Minyard <corey@minyard.net> wrote:
> Generally it's frowned upon to have a ton of extra stuff that's not
> used.  I would think some is ok, like defining bits in registers that
> aren't used yet, but I have no idea how all the enums below here
> actually tie into anything.  I'm guessing these are just bitmasks into
> registers, but really, it's a lot easier to read if you have something
> like:
>
> /*
>  * The I2C Master function enable. When disabled, the Master
>  * configuration settings are not changed, but the Master function is
>  * internally reset.
>  */
> #define FLEXCOMM_I2C_CFG_MSTEN (1 << 4)

The FIELD macro already gives you that:
  FIELD(FLEXCOMM_I2C_CFG, MSTEN, startbit, len);
will define an R_FLEXCOMM_I2C_CFG_MSTEN_MASK (which is
(1 << startbit) for the 'len == 1' case).

You can also set and read a 1 bit field the same as
any other, with the FIELD_DP32/FIELD_EX32 macros, so
you don't often need to directly use the MASK macro:
  s->cfg = FIELD_DP32(s->cfg, CFG, MSTEN, 1);
and
  if (FIELD_EX32(s->cfg, CFG, MSTEN)) {
     ...
  }

The FIELD() macros are a bit unwieldy sometimes but the
advantage over ad-hoc #defines is that they're consistent
for every field in every register.

I agree that providing enums for the possible values for 1-bit
fields is a bit superfluous.

thanks
-- PMM
