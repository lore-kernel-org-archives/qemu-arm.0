Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1255680ejb;
        Thu, 23 May 2024 11:47:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZomOP5qIns5BA1rb7pVe13R6ZJm4UWcLp8sJTSgp1P/TUXDrEs/3jPYC4uYoXDtdiihR1oQ2x6HXSr6oJIyeVt2KJOVEy
X-Google-Smtp-Source: AGHT+IFNU/PjJfbeRM6fDEftsv4UhUAiq8lpCgV1vD8TqhKH3Nz1HZDyS8JmQk3FFjLMWqP8yOvr
X-Received: by 2002:a25:ab4d:0:b0:df1:d021:e0b4 with SMTP id 3f1490d57ef6-df772258fcfmr37850276.45.1716490065855;
        Thu, 23 May 2024 11:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716490065; cv=none;
        d=google.com; s=arc-20160816;
        b=yg1FXB0ST8MoTY8xU53WW/ZH+FMXa3csu9Jg8/23WVMQ2+uBYWFawIZJVu8YkdMam9
         u92/u8rlMQK7SHCFv/S4A/QrWqkw0VWUkW4MkOMQOc/HJ+k2mibDukSDquUWFm5595uN
         Tghy7+FoxI5CCvY5iunsnJC1bxiBI+Mni+zh9F+LDeMuhYEqrP/fHqf2gJ6IMmiYgoTq
         nJhLtwIrjT7LlP4elY8mlCEhQpkEJF2CkHmxfdFoWpf1RWy4VGg03zkYJddXOojzd8X7
         K8ghnVmqyCSkiFEzfGYUDuBOFzpVOb4Ggcmxp5CPY88Gdb5w+5TRq+5NlCywSCjvHu/v
         Jt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=noqMMMOXkPmANYFZCV5EWRSHO24/boBHs6HDsbfjlbM=;
        fh=ch8nmgYOZMCnGss/qWH9gkVIJWzPbCeWF5xnnVR1W28=;
        b=BIe5WN6zSjRY49LYaHYbQUrmpRdj0tVNfv3TNHOg9PZBimSooHrJpmMhLv12g3DOBn
         FfegN/hweW4ICPA1n6q9EJmp1Ob6bvORIJJRzH1qocGhwn3xOZSJQZyZqV7y7KD+TqtY
         Z/LyvyvfGXsQvR8M5RMe5nkVRgvdx1GrzOzSA5Bqud5QfJqeDJVRLqW1Anx8vTkc0kqR
         invYR+CeZCA5o8AZXTYwjK1sMr8wVXF1yV8z0dx5gPjscPbOtjWB1gNRHSU0Q1UuSuVb
         pP6CmH1QXkLN7nPDm4BdS8lcsCocPHBmlU+kvjbuGbMbV2GUdCr5bbLOVrRsxMUmOZIn
         MXRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BJ1Z8yK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f2069bbsi174926266d6.160.2024.05.23.11.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 11:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BJ1Z8yK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sADTV-0001Oy-5H; Thu, 23 May 2024 14:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sADTP-0001Db-Hz
 for qemu-arm@nongnu.org; Thu, 23 May 2024 14:47:34 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sADTN-0008LO-66
 for qemu-arm@nongnu.org; Thu, 23 May 2024 14:47:31 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e73359b979so44408431fa.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 11:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716490047; x=1717094847; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=noqMMMOXkPmANYFZCV5EWRSHO24/boBHs6HDsbfjlbM=;
 b=BJ1Z8yK31ZjRSpvDS4GQEykehg9zRDacBH+ul4Jx3TZsr25zlYhz7pWKRxteFYbhFW
 GYp9RMrHxMsCpEh1eUMx8lohL/e78xOrAwx9E8CCNdkCnU2Ttmhedy8NT9YcrIWSMuBW
 bsJ0D1XFn7s2r21yFC7xwXE743uD+dbvsNqQbxnXC93yLvBytpkYyEQTbMOITfRZivnl
 puC2aEwjo4ffuKnFmtRx60wkrZnNKVO2fg7KMrmcBcpOb/+fE7yVP8Sz2OTk91S14sjM
 XahfJCQMCz9tT4etxth6mASw7uUjovbEoH+Vudke/iu/a3zip1itqNFKAguUKOhSx10e
 flyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716490047; x=1717094847;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=noqMMMOXkPmANYFZCV5EWRSHO24/boBHs6HDsbfjlbM=;
 b=JbIAVCl89OM/rTAcNXDqqURRmI1K5COUGNZ5IygmVa1LJ5N+caDQQkCV9MZrxht5y8
 9O49aELFOMlK29Ig4+YpnhfBOil51qjXIq7bU0YsrG/ymbKzvIWtjDZPE8A1SCpcSyGi
 rQWCqwp4MYd6TsrenPH5Hq/c0PGK4JU4pefW9oydt7/wN8P6t1lW1wLn6EDq31uga5DR
 6O6+XwxzXStLPmrID792lKJDRA1dM8oSDM4202ViLXyeaXHJJs/V88udW/j1v3pnbdeJ
 6b/xs+LSBAnSfQZbvtTTh9N1JXcizVGlWi6jYzGVP00JbO+sWUTrBKQxwExJ7l8wGdqx
 FeNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfbD5g9lM+CRWzowKhluJfM2HyUF+WlFiOzkrZCQ2WwgLWXSbDJM5168mC8s7yIDoLABxmRdDZ1bI2dBVms00yz62Y
X-Gm-Message-State: AOJu0YzCCPCoZAPpREALeoYjv6FKGNAqCDlqgNwFEnwOQ2Tbu6PYKJY1
 3Up+F1rfp6zFygK3IqE9xCPyhUdNod46beHArqluLYKeIrYCD9oEL9p+R59y3NU=
X-Received: by 2002:a2e:bc24:0:b0:2e1:a0d1:2c0 with SMTP id
 38308e7fff4ca-2e95b0bd79emr205501fa.28.1716490046812; 
 Thu, 23 May 2024 11:47:26 -0700 (PDT)
Received: from [192.168.200.106] (83.11.37.15.ipv4.supernova.orange.pl.
 [83.11.37.15]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578366176e9sm2858894a12.74.2024.05.23.11.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 11:47:26 -0700 (PDT)
Message-ID: <456d4233-a1b3-41fb-9fd9-e89a4fbb5c18@linaro.org>
Date: Thu, 23 May 2024 20:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Xiong Yining <xiongyining1480@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com
References: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
 <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: sHIIfTRAyyMi

W dniu 26.04.2024 o 09:35, Xiong Yining pisze:
> From: xiongyining1480<xiongyining1480@phytium.com.cn>
> 
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
> this topology can be passed to the firmware through DT cpu-map.
> 
> Signed-off-by: Xiong Yining<xiongyining1480@phytium.com.cn>
> tested-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>

I had some thinking about it recently. This patch exported whole 
/cpus/cpu-map/ tree which we then parse in TF-A to get amount of 
sockets/clusters/cores/threads.

Why not export them directly? Kind of:

         cpus {
                 topology {
                         threads = <0x01>;
                         cores = <0x04>;
                         clusters = <0x01>;
                         sockets = <0x01>;
                 };

It gives everything we need.

Had some thinking about exporting amount of cores per cluster (8 now, 
virt uses 16 which is architecture maximum now) in case we would use it 
in generation of PPTT in EDK2.
