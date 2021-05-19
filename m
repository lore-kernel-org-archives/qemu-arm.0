Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1839583lfm;
        Wed, 19 May 2021 13:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCqWigFH1Jmg1uLV8cBtzXQR7mm5uGUZDUu1JTqugDqkxuPSxUSeDccBtupZNFhltPNqlo
X-Received: by 2002:a05:6602:2d8d:: with SMTP id k13mr1609888iow.121.1621456882565;
        Wed, 19 May 2021 13:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621456882; cv=none;
        d=google.com; s=arc-20160816;
        b=ps2Uc/rBqhjmBZHZeTOFmGohyTHjRvRfjYmL/IU7kVkJxOb13p7ZfGzbHS3gT37K0Z
         o4gPtnkgbdAmrQBs6AudEiIyZBd/zyDOS7j1KN+7iRlrCSE+NuhRp/W+29gPFNjzadHK
         Q4nTXYXuXaFn+4nk7a0B6jXMHv61x4HS4hsDICK0CSVWg3NSwBHxZ1CYcxq4fGSrlWAj
         43QC9sMmGudh5PSRH+4904DPZJpic6MhCuKBqPP2zRDbTuNwhOaEzqS6Xk+zdDMhYIMg
         m6ap4e0QfmqM0hPgRIZNqvaNAjipoFEM3pnLJcU4nxIh65uNgni/lKsU+h8gsI5luFAo
         PYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=NX8L2mgZZFtB20GajHqNmwUBgiQ+JBs1sStzbhoL4wc=;
        b=a7SJlfHHuQQU0eeQCnlbWtndwHEr4giZU8VlyrgDJiSW4UcuWx+mATAcM4oJUzLWy7
         lhJ07hW4oSSgU1UCsNWnQqwRZsl5Z2/D/tFarIyDk78taTEQ/7eMp8jqQLNJkfn6+g6l
         OK/IIS536tgog2Du4ugjqLTZxX89NlRIxy44qkufice/IDswD1hN4phViR1KHWup0NYE
         39Mz+k6jEtO+V18yF+mlEuZhlGeprkZ8HbuBy9D8zi9ij5qYqSq81GMbA3cbWYal6MRP
         7U2Ebyn8qL864T00Erg53QwW+m5uxNZsri0ra+/9YcNAWFndFRKjCAFOTqBvXl3mcqXL
         xnIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ouUojgvL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si353664iok.48.2021.05.19.13.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ouUojgvL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljT0L-0006fk-Se
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ljT0B-0006e5-Pm
 for qemu-arm@nongnu.org; Wed, 19 May 2021 16:41:11 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ljT05-0005oq-2L
 for qemu-arm@nongnu.org; Wed, 19 May 2021 16:41:11 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so5100475otg.9
 for <qemu-arm@nongnu.org>; Wed, 19 May 2021 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NX8L2mgZZFtB20GajHqNmwUBgiQ+JBs1sStzbhoL4wc=;
 b=ouUojgvLQqS51R+2vdR6Q8Qn5OwNeisnpun7yLvqvgHI64wiJ4p+gqfGUEzdfDZPu6
 TiRQETjxc0jKUhSLtXV4zURBO2xKeGnBW403lAXi8h0oUqljqeMy7gB3XDa5wamXYE70
 FQcdahR7tnl1tmYiQA7/6gUlTgVPKpYjNvvDnMoFBQ7ST0ARp5n2vJ0RWxBeZNhV3IH6
 DEUwzssYHlxlpssg33Hbq88WG656ry54Mw9HyYVzt5oN+wjRICCgSTsyaGP3C2Fw+8ql
 0Im77TD6SxgFpuN4tZZ2hUsPRO4tHEBd5APZA43Ywf8wuV5UNsSx/1jKqoaAeAJ1fZqZ
 wQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=NX8L2mgZZFtB20GajHqNmwUBgiQ+JBs1sStzbhoL4wc=;
 b=PZ6vjka592/HfsVAyHAez4YOFudanZkd/rtPF2rxN2D2HRC/UVfthOF0jEcyAxsUgA
 nR+0eWRoFdcTZxUcVnvTjO8yru6hIciV1Y2dUefvRgnXfEVCSsh5IdxROnWbJHCIQ6OJ
 Kz+M0rf+0RBs6ieMWvkZYO/3LkI4I7qEAbZS8nCS3h63FGm4WVR8rmElibOryTwyPTCx
 08LqKLpTfLGM6DGWhyDtrq86u2Kgy+RlyBr1T5C6xNC06Fh3ITABdCR32AHDxAWWMro1
 CSFx2OyU9EC48vWtSiy8gvTqUHjsq5L5JyUp+4angDMFJJ+vwCzIXISpq83FUFskzeEO
 4COg==
