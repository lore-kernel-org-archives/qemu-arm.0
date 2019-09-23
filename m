Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3002356wrp;
        Mon, 23 Sep 2019 11:51:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj3ebxjSepM1omISz/vQcWKVPc67/h0g/4yJoRmXMGpVi8tGMJtrm2eBoD9e4Pd7U9Cyxh
X-Received: by 2002:a37:bc82:: with SMTP id m124mr1463523qkf.231.1569264710819;
        Mon, 23 Sep 2019 11:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569264710; cv=none;
        d=google.com; s=arc-20160816;
        b=daL5+h04LD4QILUIZ/zi/dsiulKSVNvgshy2umNoio/J6ZyIoEFJTxB1u7ZlzkH8tS
         xDT3Ogr4tP2NE5MLXYGSGRHM3fMnbfTSOlA4jARQoXc3B19sCGfP3pOsyiwIEGryDChn
         LRkrL4ed6eOJiqx8eF2qEgnI1hy9s9R4R9zeCgg8gNgd1VfB6Z6KF79N5H99LKyP04Jp
         j+LCfsKvYOxYsRrcTCGQF8RSlGiFn2qyhXbN8kOPN6e1PZZyqvcz7gh7Sf8/WT/4mxyI
         kwWh+f8wjidYjFNuF8z3ndRmT64VAMzQu5CHNbBd7eshGKa6WrFH/SvBhS+0zAGxpsnP
         bCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GqwkVvOmHt2DVHbqSsswuXL+6h77PhH857oRgalni1o=;
        b=NcruyhJVpTy75SHsJN6YrQuMS5NOWEDJxrfO1/2FuV6BD6lBVMYrQkjtzgZ5kkK1Pc
         RdOUxFdQGScDu2fkB4imUL2veawZh4e577pxgIpMfziRgB/Xr9lj5vh+PtUenL8K9uU4
         RJ4D7uRMSooS2jhv/gRLlRps0D5IFMHjcHmynPgJYbhnak5DzMx6cc8jao823xLm276B
         ZT2WKFFuZ3pijZLBCaro+K+fqGzoi8E3XzzNTKePzhmzmHuH7GHQj7Oruv6j25TiRkkL
         tQ8Ffz3c6j0QOwlxcwh0/kFKDbauRCJG2UCUinDPDIv0xi/w4Qw6Bp2Pc+VHqGUe2ICR
         iIuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qeVtFzU6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f128si9105167qke.146.2019.09.23.11.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 11:51:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qeVtFzU6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCTR7-00035L-IF
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 14:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCTPx-00032o-F2
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCTPv-0002RU-KI
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:50:37 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37254)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCTPv-0002R6-Df
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:50:35 -0400
Received: by mail-ot1-x344.google.com with SMTP id k32so13094906otc.4
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqwkVvOmHt2DVHbqSsswuXL+6h77PhH857oRgalni1o=;
 b=qeVtFzU6eUYY2oolviIK22Mfy3UOF+QhmHXHVd/7vBFSLfeaohqUamfFA06r4RBnWS
 WlsIvtoU/W90D2Lw0xBNFIeB8fgROfgTd69sceMedPUFzGaUbGQhBLxtfSt6+VUWcDWJ
 TR4KluSyDkgbet9WaoKDkNZL4ZWxflzVe+5D24p3n4l5L5ILJKmeRWoRp0T67vhcqiD8
 52kcrFcVLaNETRkujMD3BSfLlcb91z8diwN6z0yVyYUOtVmKTXI7T3ofYSXOuM7lHW3y
 chMvtTINo40QS50o3OJlPtUciDgUr96lSCW95985TimBKs4shwQuU6jxMMHP0hq1H9Fn
 QUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqwkVvOmHt2DVHbqSsswuXL+6h77PhH857oRgalni1o=;
 b=PwAQlq21A9LAzo9T2IeS7CV7YUhtJ+uvawQurmwunShZm+NSSgzs5et9HU0d5C76iF
 a9KsvO2l+KMmOSteb/5CGYm0vcqSjuDVlMgBB+o0Xc9T6pl0rGLiba9f/+X5EDN+b6VN
 DL+O4vT3q/Lpn6hk4UCAM6uknsuh0NaB8GRxo/R+DybUwWUrjyUbIFtnJvEtc4pwnlBi
 4obfGOkfsC+8HWlDcWvF1/r913BUfQmwoCl6upumgOKfkSn8u2cZRPdbrORPSBWQeDVy
 aUmqxpX9eVm2n/GxX1tD9Pgzi9GefJLbBJYa5s4/1krvEntUhT59ukqbonWIhqyYMYBh
 PHtA==
X-Gm-Message-State: APjAAAU4IxH5kfzS3vR47NFn0dneXCBVtSoSOkZBF6xFsMRWO3nuFE/G
 cj0GT1nN9QTMV+lHAlCTFujjwInBIeBRUhno0+2zWw==
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr1031623otp.221.1569264634643; 
 Mon, 23 Sep 2019 11:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-4-thuth@redhat.com>
 <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
 <0389e9dc-7f78-5b27-4764-51f0bdef5bef@redhat.com>
 <CAFEAcA8XSQs=fw839O4+tTUqy-DpNh-jdHxQsfYQxm-nTbvH4Q@mail.gmail.com>
 <88bcb5b7-4f91-1cc2-39a1-bd919608737e@redhat.com>
In-Reply-To: <88bcb5b7-4f91-1cc2-39a1-bd919608737e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 19:50:23 +0100
Message-ID: <CAFEAcA_QAtK3GmyZoR7swNKwdxkXWZCzdK0G6Sk6OU_tQ9FV2A@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Move armv7m_nvic.c to hw/arm/ and always
 enable it for arm builds
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nn+HpU2MU990

On Mon, 23 Sep 2019 at 19:36, Thomas Huth <thuth@redhat.com> wrote:
>
> On 23/09/2019 20.27, Peter Maydell wrote:
> > On Mon, 23 Sep 2019 at 18:54, Thomas Huth <thuth@redhat.com> wrote:
> >> Ok, then what would you suggest to solve the problem that this file has
> >> always to be linked into the binary? I can't use "obj-y += ..." in
> >> hw/intc/Makefile.objs since that would mean that the file also gets
> >> compiled for non-Arm boards. Would you prefer a bunch of stubs instead
> >> that get used if CONFIG_ARM_V7M is not set?
> >
> > I thought obj-y was for only-this-target and obj-common-y was
> > for all-boards ?
>
> Well, obj-y is for the current target that gets compiled. But if you use
> it in a Makefile that gets used by all targets, the file gets compiled
> for each target individually.
>
> Just try to change "obj-$(CONFIG_ARM_V7M) += armv7m_nvic.o" into
> "obj-y += armv7m_nvic.o" in hw/int/Makefile.objs, and you'll see it break:
>
>   CC      alpha-softmmu/hw/intc/armv7m_nvic.o
> In file included from include/hw/intc/armv7m_nvic.h:13,
>                  from hw/intc/armv7m_nvic.c:19:
> target/arm/cpu.h:1416: error: "FPCR_DZE" redefined [-Werror]
>  #define FPCR_DZE    (1 << 9)    /* Divide by Zero exception trap enable */

Sure, so don't define CONFIG_ARM_V7M in a default-config for
a non-Arm architecture. Then you get the behaviour you want:
the file is compiled only for the arm targets.

This is exactly the same as for the GICv3's arm_gicv3_cpuif.c, which
is also protected by a CONFIG_ flag that's only set by the Arm
default-configs, because it needs to be compiled as a target-specific
file for arm and only arm.

thanks
-- PMM
