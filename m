Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp198405njc;
        Fri, 13 Jun 2025 04:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFi4NqYru/KLgL10pYj99SdpvuAZU1+K5xvH9NsGgcnBEcAihrtD8KEENlRRsgGwCqS97C18F7YE3Maw==@linaro.org
X-Google-Smtp-Source: AGHT+IEvVGayFphSDcZQcSBdTmG/mCw3/vv4OaevmNmA90u+HtjuPRz0FN5lV2FLX3YcmvIqfKfY
X-Received: by 2002:a05:6214:b67:b0:6fa:9909:12ec with SMTP id 6a1803df08f44-6fb45d4c231mr5916676d6.2.1749815933625;
        Fri, 13 Jun 2025 04:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749815933; cv=none;
        d=google.com; s=arc-20240605;
        b=hoeJ113fiFx1TCMHGDvcHTj97PChTm5Ph2XyQLjqzwDR2al1JYo8wVJFIgJp/0PZtN
         gu1/QDCT1tGMmHpu4cj/VxaVEjm5/zE+WcFqPxQFRjCDY/14G6Xj+lAgogPkrkGztRCY
         VJsAGWuz4KFpC5mhdQ86mL1nwLm/RudYNsVCJIQXETsn+Mw2IV1eliKtb4yUVA/tiokh
         3q3MJcZDmRUDh182UciDB0uJ+68XR25T/UXCsYUagR4KFJ5ai2GBdaM5LIkG2oErb8MK
         uVKlpKs2kFW1S84wZ+0qJr9jhQZswHzeM8ZbEXjN/250XZJ6iTqmVdXoiY2hbkj7DDBW
         8BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=06bdg0l26rn28k9vn8ghb+vBgTK6tLfHDh/fakpa2yw=;
        fh=ZPjMqELO/6R7UYZmHk81FR9LInkh7zzzTkpXgSH2aAU=;
        b=JuVZyW5sozo1WNfJaqNA2O6eRHuOqUeIU5aKyOBjICjoKPZJ377uHiQyFQlH+UXhop
         ueaQNG11aKLvECbIQ6JZ0GSRwIjXnmh2JWMUClDolizhc+pgY/qVvZOv/4a4b78NHh/l
         MAisLFtaCalX4ZA05P4Qs+Ai4Ry4VzDY1ExS7a9nQSWRIRRniMeJ5gY1dsYYhT2HTkb+
         KHWlo8ZfDYagAY8/580Fz/rsnoGtWrFA2xiMETQjbPtis4ODFuvlmxEMsEnLpJ1e3uip
         512jLvoSC4wxO9FoQET9de/3FcZPVBPMHFpGTkg6oqMVO03zBMMJ68Qx6LqqZ4RKERk8
         cRkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ntG+vYEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35ad9a63si37689096d6.36.2025.06.13.04.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 04:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ntG+vYEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ33T-0005xD-Rf; Fri, 13 Jun 2025 07:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ33M-0005tP-1B
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 07:58:36 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ33C-0006td-O1
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 07:58:34 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-710fd2d0372so23390777b3.0
 for <qemu-arm@nongnu.org>; Fri, 13 Jun 2025 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749815899; x=1750420699; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=06bdg0l26rn28k9vn8ghb+vBgTK6tLfHDh/fakpa2yw=;
 b=ntG+vYEejp3j3viE0t5I6UUVe6SsAxb31u1kZfLMDHkURaP+DrQeODYJbTXKXRlWZu
 FAjX5zRBrw2qRJX2elf2Vu7lf+RbHWREu9u+/ihhzTF8I1v+RV4YLNX/aIMvlm857+Xp
 VEuAmap7hTp18xdSYuzpGCPq8VYKRvbSSpQLIYA5Oa6fme1eFPfUJcweQTOvQby7Xz4d
 IGkhCFaxQZRZC0hSzLbzy+B2A0SvbpFUtXy0gDBmTnDF8ts1wZpTS5NT7cOpWvBytVfR
 NnKCPGTUSsscS7REciLD5MK33Azx7758oxfNuXPGD9oETuEaz7CBKu/krVv4zTnAIAfH
 eNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749815899; x=1750420699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=06bdg0l26rn28k9vn8ghb+vBgTK6tLfHDh/fakpa2yw=;
 b=rvx96TpV2Z/6XFLSBeSq11mJdqG6YLrhSpisialmqs0Cv/q7tApTByz0B71o3Lq1dj
 fMnzy0yzMEHCN18ItFnmZCn47uD8EDT2+hf+0s3XHc80uC4Sv7lSatd2uVxiPmWbFqZj
 CjN+1TSoe4zC/2EDukFl40tkFiYh8HYsZCetnTeXh8VR5r65Z9lRc79VA/EvQapaHZrc
 0bmanxkFh4P6WxQXhCsJr2VNqmagevAPttGVGEre3oqRSNNGxm+lWUj3exfz52NfRx0U
 1oJAjV2iS8PLCaiHvapgx65f0TFO4LuL3xJDeWvPU+rye2dH5dHIT0VKLWozHcVrtYqR
 klxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKY581Aqp1bw6U9hiH3XFEfyJ5ErWWPhR2yJSUiKsFvS85DzWkqDqbGmWQsYur7j3rJ9qgA9KaSQ==@nongnu.org
