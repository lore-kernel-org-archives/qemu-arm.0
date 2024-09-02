Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp996641njf;
        Sun, 1 Sep 2024 22:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwgwqOqRGp9gdPVteujicrOmiwM9gcYCI9RDuyyFqeRvvLWo/UE5+sP+S9NAosoVmEP1Ix5jTgmbt6Cw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDllJBrgJkvBlR3WQ4VFnkBwiHb/BOdo2n6JrJRWz4QGe/VolaCEsat7rMQOnnJB1eZHK1
X-Received: by 2002:a05:6214:338a:b0:6bb:84d9:8f91 with SMTP id 6a1803df08f44-6c3552e2518mr85684926d6.6.1725256752490;
        Sun, 01 Sep 2024 22:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725256752; cv=none;
        d=google.com; s=arc-20160816;
        b=h3na1Y3z+E4cUSndoD/VWFGuxe6nnF0X1Ho1RtOj9q9YUdEApzGbBUMj5xk/23+zlM
         UHXP/0dh5VfdBDSJfgPi0pOphc4tFJSLpRbwk6RVj+1dJpsk9sxHwl67IjiGQQdx5k13
         ujZ9TDRn58JuXdNg5fwQ8qdGp6mk6/0H9dMfQGru66qaVLyFMzeOca0p+R6KnBlnChD1
         4alTcUtzO75xDbDMHbHzJOJ3ORjGxrVRxjv3sRDqa1MVUz5ClR3g/bFtJUW15nNrvI0z
         8CrrHrrtiywFInXrH+feOdyrmonf7FqBIsLTnVBuk33YV5I+SrAWxsmXBygLJGzzSZjS
         1fLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id;
        bh=nwSOLfVGu3ffro7j/9Tyhge1MFhGbgyXxDQ/GM57Olo=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=LZl4lSkojEgYyitH58UqzYydg40o22jfxnmF3u/V61TlMC2Cy+cXm/J3dcPGzDhoqP
         y75RHean/NKj8PlPEFzGAH/dAmC9zKrQDEHqbN53rFICBvK6HNiMaD8YessajGamAGv+
         gWsPP2/elGZBpX6xlNKrE1mfsMZSQBLPdNBddtL55nMzHfpb9NE+oLhnAbq2HKMxOrsf
         GIgIcUBnR/vLS1crZQuKxC4yw1KwA/dtpQil+t6IPjTiJFTWa1mUj2en9ifWG63Z092P
         h26hXM4MzgP8lgzSz/UNpdkAkKea6LJTvGYDqrrbq8yXCqoLuZ2nQ14Tn4CJTXULXU8j
         hVyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c355d681e2si55787686d6.353.2024.09.01.22.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Sep 2024 22:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl05e-0004OV-V0; Mon, 02 Sep 2024 01:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3a9v=QA=kaod.org=clg@ozlabs.org>)
 id 1sl05d-0004Ma-DS; Mon, 02 Sep 2024 01:59:01 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3a9v=QA=kaod.org=clg@ozlabs.org>)
 id 1sl05b-0004hc-Nz; Mon, 02 Sep 2024 01:59:01 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Wxyk26024z4x9D;
 Mon,  2 Sep 2024 15:58:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wxyk13n5lz4x92;
 Mon,  2 Sep 2024 15:58:49 +1000 (AEST)
Message-ID: <00b9236f-34cf-424b-849a-bd65ba854ee5@kaod.org>
Date: Mon, 2 Sep 2024 07:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Avoid shift into sign bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240830180516.2103062-1-peter.maydell@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240830180516.2103062-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3a9v=QA=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2Uiml2cfRfQn

On 8/30/24 20:05, Peter Maydell wrote:
> In aspeed_gpio_update() we calculate "mask = 1 << gpio", where
> gpio can be between 0 and 31. Coverity complains about this
> because 1 << 31 won't fit in a signed integer.
> 
> For QEMU this isn't an error because we enable -fwrapv,
> but we can keep Coverity happy by doing the shift on
> unsigned numbers.
> 
> Resolves: Coverity CID 1547742
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Cédric Le Goater <clg@redhat.com>


Applied to aspeed-next.

Thanks,

C.


