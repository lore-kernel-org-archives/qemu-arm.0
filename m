Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp878687lfb;
        Fri, 22 Jan 2021 06:07:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBY4F1Q7oxGJXChEu66bR5uLK0ZhJpaWbNHplzLS3TnKdXCIEAKF51/DeJWvnCoQVilgZZ
X-Received: by 2002:ab0:2010:: with SMTP id v16mr847888uak.24.1611324437647;
        Fri, 22 Jan 2021 06:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611324437; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQr529BKx2vMCGabDMpBE/Puix690kIB+lA0qcqqO070PNmZv5LynKMCv7ZuxFfr1B
         nNkHE6c8DPNtz5T6KZW7TfxEMa4TkEbGRIyop6SESQ7TQe4dr6JEQrA1m4bFqFoysm9Z
         cZBCyhIOTLBKN5+6vDjPs8yWkevXXa5La+bS5CbSFs75SS4vl1IlhZjU7UW6JCQpreIB
         GtaAVtlEr+A2yHKw0MGxhfRGBrPH2RGk7K9a0tQm4l/0owwnte+InCRXBJv6wWPosV1d
         BXFnRPerU8OhTFTY123NCnu/faIohFHmvRO9bzIgYu3Dn1TQ8EYejQWUf4ZGTFhjcxrT
         QRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yFrKLdd8zhMzyz4BPJ+zMbVXNOx1ub5XV6ppCJfcLc=;
        b=o2hTzAWwzt7FKw92WALZMpkAHadANwpN7YSXFbxThxArRM8dmhNq6Sgrm1xxXdCgDp
         aDXrnvOYKCskIsgcAqLNScE4l8vgB19Fd+Ht9Oo5+jMaf4luzL8z5fjChy8Wy3XZGx2N
         5ygfAWsGgxkjUKUqf1CunqwvLabNiLEDG7E5Tr+RQcerm4f9NmBIq4bdNh7sVoO2I/5R
         CSoCxZiqOOMtAJJMMs6MMqeT5Sp5bewGVqilVIqT37DP/6bTF0TABcfTHkLJS/ch0q0y
         6e5V27Rr0yOprkAY0MD3IxWhq09U5nyg/JV1wPBoEXSiuemg8qvNhl71frx13f7wuRzq
         a+9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IrZtBrqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si2038531uap.192.2021.01.22.06.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 06:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IrZtBrqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2x5o-00011p-Qy
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 09:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x4a-00084H-6g
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 09:06:01 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x4R-0003ig-Qp
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 09:05:59 -0500
Received: by mail-ej1-x62a.google.com with SMTP id g12so7812944ejf.8
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yFrKLdd8zhMzyz4BPJ+zMbVXNOx1ub5XV6ppCJfcLc=;
 b=IrZtBrqWOB6+zrIAcZm748gbMQqRNpTAw2ZphUDoPRIBGVsYX6ENKwY06JCAddXQWF
 q5M7jh60uWLKN3WZOVAGgsoMU114iIMt/+4OGOxYU3jRo8NuTirhQXq0Go/twg+5/6b2
 zgl5tf0rcZrQ7smZBe5r7DZ9fuEMIFiQ54o0dtNYgZc5KVUfqjBE+l7SM0V44c0kxOjv
 9bN/8Kwa77SYJC40VAbM0+L9cgVq0VO3IJcp3KHJ2Pqb4ib1z+v0ryythAEaJBXoqJNS
 U7TfIyJ3hrHPQKsOtwAWOSqMIZZxX7oocFX+eLpllqaWjyWaDq+iP/vHHo8OQ+y6WBWZ
 vvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yFrKLdd8zhMzyz4BPJ+zMbVXNOx1ub5XV6ppCJfcLc=;
 b=DPAzMuJfz2UxdGFEObccUQwgzYU3qppTIypR93kMbysm+RUGZN2G6/mJdXXWKtxAgd
 /1MYUPa5fo/LmLQuRYlvN2dt/enV/Cfgq97I5l/KUrOCJ8RIMk6nxa95KH9GwJI/q58f
 uN29gPYFVaVQ4CA+lRMY5MhiYdT9FBDWRiIRJ53VIS340HvTmnNbHu75Ms0RMJW3q1Kf
 CW7udvABw1XZJYwEJLU9a+rDlUikoMQ9nfi3lalum93+7DzJSLaSz28Sy41YzEVwFI9r
 rt35+wTe94XwuuPkKqWFFamrAZYX5Mo2NfYJ+4DJo5QRHdh3+35QVrP5P04h6kNoc1Rx
 6eOw==
X-Gm-Message-State: AOAM5312kyUCdqLc2R7jdAT8JdaroueZSe7HWbdBNG2wuoecBVlRXkTP
 EbIdQMvJCkyt4AfWT1qqSUyvHtPkll5PpycJU7FZug==
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr3089746ejf.85.1611324350392; 
 Fri, 22 Jan 2021 06:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-20-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:05:39 +0000
Message-ID: <CAFEAcA-6TVj0iZXMGs0N2Km=qvasW_TTGoamFGwkhwP0ED8EKQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/21] target/arm: Add allocation tag storage for user
 mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +SAUAzyPLo08

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the now-saved PAGE_ANON and PAGE_MTE bits,
> and the per-page saved data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
