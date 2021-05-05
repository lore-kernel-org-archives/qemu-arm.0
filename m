Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp335034lfg;
        Wed, 5 May 2021 07:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCR7puvKOahj95PhHvrJCxou/BRiZIXaudpsSbn1rGkdcB9rq9vNk9h/rjrkSLxmPS+mTF
X-Received: by 2002:a02:1989:: with SMTP id b131mr29261299jab.54.1620223771999;
        Wed, 05 May 2021 07:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620223771; cv=none;
        d=google.com; s=arc-20160816;
        b=F2bMzaDVRQl2vmYOcnkB/fZSzq9Sok4/wREUnZtb1UYfXlfvwuRt5kpn1WiMfYdm4K
         cK/ZFSkupRQSMz2il4PCB+wiLfrAqahFC6kzeW5IuqfpufMT4TGQrMpqTRKMawO0CJ6s
         RsPDIgAEXYUxeg+/si6xIza88tfxLdO6aLwrqJBgD5S+2/oCXkMgT19Zuvz9/ZHkmqoA
         SZ76g1cZbg8RuROaDo3ZXr9IxW33ebL04THywS5CizaiUyCKU1XPCcDRu6YoO6NjbUUH
         EnSu4GhwWZKJDo6+jKspUsJYpmix+WUqnQHOiFDxVOdeba8S4p79fZts1N0+/34Y349/
         NmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HLJFif9hX/1RjVhENBsjtOSWfSSNJX7I9pO1HdpNHHE=;
        b=Sml2xT53DcPf980uoHF4n/o8/gmrNxkPO3gWDB8yQj8XrPDvEj1mIOfGaXxHWzq6c8
         n9sVl4eFQ4betvs4Tu6vDwn0c75KL3tcvJaoXGHiS/YjdEi/eyjns5Jehed6G7GZneMf
         7F/zFkDb/7QzQZB0g0l8dMBP5priICQTk/LYtkYgEru3fyKx7EzESIN0dg9uAqT8MYKf
         D54wBif6L1pv8ogySIS2+4Nw2YZX3oX7DznCMKwsXAC34CXIIsNfz9fN7q094dB+HJ0Q
         PeSJbrHh6Rwvoq95mfLTnvE2SLEL6sltUYbnEkkf2znBpdBPG9yEEdgpG6WBLLkAVFn+
         IcsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=UK19LphQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si19478413ilz.34.2021.05.05.07.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 07:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=UK19LphQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leIDS-0002iG-Um
	for alex.bennee@linaro.org; Wed, 05 May 2021 10:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1leIDG-0002hb-9f
 for qemu-arm@nongnu.org; Wed, 05 May 2021 10:09:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1leIDE-0003EV-QX
 for qemu-arm@nongnu.org; Wed, 05 May 2021 10:09:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso3531392wmo.0
 for <qemu-arm@nongnu.org>; Wed, 05 May 2021 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HLJFif9hX/1RjVhENBsjtOSWfSSNJX7I9pO1HdpNHHE=;
 b=UK19LphQ/hY+873DVWZ5Zno5N9guPCOcGjCn1e9dvKdh70wGooWgNxgDLXy4MGi9Bu
 BJm9iA9mmq5MNOSqCwhnYHIt34AO1ZGHNufsrzbYJMskt/Z4UbRdhowi6Jf4jwWypFYD
 dKFeMIyKiqBDJ0spjQEA9tHDHbBWAR08s7hFTRnVWwzFFxqRs2Q3EIldtA0fu193J5mF
 7xEx3CjqOmzO8g/wIpZB5Rf7IcBTxfJjSLCNOQutTdcmhTb00GPD4ON5+LUhZFcphlpY
 X+pJ8qgde8MfNL5Fb0564a/+seuejq1lEHXZxfCYXkzes2PWycaE8unSjm9eP8jRNWX2
 WYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLJFif9hX/1RjVhENBsjtOSWfSSNJX7I9pO1HdpNHHE=;
 b=kWi0RZNNJgQrqrax+z5HrHGz2Cv9QTX1t+ujmBdbBOkcbFfnq1n8v+zoeJ+PZDk036
 5j61ta1wEOEm8tgVyi5Td5c38I3MPxncscwZS95njsl4/ctIUDhAmrtPyr/Q5TgQ6BJj
 e4Xe4NPNn/ZnuqtozbBngeiA2SFFWsUEsGj1wb5BsjHtJre6Z7LMrFk/SNmTTT6AsnQ5
 YlbtcPCLRT0Cv0Rt4CrLKXTp+XrOPilsoMo6Pr9fE1sIeKXlb3CxOZRBz3NQNEkgz+xg
 RLkZf6DYb/vq+c3D2HX2yn/b0wNzN9cKiDVlhcZ7/uNGrxAVFadSgyW37bpqR0VXzs7G
 uxlA==
X-Gm-Message-State: AOAM530k5HShQ6c7se8lGbDDBefq9hmI8J2zA0Q9hV26XvDjkqAGvX32
 DVlRiPwgDq3dC9n8NtqjfYA35QLIbl6bWHelm+pasA==
X-Received: by 2002:a05:600c:48a8:: with SMTP id
 j40mr33804713wmp.114.1620223753671; 
 Wed, 05 May 2021 07:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210505135516.21097-1-peter.maydell@linaro.org>
In-Reply-To: <20210505135516.21097-1-peter.maydell@linaro.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 5 May 2021 07:09:01 -0700
Message-ID: <CAFQmdRZyt6o+A8cSZ+MVsKYC0F-Prp2H09Obxk=U9uY6C1sbtw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=hskinnemoen@google.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: GxD3JsQcEM/A

On Wed, May 5, 2021 at 6:55 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the glib API, the distinction between g_assert() and
> g_assert_true() is that the former is for "bug, terminate the
> application" and the latter is for "test check, on failure either
> terminate or just mark the testcase as failed".  For QEMU, g_assert()
> is always fatal, so code can assume that if the assertion fails
> execution does not proceed, but this is not true of g_assert_true().
>
> In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
> include some assertions that are just guarding against possible bugs
> in the test code that might lead us to out-of-bounds array accesses.
> These should use g_assert() because they aren't part of what the test
> is testing and the code does not correctly handle the case where the
> condition was false.
>
> This fixes some Coverity issues where Coverity knows that
> g_assert_true() can continue when the condition is false and
> complains about the possible array overrun at various callsites.
>
> Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
