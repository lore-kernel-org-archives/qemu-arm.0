Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp509795ejb;
        Thu, 14 Sep 2023 06:16:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFi3G7OFC4o/yagpJ/Gwze/hnVMf1IxqZrUxrlCmR5C8zl4bjVqashRhJJT3McTPOl39km
X-Received: by 2002:a05:620a:410b:b0:76c:9884:4dce with SMTP id j11-20020a05620a410b00b0076c98844dcemr5864526qko.63.1694697402623;
        Thu, 14 Sep 2023 06:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694697402; cv=none;
        d=google.com; s=arc-20160816;
        b=0BpLIX9VFmZXbr+FSd2yqJzzJ/MGuUazxZB+Y+2ee76KEjmVUlmXuwZYtOfDflRUNO
         BjDQtuE9pNoe/UYnIOfrJ+8x2giuJtoKlgH6T1oEdmP6k7iC8R8wzC3GNXaWrSSwDpGK
         Y14HPBFJXLDNxZOWBqu+9922+Yvg3SKfWPZXEV6NYkIo9X3+t4IFAcgBeC3Gnk17iuB/
         JvlypxaoKKhWYNhAQSqcCKTTRB9NyLyP5cgNuzng/I7JlB9yUH0lTkyTLPsJEQBN2stq
         vpi1Khf9AMgu58b2ZVFzF5wWg+12Pn6frKqIS4VcT5L1+si8eydbdqtWCnXFqJh0fia8
         FmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=rvg5/oqSKaJkI/BDusWToy5I7SmDAvtrYXFEZErW++g=;
        fh=llWcjV5SzGGozaqV9MvVPvb0YhcP9WYBYBE5vZeETKs=;
        b=MpyGRyWcxj8ExrlKNpDo39buMpxKvmt8KSJtzqg5t64v3uFKNjfQTjBjwC/LFOtR5v
         Hd2JuKPn7eGzXsJD21gAdKW5oaqyLAcxeCEFcAtCJveYIJqFUpNGCF7rNNZ78fbd1pAL
         GuT4u1paeR3VVqeTQFFuupEzMi4l/oRYHI7/12oQhh1NTj5yVrH2sIaSct3sycJbbt23
         C63uvY7HM+vepNo4ttLRlpeY70UuGdI+9sGigLhBJ6ty5lWFrY1zNAywNgXXgZKBX7tr
         BXeK38QOLCoMB9RnckiSMTvyAsVXaRHXbjTmzzZ2wguDQqC8NAhAYh0oepSTggqYHYnW
         /kWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONtyu94H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05620a408300b007679d734e15si895009qko.360.2023.09.14.06.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 06:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONtyu94H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgmCK-0000rf-WD; Thu, 14 Sep 2023 09:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qgmCJ-0000qr-5q
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 09:15:55 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qgmCH-0008V6-3D
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 09:15:54 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-502d9ce31cbso1600898e87.3
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694697351; x=1695302151; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rvg5/oqSKaJkI/BDusWToy5I7SmDAvtrYXFEZErW++g=;
 b=ONtyu94HwLfgzGGyd4G3vWPE6jnBW7M+0keSIx7NG6fnZu9p8qWAHynONs/Ds8kQ2T
 +nWW0NwISvN3W7K50g+xgyNax7XISk26CVGyvYvc80wxQaW2iBnThZwLOKbBXrv5QsWR
 h/WC8ODFfsCasb9E6rnjvheAgwdH1Bp0/WEPHInjCIyw01gdKCpyF9PCKXTgMASo6WRs
 LOqiyxp9ii79wSbYaAOfF9sSgz+QoXuT7trXC/NiCP7rUMn7y/2DU6ujmO2UTmN7xdOw
 mEPzJiL6t4dWU6kGlo6FMJaLurGGcSd9dM3OOtYMbzVCayOYs28oMrzHiHVVO3oLYGKD
 DQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694697351; x=1695302151;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rvg5/oqSKaJkI/BDusWToy5I7SmDAvtrYXFEZErW++g=;
 b=hRqcGTE5rfybWEf6uh6HC39KnLYPkkm8/SdsgePBGGcw+b7ZykA81zh8w8L5Fw/EpI
 ORKyqQ/m71kE5KtWWp2zYwPbVQwNXKO/fgeBkbGRpAzoxjR4Ld69mC/V+I+XuGGGh1Nk
 hNQqMVGoLzCIXA13WEGbexEZ8N2wA+45ocnm8+a79x3US2DA2jXVRqPfYffXDGVqIt7G
 7IYa3thYh95z3x1E2p5fFGHeb2vWlID8yEzO+PqUnvUvocdzyLIQa5Q6tOL/yFxrTeD2
 Hk1CwtiEYnVkB+PzPcIseDKUSkJiZL5O5Tpt4ahHLoldaMl3XgH3+ttytAy+yVnG5EPK
 Idmw==
