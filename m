Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2240013ejo;
        Thu, 14 Dec 2023 03:08:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsOXlJsIdPp9QFutGZFR9DTHbVFrCYCScW8zoz2c8XvhjKJhqJaIKBnp3vDUJJIkG9my1k
X-Received: by 2002:a05:620a:2a0b:b0:772:6400:f111 with SMTP id o11-20020a05620a2a0b00b007726400f111mr11313027qkp.47.1702552103973;
        Thu, 14 Dec 2023 03:08:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702552103; cv=none;
        d=google.com; s=arc-20160816;
        b=RrWj/zu11By52CaNem/R+hrqMPWasJBHfWmqbPWlvrYPmJ7swWQdu3xQ7xM2cCodBA
         /o79+UpRJS5wuiX5tw0qSy9EUdUnsQwTsJEQfvsmj54LgtJ0fg4n+1UpThDWxyMWpjvF
         Fan1aBI0NXUp4oiumYGWC9Cg+uN+iHjXqEQuN3KFzbl9guAFlqq+8dLo2oxmJhLeQcsL
         DSaEWVxv7KooSd95+uojMdPoGg18wKSIG0uN6ZspTxiu9VFrNB4k//MHjLwNCiOFFRv+
         7taha4PcdAUX+sjFlYhlrFEGD1BAIWB0FfGKN2xi4dCk6mnUU+eGSRs944G9t/nZp9bK
         OD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/OpxdgqjWCBkMRZ8v79J86H1jRES0elV7emYRcVfxTY=;
        fh=rP9OQuyWljCTpPsvX8RVhmX/E5HKS8lsBgf+Y3+9X10=;
        b=uZjPY0mM7AgeMQpyEwD4VqvkA40cU3u+nDhmCmavNdnua+V/GRVUY5v2ymNn4e7PqW
         r9FYlR+otShMz3cr7xko9eA0MIvn+3pG252weYOggoyETUepaqI+HHTtdEnQhA0aJ3fV
         NdVJ+H73QWCGECA6oP8pC35U0cRA9VM2okhB7/6JaYWg9AlEpNlBtdgHxdNXFWjDUIWF
         wZmXN+Ydna5SWePvdDEpkubm04MrOih2Cz9dQdasWqI1zlVo6YHoGXdALNB9U2FKBxUW
         k7X2tbO9ZUtfdc/89zKM1vwwSkfuT80ZSIQu5C4n3B0RATpiy89FRvqHHBKJYtZfE4LP
         uNMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwrhK9Oz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b0076f1797fa7csi12474715qkp.534.2023.12.14.03.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 03:08:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwrhK9Oz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDjZW-0005H8-Ox; Thu, 14 Dec 2023 06:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDjZV-0005Gs-HV
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 06:08:05 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDjZT-0007h2-UM
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 06:08:05 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9efa1ab7fso101129811fa.0
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702552082; x=1703156882; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/OpxdgqjWCBkMRZ8v79J86H1jRES0elV7emYRcVfxTY=;
 b=iwrhK9OzJvjmd4PRlUZBkvQHdcO9IRtqYi/3rtfZ0futx+T2v1xWxay8lGnEN34c3I
 E16XtIwmR/zKyqBnawE6ErsCK3dutLiFayoH0cw8L2uI8VV+HOd1wqWSTcDCkLl4NFjb
 itcOEcEyibtHZB2Qg29i5TYue9vDq8FWRj7nTK+AKvUomTNBue6rq5gKo2PBr/LAXvM3
 ZMat8MBMW+7/z/D/YC0wRuaYinNkxscqE0UyqDVzv5SGt2ok5KCnHbSM48G4SAah0QJb
 4YR/dv06UGq900XAvG14CJrQwLcjW19hDCdI8/jQyjOUEv6U4Am7wA3yqzEt3M6fVVV7
 wSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702552082; x=1703156882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/OpxdgqjWCBkMRZ8v79J86H1jRES0elV7emYRcVfxTY=;
 b=uW4dHcLcR/CpNYq8n5E5H+JMCBDtxtfxKabMoR2iHR/ijBVPWjKUNDW+V2he8dq2IA
 ydV4e8LczJDeaSCK6KnXnJ9yREsmLQMrsK4TNTdjMxNUmHbXfIIp7kUzDZ2zBqhgZoi5
 qFhYLJ8jI9MhpjLoLtsXUwHll0Gn6Sru5ZBbby1dhyZvTCWfaQzbZeN9zlnrlJlZeAkT
 0VEkYYlWLQXFKMMTdHfaaarQUQsv7CV5JYCTMopF5rUcQ0Sde0YYi/KmochhUsNyGqnT
 YNMoN2cW2+6kWwldlfLAu2OAhJewx6j5FPyyGJ3zAhYi3apOFK9Fv+Rry/RqOCbL2o6P
 vTSA==
X-Gm-Message-State: AOJu0YxXiRbaprmG9JaB5ux++7nOOgeiMxRk/OhmVlHA0NT9oHwXbfhW
 4fuSmK94ghfp0ZwKTYW/A0WQGcw2oc/+AYHgQyaz/ZQfnAQ8axFT
X-Received: by 2002:a05:651c:158b:b0:2cc:1f5c:87f6 with SMTP id
 h11-20020a05651c158b00b002cc1f5c87f6mr2727431ljq.121.1702552081741; Thu, 14
 Dec 2023 03:08:01 -0800 (PST)
MIME-Version: 1.0
References: <CAC8KSA2v9+yabrkxL1BNdPZQU8jVwh-a0J1+tERWzACcxJV+QQ@mail.gmail.com>
In-Reply-To: <CAC8KSA2v9+yabrkxL1BNdPZQU8jVwh-a0J1+tERWzACcxJV+QQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Dec 2023 11:07:50 +0000
Message-ID: <CAFEAcA8=Mj4qwMZk+jFkGxK8WftUtWMmzW0zVmUsJ19_YtQTww@mail.gmail.com>
Subject: Re: [PATCH v3] fsl-imx: add simple RTC emulation for i.MX6 and i.MX7
 boards
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HM31Pm6wY+sb

On Thu, 14 Dec 2023 at 10:49, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>

Hi -- it looks like you forgot to send this to qemu-devel.
Would you mind resending it ? Our automated tooling for
patch handling only looks at that list. (Generally anything
sent to a qemu-foo list should also be cc'd to qemu-devel;
not everybody subscribes to the subtopic lists.)

thanks
-- PMM
