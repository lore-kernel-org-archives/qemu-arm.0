Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp954184njk;
        Fri, 24 Jan 2025 09:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbtI2dkrw4dqJV8dVu3APobNBz8VhUi1RDisjKqHcwJErZ3WIhJZb+VxUmEWgA+OmxJCysH6plNPtQUA==@linaro.org
X-Google-Smtp-Source: AGHT+IG/DtocmuHveCwmAJ5uLDM3Aq2ND8NMN9y0oAlZZA+rR9wzNhQCyyrXOLCrp3hnFmPZbTGN
X-Received: by 2002:a05:6902:2b0e:b0:e47:f4e3:8802 with SMTP id 3f1490d57ef6-e57b1051e1bmr22109634276.12.1737738597780;
        Fri, 24 Jan 2025 09:09:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738597; cv=none;
        d=google.com; s=arc-20240605;
        b=ie3SRpLjSruyhOa1sZA5SKl0Akwr/Do9xlAr1elom58kQAoSAxYT0BlwUUo6PDh2ba
         QSYl8IKWZriQXb2Aks4+zz7NXBQS3/cY7GfCXXhPUXVVTp2u2SUVlg1pG80IiUZBNRCT
         +TOnLM3RScv1h4588ylvMmlOqbOmNUtBqnU25OFX3I8iuOkf1axyMVyQ/5oxeXTZGlRY
         ASaoEr3xqdARza25f8NrJLyEOSKxcenurlD758U6+GXyCioQ9/CGiWz2Z8HkThwcLeFz
         rJSEd/LUD3m7ak5o2EyJRFEgTvr93eq1deqfR3aA9nzFAMTiijFwtvbz4cxlp7wJrgTl
         8W1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1GDjlLmxQKxGcMYupdVTsTHiU9Gv70phAG0Khcrwl2Q=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=DrN/RhRQVFjeIEI9nh3hjTZyDZCDMPs7pEbPoRcIYOBiHFTBxMQPzU09xQgoVIsN0T
         TBeF1R1IGUeTggqcrbKEa2ktWHQn0WlzmYqv1dORS8C7C6pl100wb8e5dz3pnxodrizT
         POHhdYqZININeRyy+EpDvo4ax2Il0RHOlaDELmLla1J5WzS1BIBBKmjYAvTN9N7Btxg7
         6+ZDYhyEsuiuss+suApXP17Cn5X2LScu9kxKwqHwzxv+nir2j7tLja9Rp+DcnmzVSqnE
         Eci0ECZ07VZGZ/keJvS3HImHFYwWSu8Jv3yUFnzFQzXqqCrYIH8oVQn16vdT+UmLQ3AY
         K67g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSzwXZh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e583b926dd8si1680978276.578.2025.01.24.09.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:09:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSzwXZh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNBe-0001qE-Qm; Fri, 24 Jan 2025 12:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNBa-0001Z2-O7
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:09:40 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNBY-0005UH-Fs
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:09:37 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21654fdd5daso41521875ad.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738575; x=1738343375; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1GDjlLmxQKxGcMYupdVTsTHiU9Gv70phAG0Khcrwl2Q=;
 b=BSzwXZh9pc8a5OAzQPA5bwMU6Y3X3dl0LKaf8V+dqkc7riMQ4SHoxRt+buAjkQogvX
 a2bvX1uK3i9uRi1fuvH9dvKLFY16yzpXadUhRvI5Bbt1YvwH6N3XudM/z9UhyrBqiUht
 ZCOb64pfrdi7X+4BTMvrkw0yBJYwpxFUSRIbVqJVw6BNMPJD913VK9/2a608kTVCOkK0
 D5bFaSFLkn2gd6j9h4AdYdq64rWTOsh2sMT1+0W7EDuD/Qa8HSzFr8VH07hCijCDZkrX
 6bJdDVBYL/6lGSwT8bAeDD8kmE+liEcllNpAg9C3B8aU1WR3pUNpO0gN/rwCqJNQ2dMf
 28Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738575; x=1738343375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1GDjlLmxQKxGcMYupdVTsTHiU9Gv70phAG0Khcrwl2Q=;
 b=kny47pX5ucwi6xU5o0OX9Mz/9Z8CJqpl386yD5IvDVyiuGKEurX78pCb2bLJ0h8xWR
 SRERRV0jWTR/aQQz5rpQh+xxHt2B3VbrcQDE0cfTyeooJIC+CEKY6FbszaBmSjzCpAyy
 8BKrAFqxxj+xHZA5eJ/za19jFUOhrVs64ZOE3rthSaZKCyytQKzojSh2NjydzK6ABkKg
 KaIWt7GoIR8Z8p3yY1fmKiFScsGElm5+3YcEW/Pefa999fWodKT8/Hn8W4HNLfUJZ/hQ
 Fd1XPVjwEa4YLF45fZqNaAKOVAyx6QxG3mLnZhdoCeJzlFNGDnOPMb4mkYqVSX49r31D
 BbNw==
X-Gm-Message-State: AOJu0Yy/zSYyKOyO9PPSDLto7TRCmyUIkhKnjTbnW+Elzk9n7XxS8rqx
 wCbZ7UJhvD7hZNdCNuuFJLkDeIFJyE8bLyM7RBUBlx70zpP0nEuFRHg2IGJl2K0=
X-Gm-Gg: ASbGncvP062J86r+WZaK/YlbB/B4x+8hRkRVf1GtLrc84TByggFEjYo1gPRf8sfJTY9
 f7yyz73KBujnNp6Tk2GDo0k8jyjnOUbPAArxxF02ze7SSCJbYloNFG3SYguqkuudRj0ZjgP5cTb
 y/YuD9F7beDfExuq/bvhY+M4Y/ipq4t0u3BYK5qy64DPC3qs3JPEmLXCNe/ebqmnmkYZIlXa4GF
 GHwVb/0T2kAFKrldkCp8RMVE5bx3Crrb0Ik5qV3jiarMDNNzXPAwPMAT9l0NqeCRG9mNACYi28L
 ITPissroHj9bsdMeQUlcQQUN
X-Received: by 2002:a05:6a21:998a:b0:1e1:b329:3cd with SMTP id
 adf61e73a8af0-1eb214daa70mr44297292637.20.1737738575053; 
 Fri, 24 Jan 2025 09:09:35 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b3233sm2205483b3a.61.2025.01.24.09.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:09:34 -0800 (PST)
Message-ID: <e082e62f-ad9c-4cfd-bd12-a733faba1df1@linaro.org>
Date: Fri, 24 Jan 2025 09:09:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/28] target/i386: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-14-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: M7BMHvBIfpnJ

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Move has_work() from CPUClass to SysemuCPUOps,
> restrict x86_cpu_pending_interrupt() to system.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/cpu.h | 4 ++--
>   target/i386/cpu.c | 8 +++-----
>   2 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
