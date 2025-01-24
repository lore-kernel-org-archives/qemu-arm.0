Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp942008njk;
        Fri, 24 Jan 2025 08:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9YtjErAtw/hopWo7xt0PiqQZGlqvUXng7OD0eNN3ACt+pOJyDi7yeseBPRQUYPeYycge9jH/6liKOgg==@linaro.org
X-Google-Smtp-Source: AGHT+IE491oT9wdhmiuINhCLv8EHvrqvD8wQDO0Sn3KnFvRVv+C3jCx5VC3n3K0BKNFf1w0fpsKs
X-Received: by 2002:a05:6102:5249:b0:4af:e5fd:77fc with SMTP id ada2fe7eead31-4b690b5ba88mr29253109137.3.1737737700885;
        Fri, 24 Jan 2025 08:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737700; cv=none;
        d=google.com; s=arc-20240605;
        b=LXfqkTvYXLZAmLMupebxCKL03opfekhwVb51W1du6xs0Fb9bHAobAXLyMOKzpuHR/T
         sHS8wITWvnrUtSQ/58uR3Br7kFRnUtw/Aw95iSwt65CXu/WUpVY42FvyaESZ2YjrlThK
         +t2qlzsC0lZDTcoFqG0kUzvoHPx0OiqRAzFKOM3kdbUrJc8+C5rgC64UjnYnXpsdpMkw
         4RF8mdyPbB8DRlQe8NJYeIprkP2pComxqtfNe/zf3ms8OXGCFj1y78L089vR/75IONLG
         477sfb7rmSUPiu3/O7GuTzaw+L9V8Ath/k78y5Hi0g5rBSMZOsjPvSDNuEhnG+bVSkh3
         Nmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5SrGboY5Zy7ffuvT4caufs3RR7JVCHcOQhNBCd5Ag/M=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=iqg67M1Pykodjy0Pk2jXYbbkTm9HuQsz8HlE708MaD8YZ3iqpFHaCGJeBlStpikRsj
         jpuRFBgApkD8ccJj1/wq3zxpdDppMVU5j6RxtnPN71O5iLEWyS936wLtIQJk+vE4KCFw
         FwFQvbY9y/HkbK1VTHvlq5OLtW9u76wE9+kA9yPla9l9sd2cV57v2qQQjbGnSHFwjhQq
         cDN30FMXcQ14dNG37tRtzCWaL/3LB5wJfWnBsplAP0g3kPRFuQalSjnnzalOm4uogzYE
         DjcG2MtlsOeiqFocUYBX+USIoiPmraRCkKpP3yDhXwpElNp7jRAFpcpHwmw7Os44xbdc
         Ln4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfFT3igk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709a2af18si870786137.648.2025.01.24.08.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfFT3igk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMvk-000543-IO; Fri, 24 Jan 2025 11:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMvM-0004Qc-6T
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:52:52 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMvJ-0002Ea-Bv
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:52:51 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21636268e43so50943375ad.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737568; x=1738342368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5SrGboY5Zy7ffuvT4caufs3RR7JVCHcOQhNBCd5Ag/M=;
 b=QfFT3igknQ5HqZoawASIS39iMND85LqSaGDKUQR+Pvw1f9J2wy6OtrMrkhCXhODEkd
 ztQjlHb6NW9BEnIzXIjvWNLB4iGvLnYujaFl2tsiy+SVfWNFS4F6l7rFAiMEpu1LUpBe
 WOYRiBvheB/zs47jJNTTFDkBNgAtZdsayFB6mMyFoT6R0GxnNGB2G6V4NMEDhqikmo2M
 BGFsbM5ZRoehoJimwUKA8+tZTRInjxMYRs6AY7pkqLZ0Ys7kVDnaie8DkVXhGYhXN6lK
 rFFjOJDTDeSxcW6IwgGUDmeBMaba+6y/3TKxM0QpeltOn7px68hcRMACnqIQoHeV4koT
 Sm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737568; x=1738342368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5SrGboY5Zy7ffuvT4caufs3RR7JVCHcOQhNBCd5Ag/M=;
 b=BDtqoneh0sIjyaKLkFvYYPzyoHVnepIqbzgjKaHBBvfle9qaG7oaAI5R+ScA3uT06m
 ZRa985kS9nvAVfyfNoKf6GzVE64s804m+DVg0u61inHg89LuLdsmZMVd9//GxRxjCK20
 JUQDRz9KtRuztm+IofuNQqPkQRxcZ8eFgXxywtGurvOdhB5BM/E+q8pzDeGspJc7rtuc
 EnQkhVNpNDJXfW/aVmdm5sMIxH8JLOFLhQczaqH9/tqIl2XfabNSPJGEpu4XHw5LKq41
 1/EwaaBuKfknSVe9LDm9fCcsZ7A9YC87c+4clwuii4b4caTXVdX0OtlVH27qOGvb9lLh
 /7Bw==
X-Gm-Message-State: AOJu0Yzdd0pu3U6S6xZcQDUa9/6LB0PJMb3p2szpWkA9vboKrGIkispL
 I4XcKNXSbGLtu55jYHnD9kUCO+ex4Xi+uWn3kogxFigvDeZrJme2QYZ8HA1t8rA=
X-Gm-Gg: ASbGnctzbUZ7rxmAddgOnuYcGuvw5t+Zzb4wfhTPZwmIV9I4FdJIvyf7g1/G6xzzYil
 XUs/MMym10KuZISiafidNeyp55+LU81g2D2ExQCgBYUP+OjScS2ZYzKncferBYVBdyFMejCa5pm
 IJt/kUjNEMgmHxNclZaHbPrDGkGFRkdtqlHfa4pdj14V1e7aQBI8lXooJUtzXob+cwCyS4I/AFQ
 VcF1qoRNDD0YpL3GNZ9RO5Bw4I765DWljmOKsGv3ovSXmprouBXugn3OD4G4RHOjGIk4WatUOPy
 Sq8pvbv+EKMOt8nFSJkGxFnP
X-Received: by 2002:a17:903:2290:b0:216:5e6e:68cb with SMTP id
 d9443c01a7336-21c3540d18cmr492087505ad.16.1737737567818; 
 Fri, 24 Jan 2025 08:52:47 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414cb13sm18525345ad.188.2025.01.24.08.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:52:47 -0800 (PST)
Message-ID: <6ca4531c-5f72-45d4-a3d7-ddc8fdad6964@linaro.org>
Date: Fri, 24 Jan 2025 08:52:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/28] cpus: Restrict cpu_has_work() to system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vBXCUmIAkU6T

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> This method is not used on user emulation, because there
> is always work to do there.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
