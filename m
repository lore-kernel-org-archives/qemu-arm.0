Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2248318njb;
        Mon, 10 Feb 2025 14:13:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKwnB8Lh9a56lvF9dPkShaFP+OyDMVM2ydp3g8PybmF+w6XrE53nyz41V7yF8CRcHnHfaIteV/P6ccDA==@linaro.org
X-Google-Smtp-Source: AGHT+IHGQz6uUbYIxCSqsITJgCxJbHfImikSITCwwXPyC/tMfMV7kXCci7yr+r4oIfdAjQwGF1Oq
X-Received: by 2002:a05:620a:288c:b0:7b6:c540:9530 with SMTP id af79cd13be357-7c047bc6eddmr2563785585a.25.1739225597214;
        Mon, 10 Feb 2025 14:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225597; cv=none;
        d=google.com; s=arc-20240605;
        b=XYbTveYiuUzQfENrVPNc/jIPSBTwszlmYduLx0k0UknRvTTXmszalbI0Umv85oxdoN
         wVTjc7Y7FJeOZpwp8uX+TFuA5M5wSQ4AHMRM/GNuxxENrRgriG8uRHFtHBUcX0KFsjAu
         D9tJA726VeFfmzzurWAiZ5H093WZ/InVJ6pG6NygVbka89s8nYVF520bz45hvKXeKevN
         5LfQCJZc1WpAmZOw8pRswchzLNZnIDKuOrVVnoUBYQOpsDVKBx1XdWJG5OhkGtR77W9P
         YdyZJwWN8XMK4NjJIyd9qFdAK7bMC5gjgAdaOvO2iy8p7t3mpgJok2sP0xt+1RD2jY46
         fJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OG4nl4JMn5Wb7p2n5jtmBBqr8zpE1l6Y3NgKMPJ8ndI=;
        fh=QpJI++eWKGL/FZZPpmOBKc1A9f6SwOJdTDWyguhrqQI=;
        b=aOfAeCfmXfXfeYXu7axU/s7Z7151KLwqQq6vO139Qys9LH+wSe0sm0+jTJwC9Z07LK
         siJPK6m2hJ26OV0ftF6DcT/oJMoQFU3MPOjeoVBE4zc1bXLHL8fuHTnsVw45/Xkyi4pI
         vDJq6kmjgndwdNq0AFNJRjyHmHd1AsO53zI7+ieT/1zq1Vs5yeatLGBO2LJeAPp9hXPJ
         Ss0cNTBZAcgA3FmtdiVjvsIfxmgLOZ4T0DsBkZFZWrZ2zB/FsWNVxqdTbgtRh3nElAPN
         k2DF2lCD6/lbLR3d52RFIePt8BeZWrQ8OcTwMrjPu7nCFhBrY5Bp1z6DoV22aHxCGgbu
         /nZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tbdakS4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c05a941ddasi374246085a.151.2025.02.10.14.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:13:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tbdakS4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc1c-0002VD-BB; Mon, 10 Feb 2025 17:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc1K-0002Hj-NL
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:12:51 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc1E-0001LO-JX
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:12:47 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21f92258aa6so41566785ad.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225563; x=1739830363; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OG4nl4JMn5Wb7p2n5jtmBBqr8zpE1l6Y3NgKMPJ8ndI=;
 b=tbdakS4J/X6Q8HXG95QqkB3G8+6qwu3ebGh8nJ4Y7W273t0Bflzun/TJi/q+boY3ka
 q1APFlHdSBLw26aq05+xOIW45feIkdvZXBjMZqbfo5YJUIQBGMij7Cl9A2ViDIfyGPM8
 cLmI+sDS68X70d0Pf4arFmI2xNkS2AjBNQSBmBHMKHnRwBib1aJRzz6FY52lSh1WYLaE
 Z9rrzHBlkE2SzRnXa8tbiH3j7Jxsa80wf12jamXLGAklPkKz/bXrWlniykz03CdRPRHM
 TuaTpmHJkUS0UTtL7Zflcwua25iagHdUPhVQ1NeALQSbjmUKedcKr19Y7V1pz94blYtX
 36Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225563; x=1739830363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OG4nl4JMn5Wb7p2n5jtmBBqr8zpE1l6Y3NgKMPJ8ndI=;
 b=jIdb8Zkpg4fHtQFg4XhYiBee/O5aPUtmDPPqg5PmBMoP88xazkLbXIAXEODofejGvg
 ia1iTIM2iIikHylvhAgpRzsTz8RENcjdkoQVev5ECfsmr8V1kGO/YAsM7JRTqL2gN/LV
 A9BmddYaLXVQwI75lxZxKNwosyf4DW71+WVIvcXuKWaBx7PrkV6PtRWFJSnN64MK8FeQ
 e8o2v5KPhJkPlHEoPXbjnPp+NkMICjk5+6mn1iFOOq2oUepvT73OaLUKPGFw3K2Wt/I9
 4WyAOR8j/RjccW2zWNd99xdPk277FlYo8Huno6lZyKwBqlnmMJxOuiUqM+phsm+XPOMn
 +SZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5BIlOJoIcCMnqS+i3rAlOY3uGY9yT/z2PV35wLSWYJexkjVAhGFafiYlbKcGXKQULlbkRYhuUlg==@nongnu.org
X-Gm-Message-State: AOJu0Yx439W9RUwVOgXHwknK08Bz1uEsTS9hT6GS4Ni8R6R4stfpC42W
 ngK1w8+bt9qtg4+x5do1QTO6XvpHG7c6ieQgEXl7fj9frt2I4AljbHAwTNyGURs=
X-Gm-Gg: ASbGnctBX8yYJ3p9eQOkUoUG5YoLYMrID9+pyz4l1FI7I3m5a75JwwWmukrv84GV5G9
 DppqtBcMMkepm3aaLFSnDR0p0y+T8q7vTd8NvHXu17d3nsSiJaxEUs7UjTRpPffjZqhAstJKjnJ
 bP91VC0eilgnamzwi0oxaMoPURKxxvGGUcnLicAWeZrQz+AA5/1p/GmWZiXHMUO1NrUhW3ko6RN
 +v77TShvejwKYRfCHP/hGTykTpBmompuyPsX36qrCJkuilB+NIjlv6uFE8okx6si2bQzqJGBQsW
 UcCTj3yextxBgZ3Y/8HogGP0uYGBXkblCsRFINIaoc4fFPzoM4lp0A0=
X-Received: by 2002:a17:903:2f84:b0:216:31aa:12fc with SMTP id
 d9443c01a7336-21f4e6e6123mr233359525ad.24.1739225563341; 
 Mon, 10 Feb 2025 14:12:43 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3650f91asm83768185ad.18.2025.02.10.14.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:12:42 -0800 (PST)
Message-ID: <d50cab06-ccd5-4ec1-af65-fbda9591243e@linaro.org>
Date: Mon, 10 Feb 2025 14:12:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] target/riscv: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E0v/zIui71FV

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/riscv/cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3d4bd157d2c..b39a701d751 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1156,6 +1156,15 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>       CPURISCVState *env = &cpu->env;
>       info->target_info = &cpu->cfg;
>   
> +    /*
> +     * A couple of bits in MSTATUS set the endianness:
> +     *  - MSTATUS_UBE (User-mode),
> +     *  - MSTATUS_SBE (Supervisor-mode),
> +     *  - MSTATUS_MBE (Machine-mode)
> +     * but we don't implement that yet.
> +     */
> +    info->endian = BFD_ENDIAN_LITTLE;
> +
>       switch (env->xl) {
>       case MXL_RV32:
>           info->print_insn = print_insn_riscv32;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
