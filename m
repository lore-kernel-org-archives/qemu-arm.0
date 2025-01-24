Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp971301njk;
        Fri, 24 Jan 2025 09:36:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjpR6bgqTdjVnfrp3SAWD6STVO25k6Qf4/AGTlJgTP9mIfXpgMbAb0IR3nkRTp324ZPsShRH6Ej5bcoA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMRYvLf0KMrJpHXNnAcJ+zlQF5DBm07slxYJnBX89klD6CE6c/qIMC77w3WYFzldQBfL9r
X-Received: by 2002:a05:622a:2d5:b0:467:87df:851a with SMTP id d75a77b69052e-46e12a56380mr455763791cf.12.1737740200465;
        Fri, 24 Jan 2025 09:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740200; cv=none;
        d=google.com; s=arc-20240605;
        b=NDDYBdxLAtU2MPWBS7SJM6I/TUwblAljjZDavo9ys4V3BLFaaiL6rdA+PfYMksNeAL
         ucYlkyQNk8xt/+Iv/4Hlh/r2EqsLFt2fShupoaxgpXDarfEgGSjj1WDnKIu6b3cL4Cd4
         O5hRSaBHZZQbQdn745QOHwA4vrm5etFqV+EpnyfMjHGk0cHwRemCnl3kgZRNVpWuA60r
         hA03P5VcBdUREquWm1e2sOdjxbyVIhLUYHJfB/uM+FQhlKtzpN6h8DHEdOUxLiMBakws
         onK0U4qU86Mt2ZRlaQVWw4Jz17IKijocnRJUVaH9VcJqmsJ+cOKw75yjguro/WwU5O+o
         1vaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0Y6vsgRygU0bR+WKza1oH3fA4m45+T2lMj7x2f2LgUk=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=kpnQGdlJlMEbLzMH+ngyf/BYIyBaB/NtfWbkcwlw1jjqpZsFFtgTdaWty+fSbCx17g
         ozgmtlm3U3mAcmabBOzHB8TrNmknl+iozrFUEYHJnMu9Qhl+Inl6uuxCFLiMeQfw5oE5
         IJLH0Z72L+fopIeFUWHRLBSzldn5GQsFjqBX0KByYgphwuu7ippy2sowHp8BEdA/mZgq
         geI4VabUoENxVbEr8TuCLiOTcq0yGgmdG5Mqsvgr9WuJAkAu/dsIbfr9q+MueIhgMET8
         IfHpXceX1Yjdv3xjeFem8mDj8LUVPm3a/ssdhvJAuTYAwpWbLUuAj6FMNdYWDSk8NaZ+
         tZEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrWzpzcD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20601d5e0si27547516d6.369.2025.01.24.09.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:36:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrWzpzcD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNbG-00075V-87; Fri, 24 Jan 2025 12:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNbF-00074s-He
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:36:09 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNbE-0001ek-0s
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:36:09 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6dd049b5428so19908206d6.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740167; x=1738344967; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Y6vsgRygU0bR+WKza1oH3fA4m45+T2lMj7x2f2LgUk=;
 b=ZrWzpzcDfgmCBxiox0iMGHASbsPT+7Vx5+3zU9bdBRrr0XX5bRlNRp4LEmpxHJuSxc
 Zw+Zh/1GqNoO3rdohw0VoGK6ffLR4ag19r+lxWnjCP684E8VzCtH3q/vboInlxQg0CtM
 R0tReytCXvbmavpyPInyIq5nvGu3Z0AFBhPkU5UJ4Ra0udZN7cCBPXDzAbfVhf2hT4YG
 JsI/kZ3XcugOM1cluvhUjKAckmXfv2MQuvr95E+SNj+HKpqn6hAAWhA3wsnDBqBirB7v
 fPv9DOlFOPZvtLpM0s19OlDIdck8a0BDKUlbg9C34vn1/wrGq5175kQZAgF5ejSQT3qZ
 JEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740167; x=1738344967;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y6vsgRygU0bR+WKza1oH3fA4m45+T2lMj7x2f2LgUk=;
 b=sA2OhHFyY19ShDvJ+xe7OAR+9XerZ6D+EzQbJ/hwfCY53fKdUYgtZGMvNLKAUuHOnx
 6DTuLId8psbcMeMzbxQ8UFeTYax1iYSz5Z8LO+Z+HsG2DlMar2f6Hrr5DE118mGjDYD6
 1ktCFphNjjWJWIlK7U6ADyYPOX6BTckzqg0yxCJrqUwJ7H9Kd0xHVYsqoJjPXNir6rad
 euQ2aPjsxTgPTYNqyn4wADDITHbIpvufGbX+Jw6AoCIt3qo9OfJCrZQPkIAJ1YUz2rgY
 ZMP7vamp6tXGmq7V0jc1Hup9+ULZ4iFCeZo/Y5rSjJtrocNi1LpCl14r8Mc20VSHkRqc
 ORvQ==
X-Gm-Message-State: AOJu0YyzNF50ckmWeI8BV2PfGwM3lZydmfws+Eq5pvQymRkTd6fZi3LG
 r9ujlIyTBH2USt49Y6h6OL8ZACOLE8S1UOmNJDjD2croAdWJT/sCkhd8fNKt+KY=
X-Gm-Gg: ASbGnct6hXfuiO5EWpok5R6Qu87yw9G0uppbZ9JHobD4hIBxO6npwHhjaY+hSUTNabg
 X91tuzDfO/4evyJZCtSlK40Mk4ML2QhyMcmC0Kj4ectZp6hNtIl52TRuytR8hzTh1UzJ5QOPMKJ
 VAdFTPSFmc3YDcs5JshbdsZoBX31n33joGiePA2dffhI8PTReo758iCHmMa0YJeQMJ9g8D4/GDD
 OZRcsynJZ1XYm8QxNmq4jkiKlvb+UY0eDRNROkPLPgZXTnzu1FsD7XepBLBgdTFs+idef41DZuD
 DRFmGzTSCAZh35Ws3rXJvln5TQxyU62roZXNYTkDzFk9uTIA3Co4dhg1dmzKEBnvVw==
X-Received: by 2002:a05:6214:21e4:b0:6e1:6bdf:ed1c with SMTP id
 6a1803df08f44-6e1b217a2a8mr451197516d6.14.1737740167035; 
 Fri, 24 Jan 2025 09:36:07 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e20514f426sm10530276d6.38.2025.01.24.09.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:36:06 -0800 (PST)
Message-ID: <286a84ea-356e-4e57-929f-a5afbfea6ad8@linaro.org>
Date: Fri, 24 Jan 2025 09:36:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/28] target/tricore: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-27-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-27-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
X-TUID: 8FskqK07g6Ia

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/tricore/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
