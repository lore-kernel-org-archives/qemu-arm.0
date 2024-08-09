Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp797794njc;
        Fri, 9 Aug 2024 02:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlfPlnfPBUECsOW2O6wHotlJu5dOTLlMqM6mMni/m6P3zsT+xgTMKp9vWCTw8BhD19oHQemMYwz8/mGj73AyFvcPFduSzp
X-Google-Smtp-Source: AGHT+IHebG3B4wtXkYTAdCQ/525mqQtt14F0Uzs7ClOaU/LV9sf+8T9Of13Zzjz1AxVWAvyvLgAC
X-Received: by 2002:a05:620a:46a8:b0:7a1:dff1:57ab with SMTP id af79cd13be357-7a4c17ff697mr98954685a.23.1723194064241;
        Fri, 09 Aug 2024 02:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723194064; cv=none;
        d=google.com; s=arc-20160816;
        b=DHqtzfkOye3PGZ/Ihe/QWsL6NPfR8BX6bFAgP5fPvl0FMbtX6R76X56hKGoamA/tJe
         CS0O3t48fj1d9dzbpl2pkjefgOPs29hQ/DbrDGrBlEBwtt2V4bCy8D62tvcCva7b3eZ0
         +VU6S9VKXJuHz2dInToryIROFMaGzbBFGYGEyJpqMnwaDNY5rfX+J4Pu3soevfuVlP9L
         dZv2ys1066VJT190p3kzErNNY+QcWycox2fByTKJD4kRi0jfaxMPDdxQ4glKgIkPaxFK
         6IR2t9/1cRqgxZf4E1gCRDaL6jkcUBUUHiCoVKdTUi349PtwN3f8dwcyERKfdLMWis86
         IHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NmYyzHtVTcDjPEdEVArsEoK0VXoPUGExEsdo4wzUW1I=;
        fh=EKGjO1Nn9TnJ+6ivFYW2x9gtg1S+b3UtvD9oICEXIjE=;
        b=jTdKugCDqnSZY/MyE4MEPWB4t2FHNm8Qr/4RUB+Mtejuul5X2/qtUVgVnEOS3Zc0D5
         Aimkw2N4nGLJcnBRvHNZsOhrow8Ouarl2Urqp4SC+2/Ol0yx0myGToSmruphFAGrqHoK
         BdZ+cufbUFqOcvUb/GYXvrjTTy8/BfaH35ZeBbdpB2VnIJ5tMiHosNa6UMRJp99VjmUU
         nl02oHfYZivhMoVnjYsiRKnVJNOf5M849fOINMbTBMImoid6UCsk8hFf69mkY5KNL0a7
         k5f/pzJr5KKHuNM/p3QQQedoYhel0/yi4AoRdlDvhtiQg7UuTuTgeGtYBi2RET+CWDD3
         dTzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJj0nN9I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a3788731besi628185285a.746.2024.08.09.02.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 02:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJj0nN9I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scLUC-00081Y-Rn; Fri, 09 Aug 2024 05:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scLUA-0007zr-1E
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 05:00:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scLU5-0004s7-Gw
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 05:00:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3685a564bafso818493f8f.3
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2024 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723194027; x=1723798827; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NmYyzHtVTcDjPEdEVArsEoK0VXoPUGExEsdo4wzUW1I=;
 b=iJj0nN9ILoM4E15+rR+QD6kmnyzoGrFq/rSLLQDO+ffquvH/qbwtxsXP+vxPv4Dq1w
 QpR7VOGoirtssSqs1GipagOKLXno5DeICPhY5mq5w//PHflMd8hS3OlM9usPsrgcIOBE
 aPAXOpVQBm4aJCgPfsJTfCyNpV4uOUyB5nIoTZCIPLQp8N0oQ+SeJehnSu0nxbRWC+5h
 mX00/1kbk6NycAOzj7pU9UdHFd0ip1r6noRsLQgpV1Tz+v7btuOaaKdFTUFfP+EtH9+2
 GQY07ye4szuZzPgC+xT06+mz4anZQkqa4BztinT5SKiO8AwII6tU7Mwcxj3OK1RCr2vB
 5xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723194027; x=1723798827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmYyzHtVTcDjPEdEVArsEoK0VXoPUGExEsdo4wzUW1I=;
 b=jFm603vLp0vA1BMmiraMA8UEAKYFiAoGVAPUK+FrUgLNcJrd0hzFEBKn79ofa1QFxC
 4aloesYFyvIUhNzAkCdE7JqzPLfBTaheRxBr1I8FyAl7bA6ZaLKsBD0z7ePB20JDnsJP
 Uw4tCnKwNBN6lYymG2lddw0y/egL1nKi+sw484/+SdrdbF5CQz1rD2RpMQJan1uyBbAJ
 WY6fVDl2hURugq3looL2/BGQmsxCngovC3T5t6Fs+zSOCuWfoGAu33kJtTqdu/pxaDVB
 khJKmht4arcFnv3kg+7+EpY2b/P7H2Acammws6nz4Danpaop9/yOUTgth8Dn2k4RNOuZ
 7xZA==
X-Gm-Message-State: AOJu0Yz8uIOYSp/+Ztj8640OOUzNS3HZR77BV6lUvaHakFOvv1wxY8Ol
 BArWFgPTYs3+AyfOh7Ft2sua6cV61CcnrgLjbfYKoiuJANG+L6A59MKQPC5ZjT1ce3DqhgBarFP
 kW3AEx0nr9UCcWrK99AyDOyPIBWkdiBv7r7f4KQ==
X-Received: by 2002:adf:cc88:0:b0:368:4edc:611e with SMTP id
 ffacd0b85a97d-36d5e7fd9e1mr676747f8f.14.1723194027412; Fri, 09 Aug 2024
 02:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240809035134.699830-1-gshan@redhat.com>
 <20240809035134.699830-4-gshan@redhat.com>
In-Reply-To: <20240809035134.699830-4-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2024 09:59:52 +0100
Message-ID: <CAFEAcA_bfBNFBeJ-cMS+KACaC6Sw2VAAdg_gb5xn6-TE5C-7nA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/virt: Use kvm_arch_get_default_type()
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: 1ZvdZqu0w4FZ

On Fri, 9 Aug 2024 at 04:52, Gavin Shan <gshan@redhat.com> wrote:
>
> kvm_arch_get_default_type() and kvm_arm_get_max_vm_ipa_size() are
> interchangeable since the type is equivalent to IPA size (bits)
> with one exception that IPA size (bits) is 40 when the type is zero.

Well, sort of, but they're conceptually different.

kvm_arch_get_default_type() is the API for "give me the value
I need to pass to kvm_ioctl(s, KVM_CREATE_VM, type)"; it's
architecture independent and different architectures do
different things. In the future Arm might need to do something
other than "just pass in the IPA size".

kvm_arm_get_max_vm_ipa_size() does exactly what it says on the
tin: it is an Arm specific function that returns the maximum
supported IPA size.

I would prefer not to conflate the two.

thanks
-- PMM
