Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp925913lfj;
        Thu, 5 May 2022 02:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypFQrEN5G9dQIcLtW005WgwM+xXQnR2jD4LmEiEx8UZuRO9aGcXhRn1kSaj20qcICb2okY
X-Received: by 2002:ac8:5c15:0:b0:2f3:ab24:ee75 with SMTP id i21-20020ac85c15000000b002f3ab24ee75mr13936133qti.67.1651742622060;
        Thu, 05 May 2022 02:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651742622; cv=none;
        d=google.com; s=arc-20160816;
        b=alt+4Z/4TGu4nbgcohyf+ntXF05e0A0YVRG8JNs7eOHLx0pTOjhFYI7tTvEGFrJSvQ
         AndUpyHLJUl5pX8IVWy06YAh92u3CZNhY5sOnLJu0H44cA9Ezw85MNAG7Ba6j6Hf8EdJ
         H+h81YFCBAeNTQIOhxiL8JS1dkG3AaNQFp5ErliJNxe7qpdL7HK1mjPucMNrNtWyTj3x
         13LX8bLSFhrwynbdiKPNydWstJpoW9m+cXz8PcA1kGZOdqeQZBuvUZyqsaBa5GklOy4l
         449w0fqM9gFuJuVhnaasc6W+87F1p4OJNFJzfsMl9sarXXRFUSXQ++quAJJqB5drburC
         d2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dL/QsWv7q5XTwqFVsDvB5a6hvdAQ0EDvv5rOFpybfw0=;
        b=PUl9HoARuHSWQ0HjOZ2O/rWbi0rV6xfTj0+SuB+eOG2qlS5ny+epISeGuIeh1V47ji
         5JM0RYzFAyYY7zUGE8Mnq4nlomFBXVq5SNDfyXAnqE9fbjTq8cFQ1cFI3fEBm20UWtjC
         s09hl4hOYcqkw5IC9zMf+lktwNyZw9UWU50hnfHffibbXnx/ZUq4PMHqhoccmVDTtbsW
         Va+YEppQDPXe3PjaZ3cb7NRWJS2rSiuU/H3dncYS94Pekew12g4tJ1l5Tb/EB2PH8Tpk
         R+0+XdubXys9cFRPh5UniJQW0L7jeJAJ8GrNF4l/nJToDwjdVcOs2xhrwi0xpAhTvtMn
         9YWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poJrxCjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05622a190c00b002f38bf9e02dsi486977qtc.578.2022.05.05.02.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 02:23:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poJrxCjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmXi1-0002Bw-Hf
	for alex.bennee@linaro.org; Thu, 05 May 2022 05:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmX2I-0008IS-N0
 for qemu-arm@nongnu.org; Thu, 05 May 2022 04:40:34 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmX2F-0004oX-G9
 for qemu-arm@nongnu.org; Thu, 05 May 2022 04:40:33 -0400
Received: by mail-yb1-xb29.google.com with SMTP id w187so6468020ybe.2
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dL/QsWv7q5XTwqFVsDvB5a6hvdAQ0EDvv5rOFpybfw0=;
 b=poJrxCjmIIMOi4gCIYg3/JZaRXbyylfTq9OL8CUNPe6Ydbg7NLlH7/eZiBOjKNJalw
 jGStgv7qqxF8nqwIw8T2pZBff0KER+hH4+VeXCfw2o2lq/678mRcGBWfzNV1P/A9ai8X
 SRv/giNB123BwNLFqJlM5EysayLkSGOYpZpaoj0pAgto0Fv/YY3D3Ev64LSoaEgmiB0s
 qJ6gFQC2JeQOdAQ5YjSfbtQRDfNPWFechwuv36pIb9qTe6h7JxK9CfMHc2NMfmqGD6Kh
 ktGkIOvQXnBlq/B8a7TwQLqJ11wyQqUZUkDdHkQOfieDsvL5yPOn4njXvXQAA5Pj00IO
 fQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dL/QsWv7q5XTwqFVsDvB5a6hvdAQ0EDvv5rOFpybfw0=;
 b=p47U3o2nl8xERj/g39uKZdFshE20t7TCspZX/1BroU7f40P9/JFTKCBz9Jg4TU2JBS
 CzXXpP5NTjvy5B5UTwZA7PgyMr/M+W6ZORl2q6biT+ALGg8++Aqj6SDKPsN0nFQru9Qc
 bqxcJV/m1Ehk+R/wuQTjdeRh5psVDg+K/WQZiPBb569iHpxgn+yVHub2gNxYG9AkTqXb
 CH8bIWb30sTs0gzgyyqko0bR3DNV2HQSDKE48yeXkhOAKrTJt01UsavcJfnYVkCk1IC5
 wk/k+jEVLeO8bUHTXbXaWMgdtgaGqdceASVTcumTZRwOLXBooX8Ms6njtV/5ZNhmAaCP
 H7JA==
X-Gm-Message-State: AOAM530ztlfKgMHNEU5IpATVNr6kSlv1V5pqBrlE/LFC1NoAlURq0o2f
 SKx/JOCQE9eLej2yydy6MMnzP+f50kxyM+l35xMyFg==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr20091156yba.193.1651740030511; Thu, 05
 May 2022 01:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
In-Reply-To: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:40:19 +0100
Message-ID: <CAFEAcA-8Awh2jbKTBCig7C-oAfVhs3iuP3E6EzkW=DVAKSZ0=A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: virt: Add SBSA watchdog
To: Jan Kiszka <jan.kiszka@web.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-TUID: is6IZsgBZMDB

On Sun, 1 May 2022 at 19:07, Jan Kiszka <jan.kiszka@web.de> wrote:
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The virt machine lacks a watchdog so far while the sbsa-ref has a simple
> model that is also supported by Linux and even U-Boot. Let's take it to
> allow, e.g., system integration tests of A/B software update under
> watchdog monitoring.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

The virt board has a PCI bus, and QEMU has a model of a
PCI watchdog device -- the i6300esb. Can you use that?

In general I much prefer it if we can support use cases in
virt via pluggable PCI devices rather than hard-wired MMIO
devices -- it means that only users who want the functionality
need to have the exposed attack surface area of the device
present in their VM.

thanks
-- PMM
