Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp397116ejb;
        Thu, 8 Jun 2023 08:01:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rMy6kQixU8WyjD/Kmv++p61K+5P9h2GfIli9Zc8ngraB/p1tHu4bYFHRyc1vOUVNTNUgm
X-Received: by 2002:a05:6102:383:b0:438:e102:9c13 with SMTP id m3-20020a056102038300b00438e1029c13mr1833822vsq.27.1686236482075;
        Thu, 08 Jun 2023 08:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686236482; cv=none;
        d=google.com; s=arc-20160816;
        b=1AZdnQQlAP0AoePaOg9tk2Yc0sCDpWUmxojb6JWgS8CssP5Bmzeya7zmSytk8eYZ2R
         e9HeqzB7bIO0dmnhO8hEDSUg+5oVet1GFC9fXkufEbTvoKOCiV8ezZSl8uqd7b6Ec80v
         PdBttcV0uiUYpgdO5nK23gZ4LMLgYj8OltewxJChM6nDGlz2kydUjBEkrjD6r0f0qXHP
         CNclQI1ugceu92+TfVd9ZahZC08etACc7GN3W9ICi4u6l3OfUm/ARo4pbe/T3XEuGfWj
         qmIwpM8AVA25EdeNWm/xdxi75kwavvtKSgIffEdG2cqUCcEmyE7UtryBdebWYn0QhH9/
         Ryew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zMg1XesjhjEzyBggs7JPn+EnI4gQJbzev1tC7y28zJc=;
        b=cnDfuEux42RqRngfKp5+Zq9dlJmiXpXfP56KR/IGPLFaoz4O/QAl+PfGNPBTrWLJYZ
         00BCtO7slYD0rvqPemPDlcncJNUvxy8+vTsnXUnZQx8ca0AskstQEhbgjRGm1b6DLtMh
         PRLG5KjZgUksRXurS3YVtEdWIIJP11iUWOYCFzNojVXXyQQn4snq97c8I9sFPw1vyfv0
         UqAfSaV38Bt/WSoYHjNu3UphOjyaJdmbopCHGdTT1jFOciVH0Ic1bQDtGpAZ6RKlFlSK
         AtlZFZE+A1w9HRz3CfibSsrF67i8KkHeQXZrR5fDcxxIKFcNYY2saTfrAvoCU0MR1Hu3
         l2JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tS8fsDmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a056102126e00b0043b54319df2si89366vsg.337.2023.06.08.08.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 08:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tS8fsDmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7H8N-0002ky-70; Thu, 08 Jun 2023 11:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7H8M-0002kO-Ao
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 11:01:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7H8K-000504-Mr
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 11:01:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5147e8972a1so1252438a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686236462; x=1688828462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMg1XesjhjEzyBggs7JPn+EnI4gQJbzev1tC7y28zJc=;
 b=tS8fsDmU/RTBnFGDD/qK6j1L9ktn+rd8xteCXK+qr8QBZkvcjcW9MKxnCaR62bHRFd
 QQK7BE1rWBorUexRMZLlnOfNWWx+5c45G3o+ikp0XzK9AdeH+KjqOuuUtxOmp9lxuHBg
 nlLbXX06Wz3M8sGFdHL11d5sLKDb0rTJV4dqLhmdJIvtdiB5k2ChYai3XcqfgS36k75Y
 cRbAlr3z3Biy6v8jAnJHc3d/eyHU3x3dmcwXZPcXZjZ+ZRyMRemo6tX0Vk+jEThglV4l
 DhCXbpef4sQQFC2B7mTI83TIY6wktFy0eVevo2TjYebMscQTgYibGpig+sUycn2wYfS/
 qTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686236462; x=1688828462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMg1XesjhjEzyBggs7JPn+EnI4gQJbzev1tC7y28zJc=;
 b=ZM7KeNbOiEYbQONj2sRQNcTUtPpGjFtk/I+akCYGyPEVWnN3rl01ZgLUK+19IFTCyd
 68FDU96eLcbapAki/SB/DF3ujRvMhhX7PmhZCaYdH8kFR4/TbZpL+cjmOkM7XpolJQhm
 xrO2f8xssewgltjcNve9KGTgAZG6lOA4EukQOg68+pco79NVF2zUNYEE/qK9Dz4Aq+S4
 l2E8N9RQ1mJ28cZ3eb/a7LIFJF08zwzpBH7eFW7M5S8saTU64yRi05+0pB333SWy9W3+
 pausxLNGyLS83ag4m4OXF6hU8imPpUwW+dNaECf92U1RaYDSOtSZUTXR4ChcU8nbBuBt
 zB4w==
X-Gm-Message-State: AC+VfDwEzHV6EEtLqBumQydU3gFIpjnFgG2laup6CyV2JThkK7KSMb7P
 gzIEoAeuOnTBaPYsDOcriph5AyUnSCje9cl9AozbeA==
X-Received: by 2002:aa7:cac5:0:b0:514:a696:1255 with SMTP id
 l5-20020aa7cac5000000b00514a6961255mr7031245edt.37.1686236462474; Thu, 08 Jun
 2023 08:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-13-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-13-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 16:00:51 +0100
Message-ID: <CAFEAcA_BSA8s6_8BbMZG9wGWMg78u-k-GQ8ZG8n-MUCRNeEUDA@mail.gmail.com>
Subject: Re: [PATCH 12/15] hw/timer/arm_timer: Pass timer output IRQ as
 parameter to arm_timer_new
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: vrYsNvmE1lEl

On Wed, 31 May 2023 at 21:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Both SP804State/IcpPitState peek at ArmTimerState internal state.
> This is fine so far but we want to convert ArmTimerState to QOM
> where peeking at QOM state internal should be avoided.
> ArmTimerState's IRQ is just a pointer, so we can pass/set it via
> argument, avoiding accessing ArmTimerState internal state except
> from the arm_timer_*() methods.

If we convert ArmTimerState to QOM then shouldn't the
irq become a sysbus IRQ on the ArmTimerState object,
and the looking at the internals go away automatically?

-- PMM
