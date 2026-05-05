Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32949CD343F
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 14:59:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKHEX-0001Tp-Vy; Tue, 05 May 2026 10:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKHED-0001KO-JV
 for qemu-arm@nongnu.org; Tue, 05 May 2026 10:58:36 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKHE8-000478-TR
 for qemu-arm@nongnu.org; Tue, 05 May 2026 10:58:28 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso5717299d50.1
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 07:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777993101; cv=none;
 d=google.com; s=arc-20240605;
 b=K1c9d+F+XOxQurrBkfFPtFH7d2cExaBYLehIYujW6h9c7YsdWR3NC0tU6e0btBuvmU
 9BxnkiGY5NQGMHGuNLrWq1w2if6DKLEmnZ3/p8J5IkJp3yMQTwaz6NzgD/17OWoGkaqm
 Yfl6a/RU22qRk5wZOM2lTilw9SLRer9o3pXyHXlQF1oxCmEY7EnNdP9bp2woXLrNvc3u
 zfwbH3o3RIJcM5UJTufBj3XroZSUQKfi/Wbqr37RYuaogUZDc0m7gwk+7EV0gTKwjKRP
 jQ9H8nWU4R9sM2UPZn3hyFfXUZ9lHLTSLJBqbYiaC8kBNskZCa8QLU74499sdylTHKN8
 W3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rNzsOHwukFP9Klru5SwEhYlCs7rmLk1wL9R/sX4SOT8=;
 fh=qhMqwrC04ONHhn7O9/QNoroNAp1OrdT3+5a+GvSmLz4=;
 b=NKZEsdQnVd5khHnGq7R/So3jy0ZvQS2Xkq9o5+KlocQ6IjJ2P81eTX2wM/PEN+b8AH
 7HST8SC5lR3BvtHkWj5LHyK3G/UAJKSMX6t1EPVKHps8Uey21Y19+C1oqp9n9xlJ/WbJ
 usQ65r8dbgAvV/+QVwQoEkhTfHef4x+hncEDY6007Eu0Ql4KsWIN6iNjy9HAXzJpfRe3
 Afps0Hr2drxywg5vCPwyHRyz3ST/v1QUZx+MqX9LTU558ydG7yPbWSDq3CrJL+qZrgh9
 V3uN3S9ZDinnUgwZD4yqL8AGB2jEz733TC1qIneh0oqfQBDgu2q6+hcpKm2FAk2ox5Dv
 BajA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777993101; x=1778597901; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rNzsOHwukFP9Klru5SwEhYlCs7rmLk1wL9R/sX4SOT8=;
 b=OrAzl+3EFOKAq89zZkv61fKXDe9NveYdV47AQKUMgIq1WXLsErLlrll5891kCxeJ0H
 TVP3FXqoiWecDpLldzhyt/iQHw+/2rC9/0ORTKfdbZHO5dwZnkhi+R3m9bRrnwvvBLry
 msS3T6mumbXgX18IFf+Kso9RKNaZqC0Ms7OVTzn4M1mnKwDDKLzHv//2aIt6RnV+geB9
 OuOmAif8E/Zy/GZXqKCYiGhuXOOK2tvRyKdT6LP9gNJ+POO4JgrBB7tAruOQr0gddPCC
 CTM5ldh/X6HysdPKsyKwG9IKzjJCr+0ZR+iGuNbnE8bQ7efSM+8lOA6RaL4cjjSyiebb
 vZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777993101; x=1778597901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNzsOHwukFP9Klru5SwEhYlCs7rmLk1wL9R/sX4SOT8=;
 b=VO6ptHfzXK67a+X71z4VNo4hynQwCR4aUeeH/hvnds4Kri8YPRnL5zx09VXIC6p5XA
 Nq4ep+eQVLdqBbfviCostRSYQzMYcWbM2UX1G9Q4BQ3V+FmaKywRj6sjwnS2+VgOYm7h
 CnyxYw5RIGLd9QXcawY9eUfjzxtelnd+JDNvP2PpuCSWp2HtyEO19j35o7FeZ8xdD+4Y
 cKnkSa9F4PSIvcSmAMJJKr4ze65FK05QNBJ/WfJDzeRXGJF6o5anraoy80ORVWQU0inP
 N0tLFt73BqTY035o1WuRzcJmh53PKJDBK2FBMmFWNQFOAbjWAybTPVQv5mGq8BqzLGQw
 HiEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/jqsf1l1fTe8qlAqi4PtmWsUSRpZg8qdrLTo/mn4K03dJLD9m7PJ41CCriFLh4FgXqZWX/x+bwng==@nongnu.org
X-Gm-Message-State: AOJu0Yy1j7UR7+IU38IUt78ty5ltCuyn117qLGFEH//Jc50gmiR25MHk
 +wcLi8L6ftmbqc5vuVffF6AudYkF/QD8I406+VRnkyxvk5mCWykpHff4Lk+idAMG1pIwddZXmYt
 ijDk4YHrLrTmyz1rwiBLLGHwuqfiNm4db2AGPnh3X3PjyBSBuphez
X-Gm-Gg: AeBDietPn9FVwxRlE+zJt4vW+LfjLzCrucrVBvg76BmR0AZfYmW/6jB2Ar027IaSQXp
 OwyPtyaZTXBTBvZFu372HE4phSIC4g8D1ttq0qgtqIsGp5rP5Xfj98yRAcDbWWw4j1OzR4i3bC/
 Ny4/m4ttMkR2CuMP1S20aW2vQCxxEENc3qxZecWB2HehBnJ7oPy9dvWIUFWhBBH+uzt+MLFA8NO
 7QnCg4VHpY6D0iZSwUc6E/38AMl55tnxyegJb1/Fritpuw+qBfB+bfudlFiAwl8mJgGO70nOqKq
 8oIj+nQ36WS9iQ9SymgMB37dmH8Qqs+nKiIT9B/l7FQ2JooL4zCMbz0E92Jz7I9LqtTbF98XNKC
 twg==
X-Received: by 2002:a53:d0d1:0:b0:650:2257:e085 with SMTP id
 956f58d0204a3-65c69ed055fmr2765124d50.30.1777993101225; Tue, 05 May 2026
 07:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260501231353.63184-1-mohamed@unpredictable.fr>
In-Reply-To: <20260501231353.63184-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 May 2026 15:58:08 +0100
X-Gm-Features: AVHnY4J0kvIwZxi4pjf5VtQKVktAeLFZS329s6lNkKZtm9teJkrJH4B8IHKZ8Q4
Message-ID: <CAFEAcA-xJcSq8XcWeZh3SnOjbWiZ8G4RQ+MyE_jGhJa1k5kvfQ@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: override HV_SYS_REG_MDCR_EL2
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 2 May 2026 at 00:13, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> In older SDKs, MDCR_EL2 was defined incorrectly.
>
> As such, override it with a #define if compiling with an older macOS
> SDK.
>
> This is a workaround because the macOS CI setup we currently rely on
> has not been kept up to date, to be able to land nested virtualization
> support.
>
> Once CI is updated, the SME stubs can be removed and this
> commit can be reverted.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

I put this patch into my v2 pullreq; hopefully it will get through
the CI gauntlet this time :-)

-- PMM

