Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B0CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:39:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwTI-0004c2-8r; Thu, 23 Oct 2025 10:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwTF-0004ZN-4O
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:39:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwTD-0002pa-HX
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:39:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-471131d6121so7223985e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761230353; x=1761835153; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dVKThUFXuZtqkYzX5p6Uhhgaqobr/Pe8uEyKy/8egPc=;
 b=Q/4hBTzEnbCivcSaXuGAO8CGbw25P//jD2Hx8gD533K9vAE5WcNN8/0HWT3A1udEiP
 90Uy7p1hVWgzc5XDeFdqcIrbNO71OoNDsCdeB/UkH9f3GJG6sBwKcO2x/N84n6TO0V7p
 zb+O4rVCf08aN6wwyO6nzlTsl7G1x3NjoCHUx2fbN0Td5JPu7a05c0fxYDA3Ifs96L2y
 etznRu/T9524A2ZtrJty6Vl8Oj+2aDAq/BKTcIjj8skonQuk74FUJG1LO6PAVPt1huw6
 gvXR2VGNSSa749eUrnrIkMx+IMdKIFPc1F4EqYT4JdOjShivhUiqR4Y2+IcDZVSjCISz
 gZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761230353; x=1761835153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVKThUFXuZtqkYzX5p6Uhhgaqobr/Pe8uEyKy/8egPc=;
 b=D8FJyb2GcaMBWdk+kslU6se8o9J8XtcTMjo9UDuRnm9UZXUZgkXjz44yrBIELWmlpr
 rrOtvrauvGfS3X4yaIBfApuDwHulxLY9BvCOCDrJx24PaRWLjcHCdM6g//a3FY8TQhCS
 zBuuMEIOezOYM/ZQVPOwp9HooapB1DsClSR+uPnmfctv+Nhe1yeMkCL17HNgGwb4KqR7
 n4wEwkykuNY9f3NKyqevczB6BBZfFHUXVyR+AGE+ThzubvztRqQCxrbWxhwyP7sZWTqQ
 O/HyUL8kiG/BAoS6JNIQuyPifYwicijTOhZQf594rv+7XmYdrG+qcinLOjeso7f4weYY
 uQ2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4deTrD2n8Ampsibrt7KZlzTtATRwnuIeC6/bj8r/0AA2BYAWrn5lxMd8C88YmAHBbVbZeLOSHVA==@nongnu.org
X-Gm-Message-State: AOJu0YwVUHZPEYwhPZvp9OLdyNgRTuWGDJYaDZ1d7oA8DIb+NeyQs2uK
 cNsOVJG+8SUTsxcQiVKQD07fffjd+02MZplY3T2isFi/1mbuedG3DDa39RG4tsgxhtk=
X-Gm-Gg: ASbGncsu14MISyncxNGYWm0MLtw7OU5iPG64EtebfHBgvMD/GLj84c/4lRKQoMtkON8
 ZBUxWIIAQvjEwKN9wfg5ceOLykYNkSnYvP3dSocUYpgzBmsBSJ4FgyDBGAdghE9sjpHmtiAevrZ
 A5rWamv3foYxYjz3DAlyvLBNsuZ+nLP89hTU7OBOfLt5Ph8tQV2hTlC3nOZQDqWh7jrd5FoTymj
 lLEZ6ya8wr3tYAK2v2dlqJWwCkxtfu/4rUd2jzCmOsBnAuyhoKX4T4Tpu7Mq4IUxZoSnUfBquGI
 Jjv/pDRSXn/4NHHDJ2Uo5YoAIRVAdL877LQSgbFkHzSqRaoC4Yb9GRENjwEWltgmMyg9Qzu9LKY
 wAmnL74cCbIiBEb79YQl0tNJg6WA2Sgin+s/O2qtXgtxPzhG7DCGGjQMA3tTC3af3oXoi8yzthK
 tkcafqR3WRbYdvC1YviRlybK+kCcuzpPGizkpO3MmqwUU=
X-Google-Smtp-Source: AGHT+IHdNKBpI5e4QjWPUqViCm/ReKkO1hg+TqmM7B1lZGZa36Idk9zMTArdYKaGZhtCFXzr5S8EYw==
X-Received: by 2002:a5d:5c89:0:b0:3ec:d7c4:25b6 with SMTP id
 ffacd0b85a97d-42704d78abfmr18711642f8f.27.1761230353273; 
 Thu, 23 Oct 2025 07:39:13 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898ecabdsm4549978f8f.47.2025.10.23.07.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:39:12 -0700 (PDT)
Message-ID: <8a9db920-c140-4faa-9824-882760b46053@linaro.org>
Date: Thu, 23 Oct 2025 16:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/58] target/i386/hvf: Use address_space_translate in
 ept_emulation_fault
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-7-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023115311.6944-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 23/10/25 13:52, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> The hvf_slot structure is a poor replacement for properly
> looking up a memory region in the address space.
> Use memory_region_get_dirty_log_mask instead of HVF_SLOT_LOG.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/hvf/hvf.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

