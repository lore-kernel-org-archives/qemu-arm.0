Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4275587njd;
        Fri, 25 Apr 2025 03:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQs9gQvDP8GmD1Slp6PC0pYJXumDIBpIc8XCZ+brV86e2coGOBw1vF74c+E/bnvaQ8ushyu0BWVqEfHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGKxdp+z3phnPeha0jy+9Rwz0tgjCOYbMkStbu5AJ6HLyBj8IsBJYpYGCvDJN1d6J27vZbM
X-Received: by 2002:a05:622a:53c9:b0:476:aead:8029 with SMTP id d75a77b69052e-47ec31695c6mr83095261cf.7.1745577702376;
        Fri, 25 Apr 2025 03:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745577702; cv=none;
        d=google.com; s=arc-20240605;
        b=VPP1wqY8Ofh+PmEz5jCuCcv442mDewGafdbTnPGsHQvfacFQe9DR4au2Gq254WkrtS
         MmgYPH+TVx8PnFvptLHY4TTYwBvcuLRn9wuTpLiunWo51qIez8HoTGJRm0aSmvjsTNoh
         RPmSdcWm4gXB9jrcinQ+xIfO5582H5ZdETzEm5AUZM34rQCgSTVHKprQ/GAz4gLiz0sC
         j3/YbaS9wjdTvf9AjUorFlNc2g4fRz1h9kRjyWgQWLKGuZ1yNFsrCWYVEiA3G4QZOmJ2
         KsLuu8Sp3GB0RbsG1E76aUK0NTqC2ny7GfhGK+FdUhvDdL3FGM2s/aPNTy4sVBtlO3ss
         rlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=r02s/+95VEDbGM0QG+FBhPDlU1Rgutb22/lqHBanFq4=;
        fh=FWvPcfjRvPuwxZE+83q6+pfAxOvBuwSZaU3vlnZY91w=;
        b=f7PZZ3v3tcikuWwtwpcumnFrRi5aG/M87XT6pAQDM5bHiZCg3YdoFmP6698xAkQUtJ
         DrSLQVv2oBCNKD8fCFwXmbqXuOWbe93t2xQE7o2L5r4E3kOSWt/iI8tQbma6zFfY2gx3
         eJwmPtTjQNU7RR3WSDMz8gW03Woe3q8gOs34dFzSseC59w+L+25c15ZIyHmYTlI9K5uV
         UNu+en8jGcN5ugDHnajLLD3XupTOzt8CLM73lVMWXYW0EmgZKw+/RbxnG296dSHxp6Eq
         7sLuTdqHEIS3XBj8JcXSUsK4RtLercImTwei1q04GtipcQUYaQYnN0m6f4Fz6kg703t+
         rrVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVBAii3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9f1d4ea4si39407891cf.5.2025.04.25.03.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 03:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVBAii3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8GV0-0003qW-J4; Fri, 25 Apr 2025 06:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GUz-0003qF-02
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:41:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GUx-0000MI-Cm
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:41:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso2149777f8f.1
 for <qemu-arm@nongnu.org>; Fri, 25 Apr 2025 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745577694; x=1746182494; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r02s/+95VEDbGM0QG+FBhPDlU1Rgutb22/lqHBanFq4=;
 b=vVBAii3uZbdcFJxzx0Nk6WUcK8E1gJbRTEISfZONQjetUpZw+cG38RnoNkAd5kaRv4
 POwAldg+xqYetCmufZgJov3WFsbtfPvLjt95cK+VjdxTVt6yImxNn2D7Slu2rDQWuAPD
 F0mj8joVrh6Ji/s7ePL450GAZ2Pe9b/dNB9bpYYR/u7J7mJ7s7YXq7aZnyA/viye8Be5
 d1YIKFGflVprIIJDCB3EQgLIXBwcJnbbMLxbRi0kiPE/xEfGXKAs8htvQRce1II0cqur
 VQ3uRtIqBPVBU6ooxLC3kZlcNu1Iy8z9YK78k/+SH1v38p+NkEzR8z4/OIq1+BVYUiBT
 Q/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745577694; x=1746182494;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r02s/+95VEDbGM0QG+FBhPDlU1Rgutb22/lqHBanFq4=;
 b=Gqvk7W1u2BBpocIW5ww9VEuSADw6XXGfIH7gMYvNq2LJesqfz83VgVL8gPibZcsa5F
 qFsf0bdTi0ervFPp+y31/KPwBtf6mCwg4PdouECfh31gCDq+VdvSy5lkgPDucT7KknyX
 dGVBuZcG7tVV0dpPziDHu0uaaS/aFDu6C/Vuhq3JULTURL1peuIMw+iBOYkJyWS3HvoZ
 6tyS2eH7xjP/9ZVBstOCLjw46Tvmn4I437TYIWbLUjvFEXt+lLmuUboSYTNvqAERWlAd
 oWSbUJRfribLjnF0Ev09H322p8XI3ZzEJUjRkPKS9o75dHSolXfAzumYI1Fz9Yr7D8lJ
 mYMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkePf/5PH1AqUoHD8H+5fybQMl11fIRfPTRI/uO/EdkuFono38GB4TpNjq3F3O2Oa9ER0xzAhing==@nongnu.org
