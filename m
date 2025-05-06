Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3110296njj;
        Tue, 6 May 2025 06:18:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3B1WZY2G18EgT87/YKKBMeKRnczJwR+0lEkRPi+ZTg8ZMM6+A8FI6FovZ3aV3EVfsAwVNw6oMcVgy3w==@linaro.org
X-Google-Smtp-Source: AGHT+IFmdnvdnnBFXrZVkWYBQAsEK5YiMykjAFanOTvfIrn4h6wh8lR9Qujj0ul9aNY/Cbnyp1oe
X-Received: by 2002:a05:6102:2d06:b0:4c1:86bc:f959 with SMTP id ada2fe7eead31-4dc637deb03mr2564048137.8.1746537500567;
        Tue, 06 May 2025 06:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746537500; cv=none;
        d=google.com; s=arc-20240605;
        b=aDAz5fByqECQHd86CRH6bZuZ6ZyOC/nQahyHEmToGaKjZAI0RdD2VWgpnfSnuG16g+
         JRMWhR5KIbOlghB7p340ocONyOx/bpKwJnLE5Kqw0abxMMeqm3mfXAe/0sRMNoWnpLel
         RCi6CAsXZr5Gk4zk9Qz53kss0xfSWA2Mtw6deJRAsIy2Cd0tdsyOuuvRNhNYN0z1HsnK
         rAeJc18SsUoI9LI98Of2C5e9X1osEX56ATfgn3dwOECJ0+GLpllrzPBVu436pAYagW81
         INgKFb+ik4bqQ6DkYPKedGkcZ5xcI6afLEgo0CX1CAIKp/6JIkAYNj7VcM7lYb7Fpwnu
         ukCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ry++gvQ3ZjoGDclwTqu4Yt0eg9TEBjs1UwzqzuDBf2s=;
        fh=HkNXsRQReAIWZZbcBaGfAGuWEZAK3W6/jk4XRtKW71I=;
        b=N2Ynk4pcPRSAKFJnkaceIHmGsmlojhWApBYmTVQn8yca/eDrnuSLFHk6VySSPLly9t
         UOql6QSfM9pCNSZh9/gW35+ZUaGt5aoOYCKvMkoUgcamPmjKFpmIkNGuaf4DqU+HHDsH
         Pw426RHehE+VscDrEEPwWksqKNircjD37z1LAy+yiBZZP5+ArC+PZ+Wzirhn1aLQZ6oO
         nARUxa28woKx7LWo2fXkO+wV9yzrzWXzz3ToNUdvIr06eFJLCuFLcX2ubhCPr8R270fl
         7YMtaFIDGpnFlvl1dVyRbKVXancsJYFfiurCstJIEiSITObHqYUhOfa5k4EGH1pdH7EU
         +cNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/PmlKz2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4daf22e74f4si2371215137.97.2025.05.06.06.18.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 06:18:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/PmlKz2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCIBT-0001Qv-1Q; Tue, 06 May 2025 09:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCIBR-0001NS-Mv
 for qemu-arm@nongnu.org; Tue, 06 May 2025 09:18:05 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCIBP-0006lK-Fk
 for qemu-arm@nongnu.org; Tue, 06 May 2025 09:18:05 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-70842dc27easo53397057b3.1
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746537482; x=1747142282; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ry++gvQ3ZjoGDclwTqu4Yt0eg9TEBjs1UwzqzuDBf2s=;
 b=G/PmlKz2ZGEIfKQKOaFGQJToYX37ifc0VJWEgfHkuv1PnpbWyyp8oZ+sF40a5t28IF
 Db0tSQKCPJWiyA0Pg40NMiPL+9HFH47NLC8mg3s1o1yuqVvIfJHmZbVb8efnZbazKdEo
 aTxI06P/bV91sz/+DohTnY50bk6O+ZF7bSbxWqAZFvYX8e/LmuA4dyeRAQF6Of9v/coW
 Tcod7dhEX2Nx3QPs5HiUbIsxZ/iePov4CiQHxTe4gM13vbMBmqbS3p/eOSdkn49fVYfE
 zqPPKA18ncH/q1HdL3iM745/5zIEP1DwMWmJN2Unsmx0mEGjAxLo+JXNvbhFfvdBFXO/
 Tvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746537482; x=1747142282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ry++gvQ3ZjoGDclwTqu4Yt0eg9TEBjs1UwzqzuDBf2s=;
 b=VoUY6v0EffjE+q2S8BouaqgLTytvSkKJBmYhXCjQ/po+7+Io8hRTzhifzHkssQBMT3
 z49/Ncs07hF6lWaiZWmVaH1sI4DW59iB/7U/fkE9J3HMxGXuRmViwS/7ytjh2DcQO1OW
 aTmZ5priM+b0xZk10+x1yoJ4zCHL/FXlL7bYK04YhJEIT3s8HOwXz8GqtdgeanDbiDNU
 Ta5BelCI6MTCu7KICQ/ugcnq23XGzLV3rYAqZaSxB9tByGhe1j+8gBvkMWcxmsLNJEH4
 fRPhFO7C8wexYpk3jhPg0Sf0y5kOtd8WGqZBmmCMGnVKJoQgwFTHhS26ZsxfsG248kUj
 J0iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwC33i/MO9tXsesun7W9VT146UWp1NoSwBsGOsfQDDYAo6GqAYAaRIq4zeJ7/pkB3fWlC/mgzTTA==@nongnu.org
