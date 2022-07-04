Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3243895lft;
        Mon, 4 Jul 2022 06:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkZT+60qZ6lNwvoQvZOAaysHolOiyaPun+jJQOSWSfloSvFgk97qi5wS/EPd/15aC2uLlZ
X-Received: by 2002:a05:620a:4142:b0:6b2:69c2:3269 with SMTP id k2-20020a05620a414200b006b269c23269mr9210375qko.166.1656942743441;
        Mon, 04 Jul 2022 06:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942743; cv=none;
        d=google.com; s=arc-20160816;
        b=KB1OltRbWGw+BrFOe4XOhL6Tszi4sNYE9vFNDIv/tb5/pXZUIJkmJfEEyXvgrtbQJc
         YIgI8qgIp3DkRfPwoDVNFEzE4Y27IR2ZSqkX6gFC9695nWP2x0ro/u2XspGVAb6ciEc5
         X5R0rGF5evnKnfj+iMuS1k/qGleKWNwwnb7lN41rQaNd849TXtKnOZyR6gQNRJ7DMhnz
         00ewTPMfUxutoONtSmkbRlO4bPTxZedeRXxjZ5GQ8+54QxAjqHHqIdvVZTjRuIItsaOi
         0RRQW3dP9Ai8s0GDRUO4zidxbny08T5Rk54KnkajOjm6eGNqm4zGlVSTyZDz86WX0L9W
         Py2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Vtb9VkPWYR6r6f+UBOMNZXxvdH7+9eWEt2nmrPprnB0=;
        b=KgjyMLfIG5FblFyBzZeGZnipZVL8FxSvz55XxAdn8Gtff/hhJaT7GDDcQs0cPRgbq9
         oCtJmCsg3K2A6noLrRUztr4c3SjF4EIoSN6HZFhrHnaTsryFuBP1j7RDCfZm5pvlOzbc
         Qx6npMeifKYDceuWXFvuM2d1xWKZImb5yRfGMLnKf6zRliUOfNy+Db8fb4TSNE2IP1WQ
         VSWT/GnHlfOEwvIEggNASfeQ32MpGNfPkYpOXLjZ2tl7eXHTkPPv4A6A/lug/FfXoWUW
         kOGGla+f+czaBpKNvIGzSWabpAa2mZXB8jPKGlLhr8eS4J8qoWZVthzN3qZbDnSN+hI9
         KIjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFH+qUKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac87dca000000b0031bf69e15d5si12030860qte.311.2022.07.04.06.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFH+qUKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MUw-0004tl-V9
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M9J-00028W-Af
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:30:01 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M9H-00041t-Kf
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:30:01 -0400
Received: by mail-yb1-xb30.google.com with SMTP id 76so1306047ybd.0
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vtb9VkPWYR6r6f+UBOMNZXxvdH7+9eWEt2nmrPprnB0=;
 b=bFH+qUKKKVhwKQ5KXHLVUGuXqWw8iJSYrmxnycPxvkeBvijC4nTAbpZ8+TBRWQ4/tT
 Hapv9wvZz7cxUudTzFLRSR0SmQDz4/gp3BqSgV5RlduUH41M94d3/kHJJzwrCaReY9Vz
 7KBX9wMir9ID8gtZr8cwI3XdglRlKAielIpevZiyCs5GV/sgeOOHXpowIQUsgEf6mut0
 f/2KA/1NPQHmITWgiv8FKAh9k0cjXKkLxywNV3ui94IZ+EvoHmpTmZwCnUUfXc0KFngB
 pAyGli4D0qGmSsCBW7/bJoDwzhESJav5VgvvHumhx5viEf7ozs6MNDaOiy2WdyC0wEJ0
 D2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vtb9VkPWYR6r6f+UBOMNZXxvdH7+9eWEt2nmrPprnB0=;
 b=COmmnxHmnzBqFA4UPTd01LRCoMnChIyVY7O9GL7m6ViHjtozyKZrgzfgKQxjsuxxW5
 yZabWhJ2U38zQEfJjDkRui4qM3wRjhymiOpy7/1HqPAuOHM8Lp3Up6RmPBhPS5t1h40x
 6FMPSLXeIJUqkbi/YHUFUekC6nmD7Zle9z/vM0XKmV4e734QGBid0Hjt1kZAhe/Ws/4I
 As66vGwPQaeagZYtP7yu7W74Yr7Lg0pevg4Q/8c03vawRopIoevcD0rC7d7/KVkJzWrn
 zG6S8DXzT9dnjL9Q0MLxQ8mtyVjVKXM+NeZ1O8l+8Tn8hs/IYzX03A+cg91n+y0+i61J
 YI/w==
X-Gm-Message-State: AJIora8OB5WHGcvUGMEYYRngI3+qMPlmCZrxIReqfn+SxRUbM4eG2xbc
 IfeCSm5eqRLuhPetAxrkSXdjdNAblOyMmtkS1dfs5w==
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6207633ybu.479.1656941398620; Mon, 04
 Jul 2022 06:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-33-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-33-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:29:47 +0100
Message-ID: <CAFEAcA8=7LwPKw_PPJVMVn=JQK_sJWf2qOfOL6bV1Ju=ywMNnQ@mail.gmail.com>
Subject: Re: [PATCH 32/40] lasips2: don't use legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9TUFY8Zis7c

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 keyboard device within LASIPS2KbdPort using
> object_initialize_child() in lasips2_kbd_port_init() and realize it in
> lasips2_kbd_port_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
