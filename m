Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1086192lfp;
        Fri, 1 Oct 2021 02:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxikxZIvdGOg9UQTSdfe7MCHvzo4AvhysACYjbaNeNmNrXlHANOg9pxafmArLwIlMRoigLu
X-Received: by 2002:a6b:7016:: with SMTP id l22mr7478548ioc.48.1633079965128;
        Fri, 01 Oct 2021 02:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633079965; cv=none;
        d=google.com; s=arc-20160816;
        b=lCsu5dJtoGshshlADFjJkpSlw5/gwvGlG1FNvMBeVzHcwiDcffSjOD57oGCoQ7sgVz
         fNijnZHOJcuehptE8M15pGuA4KNLjhuYmfKODBkfIQib/4hFaiJKPHsbyW+vW1L4wvis
         XKzv9SjiopdUL+vnks9omw/HFK1285kLMPUsFs6CPtP4ZKNsH+ZEfCByNGHL18MjBPjI
         IjP+5dh8hM7CuqRO8AwevuWWAX/tXfOie0gyXXbTpmj+TgqHAViCaIX6CgHgsdde2fwW
         to6wAHmSaXySEsxqmk2hj3AAagzPQBoM9p44btSeZFJ9nyMhQKodi+MoB7s5ozQpfWdd
         PeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dofPHDkbS5EFK6rOTSbKGobLAdsU61X+RZBg8dfRTVk=;
        b=np6/Pzp2m0nYIYDflbA7g2h/zoibaww3deEzRmSZ7I2llJ4pr1US1OT0NrhxDIMvTx
         NsHqplCTDuqp63T0OaUJDYQpimQw0WoBedckf+9/5u6xCyYlH4JT0QTLTz3A7+LzgAtg
         pYKCTuIE6JrMNARiiTyIZSYBUCHb2ao7fxIpRr7J7jRXxTiDFOziYL/pdlJW/gQieCBV
         A8f0aH1nIxYDksTWi8C06QxH5W33Pwp0JwRcWw/4dlaERClvQ6f/IGXSSn6B82Oe75mf
         PAIlgsnAxsOHRJuUCQ92XuN7Zmk6I8pWGPEZjRwvsVNSaeroNhurUOnmtvR9JCAE4wr4
         b8OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6poW1P5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si8030823ilh.180.2021.10.01.02.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 02:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6poW1P5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWEhQ-0004cN-Ep
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 05:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEhF-0004c5-5k
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:19:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEhD-00038v-RT
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:19:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id d21so14370188wra.12
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dofPHDkbS5EFK6rOTSbKGobLAdsU61X+RZBg8dfRTVk=;
 b=S6poW1P51cJFr2hRdvSLez6SAYz4Msukn5tEbtcTfMZ5Deb576L9LJdB1jRt8UnQ0K
 7w9uErjd78KTQpNXjkFWbEeNAC1aaXJQg0IWRJl9IrcGAAQUL/yyKjr78lvq4F79U0VP
 nQpMwmxbI9vAmEvFXNOM7LSyrr08G/QLpYka9LaFNfa++SRovzVIv8paT1wM/V/t3Pz8
 +Ld/ZIi2aVP3Op4QTnEHJPFP7BDcdawR5cs+cvN2F+BF1Tt2UW4dZpOhjeWzZExK8Dc8
 0vzjDVzwScgGSqqBSr96oi0NiBBtCtL5sjgCtZHNHRkoN6yKk8OOsC2f476ICfw8qCEg
 wpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dofPHDkbS5EFK6rOTSbKGobLAdsU61X+RZBg8dfRTVk=;
 b=Qv11nTF1LaIEc6zjAi1JpwcY1j7+56tB/GveiWiTJwseIXfx2l4hToGoiThNuyK8bd
 dc4d89cvcz1r9FHtSKWPrY7dmYsstyUdT2DP9ANldFeRHYZKJjzpLJQ5OP/W2cEAOCmA
 xJMQRZVBJ7REYxp4HmFtkkxJ/XfyT1Yh7RJ4VRUEplNS39FjDKTw2T6LNakBU3Cazc2Z
 pLtlcI4ibB80yEkUiTuilJVtgACKCOfylXfK/Lrs+NRTLbJFiyrGHBuIJT7Pyc1531tt
 204ioW0ADIiFdCNK9GQKcwNFQqz7fTzF6rGkuxywVVIRqNmZr1CqQqp47p4N0GCVp2Kg
 Uayg==
X-Gm-Message-State: AOAM532fdGiWRoy1UfMVmx+xNKj1xY3Z6SSI+TVVcWhilWaY7lgOeKHU
 rFxHhpC0ICZoemo/ZlRjoa7MgPCMR5nFBsNAp3kX5w==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr10825268wrw.376.1633079950299; 
 Fri, 01 Oct 2021 02:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-2-peter.maydell@linaro.org>
 <907d7432-a81b-b36b-9af5-a5554df3bddf@amsat.org>
In-Reply-To: <907d7432-a81b-b36b-9af5-a5554df3bddf@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:18:16 +0100
Message-ID: <CAFEAcA_Lijdzooc=5UvP1U+khogXRBjunkrHg9wh0ex1z=u8TA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/intc/arm_gicv3: Move checking of
 redist-region-count to arm_gicv3_common_realize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xy4tqRQCVk7Y

On Thu, 30 Sept 2021 at 22:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> The pattern make me think gicv3_init_irqs_and_mmio() should be
> refactored as a ARMGICv3CommonClass::init_irqs_and_mmio handler,
> called in arm_gicv3_common_realize().

That won't work because the two subclasses want to call it
with different arguments.

More generally, I find QEMU's class method infrastructure
sufficiently clunky that it is better avoided except in
the case where it's actually needed, ie where you have one
callsite that might have to deal with an object whose
exact type may vary such that you don't know which of the
methods you want and you need the dynamic-dispatch.
In this case that doesn't apply: both of the callsites of
gicv3_init_irqs_and_mmio() know exactly what function they
want to be calling (there is only one implementation), and
moreover both callsites are part of the GICv3 implementation
themselves, so this isn't about presenting a nice (or "nice")
external interface to other parts of QEMU.

-- PMM
