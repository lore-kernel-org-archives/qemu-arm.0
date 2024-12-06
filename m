Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp884873njb;
        Fri, 6 Dec 2024 06:29:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUKMNUpuofrmsnKO+SquJL498CUGikqrxSE5HYiqlu+HYiGeprVlmJHkQnzUjObzVXlzP7eTq1d0OKHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFDUCmwnaVYRanRYkfcAM1rKyWMymlcGmHAZwGoeVN5A/vc77X10/o3dhzrM+8VJP5HeEgc
X-Received: by 2002:a05:6102:5108:b0:4af:c245:7512 with SMTP id ada2fe7eead31-4afcaacf83amr3502178137.22.1733495377935;
        Fri, 06 Dec 2024 06:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733495377; cv=none;
        d=google.com; s=arc-20240605;
        b=cHFhUiMg3smGTdcmk6Q5Khw4PHBIg/pGCFuapjLF3u2Rahlz2t5Ok4bHvnFTnkOhPd
         ZlsoXZ3/hXHCW4V/LQSNoZfft33VeNU96mWMO8cgjNXx/H2DRBIV+h9NeSOLv5CP7i8l
         24nxqBdxGDJoa3Oy++vdjnIROWDmKuX8Ds5pc3Fwjvzu1WMCv0OMQqQXCu3bigFz6FJO
         7M2GU0Ha77TD4xRYOyknONSFBqYfiO3oIJfbRGbSjMKV2zv5DWVkQ/SZ6GDtkT58vHqy
         B7k++6ABaDOPvYbNY5Ce79IcVsncgkX7Lk1kPuX13rsGIMazq0OZE/1/EqJgKk7QJvuZ
         0eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q2K9u7TGAzixneHesDe5rrtwEuAVGAJBqiMVHlkwc38=;
        fh=lsmMutD/HPK8VOGw4/Z1iVK/8omxYI1dZwD5pTFrGgM=;
        b=N/HbGuwFFBAy4t6p8vJ0ia0S+taORHl0oDcv091I2GVHJvhS+lsfLR984LU80fuzm7
         ovtczWNPpIjdkTBWAAOsLf8CMScG9dBZ3w8f4H3A7EvhoAto/4yHh93QGi3RXVwcz6kZ
         sMZSoiQJDJ3LbqTDylg2nwfDnA4ob9Cm+WACli4WgfRmJNP3FrtYo1oOa3ZP04ZT+3Co
         YxNYC8PG7/AgvCXJfhPPoUFsyK/72sZj39nhQfLoxaZOq+bfe3Z3F41LhrteZzfuw30V
         Q4C/a9aZNMtQjlCiABlTyD/cJsmNNqKn9xL6hfBRuvlE0PfnkN6si+0LMsIf30eGhAse
         +6iQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyQuf3uY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc690b5esi1109896137.335.2024.12.06.06.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:29:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyQuf3uY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZKW-0004cE-0s; Fri, 06 Dec 2024 09:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZKP-0004bE-WF
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:29:10 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZKO-00038M-E2
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:29:09 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3d479b1e6so235151a12.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 06:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733495346; x=1734100146; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2K9u7TGAzixneHesDe5rrtwEuAVGAJBqiMVHlkwc38=;
 b=WyQuf3uY8v7/qT9vCtwdpyF3cF0J6l8L4uhxu/cbhRwXBjoNiqMRcABYZCrIZJ+/iC
 7ioTzaXR/fNgstKX+XeKo+cVEwtEiuh3bBmP/kqsXTN1mPHHYUmo7wnmHPrEk4WjAdwQ
 7JbJZ1YTr1lVrJkfvlMuAa+mz6c5ozPgddlnQatFRCZzhFUMA9VyScCzv7+GOrZS9tf2
 Szc7gXoUdFIWDCAAfSp80Ir0V+jwoXyVskMjiJvhINCxKVOJXZMTw1MTrOrS3MfeZHLd
 nzxd8RzhEqW+lrEp0ICn+GR9wnmX3UmaueSm/aqpAlmLSGfTSmnEMsKZRvku0j6vnDPH
 ZUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733495346; x=1734100146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q2K9u7TGAzixneHesDe5rrtwEuAVGAJBqiMVHlkwc38=;
 b=m1x/sNsqjMEJKgxYK9nhxrUQEaCeMpXF9Giw8wgfDXVgf8uHDUFzoLhrvlkUbn1B4/
 LqNqh5dVMm+2caE9gPwsI1jwhP3MmeRPKFbbjUd+uNzwkP9W56EvpwT3Bs3eErXEpkpJ
 5G9c2Ma+oIH1eb91RHFQFPt9g8MuT+FTDCYSx2hV8quhiVwBrWAJse493xzBDJucVBD/
 V7xGYm0hTx2ZAPgCJKZJmAlSt94evI5sHGhcrOSEFqg11Zs9dI7aHyUOw2ZXl3rWH9Jg
 x3ySmnS4uR6nOXNQfDOnhoajaDg2xhaBkKOwMsdNmL1Sb8v+fXXrHvJbaP7r8iCEflyJ
 XN2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl3KQWp+0u9/heCEOEVRyEU85SD6z/l8IdtRqzh7CgzVORg60/bmEWNdGa6lM4XmCUPBYTcCiRoQ==@nongnu.org
X-Gm-Message-State: AOJu0YzcCKH7XGHeecn90FvydDUzee4/pi9lxi+s2S3rEKywlDx4BOyo
 cpf2j0I+hTktm8lQNx5wne5qO/GiHmkqoTFQ8zhkzprwtHGlwepZfGZG6KyLFowupYsbyaHTofq
 KR3iz3riUHTsMDXgT2BKHzYpjzznlvF53JhlONA==
X-Gm-Gg: ASbGnctIgLQ8bUOyFj3bBgV0AShzlZ4F6nxjc+8AGXdWN6HvC/Li2ihG/54pL4PiIg8
 ycdJ+9uYetTlvwwRYSHF/Jzl6H9ywuyMr
X-Received: by 2002:a05:6402:1d55:b0:5d0:ea4f:972f with SMTP id
 4fb4d7f45d1cf-5d3be68007emr7767202a12.8.1733495346523; Fri, 06 Dec 2024
 06:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-35-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 14:28:55 +0000
Message-ID: <CAFEAcA_ZetREHWS39g80pTPLPdDbvT_pVsOxS3EhHgO9qs6LwQ@mail.gmail.com>
Subject: Re: [PATCH 34/67] target/arm: Convert SQABS, SQNEG to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: 2V68fQAeuWCk

On Sun, 1 Dec 2024 at 15:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 123 +++++++++++++++++++++------------
>  target/arm/tcg/a64.decode      |  11 +++
>  2 files changed, 89 insertions(+), 45 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
