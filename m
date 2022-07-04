Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3244207lft;
        Mon, 4 Jul 2022 06:53:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6Tc0IsjMN4IADrD/v+pjj5cyTmryaQRTO1FLZSuFLQSnklGrkuOn0AaNcvZveF/VvhNLG
X-Received: by 2002:a05:620a:15b:b0:6ae:e3b8:ea2c with SMTP id e27-20020a05620a015b00b006aee3b8ea2cmr18975465qkn.214.1656942782265;
        Mon, 04 Jul 2022 06:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942782; cv=none;
        d=google.com; s=arc-20160816;
        b=UUh5U7gTxRsxYjBLmCkSfwHJRyw+wNs67V3NuLd3XY7gDZBe3nM0ZeWPdOsa+WoYgF
         ag8F7qChwzLMFGNMgFoslil+ljVOdiDhhS34Ogo9oMZC9sU+k0KkxjrRh2f3Lmdzwv/I
         ybB2ppF81ik5T3y5cVYQViGJf27TIz3nw76PIbchTQclJp8V5u5cauxPJfHSRTn9cUHE
         ycUyzpwolz5EmD8QGbh7D82N7eWedb4Pmk/87rzbwT9sl/NjHRwfD97gAQK6H9l6EmRf
         92E/NNWsI4Sn7oDdWFScVBxs/Jdr88gchIfS0Uvvj2dzRxybLfNLYbF9Y2QCnGZxJyr8
         suTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PI9t+iywl3nuVIeDg3V6gRTNgARB3lnWAOFF3Wk9dmw=;
        b=JEEQi4Vu4L3J4nLcazSTi3iYrGribRuQzk1/H4lfNHQ1dzmFW+aIewOXTKZba1Ufay
         CHlXjJI35Bt/u4A/YoiqLguoIEAef4+//AGzYSZVSp4pIu7E+DG977tw5/MvMIgHmO6Y
         GtoKzFUkDoySSgRWPSm4c9aiZousW8wXFMqPJYPVrlqrOTfa1SXnhX8qJgtZHZK5C4Tv
         vRDLmWlAr2CGoQjWJM6FCa8DaOPHBEm888VRxeiHSKEZp0fOFsLVeJ3tgP/OxpOIPJdr
         kq/b+DB+C9RYep7vJ2evm2wzqHy9FYUjFJ0G5G0Hd0Op4P0VbAnxoBNMkhb8wHMwpE8w
         mLkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IetAa/n4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ad45ba4000000b00473001ac914si382516qvq.442.2022.07.04.06.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IetAa/n4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MVZ-0005P4-OC
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M0M-0003vt-IC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:20:47 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M0E-0002Xf-6W
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:20:39 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-317a66d62dfso81981237b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PI9t+iywl3nuVIeDg3V6gRTNgARB3lnWAOFF3Wk9dmw=;
 b=IetAa/n4cb/fsBcdxxN7WFvjOahlprF7rEdNYjxMxJNVL00ppONfHfwptEhUKgh3Bm
 NIdIhuRbI2cACqTj2CuegleTuV8jvryqm55cuXwUDdK2wZWZ8GmEYKYZR98jrSFq/Plg
 DPHAJyCsGbcVESnIgwAWAMqWq+tnDrVUTsT9SP2rjwOFdQkxqgY3NEvZg5GYddFjNGsN
 J5TnbUDpvKcvjSIVxHAMONX2RQK3S1u2teMKAX5v92FgiYNpljsrq7wV0qk4E6obql64
 lT6debtg4Sr8SrAEEkyN4ft/pvvDYRAr4QTEFkbd+FeDAtmyEb0J1SjMtgInKLxPv00K
 515g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PI9t+iywl3nuVIeDg3V6gRTNgARB3lnWAOFF3Wk9dmw=;
 b=sHwLY5XDxsVKgxC2R683kbxNz78oKC7gFvrjAPq4xYt//zdlxc3JL1OWjnWiR6EkCl
 cncoXjlKgAWjwf8ud2xn+UFxis176VlgGwFgtJ0Nz7zA1p7Gew9vVG2JTaM6vfUqLH2Q
 rgRm81FPxKEMHDJT37fhn+s157s0+P/pUbzqp3mAiyRbKytPwO9zRHERJYi/xAXulrio
 Gm9Wu+ByKfFEiJnwoW4TmYgevh1/dNUn93//mXM3Ggp5w2GEeDTKhJTlWT2owSvxR/wh
 26ksyqtKdQjiSZpJmwkA2X1jmj02MTel0zPO07iu9cKL8IF4W8Cnn2BGJvW50A9dQjx+
 bO4w==
X-Gm-Message-State: AJIora8q2sv8xVoRWJFtsTiQxjScjJ0dKn8sw+7YKh+mitHfJGTRQYoW
 G4TUczu8sexptMbDJOmB/m1hzfGLFkF07uOU1piZ8g==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32404413ywg.329.1656940836456; Mon, 04
 Jul 2022 06:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-12-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-12-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:20:25 +0100
Message-ID: <CAFEAcA9_2bYw2g49buzw+ZNjymu4eC6i6hZUuOxgoVAubRv4xA@mail.gmail.com>
Subject: Re: [PATCH 11/40] pl050: don't use legacy ps2_mouse_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: zhDV56Se7jl8

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 mouse device within PL050MouseState using
> object_initialize_child() in pl050_mouse_init() and realize it in
> pl050_mouse_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
