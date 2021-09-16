Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1077145lfp;
        Thu, 16 Sep 2021 05:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx91wPXM71reDm6YeJNgEEp8aoixzyZQrdI1V+OCeTDca2vK/HaGfdqlNnwF7JBqc05wrxw
X-Received: by 2002:a05:620a:52b:: with SMTP id h11mr4640016qkh.181.1631795457587;
        Thu, 16 Sep 2021 05:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631795457; cv=none;
        d=google.com; s=arc-20160816;
        b=KgYezdNS+ogucKKcf51M1fBvg10T1kFjttW1eKvrfRBpjdM/rLgK+pEVqszGp66rOo
         HnjFIWodJFJwditAT7umVWfxZ0KlArZCLSpdrtxtM488WJsCPa/VIfZiTzVYB0ySOt4B
         RmIAJWalNvVi5iCwjugMUTzqd5G41rGZry6F2n5xRuIobVSEGemAmGmYtQzc6qsAwpyX
         NZxYCAPVfa4rc4zPkKwsiAP9OV06sWpfFnLQjYDDQrxxZO90S8+3/Odp0QBvqyjRklU4
         J+iIjdWBorjHiXa1MflZ/JK5wk8h0qx97fi6cX6nKWFzicM0njKUa6s22YopbZE+Zzbk
         FFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CuxBkAJqqE4XRo8Zx7tw/oIvnPQCBtEbGYRJ/wbvGEE=;
        b=lPdymK8aNgPR0LOcRTL6p/tdKLHLIejGYRG29lJ02kM++ddt8yB264LTJFikf742Vq
         n8g3X+82L6Mm/ztrWXm436nLY6mY0/7E0YyodA0Ozjx67VGbCxDjpEmLA5aOPc2IJ1Sf
         QYRx1VI0aTcrRFb8jOhRHdeViTdzUPRbtaK+JWqlXa5GQ/Jbn3+i3mELyb0UURNvZYz1
         6M4LRW+O77eeyOA8QKO9WEgyaAwipaVbzDyNPIXuW9QdQF6IYjYxcm/ojakeYS9ylshf
         lhA+Eht3sNqsX4gJSpK6DgWLpQVIs+wKseFnJ+ZswsHMCMuIx5MH2xIeq8TAeg04ykYs
         sbVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dKC2iLjQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si1794597qtc.28.2021.09.16.05.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dKC2iLjQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqXZ-0002cW-2D
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:30:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqWp-0002au-6d
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:30:12 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqWc-0007oF-C1
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:30:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so9187813wrc.7
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CuxBkAJqqE4XRo8Zx7tw/oIvnPQCBtEbGYRJ/wbvGEE=;
 b=dKC2iLjQRfItpLeI6CNe2EQfJ9azXmP19coaCLtVTfAW6EH33SHCg1bzbZMLhTxT2B
 aVrZJNo3Uq7Imn7k7loXEhBgHqddIJCMOHNmw9wRPUDSZTMrOx0XMC5scam9/t76yewU
 WJZkhJcT/b59RGkeXg4eihl14eNzHof4e2aTLXTKfVqmso9RQ8J2qJjQ7yd7k8vPfcx+
 SzaYLqKV25a0+Z9vUtQovebeTx6l4xyzjAkV8sKCyiDESk0EcDnSWDG0gTlA9cO8OYBt
 mUv8BwmXoNhQVV5+T93Z4hl11YFatY7GHhMS8nxiwDCSAeg2ZT70A4OO3k5uCatfBVuP
 Qv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CuxBkAJqqE4XRo8Zx7tw/oIvnPQCBtEbGYRJ/wbvGEE=;
 b=i5i51WnKIvwuDAbdH+r239Y+oasfZFdB8JGAjMxwQR9TmqEnYfPvd6S0KV2Fm10CGY
 tGOnbLZndrkJnVHnYxWaa0zi+1Ogwodnlap7HOPfH+B+WnrRej/aSdjTOkvstT08E61p
 DZ9kQ/MzysPsQV+2iOnXQb+c0XE+cAdFYAnt0zzfA39uPKCLwDYdZvvI0eM7WBQXG2rB
 nm+OVa+SrY+s7zIqXGTqX9jOZXnzxnlYjHQ6Hnc/b1VXVTZ04xIGbHv6oACe0GbEQvCk
 m0DxM0a8kkj8PzCNg3kPWfWkD03mmpakFyZNQf46jidr4Dy7/PJoYWqpYqmGWul7sm+G
 T0QQ==
X-Gm-Message-State: AOAM532SBDGPDUrymEpmAFNMuen9FJHChNslCJuSceNQKxDaJVLD52rZ
 lILPzhTtIKOTtqiu87rsNhW180HztNY9yn+P8Mc+kQ==
X-Received: by 2002:adf:f185:: with SMTP id h5mr5876721wro.302.1631795395668; 
 Thu, 16 Sep 2021 05:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-11-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:29:04 +0100
Message-ID: <CAFEAcA-QE0V4wkQeor0jZm3n13GkrHzT3z_2xwWwGnhHpYo2Pg@mail.gmail.com>
Subject: Re: [PATCH v11 10/10] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMpDhE+n7lui

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
