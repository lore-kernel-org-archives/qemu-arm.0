Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp970975njk;
        Fri, 24 Jan 2025 09:36:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvf6YR/mwTzh7LP3qwle9fByuB/xYjAJ2JrBQsBR76v6PLNkweg/KSHMRfafkQfwOURg7waeULkscPog==@linaro.org
X-Google-Smtp-Source: AGHT+IEkgg9bczAXhnW6pu3MqxUVDRa85Sg9HFzyHSJGt3USSKK9/LSiJC1GS0rccfNb2jhbteyG
X-Received: by 2002:ac8:5814:0:b0:46a:2876:d667 with SMTP id d75a77b69052e-46e12a56144mr456152001cf.18.1737740170796;
        Fri, 24 Jan 2025 09:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740170; cv=none;
        d=google.com; s=arc-20240605;
        b=f+1hG+gjweBZos2j7wc+uTnC463QRZ9rB2Y7bX68jVs9uDIxdYK7CqLiUGScnZ/vQr
         eMGeV4MBS9HFoFm1a0ffY986svIlSlO83PcTDmuVRYHI+ii7Iw0B5hwU7+4rrD+VtJ4k
         AadSa3MLKxUfwlfvfCXTZqHayDMAUwhAuhw/r0BNN4vi8Pgfm4z2ZI4I/azEh1s+Vk8O
         fh8FyUXUrouIto2E6IUtE6E68nxJ9vGKPLkix4SkQpzVz9mXSyYjmmlWagLrnUpXCJan
         nj7UJ8dVRPHXmnRigvQNQDwm7fsoM0Bf3ufaJn1weMYEVjUKVWw+kzdDlQ3LGQWlL6gp
         WG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AMV+qxzvpWkMNhHrkYE0PGfCQKHhVFb9yy79ND4wiAs=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=cHK1eQOM7a8+pc3ZwV14HcejBUCV3haUzVPHLf4idPATabUfvJ9AQpwMuBRkOPkLUo
         un/+dD+40BnM3bUhfyGEhhbXZI3wyOkw69KvaBK/bYs58muw22ah62TsJULM0EJLd67S
         WpDxm0w+WsndB/4HB/u+hqxnO4c+3ccJL+SzBide1sE5aCEklzA+tiFF2tJzibgtRY/F
         6SYssddrjdEyz8RhpAYXJ0qKxG2ao3WlL32vZMoUY2MPHVPc5RPYZ16WBj5gx+BIYGlw
         OoQVxoFUd565qoXkOsBN0X9C8Z9H7p2opRRadQpgS3ZEsMpmPshUDAIe7gywWX+1i79F
         4n+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOkkwgOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686d8cbsi31035021cf.8.2025.01.24.09.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOkkwgOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNaf-0006Hm-2G; Fri, 24 Jan 2025 12:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNad-0006GV-3m
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:35:31 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNab-0001V6-FN
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:35:30 -0500
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7b6e5c74cb7so197761385a.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740128; x=1738344928; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMV+qxzvpWkMNhHrkYE0PGfCQKHhVFb9yy79ND4wiAs=;
 b=ZOkkwgOc1ZgtGSzzRnR930ObNXtjo2+PHpRAvnL/LFUw/VTW+il7Bz/gZMKGfSV/gF
 vlZSxqmpBfDcTnOYlo9onJbmUsdOntJAT/ebslNg0bCA9xHyczaoZL0m1T3Cmjsv7n6O
 7ja0svIejZcW11QvG98jHByVGMOkrshRvjRqYJcaD5Lqy6v5nI5wXhce/nMbV/eiqNfr
 gwY95A/ngXSx2G8QidVzB+hlkkwyNvE7kReqqrIf68of933zknb/045dUL7sjdhgf1/M
 PEROUzDfyh321/m+13YwQg4/TnoG107YcDgJu0IwgRv2xiaWrUzCSl7EDpVNzbSrottH
 NnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740128; x=1738344928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMV+qxzvpWkMNhHrkYE0PGfCQKHhVFb9yy79ND4wiAs=;
 b=jvP3XgoCgKWutcGlncIlEwYYDasUbJYnXri+CpTOZvgP3Ems/KyneSZMxwsNmFjm/J
 0OjjXIW+l0whqC/TrwziwqBgffxAvun6p7yRLjSwUtwfNYjmTHmztqmW7NrmwpNWLcZp
 VSoSw0JhcfyOuwdy4RkKTIh8HDzBf5ofX5hT2gb+BfkGT8AEczIeyGgmpQfXPkr1PSIk
 PFkhKO/5iGoNDyIs4ZUbnvmmBBsDYp/0cBle8XayjzS6N9Kd17RbftY0fwsgrOGdAxMy
 1RdxRNAQ4wRl/OcbPmk3pTher/XeZ8igln6sBPAuMMSflVohKb98cm9xMXZ/1pyZ5MIT
 lAjQ==
X-Gm-Message-State: AOJu0YywgP6ufhXSe0i1Jsj8uLm32WYf7pcmIy/aYYKTD0cJNmXNXjKa
 5LlK0cC/KRw1Bhk5RDj5yKkYiL5OgVnM7xpSCq6ktrTU4yzpx6tXeG4rx0fSk3M=
X-Gm-Gg: ASbGncsh4jhWm51wzWCGldcntFdeSqXPM4yxN7kbhu9f1Rx2pSsAT/BeAIG72tK5Pk2
 zSsiAWtba1PEp8dO3Izgicoqld8oxrKrwChp7J2a0EcDdxHepofQ9KCB+dX2UEQUkhEx0QoEBUc
 DMUYdUgVlkZshCdM6sFFp3ZDliQEdrZytpPwGVcRglpPauohGPE+3iNDUfKlpxKBwMl9p5EVkwF
 Is2q7QEHTIHq6RimjkRpERGh821icXmKyf/Qg1SmTnKJTz73HlZeZz7u7wV08e8ZGqJ2IyNN712
 2tKjkOpV25qs1hujnoRRVxhJslsXdtaP4TGknhEyUKExKpdMqu9Fcv3J4imRUGCs7w==
X-Received: by 2002:a05:620a:4151:b0:7b6:d050:720f with SMTP id
 af79cd13be357-7be6321c277mr4448304985a.22.1737740128327; 
 Fri, 24 Jan 2025 09:35:28 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9af109c7sm113780885a.111.2025.01.24.09.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:35:27 -0800 (PST)
Message-ID: <822bca3a-600f-4a08-98bc-07a11a5e32c2@linaro.org>
Date: Fri, 24 Jan 2025 09:35:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/28] target/sh4: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-25-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
X-TUID: KRRloQyzpZGb

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sh4/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
