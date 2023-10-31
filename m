Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp321185ejb;
        Tue, 31 Oct 2023 07:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYgeHuXciA4xtuvda4I5k6kh31Af2EU5I3hEpQXwaOVwFLPrMsN6/n6LXShYJVWjVbb6kd
X-Received: by 2002:a05:6871:a509:b0:1e9:bd5c:ae38 with SMTP id wc9-20020a056871a50900b001e9bd5cae38mr13370278oab.2.1698762361045;
        Tue, 31 Oct 2023 07:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698762361; cv=none;
        d=google.com; s=arc-20160816;
        b=X7GdHW3FHU3uNRO3cCudV+iijPHDp3TySSyD+Vbz8F34SeLV9en3F3BQfBp258URuk
         YGqtbGjUE3VVCcagEtXcv7t+2RgWRocO1HSF3POExUxWCbTC/514+WZL9NBhupdp67Kc
         f3RZ2cjBRQNo7E2acSNAI11hqpGEZS6ngzGkWuHAZIyi6HVw9B7svoL3ogYcWFSihT3N
         RPs20rLq49xtowOHg/IOnt8JkUEQBArucmrAmUscDchTiXJr3xsg6mKnEXVO0HUATejZ
         dBV7fnpuZqWztrfHRXiDDXZGrX4jhfxWq4YQhnMTdyCc+DOxGrBUfIOEmIyygnzkm65j
         j3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PV3LzPc7PL1PiTxwDU3XSSZS8OxNMaMVGyaMfMydExI=;
        fh=ZunbYo7vBCjqSWc9622LTLPHQcfFJMelhG0lIzAt0Bo=;
        b=HrJSILXPIvfRDQwIm/JHWY3TC+nqmjZrE6sDcwnAVY/61pMRVJafWiPE1dj1gFLema
         D7kgSlkbwS95RA2HW6DiEXgtWNXqVZxt+Bj2xqlbVcEr9hc7hkVLk0sUXtphk4SMwx3A
         gJ4pJNJnl2c0HS0k16OXlsSOvF7VKNv97KKiXGZVkpDhffI6Za6tUNm5Pr54NHy+JZR+
         OnbywNyVLHzAZAXaxwcKxLVv30SuXSlJ6SCgFGhEG1FTOkQV7KbVTwLFXWNqdQmK1TiF
         YEtTaFtX9EuMONcSQ6HenXn84Y7zEHv/t6Auk0Z/jjXtRaFHqL20p+8CioNEatcuz1q5
         PJJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TDEg1fiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05622a05c800b0040fd9f98527si1123258qtb.754.2023.10.31.07.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TDEg1fiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxpgm-00054P-G6; Tue, 31 Oct 2023 10:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpgh-00053V-9W
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:25:50 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpgf-0006zx-BK
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:25:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso9345712a12.1
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698762342; x=1699367142; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PV3LzPc7PL1PiTxwDU3XSSZS8OxNMaMVGyaMfMydExI=;
 b=TDEg1fiZ8XVfFtY5NVNljvmvZ60/hKxCR/0tebGzBGIy3L3lj0LDp8hYHermWXhcjo
 9vxLmZgm5XkeOf3pC7DNwqLQZqTTH5JyuOrMgP1W86rUDJ1xyvqKmegMq8BQjVaZYfkn
 STb1Ld4K0E7qPpTW30KWR5kCMH1bkGdKIZbXM7axEbv+x4soQpSMsbOVxac8/TSiQ68i
 foViaCwqfsFkLZGthsFIWyd3a2u/Q++D/CMf3lUNdeZ0Y7CGh/4+5QxDeHMoaAOlOF7t
 hlHHtaaDgVK9KUFHJhh4MgVC9zAgQwNlLCTX5Al8Gp1k55xSj6OLmomZQ/wCbJ9hridH
 jFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698762342; x=1699367142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PV3LzPc7PL1PiTxwDU3XSSZS8OxNMaMVGyaMfMydExI=;
 b=VJlALd9gFw9XXUWWWGe+heXRbLGvYX120dVRXdFgYNEbPj5TNh+Q6mnbmseKJ6WXM3
 Y2ooAM+KRyPrRvlziOy1SySHZszyaeKDJceiM65Cr35rvFUsKxDDRsMUoLjDVTx6aQj9
 hBz9u+wSJr+pIsMpcR/qN/UfqhcX4toIN6EMeUWjqqVF5XFzGlTHPwxccnUcpU+0Jx6i
 PSwtq11vi97UwLI3/ebk9QXSAfhcNHFxsomqXbekDgFUquOdMuqRYWSFZnJNDgokIa6i
 ek7XioBvZ0M+ggzTUjJmgqMXY+su0HMiHpzbtMIxnVcKEoatN0UQue7qUlJg27F7t3C5
 ZxWg==
X-Gm-Message-State: AOJu0Yw/LeIwmVDjHz66jWX+1Z5ivliB+rS6UOEpRp0uJk4BlFtUEvxo
 UbdqSLbkgDsXiSbqJSrmmen28IUxvf480X4ZmExBvA==
X-Received: by 2002:a05:6402:17d2:b0:53b:9948:cc1f with SMTP id
 s18-20020a05640217d200b0053b9948cc1fmr9723959edy.12.1698762341897; Tue, 31
 Oct 2023 07:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231030083706.63685-1-philmd@linaro.org>
In-Reply-To: <20231030083706.63685-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 14:25:31 +0000
Message-ID: <CAFEAcA-PZtTEAT2KtY=5=A-yCwS8rD9OgmnGjrYpBMXzpTV4QQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/pxa2xx_gpio: Pass CPU using QOM link property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
X-TUID: NXAEDkcmkecL

On Mon, 30 Oct 2023 at 08:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Instead of passing the CPU index and resolving it,
> use a QOM link to directly pass the CPU.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
