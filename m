Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp907993njb;
        Fri, 6 Dec 2024 07:03:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWctm+9C94uXT1dKyAfScjTfE88S1ePg/zGQrnJe3yynRiFFHbZ8z1AYQEFDGVaY2gKEALhXWnZ1Zu3fg==@linaro.org
X-Google-Smtp-Source: AGHT+IGEP/UBO7fr8caoZGXbxHnE7mllT9BLzSr088LDelsIzBncK0MS2rB5jiC/WZCtv/rkQc2h
X-Received: by 2002:a05:620a:2491:b0:7b6:7850:21e2 with SMTP id af79cd13be357-7b6bcaf6a63mr431124385a.33.1733497411266;
        Fri, 06 Dec 2024 07:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733497411; cv=none;
        d=google.com; s=arc-20240605;
        b=PPmKk/r5bDM2aCtyvGSuXFpnzkfZ1WRuDdE+K1Bi9l81bLSu5/JArn2Gnr6ixt7+VL
         O03EW+e58AMGDgbbg/xcyymDsO+7wkOQv2FTdbKl/7GAmJTVMWQltxXMUXW0aRYnmPEi
         RY+KOKQvCPgVlUjH6/4fJp0KL4OBTBjkofCyDDhryPIL+f+wwSuGtRjcKFkUXuemOmpB
         girNRz/L8RSRvABeensNlmy6XCiTH6QrFH0kmgSKUjGadx4zK+44IOirNVLVolJCvX02
         9r+2lMvYU/6j4UUzV78r1qGaLFLw3kVZ7kNkhgDDgx1hqAbb0bNyA9UEDyfd8p7Fxcw/
         KHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a/NiNP3SfB4ZIhzC8wVnkCzIay7xezilJh9Qe3YoSJs=;
        fh=ZqO9BSS3XxqJvingHLGZyrNl+nwChc74KwEbvuafFNQ=;
        b=O4k1/BssYscQL/ICgCOzcc17UGpDzuOsmbMGXBeCEK+0N8o4LA4yG3UiVFXlfEUHcR
         pqDHMdXYBrQnY+NMy10QhLwyLLyoCHaAIm9f+88faEuiewz9nfEFs3wanwvIAr8VcAlb
         F4RHj/ixs+2icmpo5RyIVGQyHBhWVWygbEOFura0178ousZbTBy2fSVYWHVDpUKjQ961
         Hg/oGm3YPFQVc22hUmzpmRZa1ZXNCRLJZJnAvu99z0WxrpBxRb+D6fOadm+BSwtE1Fwh
         +/fUohFNqgb4OQYr4DNSlf4EjRfH3Y1oejU7odaZG3WuImUXt1pyDLWuB1CzEHUFxII4
         BTsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kg0kIqZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2ba48e89si1109202241.57.2024.12.06.07.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kg0kIqZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZrD-0001FG-4f; Fri, 06 Dec 2024 10:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZr3-0001AX-DE
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:02:54 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZr1-0001pf-UI
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:02:53 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d0d3dd3097so3524328a12.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733497370; x=1734102170; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a/NiNP3SfB4ZIhzC8wVnkCzIay7xezilJh9Qe3YoSJs=;
 b=Kg0kIqZg8/+MN06cIR+HImFns8AGv1u4YAtU0/XxRNUX//0/OPIrlpZg66IrjUfMGU
 7zvtWwuMlI7GiOXqa2itox7RD+a/79SjoMO2CX3UwRBJil9RaLd6nwdbrq/v1pdJwPos
 cqVa/iTM5E+QKmOmYbJyoOSkrGDornbrcDIIa2DTOET4Uyn0ZnkUiAhX8PqgK6qhHuOO
 XHgbBLOUd64Pi/34uIw0ePQrv9TrEoigo7iZGxtmSk2WXLQQelI8xg1PbQKKH2xsCxRX
 K5la+dawOOR0ETodfdzPZVhSN30m99b71S+X8A3ORhoBzIebCmfqwXLEHY2zbHpMaHM1
 LLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733497370; x=1734102170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a/NiNP3SfB4ZIhzC8wVnkCzIay7xezilJh9Qe3YoSJs=;
 b=XKQ2H1a6BWeqwW0KEHjP53gfgvAWQDHCPtYOrINKlZ9JMWwi3lixSq3hBJN6BfpgGF
 53D9jMfDC7OR+mrQ8JgzHSEgZ3s1TIHqYo1oc3iC39iOnE3Cab/s5mjaqgeSGCiXrmnX
 l5lel5syHxo3MbMW9lWT3OOIUVe7VRFGvwNt6nO9MdZAm1sh2A6Si0ZUwLqVCitqSeBp
 hbiX0+L0erAuCok8BmktOw54Lb8GblVHAdw9f8RblkdGl7NpUc8zmC1Btnil81Xqzj7L
 sPLBiJYxwhZu3kgvOF7pNV4nc99lE3xQDonxYPaT9HHBzqCsb31bqdw6h3vhjfACWhaT
 aJUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjngd6afPuft4gPMjY+S89kmUOEEzeB5TUAiVGkBZwInKHSlCt9/ldOqgZWHrfz3ygZtipGdvZJw==@nongnu.org
X-Gm-Message-State: AOJu0YxPyW1yWnJH1Phuh161mm5nWyp5YNA7X1R2JpjayH3KhDzYYa93
 UL9E/X4h0i7oHJFi1ut8wDZ+3BzS3wxPkiz4N4nAt3gFNerHDzn5tnpMmbxIpC8T8TDCkZ+Fyto
 pLwIQVLZxqNYNNR9c7lObSb8bCmTcCFoWImfsiA==
X-Gm-Gg: ASbGncvINGBVL35taAf32NSxfxx9zW8wWgyb6ESb/KcxrWZxNv4D6MRdQtIetIEn/c4
 +A/zsYXjPzCtFpySWTX1/xGwB+H61I8s8
X-Received: by 2002:a05:6402:390a:b0:5d1:43e4:bcaf with SMTP id
 4fb4d7f45d1cf-5d3be4656bemr3220830a12.0.1733497368324; Fri, 06 Dec 2024
 07:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-39-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:02:37 +0000
Message-ID: <CAFEAcA9EMaJew3b7+y1ehDLftpATSXZLZqRuHPT2QhekQgDD9A@mail.gmail.com>
Subject: Re: [PATCH 38/67] target/arm: Introduce gen_gvec_cnt, gen_gvec_rbit
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
X-TUID: QbOazHJLRWGb

On Sun, 1 Dec 2024 at 15:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add gvec interfaces for CNT and RBIT operations.
> Use ctpop8 for CNT and revbit+bswap for RBIT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |  4 ++--
>  target/arm/tcg/translate.h      |  4 ++++
>  target/arm/tcg/gengvec.c        | 16 ++++++++++++++++
>  target/arm/tcg/neon_helper.c    | 21 ---------------------
>  target/arm/tcg/translate-a64.c  | 32 +++++++++-----------------------
>  target/arm/tcg/translate-neon.c | 16 ++++++++--------
>  target/arm/tcg/vec_helper.c     | 24 ++++++++++++++++++++++++
>  7 files changed, 63 insertions(+), 54 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
