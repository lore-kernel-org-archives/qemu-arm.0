Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3247326lft;
        Mon, 4 Jul 2022 06:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1seOhnjNhFxzXf9jTKCWtuFia+qGRGRaboTjcyTOu0sXhW6IgCKSZkfbL6W5WTXnVkT+P3x
X-Received: by 2002:ad4:5b8a:0:b0:470:9844:82eb with SMTP id 10-20020ad45b8a000000b00470984482ebmr26978750qvp.80.1656943132619;
        Mon, 04 Jul 2022 06:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943132; cv=none;
        d=google.com; s=arc-20160816;
        b=MzVUy6KcjfgrIo2XZ9TGHb8xhCtH6m4mDvlB0SJ0dZz5DPr1brfynLMAvZiOCBsVGN
         uuVMcsXKTnYx2E9plXe96KaP5ou11SjO0E3bQHi5+mGlY/PajWCT4PHDPHyCNSAY518H
         wtpfMGjK35xaS6zTzHXCjCnb+j/Dtfa9HFj99smBOgtfXr7v4DolNdtnOF469ffOcYdp
         9IQgbvkTE65UZD+4D0sbDL+iap82dK+ShquUAL64cfBXQXXE/VJrxBSwzdRUuJN3B4VK
         3mgL1WiXLZLl7nCIK1Zk0A9Js6d8sN8AIkVOXZfcHo62mJAt3BYrafE79/hi/tCiNOgM
         6o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=efrjgripcFsAACtHvzZGNsTHJB472a4rEdOvpfwc+8E=;
        b=K6mwZACz8SJGkOYrcdi5o2MM08DU9gQP5cp1VjBZ/iscuqn3o75MxaiFF0cB5xvmi4
         goJYlZ73yjCJS46tB43H+vjXLROuRa4lKmqrCnwGB9ML0Er3BiXWBjO5x4rV31DUv0Bl
         8YPPTzlk0YgfEkttcFZcOfkQGsUxQT3BW41P5o18YfIEncD+cnITIpr/JFcSH+TXtbUk
         McfHvgMTwkN4hDPB2F7bo2FnKC+KYAhGpGzzT69UG4YEfEorYjAz1srMF2FG4PQefPrh
         tx8l8lEZwzppZ0CcJcjyy3NU4V1ZzvembLSpYOWccBbKvd1go1mVE8/ccxpeDGtIx82R
         HY8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oorzbj+Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de10-20020a05620a370a00b006a68fcaa6e2si1848445qkb.734.2022.07.04.06.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oorzbj+Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MbE-00084M-34
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5Z-00038Z-PF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:26:09 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5Y-0003eB-CA
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:26:09 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 64so7592450ybt.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efrjgripcFsAACtHvzZGNsTHJB472a4rEdOvpfwc+8E=;
 b=oorzbj+YZ5i+/traSVQGcN27kORhvt9vySP2WtJWStWgMy9uGYJGv6MIG3fGNhKiDP
 MpAzX4/9Jh/9QfAk/ZIsCkWKqV+Go/a4TgUSgOBiwTj8kRLOAA1+iexcVg0+jql9Ru4G
 FTTZ5FmhOqWdFSY2yVfSGvpZcVOquVxaa7OsdOSKG1lJzCHHsFwrR2PZvgXs8rU4pW1e
 W3omXXKj1HZ2XhjeSmj34aTazcPP96HNA4suxn3bQ9OWg/n2zsIG9QUHJ/Cbm7/dPW/c
 3VgP4DBTIRMdr+C7J0YzuamclbE6HVfiqqfRHEU5UosBIUxgp1qFp+kZhIBgf6SYH728
 KGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efrjgripcFsAACtHvzZGNsTHJB472a4rEdOvpfwc+8E=;
 b=fqxO5a/LhileCjV5DXpxkpCsN/YX5lq5rNHr/cnNR+1dBskstCBOqHxj5vjQiy9CtB
 UZ9Zfou65GnzEgR0b1zXIYq3x4AAX9arHvFvuueV4z+YgqqlatDiJs9YRBBmVm7ed6ps
 5tySrYkOhsY4C8fin5l0hcXw6UJEelVr1lXqRGtpWB+sFNabgnEbMSTN28Envi3dLby2
 mtI8ThgRMGeUV8KNw3coXmtw03N9jZj+l8r8n0ZiytzpR3BAUWWjqW7cyA2BTKhYQun/
 mPp6/HGzL/2+b44yuWPAbI9sQF/YdWOBlRhIpTG4xuka5jKYk0enXFs5EkJdGvsiOu6A
 GFAA==
X-Gm-Message-State: AJIora+DMjFLUnMAv7AeungAiTp0six6KzXbcaJC/wVw8pU3N1b9EWZV
 /YnjZKrnfF1CpwyTj4VswuF27pYZ8BkITcL/95g7Mw==
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr31275898ybr.288.1656941167474; Mon, 04
 Jul 2022 06:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-24-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-24-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:25:56 +0100
Message-ID: <CAFEAcA82pvbbgeDQ=3-+UbD0CGv9LGK=SK-YRAYKJMAeEizSoQ@mail.gmail.com>
Subject: Re: [PATCH 23/40] lasips2: rename LASIPS2Port irq field to birq
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Z8gIJs41wOFq

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The existing boolean irq field in LASIPS2Port will soon be replaced by a proper
> qemu_irq, so rename the field to birq to allow the upcoming qemu_irq to use the
> irq name.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
