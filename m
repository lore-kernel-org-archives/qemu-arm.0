Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp655566njc;
        Wed, 22 Jan 2025 01:32:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuVLMxLfaARJLBQsKRyNrm/iE6f2MjmiZnB9RIOy2TwGZsOfaUjrslkO+oLZSGit9rTyidXsvosortqQ==@linaro.org
X-Received: by 2002:a05:600c:8a4:b0:438:a240:c63 with SMTP id 5b1f17b1804b1-438a2400e95mr134690185e9.2.1737538364795;
        Wed, 22 Jan 2025 01:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538364; cv=none;
        d=google.com; s=arc-20240605;
        b=jIL/DICVG1qgnbNSZnRnYlIXZWJW8pfYGReXe80hhrb0VpJXDT9HafHMsTb8kjsLx1
         dY/NO1YvRST0xXIcreb5DHCw+e9GCbtvso79q8xW7BlqcsU6keXWz0E4d0T/og8THG91
         UgCjZYEu78YmfFsdNoX52HRkIyTcn1MxOnZSW4RapAgB9An90//fEVYrrVEs2JGCIigi
         YLNGqSzExcYdxffl7iX04CQ3lVbi/l5rZ+5AJCk5mabm144bwBl7+YuJD4s42o1NX7l1
         owBG6qdXy7gx1kJER/tTED5+Sia7xDlE7rY5is4rZDzK0ZmM2urMZgOXQd1heciDNONe
         SOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U+c1swIdX25raxhIVr45XwfuWhAb+MHj2TpSRJRPmw4=;
        fh=YpcGR1Fdh75OVcqJZdYWG5tmpo4d1yU+eLsPWhZ+9p8=;
        b=FyQisxwMHs09wjBh5jvtRun2tyh9uvJ23tOGfW3/g3IK6rXJkj5mBXMFWZV1OjRcnK
         5sS42XMOsdoCu91wIRdKPAhIznkAkLitS/WgxNfo60JqurQN5B287W7BUOgQ1eYDeHTt
         0cs0iBeVu8R0hMCmyTgzFXRuk44AhLIY2wfoW6Gk4gSRDPVEjj2KD9yGi7PhBwLL6OKZ
         STw3/CqucL6MW0J1VVXVWnlFoTjOyQZ8cd7RRRRcwVFXxpDfnNL89v5KWkaXJspOOd0V
         dfSL8Ao5xnu5G5CnG/vfjExA7nTdhh12El2VjJl12OSKkAJZOw/m+llwi8x2C9aJKYQd
         ad9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ry0+e2x8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389041d2e8sor52729745e9.4.2025.01.22.01.32.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:32:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ry0+e2x8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538364; x=1738143164; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+c1swIdX25raxhIVr45XwfuWhAb+MHj2TpSRJRPmw4=;
        b=ry0+e2x8IDVVtFE2VNOz//w4zpljzErCAxtDc0WLLDvC7FwoPVY78MaTPms24i/OpW
         6GtyzrBODBSJPStg82t2QjB/3+2x6fZfiDD9BtEmyKzKZjrmlF6FCmJUmX0FZgpys1Jc
         e7XCfOpNpoFY+XHQQ3OgTyVVFm3y7eLG+NfVmz0xQ1YHWiqoBfmsF5FUome6q0SJVB76
         2pT+tPgY9w5NTkiZ9vZU6/8szzyHwb+6wm2G/RVL5oMtle9i17t3kPbBc+KOaUVB1f5K
         QQtk0vo/vyR0H9zHtuN+Si7AyP3SNgdmceyV8FS0bVK9Y9LJXdt4sTwMELG23ZLOdzWn
         /P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538364; x=1738143164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+c1swIdX25raxhIVr45XwfuWhAb+MHj2TpSRJRPmw4=;
        b=bR8Zfb2wD3u5XnrtFqIOGIbf9xoZLOxx4p0bhIkJEhMyQxZxq4MPuH6EbFJC4A+xN+
         akZn8roqRKe2alargcyXxHY8OhA5roHIYSPv2HV92uLocSpMr73nVQc8yJgVKEhvFn6Z
         WDlzmLrVaIUd5NEcGgGQyvj0BulUAOUvr4AM7tmTInsyes4FrOniSpuiS1ArZshTjf00
         zu3obgJ10X3E/3zjQ8YOHm93UOG1qSA38jaYiRApdu2l8dBCyJw1Y2jyHC8F0mfERNDH
         iJkob4hc6bRbX7P9pwXlcq5MRCmdcS8fropv9Ap1AGPUvvVHkZljuO1Jm3fjrgwYntik
         ixtg==
