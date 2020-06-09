Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp43786lfc;
        Mon, 8 Jun 2020 18:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqelEhZBoUmrwmbkFbG0R8WxKt7dsQSVXTau8VW/pOUBy03Jb276EAW2fiAqwxEvz7EC1F
X-Received: by 2002:a25:41d2:: with SMTP id o201mr2581219yba.516.1591666947296;
        Mon, 08 Jun 2020 18:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591666947; cv=none;
        d=google.com; s=arc-20160816;
        b=MT8U8OeJkl82v7/OAC9UrRe31FvsXN/1PfJlF2nJEY7LHLeBXCpcsPh6gesii5TZHo
         qVMO+OWz3e57jPnd+7EqAxBsKX5CwfwLZoMKFiA8LNBjwSL9E93Ly+R3PE/IBAXAKRxz
         LkpT22AYUKm+Mm0A6Mo7vWjpbxiv1AG5sKZlAGZh+UESpCxIJHRHWa6vyPJ9SBlbXfnC
         TClqtJcJtg5gBGqHYpXGaZJMyzNkaWDEtSvsB6n9Hv9Pyx0V5WekcBiKeLB/Eq0VV1K2
         zubCjvEoM3fXGu5LaJ8RMYb2/1TGcY18vugXRXnokDXmXx9BbS06Nv4mJ4gPw+YliT8X
         3dXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wg4d2BRHpAgJWcLacAVjl8/fG6hwFrWBvdQXQQyeVrA=;
        b=AD67u48OCU36qZs1tcOJHuFl1bEYkjMEIpc1pF7LC5wePLu68EOT8sGs14mmjZT5Rv
         oMzxw7pAFymwYimnJ4ErbHr+p4LlWhEwoLPfRhOFiZGO5MyJfrOwzHhheYYc3r1BDarz
         bvPzQgF8yzi7GGpBHhjkoXx7GNNIYPB/5vwAcC8NS9v0Cd15ssPIDK58Mt+/wxNaKeH2
         /W/qFWGUvAH3XdHvYt4P2uG5XjE0cvJTDvvLjtOln+drK/qC29pOtjhRlGP+V4CIY/DJ
         O3qaXfMNmJWAwXpC894Akw2vJLV0cEd623oxm5eSAm7U2rPSBdhHz6HaLBWbFpTZR+GU
         X6fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Sg930trP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i35si1128357ybj.430.2020.06.08.18.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 18:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Sg930trP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiTHW-0007ie-K3
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 21:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTC9-0003VA-PB; Mon, 08 Jun 2020 21:36:53 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:33500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTC9-00008j-2V; Mon, 08 Jun 2020 21:36:53 -0400
Received: by mail-ed1-x542.google.com with SMTP id o26so15021726edq.0;
 Mon, 08 Jun 2020 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wg4d2BRHpAgJWcLacAVjl8/fG6hwFrWBvdQXQQyeVrA=;
 b=Sg930trPsX11p9Ng3gQuG+40hDD6gmoxXUwED6FRHjd50+jtMjYT1vGDdtvCrtQZiW
 3kVF3eWouqu6zK/6syI7ZyHCXzHys7Qyba86ujiJXa5dsha/OnYWXuN+Q9wEE0QF8cdS
 dUBQcJ+/V7EQvJjZCYKQyJDUTltuPG9bRTCDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wg4d2BRHpAgJWcLacAVjl8/fG6hwFrWBvdQXQQyeVrA=;
 b=c7HmHNRY+Kku/K/TV2rsWFzgPvVo1WDPEKI0WMXZVBBAZ3MHAXdRXyB+Izhj6bs6CC
 Rum1hwwwFbMCYHmFt08BCV5qG9h8d1OXI/DMDPGFMg/vxPyNOeDNoK+JkMM9H0vo/vUA
 t4scu4Jy0iDwEkHq7hhaq8YDucR2y4scqMqSyeSOgtGx4exhTOeWlBVNmqYolTmLY6Cg
 yZK9F8gaGd8UbJlUi+sRkMGlwqtaGB9acMgdk5Doke6/e2zEK+jWw9rwqVteURhHvd0k
 XHcyavVJ1CJCa3o2ZVmIW+00QzveqfUTdDqJVPXG4clpYIwF/oCQkmSyXfSUvK8H9G3L
 XGtg==
X-Gm-Message-State: AOAM533QEs6V96o6nrRAztoluxB60qz7pTWPmAsxfmuG3vY1nV00ep+6
 kXar2BOcN8PsrwQ3bHOeFZyRo1ev2iiz+mC6vFU=
X-Received: by 2002:aa7:dc50:: with SMTP id g16mr16260874edu.318.1591666611260; 
 Mon, 08 Jun 2020 18:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-6-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-6-hskinnemoen@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jun 2020 01:36:39 +0000
Message-ID: <CACPK8XcDdTSN34XhWATabBG-stYfRp8SbWUn9VHPbq4c3v3fXA@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/arm: Add NPCM730 and NPCM750 SoC models
To: Havard Skinnemoen <hskinnemoen@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kfting@nuvoton.com,
 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4Y8v/IiU9BF

On Thu, 21 May 2020 at 20:39, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> The Nuvoton NPCM7xx SoC family are used to implement Baseboard
> Management Controllers in servers. While the family includes four SoCs,
> this patch implements limited support for two of them: NPCM730 (targeted
> for Data Center applications) and NPCM750 (targeted for Enterprise
> applications).
>
> This patch includes little more than the bare minimum needed to boot a
> Linux kernel built with NPCM7xx support in direct-kernel mode:
>
>   - Two Cortex-A9 CPU cores with built-in periperhals.
>   - Global Configuration Registers.
>   - Clock Management.
>   - 3 Timer Modules with 5 timers each.
>   - 4 serial ports.
>
> The chips themselves have a lot more features, some of which will be
> added to the model at a later stage.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

This looks okay from my perspective. You will want to get Cedric or
Peter to take a closer look though.

We have started adding about the systems that are supported by qemu,
including how to boot the machine, what is supported and the
limitations of the modelling. See docs/system/arm/aspeed.rst for an
example.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
