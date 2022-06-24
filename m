Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp396866lft;
        Fri, 24 Jun 2022 08:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tx99y0/9wW5HKYNb4EiGWzhz8tpfdZ0lKyHDx5iVG2/iNEdwFJKu1UHHEi4UTZTwS4Ge1k
X-Received: by 2002:a05:620a:2e5:b0:6ae:e586:c5bf with SMTP id a5-20020a05620a02e500b006aee586c5bfmr9862881qko.666.1656083634316;
        Fri, 24 Jun 2022 08:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083634; cv=none;
        d=google.com; s=arc-20160816;
        b=wxypWG9M9mWmiJ12QEyX0zP/YT++QsgvNLuPp/c23y71+LvbmqVoy4rYde3wMUvGSi
         tf1t2qQrfuPRFMOm79hBncpZm68++FYtps7KElYS91N2HB5EC3XtX7z79mR6jR/FLC4Z
         mDKpbxsuvnfoAWIPTT2g9W0jxxH6e2gVJmrKdLTXwlkO7P83B6LjeJ0sUG+IdKlPVQed
         BxxqbGeZrvHN84c2seIosdIGcemLaqCeLwzz5GJGqOIiKQ4s7ZlxefZhQatiTJ8MbJtK
         bX8rYw9W2UbbZZ63cZXRXcpZY/McsR22AZWFphs8L87IFwkzxcCv5HTKDqALJfxtIxu6
         cZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IIljhw194tD76+dja0EDQpcDBK6couYZx3Bii8T55V8=;
        b=oQWvFXccxz/UIEL76CEemE1P5s8A155bQMPhKzAOdpxe5gULcdZtMF3sxzFRfoZOe5
         tWZddqjPz+cgwHHX++Ez7hczl2/InXoxw9aYoKSCUVFeTF21AAJ1tIyhSrZ6CMd9xc+N
         T5mxyN6USO81LusleqlTLMfFZycbMHK+PXKXyNzBXD4nNw4+UI12Nbtl3pl+0KQMsN1/
         zs2HCZ0JEq2Jc04mpC9vUeD9wZbjgIRb13blqsj4jjewAPiTdTYjkgn/tEqf6WhlZDVe
         V9aG+GWxmzaubNknCXATjaEbD3PRhDWK3XJq622XhnOycriUNa280+NVBuupgOKf0/fm
         QThw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x3UZ0P3H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge5-20020a05621427c500b0046ea2a3f976si1452993qvb.318.2022.06.24.08.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x3UZ0P3H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4l0L-00020z-Qy
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ky3-0006aa-LD
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:11:31 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ky2-0003oN-0m
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:11:31 -0400
Received: by mail-yb1-xb30.google.com with SMTP id d5so5001247yba.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IIljhw194tD76+dja0EDQpcDBK6couYZx3Bii8T55V8=;
 b=x3UZ0P3H/w88yuTmr50ojXAUkm4DOc173Nu3IqUuneNLyrO+ShZPRJwitOxN5jmlMH
 NE6A1nYrqMTU+GsJpVXT5Vh1+rd/sRoICIC+QaPTaAJQvLEH4WZO+iOQ/MV0IhB5cLis
 XRgSLlBQDvythlmAsVMgbLZeRDeurT5B+kCX/xSDl3G8YvnN3Ge3jpdIg4bPKdaJlBvn
 4TrVBKcOp9qdYSEO6G9P1bqyaVEgbd0nqJA4OSoFaXmZvlDicX4n7R1DXxJ2xQsYN6Bl
 rza4rPQXhpKX0DULVTkqI7cCCN0bgKTf8MuRlkr2v4LTocBOvrX2H65zVKeBgh4dLveZ
 zoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIljhw194tD76+dja0EDQpcDBK6couYZx3Bii8T55V8=;
 b=Jr4qFJ1pLP9uHik3+frXUR2AkVTbs2dqX5zZUW9UUMtJPZEpaeqX18qC4XNhYa7Rjk
 c//vTP0OpgZT9Qk5WCMzFAxEx9W+UkvXONeLqoI6kVAJ7tc5adt36nNBV80VNTkelYtf
 4Js/fBjSJbRNwFxhQveZFpbgqdohmgpyygxA5oecKHIAgCFKD+4oyCp4s1MgDMV1bmAB
 Rb/pnk5IPusJ49U7SmA7OKdBtzK4WaDKs1phxXco4dPNB6S7T43pKvM60LpIfvFr13zy
 R7c0bcPQwqlOVBOjkgjCpw3WL7M3bEnXdo782qokLVkGgG1158sfDNCohN9O79zgZLJR
 qwLw==
X-Gm-Message-State: AJIora/EFMgCP5vqSbFO6TVbOboYbgex6y3gjmZAqf210qfBauUw0KLO
 GY1wIypJSP8LRJfotn3Q2OFU5HdMxowLOpSgiaWudg==
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr5556823ybc.85.1656083488681; Fri, 24
 Jun 2022 08:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-48-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-48-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:10:51 +0100
Message-ID: <CAFEAcA9ZR2hje3+L3Eye6YTx2rXq6kWFQEjLuSXQ0spfo78Ctg@mail.gmail.com>
Subject: Re: [PATCH v2 47/54] lasips2: switch over from update_irq() function
 to PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: L/BcVOEnPeyT

On Fri, 24 Jun 2022 at 14:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Add a qdev gpio input in lasips2_init() by taking the existing lasips2_port_set_irq()
> function, updating it accordingly and then renaming to lasips2_set_irq(). Use these
> new qdev gpio inputs to wire up the PS2 keyboard and mouse devices.
>
> At the same time set update_irq() and update_arg to NULL in ps2_kbd_init() and
> ps2_mouse_init() to ensure that any accidental attempt to use the legacy update_irq()
> function will cause a NULL pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
