Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4206000njb;
        Wed, 11 Dec 2024 08:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXepDTizE/DWuXW4MBcTICnCHm0uDov1wPKtI8nSejtFeSw6XKiS+bUs7/ry0+/YSATpLdXHWm6lb0tvA==@linaro.org
X-Google-Smtp-Source: AGHT+IGkNDPxC/d72d7+YAMIqAT8HNIjLYS907okLh/XdYjMcMDRQWr6it4wL8epbixwFaoJLD5G
X-Received: by 2002:a05:620a:1a95:b0:7b1:572a:cd2a with SMTP id af79cd13be357-7b6f25432ebmr669685a.14.1733936249316;
        Wed, 11 Dec 2024 08:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733936248; cv=none;
        d=google.com; s=arc-20240605;
        b=Sf6VBH39Zd6Rj20Qus1sI0dl4fH47AwvwMf7CeqxWyPeyYI6g9cWaLHOxJwFfxzRA0
         8ygNJO4Dj7QG3K40XkL6g9YZIP925Q7LZCg0iNEH9w10+c7lOhE8z8pN9o/2LqF6Q13m
         xjDU8qs0k7kEv0+OMdECmar2r2Xx7Ul0ox5dUyTgSFBftgjX9OeZNsNNjFOMtpX4gFzq
         3o6e61cAxmZ8hbudGOySwR1KIap7V7gwRSHU0EALpoqRv65WBtqXWQuBG1TKP7hJDpdu
         vwm7l4tjJeAN1Fczpl8YiUfABMrw07vulu2ZjF+aKa5gOpna6sSz/QKjrEG+efVp3P1/
         ExmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EUQuTpWm9UhAvSvm45A5MM3t7f+CKFSui1IV7sQT3z8=;
        fh=8MAXjpvdrJdU+1o9vjZFSlxr/72Coa16m6YrG1tF2mw=;
        b=UPyYhlZxqGseIeVBRzlFGflxa7Zr2Pp3WIg6RLerPFw8n0Sm5YZmCf1tctYAAducRI
         E/MvauNtZUmQUwp1V41EIGloO467RARZp/l0k6TF1d2P8viS3i/iLaygWSnS9BrcAs0c
         c+pPIxDPwsOInHVImQoRxEaqdloP+uKs+1gP1mjrtENPEsIgCHIcZYWuAKvnvxxQZ2lz
         iVgkODkO5bWR8WIaTPjkmJcYHJ8z2lDzU4QxILSxvyGzHuKFBHJtxz8rPXo3UdHatAQX
         BKwmYgPIR7EI5Bt0/1X7mV18GdKr+UigO/r6cAxi4bd/tYa2qpOlIZOWsjly/cUSJRsI
         dQmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOQW3tCI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6c8b9bf90si1172591185a.205.2024.12.11.08.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:57:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOQW3tCI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLQ1C-00039O-WE; Wed, 11 Dec 2024 11:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLQ1A-00038X-MC
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:56:56 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLQ18-000644-DU
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:56:56 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso5584371276.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733936213; x=1734541013; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EUQuTpWm9UhAvSvm45A5MM3t7f+CKFSui1IV7sQT3z8=;
 b=iOQW3tCIbaPmDgXTp4kGHkhYgDc1AhXx5IHZ9OzhPUqskE1VQo6FQJLFrnFY4otjXt
 EJ5VMcCrgM0ZKp7LSbkzzbVHoOiaYlXhZeNJvYeSciD6IA9ZK73r6mElFZvXGHNc3YV5
 ARkUDXOyh6V7EP0MHj6WmCqD1tFqKCjqP1TWpuQkRVH23s7KmfTkxiJ7qq81g5x+UNEP
 A+jE+aHfjci8w2sdFK3hAZ1MqPiwBkvnmMXNUTZfKiZGde4Eb51GU6s6QxAUe6TS5Wfn
 MDz8bTyP7Qy52OPRfFbEEGZs0cxX2azx/wdYppFpYYHBrA2O9fCOBPBjvCjGwPi8bkpG
 9RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733936213; x=1734541013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EUQuTpWm9UhAvSvm45A5MM3t7f+CKFSui1IV7sQT3z8=;
 b=Nq8fnbyGdT6jgi27aDS8E1gEOZ7FvLFueYSnsdnE9SmHZHhEMLouZ/n+lfUwnZ8Jax
 TtzdhKXEWX8HJ5B6Bp+eOi5ATu1tWppT6pJ/aDCDRAQpQTGaV/boxbVdwQelRxy9rUFP
 56Pjuz6vvmiq621N5gzkqeqSqpyGZRK9aKX9Jo11Z3EDis9+PmuS6EHaX2gIaq+MvPlc
 CFWHfUfd0jXym7E7U7ZY2L5qatRQB3i6fgLAHqqqaNrT1friABV9lV3ob+1uNMXaUFuF
 QHed1FTLgCadsuJAy6QM87bOT9gmzvwnhA8BsWa6CmIpG45W/7auPCQLZ9DGUTAsRGHH
 N2wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4/Rmtgyk/Qium8UHb4gRO7hOoeqGI5h7t2IqtjiyU3xHRJIPHozJ8Ez7+r9OMY0/TeM4qCIBXXg==@nongnu.org
X-Gm-Message-State: AOJu0Yw51YzEnTwu+XzJzv3Xb+APchSHntdSVypx7h7uTeetPNAw9bCk
 8KdfpOa8uGyTvbZ51N7p8iCsPrv9QZmjXOgRBHS2jtgo0e1vNqd4DTZpAeqv0eOegHSZNrgkVIZ
 0rfvbZJCvjRi0f4ezHqVC/r3uyeu2aeuTeZmZFw==
X-Gm-Gg: ASbGncv08BtOIfnsC/9FHfooXmAfiGAkNLIT0fDoijQhtAH/ajcVvTYQ4rQ+qsAWOvp
 zW98hfyExtEdSKo0mNl3cEGF9C3ILEi8AMmno
X-Received: by 2002:a05:6902:c0b:b0:e38:85ae:4667 with SMTP id
 3f1490d57ef6-e3d8f580680mr99603276.1.1733936212910; Wed, 11 Dec 2024 08:56:52
 -0800 (PST)
MIME-Version: 1.0
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-8-richard.henderson@linaro.org>
In-Reply-To: <20241206031224.78525-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:56:40 +0000
Message-ID: <CAFEAcA8Td+0yeAD3BkEoik1Wpo39WW3sZ5AGQ1N4j8WGvUMFCg@mail.gmail.com>
Subject: Re: [PATCH 7/9] target/arm: Convert sme_helper.c to fpst alias
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
X-TUID: vW5EYR4D/fFC

On Fri, 6 Dec 2024 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h | 4 ++--
>  target/arm/tcg/sme_helper.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
