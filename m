Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2554415njk;
        Mon, 27 Jan 2025 08:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQk2xWDRMg+Ea4bUfZtEEAKS+3uKJQCJ2ksStpYByBNWaxEYgnC4ISSpfoCjcEBwO8gpfiHwo5Ew320w==@linaro.org
X-Google-Smtp-Source: AGHT+IFotepy7EqTxz2ryhfQHzGcBYO2SkSPGW5anxCG9auRbDxgCSFgIOVkJeqAXjo3GAdjT/BP
X-Received: by 2002:a05:6214:1305:b0:6d8:a591:fb8 with SMTP id 6a1803df08f44-6e1b224c144mr614216976d6.37.1737995114773;
        Mon, 27 Jan 2025 08:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737995114; cv=none;
        d=google.com; s=arc-20240605;
        b=Zc1JA4GTSeN7AlIfWXIJIhGjokoknKR5n8dVzRYavEEoLQdm3HiJsuszX14n0xRlJ1
         lzTXpoG+V9R8pxlckUEWKq0lpV/Nk7TfzknbaUl5jPTw8VTdf4yxqe37+Sh2gbsQyL8I
         ZRw8bEUwz/+csFlTKZX+cNzTtZgYHQz94qVLtm9BWp40THvaM0YEjOsRgGUcEKHusTSe
         hfIUWP3RXg+SWfxVgJTxgn3/rp02lwo77uOTE9nrZus8WhOcQi9rsYg6WV6DhGOL1GOW
         K6MwAaycJkbzSDwv+3OHX495xqCYnlG56+ZayeDsL0eqdBv7OyFLJrKKQ4Ug5X3ZnTfh
         ujmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bB0BpdOh/1R/AItutEPGXbd3C8TH4SbugusHRdMwPtc=;
        fh=EOte07IEQ6OtNmQpnFqH0ErarMQhKW9jK11649tEdoE=;
        b=fv64mcMPQV2P2PXBTc78OMmxxF/9Z98kWEvR7335clmSCE5Uo1YhHnDeygmQfXebZx
         GyzVW9ZgWdt9kXEd0QpOyV0gRz1IAR7gLzsxDBc2vCsEI7hk40Sf36H5CG9rj8ZWGEOe
         Kut6bXsUYsJMIWi3OqEa08TnvWldaCyqmlN2g+/Z+UmNDgUa6FemUEQnZ0/YQk3hk39Z
         J3gTVsNSBoQYtUOI0ZhHkkggmiZLvwEX/i3Yvmj9x+SkFBVj09r+XG685AnqLJ7xpVvj
         rdjx/83xJLS79p/2pjixD8dNKrKeN8z1w7Pv7B9rS5xKNrjHV/4nfzk/4/iAbfdhVlkV
         dE7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSVKGnWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df7259si108266836d6.238.2025.01.27.08.25.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 08:25:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSVKGnWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcRv2-000398-9b; Mon, 27 Jan 2025 11:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcRub-00034C-QW
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 11:24:34 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcRuY-0002cT-WF
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 11:24:33 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2166360285dso78997385ad.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737995069; x=1738599869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bB0BpdOh/1R/AItutEPGXbd3C8TH4SbugusHRdMwPtc=;
 b=eSVKGnWPI+KVUzESRwyXgBDzCT8q3G09KPnXyZby6drjJqpnaKlFOMZRuqXh0x4RKj
 xgQDOzt0ZvfnTgTQ46vYRkppYvsMPUFzaulk9IvI0W8Bf7KC0+ImIxyieOvuwvAfXRbd
 D/rfJZ/Jd2CLPRC3nDtIUd4d1p67BfcuDmMoWs0R2mw7MDu/NXtVusHei7gUfWn88+T6
 J4LSxBp3kyNbuiiA4YcZ+uKwIPEgHSL6MzrCZWptJBzycfsjSMi2o0A9QmbfHNUoGWu8
 B1XHDSGUhYuGPdeRjqQMP2PodBkXPmNDKCaKh4IS++6eXefmhkF/jAO4BPT/51r33HwH
 NgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737995069; x=1738599869;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bB0BpdOh/1R/AItutEPGXbd3C8TH4SbugusHRdMwPtc=;
 b=DtDXwiA1fmtZFEvyNEOeGgJsrNlUJCp3NMUwgMfPRd1fLjVlxy2FYs+HyUS//lqka9
 93OnzLmjewN2saI7/oY/wYdq/RPvbeAGHquTebt2APh3EoIDJ79RjOV6mfJRHd8QjNnO
 QCCQPC6fy6UTPZrNDrpfi7tc0lwH4O/UWPVH5Y8WhIl953pBfmJujT/k/4SzH2WeL8aW
 4a6y7leNJaWKqeczeCLpHmy44vGVMTy+ffe+d1VYKcDs3Q17vZDFWWo9zTpoHv4b+9SP
 2Q54M4LuvHD9Tz9l3WdWOb2CdjvcgcI9xNJrJ8YezoMyJ+TLTPJXW9PfdvLxK/tUb3Mj
 xgdw==
X-Gm-Message-State: AOJu0YwZgLdOm4XjxNJBjUt4D0nAg3xyPNk/b3YR4aO/oGQImMdFZZzl
 ulpOgx2s7xWGQtkHCpc1jnWGekPNZHkvXwkuFruQRedk88Y8r6Y18Tl40r6BchQ=
X-Gm-Gg: ASbGncsvbjqVy74joa2oIKpuDROA+te7J3kIzcIIfFc9oc5GrFB2DolLT7L8oRFkI/L
 DlMHNOEov0yxIDcI+J1SwDWrXnSVsSFl4z5Iu+Yx8lEPHHLpkpYTQMWVjLNmcV99EHeVO7N+T5T
 fMJJrETUnoXGErNsxjVZcvnlXmQGA4bvD5fek3Jci7m7Lsge8K2p09W+Y081+0sfu30CcNyaHZp
 f/gMzMOsLyBDfVn1ONxrEirn/BAFM5Qgg5NLjZDY5har2IrigeJG2YCjuuN9lDpewFh+fA40OA9
 gKFLxnip8ZJ2XETE6yFEtr9bOq+Iko+ESjDF94+HJpuMMts=
X-Received: by 2002:a05:6a20:490a:b0:1e1:b8bf:8e80 with SMTP id
 adf61e73a8af0-1eb215f0449mr50200176637.41.1737995069116; 
 Mon, 27 Jan 2025 08:24:29 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac49717de96sm6611128a12.77.2025.01.27.08.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 08:24:28 -0800 (PST)
Message-ID: <bea7dd41-c923-477a-a17a-af4120f1b5e1@linaro.org>
Date: Mon, 27 Jan 2025 08:24:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127115426.51355-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: A94vk2CLyiwj

On 1/27/25 03:54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/microblaze/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 13d194cef88..7603d2e8f73 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -224,6 +224,11 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       info->mach = bfd_arch_microblaze;
>       info->print_insn = print_insn_microblaze;
> +#if TARGET_BIG_ENDIAN
> +    info->endian = BFD_ENDIAN_BIG;
> +#else
> +    info->endian = BFD_ENDIAN_LITTLE;
> +#endif

Avoid preprocessor wherever possible:

   if (TARGET_BIG_ENDIAN) {

or ?:.


r~
