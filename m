Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp88295njk;
        Thu, 20 Feb 2025 06:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUy06EZUy69f6dShmHBigY/TCNNbJiLHg18Ekw91JwGu7gLkSEmaZJwLbjrW1rcyVkDkVqS3rtKr00wyw==@linaro.org
X-Google-Smtp-Source: AGHT+IGTDz5ZsWaxj1PFXQJjvvAtxxaZj5fm/KSVaSezri/jnBuNqtn0qirJ5fPoNlZFGiq3e1U9
X-Received: by 2002:a05:600c:1d1e:b0:439:60ef:ce94 with SMTP id 5b1f17b1804b1-43999dd1193mr66574795e9.21.1740060613248;
        Thu, 20 Feb 2025 06:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740060613; cv=none;
        d=google.com; s=arc-20240605;
        b=iQ/1nLiVMBac2rvOAQsh3k/Mv51vC4cGnQGxQ+EnnDpNiAsGzLg2KXcTtiduaKIIzD
         BP8z8NaFq/7w4bSGCfw955hWmNwo8DZjgxV5FUrUIp64+mrO2M461CaUmrdbb5wC8SlX
         S/Cure9l1NyUjBgQ/hAO5eW4B+TenIwKonVuNht97EeSCDGxj5+PhU4SMbB4y/Sx8H4s
         ostgnwvWprhmkBcYHVSuC4jg7Hmh0k4MG8abXQfqpzQh9i9UGlOafx3y0J7Wcyac2+sI
         wN/yxQc8aoPYc5KtZj3OM4YuGAsKsUKJWdy8yx97f75B6I7PtCKnActF7ddCSTfFryFw
         xrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UIZshvD68i6YUVum3s1elgKpBgGDILDeQgleIfXIgtk=;
        fh=rPQXZHeh96yxgz2TTZvoOmb243JXXC1x42IWQF0HLGQ=;
        b=DASqmoR/cJroPbGZUMu5CKaAQhv2aDo+5ELJCneM97zT3/ARzCY5/MrW0yjMvEPpum
         f0fUWXoIy75YTbchQw9p2c9b98n7ASLae2dzR7c2vYLqIdaywgBzi0wtfB3rx5s4yKb8
         xl6OLSdMNBYIYErh7plsAb+ZxWK7dyKrmD2C47Cp1Y0+1KztbMM9bN7bH2mpC/67WibL
         3WGXXV2UpR4QF6OUfyjLJkI5F+hEW+VADwLTuUTZqcswgUv++39+602DePaLXjtLIC9K
         GrkakqpHgptUUJQHnt1KXoP0L5prOd+fO9/pQIFiy0FakR/FfipWmQVMPCqW/ChmwHs/
         BEZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svraJXh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-439938d3dc6si43046965e9.171.2025.02.20.06.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 06:10:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svraJXh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl7FK-0005fp-Ry; Thu, 20 Feb 2025 09:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl7FI-0005fN-Ho
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 09:09:45 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl7FG-0004EK-Ii
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 09:09:44 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6fb6c36ba25so8790117b3.1
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 06:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740060581; x=1740665381; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UIZshvD68i6YUVum3s1elgKpBgGDILDeQgleIfXIgtk=;
 b=svraJXh9Vr+kJZidYyWnejLkHBSCF4y1qPPEXQKs3vvqhuW1kWCNX+ZXRujfDC54i7
 AQdEZufuFd1Vpe6BJLAKSVLtxiUzlUBCejicoeY+yC7fCx5o9A0bEST5RrCqgR23RXqY
 fgDuDD/GImiYbSK4dtlfUEqdVhzhz5PDs84rFM02G+iQXNhnGF7HLRJpXseYXwDa+Rdn
 Oy1v/iSrvvYwhOo7HqgBRGBD0qktmizfRsUYpUgLhCgxYHipcav19L8CDNY+sQIDi8PZ
 5LbsFTbyH3l+Hv8MQrxK1XdxTVuBxZBNj1xmXJF5HX6OXZxdD188AFTKSfzwq0I7azVB
 727A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740060581; x=1740665381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIZshvD68i6YUVum3s1elgKpBgGDILDeQgleIfXIgtk=;
 b=Iq7enjhHrGGL+Cda2/yiuIZXfkrspC9TVM9VybOmbBDBERCF/jt0JAYs1/vbFAPiTB
 8aS+cGKkkDUVONsDIsTohiJw7LI5rkQ01nfiyzjD5wOZg167XqZrIv60nUPPTEmKIVIK
 +qigWAMn4KbQvC+EzYd+zMRs49235xwyw4+/pC97IOiInaavq6phvrHnXevcGDoxd2ri
 LcG0I/9spGhsa/0cE9gRjsG1cDBfQcqBWySF/+HzQh4rhsZrY44WGGYB/qEipdGIgiLW
 QZGN+EK45UI0v/cCJ2kjsoMfEv7R3Xjhvq8MoHSGTYqctxcRl7/JDoL9YbBqcHBEM9il
 QJ9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjkMksL2f7nFlNnCzE2dElQ6GgUvP6YR+0/9bM7HY/P9UOFnlbsGe5jKyZGVyUGOuw9W63Nhjaig==@nongnu.org
X-Gm-Message-State: AOJu0Yz/OOc7HA4cyGoxFBK/IkMCVkF9ywAJH5XOtKCKhNgj4zl6IS+O
 Drf+CdQZ16Lsoc6mQzxNcrYGP672gKfqD+2v8Yg7WejyJgg5FW6yU3YWCig7BI/hvWP/fP/emYs
 J0p8oC+SXJgbA3F3TETRfib4UTzDS6vOyRnFJFg==
X-Gm-Gg: ASbGncvzitMJ3Fg3tJDMO8UvOBqZWJSM6k0bWc/mDqdwZLRCUVYS9f84L8zv0OWgemx
 bXs3UI/mpjga1h8rxuwWjKcT3ab4RMLPtW/uMa26h8g4oXgdPnJ/eXKHNw3CXlO7+pahYrYpwiw
 ==
X-Received: by 2002:a05:690c:630f:b0:6fb:a251:2450 with SMTP id
 00721157ae682-6fbb78f8026mr28349537b3.1.1740060580969; Thu, 20 Feb 2025
 06:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20250209103604.29545-1-shentey@gmail.com>
In-Reply-To: <20250209103604.29545-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 14:09:29 +0000
X-Gm-Features: AWEUYZlFlf1hUAcZI1NRD35GD7_3yphfZhQCUZ67plEEHBq8rKZ3O7hGlTEnAa8
Message-ID: <CAFEAcA-PGTAQhmktPmMvAjkL8S7UDhEp2+edwiLJT0f_xe=8ZQ@mail.gmail.com>
Subject: Re: [PATCH] Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mXldefhxLIWV

On Sun, 9 Feb 2025 at 10:36, Bernhard Beschow <shentey@gmail.com> wrote:
>
> TYPE_CHIPIDEA models an IP block which is also used in TYPE_ZYNQ_MACHINE which
> itself is not an IMX device. CONFIG_ZYNQ selects CONFIG_USB_EHCI_SYSBUS while
> TYPE_CHIPIDEA is a separate compilation unit, so only works by accident if
> CONFIG_IMX is given. Fix that by extracting CONFIG_USB_CHIPIDEA from CONFIG_IMX.
>
> Fixes: 616ec12d0fcc "hw/arm/xilinx_zynq: Fix USB port instantiation"
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> cc: qemu-stable



Applied to target-arm.next, thanks.

-- PMM
