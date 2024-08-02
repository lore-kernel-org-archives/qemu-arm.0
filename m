Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp144470njb;
        Fri, 2 Aug 2024 16:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4Wx1SXTzSzgE2hlHLL96X7CX8Ptgfz7QKaY8Swcpa/MOie6W4eYoziEDn4FiJ2Lx/XTh88uqh1bskqgWBy2oFPbI1Qfmt
X-Google-Smtp-Source: AGHT+IFHelhb2vfrMlAZNouV5Up8F1TZpBUz5Gd7sJuDUXQ7hnusrB+tc1OQZ47EitBbLlrSks80
X-Received: by 2002:a05:620a:2909:b0:79d:569a:6997 with SMTP id af79cd13be357-7a34f029668mr531217785a.70.1722641483073;
        Fri, 02 Aug 2024 16:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722641483; cv=none;
        d=google.com; s=arc-20160816;
        b=AnOrfOdCaTHykmYiv8GcxbQf2Q7J7ZW+UejmqutHX7yC5gkhBV5G15Cy2MErBqDpaU
         iFucbzMGifpaceq8bSfef1zYWaZxiaBkFnf4EDW4CNbEroiG1wE1cEyz0/680Yyki1cS
         G3RdRr4DyHTZ/u4TfjbQ1Cq/cgOM2zSSNr7qjvh3jagkX/1OnN5LhcGW3pvQ5nv7MPeU
         Kwa4hFg8AH+dkntkHRfVlMDeI1PLA5rGUmFKLeUffdQIgNnL53m085ekwkW5i0+jwptW
         w3qvv338BtXsz3oUTasfju2NprqIMa7+PnegxLT3kYaLmjjgZymuFr8zYSkoNZJ6lLNE
         1JVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H/ZXWw9KcE6wQSHvOo1Pknhx7Jx+B6BM4kFYxlez/VM=;
        fh=BNWniPMo5lHzWNgw79NydPgrvwwc1vYSLlU0dNEcklI=;
        b=cJrUKQAm6RjmkwHKSPwy7d7jXhN8BgldN4BGg7B5rZktm/39ZM60dTGTC2ONnUV5QL
         Bep8CjjEWDn59HyQo2PM9I9faJMfKi8yT7TALc9J+0IFRbum6NkGp85cTtNFFp00qkZA
         HeRul/gpRqvpfEeSF+fCHrgizuUZzj6UjMzNw4+JgNokZnQRq+/ngFKv6FEvB3nN5w0u
         LYDEFNefhkYsLqxNe4xg67tDMBw23Fj5n8XcB0zMX4yFQpuQ2vN1KF/OAtS8353eKD0g
         jIz8XcyOMZ9Z9Ei/zEFUr1MT2EqgY7/tJztJ5+QXs2STs+DnMbrBly8F99ANVYrGJLDo
         LXWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCdlGQ2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f6e19e0si355144585a.184.2024.08.02.16.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 16:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCdlGQ2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sa1jh-0007sI-Ge; Fri, 02 Aug 2024 19:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sa1jf-0007qV-Ux
 for qemu-arm@nongnu.org; Fri, 02 Aug 2024 19:31:00 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sa1je-0002nd-FO
 for qemu-arm@nongnu.org; Fri, 02 Aug 2024 19:30:59 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3992195d08aso44589425ab.0
 for <qemu-arm@nongnu.org>; Fri, 02 Aug 2024 16:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722641456; x=1723246256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H/ZXWw9KcE6wQSHvOo1Pknhx7Jx+B6BM4kFYxlez/VM=;
 b=cCdlGQ2iMcNy7SLCQ13GJwdjabz/KJlY92y3nC2xsOOoatRERudu5cKTws6AkWFO+7
 ZmQJf282Etnwl1BI8Cz30pCcntJeOMxu00sbWtuwo9AdKTddf+RNtsJqWzdV17xrA+mN
 5ez+AOr+hP6saLZnNk8ioNqxW5TWXwG4/yl3OvQlj+KdmMdng7cafXiLXHQ59TIEkJvV
 5dpexjHn9+/D+EpmFdYGCGauYVdwMhWPegpwldbeR9AHDWZQuoy7Vi3BclTrHuYO80LZ
 KU+ldJrb5eKBwVpBqiyFe/tEhdCyAhOgkO4H7vILXINYjyGUOQ4uag7zl5uK8IePmz6B
 0hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722641456; x=1723246256;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H/ZXWw9KcE6wQSHvOo1Pknhx7Jx+B6BM4kFYxlez/VM=;
 b=w9n+28SYaBRkQevzX3k7kr3ItI/mvKzoZ/KApCyGpEfzGfOx5SqG+ZItapxqJcAIsH
 3Ei4pwy5Ru/7O5rqDU37IM3LsOv6ls64DqO1IMZZEjEk5luzovt25FRZRtRFqe67hVzf
 /jaZvWx0JZcaSEQtd2lqmi8ZQ3PA/laOHp+PV96iAnWqUA59JySExx7HQ7kk0wyUGvN3
 Sk0rzrxDcbgTjLLMk2vuLzNlCnsx0a2KbMSYLiFiNNZf8a9rZpdbmvD86rCxHGl0+qGP
 //XNF4A43znQ+dRHwyUHb3iO59/8X5lGPC8EDX0YdjbIChku2NVazgjC7OKC2E48LIti
 UpiQ==
X-Gm-Message-State: AOJu0Ywt0osojoKuwZyJYdodgPYFALhtejDKW+j7vXBi9cntF81h7odi
 GquWgPqgcHzmj157XkrDtd672W52kAYgmCyBc1bj4ETiJWMlC3hpuFQ6gY3UG9Y=
X-Received: by 2002:a92:ccd1:0:b0:374:983b:6ff2 with SMTP id
 e9e14a558f8ab-39b1fbf9017mr58368765ab.20.1722641456392; 
 Fri, 02 Aug 2024 16:30:56 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ed31870sm1820487b3a.211.2024.08.02.16.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 16:30:55 -0700 (PDT)
Message-ID: <02ef3bf0-7a68-4896-8488-fde79675f3e7@linaro.org>
Date: Sat, 3 Aug 2024 09:30:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvf: arm: Fix hvf_sysreg_read_cp() call
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Alexander Graf
 <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9cEA4uI8m9M2

On 8/2/24 18:37, Akihiko Odaki wrote:
> Commit 05b8d7249109 ("hvf: arm: Do not advance PC when raising an
> exception") changed val from uint64_t to a pointer to uint64_t in
> hvf_sysreg_read(), but didn't change its hvf_sysreg_read_cp() call.
> 
> Fixes: 05b8d7249109 ("hvf: arm: Do not advance PC when raising an exception")
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Akihiko Odaki<akihiko.odaki@daynix.com>
> ---
>   target/arm/hvf/hvf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.


r~