X-Gm-Message-State: AOJu0YzAxCYHtjTT+ne0qpg5Du8j+wLnwIlHvPCIFikj78/xqCpYi1RQ
 BuF3V9L3WzIvW7qma7UV8sCQAcxYgBNQHqR/Px5/L+k+k5fTMYsEzmzsmZxhpY+FEK7vDdZLmXv
 kMqaVSJd6uSfNEoU5jm16xqHZSe/xfYjVp6Ry7Q==
X-Gm-Gg: ASbGncu5IwH7Ym83+T0AopRgKZqIl1lVTQveOtgu2h0bDonhoZD3d7YGPa4e/9rfmdE
 kG/9uwUdfCBVEM4D4vGgEgeu2kivCtXjjf0PMR4k6pGAFLj9c/6dlw8VKa/OgGn44xecvITzP6o
 eKyewEk3wLi1Azji8cfqUexrA=
X-Received: by 2002:a05:690c:630d:b0:6ff:1d6f:38af with SMTP id
 00721157ae682-709197abf3cmr40581987b3.4.1746537481782; Tue, 06 May 2025
 06:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
 <20250318130817.119636-14-corvin.koehne@gmail.com>
In-Reply-To: <20250318130817.119636-14-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2025 14:17:49 +0100
X-Gm-Features: ATxdqUEgJqvj0g1MSL5cr-jD6Fh2bVFPb-pi8FVTpFFgz9-UeVtrlRnISs1Ivug
Message-ID: <CAFEAcA8sEVK5eaQjd-LmHtvf6Foj3ZjH1D0SMPoqQXGJneDCBg@mail.gmail.com>
Subject: Re: [PATCH 13/21] hw/arm/beckhoff_CX7200: Remove second SD controller
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 qemu-arm@nongnu.org, =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: 9vvXYQtVZc2p

On Tue, 18 Mar 2025 at 13:11, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> The CX7200 has one SD controller connected to address 0xE0101000.
> The controller connected to address 0xE0100000 can be removed.

Hi -- I see Edgar has done some review on the first part
of this patchset, but looking quickly over the second half
I notice that it has quite a few commits like this that
are removing/changing code that was just added in an
earlier patch in the series.

Please don't structure the patchset this way. If the board
has only one SD controller, then send a patchset that puts
in one SD controller, not one that puts in 2 and then
removes 1 of them.

Similarly for most of these other "remove" or "adjust" patches.

(If you want to add a board in a way that breaks it down into
smaller patches for easier review, one way to do this is
that you start with a "skeleton" version of the board with
e.g. just the CPU and one or two devices, and then in
later patches you add more devices. But in this case the
board code looks small enough that that's not necessary.)

thanks
-- PMM
