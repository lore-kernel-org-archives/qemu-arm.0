Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp648760njb;
        Thu, 22 Aug 2024 07:06:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxmPOKiEklav95geZrKr1lZInKY1AseIszsONDn4aEBU1cnhghVrUdHsXLWiLPNzuCcgmWdPuOasrezg==@linaro.org
X-Google-Smtp-Source: AGHT+IFu5RHzPyK9icqlRMg0TzGaSAZICsK9K3G+qR0oS+MNCG4vO23aMj9GCBRBAjhOzH8pG3jV
X-Received: by 2002:a05:6870:7a07:b0:260:fc49:3e96 with SMTP id 586e51a60fabf-273cff98fcbmr2052098fac.46.1724335610864;
        Thu, 22 Aug 2024 07:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724335610; cv=none;
        d=google.com; s=arc-20160816;
        b=nl4aU/D5tXfg/+ARRs6CKWZjfJZKT8CyuqFyJ8TObvEjeOzMVIEzBZRUteTsrqPYdy
         m6Yzh/bQzhpx1YVjsE5zk5aiJVnXxNyOGVbfUlKzGbqzpA24IwOZcCUGySF6cVLTHEVp
         wFAz/mkRWx1xULEDsdLejNRWVe3fh362L7hq0/WnPE4GGmWKjfIgSxcozNA8BLXzovLq
         K3+lSlqSG+KmjQHrPWsfY1bkMindUYu7s1ppkd1S+4kCW7vR/SJws9VSYdHbMrFIigw2
         VVhMTGrcaTlBkx3bM+t+RKKrSDPSgVe/mr+DxoxAR8rotRqhtj88FoN5HI5A4NqdV5Gw
         ccMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=5WuU7N6kTdeDYc3Ueq/WVoJTwZ9rengQJot1YtszAyU=;
        fh=Gz1jzATjvuwiKD1nR7oaFlKOA3awR8UM26Vuq2SMlQs=;
        b=uu+I6xrxAT9TmHhw9Mfb8GWHdCz6BP6kTHwPI8OabtQk/QtwQI3+4ALOp+mVG7siXE
         vh14ukFayokg0WFmmbMpMtMTPs9uuHwf7DWpWk15hXoHOmqg5VDetnL+0JYpXgxp37f1
         pMOpTYDAOzctm6J5RHrxZFKO8tXy6PvqkyppeiZfzlHYc/qDuHH+HGDrPgcqD1qOIEqu
         qmAy3Dz2e8N0hrtYTKFRlDIz8qGX7XYtj3KT8iTARbNQCYIR/NhCpo6j5Hw/VfzzK9p6
         QWe71CWk3hpChwKZ7s8AyDJKOPUNazu8WFmkC8S3VrPdbqkaGtqAqcQs0ZYU28gAaGYG
         yh8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p7W6Q/Ny";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4fd0822881fsi265024e0c.47.2024.08.22.07.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 07:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p7W6Q/Ny";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh8SU-0003fr-S3; Thu, 22 Aug 2024 10:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sh8SS-0003eZ-UX
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 10:06:37 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sh8SR-0004ou-CN
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 10:06:36 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so153611966b.0
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724335591; x=1724940391; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5WuU7N6kTdeDYc3Ueq/WVoJTwZ9rengQJot1YtszAyU=;
 b=p7W6Q/Ny2UORuw2bY4bnyTsJ53GHZQKJ4hm/bFNtcyBOcbKVauVPPJTnKTjUh2SBXE
 tt9QCDvm/bco9qvFO36CHRBPzIIwkLUdVAGh0IJW3WRVed8qNiiWEKwKyM1PMEfqQScd
 eoTnwWM7KgIV+QNvFqMBK0SUmg4LAF0/zL5rcM9Bekeo9zt2r+MHcRfioKzaD5f/R/Xm
 lTOTS2qzoiM9pUNLE4O8ijt6x+UFKzI89AvKqiIzApsHuGwVilYMcv95zaUZRafMehK5
 ss9m3qt6biucgkd0ASjye2EEy0ij/RXNHkucG9ZzIt9SRFnHtmjGZzaF/UvcZZv17hPn
 G6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724335591; x=1724940391;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5WuU7N6kTdeDYc3Ueq/WVoJTwZ9rengQJot1YtszAyU=;
 b=Mr0uj7Dva6RaE/4JGBdkBuXecT2vWhbpdQwRN+Dmg9htFxbe8tyi0kp1k8SdpJoA3A
 RewlkT6/F5/tiJ1xh9cbG55y1/CoKh6fqaKy9qFVjE87J07iqlX69/f7C5rPQfAFFWmq
 idDObEdboHiE+tNgAj4BWqpE57mRu0s+4vxFXROQo3tRwUaKd44L40rQSwaOOeSLghWK
 UGL9yX5aX49lpJi2C/d20HmO+JRnHwrrTq35+qkBRD0dPmBVzjdt7xBIRGWhKST1HZ5/
 zkkWnQZBdkXFGoM2iOtphalgdZYObRXUb7OyipTIBXXPuL488uwe97GjQlC+qyz6gcut
 cqjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHGN1SVfiJDSWR67Tr8AcMTUol6eHx2Yn5smZdOFIST09RMQSZJo+HtPnibbVDxRwPiwOyaP7bfg==@nongnu.org
X-Gm-Message-State: AOJu0Ywg+LxIOG2tMIVX/+MPk+Im+r+cBpHVFkNM/BKe4cvM2ZOW1UDG
 gGtsxv6J9aIlZOevssgrR4kBIGO7Hd04LOxFOprDSvkOSi7ZYbnQmwTTISz4tPY=
X-Received: by 2002:a17:906:f596:b0:a7a:c7f3:580d with SMTP id
 a640c23a62f3a-a868a912650mr290515866b.25.1724335590455; 
 Thu, 22 Aug 2024 07:06:30 -0700 (PDT)
Received: from [192.168.200.25] (83.25.211.12.ipv4.supernova.orange.pl.
 [83.25.211.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f220ccbsm125683266b.36.2024.08.22.07.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 07:06:29 -0700 (PDT)
Message-ID: <d8c744cf-0da1-42fc-92cc-f8bec8ca00e1@linaro.org>
Date: Thu, 22 Aug 2024 16:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240822114146.86838-1-philmd@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20240822114146.86838-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1ZDbc8jP3ZR4

On 22.08.2024 13:41, Philippe Mathieu-Daudé wrote:
>   # Timeouts for individual tests that can be slow e.g. with debugging enabled
>   test_timeouts = {
> +  'aarch64_sbsaref' : 180,

What kind of machine is able to run those tests in 180s? I bumped them 
to 2400s and got timeout (Macbook with M1 Pro).

"make check-avocado" (with some AVOCADO_* vars to limit list of tests) 
shown me which test is run and pass/fail for each.

"make check-functional-aarch64 V=1" shows me "1/4 
qemu:func-thorough+func-aarch64-thorough+thorough / 
func-aarch64-aarch64_sbsaref" and timeouts without information which 
tests pass, which fail.

Maybe for QEMU project this is a progress. For me it is moving tests 
from working ones to "sorry, timeout, find out why" ones.
