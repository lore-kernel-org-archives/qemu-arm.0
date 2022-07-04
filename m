Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3186863lft;
        Mon, 4 Jul 2022 05:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t09yfD2LX4asdrOZ4y3DI6lrDblh2eLF5LoRdV9qwdc1Dl2JeCzOJaKh1HhHEVv0OU4VtL
X-Received: by 2002:a25:c054:0:b0:66e:3316:d9f1 with SMTP id c81-20020a25c054000000b0066e3316d9f1mr9838578ybf.471.1656937669767;
        Mon, 04 Jul 2022 05:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656937669; cv=none;
        d=google.com; s=arc-20160816;
        b=QjbUekseu93UY+SXpPntbz7Idqz5S2cUH/PoJCiXYfEMMG9A5BUlKIiR3ntvnUzH0U
         bGST3r0b/ElTVAHVbLebN71hWN+tukHsiFGAm7GPVAYjlaAdpUKqJdPEmR7kInL5qKSO
         AHlZ8ONr0GfSX8BcRmI28BELnM7eFFin5cPPdPUKiw0+R5ZHGbPNYJlLqvjcwcAyiggU
         AOhPUycsHRibW7YOhL0ogn3i00mUGMc9UkpVDmdMRqMmSB4KQzCx9HFjHTAagpbb6s5K
         Rfb5IQga5ARHBR3zdmyOVv0FiEidRHCmEfUCcUC+jpriusB4TDuuRgXqyorG2K4B2d8j
         A8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tGb02hN6ii/ivdCUeNvP+CM/gzb82k3rXL/wSXmccvM=;
        b=MSL/gWJqx8RsEKlVoEhk2s0IfDcsM/Xh49bMqxQQxlm8pJ6skrY/LCMc7hS6V3woNE
         3v0fmJX6l6AhyEQIstcY488kdRpgdswBc3zz4R7KOmaVoJAlsZsCbnTbilyzXX+AndTW
         Fju+KLqaCpnbSTrwIrhyXCtOaQDltuM04+QK6r+QTWbPu60PH8Tzj+rkTn/cz0pd2FS4
         NE4f0KT1T0O9dW9K7OOmYj+TDz3NHXPXqvD8+krMuMd+gkutJJ8Rgbx+iXXJ/YzezKSE
         d1JsyitoCkWb4k7kGDBeQqBw+MZcAl8kopyg8egxtaOORIFS+udO1l56Rs+japX10IA5
         TD5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k0Rh3CUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i124-20020a255482000000b0066c9640778bsi31725150ybb.520.2022.07.04.05.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k0Rh3CUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8LB7-0000O1-5y
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L5Q-0001iK-4S
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:21:56 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L5O-0000NA-7s
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:21:55 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31c8bb90d09so26621797b3.8
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tGb02hN6ii/ivdCUeNvP+CM/gzb82k3rXL/wSXmccvM=;
 b=k0Rh3CUtmnaLn7f20HPKsIWJ+b2DYkZFe85nPAiIvd7K50it7ODJ3V+hUxIoCCuxOK
 8Q2Wms6Cc690GJ7rcFSApVwg/afEWNULaemYGXIJLaEA/DjmQlYon5Ae+Wmt+Fg8zUDo
 ZaOdwP0WAGwiylybfJISHe8tCLAUjzDVW4AKUccl/rfj9vsF/vZ+yMwlTPeLiX4IojGA
 jeiHIXYtTsnpUN0zH7ysHy4MD8Lgiw2/TY5gaudf3PNWe6I7ihAgdlz8PJQCfLuLW5Jz
 XusTnwyOUoGdl3woOebJbGGxN3EbBORiGOod4L14K7urQNsOK7t9C1KpZEy1nbM2JpH1
 o8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tGb02hN6ii/ivdCUeNvP+CM/gzb82k3rXL/wSXmccvM=;
 b=FsG2MZb+jse8p+dGjxWgdDs6Go4hdq85nQ/g9FPG37glYoKOYObX6SRnLEt3drla7l
 mJhg/EhNedHygUrOL1oX8Y+tBLg+iS7qiTbtMdSYgnEZBvaOu5qBNYvfFZAbtcz+1Q2c
 IB+QvhK+BYmcK6q9fKugvFCv8XyKXXCCTkzpfyhxM87KlBW9F1snxtyYu7kaCnXK9kBh
 nMCc/us/h0Ex5Ne29APZGmJvAxICgWz6Ye8JXBaGDkrOfixdZCQQUYYpAZdYPjihX5c9
 wD4Z00W62yiqvUF2LnLuZs2rWr81q9puDunUHbREcsq0I6zNUOHjrQxHkIhzo9ozaQB8
 OfvA==
X-Gm-Message-State: AJIora/Zv1jCTs2YbilFCc5M8BPa7xNUEVMfJM+9W7bh5CLUMIDmE0iZ
 7e2fi3pXwmsMtG6EtG4mRAQYELBbJu62yLSeWfLMzVqBbxY=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr33501471ywb.257.1656937312455; Mon, 04
 Jul 2022 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-44-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:21:41 +0100
Message-ID: <CAFEAcA_fxoGGa8w0nOcB4Z1uaDK8xSuVGrwgE-McCBWhF56aww@mail.gmail.com>
Subject: Re: [PATCH v4 43/45] target/arm: Only set ZEN in reset if SVE present
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: WsfbVGWSwwmG

On Tue, 28 Jun 2022 at 06:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There's no reason to set CPACR_EL1.ZEN if SVE disabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
