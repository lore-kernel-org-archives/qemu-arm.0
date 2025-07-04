Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1296287dyc;
        Fri, 4 Jul 2025 08:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0/pt/M4drVQN09c5ovJU588Pj5qvbJeEpM/tn4okCpF9kYwtLlJ1GpiyGzMExkJaYm6hL6zxJ+twIqw==@linaro.org
X-Google-Smtp-Source: AGHT+IGWXxHzo4bSezLIR5OJM3/KzUj/GzKBcyoGu3kGLRdl9pwD4CYAz2XRm18Pm8/GQR1JcfAI
X-Received: by 2002:a05:6214:519b:b0:700:be60:9515 with SMTP id 6a1803df08f44-702c6d12b72mr41023256d6.9.1751643458956;
        Fri, 04 Jul 2025 08:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751643458; cv=none;
        d=google.com; s=arc-20240605;
        b=hwuUg4It+J0lMDRTiob9O9+PFbbGFz27xr8H613+JW5KuHRDK4AuSumbOei+itPpmA
         5nqDeudq8rRm7q/Im7m9K2ceAqIV2XeaIRPIEgNpJ3fRt3+gW5RVF6w9ra0PzTZOUBaX
         RV/H5xaooHseobPgo0CNPMEzuQLnoyHToatVsjFPgc0OdTPmHFN1RXgwuWDRbCC7oxwW
         Luw+A6iVXWUVf9mc1s05WsCbHyvYdNeEFXl8z/pGQtJfDs7Z8m6lB80mrSpWFH8mMA65
         WuJU6WIxhFhpfHfL2lhT7q5fXWGd4fqZ/4aDbWEc5ktvfVWOKEVWEmOIEGeC9ObW1xSJ
         XyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YD701x7IKyZ2ra7Y45S1Cdb1cWu0AX/3K+UUTjCG5WQ=;
        fh=zLvtcTKKIz5DGo6KzpTAPe4x+7LNCm1NxnrtbIaMFgo=;
        b=iQxkmm3inTo2n66Qwx07sAi22vb79GVTozbD1EPRBVBjWHM3IBCUWRmBbE93rjfy3B
         RMN9+DdScfAdJXDJkGkIcth6RPzeOLVf//QSlipsgjnODMR+IjtzjD4MMtSVyvkYo2Ri
         o8awlrBsgWBlBSkjr7Z29YfGLmg/5q3/hHKs9kyQmBW00a+Vuf2Y2fLI/FaUkEIvKII/
         6IdrVQ1SuYV8ASEMary6fuHJaqcrYfv6aofrQHVZeddGdnJIPciyyWvtJUSn6d9FogWr
         dK2kKyOCcjFr+dmssPRX3sIc6rxEFuWGcm6N3IU10uhzBeitl3xJ4SVqqBBmydx+zRiW
         yeNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CYFruR7z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d565d7si23040516d6.280.2025.07.04.08.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 08:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CYFruR7z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXiTk-0002od-1S; Fri, 04 Jul 2025 11:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiTi-0002oG-0n
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:37:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiTf-0006gi-V6
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:37:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so577212f8f.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751643446; x=1752248246; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YD701x7IKyZ2ra7Y45S1Cdb1cWu0AX/3K+UUTjCG5WQ=;
 b=CYFruR7zwTDqUuJKxGJCn+c+Sz5AWN3JICuMAERnKsPGbwPbEIoHza30f9OqGWpcQw
 DMYq7SMoAqd0zejnMonSTRXcCzKxoncZizdr1kZAlmPG/SPSMfksQ4mau9wPCMxsFMwJ
 dDcM8ICPEMI92EidyN01iWfG0+pipJzmltFk0xY6QC+28+aT28aVvBWH/33SGsu87DYV
 BCA8RVkW0AntjNwed64ZCSBE3MSWWn7d2q0fAKddWEF7Jf1TpUo+4X28T4c2Ims8HMXy
 sp4Oc4dlbi6cZkJ98NJGWdlsNqDFFuZHgRoZHr8DvArN1gXt+canYm5oTaXOBOlj5x9D
 +1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751643446; x=1752248246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YD701x7IKyZ2ra7Y45S1Cdb1cWu0AX/3K+UUTjCG5WQ=;
 b=XCNlwYCop7qVipOPclAXVWJucYCJ1o2rQ4jODtAggpdhLlt/JH3ZtRBbP9Z41UMHG1
 bsAyniiwsxjly3Z2uqCSjFT9Q4kFtPqnkIOdKOa314oLyR2az0IUmcTCgbLVOnA2WhMs
 3tYUKLgrytAgvsaawQIrhIYSUgFzSOKZHpYfjdLBfZ/QqHKTAONRwbvRX/TDHxptjoYH
 T3XSWlmE82l8h5e9pSt67Qmd5L19MUdoHLp7N1qAInpX4z+ImR1HW2aF+KPar4HBi683
 J4qsZLbxVs3oTj0q0FgW8UNgd87S4iz91IrcsgRFgP28fUD5D9j4o/AiiDARf6mUaXxt
 U1gw==
X-Gm-Message-State: AOJu0YzXT2MMjzp0oayC28SIiziFyrslil8J3OzotvbAyBx8oFFfOvSM
 VTJyZYiMDkc1nLqfH6n2GHlcgGtDpTfVnMcOq/EpGHSrX5mAilTS3Z6BzSahRlRzf+E=
X-Gm-Gg: ASbGncsbX4K+kvX5LxE5cjZ9Fh+pNuHAG5M6aXTnkDImYOspeIfsba1cNRNttLqZ3Uf
 Ydh7y3hlr5iYiPN09VEq0N3ePJAths36YF/+3zpXoRh4W063rCR2X1CxhGFZzLg5fgTKxQ9e6Eh
 R2YE1FlLG8+ZMpnyQ7kTtCP207bBtFsl3GD0pd0ghwvQxIeSzc+m2jRchRO968BB8qa3W2ACvxe
 Uu89IJabvgGsGYgcCztH4gHgtxG0gq6TWxjWnufSbNMBmoCRJEB2VUBHLCMu6xr/Ob90wWg8FhX
 MWoCa92yhSLm1PbvjuXWpyYVD1dEtBsavgQ+0t3F2Ki3lbhso75M1Bm8WilJl5tqzrTDU2fY/Ru
 JoGrAnIfxhbgjPhMamtKgs9WveVx0QdVmEK3fZf92eucE9Q==
X-Received: by 2002:a05:6000:24c1:b0:3a4:f70d:8673 with SMTP id
 ffacd0b85a97d-3b497020775mr2555969f8f.25.1751643445786; 
 Fri, 04 Jul 2025 08:37:25 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a6fasm2693094f8f.81.2025.07.04.08.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:37:25 -0700 (PDT)
Message-ID: <23aef7fd-e780-4f73-9792-1bffa1ad40fe@linaro.org>
Date: Fri, 4 Jul 2025 17:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm/cpu: store id_afr0 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
 <20250704141927.38963-2-cohuck@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250704141927.38963-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: ra2U03Hn0vwb

On 4/7/25 16:19, Cornelia Huck wrote:
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/intc/armv7m_nvic.c        |  2 +-
>   target/arm/cpu-sysregs.h.inc |  1 +
>   target/arm/cpu.h             |  1 -
>   target/arm/cpu64.c           |  4 ++--
>   target/arm/helper.c          |  2 +-
>   target/arm/tcg/cpu-v7m.c     | 12 ++++++------
>   target/arm/tcg/cpu32.c       | 22 +++++++++++-----------
>   target/arm/tcg/cpu64.c       | 16 ++++++++--------
>   8 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