X-Gm-Message-State: AOJu0YwyXPnh+d17/mqNyRueyoBFiQqAoorY7yoQ/x0afY1cA0EnvdL1
 06mwY0UMjubTdseH9zB+tCAF3mh3dR8yGFrBYhHu5CUizhCHBsjebYkNS/DdolUTk6o8azkyeyV
 IG/oZk8qtmlUlXWGCpenqnsRFohTvHWEqCaxVL91j7Q==
X-Gm-Gg: ASbGnct7qlze2On+Sw97fFOkJuSdmvIRvtHxc2jKphMJM5RWteU7tij+Vinmaj8SBef
 Tz2Nb2PWYGo+GHQ18n0/6WrvpZ1uOAnDCE1+O/5nGeQPm12skDJmZPd+Y/YXVRvBa0CQNBdFB1B
 38GYfVlUIDCPgYqt1b/aHLs9jhBDTpmjKv9LkV98PvD+J/
X-Received: by 2002:a05:690c:7242:b0:703:b708:e15c with SMTP id
 00721157ae682-711725fed89mr5118627b3.13.1749815898847; Fri, 13 Jun 2025
 04:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250526085523.809003-1-chigot@adacore.com>
In-Reply-To: <20250526085523.809003-1-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 12:58:07 +0100
X-Gm-Features: AX0GCFucr0dj2qhX_l6JAHmBkVKcH2F5Ci89xShsAgZ_3F31NTiEw3dArLhnQMA
Message-ID: <CAFEAcA-2fnu9hsGirQ5FJGqtNktNX2X52UgQBu4yYN4WjeSVQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] xlnx-zynqmp: add support to boot on RPUs
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7LCkZR7Edr7e

On Mon, 26 May 2025 at 09:55, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> This series enhances Xilinx ZynqMP support to allow booting on RPUs and
> ease gdb connections to them.
>
> It was validated with home-made binaries. FreeRTOS was tested but without
> success: outputs/IRQ seems broken. AFAICT, FreeRTOS is expecting Xilinx's
> QEMU thus I didn't investigate further, but I'd still like advice
> on the 3rd patch ("wire a second GIC") since it could be related to it.
>
> Changes since v1:
>  - add doc for "first-cpu-index" new property in arm_gic.h.
>
> Cl=C3=A9ment Chigot (2):
>   hw/arm: make cpu targeted by arm_load_kernel the primary CPU.
>   hw/arm/xlnx-zynqmp: adapt cluster-id based on the boot cpu
>
> Frederic Konrad (2):
>   hw/intc/arm_gic: introduce a first-cpu-index property
>   hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5

Hi; I've taken the first 2 patches in this series into
target-arm.next. I left some review comments on patch 3.
For patch 4, I still feel this is something that should
be dealt with at the gdb end (e.g. gdb should support
"connect to this target and connect to remote-inferior 2,
not inferior 1, and don't fall over just because you
don't know the architecture of inferior 1").

thanks
-- PMM
