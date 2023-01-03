Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp7481950ejb;
        Tue, 3 Jan 2023 09:43:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt4JOGXouHDky08/yymog+2DtUWLoCTbsfMrlQsPxYDCkXyGp2zbR0HkldHhjVl7G/rwDzn
X-Received: by 2002:ad4:4d86:0:b0:4c7:59b5:d950 with SMTP id cv6-20020ad44d86000000b004c759b5d950mr66008293qvb.2.1672767822148;
        Tue, 03 Jan 2023 09:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672767822; cv=none;
        d=google.com; s=arc-20160816;
        b=znU6Y1TZZDdsOz1krvhWzaHt0xz4YIAbig64yr4pL2rD7/DFZ1be/Kadn3TornWd+w
         z2ZeZBZuXUtXda3N//eDn63aAnZyT38R7Y8o+y9X0G/Zu26GKhjf56/RW+iLRER7W+0S
         fyWGuUw20D8qRyhBeXZLGP0JW6eA2XadJhv+fOu9dzn8YWUIR7L2441Robdq6c8mwBji
         EkFITHGaMcBHnufb0kDyXt4uVb8oD7GPG7pD1Hmissam3M5haAixx1C6/wOp+IEtACON
         mMHBLFkbtiqO2HOJ8UlQJQk5uFA2V1+t/Ba5dArKysq76pQNLdV7qeCYK31p0eYeboaF
         SF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GBvs8LllcPrT9bJ3hcstLCA0o83D66Uw+2DFsfyiWog=;
        b=pJiV9+SRy5nuAfwtOXjSk7P9yubjQv3GAW5tybc6vQXqWqPDKkcML4et7sP49irLEx
         SLB/0fh20ZXzqxw599qJ/G4rNrH2XhRAwWmTtD+xNJpLwSGKriHw+i93dFKlEygDC8AN
         Ar3kV20WySgFBgQJeG6K+xf6SoHVaVnVr1keDA2+lAi8m57rdAzlb/ISp0v0/nP4rtqX
         MxEbeFd5lmVyOSK8XcAJ38G90fVJ+lfSkuGXwbT6ijpTfYIPsz7YyBo2+7l9owuuC4L3
         dveHPSGrtIW1gIHe3bvT9JKZmVfDg/PzoesvOgIgLmKcB0vWvPTJSZQY5TE1MU3q1cuw
         izLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZJEJ6rWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a0562140d4600b004c6e2c3972fsi15847569qvr.584.2023.01.03.09.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jan 2023 09:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZJEJ6rWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pClJz-00061y-In; Tue, 03 Jan 2023 12:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClJy-00061h-9J
 for qemu-arm@nongnu.org; Tue, 03 Jan 2023 12:43:30 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClJw-0007oG-NB
 for qemu-arm@nongnu.org; Tue, 03 Jan 2023 12:43:30 -0500
Received: by mail-pl1-x636.google.com with SMTP id c6so150820pls.4
 for <qemu-arm@nongnu.org>; Tue, 03 Jan 2023 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBvs8LllcPrT9bJ3hcstLCA0o83D66Uw+2DFsfyiWog=;
 b=ZJEJ6rWDIVeYqrEymYvMjgVJVPlaPX0cxgQAWJCuxO9MgryT/Se9Xhy8VqYqFn1N6X
 5tn8++0pQPXmp2dZRKUbZa0EeXFAAeKGYrZn3hqtwS3XdinOdBeOE62KvI7hRdhm2SRY
 7+OjwCbxIf9OXyDaG7x7XXtycxTYuY/maPA3KY74L5F3CSedv0z8slMh42Xlk+WXyXxi
 AuZK0X2D0lYQfc3hs3Uh0FRyiGvzw2duRwwy3Z8bRqqKmNaCmuygHe/voCJ3EuyehLbO
 /Byj2POJKsAVGbcloihm1IZAzG4edV7+dKtVzCdvCN1/KrMiBXk9gl2RfxA3Rkh1ukXO
 2JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBvs8LllcPrT9bJ3hcstLCA0o83D66Uw+2DFsfyiWog=;
 b=Yr284qrgRR1yXzDWVnK2/kP5hysH1aQOTLV26Sat2QKRP1qbBvUe4a7/agD3oCYbtB
 eAnBjpU6x9s5EzvZGbRxEMGiVs5Oe2WPdbFvjmxC31GR2744UHGGrEhdiVZ1vMje4iqV
 oNWAs4Y5sWrqV1P0OIZ7pouLfDHBlhOqu0NjfvCF3LOFcKotDv54cOJsJEam+QmLPsrN
 GsAqH4Z0EW/Y+plKpVwivwu2hoGq7Bw00+0hbtnDEBpZD9ZXpG7J8xF21mvI8CMzf+Jz
 4031AGtkzJJPpzUMgcpdW/wOOk49Xku2DUS6gRifG++crpbjypipzIOTLx/QpkOiw6Yf
 hBOg==
X-Gm-Message-State: AFqh2koY8MDJkSsuJFFzolGUIO1ZIE6/zwdIT0CgXLxbBOwwqwX5PAiS
 dTlKvNzK29cHZrrvTkSYkETmtc4/hCd0FC21/RiNeg==
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr2973385plb.168.1672767807348; Tue, 03
 Jan 2023 09:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20221222215549.86872-1-philmd@linaro.org>
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 17:43:16 +0000
Message-ID: <CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1C4j0HPwOm+F

On Thu, 22 Dec 2022 at 21:55, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> ARM CPUs fetch instructions in little-endian.
>
> smpboot[] encoded instructions are written in little-endian.
>
> We call tswap32() on the array. tswap32 function swap a 32-bit
> value if the target endianness doesn't match the host one.
> Otherwise it is a NOP.
>
> * On a little-endian host, the array is stored as it. tswap32()
>   is a NOP, and the vCPU fetches the instructions as it, in
>   little-endian.
>
> * On a big-endian host, the array is stored as it. tswap32()
>   swap the instructions to little-endian, and the vCPU fetches
>   the instructions as it, in little-endian.
>
> Using tswap() on system emulation is a bit odd: while the target
> particularities might change the system emulation, the host ones
> (such its endianness) shouldn't interfere.
>
> We can simplify by using const_le32() to always store the
> instructions in the array in little-endian, removing the need
> for the dubious tswap().

The tswap() in boot.c is not dubious at all. We start
with a 32-bit value in host order (i.e. a C constant),
and we want a value in guest order so we can write it
into memory as a byte array. The correct function for that
task is tswap()...

-- PMM
