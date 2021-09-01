Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp254064lfb;
        Wed, 1 Sep 2021 01:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDy22d2zWMwtuJ/lcgNYjZlhPzKMDEgt0J2hMvXnoIMRfAKcN+BIqZ8UYv0rlKGoD5bUNi
X-Received: by 2002:ab0:494a:: with SMTP id a10mr22299002uad.90.1630483726581;
        Wed, 01 Sep 2021 01:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630483726; cv=none;
        d=google.com; s=arc-20160816;
        b=CYUQkc7TRpbYNqqwqyDVWntxpJBxZrqOcbj5LRav3Gxh3thIR3TzzYWYzHFlAxt4ZQ
         3NvDM1UdiwUAk3BCsjssIO6WnZBxdpDpGOvZOGr1qeYRQ1XCuXaYl9rjJgFxa9mh02Ng
         vw5joKY5CQhVmTDZZvwZKF4qDQoPjt5dLJLYKKKTbnNF3FFJfvzOdMHCxgh2OHAafB4X
         iJMPoB+cG0ks/wD5FgVXtv54bsOM3D2yCAvmWOet1Jz4JlyKpPaIOdoIO/wrdcsF21nw
         c8PBgiEMc7XGLibpe3rANg6ONFkyQImRtvMOFvteQ/WqX/4c3m8hqoSHWZZVAPzWz7Ve
         WG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMfv3X9fTvOJ+DdcPjRTJXNNnrQ9FFsKswFqE756ecE=;
        b=DIbiVTFJ32aG6dT+rcm+Hs2jGd3o9wuT5bZcmoH+qN1eJuNishe8OPY+OKxl9n+Qiy
         7CRPVEIg7ZmOYWj8O6kW5+bAFQMxNQf9Nd7enSjU+kA+11srT77FggK6O6lI8Xm2E4Bg
         Z+dqsH5jZoDU5H5WjqCfU8jwBh5fwdAJFLZwF8931x5CV7LZOam8LERFJC39CUteb4Uz
         1o2f7E/ypLpJTjUH4hB76KCwwicJaXzIIQbwjFz+gO6fQOn6w2eY7Bh7EBBY+1in232Q
         4w1aGPaBtS75eBIiF5mHIAkCbqtEZdsbRPANzYR/0NH6rVv7LzTBiSHWbQ888xyX5Los
         hx6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Dx/ZQ0KQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si2323284vsv.319.2021.09.01.01.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 01:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Dx/ZQ0KQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLLIb-0005da-R4
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 04:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLHT-0004MT-4L
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:07:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLHQ-0004Oj-FH
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:07:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q14so3131686wrp.3
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMfv3X9fTvOJ+DdcPjRTJXNNnrQ9FFsKswFqE756ecE=;
 b=Dx/ZQ0KQDf3GWB9exru0DnXGrrEWDxRzU9qOXuDPD0lc1cNvanYRPuphbu0RcvM35e
 +aDUGq14spg47ksJrSSv6Z4/yrxk/yemYi+i4hkgH/Zvoi0mR08vpz+98DSg6LSdDdmV
 rum4fjbdSNlUMmGIy0dJ/bQGCYNqVSil+iwi8w4YHsHJfeLK3lRSmg4uuL0z37yV2nJb
 KkcSbnTTJMWIoBovyYPlDj5PW5J5pPBdDA5UYzyPAH0MT5pOeW0SpQ1RCg88Z5cbIY3Z
 Bb3yto/qjDjfI1buvgQCcfzSaB3HDpQoOLNWVZ6NL45rd9SBimp8Vhsa0awGiAiTpBFW
 pIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMfv3X9fTvOJ+DdcPjRTJXNNnrQ9FFsKswFqE756ecE=;
 b=CP0XUzYxqn5xgo/na+ZOkKIqseSyyObszbxELCPAhx4OxfsL927kYoIuV3CcDERzkF
 ZIScV8uIkIqJ4MlfqRYg84V+kz3DCV561oPmlEb9D2sE8OmufGPhB1/QpeXqWPa+8cEd
 QGAjJlbbcOZCejV5gfNq88rBP8BATnan7FjQiwpWHr+1dstOpQR/9S8oYeCz2U55iLfu
 ghWQhLioFjRsqJ5ex92MPy7b+0gAVDXTXgJjYKOXtQ6fEOSEn67hSL2EX3JlayKYOWKT
 ZCY0+BN27jqQUOEQkNMRiAQRwLw6h5PxgsNzAHOzYGpD377Wrsw/bnQaKzL8A7NrHWkX
 WlBQ==
X-Gm-Message-State: AOAM5304bRv34l2SPW6VIbHFsEFLOpPEm5W6WBuMY0iA9FvxI3itK67i
 ISQcyLg0+PIkqqOwGSTeDsRIUKccm/4xvVjPYAcGZg==
X-Received: by 2002:adf:f50a:: with SMTP id q10mr35841128wro.271.1630483650151; 
 Wed, 01 Sep 2021 01:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
In-Reply-To: <20210901100324.3ce458f6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 09:06:41 +0100
Message-ID: <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ty13TE1aWV5

On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote:
>
> not directly related to the patch but while I was testing IORT testcase
> (https://github.com/imammedo/qemu acpi-tests)
> after rebase to 6.1, I get test failure due to change in MADT table vs
> expected blobs made in 6.0 time and it does look like ABI change
> (what is bad, it also happens to virt-6.0 machine type).
> Can ARM folks check if we didn't break something?

>  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
>  [02Dh 0045   1]                       Length : 18
>  [02Eh 0046   2]                     Reserved : 0000
>  [030h 0048   4]        Local GIC Hardware ID : 00000000
>  [034h 0052   8]                 Base Address : 0000000008000000
>  [03Ch 0060   4]               Interrupt Base : 00000000
> -[040h 0064   1]                      Version : 02
> +[040h 0064   1]                      Version : 03

This says the GIC changed from GICv2 to v3. What QEMU command line are
you using here ?

-- PMM
