Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70094CCF9EC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:19:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDLFh-00075v-Ju; Mon, 27 Oct 2025 07:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDLFA-00068Q-RU
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:18:33 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDLF5-0000b1-9F
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:18:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so22553945e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563901; x=1762168701; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RZC8/oJnJcV4lJaBSk7Gx4qizIfLg/fgsWf0Vqk3mYk=;
 b=zs3WsITtN0bsm9Qc+zXa5GkQQA8J/jSbKXd7mJNDbWobIOwprhkoD7z5NfaVkIG2gd
 5oynrue8YL1wfWYz7srutOVYTTKEdylQ5dOHrbS00xTLy58lSb5du94MxrN4mEnL9TTF
 6fhPnI4L/lpksB5OAl3/tne/ZjCbJJeKjwtWANlhTNkDgXQUP/5Brcjq96JAC3JNAG9x
 3PVNRyM2thK6mwo/DGzAuLM0CaBjS4q4VtrwOeWTAyAV5RRz2gbCX7nwpgguSFDDdYli
 R6jXdKEYjIF3o/m4WuvUimP8uF8c8TMeYkhfewa3IZPWxhZVkk3K9g1SVqlO/VQHkMdI
 +wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563901; x=1762168701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RZC8/oJnJcV4lJaBSk7Gx4qizIfLg/fgsWf0Vqk3mYk=;
 b=aKD5R6Fu3rsNStMlsuH/S7IMQMeqYgiRS7lml+/ihtn1Yd+nmgkdKE1QVSa5JMj81a
 flpE/jxfeVGM2kG/DfElIwH490W1Vszx7B+KC1tWAYHHAeK6iK95Rkcm6np5dw0LRxOo
 4dRZgkpURWK7e29MS9G/z5qAMjZEjdcVrvvd6C4IRbPlD7PQwbyVFogkUlxUZv31M2Gx
 SUU5ASI08o+wHmxIrIsTIFg/eQbawOTLTZxbfpDC1Qd2MBhoXGJlFMfnxM/c19I4aEc5
 g2FQYOFqsjGg51Guy5m1bdsn8Rd9sq29hF30kP+dM1RKs3i7T5+wNNjHB6fYyaxCH1DI
 30fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYeZfeTPcEMz/a20CXQlI6Wp0gVfpeP7CUmmckpn3Z/YXbIn41zpoAZwIJODjO2RdEO8ikbcxlAA==@nongnu.org
X-Gm-Message-State: AOJu0YwmIyRcUzjLa6GP+AI1ig5gWnGmRbdsSwgFs/OUBTtArFQ1ooKy
 vTc6X8pKSGj1KRQ/a988/QI95uPL+MeI6SR9h8Oy9PLEg9lJ0AOdxCbHf/tOLXMdaVE=
X-Gm-Gg: ASbGnctK9Fs/YF8oMXNrpG86pOKYuuCL64QiaaOA+nMJakNsWcWIkPprRVZxlimhisM
 tgbGXZJ99ybqERzDdilg/+ly0trlkWFo+qPrUaDWjb2G3Da7r0OZp/s4Bf88JtZZPUHkeaOdWSP
 gqev6HtJHZaNwQO/JVs3snWZ9qE5cbw6shcD0u6tsetc8ATXa3ITTuZbRIJ9PQp6jDBmlXfIJJ6
 KIPRee1BNh2O+iFrWqgKXNZM51682TaD3VPgAVmpp5q8SaDlc68PeX677dtc4Zg4dYly/tX+nPO
 7rhcsyxe5YUdAuyQQ9/FJ+bw7YOSb452xKCapDLA1HHfxOFHCLQpJ1UvCweb0nN8vFikEfJ2Epu
 rRTHiuIbyPPsu4cfJWgxwCQlkBb1YEUSi28JXXV+a5hcHrAwWzbGqOHcwDtTNWTFIATe+M7p+UX
 vqF1XrEZKWyaN94TWJY7fPnl+qHBPxAWCNDRABb8glN8W9CiaEvkDwf99UIffIgO6p59x7Tw==
X-Google-Smtp-Source: AGHT+IH6dclyzuE8k2J+rlZCdQ7oINA5i+MZXq9k3abN+xYyCsTsROA+2KfyBEVS4/dLwj2kTqLcbA==
X-Received: by 2002:a05:600c:4eca:b0:45d:f83b:96aa with SMTP id
 5b1f17b1804b1-4711786c6f0mr299483015e9.7.1761563901159; 
 Mon, 27 Oct 2025 04:18:21 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd042499sm131104515e9.8.2025.10.27.04.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:18:20 -0700 (PDT)
Message-ID: <042b69df-bd3c-4ee1-9c32-24911e27ce1a@linaro.org>
Date: Mon, 27 Oct 2025 12:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/35] gdbstub: Fix %s formatting
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Stafford Horne <shorne@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sean Anderson <sean.anderson@linux.dev>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
 <20251027110344.2289945-35-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027110344.2289945-35-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 27/10/25 12:03, Alex Bennée wrote:
> From: Sean Anderson <sean.anderson@linux.dev>
> 
> The format string for %s has two format characters. This causes it to
> emit strings like "466f5bd8/6x" instead of "466f5bd8/6". GDB detects
> this and returns EIO, causing all open File I/O calls to fail.
> 
> Fixes: 0820a075af ("gdbstub: Adjust gdb_do_syscall to only use uint32_t and uint64_t")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/syscalls.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


