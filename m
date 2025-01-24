Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp962460njk;
        Fri, 24 Jan 2025 09:21:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsEaCJ19cp3p8cM3R/1oo3/hF4oFGP3HyllXreyl8WZm7c9JF8nfEW0Y4F796xFOigclQN0VRoR+Fl9A==@linaro.org
X-Google-Smtp-Source: AGHT+IF33VQpk4O/ethGjzr5x7PHHXIRWdL33wfLb2/IxDjCey9r4mkxVD5Kc8IR+PaD2NrDLRnH
X-Received: by 2002:a05:622a:1986:b0:467:5926:fcf2 with SMTP id d75a77b69052e-46e12a1e4e5mr390359051cf.9.1737739309567;
        Fri, 24 Jan 2025 09:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737739309; cv=none;
        d=google.com; s=arc-20240605;
        b=db5ptWACKPpNPfsFQSBvY8szYvfVscEK/+VMPCHwEDfDI+RV9O4YUdr8WGEEnDNQqP
         AyzfWhe7TP7StiOorjp0ncwbCM0q8vgYfao3Y9av3sYAeUROsOVsou/WLXuaQhF26P+7
         81xdeOOKroAtj6DLgCbAMpMVrCGd8jkRSUBHnOHFxE+/SAH5wBzjlK48cP02ygRC3llg
         9pZeOmzWNQd+3NWZGQYX8HVctrZGYniz1hTLlQP2rupioPMXEljEMuKA7ykoWh6doVAQ
         RUqFfxTUHr9Dx3LXER3rcPWC0h2RLBZdqoSo7pF5cxnyVndvAmwR9fclwEymRVN8t3xL
         x4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ImGrmBzdXq1o9Ekh6nXkpOqPkLGM9i2Zcy4Mnrd6Di0=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=FDmM9R1zWuNC3XF9SYYXOXao6rXusfzazdVP63INjIyiPwH5Topq5gjHlle6o6eA3W
         MI2pjKqbZ0Ieiun1rQiB52RY++eIYbyG3TuQOWJQ9sf2R0xfHAZpAhm4xac7XiILl9dh
         RWryfPy7M8YI/kYz2W9UrDzuBBrlfS2j5iSk5t4b1BGDlFTqNt5sKlxeBkKPgBZVw9il
         Xsb1HoZ+mn4KIlNvv8zWrvDkoRsRjAvbxnpKSbi32IVmRVa/+SNfD9eq43P9h2zMmt6E
         J4jCs5DtWjjG/1sjR5tiRHh8CQrQTovAAPfuXJg1GcJW0i9TGghGE5kWT0QZUqYihT0d
         kKqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4esURCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b84ddasi29855351cf.355.2025.01.24.09.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4esURCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNNC-00013y-IS; Fri, 24 Jan 2025 12:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNNB-00013Z-EP
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:21:37 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNN6-0007ct-T9
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:21:34 -0500
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7b6e5c74cb7so196509585a.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737739289; x=1738344089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ImGrmBzdXq1o9Ekh6nXkpOqPkLGM9i2Zcy4Mnrd6Di0=;
 b=S4esURCXhhOGbbYs9M18rbd8FIg9eiLrSjk8e7IUWCw0Gu7zaex4OkJkio4Zi0Ofzf
 HlA6+M7qvFlEvpY1KJ5zsaXEW5oihpAjNgt51u1JPTGzYyQYtatYXKPWsx1CS/FEIQTi
 rjNjxvUc1S8tx9l6wfKzf2+P++0y6C86SHe5OKv520OIOEzFCKZ1LPobosAXzsgBu2Pt
 wSAJo1/on+WYD9cA6YYK8mXNiNHQicVlo/Ah7nlHd4N+7BTg1PAOmKix90LGTyYiClEX
 K5siBOsk6/kU2FqpX6o27+XUeXWfL4/9DhF7pWOdrxWR/RQoXifySo2OSeHpBHqBl5jP
 Hf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739289; x=1738344089;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImGrmBzdXq1o9Ekh6nXkpOqPkLGM9i2Zcy4Mnrd6Di0=;
 b=Zt/UEKCatIxJErdztgGEFK7liXelfSW9JygW7wjMeDC1XirsvzvVdGBOny86IGGXQl
 IXTxDWX//e7Vab9+B9rux9avWMmyqCKGXooSoFXqRvfVFz/QFJhdvpYoMz4R9pQmXEck
 q9Ajgtz1WTvpGPSAHfuBEk5R1DsaMa2h2h9pS4QAJhg3zjQqe3GUM0ke3wyL2jJujCZz
 Skv3+I0Lhx2yo6utOKtNz9zroclgi8pwdjnQIJbU/JkI2CQ7R827mYRaQiE4WcftZxbr
 1z/nWHozMYOndAAe7Mmn7ElTUXecwtBXBYasHKn48rZFlHzUIfWfAo0t2DJKzqgp1Rja
 Bhcg==
X-Gm-Message-State: AOJu0YxlvB1rvq/05nx3/5JqmgBSeAyLPE3fwq/3WQE/JUWR/CaHEO08
 s6trHB/+bvmo6x48Sa4D9qBgz3Esnow4zzRjJ4lTNHntfrZX4InFCLW4ExI0E8o=
X-Gm-Gg: ASbGnct0j0hRPTT43y1pC3MzIZP17/WHudOrd2dSYidqgK4esegRGqQ0FQkJlJr8e58
 bhypFNogbEr1ejvAsgWCIHjC5mrMA6VQA8Ohx5KjmqBbC4EEaja7b3TiVYy/nFsWJ1d+QygStb/
 i04/oWKEmsFWyeDVkSAB+P3SOywolUbFSkQLPXJ0t+o84KXYfOikGjS55Psleqy/KoGhBMYXBy1
 nPupU2Nnq/aClb1h2IPurr2XDq1e5jvdZmIGZI4hUmKwWbTdwnd3q2pF0eo2xMsP1Z4uC1OSuVy
 NVcRbhO3yT9d++8kEz44Pembq4bqwSM6yiOtdiUTVLPr4FkhsvccJLqxVjoGFQdsNw==
X-Received: by 2002:a05:620a:3950:b0:7b6:d58b:9dce with SMTP id
 af79cd13be357-7be63288566mr4136041385a.51.1737739288849; 
 Fri, 24 Jan 2025 09:21:28 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9af0d1a4sm112277185a.96.2025.01.24.09.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:21:28 -0800 (PST)
Message-ID: <5dec9e09-11f8-4fe7-ac73-6562374d9400@linaro.org>
Date: Fri, 24 Jan 2025 09:21:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/28] target/s390x: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-24-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-24-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
X-TUID: wZZaD335pjIo

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Move has_work() from CPUClass to SysemuCPUOps, move
> s390_cpu_has_work() to cpu-system.c so it is only build
> for system emulation binaries, restrict functions not
> used anymore on user emulation in interrupt.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/s390x/s390x-internal.h |  3 +++
>   target/s390x/cpu-system.c     | 18 ++++++++++++++++++
>   target/s390x/cpu.c            | 18 ------------------
>   target/s390x/interrupt.c      |  8 ++------
>   4 files changed, 23 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
