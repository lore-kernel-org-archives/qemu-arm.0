Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp133851ejb;
        Tue, 5 Mar 2024 13:43:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5IBL5cvsVQ6gTGfKZAhe6bRlkT4G6pzyPajXh4U47mhkwWdzoF5rmII9AFFmz8aCRLlLUILXXYaii7qHRybG1BpmPnn+N
X-Google-Smtp-Source: AGHT+IF+zotOF6D0Oj8fowxI7TUSInbP2j5aG4T7yOvffLACo+WpRO8HU8MvM5a+bk6NfsW31M1a
X-Received: by 2002:a05:6122:4b18:b0:4d1:34a1:c896 with SMTP id fc24-20020a0561224b1800b004d134a1c896mr3136171vkb.8.1709674982736;
        Tue, 05 Mar 2024 13:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709674982; cv=none;
        d=google.com; s=arc-20160816;
        b=idKoMZbjLXqZJ9K1C0qkD/z7cHGjxcM8PZr6dFaZcEGheF6If7rqLpF1Q6plnyAgid
         /8wViJwgu6JZniOwa/k3L2qG9r6hEQx9gFLUkgmP4D8Yvkd+Gotmu7dISrBIEuNedKwZ
         +8gG36Xp6C8PdPvgVSrbhdkZUTsH8Hm6/kCavV2SySmgNkQR5YXwMGkz7Ccj94A5YhyU
         VkC7wWLx8KOKR19T8IuqCPBBAUhsH1f7c3hZt5hHQtEmEbKnEYMjHZ5Ni5jfkbAS0KT5
         5DUQEdZc7jo39jmfJl4gOs+G1OVZg5IwuXcDCef8Vhheky4nX/b1rIq3/GtdnsUNnuw7
         dYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Pq0Xsw5R07A+g7p1jetVznUTr7HaY1sC1RGtr3wuN00=;
        fh=Ez1Z30Y40KZRDcJOnT5cppgQogfThoGWoAKPWdbofHI=;
        b=yYAB9pal9K4hBFVAmVT7OLV//QwRwa/BpO9gB/5I7RD5ORtmpWrqaB+RJ/KCswi0aS
         fbxwhZbQoFg92eas6NfwTAjJDQ+a/6KhrIqb1W1n9bJh858QGBhPlDDEIPoziTMODeKn
         9BVxRoY9cVSc7RTbRPZKLPsaWfwh7urZ1dhSZs7aksYYrEo7kosZXA+EuziDXluLMako
         Kwv4Q5m0Xs17Cil9utwa7Chfo74Kgq0BSMzdFsz5gfRhmjvjXKIoV3gkkPT9urPuShYY
         qntVPV1pQDQDTks2u+2gQ1Rqb5id0Cx16/V5OXPkZfcHm7P3Ck3M7f35cxRqJqCYwbkJ
         cKGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nmjme4xm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020a05622a11c500b0042e7e1ffdd9si8634724qtk.676.2024.03.05.13.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nmjme4xm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhcYZ-0006lk-JN; Tue, 05 Mar 2024 16:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcYX-0006kI-Tx
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:42:38 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcYV-0004eE-Fz
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:42:37 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dccb2edc6dso51535035ad.3
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709674954; x=1710279754; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pq0Xsw5R07A+g7p1jetVznUTr7HaY1sC1RGtr3wuN00=;
 b=Nmjme4xmaYdmUTYB4OVakktFNZ9qAXoCSJEUr0szuu0ikDwJBzFjqAJdlD/HEGiWjL
 Y4m+oLbbJEtCgTjBU4Z6PpeaiL/xrea+b2I2cL+Q/3/tvkBjLHtFqRN2SyqNEkVLSrDT
 JHzTEj4DVyJeFnK/YOtgyNgXPm40RBtZQc9eY1c6JNBtdqDwwhlrnHD609BYgl0Dtbvi
 +Ti5Oqsss/f4/+Z+HvHeONMF3aGxtJICdme03Txn/KmevHX6bquInxe/u5FzoiSIJ0NQ
 S7n+DXDNTGxIIatuvfZOFk1ki3PRe9cBCgFT/JCqBfWix0R/0WYyBReV80XqXZejplxa
 CLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709674954; x=1710279754;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pq0Xsw5R07A+g7p1jetVznUTr7HaY1sC1RGtr3wuN00=;
 b=MUDlJj+EIdTnRFqduNqBwzlaCpwYur2xGM1MUQ368WudZ1w77L2QMXvSWbXsyX0iy2
 PbmbJckaa2xoJGXwNVGGfZCA5VVj6BzPM/0Uv0PoHWBeq+soF1GcrbUQKGI4NM9gUFI8
 nVgPDmhSLmUnHXf+C7INqcIkW1ATONNhN6C+schIoI5kP/gO2bQ0t2W4wZ0KCuUVbpKp
 cTJgn6folLklaa+eHp3y6o9eXz4kBaDn9tlCq7Q8mUjEbxoHIvV3wHq4kcVDZPkXX+t0
 NznIawMeowFZI5DPw3dr1qj1YnCTaRDvQMbREA4tKoh9sDO2kM3jJ9O39zc3ECJ4nyie
 kf5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUJdj/owrxcnNFCg8RWQ7p1lOVpOL4rxFoIsYGWXstyH9hi+PxH4XlWa7eXVJWPeZQcbzeuGi5xltO38Gwc2wOVr3h
X-Gm-Message-State: AOJu0YyI6QE6zPzUoB/TlK1PyxzAI+m4/yareOEohScHIkIX1mjywLNk
 Q5ATvRk3emaepN3nIhCrZry0qWzUXrZCNC0Mc+q6Nu+pmXxaeRAALqjq0m25K9Cprw5wi9YyRCF
 L
X-Received: by 2002:a17:903:192:b0:1db:4746:5fdd with SMTP id
 z18-20020a170903019200b001db47465fddmr4113864plg.43.1709674953981; 
 Tue, 05 Mar 2024 13:42:33 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 n4-20020a170902968400b001db8145a1a2sm11074557plp.274.2024.03.05.13.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:42:33 -0800 (PST)
Message-ID: <532d9634-ac02-4cb5-86a0-c09d723cd65b@linaro.org>
Date: Tue, 5 Mar 2024 11:42:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-9-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240305070331.2151131-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: pWk+jeMmUKrB

On 3/4/24 21:03, Jinjie Ruan via wrote:
> Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
> CPU_INTERRUPT_VNMI, both CPSR_I and ISR_IS must be set. With
> CPU_INTERRUPT_VFIQ and HCRX_EL2.VFNMI set, both CPSR_F and ISR_FS must be set.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v6:
> - Verify that HCR_EL2.VF is set before checking VFNMI.
> v4；
> - Also handle VNMI.
> v3:
> - CPU_INTERRUPT_NMI do not set FIQ, so remove it.
> - With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.
> ---
>   target/arm/cpu.h    |  2 ++
>   target/arm/helper.c | 14 ++++++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
