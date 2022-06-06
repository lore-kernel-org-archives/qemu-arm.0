Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1321025lfb;
        Mon, 6 Jun 2022 05:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf5QT//h8J5faj0vJTHLpKzoJ3ET1r95nm6fUUz5Dh/psrgvb9nSS4dqCOZY+k14J/j33R
X-Received: by 2002:a05:620a:1712:b0:6a6:c587:7341 with SMTP id az18-20020a05620a171200b006a6c5877341mr1361934qkb.600.1654517672646;
        Mon, 06 Jun 2022 05:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654517672; cv=none;
        d=google.com; s=arc-20160816;
        b=qu8qJMcUD550QZe0ex4xtP0JWa53yLzAud2AkMxM7aq9lDI4etyT+G4HguORSYbnfc
         u5kcMS9fl2MDirqzYEmfqat1TYXlAsixgn0xdWYG8B57R46+qdyy3yuwvjWf55XdUCb5
         wU+t/tbaJbCN5ppVhgtS1Wj9ucmDDP/K8qHnFyCZbqLP1fWs6Kc1dAzdZyiGs1A9gDR5
         vaUwi7Z8oa/Ay67sbrgd4vNOSg7Y6qmHw9yhus/naEVCOSlzsDKYTfdURSrsOxcZqtz5
         ECDrhxOvtg2b+kqqMn43Jbz/5MdwgScvZz9Qg/v3HsFc57v+/y+7ezvN4ePuCBE3Cd6y
         DoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JIdPmc1YBJ8vzAMfiIbKjD7kCmqo5jCkHEkoAgC8fak=;
        b=HeCXQdzzDJMZCmPc0aSAdkHuN29G2wZjNaC9zDNW9UM8QFyXVAdYRIxoq5OiG7LkW3
         zVMbFB+Iwrqpvg5OK5x+hpnWR5iOuK07XrsiHEWDozVXN7paGenmG3zn9YrCpZvRNDj6
         qEd2v2p0qQFiPN9d6lPqDJLxr1nwX54DNF5NJgqvFUBZyp2M4BNzKPiAlwiIXfiyFFuA
         icmGXm1twAYRBc5SS0f+klkEK6Gfqaz5gIP/sK6XtJqtcpe7SS42J7XcAQY3E42+HZxZ
         Pm7vByPsN9QU5CGTRo2otSKl+6a5e3M+RxKEQZuf1m+OhYsLRbZ76BZI2sgkN6rZLXWo
         SCHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beJmeu6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05620a400200b006a34ce2d27asi8836586qko.752.2022.06.06.05.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 05:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beJmeu6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyBcu-0002GT-0X
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 08:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBcd-0002G8-Aw
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:14:15 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBcW-0007Xl-Uy
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:14:11 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f83983782fso140833427b3.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIdPmc1YBJ8vzAMfiIbKjD7kCmqo5jCkHEkoAgC8fak=;
 b=beJmeu6meGCdJSi4T/koKo8a7JGLcZS8H2xKGOZH5zsSu9xOjV2BC6OQSlvkqH6CuS
 8cZxo/ONffwF58mSOiBdesmFOB5N3iDfZBEMn/awHQu9RG6/jaBRCLwQQf5XMkxop2L9
 ey6QfbgMZFHLFOIYGL3kkyvFUAWSckeLhJuBxd7b1djact/qH+sAsJA2Pvn05mvG3lXh
 c3Vx/wmHviFhE5eSvBWtmuaaEAPklzV99ad6svdU0OAwKMQRFRYVYjuUbseMRbcQG+Y/
 HmiQwrhOAjHUaZXHfqdmL39B1ceLaZMI+foAe0hZGAQZbQ8KeLQUGCaDrvX27sf1eVNy
 Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIdPmc1YBJ8vzAMfiIbKjD7kCmqo5jCkHEkoAgC8fak=;
 b=hij2yikFF5WEeKRkhvmfrZJ5v4sWwbnMNU9hf9QPkakf1QOmxsOc8GBqSLdmCnfgC9
 TUhHn+Ir+AEzvAKaQwmAmzKceju27oWCWejvfbmrmYwhEbO308zLJbOVTdVmdh3tJUPv
 RRpAeFq+6evvfUO6l3rqAcg0zxAKn/1XhWy9PVKrimDU3FxeUDmNUntXbv+ocepI7NS6
 YMCn1Ri60WggP58KmR8iaAKGHe1smF3k4m3xvEVwjCmXFNlLNE6xAp2MQZlCmFHVos75
 1nFWhC1XNu+VJRD6SOlmsDKluiHVadQAPvEnVG6aTUEh//cNd6m5W7J0NvxjfIsmaP4K
 QV5A==
X-Gm-Message-State: AOAM531EaXPH24d+VyiQQw7/L0/V/ItUG/Z+hengaK4nISuMeioOT0/O
 V1dIk4l3W3xRqMTkw3fMmvjMhxEQkZNzmy8TZwLgdg==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr25132481ywa.455.1654517647602; Mon, 06
 Jun 2022 05:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-4-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:13:57 +0100
Message-ID: <CAFEAcA9ZCSHakozNwoN+LiKG6vpJM8QqBPsJm0oRBJi0SqYVRg@mail.gmail.com>
Subject: Re: [PATCH 03/71] target/arm: Remove route_to_el2 check from
 sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-TUID: FLFxvDizSqTO

On Thu, 2 Jun 2022 at 22:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We handle this routing in raise_exception.  Promoting the value early
> means that we can't directly compare FPEXC_EL and SVEEXC_EL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
