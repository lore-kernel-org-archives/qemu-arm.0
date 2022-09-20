Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2024718ejy;
        Tue, 20 Sep 2022 13:42:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49cur9Oazqe4idBn+S7onkCx6CcLg6dJBDSfGg4YGfklhWFKtsCgWKu5ZNQdLUy3y7e4x2
X-Received: by 2002:a05:622a:50b:b0:35c:f172:514e with SMTP id l11-20020a05622a050b00b0035cf172514emr7585770qtx.60.1663706555892;
        Tue, 20 Sep 2022 13:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663706555; cv=none;
        d=google.com; s=arc-20160816;
        b=xdB4OyI49KaWfk9kbkImoOaCW3rPz9dvOUl187fSCyoE5y5gNxVpqVBjz+I2Q72/hh
         KryMw+f/jJcBQGr1yTStPoDstW3AH31VkY7BtB99Wv/2fxxhf56wdcpzrV0wugV4ZHy1
         FieGqKuOhb5ItEZFyBQb5ayfE3ctI3ugsc0tK8HYm0F/u0MvdvPNw4ZzYaoR/HOrAkK3
         vrhPwz6ljg1HTED2WvyMFQAE1bPraZUfDE2UQFetHSIXAEXs+XGCWxRETSteOEouxA2/
         DEqauno1UeIOoI3SjMXKMdURI0EuvpRlgjuGzlwEX4fPgkG8HS0T7B0npJ2HeG2BtQhY
         ukew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MTZQ0ZKgObtmtbYGay8TqRoKaepCg/5wsIJnL82JaoY=;
        b=t6JAvxM2mNyi7nZskSx1un2ZtR/uVPifqkXH353aaDn6IAAn8bk344+6B+OTn0Y7CV
         ISnsTfwjHviiPJCSPqDY54t2HLisdmE38xhlpaUYGzbQu1y6vgea0QAlss2NWzeVohSk
         f9fOW7zbsRbATqKb1lFBXHUly6HvmmRs3Guyjnd61P5sRZsDQcz2bh/oH5XRNPtacXAl
         oQUaqz3H5FDUXglP5qq6n6/DrC82lQHj3VRxjWAFxaUwCTmkLfd9I3+7UC+l+ygv12A8
         Vo3cSpdku0pF6iocBV9N4Wcj+gtbMod6wYgIbi96NOGJFpaJ9KYEtJ6D2pGDHRVscVmv
         3ZoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGazIORB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020ac84e44000000b0035cbe580c98si499980qtw.101.2022.09.20.13.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGazIORB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oak4h-0003F9-AG
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafr4-0000VP-8l
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:12:14 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafr2-00075v-MH
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:12:13 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u9so7397448ejy.5
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MTZQ0ZKgObtmtbYGay8TqRoKaepCg/5wsIJnL82JaoY=;
 b=lGazIORBG2kmJ95qYHD9PS44EVpHRmI8l53fnYdVjNwHmBisyNpgT1J4oa74owvEHa
 bS0rKYDDJh0RKwx+TxwRIFyDkzhdojT0vo7G9QFcZt+/4MsH65fTlYTNFuhMUOFZb0+I
 uETisVs5Plj4z4vglx/SjYB97u9mC1eY8s/yIyL1WgEQYz3Re0dzRVuQEvPwJ5vCofb5
 0STUrR8rVGHdm30zNpBzTTXs6cuYxpm6HaMziOWB+OhSmONWFnIW7kWDP2aYStV/qr33
 insWnepw9rhet/O1zugbLzQcTQw1Xeyu9CVSEgAJu1ny/kaYWZSCkGaLl9KW6m6jbCIt
 sw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MTZQ0ZKgObtmtbYGay8TqRoKaepCg/5wsIJnL82JaoY=;
 b=h8HZBDf2SWh+YJKb10mUIqY90yNgeHNxsBP2NCxSsoogkMUS2+IKAKmL5dnIgGwcTD
 jNblUo7Gq3yAggqs9j1NPsgl0qb4SxZbUU06ulVOVgyK4KRl21q/WsUPmy9wz0InL4vJ
 twC2qyUdTBh0+BnwPJrH9vjM5FkyU14FqI66HTwdzAmLH7e2XOD9P2LCetYNci3HVfRD
 f3qLu7YsimZnBAepfb+WURm+w0gFtUGYiLpGbN7Lc/rkyXBSLG5FODB1abvBxtZLo8ab
 puZ+2YjR6zjKPzdBNIcjHegthex6lypRbKGPg7PoS5e9JS/DlQkCjrazO50nPbxu2e5i
 S6Pw==
X-Gm-Message-State: ACrzQf2rFBjfAt2MlZ0t86CFYi3xcODvNrru519ZQvWZC1fjibukBbxl
 IkDsUn4yBIt/pFtyY/FdKu/xdV+i0QrmWp+qEkdTMg==
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16839389ejc.504.1663690331120; Tue, 20
 Sep 2022 09:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-36-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:11:58 +0100
Message-ID: <CAFEAcA-_gtGO2bgR7G-eUrcq+vH0__ixBMDR1PB33AeMDDkpmg@mail.gmail.com>
Subject: Re: [PATCH v2 35/66] target/arm: Split out get_phys_addr_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xAKnSnCnRoQU

On Mon, 22 Aug 2022 at 18:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
>  1 file changed, 74 insertions(+), 64 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
