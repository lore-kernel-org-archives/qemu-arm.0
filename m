Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp943414njk;
        Fri, 24 Jan 2025 08:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV89kg50IFMu59HnDPMcOQ/sNUNNOW+Y+VSanetuvOo1K1KKZIiPYm6Ap0HNURci8z5iOf+24fINbfP1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGfkdor0moVlA5VwcPMvPKoJnnAkKiUC2JhdbNchlwd+OdIcI9f2ydcKfYHGvNceFm8WXvS
X-Received: by 2002:a05:6102:cce:b0:4b6:1efd:5c with SMTP id ada2fe7eead31-4b690ce3fa9mr27167221137.16.1737737849066;
        Fri, 24 Jan 2025 08:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737849; cv=none;
        d=google.com; s=arc-20240605;
        b=iy5akPQRlyRYe/4Phhvn7NJxxay9PJKMGwCyLvkWpEKpaG6hUAuevBnT9FYvdRpl0o
         NWpwN8gmZtzKJUBn+96aTlMNINAyxA7aAP7ASzmxJH3FNlcKSMHCnbiBPocWdK2+Svfr
         DV5nnqQ6XRKYlwpmHHmFcRUJJ/uAsH/qDs1r0CGiNkPbd4O+8G6a1lbBqVbgibgSuGsl
         FD+Zs1fSLJHudDeddf9hz/6ZJnLabnpcXTmeG1rqQwzv6ly1jq6SkF6FbfQ2R+2zOpA6
         qCyaXPhr6W4vZTCURXaX6mGBiYwkRE7kJHw1ezl1U0BWMSl2gpLMgpvfkiGnzv1infHP
         EhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DS+GEE6KX53q3sVMWPF9TWLj/H4k3Fe7yG4YbLhXk5k=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=ggvxEQwPv8v/YZ3mWJv0EMFUoi/iua7OQ5uwT2tdssWU8cJrNDBvfyjrttWNerCbEa
         2jDEuREMna77cD6+XDH3nQ6Cpdq1FQaksPJKtLjdXUxqgAa92fhZOXGbxFK4ryU6/7eO
         0bAgNZa3n6BI2aw6piwGyLdVo80RAtjH0DW62944ar74G1cYikHshz8RKYBeYkljeyZu
         WdMBQHc2LXkgf9xUPX6xDNedFDPhqzbCxE83lPIWjOt32y0AyfKD5oR21ysojpt7Y7PX
         GuE78NuqZS7B0AABoGbxNmAYg2lXnXG5fmWmeIM2onTAkC0aU2PNtRGP+rhs/sx02BLB
         siQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHSm1pAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709754ab4si849933137.108.2025.01.24.08.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHSm1pAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMuo-0002tI-SC; Fri, 24 Jan 2025 11:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMud-0002dI-2R
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:52:07 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMub-00027g-GL
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:52:06 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2166651f752so38128675ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737524; x=1738342324; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DS+GEE6KX53q3sVMWPF9TWLj/H4k3Fe7yG4YbLhXk5k=;
 b=qHSm1pAlvRTxtIvbPsO3dHIEoWp50dthznPYzbmkXiIcfjSk6qub76DhJDddzHF5zV
 ndYDEypiXsaxmx1/WV1kjXDCUb1xLeyIG7M+UNsKPVAdLjpmBzGACKAnc4FQW1CY8aV2
 Q+r7whkXclVRJD+JaFwoXa2pood/bgv7MpDFWhL6MuZZmK98Tk/AhtTHjsOSIW0ztn1g
 YgJUR+6DR9wqmAwT78cUOlSgxmS0TtBf325wdHJZFbsxdxA+gpAy1oFUuny99OvbKdRq
 v0nXsBKx/NfoK931zG20TUDL43tujemGTbYHphMwjeMAVDXswy/T7feLtICv5inBUMv6
 W80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737524; x=1738342324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DS+GEE6KX53q3sVMWPF9TWLj/H4k3Fe7yG4YbLhXk5k=;
 b=DoMJfom4deLvQ6nRUSCQZ038+NBNTzXHv4vHLRDrv0tfyx/jbQKckOwuBOLeG7drmz
 TzNdy4CGwpQN661oK6bs6ZEoR6pi5Tp1dUA5JFHalz6OcIIw9c1myqmOczY3sHbD/lRW
 bcPgVHJA4ZMOIbCt6qu+lC/xfafT5VlMPdbJ41QumDM3JSXlfGoIBN2Rf8aLCU8V6xwp
 I5+dWFtS7wl/Eu20AnDLIDHB8cMsiIRoV1XBAtd6e6Pq6WI/N5DVqjHQOaaZenhL8UkZ
 hmnxY0LijrOZrrQTeDFI6oQuYWusr/gWeLjX1bf6HEDjINIJuYMCXPBz7GrR1KHF1haH
 On3g==
X-Gm-Message-State: AOJu0Yy16LBlt8Mib/O5exQfNqwCpi02Keg+MWNtglpqEGsvr+lCOkID
 s8cNBK6nfECfWiUOKKUAvEA0W+0GWLeNg+Rm47Hr04y9G4ufKuDODJ37LXkmdAM=
X-Gm-Gg: ASbGnctf05GVs7EyVLHV82SUavLUch3WV7CDozP3n3O6/FHSUX6MYVeLj8T1MwCU/xV
 ne3pzHY/JuEIuNk/SlL6DbY7mzoSSXt1EuUDVQACz4BnQ8JfFnvBdpZmz7UibjL34Vu0H4LyH9H
 z2GOTq8cxFdrMH1I1iwFm+k1jjcsqnR43pMJyUlTbhtpotyobOTFG1D2VR+fmKf055DNKfsxt3e
 C+GB09euUo4o27ywtal776Gwj5DyiQQg+D87t9J74ifsj/yhr4qqVBAl+nhjcpAb+4aiYYD/Ihs
 CQRBNyDiMe2jqWryIau5TyHm
X-Received: by 2002:a17:903:2447:b0:216:725c:a12c with SMTP id
 d9443c01a7336-21c353eefd0mr405666745ad.9.1737737524153; 
 Fri, 24 Jan 2025 08:52:04 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414c4a8sm18329385ad.162.2025.01.24.08.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:52:03 -0800 (PST)
Message-ID: <29baf1d4-9c4d-4847-83e6-c6673bfb81b5@linaro.org>
Date: Fri, 24 Jan 2025 08:52:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/28] cpus: Restrict cpu_get_memory_mapping() to system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: RfqZ5D113EPh

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index b7367f6d808..2402706c7d9 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -614,6 +614,8 @@ extern bool mttcg_enabled;
>    */
>   bool cpu_paging_enabled(const CPUState *cpu);
>   
> +#if !defined(CONFIG_USER_ONLY)
> +
>   /**
>    * cpu_get_memory_mapping:
>    * @cpu: The CPU whose memory mappings are to be obtained.
> @@ -625,8 +627,6 @@ bool cpu_paging_enabled(const CPUState *cpu);
>   bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
>                               Error **errp);
>   
> -#if !defined(CONFIG_USER_ONLY)
> -
>   /**
>    * cpu_write_elf64_note:
>    * @f: pointer to a function that writes memory to a file

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
