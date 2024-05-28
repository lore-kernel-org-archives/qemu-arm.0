Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp57681ejk;
        Tue, 28 May 2024 09:15:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVB3U/uIjBpidOofu9V1BHsQ2kY8YpGI2mr4O7SwAzq1bCGRqzHubi61gd5MTceGPO77WemicrShsEg/Q1Ux6K0BxgJUh3N
X-Google-Smtp-Source: AGHT+IFTGJy0NYfiRQKefqFozz9pQfnHRfEb3hOpTEVEGzyeaPD2xWsGvnbGH+oGhnyBI6dPnRBr
X-Received: by 2002:a67:f307:0:b0:48a:5abc:445c with SMTP id ada2fe7eead31-48a5abc4713mr6522915137.14.1716912939527;
        Tue, 28 May 2024 09:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912939; cv=none;
        d=google.com; s=arc-20160816;
        b=VYKABuRs1OVa6ECXHwAbMkKwaoJiJOq1juTAWN4LrBT/UU4zwPQN2U5NSuG7w2nd3p
         5TwH/HOrDmvveThJO4nqPwPENVw97bIV8/ZFP2z0kWcTxCVSEOcgfmaStRtlzH49g5z6
         wRHTzQjkYuM5qIvqK1R2WVI72StwnopZrU4DLTz588ygWGPv7jBXkoixFfGvSZCw73pR
         eU2iDlw1fVNiQ2Nl0PREBVhvb+FUleDEtWZDZa2jberIzhv8YDfK/KntL42QfqmUwmD/
         h3ZrAPCO71WeWiILnj/RIqb34qWgHfKuSuu7DeKhchJwMvG8Gv+7jTpoWQvREfX5+chO
         Ycbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GukKbc5tV8LtZIe9Cz4pP9VS+Y0KkH7EySCSlImjxxA=;
        fh=Cj+XQEzptMMYX4kD8Co4FpioDC81FHmLqQQYW0Tyi4Y=;
        b=wM2hSpHSCh1yE5Ljn7MmyoZ2pCBtuwoIA+vSqX4h/8Ud35Qrx/TnvTKhAQ3YaFp4Mn
         arqmSDuWLliHGi4oFCGA/tWDafAmM03of+G2oH8U7/6988HCQ3iNdC/sdILnL1gfse9j
         AWQxW5U7MDJm9mhEWq6M5vidy+xHRs7J8TUqYRhArmebMjxBtAZDXZiqR4SDsbWcM+wF
         elY15TuqugSWbdep4CNfBsh0l01lYe86F/kbEw2cEM/HTh+fgany5lTpm8MvVztEpQol
         eEjcvd3LrLL3rZ7G7XZEe529ZmNujaCkdD1seH3b7kYwP14WARrQyV3q+OBpyz50S7kN
         SQMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pm3agyvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a5dbb7334si1282624137.196.2024.05.28.09.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pm3agyvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzTq-0003Qm-Kd; Tue, 28 May 2024 12:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzTp-0003QR-Kq
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:15:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzTo-0001i8-8k
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:15:17 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57869599ed5so1254285a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912914; x=1717517714; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GukKbc5tV8LtZIe9Cz4pP9VS+Y0KkH7EySCSlImjxxA=;
 b=pm3agyvG3SHmFFrgiVZPzJ/ZYLMB6Vkz1/adOQaffjrbH9qvkzSDebfSqTKatS+3qs
 kwlwFBRXYs8SQiThJST4/xTFHcieFo7LOzF2CJrXNE5VHYFYrZRv5fW1NPM1KzaFEjSz
 QHVtKsyPtRNPU/Ub6hPqcVtWb9E2BVmUf+fVuJA/Lf4VbJ5MZ+XU058/XAhdijsrKaPG
 rcGmTrSURHVLOhV8qpx2aECGUsaekrcQMfDJbqYKOxE80b+XdarPsz+khfDCKFaNkWDc
 Cm5WFs+XRRxWdb5cUOsD2m/8S++LhMn47Fhon5aRyy5BsI0KSh53HmfVODF4X4CjcHQs
 QqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912914; x=1717517714;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GukKbc5tV8LtZIe9Cz4pP9VS+Y0KkH7EySCSlImjxxA=;
 b=arVUFjg/ihQwCOyY0VxIpSUoFsZiMdBhWuK+pm5QSNhIoS4mbLDz6rTcY2o9CH8S58
 GUltTh7b+2JurS7lDh3EduXqZBZygWr9fzz/VgnPxukY1L4BiOWKbYIMf+LKi+ZvDFfo
 G7n9kmJYE/2f/BwlU0z+5Qso92QbbBIF6r6xOKWS2MPyjecMtR7e4EUxCbrIsa0GC8iy
 DRYTPWt+FeL9Q3mpmF26atTBx41HfZotOZlNhW06DDo1labxm2DRWe4rTenu10DBOngT
 XOPm59JNs77tiHfri9Q5B0pBS4bhwmZYg4QS6osr6/k9ptbQqpAsyLhIbYqvBNZaDpNi
 xnlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaS1v5fJxuER5AKC5IgB2+gNegpV1xUv7jyq+bGtaZ1U2I+CuVMQCCkmThh3aGSWsKlwV6ftONyG0Skt5k9er5LX1h
X-Gm-Message-State: AOJu0YwLxs+JypLdDxHgGQnPkMJWn3nbg9vikOe5y+XHS2cVpF0Wouvr
 7aDGYyiuPVxcDSHLSCEb/p9isIhfaXrzPdCmqKKNcWkWKgxYhAWJgXEsDuEFWvUzyMFqUL1D77O
 l5FpGKEYUh0tN0SBLEqFpLU868iyACAB92GPEJQ==
X-Received: by 2002:a50:9343:0:b0:579:e7c5:1001 with SMTP id
 4fb4d7f45d1cf-579e7c51a1cmr2611203a12.23.1716912914347; Tue, 28 May 2024
 09:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-67-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:15:03 +0100
Message-ID: <CAFEAcA8tSj=5QNBKb72iZ0fmYRBGf7QjpK-0YtpbF5sdBMffxQ@mail.gmail.com>
Subject: Re: [PATCH v2 66/67] target/arm: Convert FMADD, FMSUB, FNMADD, FNMSUB
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gxjwiDgZCpk0

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the only instructions in the 3 source scalar class.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  10 ++
>  target/arm/tcg/translate-a64.c | 233 ++++++++++++---------------------
>  2 files changed, 93 insertions(+), 150 deletions(-)
>

>  static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
>  {
> -    if (extract32(insn, 24, 1)) {
> -        /* Floating point data-processing (3 source) */
> -        disas_fp_3src(s, insn);
> -    } else if (extract32(insn, 21, 1) == 0) {
> +    if (extract32(insn, 21, 1) == 0) {
>          /* Floating point to fixed point conversions */
>          disas_fp_fixed_conv(s, insn);
>      } else {

Doesn't this result in the unallocated-encodings in the
fp-3src class now falling into the "else" clause and
being mis-decoded as the wrong thing? I think this
needs to be

    if (extract32(insn, 24, 1)) {
        unallocated_encoding();
    } else if (extract32(insn, 21, 1) == 0) {
    [etc]

thanks
-- PMM
