Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2031699wrp;
        Sat, 14 Sep 2019 07:35:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzElhXljfvoEv7Xt9MeMoCzELE4hZuTLl+fpQ2dJXqsP82rLArDzeWVwwbrp4CqZr+NC5ZT
X-Received: by 2002:a37:a612:: with SMTP id p18mr49753825qke.56.1568471738091;
        Sat, 14 Sep 2019 07:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568471738; cv=none;
        d=google.com; s=arc-20160816;
        b=TzgIvDb4FYVjKiFXJ69PMYQ2FLbtzHyH+Vj9e7yrzN+lp8N7ZBHuOa25wMsY6TCiQL
         nGQ69NFaMZbi94k2MgYZjm/39EMOMMhNPDZXN5XAVtXs0QhJz+fMry/grMixUgTDAvdR
         xauLBVs/l9DTCF7BLgbfIZNWEYAzZzwdidtDZSe3AnogtcjwgdwNXs8uquXUvCi+OzFB
         8+ciEglkDJ5jz7MvHzqfO+6vHpDaPf1m18YDYD2D7D+hRMXNZpUiX07/OcPAZWVXJnSn
         KAmVQSCZDH1cPejnVrp6h0BMg6EEID7w7rTJUzbyxVxCW8JLrEZ3DcSbf3Aa6QTcjVJj
         Kb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Qjovcp0EORLdy1p3lg5xNKNjUYKSKjhPj9FlGQD0+q0=;
        b=gl1XBzP8e0wIj25oWGz8t/wgMCkP27XjG54C3Dqq1hLhQqYBj2EB4Fq1xp3V26xz8A
         pGjbDzstprLDAgWOkaakhHhnaY6AgwzFuFo2dK9z/D8kAPM8EoWpUQ0GDaYohmP3UHMB
         UYL0ZvjmZrslqSEkgFtwssfVq1skleEuaTrVTSgCKiwooq83LIMIGYEt2H+hS0Z5mTUz
         LPoiEO9SMiRxwErT0FplhByPW1CNac53Rl3BB23b9uxY4LQuC43SbCD021WIB6LVxhZi
         EVu1AOEpVGDtFO/gHkf8TPXF1A0MoNzV2xdBz+O49YF2lo+nKJueypzaheg9JNiPZw46
         ZIxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mK0w7YN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si23922217qvh.67.2019.09.14.07.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Sep 2019 07:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mK0w7YN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i999F-0003ST-8d
	for alex.bennee@linaro.org; Sat, 14 Sep 2019 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i9994-0003SG-PM
 for qemu-arm@nongnu.org; Sat, 14 Sep 2019 10:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i9993-0000As-Eu
 for qemu-arm@nongnu.org; Sat, 14 Sep 2019 10:35:26 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:42513)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i9993-0000AL-6y
 for qemu-arm@nongnu.org; Sat, 14 Sep 2019 10:35:25 -0400
Received: by mail-ed1-x543.google.com with SMTP id y91so29404357ede.9
 for <qemu-arm@nongnu.org>; Sat, 14 Sep 2019 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qjovcp0EORLdy1p3lg5xNKNjUYKSKjhPj9FlGQD0+q0=;
 b=mK0w7YN2IKl4iKyC6PXqmsNqtu7WP5QLdo+fBdTCe7H1hCTfjJlq2xGch8/5e1KQ9g
 xoYj761tlOCUlnAY8s1KV832GGx7zCdbfGDul7fzZZ1Si3ueVnY8YJ35YY9Us/tJsCcM
 WckjVhC7hVj9/ifNM/3AX+QeThxbHws+iByzhqMopwurv6YGy9du5cEWhGyS+lT3aL4W
 mhD7uLfkjoZ45e+3aP+ARZlOBo2qazPN/i3+fxJKc9nAm0+mENwncdLxh2PL8vWR61GW
 6CvuhxdOvB9+IiaG+xbQsuYyuQmq1RvKTmAAA0x1abfN8hMr6pDY7ja+oXAFYojRrd68
 pcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qjovcp0EORLdy1p3lg5xNKNjUYKSKjhPj9FlGQD0+q0=;
 b=Sa8SCJqEu+PfEzBAkl2qbUdJLB0avqXm5x8pzmixbD5/+RVenk/FDRWmXxKIhebwhF
 fpWZB6gYkx+oodsWkkjieEj3Tsv/aMrR3kCOnCt8SfPVxPOVsPvdMCU96a3+1Hv2IBN3
 iTVh5yD6X6zvLytt04MLVadbfpcLuX7Qhnyy4JQyjS3qrTzZnu5k/T/Fo9CBvsMEMsEa
 hqiqhNkkB+a/kfUtanFxQCTfv23fPA3aQBgckIOSpMa+4DrbvvYsVHYeirBf2RG2jxUT
 TergZ/MzO+w6PwJk6Ddlt+fUYSXyMtZeVwo8XpjnrgGFMxqh14SsaszeLLPV77ZwG3nj
 +7pA==
X-Gm-Message-State: APjAAAWCn6+Tr9WP7KHl40O5nQ6Fq1cB42u1bknP9B2s12+EMz2DeLeN
 N7kKlpcn8hCDXxpnuBiZ0SCpKw==
X-Received: by 2002:a17:906:938c:: with SMTP id
 l12mr41352712ejx.309.1568471723274; 
 Sat, 14 Sep 2019 07:35:23 -0700 (PDT)
Received: from [192.168.44.107] ([185.81.138.18])
 by smtp.gmail.com with ESMTPSA id c1sm5874167edd.21.2019.09.14.07.35.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Sep 2019 07:35:22 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190913095639.25447-1-eric.auger@redhat.com>
 <20190913095639.25447-3-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7525d579-24e9-fe3f-e9d1-b221c88f4f3e@linaro.org>
Date: Sat, 14 Sep 2019 10:35:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913095639.25447-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 2/3] intc/arm_gic: Support IRQ
 injection for more than 256 vpus
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
X-TUID: 1ow9qX6kEf8y

On 9/13/19 5:56 AM, Eric Auger wrote:
> Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
> allow injection of interrupts along with vcpu ids larger than 255.
> Let's encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
> ABI when needed.
> 
> Given that we have two callsites that need to assemble
> the value for kvm_set_irq(), a new helper routine, kvm_arm_set_irq
> is introduced.
> 
> Without that patch qemu exits with "kvm_set_irq: Invalid argument"
> message.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
