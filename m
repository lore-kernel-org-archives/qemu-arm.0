Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1078170ejb;
        Thu, 23 May 2024 06:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRu4TfKrarSRwvRXeL1IBvv5bVaDcI+rJHR5t+/o41kgRUjTsGiD2gH1kcz1/QZ9DeJbYzRuEQLAzt1R4jfDi1ux5GldU7
X-Google-Smtp-Source: AGHT+IFKgzp7E2hTd0iq1pWKb2ou1xHeqxahCJrBwf2uwb4CBYDQY4gCZLF14jqxUbtKe+EVRQhz
X-Received: by 2002:a05:620a:70dd:b0:794:8e9b:a923 with SMTP id af79cd13be357-794994b5d23mr468682985a.60.1716472711974;
        Thu, 23 May 2024 06:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716472711; cv=none;
        d=google.com; s=arc-20160816;
        b=vk+RBBkbAOMYxr6QYz6qpbSDXBjSaXx9ufR0dn8nU/Q/pHfVLTnPBuQJDQrxAauqQV
         8MzTTBwOi3N31LZI6Kf+XqXjU5BI/5dlqp1n2FCmhtU+hSwqA42YTl3xiAzmy6Dh1Voy
         F4YKHqRpR27LqKdxd9hNc4iWF1i3tgIUpJl+VsHYwbP3dFusZyJI13qqCt8f1vu/fmAM
         f2M3py0swxM0aCm8EIbUhb5LmDxW1kJL7WSSMz1sxWQJv097a+5CbRTZcY+Ex7HO1yRE
         gKgJOw8TzRK3n+7weOFhzbu4Y0FYDRdB5l1vFLxOM6aXUAyJGKm0UchgARugV6FaVzA9
         BZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yzFX2McasZ+8V0Tlczr4K6m0eCEQEVhgKPAdmns9vpU=;
        fh=tro/xTXnOOrViJSQKPuPr0NfsiB0H6Uakvo92NUEJeo=;
        b=VJ7Sot6psXgFHz9fwecU5OoX4Kjda2suPDReWT5vVE4SIKkDKhs2sGqYh6k1yBKCe0
         mfM2v6qKOudXsnbz7tc3TTH7XO+In1yOu1Hipov0PDm4ck6v2/rKZo5/IGsd8rXmZyXC
         qFJY5T98TgbeP/Ek+KLrgaSc9pWTehvFEPgLDkNByfeYxcJOScES7mlTPqe6Orfiyr78
         y03eKIV/SErDxuGy1maCxvlkFNL5iATJ9B4Lhv7kZF+VdFDDccqMQisqbAq3n6XdhgcC
         op8qLjixBjYKpiyKdkfaiv869mN1YmLj0rjllE/+YAJB5BYpC2hXTQcUkynhkfPexClC
         9j8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YvWF87eb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf297be1si41879985a.188.2024.05.23.06.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 06:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YvWF87eb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA8xb-0003Wm-Ky; Thu, 23 May 2024 09:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8xP-0003SG-N5
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:58:14 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8xL-00008Q-Tf
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:58:11 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-572f6ee87c1so11063984a12.2
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716472686; x=1717077486; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yzFX2McasZ+8V0Tlczr4K6m0eCEQEVhgKPAdmns9vpU=;
 b=YvWF87eb9n+vQpLOBP2eIUF0EaTGjBSxxe6hMzFrmYr44xqXWVCGhFquV9N7KLWnnD
 tKGsvGbC/nIV+fJobQPcoCkI1vy6wUsDXYFsOC3jnUypB79Qt5DRcQmDUGasjjQMPOZr
 C22M6cbt+sW3fBSKs075fWmk1TDrvjXCkVX+nNkIb6oeX+QjpN2oUFqr3hSYjL2/t6P1
 txlytcLRPpJ0lUuF4QQPX4aDpFRmdZh3/1LW/kEKhHlLynaIys89DcbEXzMIBBtYmzjr
 CoreLLnL11pMX6jReuEE7JktGGFxUMHGQYXI2biR/alPVWV8joPycvtVe9VwK39CfJ0H
 SkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716472686; x=1717077486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yzFX2McasZ+8V0Tlczr4K6m0eCEQEVhgKPAdmns9vpU=;
 b=rwgdGjxc3MAv+4sWO9eBHWZxVwSy72OpXETSXSKLl4ZlGK8LxMFoUH8RzPCEUXjhaf
 G3dYVFpUkjisxxzMlLrHyP1Y+xDimYiklA5EWkD3FEOk8YU0jqu66fDGzRuyNMyfm2gG
 fOPfI1r6W2BvFtMpSUfpion6zThIuhAb3nPnSIcv5D8WpCnZV64cOmVEKjtW7x1YLn1C
 qvEqS2VYNRx854lq2Ut0yYf0hN4SDgutD2365UbThLpNW4Yksx3g+VxXj2O/OiNvgyE/
 UE9x/2rtPZT11KwTjHqODb4to8qg11Gx8H2tfaWXpEcBq7EHxwsih6bLomfmomJzL5B6
 pDOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsAeL0k6ky3nNY8xjmX/Qa3ZmRgL2dNzofa35cdnFmOu5OP+R1tgqvGwWqydEg3jaish+XkJnmP3eJD5WyFYTR19p1
X-Gm-Message-State: AOJu0YyNgf6mSMLQX2863OaKaxc6Vig38idYqt6OsZtIvUFzRE3hDmbO
 L63zGt/8km5pujaJpSHZ8A9YspSMZ8qNSUrfA02in/qdgjAktjvrJTosaT1Mf4WjU+B/D13JYlh
 8itRROzXH8NQXRUBDdvlEAKRbxvJdPzZPkPVfXw==
X-Received: by 2002:a50:8707:0:b0:578:4c5b:98a1 with SMTP id
 4fb4d7f45d1cf-5784c5b9988mr461115a12.31.1716472686264; Thu, 23 May 2024
 06:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-25-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 14:57:55 +0100
Message-ID: <CAFEAcA9Uzhr6Lf+Vr7fRFEatzz6_L8WYGyrV+YkasUKxBX2hpA@mail.gmail.com>
Subject: Re: [PATCH 24/57] target/arm: Convert ADDP to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: pc7ga7gxBfFN

On Mon, 6 May 2024 at 02:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |   5 ++
>  target/arm/tcg/translate.h     |   3 +
>  target/arm/tcg/a64.decode      |   6 ++
>  target/arm/tcg/gengvec.c       |  12 ++++
>  target/arm/tcg/translate-a64.c | 128 ++++++---------------------------
>  target/arm/tcg/vec_helper.c    |  30 ++++++++
>  6 files changed, 77 insertions(+), 107 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
