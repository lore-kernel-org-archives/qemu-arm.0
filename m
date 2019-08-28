Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp191585wrs;
        Tue, 27 Aug 2019 20:28:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ1KK1RWO1eLbaUu/B1z1ogFZk4UwMKATTMnsfwyqrwUCES8qMnfNvWemyOoCIFGW1iMHV
X-Received: by 2002:a05:6402:155a:: with SMTP id p26mr1894248edx.9.1566962935953;
        Tue, 27 Aug 2019 20:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566962935; cv=none;
        d=google.com; s=arc-20160816;
        b=kSE6Wl4iH2UMo73wrUYAiVFpDL6U/7bELwyTQidqtgJfF/VNkYl267lH2B86Vj+bJy
         nZL/1wjSyhWr1VMGTyi8Pb9GUWuArkV8PKlsAkyOnS6jgHtX+Bkpsr9U0dUTqyv7kNUT
         s0+PU/0wEPEei2MR6QOjMoyVX361CEy89riC6Kpku7My+9/hGFgWNjh6HBIzFgozlKNC
         X6CuTSChUoNkBbt+bw7qQUZCPM+pPUASrp/pDoB34BeW2i3XTGHp2HL29cL68PnFVV5C
         U/x73og2q28vQ5L13xmmkySwO+AivAw3b3JLphMOzU0MAxpsIUqlVFWWjF5Rf9qG0FMp
         Oogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FdCU00f2y7Ewb6ItbbiaIhm+41+QGTSrT/++y+BwtOU=;
        b=gdka53kmWi/BArxNuLEW2MvsLNbx9+BgKn6XTBTvzkGlrTSghYFeFm+Mep19PXAqSP
         FUo799j7iAasdpafWYbU/Y6GM1tA9R2beaVIqx1so5ZyCrncCR0/xJxh75PcO0bJYw+/
         bNjCm8oRNXpMm5W7amcybywfPtj1ZJVVOG86AjpHR5pR9eBlxsFQsrnmyBpNOHQZPlc+
         rIpePIlyPFkvsdanXGmrvJQSD1qtdYkwFW9azYR2dy+0QJaTM3CV2KZc0l7jS4zSkORG
         GYmDPYgAI6l6Nk20ARLDqc2aTaGls5vdGoNc7bHjUISkjg70A5lDtu62t8a81tRW0WGz
         eHDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDmNLhOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x29si509665edb.209.2019.08.27.20.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 20:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDmNLhOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2odi-0008D7-Ou
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 23:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2odX-0008Bx-Af
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 23:28:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2odW-0004Kn-6C
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 23:28:43 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2odV-0004KE-TK
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 23:28:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id m9so524884pls.8
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 20:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FdCU00f2y7Ewb6ItbbiaIhm+41+QGTSrT/++y+BwtOU=;
 b=CDmNLhOzLJ/wqz/WoWQlfyUGkfFz9FFnWp6S6WtgUzYZ295l6d5uU50ZMItsZIjUoX
 tHekblrpyPalZD/J5St+D/NBWizHp6D4fUWR5CRO2NG5LV7JadhBeh6PFSbFbh9hxfLz
 gyUdOENLetaz1uoMmMzQ1OWQ35QINRhq9660IIhoZskL6ExabgbPknoj0jIFGEUjhMn/
 OMx+33H3vQE4shVzXkaCNXvnOni5r4iVnod7CmOSI/rFN6WVkNaYQCCCFjsaZWSfgNEq
 bEZener9brrOHpCKc/NIcK/P2FB3Nd3ALczrhIe0v6cNvhJ5Kd+HR4SEwhD6BTIO6j7S
 SlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FdCU00f2y7Ewb6ItbbiaIhm+41+QGTSrT/++y+BwtOU=;
 b=IG9BiS1bltG8brRZ0HQTqVVZ3cTajh8puyZGqR0rcWj1iMUQgyoP//i1AdqDG/7aFk
 ehqm33NRsMckNCvpHJmrumR0Cih+zUflTLvAn1ldHeq1u7q9xdFiuRCCI3otHTvdhMv/
 AFPj1Zvi+lls5dCBpGrnIIn2UaWkuhy+mLD5OrclrQCjW99D6wvZtBvhkD/usjBrprz3
 cf9Iag3iAjZ+m/NVwAnS2QPqVcR+pk2lbv4bPMwCWwUSk1MhmoTQy6HGVYv74i5JSEAE
 J+/8vjaHLWsPIOEtP/Zg6FBVyIgJFdQ/OHAg/prRyOqLnHl/uEMc2fHNNoHE7XFHYnmK
 XyXQ==
X-Gm-Message-State: APjAAAW2dT8/WjaREhjXgGBXQi52FSTx43dY5i5YancruKneWiHvMYvc
 FfEJpr/mDO2012kbHEcFbmLLbA==
X-Received: by 2002:a17:902:748a:: with SMTP id
 h10mr1563662pll.31.1566962920596; 
 Tue, 27 Aug 2019 20:28:40 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 4sm852252pfe.76.2019.08.27.20.28.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 20:28:39 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7d012631-1fe3-c040-eaf7-87ba274657c5@linaro.org>
Date: Tue, 27 Aug 2019 20:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827160554.30995-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ry8PGddsAgmy

On 8/27/19 9:05 AM, Eric Auger wrote:
> +++ b/target/arm/kvm_arm.h
> @@ -233,6 +233,14 @@ bool kvm_arm_pmu_supported(CPUState *cs);
>   */
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
>  
> +/**
> + * kvm_arm_irq_line_layout_2 - Returns whether more than 256
> + * vcpus are supported by KVM_IRQ_LINE
> + *
> + * @ms: Machine state handle
> + */
> +bool kvm_arm_irq_line_layout_2(MachineState *ms);
> +
>  /**
>   * kvm_arm_sync_mpstate_to_kvm
>   * @cpu: ARMCPU
> @@ -280,6 +288,11 @@ static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>      return -ENOENT;
>  }
>  
> +static inline int kvm_arm_irq_line_layout_2(MachineState *ms)
> +{
> +    return -ENOENT;
> +}
> +

These signatures don't match.


r~
