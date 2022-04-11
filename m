Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1755561lfq;
        Mon, 11 Apr 2022 09:45:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHPjUmhNy1E/tXGi2v73lGXVt/LRKadpQgbsQ8PILDEjDqfgQW0IgQe3PXWkOgkpYQgD2n
X-Received: by 2002:a5b:b4e:0:b0:641:6e61:ca2e with SMTP id b14-20020a5b0b4e000000b006416e61ca2emr2626684ybr.448.1649695512413;
        Mon, 11 Apr 2022 09:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649695512; cv=none;
        d=google.com; s=arc-20160816;
        b=A9rE209MOBIAJuyGF9WN6v0A0OkiKLRP1lBQFlqZ8TE+XA+9ltw4XOyi9k63s9f1t7
         pVSGpMYfYbP+AK7Yjya0TMrZkn2CxbEA0ocOG667x15ixQl09Q0wjqAoDjlq3sAVx/K6
         z12OmN60xSrpwBtL6wdxTJB8XKX5GrwqfF1IbzaDtskQxEbtmvjpeGebuGMJMbTqcaRr
         XjZbTGd5I75yd1rzYupPUMADvs9AdwR+qgYvzME9f0b+y/Om78ApmfTSx7nbKX8DCLKQ
         F9bQTIcE9pCrtPAia+y70uB8t5xgtZPJro5fUnfLM1CvW84og82ImUHtq9Z0ddQRSDxd
         Qr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9cJN4QBG+VOBSEw0DcH5QWMFxSW4ZEr+daVJ5qfJkQ=;
        b=dTLYgawWCBiTzK6trhGM6q0XFuDOZXYTnjsBJjTntpS+Y382pw3qnXJx8yXqo/2w/y
         3VAjRmOzEKvFoi7Q+anfVeK3ih0hn1USOhw8ex2MeCBBS7L7vcifRsl7b1EqA5ppAMja
         OioShCABF3TuVmCbtM2sGBtX9IIDTraRgiMEAa2iuCkQLIAZlKcpodMRO2BX+u28pExw
         3nYE3n0pzQmzW/v8GzefeXLwdtIZe1TaZcYnnh7ZARJQjauQFPMve6suNejDJOEdieO9
         XK7svBhJ6NGvf+u3uoRbSYwTUAC+0amzcG4jg8i+XPdi5j9sLxNyQZeRZ+1y6p3U5sq1
         +Wpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cXQnGPu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 131-20020a251089000000b006339940465csi4086075ybq.710.2022.04.11.09.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cXQnGPu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndxA7-0003AH-Qm
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx9g-0002bz-Oz
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:44:44 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:44442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx9f-000272-77
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:44:44 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2eafabbc80aso171931367b3.11
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k9cJN4QBG+VOBSEw0DcH5QWMFxSW4ZEr+daVJ5qfJkQ=;
 b=cXQnGPu/mgUZkt5EtPfD1iBF80a4R15md9R74JH5myFdLixpFrpuvLgO0OhtiZO2uD
 8EGUSBUcoFkrmWnFknpRKSzTmXzz3daVsXfnAoQ5MQ/me/Ef1lRfeTIEq+Rjqpx4wluh
 jrcwLhnBy3rTPZj5eDsQp/S5rbhKiYUYMxYjTGT4TGuomiMqzOYmvQTrDYDFeK2kcl69
 Ju+FcCk3Irv0ydQlaf22NtFCAlvVmroduAniRDfBsTHqgsZzmP3aMJjbcE7aRV3egeqz
 4mHn2u3YznoLdhVTud0Myz4ZV2jgyRc0LSEjWsb0nVnhp8FZ5Yo2SDLVczN4Ie41bu0H
 ZQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k9cJN4QBG+VOBSEw0DcH5QWMFxSW4ZEr+daVJ5qfJkQ=;
 b=WpCCJpzgd4AYWPwQIImQOPkXcGRn5tk218cTO/ARDYkL/dcTrVgy607PRHPB+jwxYA
 Ai9EOv13SVA9tSQBw0XJH+nnfukfsBhA/jCdQDB6O+nnauRfFLZHy5bDovs7g2M6NQRh
 HrcGyWLm27rXFtLh7Vdqw5kbO7RvoW35J3iDdCrJLjT32r4RPyrDRD64gbLgVQAD9SxV
 +ZatmeTQ6RJZuHltW28K0OywWDfjJM5aM9wDPi7QHIO+ainkItdmdvy3kpeUptOiRbS8
 GM+1wmsgijFB89R+KgVE/XQ1dhQmjZldY/10C3x20n2XWsCZApJ8EHiSu3rrF0NmHJXT
 L8Lw==
X-Gm-Message-State: AOAM531AlAss8McMuWhw/97gsvm1kgmNWou9hQBUDNo0tIyp8/TJOSB2
 ov//rXY2rLgiWdmt3f8HTe7R1xmCBQFGItpbfadFq2gp2N0=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr17437431ywc.64.1649695482197; Mon, 11
 Apr 2022 09:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-6-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:44:31 +0100
Message-ID: <CAFEAcA_VYCDp3cF_XXfc-oWeM0WTqRJw63075Af8APF3SjQgdg@mail.gmail.com>
Subject: Re: [PATCH 5/7] target/arm: Enable FEAT_DGH for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oPwNYvAVhJA0

On Sun, 10 Apr 2022 at 07:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns not merging memory access, which TCG does
> not implement.  Thus we can trivially enable this feature.
> Add a comment to handle_hint for the DGH instruction, but no code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
