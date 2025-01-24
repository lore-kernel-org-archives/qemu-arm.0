Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp955712njk;
        Fri, 24 Jan 2025 09:12:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtq7H9isMN5CPaGLO6wJp3DFgfVY/uKl/jcLSd5afYw5Csz38xfaRx8bYSsoIrN9ZoOwnFtqLo77r/SQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEn0hrftUiV1nyhX6LIhA1+bjm4P8R54r+HHxk38U8EKMcc8eF41+LDe9tx0/4u7jVPLteL
X-Received: by 2002:a05:6102:370a:b0:4af:de39:8daa with SMTP id ada2fe7eead31-4b690b7ca31mr23486967137.4.1737738721548;
        Fri, 24 Jan 2025 09:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738721; cv=none;
        d=google.com; s=arc-20240605;
        b=lu3dGP6ur/Q7yovBlyqSoou++ggw16To6cjMM/bdvUNB8YP1ZQcV3eslGW+6A3fLQc
         EZHcznnGK8x69ZjkjhO0XFSDoRIrT4RNoEN7ubnmTsBD2T24PZb31TnyR3+11hTGjbsY
         zpHUO9akKybU354NjYVS0X/4R5J+orwi1xoDfBZZAfFZ51ztqlhLb6wi0KtwmcAjfJxJ
         7uq9kgoNCwChIMNNOYVFTVjCC+auM54xZ6Y7bph16g/ZRbTVjn48VFf9uB4KWLUU+bkB
         msZBaITU/UXRXIl7gD+cg4DP9rDfVv2ybAZ2Sw+APgMkgj/afxDQs7iZ62yQWKhGGsH5
         /r9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I7mkmUrHBsGCWGsb6KT+pRga/zStRaevJnxH2qkyJKE=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=fqgD5HV4EAwVfnTJNZuKpYFuUTpoFf+Kml9YRRjh+BBk3NLu3k2jVDR+5Fc573Lzut
         3BTguq173KRRAr0w3UOhWtMBK0grbex12Ra1BhHxjWTYAzC9grcc/20jog3ykwbHGrH8
         Hak07a+ol1XiUWGYvS3KUiE27RgVGc8vFl4CmUBYtaayAfIBRXtVg28AjoAc9clR4Sk7
         Hp4XwZXOE+WoJxlDJ/tLToezs2Iv+5AZZYWGdX+Kl/oxySEgZT/n3sarWNTBqr0VvhgY
         NFP9ROD6ogHmYMB4b6ZMfwWXg74EYigDlML0MzatGpxsPFr11VusBWTT7FEgp1JpSaUI
         i4Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tcwY7ZyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099aac72si1162867137.353.2025.01.24.09.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:12:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tcwY7ZyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNDo-00079o-Ev; Fri, 24 Jan 2025 12:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNDl-0006zV-G2
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:11:53 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNDj-00067P-9h
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:11:53 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ee9a780de4so3297414a91.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738710; x=1738343510; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I7mkmUrHBsGCWGsb6KT+pRga/zStRaevJnxH2qkyJKE=;
 b=tcwY7ZySl5NQi+jHY1suUHFh66yYRSxviJQAFucaVKPIV4zUqlIyVXqaENNKyIdSA+
 EffxQELZh9ToPKFDsATGKnsQKNYZCnAfkgKHr24ukuKQff7QZwqvNivDzpHemrnofp9f
 Ep2OYl024XwFIugaudnqMFUFiMjtgbnVg4V9Y6L4u+/e8+zJ0iBFZlnvxkbjwxNFVHwE
 qEO2co+3rikiSX/ksMHE8aPYTgYgeNfYm5kt6jbvuDt8weSTVTjUToQVj4WqkkhzQ41f
 7VsLKELBukZB0dolhJLE6qKyLKHCTPhEF0iehYLuCETyY1QE6x045yPcJHbZnkL83/Wi
 inaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738710; x=1738343510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7mkmUrHBsGCWGsb6KT+pRga/zStRaevJnxH2qkyJKE=;
 b=SXngEQbht3FpzNNqNu4xSdoLl3AXZjK4a56pdqrz9l5GmSZfEEWnhGglBffjkehqo4
 IwuANsWbORDeeiFjW9U8QRb0MJvFArYN5yCpRq05dNAosHPzhAQuZckvF5GMpyBBVgOh
 nkWsQuiRO4T21/a/921SXJ7ee5r8NTIktP2gGXn5pWrsByg0SM8MUGykmApjxc4OfPAk
 KTQsij6uWQyb6smeLrlMTnWZb3oC1Xu2yvSB4/a/9vW2UnyNuqMmo53CwVU3zCnqiebp
 DngzwnZocGNTD85TVan5dVp+bEr21obN0crUZ3AiEuECqMRt5n9Rz8WfPytqYHzarWbQ
 Y99A==
X-Gm-Message-State: AOJu0Yy4laf81CQJvdv4g+4OXYVpP68olAHXKoo0baZdVwKBOf9RD47S
 ItjhTZl4HV+ZDjgCiwoDzc21M9Udst3XX6EPCR+bN8QV51mW+R3tb/P+ZuUY7Jk=
X-Gm-Gg: ASbGnctkZ9SG8fpXpB4KhuA58r5r0owf+9a1BsGOlEa3S6z7G8gyKCrEcfOT09CC87t
 a7KLbiGSHU6aHEhqTZSGsyAWqbQsM8MEjTWyHGUclLYWV0rbp+VhVj7TM+kOpcGfKGHIO2WHYx/
 osYP6YYbYXskgZvfms0XyKq8JyQhr7rSd/5mIbzwU4EXC6U4PiEY3OCzPn/DUHw8qac2F1EnL1Z
 gNaTt4eP5ofKmxvqJdBNpa2HFhFcYf6KXCmFchs4UcV94ofpdQCOLG8m9vF/ctVE/IuQ74rGBEU
 GoJKoXwDBt/wqbQeB8WjfbM3
X-Received: by 2002:a05:6a00:1c9f:b0:728:e2cc:bfd6 with SMTP id
 d2e1a72fcca58-72dafa68bc6mr47930632b3a.18.1737738709919; 
 Fri, 24 Jan 2025 09:11:49 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a69fcbfsm2118061b3a.30.2025.01.24.09.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:11:49 -0800 (PST)
Message-ID: <90e45c23-75b9-4838-876d-3a2169b41c3c@linaro.org>
Date: Fri, 24 Jan 2025 09:11:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/28] target/microblaze: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-17-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: JTMO13fSppST

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/microblaze/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
