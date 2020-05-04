Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp267153lfb;
        Mon, 4 May 2020 02:57:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypJDa1zQmJ8yAcfBle8h5aUuiKQVXY64s4iakw7y1IlcUqoL9ZwnxZTHO7382qTNv3r8Z9I7
X-Received: by 2002:aed:2213:: with SMTP id n19mr16697922qtc.246.1588586257695;
        Mon, 04 May 2020 02:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588586257; cv=none;
        d=google.com; s=arc-20160816;
        b=Srh/EN1y6aZHfQ6HusCfAg12WmbWWSKp75AhfVsMQLSd8cdvvnAcddoNwP2MLKfthy
         oSLsd202p4EXPFb82FKroPmaJ0M/lTKZsQnoNeMk3avggEZZD5asmmpyt8JM6a20G/6w
         /GiUCLtyE12poCt7Ah63OFrVPxg8HXXP/PpQzqW7KrwO480689leF6Wi2bPwW/YJ4vGY
         IUxK17QopBjNN38ZLCaHvFcGekg5OzZ8xgOtCy/C7MES0w33Fc9sGku6N+Sn8c9anOj+
         nKg2eMCZ8gbhJUUDm5RmKvNrEb5EJav+Wp7F0q8RBfDaJbX7g0n/Vry8M3ZXg9kl28h/
         TyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7GPO9m+Xws7zd9Wbw5Vjgi7NBvbZy+zDZil+YAQUN8=;
        b=wGR5T40iRBn0bUsrjRqAY6YDCWczt2H3uCrXNWg4a+pzKMZ47GL8qDG8c/KuICdtWs
         72UCF5MbP6PUoXEjVJT9w6AEofJqtr5C69y/yU6e2bkSjLMToineK3Su6Im4jOLiFNK8
         8qqwfNqzJB2C6MIu9r3W/BV7nsN7YYau9vH4OO02rgouNej/QJPiGyK32olm0Tzn/xTk
         wtw3cVaDCah8dRJwXf0ybuN70iIB95tw0skhMVcuZThQP1++kd7kCr+m+NTEUP5JDN1a
         Gesrpd15gqRa4VBfK/YnwimKiurKA7kwFdLa12q0tKJ+HbhLAKTgPLE7sX3pGDRf1IXw
         si5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGfqypKO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 72si6103455qke.55.2020.05.04.02.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 02:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGfqypKO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVXqz-0003cg-6P
	for alex.bennee@linaro.org; Mon, 04 May 2020 05:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVXql-0003b8-8L
 for qemu-arm@nongnu.org; Mon, 04 May 2020 05:57:24 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVXqk-0004Xf-6s
 for qemu-arm@nongnu.org; Mon, 04 May 2020 05:57:22 -0400
Received: by mail-oi1-x242.google.com with SMTP id s202so6135640oih.3
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7GPO9m+Xws7zd9Wbw5Vjgi7NBvbZy+zDZil+YAQUN8=;
 b=CGfqypKO3lw7EhHUZAzjWPCJo7ZC6gRtfn/hP7Wp2q+S6olFmSTXlAIU42kCdRLAn6
 zipZRL1VZVB7UGsc1MhONPK/1+HeRf1vncxLoZhjZ2rPl6N9UT42iWFqBFECnooeUWwt
 8QqUgKf2y9mYuFJsU1fKVbVMP21rVv2rJj4MTDSKlSsZEKXTV5eTIDEzk0ggFaZcicPf
 wc4BtDCbft7W/cSI7w06l4b7xllhG3myIMw3pyxG8W5a7/C48ygMzJYwN9RYVu0j8u4B
 OEaTbIxQhhxhHm1wr1zgxh3Cpc1AIbFk9oxP+XInOPLZFJL0h3Wfz987OjQe1G8Yrnul
 6uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7GPO9m+Xws7zd9Wbw5Vjgi7NBvbZy+zDZil+YAQUN8=;
 b=pgmRTuaEKMxf7eLP9lTM+iwaLx58sFywvBgsRSfGnb43dpXJrTjtOHpCYBAAXp/w9m
 RgPE5vFoxs5k5NdKUNs87JHUNoiXgfgaE0SmLjvPUW3nYhwQCeOThbv8j6FZQMR+ITk9
 6/a6KP8y9cbQywP2UfrxUTx3YHVFQC6FKn36/dQmTBZMhhUV5TxkaTQa+L8F1ROTWsE6
 mYo6DpiMQi4qSk/19GhgzJ7wInyJpF6S0hc2aWixnsrcuKcaD/Bi+NhV8Q4ocz/zPulZ
 eYO2gtoiL5pBbt6QG82rc9ow8kEiNeXiJJ5hLcPsRFvg3xKvmmEEI5s8M07b3M/uF/Fs
 mp3w==
