Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp901510ejc;
        Thu, 11 Apr 2024 05:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2WZh4w00qekrf9cdRpNN4NtKdJ8TSQK5LcTRlbI8PhlL7pnWNEpTZSfo0nl9pxb4TsdpMmBnkb7ab0Hk4dwrs8mMa6RGX
X-Google-Smtp-Source: AGHT+IHoILDcm8tvKqz8WCkPErYzNdno2vyGSE+Jk7zYiOvLTz1WaRg+oW1i5ipmc3q+8EOPFV/L
X-Received: by 2002:a05:6122:3c95:b0:4d4:1551:6ef6 with SMTP id fy21-20020a0561223c9500b004d415516ef6mr6591296vkb.2.1712836893482;
        Thu, 11 Apr 2024 05:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712836893; cv=none;
        d=google.com; s=arc-20160816;
        b=B3ere2FVNHCo5I/cFzVru+a/Wb5LUr2hzgcTw9M9bG6FRCggi7FJ45NJs3AohmTHIB
         mDuuRnjdA3aH6/YXZkog35mfTFKzYGY227XiwveIN0JhqDI5WnULLwyydanr//tJQAPi
         rGzy8mMkeEG0Op+ljBm3aR8auOMX86+wx5hg6ugUw9htHugHPDnN660wy8jXjyxPPfat
         AuGU6tPue8oaWceR/DfCFsYRdbd27oXToTqZXMFK43F6lc1uDzEIBTTLLHXMTjfmh8K/
         RXAw1pH1YqzBz04h1MTpu3K0FGfx6iLgContetCUfXibguROxAhwpbz/mRonhCQvgke5
         QHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LMDpvBCsKme7SnyejsGjoTv5/y0095tC1fHhVZYZftw=;
        fh=Muv6m9kKlJJgLLlfwYnMaHNDlL+Bcl7qyaKLQGOpGmQ=;
        b=Ag6Y4js3AiRHv7YCNkAs5mk2Kqr/nDOhLPaRcCKA/Xi3ZAOzub/sLBJB/1W7SBQvtS
         hITeLWafkCweeRbYtPXV6Fy3pUN3hELc8iBg6W7hKdq2pXv01Ebc/GcJ8ZTRvJLCjYXQ
         3vIWCVAL22yJln00dfvkn6F0Bto/QuzwolgJ42xKfz55ram/ctDJAax6Oc3WjUK8KrY6
         E36arSCeRkfvJtN/KjIvk+I5laeh54XcT1xkKR0y7LGvJlFabG6TkM4XsOje1r1xueA8
         T2G+qlCYTyhUn94OjEMum1SQiYETm+4HkfuSAsJomgvGkYAAypNX3LFy9IhlPzT/lTwF
         vJYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHvfATcU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a056102204e00b00479c8397cb0si99822vsr.740.2024.04.11.05.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 05:01:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHvfATcU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rut70-0000dc-9v; Thu, 11 Apr 2024 08:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rut6w-0000af-53
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 08:00:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rut6s-00037K-EF
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 08:00:56 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56fead80bacso591152a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 Apr 2024 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712836852; x=1713441652; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMDpvBCsKme7SnyejsGjoTv5/y0095tC1fHhVZYZftw=;
 b=YHvfATcUomsQEX6NupZR8zDS/FxowK8HhKjLhqCKI1AbD8WLvh1gpTE8fDqBS0N55u
 Whznk5p2NXNEIb0YDtiQrf8DwkRcFQ3HLeK44ZRDWwevCCZDY4WmLfL8Vr7oBgL9mNa1
 1tsmf/Tz/ynNzEt8/grIy2+jkvRwop0YGNIVO0CpgErteLoygRm+NQ1FsG0+ZWXmaDTY
 eXvKXLD5xzxt2Q537CI7e80JbrBBsWlQ8/hJVWJQRoPfdHBaZS3cs7EpZEgBZAK7WDen
 jT3yI8WIfHtAs+EWfAvx0ZkjblbczJfhW+4oRYKRcNhnZncUCiDnj2wLUkJ0qUmWyFfS
 EFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712836852; x=1713441652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMDpvBCsKme7SnyejsGjoTv5/y0095tC1fHhVZYZftw=;
 b=BsqG1+IkwiTfC1AZ9dvQKMLFU/8MU579M7gToQsBhJxzBxT5olCY6LJqdJPHyPO8tp
 SQv3I1QqmoBpgR6HPfS0zdqQ//j7dOuuJALDZtfgoJ6aFS9IeQNcwEKyu28y2XubQNPV
 0rpT7IuiuMVDWX4C3xaJMb+Nmo3Nubdy2AxlkOJjmGcGBsZf/M70akc3ggKJFexjF9Mz
 XD2/+MpasthFThRT7LEKH9KANZFfjA/+GcLnT7mUxAbvczE4fKNTZR+GDbkCovJmU3vs
 NYB5d1kFRHY8PnktcxmnsMIEoyyst0vSgBo3fPnvs3vz+23N9S6fK/q+z+5j0Nm2QFod
 h4VQ==
X-Gm-Message-State: AOJu0YwWSiSkXOSC2YEha31c1Pbz2EYtOzSBjY7KxlCBId1FS09bpYEQ
 iqZbyxSt0oUC0hvaVN2bBLbJzD2+lspV+/3tP1bP/wrjDeC2EAj7neUcTcX1uXSFePg14Lx37J0
 XPSWk2fNmiPXOFO502s/ITVee0EWk/aJ3wBPljS8Wwh3bKL7W
X-Received: by 2002:a50:c30c:0:b0:566:2aff:2d38 with SMTP id
 a12-20020a50c30c000000b005662aff2d38mr4262976edb.26.1712836852116; Thu, 11
 Apr 2024 05:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-4-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 13:00:41 +0100
Message-ID: <CAFEAcA-tRVJ1+cXwmGg7XGdej_iRLYy-xYM6q=s_D4pmyVcC9A@mail.gmail.com>
Subject: Re: [PATCH 3/9] disas/riscv: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VrDnGZJplZq9

On Thu, 11 Apr 2024 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
