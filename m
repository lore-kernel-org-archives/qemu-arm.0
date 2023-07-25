Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2703048ejb;
        Tue, 25 Jul 2023 08:42:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnKsKFbVdixpEBLfhhMoTnMZ7m20pLeCjNSi+6vfdymml4CQd0wK1qMZrNLaOKWJNspBlz
X-Received: by 2002:a67:ee17:0:b0:445:13e:d8ec with SMTP id f23-20020a67ee17000000b00445013ed8ecmr5181708vsp.3.1690299776957;
        Tue, 25 Jul 2023 08:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690299776; cv=none;
        d=google.com; s=arc-20160816;
        b=Dt2NW9wd8mrWYeVOqRxnkY6ge9l+DSQxq2F2zwJeXvzDDmZGqBD4JsGuxYh6GQ9c2d
         LM8BTF3Wgo8PmsrwekAea5cm47qcCoc1eDnJm+wethbqvbM3PamR7QeTLH2TJGisUytE
         59sKDxtRNfkOSEYGNJTa9DGs5Kmk9nmY4+D5cIoTDQ+vtEpC8YEsoWjadzOa5xw0yram
         fs0BLsuXBNCpa10rdETEwVz1Wq9Pc7YyPsZdexpgTXRZNusLVcv9ROo/p+dPQYoWJy/W
         EPtfcRAJq6xOgwNmGjWk4YMNLG7LPHgey4Euh8FTZamJopUZdGnUqncOn1v/fRlUMzyo
         ogNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JrsDSH3aa9zj39XkrfZJulmZDM/g584Ea/mbl7e6McQ=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=WCbvNq1nvB+QfuUZnOjm1X8UIaOm8D92b4CzCZaT3IhS+WtQQMFo5twovAl5LltpKx
         0nwvvNTaDskL5SlpK2TPFxV8VrFTGI5ycuGxBokE3z7516StXk1oygukpwBNXd8xVhzD
         GK4urC5yq9yWdV9/OOv+WkTHL2ji5z6evGSDmPCklQdlGfiBoJKsLMxmwTW+ZOjyE/69
         poMqSLpa5Y/DQGH6RCOs3RX5VTUuIQPEnWtxmgdL7rtt7zShz1VrJNDHNPEyxFOOf+Vt
         Qh9r4lwkrIw+Xnq9cR+En8Z37g5JO6cjw0lvG5U3q600BceJIMW4+olzBs25mndiMKL4
         f5VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/1EBNUa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a0cf20b000000b00630173e598dsi178161qvk.362.2023.07.25.08.42.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 08:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/1EBNUa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOKBJ-0002VT-DQ; Tue, 25 Jul 2023 11:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOKBH-0002TA-GS
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 11:42:35 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOKBF-0002U5-71
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 11:42:35 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0bb9500aso614450e87.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690299751; x=1690904551;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JrsDSH3aa9zj39XkrfZJulmZDM/g584Ea/mbl7e6McQ=;
 b=l/1EBNUalcmC3NBzEj0oYWAmU2/ExxAow91Yoob0u6o9PfmV9j+j0r/w+ZD1TEd25J
 c38vJxMnMJGF/0I5gvlnmVNFkI0RAWZAcF/Hrq9LQjXyD/8IvKVkFNRXL15tO2+zOnnx
 hCXag8fwZrwPd7Ltxg+voh/xSdnXj7erzrkLfHQZWzogRaGS02zXjXT+72Ml0s2fwTYB
 08e0jFOMsH2vqOs6YMu+gTpVpyVEW4uNJiFvYWJDdPxSi82ixAg7HZ9LrHP7RZsFZTS/
 bSQeX2yBtGe0CIQkgxaXA4CqSzTRXIFVCJC8dmi1Nz9zPj7aQB6r48Q7/QuWxSV8MqJS
 FEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690299751; x=1690904551;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JrsDSH3aa9zj39XkrfZJulmZDM/g584Ea/mbl7e6McQ=;
 b=Ql2uUnyO1NLzBWKJwtSmYhGubtOqdO3CvuPCpuu2Pid1yZmC/S5o3b1jCWk8DH0nvf
 NgU2LgfkngPdW74G45GwMJUNWvIiqWvYX0563MS40tTguIxNC4SWgIQ4Hwlf8IC/Jigx
 lKCKbrP52weSEBsKWHcr4slwPObkv56Z13gwPWRpZXlfEdrpk/vci4aVaxk5hHRczpTL
 VXFzxtRQwp2vKYvYnksaDiH64LbsNXQu4k76gnCgrfq+V6eOdNvkEruiNcRVls7Kd1s4
 GnyKjc06U9t4dKPB16IZCvxG7X2W59v94xZZ6ZnzUOcl97GyiEWHew08xFn8zQsWn2FB
 J9Bg==
X-Gm-Message-State: ABy/qLaFGchxNzAeJrPoux7EsT8P3EpNSx84cZ++qnqyxrObNKpO6Z8C
 cRi11jVvuvpS3tjNmtecTAPIEehMg+6vPbh6Gqxl6BKvZlVT6xpN
X-Received: by 2002:a05:6512:10ca:b0:4f1:3d7d:409e with SMTP id
 k10-20020a05651210ca00b004f13d7d409emr8727427lfg.0.1690299751201; Tue, 25 Jul
 2023 08:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
In-Reply-To: <20230724174335.2150499-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jul 2023 16:42:20 +0100
Message-ID: <CAFEAcA86jv21exu_XSBmpF5VpbTPJAfO+zuc+eVio=EYTC6fvA@mail.gmail.com>
Subject: Re: [PATCH for-8.2 0/3] arm: Use correct number of MPU regions on
 mps2-tz boards
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: cV8O623Rkr5G

On Mon, 24 Jul 2023 at 18:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchseries resolves issue
> https://gitlab.com/qemu-project/qemu/-/issues/1772
> which is a report that we don't implement the correct number of MPU
> regions on our MPS2/MPS3 boards.  Ideally guest software ought not to
> care since (a) it can find out the number of regions by looking at
> the MPU_TYPE register and (b) if it wanted 8 MPU regions it can just
> ignore the 8 extra ones.  However, Zephyr at least seems both to
> hardcode this and to care.
>
> Patch 1 cleans up a bug in target/arm code that meant that we
> were accidentally not exposing the pmsav7-dregion on v8M CPUs.
>
> Patches 2 and 3 then define properties on the armv7m object
> and the ARMSSE SoC object, and have the mps2-tz.c board code
> set the properties appropriately to match the config as
> described for those FPGA images.
>
> I have not looked at whether we also get this wrong for the
> older (M3, M4, M7) boards in hw/arm/mps2.c.

I checked up on this, and for these cores the hardware
is not configurable -- they always have 8 MPU regions,
which is the way our models of them are set up. So these
boards (mps2-an385, -an386, -an500, -an511) are fine.

thanks
-- PMM
