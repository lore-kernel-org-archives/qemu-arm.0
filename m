Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp289770lfj;
        Wed, 4 May 2022 05:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTuE/VIOMphFm6spQMnfsADWYWsTz3hH/Fm1wNKGEx5p6xoSiZtIJUHVZH4JmURcb3sgEt
X-Received: by 2002:a05:620a:4050:b0:69f:f11b:8814 with SMTP id i16-20020a05620a405000b0069ff11b8814mr8661498qko.747.1651668541127;
        Wed, 04 May 2022 05:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651668541; cv=none;
        d=google.com; s=arc-20160816;
        b=hH89rW9i8tGLzDIAAfvXaEnK0Bru1+5rtqqk3BRlP+EXl0mu3xYo/CW3+r7v+6bYQh
         DsvUabAXeBhy7lusMk6YD4uC4dERUT/nZntm6ERTsxeF9TLXnPgM5GfO6hB9lho/56S8
         osz1Vserw5nrHCYzBPTrL7Tx2qy7m2TwDyt8GD+7s1rsOy5z+sfhahmUg4c20NokSfq/
         qKa5eZouK77lHQG22S/GjvBWXD7/LYKczDlwumjaozLhmDc4u/F9wtiluOS4RBe0F88W
         btzWNSBV89vP/iuYPW4sNkRSQq6znYF53Z9HRmAJgLp5WaOd232+ueD640LcKC/xfBgS
         eAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aA21QJau93yJY0f6ApjYpQM9mFYXJPwWAUXqbfjMDQY=;
        b=g5EYd6EtpEJ1GIhYPR5FYBF6vyn9iJiKTitHoSz4Hvg8bJzz0nXMMwo/6KckvHLmJo
         i3hP/Hgy/T4jB9iSLU7DPe4wML0TLGKqlq+sfpUXldgGdGMmT44+hAwBdzOgSPQ1/NLn
         Savn7iObi0pJT1Q72YBjyaOXGU4JukVxUSavNqgt69s5dgVudnTq1FiDO2E83vF3OomQ
         1166pmSh5Mihh/y1cZtvesJesTLctO3hMcZhwL1d5mYg26QQ5Qn/VeGMxEvI5NJfBFGC
         7AFwhlxMf473v9w/gZOV5CRw36kYBh5HfpgGD5xufgijSFnb/eWivI5xiB8fiSWWllYi
         iAMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wsBomK/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a0562141d0400b004597d8f29acsi7430733qvd.552.2022.05.04.05.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 May 2022 05:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wsBomK/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmERA-0006U4-JZ
	for alex.bennee@linaro.org; Wed, 04 May 2022 08:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmEQx-0006SC-23
 for qemu-arm@nongnu.org; Wed, 04 May 2022 08:48:47 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmEQv-000333-I0
 for qemu-arm@nongnu.org; Wed, 04 May 2022 08:48:46 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ebf4b91212so13853647b3.8
 for <qemu-arm@nongnu.org>; Wed, 04 May 2022 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aA21QJau93yJY0f6ApjYpQM9mFYXJPwWAUXqbfjMDQY=;
 b=wsBomK/qUzb5xmXuduIdHi1G7/OPExAf7MfG2ostUmpQeF5vHrn4CzxH23wDGKZRzM
 PAs7yNkoMYHsqmgGjS6rsD/ZclfsBMBySR0lHltlWrJiJZB23iMnu3rwLoOalB4KF4ZM
 LsAK4Is2My4m0OWRWNbHim+gLXPzNmucjLd4YSAAy6tng208NSvCWTqpRyrAk5EL5eNO
 c66Imw7r09AnfnzZdz+KiFah+V/nUVCNgJ7CwsU9ISLBviMaErDiN6hdzAxzusq1MYaC
 m4M3wQSw8SY269XiLtlbww8bxcg21mT5sY9bmyVXIY1eYvJa8JQICBsXY35+G6YbJxyO
 gJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aA21QJau93yJY0f6ApjYpQM9mFYXJPwWAUXqbfjMDQY=;
 b=UAKdARpe7xTmhXs45KXpWMDhbqqnRf9dsvCrpUxx2k1u3T4PGGSQS3Zm45XJsS+4sP
 NkWLjBjV7vYkxw1v9ISGjINUkhgHiUntMaBx6XTltu8uFJE8oALFJNhgE89F9Osn45uG
 LlQpmr9WvCloUF1hyuploMizQD7BTCTNmihQ+tcLd5vPz6rnPv1CF6iyprl5Hmn/wxP9
 3rfhYmoTTdMCyQD6E6dt4w9us0dj3HFuAUbeCBrwddTAiAC84JN/nQYyMV0jnWKXUZ/b
 cNH7AESKIfdPPZQOOVgYiinm7WCcJQzAFEyKl1w3CDHmK9q/nYxz+Nhty7l0CQiZJASE
 F4CA==
X-Gm-Message-State: AOAM531/HLbTfjCqdyAsdGr9i3CsMbVrj7nvZD8UBLqIwHVlU/JblUpk
 Bu/W9YZlGAyjNoooEx/352lrptCSkw0SO7Q47W8ACA==
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr6539988ywd.10.1651668524444; Wed, 04
 May 2022 05:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220428132717.84190-1-alex.zuepke@tum.de>
 <243a815b-8aa6-6862-33de-81e00ca5c468@tum.de>
In-Reply-To: <243a815b-8aa6-6862-33de-81e00ca5c468@tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2022 13:48:33 +0100
Message-ID: <CAFEAcA-W=Z4VkNGFzSi0i1A3tQKHAeOr8e61HPJqxUZawQq5-w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: read access to performance counters from EL0
To: Alex Zuepke <alex.zuepke@tum.de>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: Bj6VMYSLku7o

On Wed, 4 May 2022 at 09:20, Alex Zuepke <alex.zuepke@tum.de> wrote:
>
> Hi,
>
> wanted to ping again on this issue before it gets lost.

Thanks for the ping; this is on my to-review queue and I'll probably
get to it later this week.

-- PMM
