Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3476F3C24C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 13:21:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzaXh-0002Bk-MN; Mon, 09 Mar 2026 09:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzaXg-0002BK-Gw
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:21:04 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzaXe-000259-Ra
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:21:04 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64ad79dfb7cso11072982d50.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 06:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773062462; cv=none;
 d=google.com; s=arc-20240605;
 b=EaHzqYoG0Uve/TH43x7I3XqlDlH/tqI7vLrF0pCwSjl/6NViZRsAWzO8K0x0ILxDmg
 aVTeUruZ9+ulEnkRXco+c7kYUB7SGHmVtByesFxTU12Z7YYdgic7Zx3vbRc9S709qm/w
 XgN9+PfY4H25i3IGc55Tz46py6/zfQ6fn0iwrQVUOK6hv/Oez+Yvze4XJB8jZOTL1umi
 +eCVdsLRZJfFszlL0tp5agkkIVWnSOk8P+gFQHHOdDIjKOk+iNkP1W1nPHY8p/pggkgN
 N7YuAPFp2sHQCIBlou5S2EdGQjUW+pP+MRoV3LKIEGgw1IxFMOfIYecxoEkSHQdk1B5/
 gHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=W2SJ5g1esPpiuxXYMFcA2YYU3D6Qrf7nK/bC9724DZU=;
 fh=u1NZIWfL5ZeEA0Iyf2NSvhOVSR6FY7gZkV2sE+dcbpE=;
 b=ZOIX1GuRr9lk2rAts+lDLjzBILw8C9dfnskiqHJyXE422i2Np0Obj4FCGE0FL8ncmx
 TDYoPNCLq4jAE5b0Ew1JGYG5k76hB7mA8qvyiy0v34jYKtQV2AHhi25k48Kz7+Z7nNpo
 vEEBrd4iAmI+SK/g8xsDNtZnzeHql08tXlmRcgJLsqwfx1xMZjWUL6tIlB7feVpaen4W
 Y3KNwaqfVwH+bCz7MF3icWNcROplz2hh6qPjZK32Hww5lwuSmkVQJ6EE6irJaAXkus4g
 Y8cGK198nd7ZGS8QnRPfPr3xJAf2GZtxABVZ6kt+1Og8xLZGX/+6ofhlTzkfobWkYnRt
 LBgw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773062462; x=1773667262; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W2SJ5g1esPpiuxXYMFcA2YYU3D6Qrf7nK/bC9724DZU=;
 b=F1rqFRdBfbzGLcygHUaAWY88GAE/xjK1+sZyD6q7CZHpezE3zPKsS/Kec2dw2nkDMx
 lGoUBOqaiB0eHJ67JkVEU8bxQ3Qb/+VvizloO9cXx1ymAOnOaZu4tsrWvAowcpe1xIsK
 o1KbkfiPWajHaXNAmj4zFamf2uBK1lOVskJMVYKrc3sgi+tldNQAdLLTh96PhTCBavEU
 CFKaMKtwpP/Mc6vMwm2afPr6eJhbrF/6Y3/iGCP6R5WaeWI6NRxPC6q1s4TaW0AbnpWU
 nic0XKg4iU4uP8umQcl/gGKVBLmxM6jN87ut0FNrbbuNksF1sGjae67lhmh1L1sAIC8A
 MPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773062462; x=1773667262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2SJ5g1esPpiuxXYMFcA2YYU3D6Qrf7nK/bC9724DZU=;
 b=XxUzrXLzQNZqenbKJl/I6jRygdZW//V/dctJxxNmuqbvMKWZ0kURWvIT9UlLm0Msf/
 OB41GSleRQEWolCMAsA+MPCqxlReuQcsDSrI5llYzRAJ/r4UumP0kzmcWu8Bzgq5kU4b
 w3gJlvJTiPomOWJtuzCCYmCdYLRL81vyVBnB3YMEnuyT88++a2UJO8TxNLPeD47m7sNa
 BPW4ZmKUnruZF5IElvxveSfE5QMISh/Smg3dSo42lMDWJwDnfEAXNNQA54t68NpFP9em
 d48fBfOERNv6Gz/iAsv/Dio+oQoWGMV36iAZKu/qw5gOsP1JjcEPC6eSfIqeZafe6Fn0
 IEaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM4g2CJWk1k7RRu9V0CyMyfcDZswZZeJs3NkWOKGh2Nxy5IToITDwOrG741vE7Mm7TzRZ5MSjofA==@nongnu.org
X-Gm-Message-State: AOJu0YyJdxWdnRqZUvjO/wmlrO6uJnhVoBetSRQznayJZ/kKeOUhso0u
 FmpmYAgYY+Tb+uAbDHIgtWsxvpM+Jyl27oWjMUUfPY15eypASd11lnA+qKaReyoeA02zMMrIvMm
 2z6LKKTUoErnZ9k0hWQ5L1aVz6GIhGQxqPGqE7JTMLw==
X-Gm-Gg: ATEYQzyKyYXCud58drIfRdHo+jdbHdg13a4RlBOGtqMLLusR5xJsC/sfjqK+b7kuJ7Z
 sdmTmEWgDT+lsZuuNTLN2mEkL9L9PIaTwDwDsi35gZ/J+vy8KbecDJq9XNABd/5/Q4TqxJF3Pq/
 x6I/YPfBMrbqF0qxXOk3ZZDEU9rI7ODUCPCy8Na3YwsnszfsrbCr5olEQusSBl6yAXlOvIkfA11
 aProHEHf4kMDEt0Vm7TaMwKEhZeRuMtZTfJo27auczcBTdE2OXF0ByWNl3a3JX/IBqJvVGx3aDk
 7v568e50nfrqspy4ZHhJ3orvbAOyeyYgxYabQh4HjSDG5Axrkmn/NeBL0uIXh1XU8jZlAjcmoEb
 Ifg==
X-Received: by 2002:a05:690e:1a9b:b0:64a:f160:2351 with SMTP id
 956f58d0204a3-64d143500f8mr7424473d50.71.1773062461600; Mon, 09 Mar 2026
 06:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260307180330.75168-1-mohamed@unpredictable.fr>
In-Reply-To: <20260307180330.75168-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2026 13:20:50 +0000
X-Gm-Features: AaiRm53FntFlLNVEeD568TyIkpDX-IhjEwguDOfdflqroS6dbGgUehVJJ1Qs04g
Message-ID: <CAFEAcA9TSQEVEVeQc4rPtz4HEJJbZUs9LaeVbz-y3=tB9zv4EA@mail.gmail.com>
Subject: Re: [PATCH v19 00/13] HVF: Add support for platform vGIC and nested
 virtualisation
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Sat, 7 Mar 2026 at 18:03, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu hvf-irqchip-and-nested
> (tag for this submission: hvf-irqchip-and-nested-v19)
>
> This series adds support for nested virtualisation when using HVF on arm64 Macs.
>
> The first two patches are from the SME enablement series and are present for the
> series to be buildable on its own.
>
> It has two parts:
> - Apple vGICv3 support and necessary infrastructure changes for it
> - Nested virtualisation support. Note that the nested virtualisation implementation
> shipping as of macOS 26.3 is nVHE only (but it _does_ use VNCR as shipped).
>
> This series doesn't contain EL2 physical timer emulation, which is
> needed if not leveraging the Apple vGIC. As such, nested virt requires kernel-irqchip=on.

Hi; I think at this point this series has unfortunately missed the
softfreeze deadline for 11.0, and we should be aiming to get it in
for early in the 11.1 cycle. I will keep it on my list to apply then.

thanks
-- PMM

