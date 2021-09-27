Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3722762lfp;
        Mon, 27 Sep 2021 03:47:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcnExlmgy49Wmb8SOORO0JPzslcAexJJ49fnYcgUwz0WirNh1JGzSarkbK7w82WATOusbH
X-Received: by 2002:a05:6638:95:: with SMTP id v21mr21451071jao.113.1632739648249;
        Mon, 27 Sep 2021 03:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632739648; cv=none;
        d=google.com; s=arc-20160816;
        b=rnknDIR388cBb/g4itU/kGsVu90c1rcSSt+GBVmYa+wU7bYey+WuqsAGfsdsF31ytv
         UyufLrHCuG8ja9Oj3nQx4+1CjvNrhtq5vS2/9jxjGTrKbB4DS8HRx6PB1ORndOityXs5
         0O/N/Ajh5G/VGr2nSub8S+RXBvDYCTVxaVVtN1dBkvBe5IlkDsvJCDkYRW1gOuxEr1py
         IReUV5+PWjwR7HNoBMtPLAwUbX6rn2873u76p7JweBV2cUhVGVJkXRdK7vXL+5Az908D
         DpZhUlwo22gPnZqXz0pdrrthioISxGiC3m1V0tAAGzG3A7CFemNH5aYxjigUsGIaGbWX
         yA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=okFMjxgF1IEAAUPNxNlqlGmrmBOLL8+5IjowtiWG/1c=;
        b=euQqrhoAeTJNr9wuzhQ7sLhgFIQGgl+ftfHF+tnDnzQRO9VcbrFUYyHWVA0zSaFjs6
         DKCyhIz3nBhgc+prdZSWSQI7/eL8Ntpg5bNx8W0o2dkhter174QgA+FeuvkLR/kc1iI9
         9rk9UrXnY3IMD8Eza7fTbHXzC2s3KSqLjujNxbOFsULlzD0sgsLJYXtBWnYqvS8EyCAq
         SrVJdMQ6B8D2uiauJbU1R81eISxxpVB4YLHFBGo1J5AI7bj/bPRN1Hg+R9uTA2dbydOF
         r6gPi9arwSqURZiUDItW4FOajZ5nt9YgMu+lqqSFObX9DZqKVbUF4Q5UYjGGL3dp5AAv
         gHKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EIISiw9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si1245657ioq.15.2021.09.27.03.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 03:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EIISiw9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUoAR-0004xF-KY
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 06:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUo9W-0004wq-Kz
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 06:46:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUo9U-0006Cb-J9
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 06:46:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id s21so11063814wra.7
 for <qemu-arm@nongnu.org>; Mon, 27 Sep 2021 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okFMjxgF1IEAAUPNxNlqlGmrmBOLL8+5IjowtiWG/1c=;
 b=EIISiw9xwfqUdvGQDu3t3gV718p9FGYhjfkXNbAt+JypTpDFAMcm0aZ7o236420xnu
 4AD3HZvscTVxn4boKR0b8MV3TRl78dhOYpl7+jZA+1vr6N6fWA+uVw8iIv10Tu6oy0pT
 mrX39m8bkgNO4HwFuswTjNpP2vlFWLv5DPSI+OonrdG6IAaWLcjIIV3qtb5Z3aZlWU8P
 TQI87TUxSV3T+XO/6HT+A6fZgEsTjiIgRRr2uDTJNDh9DSeu2VjtQJWF6Q3a3hmlj3KB
 iqiKn+MUHMATE1tcd6RDFWPVzH0XOG95iXbP9YKwH2E0PrkZUMv8Ju1YI36WrUDStcr5
 7GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okFMjxgF1IEAAUPNxNlqlGmrmBOLL8+5IjowtiWG/1c=;
 b=sdNZaptwBpzmQT+hmihqC/yvp2JmTbftynO9lHheyQwVq2acN9J5+E4NJN3kY9HOGh
 F5v+VFzhn21oLHa3Hv1glVvBKKzV+pIo7KQlpuQZQrClJAHSESXZTNXSmHN4srupD3vn
 nrBsFGPpZ1N9GfZKqifU854/vfELmxS411DZ82gmSmzSkwTIVKNRp5jbH4oQSpjqIi4M
 o4Mgc1XPmDXRr4tvr6qUrGfqMBu/tiHSN5yiVQFjPcLEhxcAy/fuXX7bLHenc2SkNNav
 jtrTbLjXq2SrpxaF3t81sY+m06qhSqg3jIKZNAxI2PJgjj5BhiVClUM5B5T/WcfF1Ya+
 9w/g==
X-Gm-Message-State: AOAM5312rWY7SnA3HgVA+bTtWsTqe6k4mbub1FiGYvcai+i6lqQt35qE
 QtBk4kf8Ci6hl7JhKcwND4L0/6PUGVGnoW2JVgZMfA==
X-Received: by 2002:adf:f185:: with SMTP id h5mr27725708wro.302.1632739586864; 
 Mon, 27 Sep 2021 03:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-11-agraf@csgraf.de>
In-Reply-To: <20210916155404.86958-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 11:45:33 +0100
Message-ID: <CAFEAcA_Xdbjbn1nxvC_5CdC+jdo6=ChiJDULvWT9F+c6VWyRAA@mail.gmail.com>
Subject: Re: [PATCH v12 10/10] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 04r4OTHs9niI

On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
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
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Applied this final patch to target-arm.next now we've sorted out
the problem with the orangepi, thanks.

-- PMM
