Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4375274lfk;
        Mon, 7 Feb 2022 03:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIvcseuVJDRADOGvb+L2wQkLbAzCyO3EnRqmAB2gN+vw/7mSbjqv8JCVplEtApcWt7tO//
X-Received: by 2002:a25:c644:: with SMTP id k65mr7288731ybf.288.1644232838207;
        Mon, 07 Feb 2022 03:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644232838; cv=none;
        d=google.com; s=arc-20160816;
        b=zAZd1KWSwLhj7ZfsKlPuvapr4gnd/jz35ndlL8f81pz0AOHQUEdvyN50WSYCaOzIUw
         NNKhK/f9W9lnpxJrVj7qtbbO/WSN79y6NLYyFDRprFLdircuiB3/tdyXabDYM6J9gdNV
         +V4hEFMOG6W9W6MwM9ZN4l+gXAXE35ElPZviCaaL+dT8NG7OoX3iZ6lTH0VedouND1b7
         GmNCkKhO5LOMkf84hRG1gjrcpmwHHaj7QS+vK0AAGGOBtMdP7RX014/0MUHwOVCE676D
         EH3zfl2ULGCUly4HNX+1SzM1LC5oCfgW3cpcRwzfTUr6bOrsnbYgqtAtCEqDOLw6DSDE
         87CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQw0Xnv3KqNRTOC8fxYn+UtfG9G/pQjpaX2HwPyFdB8=;
        b=WEckwfCB1Skr5/AKaHLTBDnf6kGk9hx5P+6+pfFe2+6FL1475PGbKZ4ByOrDd4HBNK
         cH6BJrlRodlHPknOfdF86VTl87XkU3Bhqbg/xgq9eMWriocKxcwx6IpmTkjKrhg+VC8b
         UIMm9+3ZktDZE+7aufU7lD+79I4otnsx/THWM+3gnHwjXjtUNuDXLna60plIdUyiFHSW
         G2LfOjQRONVIG9Pxh57YHuzcvCOCE8CETZm+MWikOxQztNK4FhOilX0ZsiB/Zgbe6LWf
         GT9TyBViaf+EellQV2qpD4jF9mzun4h3XZcamkqMgAdWnGTyrBu/8aQdkDketO/NS3VV
         +XXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V3ZRoKkp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f84si6995199ywa.171.2022.02.07.03.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 03:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V3ZRoKkp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH24T-0006Tv-KZ
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 06:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH23y-0006Sj-B8
 for qemu-arm@nongnu.org; Mon, 07 Feb 2022 06:20:06 -0500
Received: from [2a00:1450:4864:20::42e] (port=39665
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH23w-0007ey-D5
 for qemu-arm@nongnu.org; Mon, 07 Feb 2022 06:20:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u23so315326wru.6
 for <qemu-arm@nongnu.org>; Mon, 07 Feb 2022 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQw0Xnv3KqNRTOC8fxYn+UtfG9G/pQjpaX2HwPyFdB8=;
 b=V3ZRoKkp2oZXnGw/mP7lZCJW9sNth9PYqaVW0uqyUeDjs4AfS5W6Q/Slv248RD48tH
 rxrcwi6UWElSzaIb0UrU42DJOcNk/iQzl+4bEErgKnZBABEKc/CmsdlPR6Zps3XRsftM
 E6lymTMzBkORF+LI9UTlyWl262EVy9Xki7T/ng5wMwCEZKZoCcoR+AhlMm6DsNawwPuO
 VcM/Xp02q4ZPxeTLzTBkp8SSPJ4k70YarhpB0xv8XIcRzZ1togKcyECXeam04CK63tWp
 lj5mbafo09p3ZLW/sYYkO1eIxsHdOiqnl+RsEcoTwPSr/u+XqKCDrtkm1Gv/OF7wppc9
 9imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQw0Xnv3KqNRTOC8fxYn+UtfG9G/pQjpaX2HwPyFdB8=;
 b=jpMomm6HEC2Q2E/jTTFE5X9Z/uUwbB6KGkgJzyRhB6vRngtjRTHuZxuUvV/3hsOIWg
 fkJ2RQgb9lO8NJHX8vFY+WE13ysZmvIZS+LWFG+QDSp0v57Yhp8htEEtEJ/yhZAmndvl
 Wgsnk+cN78e9D4xlSpzQXBBiwuL+3VIJ3E4WrL4R33eOWjDKqUMxstH8g2EhCGtZD8X5
 agk75biv7e5w0CXLmMlViNfqh9O4JumbQ0g5ONRpIzEkJ7KKGGh4aHxEPzx4F+mslJSQ
 yu4nWHUP2QU8WQBvqpoDsusHaDgdGWFesg0YqVDC/h0IfdPpG5h1sBPZZDP25ypsFwXy
 98/A==
X-Gm-Message-State: AOAM53335Y/7+8RrC59I+qmCTTahrAhmNAtiuM7NiW+/VvSFQDm8Qz1D
 hfVRN4yCzo9R5/aDCzanHrnMzsToWWsIfTt/pKOYbHwofXo=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr9857956wry.319.1644232802677; 
 Mon, 07 Feb 2022 03:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 11:19:51 +0000
Message-ID: <CAFEAcA8vuDHjP8RxV=QqaR2Nhctbv+E1Xw1ETZYuO8Uc1JSB6g@mail.gmail.com>
Subject: Re: [PATCH 00/16] arm: Fix handling of unrecognized functions in PSCI
 emulation
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvOxu9o8VtwB

On Thu, 27 Jan 2022 at 15:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This series fixes our handling of PSCI calls where the function ID is
> not recognized. These are supposed to return an error value, but
> currently we instead emulate the SMC or HVC instruction to trap to the
> guest at EL3 or EL2. Particularly of note for code review:
>  * patches 4-9 include some "is this the right behaviour for
>    this hardware" questions for the maintainers of those boards
>  * patch 15 has a DTB API question, as well as being a change in
>    what we edit in a DTB we are passed by the user
>  * testing of the affected machines would be welcome

Thanks to everybody for their review, testing, and confirmation
of the behaviour of particular bits of hardware.

I'm going to apply this to target-arm.next, with patches 5 (allwinner)
and 6 (xilinx) updated to remove the TODO comments, since we've
confirmed that the don't-start-secondaries behaviour is right for
that hardware.

-- PMM