X-Gm-Message-State: AOJu0Yzob7d7t+S5bqj4M/gYIttdDU+8OrNPIyv7edw0hRZojaAGgtEZ
 QM8LQQkZ0HHvLGazKjvd+mxAJg==
X-Received: by 2002:a19:2d52:0:b0:500:be7e:e84d with SMTP id
 t18-20020a192d52000000b00500be7ee84dmr3810806lft.61.1694697351067; 
 Thu, 14 Sep 2023 06:15:51 -0700 (PDT)
Received: from [192.168.200.206] (83.21.94.247.ipv4.supernova.orange.pl.
 [83.21.94.247]) by smtp.gmail.com with ESMTPSA id
 m25-20020a195219000000b004fe119b0105sm269684lfb.272.2023.09.14.06.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 06:15:50 -0700 (PDT)
Message-ID: <986148e3-2830-4333-bfd7-29de9fa2dab8@linaro.org>
Date: Thu, 14 Sep 2023 15:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Refactor PPI logic/definitions for virt/sbsa-ref
Content-Language: pl-PL, en-GB, en-HK
To: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230914120124.55410-1-quic_llindhol@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230914120124.55410-1-quic_llindhol@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: j1pphwJhc29s

W dniu 14.09.2023 o 14:01, Leif Lindholm pisze:
> While reviewing Marcin's patch this morning, cross referencing different
> specifications and looking at various places around the source code in
> order to convinced myself he really hadn't missed something out (the
> existing plumbing made it *so* clean to add), my brain broke slightly
> at keeping track of PPIs/INTIDs between the various sources.
> 
> Moreover, I found the PPI() macro in virt.h to be doing the exact
> opposite of what I would have expected it to (it converts a PPI to an
> INTID rather than the other way around).
> 
> So I refactored stuff so that:
> - PPIs defined by BSA are moved to a (new) common header.
> - The _IRQ definitions for those PPIs refer to the INTIDs.
> - sbsa-ref and virt both use these definitions.
> 
> This change does objectively add a bit more noise to the code, since it
> means more locations need to use the PPI macro than before, but it felt
> like a readability improvement to me.

I like how code looks after those changes. No more adding 16 to irq
numbers to fit them into BSA spec numbers is nice to have.

Will rebase my "non-secure EL2 virtual timer" patch on top of it.

> Not even compilation tested, just the least confusing way of asking
> whether the change could be accepted at all.

There are build warnings and final binary segfaults on start.

--------------------------------------------
[1799/2931] Compiling C object libqemu-aarch64-softmmu.fa.p/hw_arm_sbsa-ref.c.o
../hw/arm/sbsa-ref.c: In function ‘create_gic’:
../hw/arm/sbsa-ref.c:496:13: warning: assignment to ‘int’ from ‘qemu_irq’ {aka ‘struct IRQState *’} makes integer from pointer without a cast [-Wint-conversion]
   496 |         irq = qdev_get_gpio_in(sms->gic,
       |             ^
../hw/arm/sbsa-ref.c:499:37: warning: passing argument 4 of ‘qdev_connect_gpio_out_named’ makes pointer from integer without a cast [-Wint-conversion]
   499 |                                     irq);
       |                                     ^~~
       |                                     |
       |                                     int
In file included from /home/marcin/devel/linaro/sbsa-qemu/code/qemu/include/hw/core/cpu.h:23,
                  from ../target/arm/cpu-qom.h:23,
                  from ../target/arm/cpu.h:26,
                  from /home/marcin/devel/linaro/sbsa-qemu/code/qemu/include/sysemu/kvm.h:244,
                  from ../hw/arm/sbsa-ref.c:27:
/home/marcin/devel/linaro/sbsa-qemu/code/qemu/include/hw/qdev-core.h:699:43: note: expected ‘qemu_irq’ {aka ‘struct IRQState *’} but argument is of type ‘int’
   699 |                                  qemu_irq input_pin);
       |                                  ~~~~~~~~~^~~~~~~~~
../hw/arm/sbsa-ref.c:501:13: warning: assignment to ‘int’ from ‘qemu_irq’ {aka ‘struct IRQState *’} makes integer from pointer without a cast [-Wint-conversion]
   501 |         irq = qdev_get_gpio_in(sms->gic,
       |             ^
../hw/arm/sbsa-ref.c:503:65: warning: passing argument 4 of ‘qdev_connect_gpio_out_named’ makes pointer from integer without a cast [-Wint-conversion]
   503 |         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0, irq);
       |                                                                 ^~~
       |                                                                 |
       |                                                                 int
/home/marcin/devel/linaro/sbsa-qemu/code/qemu/include/hw/qdev-core.h:699:43: note: expected ‘qemu_irq’ {aka ‘struct IRQState *’} but argument is of type ‘int’
   699 |                                  qemu_irq input_pin);
       |                                  ~~~~~~~~~^~~~~~~~~
--------------------------------------------
