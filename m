Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp194108njc;
        Fri, 21 Jun 2024 07:55:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWk++buOi+CVI4gD7ZzOWZb2cT4ZzmQvv7II+6Vd0+sLVvW4uKJvkddRyPfqv9ONyolzFa7F7rXKYKg8xFT17n41OfF1JyL
X-Google-Smtp-Source: AGHT+IGnFgLhyW/ejE6Vbp26xQ233jFdC+GS3OuOlJ3HLLlL6hMU9U+UmM9p1VyY1d8QQ2bJhr5D
X-Received: by 2002:a05:6870:c10f:b0:255:52d:44b1 with SMTP id 586e51a60fabf-25c94d02f02mr9906436fac.41.1718981712034;
        Fri, 21 Jun 2024 07:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718981712; cv=none;
        d=google.com; s=arc-20160816;
        b=zQkJU0j2VE7Gb/rI+2FGgdrHFbcZ9NLPJwpXILQsY3bpBrs4EvPt204osyT/vaZgUC
         4QnN6myFe3qWg3yAxMc8KN6gapaXlgIol4UAHcouKr+hSCzhWL6nIR1O7bAkq4XEjYzc
         XTxU9xWadtHUbtrQrvaapvWr3tNr/rrIRLgyvhIDQ3NolLKDArryWExT14qoHGAs17dD
         mx3ts+UthyfABYPg/aW86l9k3h7YZSpT9NopDO+Yw6Eww8gdbcI0LtYiNMtWEhrueXv+
         ixyoAYdoDLt5WvFteQJR+iQgA90jqAZenCxvpQXknzxi49rI0z5x8jjhuRR6swFtPXh5
         BPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=w3fP49IwYmOmxiZc205wh0d/2qiV14oVeNZDM25aDPE=;
        fh=oz9vpGqq9FEESYFe8+aRJxeO9VWEokTr5siD2X6KE2k=;
        b=u5GJyRDjFdBh0+jFMDSKqtHgrBHNuWCK47rTbPLqOhPebk354ize/FO/LV4reMuzxS
         9UO79A1aOojTKKr2vP7qpwzb2fppdJ2ZI6JU27O2EejynlPpp/V1vcrYnWSsEFprFshy
         rJ1jEp4zrqmydet/BYLGYHnijguFfR3IGFq8Wc7MEWBFM374mGYD14tCLFFWuYFPTUMA
         eqkB994N50x8zOhsonariKsOXY/04v/EPEDVLYT07o4WWDXhPkl30swBNlzQu/XXnAQQ
         U6XF/ne+IBFqqhzrAzgNg2rHKqEsA30Q16A7jhSocX9uLEXQfQOH+OPLFh2kjbXdMkxq
         nTBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AkU4bzbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92bf1fsi200733285a.491.2024.06.21.07.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 07:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AkU4bzbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKfeq-0006yw-1E; Fri, 21 Jun 2024 10:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKfeo-0006yN-2b
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 10:54:30 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKfel-0003SU-Aj
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 10:54:29 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d20d89748so2150966a12.0
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718981665; x=1719586465; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3fP49IwYmOmxiZc205wh0d/2qiV14oVeNZDM25aDPE=;
 b=AkU4bzbdXGxPL/A80e0f/5gAFrU6Xn/ik7ZlBO5gyNLYprZ/t0nyAGMILMo6wkunRk
 QHyVQxsRg/D/MEoW9nnHRVmMPfo4MwmeBDQfGn1t8FEHppoGkVUWTfz454Qf0Xn+Q8cb
 9ody7n8F+L2wMY8mQ2zLA6eWCzp46JFJjrKZ337O5Au9XeE25Xu7Sln5u8mSBqCuSV8E
 olMijF6VV5VEyw4ai1hWYfYvXQ+chz921qOXIlMXQgR6rTNq8Wk32Ps5Z4fBIrWrd2Ia
 7QQEpVoRs3tE38DtYqbdJpJIwRGZYiDCl+X4iVHusz1RdRt+xM4nwIYu18aMPhwPW+2S
 YZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718981665; x=1719586465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3fP49IwYmOmxiZc205wh0d/2qiV14oVeNZDM25aDPE=;
 b=H3cv0fQnL7vRAK2QaEscIB8b0Jz0QxFtle5JJVT8nYjtJUTrv1GwI4PjQWC/62ds80
 Xt0spZa1DD1bljZ+ALD9gh7doW0lmxC0ht3B8M0zWWArUBU1IJHMjng3H0pMKQV9QUNy
 CiwfTBMEmpOXEOqa85k6GfZYqUqXANpsq3seBP6RoRzLIdUHnSLrauv2cy/j4cDZ4btb
 w3pxXSrdM1E1Wk/Jb6m+cCinMRBzEhFjH14ocqsx2iaJ9jRAzdckebrpJD3D73xZUAqK
 BZabpJ2M8+I5JD2dQCumbIBkwa4BwgEi+DTlBBLLsY7pbHTZJs7yVKHiMfpxT4lz+vYB
 9VaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNiBRe/Q2Edu8dQmdyjXK4MnFOdjtfAdLsNZViKFuAyYMArSbpAd/6bsJfHGthIE3ksCTYxL4R9MCLlIsWyseZJ2lD
X-Gm-Message-State: AOJu0Yxesk61Zujz3f5v9yRtracUTWLLNUGWxUGPiVHA3StvMJyFaeBl
 6+2UaroQwSBVy8RNwLgdBVbxUMGBiuGeqDXm8sz6IyAtV9oYOn+r8HuHZOII0bDV1RlE4q6SGCh
 ubKDmS9gyvLd9dmA5YXf9tr2ufbmrf55QCHDsRQ==
X-Received: by 2002:a05:6402:1744:b0:57d:105c:c40c with SMTP id
 4fb4d7f45d1cf-57d105cc49fmr4227865a12.24.1718981665003; Fri, 21 Jun 2024
 07:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240618163701.3204975-1-zheyuma97@gmail.com>
In-Reply-To: <20240618163701.3204975-1-zheyuma97@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 15:54:13 +0100
Message-ID: <CAFEAcA_BB7Lw357iLZZbCfvhnH+8G2qyfVrs8dhP_i-mnwnvOw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/misc: Set valid access size for Exynos4210 RNG
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: OjnNNGsOE9A6

On Tue, 18 Jun 2024 at 17:37, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> The Exynos4210 RNG module requires 32-bit (4-byte) accesses to its regist=
ers.
> According to the User Manual Section 25.3[1], the registers for RNG opera=
tions
> are 32-bit. This change ensures that the memory region operations for the
> RNG module enforce the correct access sizes, preventing invalid memory ac=
cesses.
>
> [1] http://www.mediafire.com/view/8ly2fqls3c9c31c/Exynos_4412_SCP_Users_M=
anual_Ver.0.10.00_Preliminary0.pdf
>
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display none \
> -machine accel=3Dqtest, -m 512M -machine smdkc210 -qtest stdio
> readb 0x10830454
> EOF
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
> Changes in v3:
> - point to the device specification

Applied to target-arm.next, thanks.

-- PMM
