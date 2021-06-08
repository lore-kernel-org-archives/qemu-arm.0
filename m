Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4231374lfa;
        Tue, 8 Jun 2021 02:02:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8I2tTv1ygZ8y7XAS0vQ2kLMjPRYDjzxM/6ORT/t8nbMdZyPAZhdmrC3vw7QkbHrw3Jds7
X-Received: by 2002:a05:6e02:1c84:: with SMTP id w4mr19295871ill.122.1623142947283;
        Tue, 08 Jun 2021 02:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623142947; cv=none;
        d=google.com; s=arc-20160816;
        b=ZokxLF4zSbxqIzhAzB4DBh6c33Fc7eNIm4adYfH1G8olNy/4e1wfjzokTKwY/d2L+O
         OGFXASKln6LB/vWusUhSDlcO03ww702GpHudfksUPrWauB8QULaKjD/sVAv0myPVVJjl
         1nDZeDj8Yg9eLfr09lVTY9KZTwmE22KfIrMhcmmzI/7q8E+adCsFogBPQMZAloIInbo3
         K8pTFiIu/WIe8eND0H7xWJLalhLuvunrnE6uOqFuSoAxOIzKLf22GErAFOornx33ilI4
         Zl76dstkRjJ5+7sipS9pTJPjOpkQp6RhaamsEwpQ/xjJfrV8DaCtTgi0DZHl7BSV8UqK
         B7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhdwLbjB/vDhblZFDyxtGQBjLpS0g4Y41d29yHrk1Kg=;
        b=q9E13NV8wvX1KYxI4Fg21VqurQ/eo7ku54tDCSOq2ef0LoUnfSmxKJZkFtimCpuTkm
         2lgebXnP9lKsBYBhzRRaz4nw8RhlE/GORvjeRP3wLaBN3jdCNW5anROVnGzkV8w7gSap
         wEMEZcTFnQD3v89BpcYMrYRW1je3msL4vuaLoWN5R+Urrv4aScKcpEJtR0yz/ntd+5Qf
         zYhsy0vCvNVtVY7kSwPUpzH2VYeTBblVQYbB8Uf4V+RelzVL1lY5tK36Q/oME6SWk5Df
         HZQmZK689c6GIeOaXZ052JdQcINnzNHGRlQ6W+wKQMuaymyI79uk3+KMnO35MJLW7gac
         Z7pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dBGm8g29;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si15864548iol.35.2021.06.08.02.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 02:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dBGm8g29;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqXcw-0004YU-JE
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 05:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXb9-00037X-3z
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:00:35 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXb6-0001aP-IP
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:00:34 -0400
Received: by mail-ej1-x630.google.com with SMTP id g20so31437508ejt.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhdwLbjB/vDhblZFDyxtGQBjLpS0g4Y41d29yHrk1Kg=;
 b=dBGm8g290rLxwjhftVOKURbAj3mJhq1wvBwzidC9ajj2p1W21bOxw8cZOX59p5mphO
 cNdSjGp2WLI/iCpTKcek9dzFHHEJ17mo3c5Jvp7uJcYjVjIG8KH6bkCNmtYH+KczdhXr
 gpqA9K2DX62dGEZ4lBNaepWu9CXvxvaZPdt+k+cBWSu8MHmU0IcQJdRCHDKYeudr2O/x
 q6y3i9cJcyjN9RV07PdhkFM376eaKBIKEHy9n+rih/g4yjodXCNf/KDRNXx/6AfP2/2W
 RDK8XUBL0gNMkRpbjB5d7/yULn4W0jKpsWYEYvCIQYRgt2Iq6+mYfHRuajmDblcIpH7u
 7TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhdwLbjB/vDhblZFDyxtGQBjLpS0g4Y41d29yHrk1Kg=;
 b=hFoHriwr/64theMdJHAwpFIDvMrTwCG9XdOBZcyxUW9iiZh5+Ve0XJfkeP7Lfwv02Y
 QrSUQpJmkzGSF4eJ4es5Jsk/ABHYxweAhE5VLpJSjaa+CeymD0ma4PGkGPQWss7sfnsM
 ZORENY9wy7H6hIHfqz+u8EeMLpefIyHGnA6LwKewpJPukXtG2ianrleUzZpLL619a84u
 0UogGUi0t8rOgnrXo17omfqGBjAH8kwB22DJM1jG3xQK/1n5vzUs/4K/SBTbpURpcjwo
 nMeQFDZ9bcuMWjQjbj/9XZL7LNwcoC/nR2kj4N2PtVcjBienGEtOuu+VJthTbwp895Kh
 CFaA==
X-Gm-Message-State: AOAM5327LEAU+3bG5dghIvPrs6g5Ug3/mdj24xchBKMVwNZpKlNh3LvE
 OMtS2XKfaEgVzlNHaU7PMBFrNR7DQpVbPO7rlYDVCg==
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr22172858ejc.4.1623142828827; 
 Tue, 08 Jun 2021 02:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210604183506.916654-1-richard.henderson@linaro.org>
In-Reply-To: <20210604183506.916654-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 09:59:55 +0100
Message-ID: <CAFEAcA-RFAChHY7vtV1mGpRWw7F4ydB8YeNdR5uQ-ZTwJxnKPg@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Decode fixes for aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcNIBF5tWS7I

On Fri, 4 Jun 2021 at 19:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A couple of printfs left over from the beginning of time,
> and asserts that are reachable because of lack of decode.
>
>
> r~
>
>
> Richard Henderson (3):
>   target/arm: Diagnose UNALLOCATED in disas_simd_two_reg_misc_fp16
>   target/arm: Remove fprintf from disas_simd_mod_imm
>   target/arm: Diagnose UNALLOCATED in disas_simd_three_reg_same_fp16
>
>  target/arm/translate-a64.c | 87 +++++++++++++++++++++++---------------
>  1 file changed, 52 insertions(+), 35 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
