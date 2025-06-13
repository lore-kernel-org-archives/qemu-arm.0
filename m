Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp157652njc;
        Fri, 13 Jun 2025 03:33:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7lZwlt6CRS7gNAP+EgmReJHrYLVprlrGeSaQt1J8BY19IbJXnihAaG+tUAW5xD0u5RukZkBePkGlRhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGjhOAM6X1MsY7ZD0eOOI0Rd7Y/jpX3g12mzvH1Js8U7dsmcYELmXBsAIMSdRdBs48/Lxi1
X-Received: by 2002:ac8:5952:0:b0:494:9d34:fca5 with SMTP id d75a77b69052e-4a73935e9c4mr1741441cf.13.1749810807633;
        Fri, 13 Jun 2025 03:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749810807; cv=none;
        d=google.com; s=arc-20240605;
        b=K27xN4ek5q2/uLfrA/YLBT5mJLMcxYJCD4eLt23Z8xxUg6+MwDvKjjwJ4zu+mX9KI7
         X4ng4a+Wlmtf+439rPoQlpRfw3ipFmYo4srimtTpXzg93wHhMHbtz2C3/c3HX8nxD6Lw
         Zyg9M/Vc3oWyYwgY3vWhcy7O3LsuA7JPZWjYw2wU8EGIaavRiEsp3NH0n/yNM7h6bZmx
         x3SiDtwa9Vi2Tplh5JXQ8zwjpsrvO8Co/1Lp8lSGM8DIUO8rDJd3cwUmaUGl1RVL/jcf
         lKW2xZ1tFaNck9zau260E9x6JFvD/wsEPecD+H37pMH9NhJssVaPtxztfATAFq+Cr0xz
         KMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=If4kGmFmMukX9qb+e/hifH9l/FBRtkjVpd8CeCvuk1M=;
        fh=FNudadoawSFk0ItxW5BPYw1FlnMbPuCy7yvRwFbvX84=;
        b=lYkiifz6iR7roL9oS+FAYFoysrPr4LTAcfNNR/paSA8U9dffiWseKAI64521sYFdxL
         /FEP+fvPECo4eftaGD/MjgiNG72+Ecj5XCebBki9cD9O95ob+rh4y1BIo14aWaaMKPck
         iEV+1m1hgGdSYL8IVpGBxS+x8cCLPuIKkBd0xe5lclMyhimYjNvi0RO1PTxDdY/0zueO
         gHy2VWoSRaE6WY4a3mN6Sl7TY9gTFbwfaHUS7aebPMjrPgwAAU/HHM7rcsAZDagXzV2a
         rNQUG3is9D6ooCYOv4/NtoabR2rfi9WIYQbgnAqjm71TBp3dfsdVoYhNtGBOEsuIQYEt
         jzZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lNC/VamS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a51fbdesi29557461cf.548.2025.06.13.03.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 03:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lNC/VamS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ1ia-0004MQ-Su; Fri, 13 Jun 2025 06:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ1iZ-0004Jh-9v
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 06:33:03 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ1iX-0001DJ-OX
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 06:33:02 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e81ec95d944so2640751276.1
 for <qemu-arm@nongnu.org>; Fri, 13 Jun 2025 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749810780; x=1750415580; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=If4kGmFmMukX9qb+e/hifH9l/FBRtkjVpd8CeCvuk1M=;
 b=lNC/VamScBUzs5dtZM1bzuTsVatW+M1KuMHTdzpsmElFui/j01129pN02y06LIdEPQ
 361NSHCr07Erl8iNqjvuIpGH1lbeo2U2Bz2ZJkCVlcVXL5wBBFMd9Q/2Ajgf8P3L9Px0
 SfIvpkzDt5NcsS8IyhGWUnjX0Luox39fN73UoBboDK26VGknIx8ApIYoxkNEGC3edj4i
 dz0ZbCgeRbboZRpwO2qv8tMD90NPj61v2rTW2dblQ00gPU5+cqOkLeAY1go9wsxqTJmr
 DXvlvTKli1Ts3bqLfNZ308tki3STpCAnRhwb9qkKnkD32chbw92EoiwYHg0tUZ3RL0e+
 NTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749810780; x=1750415580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=If4kGmFmMukX9qb+e/hifH9l/FBRtkjVpd8CeCvuk1M=;
 b=jMmZgzoSmFXTej2Y7lj/hV1REPDKDn+ueA0JP+A3KaNor/ZRGM+soEusq2DQVKL5mY
 AmrPWOUO+YI8PJxNMrMFVFywMMmUSACm1f/lNuk7qaBN8vXh95kChojxRY18Kld36Z7r
 4T5clI1S09SV+rmfBuL+XmQcZ9/q/D/6MOQwchYoEoDng6I4MJMvENhdVe8TRRpbI+pu
 VRg6RUHXc/cfviDehc+g+9ohXtGSM/65C5PxFcZdYtXLzdxyJS5WmEuDgtJPftxcJOjQ
 eo9T2p0D9wS2M2qcSDW4vKcVjQSAOON4f2tMxHqIoUmYNYX9DonS40AztRALiNYW3HsV
 lkZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWKi7c5QNB9WOR5AbwXbImBqicyOVCsONiqXrBxC7T8Nj/+Roi4E3X56QQbqZ3FchoFu+JY5XQyQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx3lLeT8Gg3mAQcQc3ZmaSVU5cABGoe9ADpXeWEmYY4KpGoDbkG
 3mq+mf7bqWrjEjpNwQBdpFzBkKUeYOkP40cQJkBTHm9PfMOS3bcIlnglgOycYW/hmIUJUy3Zn6R
 fHRgBrg0BzoAe/x6xRvw4xtNPilljH6zT4uqtf5uEOw==
X-Gm-Gg: ASbGncusRYV6K6bhY+AK5bt6z3Dj+tdW8SeHiDEnBI+rgBwNYtqx6VLW6UiDsPlb4Qe
 Ngy9v3F48sjKnO9vbYN/kWtnoGzGdlLn44TjI775JNfx/1nnVzGmgX7s/zJVxgLaulPtfDXlh6J
 QO54ujEn3mLcjNAAo+qy1SRWIF0AOBrhCpxDc4Q/XR8JbD
X-Received: by 2002:a05:690c:4889:b0:710:e81e:1364 with SMTP id
 00721157ae682-71172580180mr2107187b3.6.1749810779990; Fri, 13 Jun 2025
 03:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250526085523.809003-1-chigot@adacore.com>
 <20250526085523.809003-3-chigot@adacore.com>
In-Reply-To: <20250526085523.809003-3-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 11:32:48 +0100
X-Gm-Features: AX0GCFtmefTMxKElQsTWkxr_1RmuiosBfIx55mWgdZALc_62mNdeFhXeJ-DJXAM
Message-ID: <CAFEAcA_XFRNJgN4dYe4euqh-u5-16ncfgtu2bOLR0tYamFUCqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/intc/arm_gic: introduce a first-cpu-index
 property
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: auRKM2P/ljdl

On Mon, 26 May 2025 at 09:55, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> From: Frederic Konrad <konrad.frederic@yahoo.fr>
>
> This introduces a first-cpu-index property to the arm-gic, as some SOCs
> could have two separate GIC (ie: the zynqmp).
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