X-Gm-Message-State: AOJu0YxSgM2W27tJcxD6Evo+H3reZBdFFyZ9C19nEJqE5FdBxQlK9KXM
 JJ5t8gdDEVQLN93sbWyuizQuvnFe4Lb0evPddqUUu9sjz493TNAVaDIOt8LmsC8=
X-Gm-Gg: ASbGncs5cpddTkWssYR8KdUXsoAq8rIH6LbG4IhdH4vXkF/JDQwAYLRJD3KYrZAFZiw
 5R0X8JjsMQzZi0mqoRBnMGA9/L0ufdZhV7yIoPyfcYQd6fsZ52MGUsxd1h9w7k9Cnsq6sIFpAaj
 Lr3RGqldGPKKDCrjGkFpnLecl0xXWaDQ+f5im9HH8vqiuki3GuzWRh0guFZ54tXRmkcPeevoXcp
 teeYMN3E6BP9cS5ArsrDbIIaXwUGiH7cRPqwnF1qjoreLjpQc2weFuWnKkxnNS0KXW31uG0IR41
 z/+loOtFvns0r6RyGYElgHGYTxU++Ntner3sVip2v+gVWOzR9zt6ZeLRQT7n0XeDUF5IDk/8t+B
 P5vlrz10j
X-Received: by 2002:a5d:64cf:0:b0:391:9b2:f496 with SMTP id
 ffacd0b85a97d-3a06d66d1d7mr5223194f8f.16.1745577693836; 
 Fri, 25 Apr 2025 03:41:33 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46976sm1962209f8f.63.2025.04.25.03.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 03:41:33 -0700 (PDT)
Message-ID: <892aa3e0-d5ac-4501-8e93-56b35514f163@linaro.org>
Date: Fri, 25 Apr 2025 12:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 0/9] target/arm: Remove TYPE_AARCH64_CPU class
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: ece4b/58iWHO

On 17/3/25 15:28, Peter Maydell wrote:

> This patchseries removes TYPE_AARCH64_CPU so that all CPUs,
> both AArch32 and AArch64, directly inherit from TYPE_ARM_CPU.

> Peter Maydell (9):
>    core/cpu.h: gdb_arch_name string should not be freed
>    gdbstub: Allow gdb_core_xml_file to be set at runtime
>    target/arm: Handle AArch64 in TYPE_ARM_CPU gdb_arch_name
>    target/arm: Handle gdb_core_xml_file in TYPE_ARM_CPU
>    target/arm: Handle AArch64 gdb read/write regs in TYPE_ARM_CPU
>    target/arm: Present AArch64 gdbstub based on ARM_FEATURE_AARCH64
>    target/arm: Move aarch64 CPU property code to TYPE_ARM_CPU
>    target/arm/kvm: don't check TYPE_AARCH64_CPU
>    target/arm: Remove TYPE_AARCH64_CPU

Series queued, thanks!

