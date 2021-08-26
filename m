Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp618943lfb;
        Thu, 26 Aug 2021 06:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNjUqRvX/ftkJ8gx4Lu3x9tsTr3KO6BTg1h964G9V9mTmxasZvBVQKn0RyXVCZLY4XC5Ip
X-Received: by 2002:a05:651c:1683:: with SMTP id bd3mr3090040ljb.323.1629984936722;
        Thu, 26 Aug 2021 06:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984936; cv=none;
        d=google.com; s=arc-20160816;
        b=Zv1Ijx0E63fvLTOXZ6nmHrcEt3Ebi2HvKeM/bY5d95EILmSgytSgqZ2G5B5STp5yK1
         Peku0v+lGgasfHZzl/z99E/VyDZ3yl8RaSqCy8/ufJGjXmV0ZUoDGtaYNKtMjtIqXrPq
         cMk0ATjNlirsAmE9AEMolkPGZbsiiTrbApN22/POHWMhIgtDdaOlUy3w9/CYVCK8CyJH
         eWsVoINxrfM8XffXx+gvFWRvlEbzi08Nv0A86WKHfv7jpetEzDhP4SfNWIHZEZaGFOkb
         15tnAWyzZMCvc1wgSgPcbL2Mcwxh57mTXuTFDIddv51BZIz+7Li94pM/BzmkoNaYpkPM
         7ZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VcB6UPUv0/aefkn21WKvLPnZynKgM5JWfyphg6syXCc=;
        b=UVNzT/6ZhB8XTrnpc6ID3q2SgqwtK8Q6vHqWl5anTnDDvgU1vnfSr9CGU9BT59hZ/u
         6JvVPZi1F+mVp7I0exHmdmBiFJ8PCruGH6ce000wmwgskBe8CtZ9bt8SqA5vpKzvpoF6
         N6U1DNiIKPN0jr2rM8QXLg2a8Qr+B1umlhwJPUH2NqVd3faRNCnJJlqyePUfvqyhfboV
         5X4loLJWd0M9n2aSo/mqd64fIoMgoJQxFEet04u5c1CT9ovnatGX7pecy7B7FvJ0Qp0s
         TU0cIP030BeM2mnyFxH4WLNpBKcwtpNpBCV38sT/Xy8P8PNirc9k3TJ87mGiTua+DEZ+
         875Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=evH4JPeV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cs9si911261ejc.233.2021.08.26.06.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:35:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=evH4JPeV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFXb-0007Lt-Q7
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFIe-0000XG-HP
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:20:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFIb-0006sw-VH
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:20:08 -0400
Received: by mail-ej1-x62f.google.com with SMTP id me10so6173069ejb.11
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VcB6UPUv0/aefkn21WKvLPnZynKgM5JWfyphg6syXCc=;
 b=evH4JPeVuIxkidqquobJskpIj7Pi7vQE5nbm6B/vVDb8cQ1fWolOw4YXa6Jzy8RfhA
 ltzoJBHL6BjJYfdWOR2V2tt8kxaQ2RHblX8BICVWGEihniF119Jkn5FUbNGk3m3M43uW
 B+uDCzmsf7s07imu7ZmeMEI8HfvqJnKYp+iM7kS4z51S4bhw8e7p3rR0gU6XZdMIjR1h
 yQOxabr/sH3YF5dFoaiCK2g00PzOkFKwC8au6jAIMG6FaDoV+vN88oNIk5JdOHf37scc
 kzONGxUJ1D11SEdz8nSHoh+XMEvcEujQrpWqgd/XbQGJwK7nSMoSGu+7EdFtmFbj9IAc
 D+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VcB6UPUv0/aefkn21WKvLPnZynKgM5JWfyphg6syXCc=;
 b=PSIJwMYtIrsgs5WZQaosrXfFTgrzvxmuiHoRjwpShmTqNVVXRz5NU6o3oJYqJzknEw
 YsVc1HTKZbV1LPLIwhH/p/3wnlid3vZ2CacShU9tusZovSAq+ITDm6wIAIg/cmYpo7+f
 ZfFvECja3kExvGuXbKRJhXgCzLX//eO0r6J7QuhcC/uOMYqYUxsQ+oxClAqVkbErDCx2
 CGYdo020Synhcc23g9rwSdB2r9OBJNS2IRsHjnaE+rAHirtxtS2M+/cn0Viy+fAFUiIS
 YLbFBEYXtg5pigozW3qyW7vAWtmX3/QXfnFdt51CIyOoY28JvYpjRHUBaDCFGjrofOtS
 aI+g==
X-Gm-Message-State: AOAM531ySqtWY3ib/w9JAHHO98sljiY+WSSxy/Tf0Lui2WBGLxNE4tvO
 SrdxAqZYm0NX4986t2QkhhspIyU671xRQpkRa5q37A==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr4340252ejn.56.1629984004616; 
 Thu, 26 Aug 2021 06:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:19:17 +0100
Message-ID: <CAFEAcA-n6VmzGEp3SCEgziEC6TkcbgunTVqVmJ3iyfVCpRbbzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/dma: Always expect 'dma' link property to be
 set to simplify
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99J9r9Kg3aMM

On Thu, 19 Aug 2021 at 17:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Fix a qdev realization ordering, then simplify a pair of DMA
> devices by always passing a MemoryRegion property to the device.
> Doing so we can move the AddressSpace field to the device struct,
> removing need for heap allocation.



Applied to target-arm.next, thanks.

-- PMM