X-Forwarded-Encrypted: i=1; AJvYcCXQey8a8mXxPTmb4xw1EMrjyNcCwtlmtLmGeg6sruXXR5Ph0kfRJBov762VYBuFXaIxNQoMEtK8eeRlHw==@linaro.org
X-Gm-Message-State: AOJu0YyZDBSbkA/vPVFxazgQimFdGDXrLBDV95dhMycJSk7XsotT9C4e
	6MAbbCMY4HoZXmsj+QxPDJiFEdxKx7oL0gMCie8mYb/fPU9R89osD3YuRQXcncsleA==
X-Gm-Gg: ASbGncsJT7irnrCNlBQXiRCjcDXB6x5e30EPnzjnKjwwPNFtBTzjEU3yRCH8zcu7ObM
	gwvf5sHKIzhe6XJ15+KhPwCGF+4l4Y/LQShJUrdWYylgtRYa3xTeO7DBOgU4BruezPlFTjwyNEm
	OuBvcgCm0aHQtSL1Z6tDe3RCwREjxhXyAK4L0mj9S9K7umwElQoA4xKP9IbiyQYLHQhQhV2a6A1
	QbOaUHOJIWKhLGOPppnHodtNpiTRO/DstPBh0TnwWWRldqs+9LGZOiCjTpLcf8yKVOmrUi2zXN3
	vISIHjcw5Tw5tCpUMeIvMcyU/5GP6I50ys6/gw==
X-Google-Smtp-Source: AGHT+IFnb94z8uN14ed8JufyynaaLzmxZhewH5ITBpwDQCN121Y+HFMqyEfhMa6yMCQQLL16jM8/SA==
X-Received: by 2002:a05:600c:1f8f:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-43891430defmr164864795e9.27.1737538364286;
        Wed, 22 Jan 2025 01:32:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1d904cbsm12962295e9.1.2025.01.22.01.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 01:32:43 -0800 (PST)
Message-ID: <dda293ce-575c-45c8-ab36-93938a7c5bdc@linaro.org>
Date: Wed, 22 Jan 2025 10:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] gdbstub: Clarify no more than @gdb_num_core_regs
 can be accessed
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
 <20250122093028.52416-3-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250122093028.52416-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kybKANaIvr8j

On 22/1/25 10:30, Philippe Mathieu-Daudé wrote:
> Both CPUClass::gdb_read_register() and CPUClass::gdb_write_register()
> handlers are called from common gdbstub code, and won't be called with
> register index over CPUClass::gdb_num_core_regs:
> 
>    int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
>    {
>        CPUClass *cc = CPU_GET_CLASS(cpu);
> 
>        if (reg < cc->gdb_num_core_regs) {
>            return cc->gdb_read_register(cpu, buf, reg);
>        }
>        ...
>    }
> 
>    static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>    {
>        CPUClass *cc = CPU_GET_CLASS(cpu);
> 
>        if (reg < cc->gdb_num_core_regs) {
>            return cc->gdb_write_register(cpu, mem_buf, reg);
>        }
>        ...
>    }
> 
> Clarify that in CPUClass docstring, and remove unreachable code on
> the microblaze and tricore implementations.

s/tricore/openrisc/ 🤦

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h       | 2 ++
>   target/microblaze/gdbstub.c | 5 -----
>   target/openrisc/gdbstub.c   | 5 -----
>   3 files changed, 2 insertions(+), 10 deletions(-)
