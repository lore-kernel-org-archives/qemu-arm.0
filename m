Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3235320lft;
        Mon, 4 Jul 2022 06:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tuqVjghsunnQnAiKTW7YeimYZUJ1pJ8AGT3NZegI+oMSeDpuuwoYRtPBdTfCjcxu4ZQXaW
X-Received: by 2002:a25:3fc5:0:b0:66c:85df:4e3 with SMTP id m188-20020a253fc5000000b0066c85df04e3mr30655707yba.90.1656941886882;
        Mon, 04 Jul 2022 06:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656941886; cv=none;
        d=google.com; s=arc-20160816;
        b=EkAQ9F+z5uh8hCPkuVw1B2CQmU/GCrkJHzooPOVw0Z9t46Zv3gTKaQGbD6oqL7RC2D
         66bd4smtFOCMEjKtbed2cZIdtoEzlRF7ReHC57rUAPC80UfoPeMvL4BCblM7GnDw0bx2
         BK70Pn8imSOerlWzOEYI3qN2WDyoTjL7Ws637qJJba7RHnPzIhmKNL1fWl+hZYFj4nG6
         MOXMA6WyR8icueuVg+A6XtzsyXUWSmYsXB7d2KSOiuI2IkzlpMQuUcBR+gjVEtw4ZJrQ
         EafdETQaavcko6AeX18Q1q7gex655fGLocIthvo8aC/+ngpvEXmcJgDqGcRupCRrnAjt
         npzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MpzUtMUX89uySI+KtJ+DC8nc5q6z0iQJ3DtHUJsSC4A=;
        b=RqR6qj94r4x4HMKaNLykjQskUoIeAWESMQYJGoHbhLmBQvM4vPb1nen4OHAnAYKtX3
         +IAYgXHZjfYtD614utfHpDRnbZqx8enDkmQ1EJV9OvyE7uW5sDNaBe+7MoJ9DC3Rbq6L
         jBXB2mnQOIQnHPYlPbUZXDdbVwkrOVWkr9sNrf165NwViE3D/+UEnA+QBuglLHpJQK3y
         e8od8zVNrM96Q5SMz6bfUihVp8ldO7nRCocRDcFmD2lKpiZTBi0Xr2RNgZifQ1rN8Vc/
         NPjw327eVweRfLS/Fot4/PpU0urYuwV4h4yx5N38wiFt5dhSldAYkEqbfc2DZtbQOcrq
         Puqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNRWI0dt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m83-20020a817156000000b0030c1c1f872esi40252348ywc.271.2022.07.04.06.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNRWI0dt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MH8-0005rh-5U
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lxo-0002Lz-C4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:18:13 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lxi-0002K1-3a
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:18:07 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31c8340a6f7so41018947b3.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpzUtMUX89uySI+KtJ+DC8nc5q6z0iQJ3DtHUJsSC4A=;
 b=qNRWI0dtTMkdhih55lrlvahhavcQPG7EGrUeW9/RnTu07idJTr/rMofFwIinZQ/So8
 GXGIUPDc0qy5EbsPqOyRi/7l9QZs8XUvNkef5lBpzA9pkKEspUr2Deefs92vMACB29x0
 1nlJb1M9SehQ8joRjQJdKLsLJkJ5shy4YgysvWDL115KI02QWkXQQQOaFL76vBW/RKjD
 GoJ3lPRM5/pcCer4mcUdhWZDwR/Sk1Mh56EWrq4KT6tAffQW+M8Wgz3NcDtWhMozJddm
 PX1NZ+ZSfThTbyXFzKNTZRXAJD3Y2NNaKl4pmYBYKUWjuCkeJe4rB3ALFo4WnYSIPeif
 b0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpzUtMUX89uySI+KtJ+DC8nc5q6z0iQJ3DtHUJsSC4A=;
 b=s+csR4Fgb4v1FW823Q+Crh5/H9kbcFD2395m4i/gMjo9HSlklIxfjO9P+SBIwqkX89
 DIyFFZvIUZrdM7Py3kABDQEsmvXIN0M0HsRR4L27IB07xJDatLQG2z1PDZZIYqtcNviz
 18O4XGFr4H8zSp5HIdnX1+1oY/Peid1lhTCPrDlPpNK8TKr8al7dUjHG4QFT1qjCLqYQ
 siM6hHMVjGexxZOive5mDWYlyrfUKOvnHuZBZ897O+jsedezgKqGnji3eFDGt4VBmIMe
 FKS2c8XVH5RQemD/qobXIaDnTx9QXbylWzySrF+IBnuKRrHDWEMUk2KuAdPtjJrmgPGL
 AfMw==
X-Gm-Message-State: AJIora/Op7LvV2mZQvLbCa9EHqv5VMfc09u03f7XR2idFWFY+fkSlg4w
 JtQRJI4hzdkjhrlY1LSCR7UOZCO01abx3eyAJdYaEQ==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr33798284ywb.257.1656940681097; Mon, 04
 Jul 2022 06:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-9-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-9-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:17:50 +0100
Message-ID: <CAFEAcA8_t670b+-DUL56gATbBgKJOyxKFEahC-2MuZ5dahkKfA@mail.gmail.com>
Subject: Re: [PATCH 08/40] pl050: introduce pl050_kbd_class_init() and
 pl050_kbd_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: JZhxI/CvFtcY

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new pl050_kbd_class_init() function containing a call to
> device_class_set_parent_realize() which calls a new pl050_kbd_realize()
> function to initialise the PS2 keyboard device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
