Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2247592njb;
        Mon, 10 Feb 2025 14:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqHg7LDFBtmYJ7NExKBAXjBHjW41qBRdf3YoS6vwndzfISP3+YMzh0Beu8wsPAqdfvn/W/dbnzI2sRAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGXu/zYJCUpDMFqnddDcCN8rGa0wkvJaCT13j3sUbAbJmGuCU07egb+05X+aayiNHvZLl6e
X-Received: by 2002:a05:620a:d86:b0:7b7:7d6:dfe9 with SMTP id af79cd13be357-7c047c4ae35mr2575805685a.48.1739225509125;
        Mon, 10 Feb 2025 14:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225509; cv=none;
        d=google.com; s=arc-20240605;
        b=RGGTkLnKuToei+bXb8Gt2QotM4XSnTsxF+a3nmYPlYbLDtaAoCFD2t2/TGTiyaipRB
         UajQCHFUut20tDm1NemNNYwA2T5OBi31bhsBptb0B3opChMvCfIDnLP0maBgqvl6/MQw
         UjvT2LYDTg38tDLr4zunEwRAzVuyjTJtXk4+dMPrunPUZMOxz32/7+Y/tx+IMZDeQQ9H
         5PgOUBuyfNvQMJfJjXN+JhtzXHUyH1TvmwW6oaFcdCop8qy9rLMLmNX2c9I1+t6WHPUF
         MEGWKPuUag/m3EegdtxfaOAk0JJICbCpe7nJ57wIU1BiRcDqJK9siJTSDAKe0WHfpKGD
         qEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W5LEXqAUgggiukX7b7gmDPOVaASqTo18usIG3BlbuxE=;
        fh=ap2bEHHrTeAyuR0DQvoEYdGK1MvFSIwWOcFvPBc5FnI=;
        b=eimbx1ZiBVF728W0+djR5k9y5yClYNdnKz6u8itX5gRqCLbuDC+2EKjk3xXD1+uFFm
         phAm2joOpBvmC0L21oUyw2VOmsjT1BM4o+B0j/C6+xrPoiGZQs91x6oFtehBg1wy6oux
         ID4Aw1zH1yDjQvSHm1xZCdR9r4QrAHSAimU3OQwYLyfgqbBkbpbbHCvUYQ/+TMiKbxnT
         zSxOg7tHoM3M5HDh3o2wRNgtSEMd8D8IjIxkHhucmUzNcfrWZGXerQBgeU3+pt9ootRz
         wD4cvEpeh/GTWlHbZiOT2edAUL3kZzVn0Cs2sK9lSU3pNtGDCrQNiIWQzZrjNTIkQc+P
         Z1ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/xjkv8s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c060f1db3dsi215847085a.590.2025.02.10.14.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/xjkv8s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc0E-0000r2-EQ; Mon, 10 Feb 2025 17:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0B-0000kv-S3
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:11:39 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc08-0001At-W3
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:11:39 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21f5660c2fdso63733205ad.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225495; x=1739830295; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W5LEXqAUgggiukX7b7gmDPOVaASqTo18usIG3BlbuxE=;
 b=S/xjkv8sd4MHiA80cZ/3gt6fsQDLLaMiHcm4UUYEye+eZfbwWAXdIzzL2wBCZPsnII
 Sf6u6K9AhdBwKwqQhcqui1lu6DVNSUg045FXgqvjHuHb+Z4s9QKfSxdv7GcJZHmetdVe
 VJDFf4ywIM7OFPByzey/nQR4XuR4zAkxcJ9S66JCcMZ+WBUq5mNx1AP0R/WUZgG8gpT7
 4zAoI/+R+KZdirXbAC9UzNIjAYA2q+tMJfwzwcUsd1yJnixZ2Ghpf2xmASy8PQLxh9o1
 WQyD4MTec/NsJWh1lqpcdfKVVxjADvNms5OP4SWwKfJXL5IuWePv+e1ttcKenbyfQkMw
 uV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225495; x=1739830295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5LEXqAUgggiukX7b7gmDPOVaASqTo18usIG3BlbuxE=;
 b=ZJNavhBURo9+RrFhx14HVVU0GLJrZfnMANn2r/q0WzUbjkWRLCN1uGSQMwSj2oqb9U
 IekIZDFXBycq0hSAqxZO8ttNAqOFJsg87Ru3gjyz0rtVJb+Snh3dksxjtzBa5GtVK7oc
 iTNnhcc65k2KspeWWpJGi86k6BJIUttGpV1bBLQ1jz3IdGfZKuZUal9V0yMzzbrnEdMa
 swVu7JSy0q0gcrDrsH+egv7BFDM5ahBz9kNe7eL8AeJmeZTWP9sQs5ZGF5yPZtrgweyV
 rXxEX+rKqpvOGG9xNE8bqpDihaZVVHsOulItkv6EPR44OB8CFggxaLfQjXIZbUFBQXT9
 MAZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8dqYlTTdWTHnfjZw+Ry8EvPrhUbPl9xaqUvdlb57JIORTA92bkOpXCPHbHSUoJH/GaVD2nXqyeQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYD6eBfjpexhnw8NgdwNgbw/Bdz2qAKV3kGPhdps5l6jw3rFbs
 uiX346bh93EAv2uBcFupmOK5Mo4fNnrQhup1C903uWcpdA1jT1WO0zjbyukYJ54Nl+g2+bmzW+y
 2
X-Gm-Gg: ASbGnctVFIgNFfZXzri1AL+mK+n+RzmcHq+k/OR0UxqCyzvvXshDEdoMTjJPhM+GZvf
 5GfWqUIMYBtL9qGJTPVxnb2AryYRK3/1FZopRlmPTOcBSUUrE3zZ0iwtr9/pj1OT1CrTVsz+P/K
 kTTv08Psl1RvdqtWp0s/KYl4UqdEDgxuVc72j2sE7rG4sXledtgi9qpkNca5iAJ/RYSB+SibRh6
 Uo29yoboUjg1dGT5liCV64xSHKvU+x/EJqfZ6L5CkhgKc9gdERg/qzcJkkccXJVpemz72nD0mOv
 nop3iUruLvKTaz71t9nAK17sKT77S9su3bp0T0dqSQ2oIU7xsJvo4yw=
X-Received: by 2002:a17:902:f78d:b0:21f:68ae:56e3 with SMTP id
 d9443c01a7336-21f68ae57dcmr174467065ad.39.1739225495399; 
 Mon, 10 Feb 2025 14:11:35 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653cac5sm83914835ad.76.2025.02.10.14.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:11:34 -0800 (PST)
Message-ID: <7c75da5c-4c91-4a06-a7e8-ea5ab5fa4398@linaro.org>
Date: Mon, 10 Feb 2025 14:11:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 3VmQZkP8hReA

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/microblaze/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 13d194cef88..27089e3c579 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -224,6 +224,7 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       info->mach = bfd_arch_microblaze;
>       info->print_insn = print_insn_microblaze;
> +    info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG : BFD_ENDIAN_LITTLE;
>   }
>   
>   static void mb_cpu_realizefn(DeviceState *dev, Error **errp)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