X-Gm-Message-State: AOAM533vAQDUwg4YQUNsU9WwTYI3/Bb5V33nf7NofugsjSXOUkrCNaUl
 xx6DrfGIg/LvHRNdN1JbyXQElw==
X-Received: by 2002:a05:6830:410d:: with SMTP id
 w13mr1085382ott.173.1621456862457; 
 Wed, 19 May 2021 13:41:02 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ecd2:e60e:d7a6:d643])
 by smtp.gmail.com with ESMTPSA id f3sm105569ooj.1.2021.05.19.13.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:41:01 -0700 (PDT)
Date: Wed, 19 May 2021 15:41:00 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v4 0/5] Add support for PMBus in QEMU
Message-ID: <20210519204100.GB11196@minyard.net>
References: <20210519165002.1195745-1-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519165002.1195745-1-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OwS7Mhn52J9r

On Wed, May 19, 2021 at 09:49:57AM -0700, Titus Rwantare wrote:
> Hello,
> 
> This patch series adds an interface to start supporting PMBus devices in QEMU.
> I’ve included two PMBus devices: MAX34451 and ADM1272.
> 

Ok, I've added this to my next tree.  I moved the files to the sensor
directory, too.

-corey

> PMBus is a variant of SMBus meant for digital management of power supplies.
> PMBus adds to the SMBus standard by defining a number of constants and commands
> used by compliant devices. The specification for PMBus can be found at:
> 
> https://pmbus.org/specification-archives/
> 
> Currently, the goal for these devices is to emulate basic functionality by
> reading and writing registers. Timing, and some logical operation is not
> implemented. This implementation supports nearly all available registers for
> PMBus including:
>    - Voltage inputs and outputs
>    - Current inputs and outputs
>    - Temperature sensors
> 
> Unimplimented registers get passed through to the device model, and device
> models can opt out of using the standard registers with flags. The included
> devices make use of these fields and illustrate how to interface with the pmbus
> class.
> 
> Datasheets for sensors:
> 
> https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf
> 
> Since v3:
> - added VMState descriptions. Adding PMBusPage info to the vmsd has proven to be tricky, it's a TODO for now.
> 
> Since v2:
> - bump for feedback
> - removed commented out code
> 
> Since v1:
> - addressed Joel's comments
> - split out tests into their own patches
> 
> Thanks for reviewing,
> 
> Titus Rwantare
> 
> Titus Rwantare (5):
>   hw/i2c: add support for PMBus
>   hw/misc: add ADM1272 device
>   tests/qtest: add tests for ADM1272 device model
>   hw/misc: add MAX34451 device
>   tests/qtest: add tests for MAX34451 device model
> 
>  include/hw/i2c/pmbus_device.h |  517 +++++++++++
>  hw/i2c/pmbus_device.c         | 1612 +++++++++++++++++++++++++++++++++
>  hw/misc/adm1272.c             |  544 +++++++++++
>  hw/misc/max34451.c            |  775 ++++++++++++++++
>  tests/qtest/adm1272-test.c    |  445 +++++++++
>  tests/qtest/max34451-test.c   |  336 +++++++
>  hw/arm/Kconfig                |    3 +
>  hw/i2c/Kconfig                |    4 +
>  hw/i2c/meson.build            |    1 +
>  hw/misc/Kconfig               |    8 +
>  hw/misc/meson.build           |    2 +
>  tests/qtest/meson.build       |    2 +
>  12 files changed, 4249 insertions(+)
>  create mode 100644 include/hw/i2c/pmbus_device.h
>  create mode 100644 hw/i2c/pmbus_device.c
>  create mode 100644 hw/misc/adm1272.c
>  create mode 100644 hw/misc/max34451.c
>  create mode 100644 tests/qtest/adm1272-test.c
>  create mode 100644 tests/qtest/max34451-test.c
> 
> -- 
> 2.31.1.751.gd2f1c929bd-goog
> 