X-Gm-Message-State: AGi0PuYELyDBARVVAwxYeMJAf5Kwiw0s7ER+OWPY+hAeUwO4iSCLrIET
 YJCSBrEUjDWHBVdeRmH2r/MXjTrcPqoorxZxx34aKQ==
X-Received: by 2002:aca:4a45:: with SMTP id x66mr7721046oia.48.1588586240909; 
 Mon, 04 May 2020 02:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
 <20200504011252-mutt-send-email-mst@kernel.org>
 <CAFEAcA-nkbCZNj0dbVgcN4ajRVx-N0Yvy5OEFuRewJyRGWfjxg@mail.gmail.com>
 <20200504054547-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200504054547-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 10:57:09 +0100
Message-ID: <CAFEAcA86RCf7eWxGAaONjATBuR5qQ=eTpdf74U1ELUFnScYFtg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] ARM virt: Add NVDIMM support
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 prime.zeng@hisilicon.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: of8rn4bt67b+

On Mon, 4 May 2020 at 10:46, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, May 04, 2020 at 10:29:18AM +0100, Peter Maydell wrote:
> > I notice that checkpatch complains a lot about
> >
> > ERROR: Do not add expected files together with tests, follow
> > instructions in tests/qtest/bios-tables-test.c: both
> > tests/qtest/bios-tables-test-allowed-diff.h and
> > tests/qtest/bios-tables-test.c found
> >
> > Does that need fixing, or is the checkpatch test wrong?

> Hmm I don't see a patch in this series that changes both
> tests/qtest/bios-tables-test-allowed-diff.h and
> tests/qtest/bios-tables-test.c. Do you?

No, but that's not the pair of files that checkpatch is
complaining about. It warns about:

patch 1:
 tests/qtest/bios-tables-test-allowed-diff.h and hw/acpi/nvdimm.c

patch 2:
 tests/qtest/bios-tables-test-allowed-diff.h and hw/acpi/nvdimm.c
 tests/qtest/bios-tables-test-allowed-diff.h and hw/i386/acpi-build.c
 tests/qtest/bios-tables-test-allowed-diff.h and hw/i386/acpi-build.h
 tests/qtest/bios-tables-test-allowed-diff.h and hw/i386/pc_piix.c
 tests/qtest/bios-tables-test-allowed-diff.h and hw/i386/pc_q35.c
 tests/qtest/bios-tables-test-allowed-diff.h and include/hw/mem/nvdimm.h

patch 3:
 tests/qtest/bios-tables-test-allowed-diff.h and hw/arm/Kconfig
 tests/qtest/bios-tables-test-allowed-diff.h and hw/arm/virt-acpi-build.c
 tests/qtest/bios-tables-test-allowed-diff.h and hw/arm/virt.c
 tests/qtest/bios-tables-test-allowed-diff.h and hw/mem/Kconfig
 tests/qtest/bios-tables-test-allowed-diff.h and include/hw/arm/virt.h

etc, and the patches really do touch the pairs of files listed.
(It also seems to warn about each file combination multiple times.)

Are these false positives (if so, we should change the checkpatch test,
since it's clearly misfiring a lot) or problems with the patches?

thanks
-- PMM
