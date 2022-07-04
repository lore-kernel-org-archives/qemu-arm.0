Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3254046lft;
        Mon, 4 Jul 2022 07:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6xmpDy7B86KknLgD2YBv0jSbP5CHT84nJUqHWC+wPWsA8/CZ9sT1kDkSFoG+iDmN18/dA
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id s26-20020a056402015a00b0043171b986f3mr38249770edu.249.1656943625183;
        Mon, 04 Jul 2022 07:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943625; cv=none;
        d=google.com; s=arc-20160816;
        b=IRPY2Q0ugrMctvHj0koYtuDZ4/6BH5Lud/MTblADjFMbjBcuXvGyhq+zfpS3iiHccz
         SwbM4KLyaG1gunXcyEKuSZMgF3Um+hNjFUuRzWmCNf2q46nEPRX81gyvUSoUo/08nEiR
         pfVdVTZL8mJoKaWVJDNtFWSmLcvCuZh6o52m8iOUn7zO8heTa2McTwS7OKwZA8g3nHKD
         Vm92ziEY/J5l94EJLeckAneR/DM2UPTvzWTPb0tnwT3o6tdrNkD8kopntjBhwkLZrOri
         0FW+XD9GmmjSuXp45+b/gW0faFDVV5Z3l6/45mqtaSThqTWTjEwz6jpvntLp5fOSwy8E
         ZIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ewT06qLuONh+D/+A9mhASiOwZBM/ZxxyBFB421yhg1Q=;
        b=uk3fZDSmYBoVjkciYZjGqqs5RjDPQbHhGuOd6ItB9r4jfFo/D8zYVK78w4xdmL0+xd
         qaSCwoARcXqBhITsK3g+MBxHaX9Dd6Z1PF3Lt7ft+1WL+ZWas02zAEyEfYGQwqfq32Vq
         yXpynrvcFaa6RSfzpI37EgE2JsCRP+HRT4qM6DWxyLQUHFP96rG6+KKF92Y6U6ZeVU3S
         CaFr2segPq5BUbU1DH2NObWW/zI1+bH4hsSAPG50xwQTsQDlQ7etAaA59cplTtwkSYUu
         ZQdFwFlWWFKnJI7icrOe3sG0rhM4is0KzWFfOqHyvfiIOss+c0gbn7fc3bdfSHpLV851
         g1Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjXoSyba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a056402430300b00435badb95c8si22049750edc.17.2022.07.04.07.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjXoSyba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MjA-0002E2-9C
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6B-0004eT-Gc
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:26:51 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6A-0003h5-0u
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:26:47 -0400
Received: by mail-yb1-xb33.google.com with SMTP id r3so16901811ybr.6
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewT06qLuONh+D/+A9mhASiOwZBM/ZxxyBFB421yhg1Q=;
 b=VjXoSybafX5ta5A6icSFr37o8sW3ZHvpfEy4h2rofWTFj9bpGUAXkrXv8fYKo25SMB
 DPCTgfStGN/rzU68t/D+bU61GEhRlXM7A5d6bWkNtf3dU+dCfPt5Nep3JmhK3UPwgwcg
 LRbW7rENf95lCeuDukcU4sn2e+EdIJqHaXUpAk+n1C15FG7yvTiW/FiQ1u2Uw5vl3AzF
 Jw2iFAXl+s/kHa6/ffXyzTYmI5t+4HzovwoLT5lrHj3o5StgYX0sBe70slI9O9v0ZNtf
 eeAUua6YZwA7d/CdmgI+WyVWZfXwho/upKUnfI3sIKNVg3b3BL2rNrBE8SpCldn0kjHj
 09Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewT06qLuONh+D/+A9mhASiOwZBM/ZxxyBFB421yhg1Q=;
 b=gZKwmNhwLnEx1AA6+J7ahihI/5PH2tj5gwLPFy5mLN4shCjWISpaqT2MvothNUMUeN
 Wbl/EpdZcnfSt/8kec699QbeBag5TSfka+4MsSMgUhixIPQn5/tvXKt5bk9lwmFOecOz
 9sz9Ihm7piIqRjieSIt3D4YX9Hhx+IaofCwQ1sLr+PTV1nmirK5z8OkJi4XIzfItVBxj
 aF8diqjZlzYuOjmskLoOJ8fb/itfxsPe2BoS8VFZAuKET3/kBTFjQ4B/VT43JezO64CB
 HSYjnOLOLbRHL3HEBJ9wYiya7/fMik2qZuh7kA2jJoLzoN97fYYJh1VF3FlKPGrDU8OB
 Mz8Q==
X-Gm-Message-State: AJIora/y2aXK5EHB41Ekiog+fY/NrqVClCe38lHKg/+lba9jzzwTGlgI
 7g0P7ZU2VzK8S9yG/44rsBJa4MYi4qs0IPQhCtqtMOplm4k=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6047779ybg.140.1656941205002; Mon, 04
 Jul 2022 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-26-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-26-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:26:34 +0100
Message-ID: <CAFEAcA_-A1CzzrZy8oT69MqgCvb9PF+inQBGYneWZqOffdxJtA@mail.gmail.com>
Subject: Re: [PATCH 25/40] lasips2: introduce LASIPS2PortDeviceClass for the
 LASIPS2_PORT device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tw5FsldqGG5f

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will soon be used to store the reference to the LASIPS2_PORT parent device
> for LASIPS2_KBD_PORT and LASIPS2_MOUSE_PORT.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
