Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp357523njb;
        Fri, 26 Jul 2024 02:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW63lXCLL/YWzYfc8hxHJ6RvGWCRwS99rXYU1tm9DYk/0DIqiCfZUJXlBn/qJXIQxg28DiWyZc8pSsvQCCVxh6lrTsO1K4Y
X-Google-Smtp-Source: AGHT+IFIwyx3tyAFItGswacpwh37pEZm9y8DKP9D5QNvWtbaQai1cmIO2P9g7sy6VNGLCPK1vavj
X-Received: by 2002:ad4:5f0c:0:b0:6b7:a947:18ea with SMTP id 6a1803df08f44-6bb40821a87mr58315326d6.34.1721987742257;
        Fri, 26 Jul 2024 02:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721987742; cv=none;
        d=google.com; s=arc-20160816;
        b=ppj3rsOYkGPlGgENkfjSxtV3lNpCN0YfacOBJyZLOD5O9PoRTY2kmyi774J2oJtI6h
         Et4ZsADSYv7Pe5UjWiH/RBWn7hKfO6dz0ix+L9UBXuefLHY4GSrOOVoqiBcQQ3DbJXZ2
         RP0DFzneYkSp1rjulhqKQmq2LO3amxA0pj0nQQuTfbwdr+eSwtH5KZCZ/25Fvx5mfJq1
         sxvNRmEvEyJNADU9Ku1rK6vDOchiXLAQ1HuQaSI8+wlBSFXyyofCB0QjoDxgY5nh08sr
         r0EQbZAlQ0y5PX2didW8dNXLka+/lvfM/aUvau2RKycHaudM8j4actPkCZmaCM+6nwDI
         8fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9sCEyy59f7upvV3n0/ZOolh4kadwPOa0IUhUqb+XBac=;
        fh=3RM03hozst3aBnd+mLSwuXg8HXGuagtcy//S+0q6wY4=;
        b=bnUaQfMEt3SEh1OfHo0QUCEkRiMz6oX7EqM1Gw5fmvJDbpmwEMp8Bya9whZXiuAFGG
         RV4mMvuaiijMjwen/+8/DpMBR+GK+8QT8v29JNldX4aa5TfO6fkHemL5caojALYbUaah
         NiZgg/DHToylOJ7pAaqdjGOMoPErRsJLp+cQY+uTMy+mE8ZyUia5cyWwkkTvcDjXvF82
         WepMcU+8qsq7Q5jAWvcTMGME6c83Mb/OTri2Suj0xq/eIHS79FnGei2htEl3w7o2V6sy
         gIeEcnxTHiTIhqEdqGyeVOQAmHT6dlkLCQ7O5yDkcIHRmnj8kxhexaTdOpvCYdW21fhg
         ifXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S8IQQV/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3faa9af3si37706866d6.327.2024.07.26.02.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2024 02:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S8IQQV/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXHff-0001qs-IZ; Fri, 26 Jul 2024 05:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sXHfa-0001fB-Ot
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 05:55:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sXHfY-0005nP-V4
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 05:55:26 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so640706a12.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2024 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721987723; x=1722592523; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9sCEyy59f7upvV3n0/ZOolh4kadwPOa0IUhUqb+XBac=;
 b=S8IQQV/J2o+ivuTrnQL2q27pOipIlju367lv6AWy2ercRstM85hYf0yDJ43uQ5UTkw
 Bz2RJU5C2Ck/QDPd/YuXM5thf2Tm1Dk7u4vdEsoKe9RAwM0bF3pv3uEp8Wy0Hi/En3K1
 VC+dvvV+g0qNNKzc9cTWHyIezrahDD8gDaBv+MeihphVi6ZKDtXV6Iu66TrmBXNBwMYk
 dXYfvLh09oChe9HT8zpYk6MmpRJ1pTvVFlwjGdmId5G3+6UrqdNhTeDeyW5VXjop3Ij0
 YiCCXknhhSrzZwmcOGPtaiSo7eV+BBA/ZkTsV/IkyVHUoKzAHlQVWdgZ+OcvAbPlg7it
 h0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721987723; x=1722592523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9sCEyy59f7upvV3n0/ZOolh4kadwPOa0IUhUqb+XBac=;
 b=fmVNsgN7/bktpxB11ttshNPomFrT1C+UDFLgqdpnJyRk0+viwXT6do5vRBjIQuBCzf
 T9/cazKGyt5ygR9El3CNhB1fnXLL15ZxezDuCF6tdJ4+Y8fAXTX40hns2cLR0QnA1Ask
 ROqsgLytUnB7RXlqO/DvJWr5g++qKJEsEwjrr2U5fcypBKjS0Zv0hNBaIX//85e3GjHx
 xGAuqZKBF+t5CmKjKqrzUvmHeSu0M4QzswbwYoeXvGbcYEkhjHhzYvrjrxMXxNfWC6DJ
 6+68tMG0W6BUkUNFKZ7x9TxTYvZI/tihydTShk/r1tK1HPEK/1ZIUHUCnbuOHnazPSzn
 9FNA==
X-Gm-Message-State: AOJu0YytTLdLRJ9Q/xiYIxMDKUpObHRFam9F3NXX0e0a2rhgAiuLC9WZ
 8oYBqQbZ6uuPRbdIzQE5HkEzbIZ7l453DCUF5p5iYuWBL4R3cOkfyvw/KCtsuvLZlDIofYDx6Qe
 qCC+V+837XpIyuhhRE5MsKTjMtyX9l1LUAMyNpw==
X-Received: by 2002:a50:bb27:0:b0:57d:3df:ba2d with SMTP id
 4fb4d7f45d1cf-5ac573c7797mr4630714a12.2.1721987723226; Fri, 26 Jul 2024
 02:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAETw2qO29JpKUeqAEzWEu-hNyYG4sB2wfiQA1nD6a8TC9YX7iw@mail.gmail.com>
In-Reply-To: <CAETw2qO29JpKUeqAEzWEu-hNyYG4sB2wfiQA1nD6a8TC9YX7iw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2024 10:55:12 +0100
Message-ID: <CAFEAcA9POmXL+moGKJOzPm82wTw1eXmfZzHAqGF-uc=EUf8eHQ@mail.gmail.com>
Subject: Re: Running qemu-system-aarch64 with KVM support on a dual-booting
 android device
To: Jonas Noll <jonas.c.noll@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: QzUd4cocKDqM

On Fri, 26 Jul 2024 at 02:01, Jonas Noll <jonas.c.noll@gmail.com> wrote:
>
> Hello.
>
> I'm running into the following issue:
>>
>> $ ./run_vm_kvm.sh
>> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
>
> but sometimes this issue:
>>
>> $ ./run_vm_kvm.sh
>> qemu-system-aarch64: error creating in-kernel ITS: No such device
>
>
> I'm currently trying to run a windows 11 for arm VM on a Cosmo Communicator (an android phone that allows dual booting Debian Linux)
> It runs a helios p70 with cortex-a53 small cores and cortex-a73 big cores

You need to make sure you run QEMU in a way that it is constrained
to only run on one set of cores. KVM doesn't support running a
VM in a heterogeneous (big/little) setup (and unfortunately there's
no real way to diagnose this problem at startup).

thanks
-- PMM
