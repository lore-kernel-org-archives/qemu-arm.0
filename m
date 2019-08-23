Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp825329wrs;
        Fri, 23 Aug 2019 10:05:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWIj1B/FS5PgUAqpyrDd8gBRfJ8+RoeSkH0HBg2AFiV8M/WvdY4dTxhyukBlnyZ2USVVvl
X-Received: by 2002:a37:9701:: with SMTP id z1mr5102424qkd.66.1566579920450;
        Fri, 23 Aug 2019 10:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566579920; cv=none;
        d=google.com; s=arc-20160816;
        b=Rj7eyJTr7YOgG5HsFCEtNvOfuSIlNf8k9YABJbjLFg1Gc3VRTddHBLosQ5A8+jLotB
         jSiMA3xtokGmXumHxCe93R0TixH9imvMyR8r0tB3B1KpfA10lauuf336QP/hHlMsS6f1
         jaDanBajZ0JF20L8aYG7bXZqsjbfmf3/2KDOaN0QwTigpPygwy6UL0nrWHuYO4jtl/Pn
         homypkX2x63NnWjHiBfaY+MyBN12CCbwks+UljANvh09NTPhEAf1Dkd07xNWttLUQa/j
         Fjc51d6VLYh5FOYE1qTx57dMNU29CPCi+2M1CqTPmV9T1bHNnNWtDJ4pNDXhaqnGf9uJ
         W1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FQ87yz3Iy6Wzj8Jj/rRfRc/tCoi10QfnBZxnhnK64u8=;
        b=WRi9HlvOjnca3lbIEPFkKaDmfxtaa0SGjzZd3tpCszTjA45Ari0aDRsSp2YyOQrxDd
         hxAnFnw3Q7PAV2TFPNz83tRyRdXDUURdrF10xW9LPTOEJIXy3ali9EXEuNsAqfCfJt/A
         9mw8OG/BWYsh9rNSrBJc2Fiv8//Gy6GjlRtDP3C4WUewhivJc73FYRGt7mAMqeUYjgl7
         F80uSlioYg5n5vXVBOUxeCuH6xShzma9pQU7DhKuKEPpRDCCl6BbT7UV6M60jP87SE4C
         ToEE16+b+n8HsayRFe+ezhD0e1m6A71FQjY5/NEh6rG1NtzyMgXKsxcjP/UW0WGw4nOs
         lJRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8rqsPmB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si2476718qvg.9.2019.08.23.10.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8rqsPmB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1D03-0006Pw-PZ
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CzV-0006PY-SO
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CzU-0000FZ-Ra
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:04:45 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1CzU-0000Dm-JU
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:04:44 -0400
Received: by mail-pf1-x442.google.com with SMTP id s11so901501pfe.6
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FQ87yz3Iy6Wzj8Jj/rRfRc/tCoi10QfnBZxnhnK64u8=;
 b=A8rqsPmBk5r50JnRSG1enIlR5JGM6MuG7QzOKPY9q5w0BgGCpbaYv3kULnLKdMU3Z0
 GL34miKn500W47JlstHqRb7FVYzmAqlXq0ZE2tsBL7DdHzoB3FKVIdHlmJoJJ/IeNIod
 Zt36ZY3clpLYLksAJVDbO6afKGbTM8DobZGpbuRGiLM0S1VBUpcThJInQdXkuoZMwasA
 ONvnatncl8H2ATL6TdhGWngCgDaK78yfhVHo/iMS7YXEFRj1ym0yJZUz43qBivM1auFj
 34yuJN7ooVfDu/rhQIJPk5AYvJGeqFL5397sJ4Z6BEngR/PfmV8Iv2Xdibc7SQO/i2mW
 BdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FQ87yz3Iy6Wzj8Jj/rRfRc/tCoi10QfnBZxnhnK64u8=;
 b=DD6kO9r1z0ErBok2bZFgWO7JZMgpTCN/ObsTK+NfrYdCrBNqrvnWEXklkN+llw0AVS
 +MLzwGVCYyAMOTDyCU3VF96zdrj3LiFY0P0LKLWqEUW4uHdOUtlcGfXtdbXZjzvWJoiy
 C0cItdw81ir8BhLfKvD8bnOePXMYx9VAZs4TgY0ggkGOvE0GzrI3iFdDdJl7/EzOCVhS
 2MBzZeSE8srw+hQ2OHwVNiGkQ2VpL2Z1/zK1r5G/49TycJBhR/0qnMwbwHQCVlcrrxqr
 HC2siBRBmiN5hH/RQz26qmfoKz0wHLcwtUEaxfIU0+XUYLwKnN/Ze0EzwdpnsvRR4Xm7
 PKHA==
X-Gm-Message-State: APjAAAWkUhwC/95GfEH4Ly2CeRaAxXSuvLdZkjfC7xsvm93YynN+AIWp
 ui+VCEpUBDu1FWiF2UONiB0EEw==
X-Received: by 2002:a17:90b:f13:: with SMTP id
 br19mr6267254pjb.124.1566579881656; 
 Fri, 23 Aug 2019 10:04:41 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 131sm2575198pge.37.2019.08.23.10.04.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:04:40 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <64061664-f79f-b074-8fec-fea24594d5df@linaro.org>
Date: Fri, 23 Aug 2019 10:04:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135811.13883-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] target/arm: Restrict
 pre-ARMv7 cpus to TCG
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yz2ytJA2WKzO

On 8/23/19 6:58 AM, Philippe Mathieu-Daudé wrote:
> @@ -2535,6 +2544,7 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
>      { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
> +#endif
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
>                               .class_init = arm_v7m_class_init },

Ifdef is misplaced.  This shouldn't even compile without CONFIG_TCG.

Also, m-profile shouldn't work with kvm either, so I think the endif should go
below cortex-m33.


r~
