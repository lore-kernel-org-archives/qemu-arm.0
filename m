Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A07CE7B06
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 13:05:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJtU6-0002DW-5m; Fri, 14 Nov 2025 08:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJtTk-0001ox-1q
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 08:04:46 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJtTh-0005og-KP
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 08:04:39 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7866bca6765so18652587b3.1
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 05:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763125475; x=1763730275; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ibAtVrD5u4EYwMwyp8Eua3TDKKkAx9oV2MDQQWvTpRw=;
 b=fZ2mnJOStwKJ88O7dIwwl5q9mf9BuLqeGo4kbWrpSi49Bxe5mnoq7PH105q6SD0ay7
 +zwVw+EZeB2A+/pIskZvjLVbByFD59OQ9iia4ZEptNyTtUYq9JhmJdCIPSjI7Lk8lVvJ
 N+ZGlu00ENTf4d0vjUK/YZYWXrmzOfcmtzkAYPr6C5mOLsU0pAoBqU447XvhScHXW7Xk
 139gm9lBuIAdOatS7pMa+qMpQsEViPoZ7BH/GY+CZJegZiy6cvC2thMTTtvNLvtZLfuv
 TFQ4ssqmkEId2NjxmrkTervU0aYEzyNN75BPJrtGCSGvw5Ab4lQTcCDrz3+kpv/Q7dmG
 7roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763125475; x=1763730275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibAtVrD5u4EYwMwyp8Eua3TDKKkAx9oV2MDQQWvTpRw=;
 b=mPkiMT9TSCwDwXudBEafjtrL/jFAPzvl4zErxHqAxfn3IU8vUJ08NHfYLXndu6cbMY
 06XnEUO59oQru3xGVRwrPuZzlC/IzX2VPuP7BvWUnD21qn+W+94K3aXc1obL0EBIVEdl
 Ln+SvaZXCqbcbRkkyACd6FU95/SGGH/M47dbYuK9o5Vj2oxFw2dGICnjFau3xdkGJAux
 uQz8mcbNDyhRS+hvIeiiQroA45U6RuNnSoLhCHjQaVIfW1Nt7j61u5asS4qz9X1eeg0X
 qopTM4Qh4FAtS/v14bCbxp7M4DOXICMpBEeXosGjfbnbn3XL+/B1KN2mn2c0/YqJwAfD
 J/+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuFaQzYx9XUEGHgGWK3loy8e9/H9t+2uQxF3RcrfuWp2i1r9UvEFHleCcf+2Bl1fwAZix1L4GuWQ==@nongnu.org
X-Gm-Message-State: AOJu0YwO8NdR44uXMGeK4LWuW7dv/eOA8hzw0UKvOzoz1VQd5z3WBqSt
 ON4vy4TKFcZVdgpIOhnIW0q6jkmP1cAIj9oRB1tf4frNgiC8VkeFuyda3vO6DRLfkRXnsxqGTLj
 rQeif+RXyHaisvfGCM6vWtJCiIxrfm95OEoCERVThSg==
X-Gm-Gg: ASbGncugIOKofOJZkS/xDWhi4qHXD//em7Pt2wmR10Q1hRXbYzw3nnczlaYUYcNYfRx
 TTtDhAmhTJeBdeT1ngzG6PYVFUdYtcg58rJ6ElI7H3riMgvU4f6gJT1yMW1cZYTQNl/GEXO2ygn
 o9NbIEhWL9DWbKuP2vPl0NXzDnhhEHA6QotDNeOYqS61+0EaDYEYnCqPkeoBlQbCIHfwave7+7Q
 1TSR8wSUS9cCBUiMutBU1u/Lp3ivXUB+5AJX0I2N3Yh5TJ4Os3JhakflWfpYJPztxGNlpVO9lMV
 uTXsz1A=
X-Google-Smtp-Source: AGHT+IEEJL4fmswJ4mL/qtZMsXrpqpktFe9GzP1Ks6zGp32PTzMQ94LoOF5FMDMgnOiY9FBXBRNr3tRKYhTAgWBKOCw=
X-Received: by 2002:a05:690c:7085:b0:786:a3fa:cffa with SMTP id
 00721157ae682-78929edafacmr28733027b3.48.1763125475102; Fri, 14 Nov 2025
 05:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20251110161552.700333-1-osama.abdelkader@gmail.com>
In-Reply-To: <20251110161552.700333-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Nov 2025 13:04:23 +0000
X-Gm-Features: AWmQ_bmzNTGYAC1lthx_b3rdZGF7XzO9Vu9PbGz9_5oQJDeFqv9pFH3zkqcQlaY
Message-ID: <CAFEAcA-xt_1hFXELMyu+vGtnP9hZsZEaPLkT4km0YEEpE4HzJg@mail.gmail.com>
Subject: Re: [PATCH] target/arm/cpu64: remove duplicate include
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 10 Nov 2025 at 16:15, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> cpregs.h is included twice.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>



Applied to target-arm.next, thanks.

-- PMM

