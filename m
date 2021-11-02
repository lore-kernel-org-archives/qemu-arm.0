Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3193785lfv;
        Tue, 2 Nov 2021 03:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBZCRUoSqg5WU7bST+iUvgUKTEfEotQOiexD26F3UrzodroHvnrjBNfVOXmXtF6XDCrNxu
X-Received: by 2002:aca:3b02:: with SMTP id i2mr4068273oia.85.1635847426353;
        Tue, 02 Nov 2021 03:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635847426; cv=none;
        d=google.com; s=arc-20160816;
        b=mpFkHf1t0+dMjoC4ThFJbJLBm+TbgNPsmzp4Us+QoWuCSvd4YVvOEdb30JvM3X/e5b
         oDXg6r48DXK58GYXGC3zKssJYnBp/kgnPfD/CHwIuZ15hEHz8IK3IXVWbYsStO7PXNCq
         haacKmR7xcirtRUwtBfLtBiqz67+0HiLXYpQyKDK7bN6csNoCAshkYIKWWorcmhFMYzY
         hifryUuWpLeP4BiCWENY5FfPfl/bOHsj3fQQT1k7wnYpwOfFtouVdbzcNAtLCipeqq//
         /fvOQ0qCoVAGH/xT1aY+qmGnSZyrRddDfKUplYYhoxi2Vc0yIhkVXRQSg8fJSBvR3vGq
         dOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=H3rgNfkRORT9RVV7KgvRugFcAPq1l0XVhDNjnInePpg=;
        b=hQ6PcX/BOydqzs5IQtZARGIlnAdcQsgl607kbqjuqBu98A6cUQi2uCsLodJkmH5mrF
         uvwp6pbPPijX3aQRMBzPVzorIugv7NQ83oYC0eHiyi6sz8G0qlxrqNKkynxN1+eJe61W
         Jk6+cfUCO06a5lGwZawmyGoZMNEg4//ldh3L1n3bENIJoPcqUI8+X/p5rYH1QCvBwNmp
         aVCkVJGtUQRV0KL1b8AbYN7bThvcTAvP8OmY57n/plcWW6/7RHph4FzDphLbkVtigv9S
         2ub5Mo1o61nKQ7D0BmjTTeX2JPUYGGNQPNaIFjQifvuKvaR0m9dyzaHLoMtAFMIX6Pef
         NBoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZVvS+LxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si10376361oop.32.2021.11.02.03.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 03:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZVvS+LxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhqdt-0004E4-KY
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 06:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqdQ-0003Su-Tx
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 06:03:16 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:41726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqdN-0007dA-5U
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 06:03:16 -0400
Received: by mail-qt1-x829.google.com with SMTP id v4so3888540qtw.8
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 03:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H3rgNfkRORT9RVV7KgvRugFcAPq1l0XVhDNjnInePpg=;
 b=ZVvS+LxU4vI0Lh9Yb0odhYFl3Se6XvKvEi4Bx64hBxAmqGRrPI0XPx1KqaQkPqdp5s
 Otm14KQOODOKprcpAuJdUWJxLbOWdkDkiQ3Sp8XxZNzUvk/WTgnYP06A5EMWPLNYdh4s
 fN+GTTKYGZPjiDZyKZKLVV0vpI+tLAlUVMbEZyx4Oi4/JjnW/hAZrvL3HGAuHxi6YtCl
 Wp2FiAJVZlZ06pFLnYzRoC+ScZBaIFQP+7kno33jjphbj3hYIzDOW8Q/UkT1NJ1+n4I/
 q6+Mi8UUvUUVD+Cf+rAL6QYA2bNdjPfFdDO+j4IJ9Pl5nJDEkOPMrzNsOplv0NSvZFn6
 bnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3rgNfkRORT9RVV7KgvRugFcAPq1l0XVhDNjnInePpg=;
 b=4uEwZXD5N6uPgq/5p38Dcuc2NSBBD2hzZ5rD+VOd416fFb81fCh/nGYZEkBQ48GgBE
 nf1hUqVi0mqubLy5GVX7GpBnqZhtReto1KYjZKI+Is5x27+R5a7gYTocYiXPpXL2wayP
 8ri6LnqESpKCv0WtV5kHrh69eza2MQ9BIwZE/Jt/pcjeKlRy3JHxmXhd373FIue3fPUo
 PKlgXndyXRKmmuC0+DEEuhuLFvQcWqEoK1Wiq86io7ysKOqt+K8rekkCcOSrh3WEefAj
 TXrzGiXbz2W+Fgpa0bk0xh1bxrCvsLGQL3bTWQVD5mWkiK7GbXPzGvJbnqP3Tq4srX5u
 jHWQ==
X-Gm-Message-State: AOAM531rP/TGJ5kkzmIeIRooL9Pq37mISjSyQlM4tj3fKrhnt4mDOB+w
 IaSPXILFUMkMs3a7kaSrxSdU6A==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr16015484qtp.414.1635847389519; 
 Tue, 02 Nov 2021 03:03:09 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id f10sm7483390qko.78.2021.11.02.03.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:03:09 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Hao Wu <wuhaotsh@google.com>
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
 <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
Date: Tue, 2 Nov 2021 06:03:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, KFTING@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKMba+4nOtmA

On 11/1/21 1:50 PM, Hao Wu wrote:
> Is this reply to a wrong thread? I thought it was applied a long time ago.

Probably.

r~

> 
> Thanks,
> 
> On Mon, Nov 1, 2021 at 10:33 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On Thu, 11 Mar 2021 at 13:11, Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>> wrote:
>      >
>      > This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
>      > device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
>      > the RPM of PWM fans.
>      >
>      > To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
>      > We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
>      > into the MFT module.
>      >
>      > The connection of PWM modules and fan modules are derived from their specific
>      > Linux device trees and coded in hw/arm/npcm7xx_boards.c.
>      >
>      > We amend the QTest for the PWM module to include verifying the reading from
>      > the Tachometer is correct.
>      >
>      > Changes since v1:
>      > - Split implementation of device and addition to board file to separate patches
>      > - Adapt to new Clock API and address conflicts
>      > - Use the new clock_ns_to_ticks API to calculate tachometer counts
>      >
>      > Hao Wu (5):
>      >   hw/misc: Add GPIOs for duty in NPCM7xx PWM
>      >   hw/misc: Add NPCM7XX MFT Module
>      >   hw/arm: Add MFT device to NPCM7xx Soc
>      >   hw/arm: Connect PWM fans in NPCM7XX boards
>      >   tests/qtest: Test PWM fan RPM using MFT in PWM test
>      >
>      >  docs/system/arm/nuvoton.rst    |   2 +-
>      >  hw/arm/npcm7xx.c               |  45 ++-
>      >  hw/arm/npcm7xx_boards.c        |  99 ++++++
>      >  hw/misc/meson.build            |   1 +
>      >  hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
>      >  hw/misc/npcm7xx_pwm.c          |   4 +
>      >  hw/misc/trace-events           |   8 +
>      >  include/hw/arm/npcm7xx.h       |  13 +-
>      >  include/hw/misc/npcm7xx_mft.h  |  70 +++++
>      >  include/hw/misc/npcm7xx_pwm.h  |   4 +-
>      >  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
>      >  11 files changed, 974 insertions(+), 17 deletions(-)
>      >  create mode 100644 hw/misc/npcm7xx_mft.c
>      >  create mode 100644 include/hw/misc/npcm7xx_mft.h
> 
>     Thanks, queued to target-arm.next.
> 
>     r~
> 

