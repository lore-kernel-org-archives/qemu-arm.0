Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp492256dyc;
        Thu, 3 Jul 2025 05:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnNMhaGVrFaVSmjDIYMXhz35ID6SFzcILAgIxxD//buWeLDQlPZPHBxRB72pPh565lZzTP6TbhLkhwZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1MjecZ+V3oaCnZ2VhG21LcQL7llnTqFsC3x0EL70crBxtyhpfL+HaNKbt75M+gNayEgby
X-Received: by 2002:a05:6102:4492:b0:4e7:5f31:7443 with SMTP id ada2fe7eead31-4f174aa2e37mr2420965137.9.1751544901132;
        Thu, 03 Jul 2025 05:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751544901; cv=none;
        d=google.com; s=arc-20240605;
        b=XDlGnblIt2yEvXpVl9o0mV61XcksGNA4vvaWA8sHcKunvCs4NKg0KF7hKHzEKIssRj
         XGc58J8rRigzkT0aTHCA45hOBof0HpumpGYjc7tv2ANGQUyfM8OIv/z8qJj16s1lbL9L
         NC40tf21MYiyuNepCumvV7MGhQc9c7WEc13l033oB2cu0YWyLJGhuoOAYVP1j14WtcEZ
         Y2OqySELcgA/3M2zRB+uL2tn0MTHkNEo9OIJpiOrUvWcGOHAhEn/1uvlm56NwcGoWbRy
         rmTO6OacG29p4xCghJUekqfdtkUPo1u+xZJbzCm2I2EhCIMagJy2686+rWouU/qFso57
         qXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SJl2l/ctMmpsKlO9p9I1LFFMligMTxXXm3NiBVrJTgc=;
        fh=65dQNVJN5ooY4dLKcD8DgB7wyXYNQW9ekBiRVnFStGE=;
        b=Da7iRAz6qyezrUeXqQ//kRs5AqAVxHRWNf+bcTsDciGwigR9kS4ub9ztGrGJA1J3Y3
         hhwXSBETmQDsnJuDcsGjmEDd+R6A9rEW53nIN5qg3a1Q/nA8+9NdA6q8yR/3rNLiYqWz
         eqaDGSUydvqOyD62Dn/NQbsYS/dpwRghATnjW2KBV88wLK8WJbrwnwRKksyUUOmk2pWZ
         TBKAY2UZLljdI7C9AyMu2PtwQRghg3n9x5g1jtc4lVsLyejASHj8pu03xxYg/vh/5t8Y
         0GmrYcvlFOomKO1JXZvCjvgRWeP3pCPqWe3RX3CrjggvH+E5GXM7Ef1tY7yyXH1Ivhj+
         v6XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpEGXgv7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4efaa2deacesi2425822137.90.2025.07.03.05.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpEGXgv7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIq6-0001tO-OX; Thu, 03 Jul 2025 08:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIpa-0001pb-9z
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:14:24 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIpY-0007u4-7M
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:14:21 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-70e77831d68so58566027b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751544858; x=1752149658; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SJl2l/ctMmpsKlO9p9I1LFFMligMTxXXm3NiBVrJTgc=;
 b=GpEGXgv7pqUqKQ62Flt1i7gZSp7O6p4xgqih4GxzgxNvyqfPqVgni756LE2biqC6d2
 tmvcktfSWliPV5U9vjxfIHutjkeBl4WEI7maESThR67oJ/2WN8TDVcQOc4cskzK6LM7f
 C4yivx5wgWzlLjPR6la8usrRMwCt16HsPtbO8oP8GdFKwwHXTyMEWCZqXBsxynHrMUiX
 CO0Q9BMqwDZz7/WdVZSTpw+PRSmrTvkYhGU7dRnZNsGzeK+4phMVHE0Ai6nOLTQhQkMV
 AVuX3LF43VtQ9oA9AzWoInBbU/jde/QCjfB+A2KuW8O7HNTkFlRxOV+PnTblcXvU/lfI
 4YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751544858; x=1752149658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SJl2l/ctMmpsKlO9p9I1LFFMligMTxXXm3NiBVrJTgc=;
 b=fJlYeoI3ZaDNSV/LSgk7lke1e9nkN5QJaLjceJ2JE+i2eml7/gMKxBHkm3R1sUQypa
 tnBuDyb76Di6AzQ6qMBwtN6EaxdyzVNKCSZt6uPDG9nI62O34wlYmrchy61GMwYrTHCq
 Tp9pz5zbfIx+YxKQyFeX1oPWnSCVyg1buRK/6CFezyhxBu1MDfTaZ+C1JQabZZ9k2I0n
 Pgku6j9hsCt6VR1sC1RkQVPXkarIeK/wgiLuEeljMx3OkXkyguXgVJMvK9lInn9ktQI0
 NDphE/VvAWOdd/hJMtYNEYCkb0x1WTyoJkePQbPYFhneTTw2k3xZcRTTMKxz9s1HmYOa
 eGeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrWsmf47ATrIfy06cgISREyXb4xJrNxRTUqgMKI1GRxKe4x8q3d/yetP5KwMoVgTlEz3ApHlSQMA==@nongnu.org
X-Gm-Message-State: AOJu0YyoW43sz7Y6FU3zLvje3gCn8FuYpRyVtlru5k5hkL6NejN0Ptgn
 GVQfYPsq0AFPKrTRjTv1d0HibJVa89XdgC3O7RhTLoFN9y0rmZuAJWGJXehVMUBcslUkuoAHeli
 RDnmrzp3mBvD6dhSPHuj4w3MkMStayZZSfEdkyOzEVUJUotZpOFU4
X-Gm-Gg: ASbGncvbAygzurNdyIlUuvZ4j2bg17g6OnU3oXo4ajL1zNmaIkSa9cF1Af5MTMWkKwe
 4SXUBghV2Imn/y6hElQOeOes8dZppW6SyYIMBd0x3lSpaGVBxQg67n8mlrgyqL96SwURGAGhVxt
 xDYPjKvGSzucctwppTJElm6t/3dOQ3/EaOBNNzcTZVkZuA
X-Received: by 2002:a05:690c:b96:b0:70d:f892:2dca with SMTP id
 00721157ae682-716590e9c87mr43040427b3.32.1751544858190; Thu, 03 Jul 2025
 05:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-70-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-70-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:14:06 +0100
X-Gm-Features: Ac12FXxAb-np65tku3FriYg4X72GXdar_A1Yr42NQzgV8gpcsZ2XZder-hs7058
Message-ID: <CAFEAcA9AA0Uh=6rh+YVGy1kxp4cUrxtRe-vXqJCdOuW0dKH0XQ@mail.gmail.com>
Subject: Re: [PATCH v3 69/97] target/arm: Implement SVE2p1 PTRUE (predicate as
 counter)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-TUID: FDIncf+tNK1R

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 16 ++++++++++++++++
>  target/arm/tcg/sve.decode      |  1 +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
