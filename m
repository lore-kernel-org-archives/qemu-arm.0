Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp841113lfg;
        Mon, 25 Jul 2022 06:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDcwMX/CU6mCwoSpW+uWUs+KGRWX0ERvEMvPfpIu7Cbj11UgsEswdWb2grAEQR+wSFtK2d
X-Received: by 2002:ac8:5d8d:0:b0:31f:2838:4742 with SMTP id d13-20020ac85d8d000000b0031f28384742mr9465459qtx.533.1658754282291;
        Mon, 25 Jul 2022 06:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658754282; cv=none;
        d=google.com; s=arc-20160816;
        b=uJqVpqkTwMLfS70Ku85l94KcTtlClzctnhacrtgostGMvL4tX96cgaf2yxHRErurZQ
         meYsNyrPiGzd7aHyhzaXUXfqIxiSLCryEwwDqQv3UzFi8XNPae31CatnmqpNG3K6Tldc
         9ktzxoKscNkb7oZUC4N6dRy0qAb3fdwTkNGuQ0O5Va20oBdSiRPuYPcSMhcPEuzr6Cnp
         pqio+89JfC5zAcDplNn67U+kRno9VswCpR2h8a8DbsjPwvJyydzmjcHzODKtoMaoiO5/
         19dR5B+ORzTnGiKPDPqgtUIyA2PK0/+AObeaUkkMYptDS39es16lVi/yd44r7jWsTlkx
         /Elg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tjDXRmPf8hQtmla1dqHis+57C0Y7VxCvMTPZFieXnOw=;
        b=k49M3B2/N7l0bP/Uf8swr+F+724sZgIHMfgfL/qavBARB9Ig5jC66ozt6pFC2HXt/Q
         VLQRA4GyDu6OBMZvxWatInr+YFtCbe6Pi5uxPKbBhGgTupUtstVhFxNLjoWYD12i73mg
         FHI9zoSkZFPgIyXTxI5a2o0oYpGXt3LYYSLGwdhaSuc3qn/sq57mWweE7tObdtMP58iV
         34CORZGAP9uvo5Ghi1VQkhauv2M6fHSwnfQ7aOs+JBc4klxX0W+0eFl2MRezhzpSyfJj
         AdBDNRRhZnYuguPDsqQietQF4ktdaM2fJnkUJzN04pEpnLQ/T5tcDlBl9/x7N78q6IRK
         IwCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJ0Pjru1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020ac81e92000000b0031f33b8dd4fsi3174868qtm.429.2022.07.25.06.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 06:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJ0Pjru1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFxlJ-0005Wo-Pg
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 09:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFxl3-0005Te-FM
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 09:04:25 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFxl1-00068h-I5
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 09:04:25 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 75so19866991ybf.4
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tjDXRmPf8hQtmla1dqHis+57C0Y7VxCvMTPZFieXnOw=;
 b=AJ0Pjru1Hpr305aIg6IOP434WZLWXK7yIr8u0//sB1G9isDnriYi1zFcEbre5KtGAL
 FRJINe5eBDPM48REPyKaoVi3ftjF+tTK22Oymd/B/lYfiOhJGZjrA2Iz2sbUcPCEbwPE
 QqYdp43AsXhjDhHm+rPPQTWIzuS2qU6PqwGxZeHSZCPo/6c74GTRLjpCN7QmZwgtRMAX
 rW50yuON5DvKIuGmyK6w6squkRSPM7WOI6M8g2RQSp08tsfj8pmuZYVBYQcdmJzkihKb
 jmxNTlFOTTfvgGXaK71lIusgzecIOI0n1dGTBHuc0529L0xCJENgueQPXnz7QeA/TCMc
 0mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjDXRmPf8hQtmla1dqHis+57C0Y7VxCvMTPZFieXnOw=;
 b=DnSu0xG3FiFLQB8dBWbOA3w0B5EYzgUnoFcYXQKcBlaaS3l9RXvV2/whrFzruGaBOn
 RpHi3obNLyw8yfVx7N/IJKGbq5swFOH4/pAe/bPFXQ7QF6dpeFa/UPmaVXxcs/HCE8mu
 Le10RarchyCW6UpVWJVwrXivIWRmX7pf9zXs97C9PvX5XUzXr/I2Dz+jAauwpsAoruq0
 oEcHneOHBrky0G4ESFhwvkF0myPhhjU4IcmK7WrgvgJqh/If0MstIgZpaCtgEPcrO4Ph
 Ey/PAQmtKdWfGY5cg6Oc9lQuVe3AiUc37Wpe0hOfFvJK+xI9XlqCCXAD7Wbm8UkjcqSX
 Ux1w==
X-Gm-Message-State: AJIora9klzcxyywHUN/5C5dTRHYZ6pzU/CZzrCABOno79kTzlWnlLD4M
 Cv7cEkk/cPdxwi394MLUYR6ynt5qHb9wEhSqeZnpng==
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr8835003ybf.67.1658754261963; Mon, 25 Jul
 2022 06:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220723111228.8611-1-alanjian85@outlook.com>
In-Reply-To: <20220723111228.8611-1-alanjian85@outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 14:03:42 +0100
Message-ID: <CAFEAcA_7RU8KH7GJxmSx9qCB+nkFkw2hQKDtfSABFc5aXa-3Fg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: Fix framebuffer allocation address
To: alanjian85 <alanjian85@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 alanjian85 <alanjian85@outlook.com>
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
X-TUID: wdjvZttWQj7K

On Sat, 23 Jul 2022 at 12:15, alanjian85 <alanjian85@gmail.com> wrote:
>
> This patch fixes the dedicated framebuffer mailbox interface(marked as
> deprecated in official docs, but can still be fixed for emulation purposes)
> by removing unneeded offset to make it works like buffer allocate tag in
> bcm2835_property interface[1], some baremetal applications like the
> Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
> before this patch.
>
> [1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
> [2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html
>
> Signed-off-by: alanjian85 <alanjian85@outlook.com>

Thanks for this patch. Our submission rules require a full
personal name in the Signed-off-by line, not just a username.
We can't take the patch without this, I'm afraid.

> ---
>  hw/display/bcm2835_fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Is there any difference between this patch and the one you
sent a few days previously?

https://patchew.org/QEMU/20220721081544.38228-1-alanjian85@outlook.com/

Generally if you're sending an updated version of patch it's helpful
to mark it as "[PATCH v2]" or whatever, and to include a note below
the '---' line that says what the changes are.

thanks
-- PMM
