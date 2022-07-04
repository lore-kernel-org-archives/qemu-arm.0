Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3244341lft;
        Mon, 4 Jul 2022 06:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tmbXji/RDwvX6nawA3jNG2XiN+WvSRRCe46og4mFUQYi6S+GMyhGnf2UHFvpsq2/9SnMxA
X-Received: by 2002:ac8:574f:0:b0:31d:4805:9ec0 with SMTP id 15-20020ac8574f000000b0031d48059ec0mr6391451qtx.5.1656942798720;
        Mon, 04 Jul 2022 06:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942798; cv=none;
        d=google.com; s=arc-20160816;
        b=dVi19jAE/YOBEIsO4VhujGBN0k+IjWRZUKtu4C4smckj36PluWYXYh2kDamrR7/Iyv
         vzjXwDFXl9lXBVXHhO7fQLhuI4coRNaOilsQgyLPGzqRLr5+4JvWzYNXCnwg/5FkIeT8
         dGfgA3momo5oIfsgNTpfMZjKf/aMwW1po0N1MDKHML6mj7r21sKHJneIj0LhIUlQCRLj
         V54C/L+RbzB/DH1WiJ/9kHUg3QoP5yf7FIncpYvvvFYMhfhfdkJE87/oEbgC+bkkKsZP
         vtN3NN1gXDf6zoIry+vHtS+Lt5KecRycs62Aq/k7vPjoHy7/hWaPkxWfrp/UIOo5fbgR
         TW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JNtBEk83itne9q7oSt+nYjES/HtK3AoV5jbfuSobWpY=;
        b=cohuQ5tf1+F6dIbOoNa3e/oAdLrMym08YjJrhtBdo8js6LOkOgcStmqHLsT9mxTQ5c
         RlrqtIAP0A8d25c6LnqZr70aVgbSW1nv1qWEeJpVjBwDNoDTyUbgywEIah1LBFKe4osD
         q7VTw0EinzR0r7Pvx3l3iqBw0KRmJEw43Fhys7FrenhHmtvl/6lsHJd4hGpz5h42rSFe
         rjT8dACwjhQaFFF2iUepJ+FHBkaXjnCmUBggzTf5NfOdv4KEoxKeCctM7s6tSrwpZaV8
         Mh/yGEYnmFTYZQqOs8ghOCTw5mkRmzo1MjwxyKHhJWBpRrJZa/C7lTViD9++QqdK4wRS
         xjcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lG/p5iSP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb27-20020a05622a481b00b0031e7b06edc3si789634qtb.751.2022.07.04.06.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lG/p5iSP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MVq-00079n-5y
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2F-0006X0-2H
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:22:43 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2D-000333-DD
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:22:42 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31cb2c649f7so7631147b3.11
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNtBEk83itne9q7oSt+nYjES/HtK3AoV5jbfuSobWpY=;
 b=lG/p5iSPwbHsA7b3ypjeKjJAfv71lRTgWxl7mKeCR+A8DVSTta55okBJ9gyf1aHsYs
 kpr1Js21+zos05O3pW/K9yvqTWMZQWKNuKlT52splWJIHF5qvZ8bOiyfzzzI7DveH9/8
 SvdZCFLrFy5tKXsfI36YFcLZAeniGnaUKQHsisgJbhn0Hlr4c0ZrIkcrGRO/34dkADAd
 QnE9ktyiq2g4gkYRUSDVypoQx98QlK8c7OpfkEDfgwhVdu0uitO1jL8vwshvKONoqyy3
 PZn3Vccb484XEgJZPliGDdpnvNVyx5cGKxTROZUafbMpNXWNtx6VQ4TcHQN2zce3RRYW
 O1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNtBEk83itne9q7oSt+nYjES/HtK3AoV5jbfuSobWpY=;
 b=VLCl5JGg+8qXj4o9+pGMcGgh6L1bndlJ9B6SpJ+HvWndTpaC61pscQlIj504VTas6w
 UYHXTFXOqHW160D2DL6/Zqp9VYfpLqKoaL/itUtZgKz+xZE+UYpAbeLi6cdqre+2tgp/
 rYUrWDsQvmS39iDLnQE0Zg9LY185IHFsu627C+feODeifI1b34KN0kArdEXtCTVdK06+
 hhQHMSYXyDy3inYR++sQWdNGF0X0Xp8cDqO/j1hWPYICW5nPCqNI4S2IB32c9sCbAj+H
 Tm2xS7iV61DwK3Fw987MmOWZP1E6vvGt4+y0igzCndGCML/r1MO0pWPP711VHHA8AxoG
 i4kQ==
X-Gm-Message-State: AJIora/lFgZUQgUWvCumbYiFxRJPeyAlhK3fQzcXA/LKLk0X6V8mAH0T
 zQ0j39XCQPgWtMk8YPd2pJnWLBOxDz8n7njueZK+vw==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr32677164ywb.10.1656940960481; Mon, 04
 Jul 2022 06:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-16-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-16-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:22:29 +0100
Message-ID: <CAFEAcA9+d9i9XWZNQu0oy6Vc4ovKTjHA1Nci5DkZYV3HHoFErw@mail.gmail.com>
Subject: Re: [PATCH 15/40] lasips2: change LASIPS2State dev pointer from void
 to PS2State
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
X-TUID: 0nO0riUf7lNH

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the compiler to enforce that the PS2 device pointer is always of
> type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
> this type change.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 16 ++++++++--------
>  include/hw/input/lasips2.h |  3 ++-
>  2 files changed, 10 insertions(+), 9 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
