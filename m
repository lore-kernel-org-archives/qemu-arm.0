Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3914976ejc;
        Tue, 17 Oct 2023 06:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfW6guuknfCHvw35fJMiejSsc+NNopM3SkYomygBElgtzpt2fLv8f2P6wC5N9YYJ8MPN2j
X-Received: by 2002:a05:620a:2983:b0:774:193c:94bd with SMTP id r3-20020a05620a298300b00774193c94bdmr2620548qkp.4.1697548755532;
        Tue, 17 Oct 2023 06:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697548755; cv=none;
        d=google.com; s=arc-20160816;
        b=f6vafk9YUC11bHRGS0goxZiM4boyyf2faJeVqyl08qUDwMa8wfjJZlWEwyuzmvJBZX
         sljqxt+4ziYpdpjrDMw6ORwIihXqMyMOI3CNY0DTROk7ZiU+a2woApSBpMx4pff9BwdM
         ia4aLVTuH8l/EXKE4nehQops4fz1oIKNiCOIwVuNd63bgs6j3cwqIzgJC7uOa2qEsCrm
         y1KxYXGsXGuhCus/9jzGqIVJ2o4LcB82ID0AcYAoDR1rtnqWLBsqLTq8XmL1gFRu/hUH
         xVgP4gMDbqtU7kmLB2BqE7ezT0yS706daoUF/R0pUOLQL1b+AQZNNihd7eWd5VW6KYXn
         /bNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TV3do35AYxXbSAgiBkVm5/JXEuDeVl43xHLj4t+2gX4=;
        fh=i/6J6MpUXzG3Ka4AJYcNnAxeV60VYz+qRvqjD4BOcH4=;
        b=MtWSDY3JFl9/55tLJZiQG65e1x6Ue2hT1ebw1r9FI8GzBpFxpe9kSvRKVOxdHHevPZ
         pgYmXM8/73sJy3iFpzy2ac+Pj3TWqF2jhZM17c90ttR2p47ZPZwZgiEjlB2hW02HWCY8
         dYwPWS0xsHPa8C39PoYpZA3Y0dxWcQUrNW/8iK9F08taIaT/Tv2WuPGDg3ZxODct2Q1m
         V3CFXjLGCvy8YIDQVQtLKPrL5czAUZzMq5T55LnWUNUfi0kbmvf3RmOG/dnfeNAzH/KD
         R4KmNl5Vi9XK71J7q5Goao4DmfoQrAftPe4MQjXNtBgK61hedgM4rtimimipzbzaXo9B
         GeDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6l3hUFq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a29c900b0077435bc2ec2si1025512qkp.397.2023.10.17.06.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 06:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6l3hUFq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjyP-0006Rh-3j; Tue, 17 Oct 2023 09:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsjyN-0006Kq-Dq
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:18:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsjyG-0007Zg-1V
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:18:57 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so9488400a12.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697548729; x=1698153529; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TV3do35AYxXbSAgiBkVm5/JXEuDeVl43xHLj4t+2gX4=;
 b=X6l3hUFq8mzRQRYWXziK0hl7dw+hXyGLSwKY+ZYgx4cAwWM5wGBsHloulcUctyioBE
 qTt8XqlMSqn/SRRv/E2gjqzL1eHGLdTc4Xhk35Yh9Ekv93ZDjNNpmQ5lThbiJQaANxhJ
 ZOvu7fN7UrmeSYBwgQkrFznWz8blYd5+SOE0xQdnYzwM10VborYYMW36roEXqxAq8eK7
 LYsnKR1yLGxm0PEmOiRcrkLT/bt/Skx4lUJwiTPo2VG+nsTZXKUxxOmhXCP+o5xbNZiL
 ICIMK/Ps+rK8uZKc2WG1Mm8eUEVXCA9kcfSjXG8GB7WUQF7XEjg+Z9rGB6kf/4ztiOeb
 siZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548729; x=1698153529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TV3do35AYxXbSAgiBkVm5/JXEuDeVl43xHLj4t+2gX4=;
 b=j534KM4vm0Jzo5ScWiuoeZvfOxQkUMtZKLlmFhAl9OmuV/WkAWVf4NT05eSJuPEWN9
 Mm6zTn3cvBkw4FjP54niNGSVSKne34nKZZwu1uVejXW7USUAjFS1GTPDL6xKM6yXE74R
 gHW4hYnFE+mj9ctG25jejxISd+Q38kzdmOKCFH44CimJ5QtH1pdl/P+lmN3xkO9JQqXx
 ExaiHdUfM17/GDZ4QaIIXWgaGD8zx1aNaznIcio7/+xP2C/tC6KfpPCSMDNDukw1ZywS
 5F84XikRVCTFZATDwAEjMa2E1ZPGpEkP7Aus6X/TvnnYAKkLV1bV4qzR+3GtdSKfOB2I
 5t2Q==
X-Gm-Message-State: AOJu0YylosI134CQjETU1gLhKbZhDrFdz73IWRZkaGUY9qpW92+re6un
 HxwsMkXgRmPFbwVKLofoCMibgpXu3C6K3mGhuu+qjQ==
X-Received: by 2002:a05:6402:26c9:b0:53d:a3ff:460a with SMTP id
 x9-20020a05640226c900b0053da3ff460amr1863833edd.27.1697548729393; Tue, 17 Oct
 2023 06:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230922181411.2697135-1-crauer@google.com>
In-Reply-To: <20230922181411.2697135-1-crauer@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 14:18:38 +0100
Message-ID: <CAFEAcA8XY1_W9YPtg1NOPYmEyL1H8AS9nT-BTXZGrNkjFBW_dg@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/npcm7xx_timer: Prevent timer from counting down
 past zero
To: Chris Rauer <crauer@google.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: WC8VwT4xF0EN

On Fri, 22 Sept 2023 at 19:14, Chris Rauer <crauer@google.com> wrote:
>
> The counter register is only 24-bits and counts down.  If the timer is
> running but the qtimer to reset it hasn't fired off yet, there is a chance
> the regster read can return an invalid result.
>
> Signed-off-by: Chris Rauer <crauer@google.com>

Applied to target-arm.next, thanks.

(As a side note, if you'd used the ptimer countdown-timer functions
to implement this timer, this is one of the corner cases that it
would have got right for you ;-))

-- PMM
