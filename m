Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp254532ejk;
        Thu, 30 May 2024 07:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAqOsyI/OOoqIaIV0OUQfLx9yq/I9ZkfEXtv+NrqQGBYKVWQuLeAu1baPDkKL0S71zBKH1QJFSMCfViykaB/uCcd5Tqc8a
X-Google-Smtp-Source: AGHT+IHLUIuqQuXUDVKMQQinKvbisp4x4oMGLn0OfO5iXp3kqXAfEYPb+eL3c2JqXwcRWDndW2ZC
X-Received: by 2002:a05:6870:200b:b0:24f:e6f8:f0b9 with SMTP id 586e51a60fabf-25060b2e61amr2662456fac.22.1717078495697;
        Thu, 30 May 2024 07:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717078495; cv=none;
        d=google.com; s=arc-20160816;
        b=LXHbpmVV65EHTRSvRl0pTo4M5WCjIQtP3y3rO9Jbkj6rbbYS3Lnhl1XeeWkqd0SIXs
         okq4f/CIcH/fYJEOZ8v0rC7bTnizSzpsQ36K60s9P2O+IvStkBNIH8p3JBkGipYL2+Iy
         uxuKIbQvwXbwhypc+q3S0QC0pDF8f3MKaq5tW5xXSupgPHbobkrxYmZLyKjgnYBEYJeE
         87+4Ec2t/wkRygxnW1WZ8SJXs6A1ljAk/GSqpmv6LkvwJHuOvFGau9gl6xpbvDgEsRzM
         rjqrM6aWA77utpbPoYLOvwn3egajGy0uAmiqLiYh045xrgdE5MndAanZGCwqJIL4RRnX
         6pYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RFgNJYalW0yR5x9Qi6OEJHL5l+8acjKaSa1a7Cx9nfc=;
        fh=EN4rJnRroWcKA7YhhRGsGogCpjH1K9m1oAtA4EAQyRI=;
        b=l5y/Swz55+TQiVAzzxwAY5ECyxe4Z+OG7fDOx+kh1bBLIKUDquqw6lz3eeFeaGiqa3
         UxSajpXBBWPWApMj2j/NOA+/9qmkP6g112R4Eg5mr+kxzmlrovCQHuLTgpSxjd0NWFq9
         OMhEMGBuYaClXWJyuyYtLTm6dh5ZMCgNB+1gkC7Ynwr8+6a1CIpK8pki2mKcCFtCwCmB
         Gl1edei+Tk9MFnDvmvB4Bh3a3EhTjD4QRkwFIAKI/B62g6lWFUtnqsvGGo0BsyNsmuS1
         /J4BhVgwV/AybJhQGc8PSRUDqVzv83wEW+i3ULzKgsGWFO4bUqWfO056PBxk0fB9E0Eb
         ol1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mOBNFMP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-80ac92e9d47si394225241.170.2024.05.30.07.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mOBNFMP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCgYD-0004lE-Fq; Thu, 30 May 2024 10:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgYC-0004hz-EA
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:14:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgYA-0002Bw-Oh
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:14:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so866243f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717078475; x=1717683275; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RFgNJYalW0yR5x9Qi6OEJHL5l+8acjKaSa1a7Cx9nfc=;
 b=mOBNFMP6h4EpadHzUFFKcPyRq5KVH4g0ul5C1oyvEHu1QGiKHGCgTa/eTIsAuzwNd6
 IINGM0k0cGSweHeOWRym5sc4XWGw2cMFdH2MP8FQWfnJRG53ymD5n36Y9qCjfp1jA/fi
 Oi6TWbFEkb3OjEJJyCWl382hl3yEl6bf7xL5lyMzQVmc/x+fiTVw6P1kj5hKRTUv17Xs
 SzbMPKdcfd2q0gh+pv3Qw/m7zhaiOVi458jlhzRu0tj6MbvoMJZrV0HBdXQ8FY0GBexP
 ftmp9/30yvj/7JEHKWlSpP6UVGnXlaZ66RbAGASdyNGZBNFDukXM5gbat85p5lyyeOpm
 EtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078475; x=1717683275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RFgNJYalW0yR5x9Qi6OEJHL5l+8acjKaSa1a7Cx9nfc=;
 b=jTI/L5mII/mmF6Ar9Hn+1zSHfGjIq9H57E4wy0uwoB5z0KEFLvTibj0aVISAC47WRw
 Wg98HexotMnM9GwAGT8FojhTQZLXE/3Ul0dxopGIol4AJlvM/RZwZEBV80ty399yX8N/
 HxLZZ+CgElSobanSxhLetjuPMXbagPONN9IQjx5mSJp1e3PawEYm4bQF45oMI4PzALWY
 UZOo8vD47ywN8dqdb07rvfQyGuRt6zXAoie/5Oi15iVek9qprwYX7tlPJIEYDXCKU5kL
 t4YdaZs+Q5+X+rGWMwf1JGX0cyn81iwHyu9IMmoPuyFmhGLLi075rU2/adeoZf33L/Bm
 epvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHatEH7iohhPI2MAR53ZJ7Z2XVe97PlWbYm3SrB1p05UIn0BcqpW3VXKBcJfMNj6p7CYByVTAgRNPLIQULZqbHYTS2
X-Gm-Message-State: AOJu0Yz6aBv+IPWSYeu754pUy3ijIuqtPwAj1WHjHxGIGUe8onlTDXuf
 AmpbC9xxSRag2mTHNB6L4Wt1j7fTvOJbdYd14bLuChljOan+U9cFXH8qoAJz+jLiEhTTUCQdh+r
 8LNyWLscZok5kin/O80FanP7Bj7/z+Ej3+15GGw==
X-Received: by 2002:a5d:6912:0:b0:354:e0cb:8dd0 with SMTP id
 ffacd0b85a97d-35dc0086d0dmr1454497f8f.7.1717078475574; Thu, 30 May 2024
 07:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240528203044.612851-1-richard.henderson@linaro.org>
 <20240528203044.612851-4-richard.henderson@linaro.org>
In-Reply-To: <20240528203044.612851-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:14:24 +0100
Message-ID: <CAFEAcA8rJW6nVGK53aLkf6r5Y0fcfdGH=MguNRxWRx9KcL4Rng@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] target/arm: Assert oprsz in range when using
 vfp.qc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: u348YkA6gerN

On Tue, 28 May 2024 at 21:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
