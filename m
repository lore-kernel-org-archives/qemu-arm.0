Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp52298ejk;
        Tue, 28 May 2024 09:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWB446p4sw/tF6D63fQTazTWdgWX2jugIPYV2EJCTSkbCj0aicyq6XoL8BARTxVnMD/nbzhgPcE0dmLp/OLdzXwKZ6kaXpt
X-Google-Smtp-Source: AGHT+IFOpjERLzZfnMXUg1/kUc5Q5WDDR33x8lXJnWqIPucxGueFewLUw5Cio70vydVe/hdFnG5L
X-Received: by 2002:ac8:590f:0:b0:43d:f8da:1643 with SMTP id d75a77b69052e-43fb0ef0bbamr152652001cf.53.1716912445068;
        Tue, 28 May 2024 09:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912445; cv=none;
        d=google.com; s=arc-20160816;
        b=YDs2XOGh8WhdvsEGw6dWhYKn6Ae9Og2yL0LquyfeNk1Kld2AK1LcQSt/8vN4Tg6IoF
         AXVHxLDF6tG3j9bAA3h5t4VsgbnIt7CIziEqOwVpPwXdIph5Eo+y4XnuKGz9hnmSCIu0
         Dx7Q4cUBj2y1p6eOTtqI0fQgmHcJA58wbIR9xywL4zDoFPGwHmNasfyYiN5RYmdApcyQ
         qaVILnzKM4rjKkusgjYoRUKZky7M502S421mMIFXDLXUqcYO0T5re/5zibpddgIE1m0i
         8xKUnjIPXVV658c0fxfhR+afh6xdeUSo75xu+zVPdsTSa0+bkOUxqXAd9iUnKXL9FRiY
         lu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UrjMMSZqsXckP1I06/IUCiHBF1/i4AGmVGNEHj0CK4k=;
        fh=xdcK44laVDg/4YX4Tzzz13QhpFAD4/AOlIzO9wP7X7A=;
        b=QkJas3ub+L5jd0EGq8gIfKBX3MS0zHP1bXm/OpBjIGoj0cDydQ55Y96YiK8zXU0XU3
         kyEJpOilCSjPxDuFqRcZkhP7JMmj8wUPxyw3cl38DQZh01VVVtncF6QtpnLaC7aZ2g+/
         7Hl6vknIvDi50vjTeJspFQ6F1EB/F152D6h2+S+WHZReinle2FUwbT3ldJZ0DDi6vk8q
         TrSQs3DVGP5BP/cb2/HVf33rEPcmtCkLsxlZelTFD2o4GOnrp7/OFVj4RaDiax2a2wPT
         jC0Jh/aYnMJx5DeK5zoMHgkgOTFjZLmi1/WDCvOPk1HAENwpVBEeSwksIiDIr2+WiVXy
         AX1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RoYq1uu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fdc93897csi11158921cf.731.2024.05.28.09.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RoYq1uu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzMB-0007gD-Ld; Tue, 28 May 2024 12:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzM7-0007aP-N1
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:07:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzM5-0008OB-5S
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:07:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57869599ed5so1241927a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912435; x=1717517235; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UrjMMSZqsXckP1I06/IUCiHBF1/i4AGmVGNEHj0CK4k=;
 b=RoYq1uu2AMfUIiP7Gt/sDY2SO6l7MzYEtwtWFtAq4YK6uK2IhBxvvQ34hoHIJaBg64
 8DH8B4gmw4TLfeOy3t2yz8iJLmxD2BCl77B6YGEUkjwS1dIMYrfx6yKNi4mY3Q53Lxio
 PdppnhII5Q3Y+QJdvSK4X+lK+G+vMQX9dbygBBYo5kpDZfVuuJUCsewIIGdVBfehbS+v
 q4vlqh1LGUTCmAyX8WRvOnrPWX6wsSc3brwKknTe6csCgmiYcm9DnvLt9T4Fz2GiaRgI
 Fphlc+KwWv1IQ7ukRLJmT66WCV9FpaXX4H1NvAju9qx8l5wgyMJeihLJiJkvdGScM1e9
 fEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912435; x=1717517235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UrjMMSZqsXckP1I06/IUCiHBF1/i4AGmVGNEHj0CK4k=;
 b=iEsgQ31b77vbXpGksCIOsgdrNptkxzxiQBwhj85HVwc3VEHACkT0isTQt1+IvH0TZ4
 dNMqE+Uv1kkO9znz2Mrn/I1v7U2dstEigHJa/RANsoAvzEO9YMoIAQTBccgFevUM6LWO
 ap5efbWdyeAcILSSGFJkjXJGqBGxIAzGu4s4XbtqKAZqHfCT8DCcK0UtCm/uzoe9X/UA
 jo2ZzY40tQlmslEnS20PHWfAZtNaZi4RVMim7w21UZFe7gHBUcotRp2hPuTx6XZZU6jZ
 GhJ/qXsbRAOyOOI/6ldGKqLQN3hjNQsPsmzbtCYc9NKKhlQFEydRGqIzTI2VTkFvx0hF
 fuAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU91cjwtD1S0y1RbEr1OW1zzBv3bK/72R5usDZOdZKUMPwt2Exm09ROkdaHJCfr659UWkuat8JVj4TqegofKsh9JeZ2
X-Gm-Message-State: AOJu0YzAQSlWOXhbFptgZvX3Zv+9Nfc1HrK94EXtXpwtfZf0zy5ZpFiv
 J/gL12jySzR2VOo98eEt4zLZYS7+bShAa6CFpO0apwepDZb7V/1fqekv8+9v++RMT2d848uZU5/
 T+tg5pavlGpbnqGoyCFkGNlovCBRpn9KWd7MoDg==
X-Received: by 2002:a50:d510:0:b0:574:eb26:74a with SMTP id
 4fb4d7f45d1cf-57851972f47mr10261592a12.21.1716912435654; Tue, 28 May 2024
 09:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-64-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:07:04 +0100
Message-ID: <CAFEAcA_g4LqnDk=QDep37LNkma09Mhe=51z4zVqqB4Z4Q7qpmA@mail.gmail.com>
Subject: Re: [PATCH v2 63/67] target/arm: Convert MLA, MLS to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: fPapMs6c0F5b

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  8 ++++
>  target/arm/tcg/translate-a64.c | 77 ++++++++++------------------------
>  2 files changed, 31 insertions(+), 54 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
