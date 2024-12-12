Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4443236njb;
        Wed, 11 Dec 2024 16:01:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWi8+k9Ll3CEcSuX7n+7juuDpxsW2NeScnC2hIRHfG6bqpk+sWuzPWF6H3dcsg2eMxe11oSXr5VlYJwDw==@linaro.org
X-Google-Smtp-Source: AGHT+IETsRoDdV1I2RAK0rDv4mKsJmTKAMS1VPwRksDCYt9PiLL29CwDXvWm8VSeWpSTJ3IoBO21
X-Received: by 2002:a05:6214:b6d:b0:6d8:8b9d:1502 with SMTP id 6a1803df08f44-6dae39ab3b8mr21402846d6.30.1733961698419;
        Wed, 11 Dec 2024 16:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733961698; cv=none;
        d=google.com; s=arc-20240605;
        b=PSge2FbzoKDVT0w5pPT5onMQb7Xa1+eam1ln7m/9FEMVO6VDwpjyVJTeGBviR3dLN9
         YTntVsSh1E/kjsPoatLo4baBqiMMF/eltkxhedzXI44xZLoif5f2t3G24jPDtv+hlP86
         7mBXIT33FcDOgbt+xj29Xqpmk8LoCBUvctEWmJEG7APN2wSBlxyfnbkjqCqx5Hh59Z4q
         LaB6bQtGaFG0UYU2/LDznsik4tKa4N5FQAFuVB5kisvhDzwYEogPeKYZrbFrfy8BtlG7
         G9qF8rdKvc8EcXHgOf/g87IqVU/3ppO3RbpQBh6nzvtPgfSYuUJ/jjvm1rOQqr4kZgOl
         ny6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xFmKzDQC9Q1eVnjpUWHdAZRkqcA1HIwlGW/yL4lX2pU=;
        fh=RHH6RMeh5m6AiBp15ZmZ1uo2/TsLnAkzPMBtJBymoSQ=;
        b=Jhlc1IY4P7rpvoVSr6V9O59oCqLoD/HD3sMkmdxZq3RAUH+nm/OYyK3F5/L/Sfxq/q
         GBi+KTFEtquzOnBxnyy0MgSglnQxsbxObGVBtClrxASjBevrTT39CKvJkbGrDzLidhCM
         a+nY7jnEORQFwPg9BbkUdmkL1/TXqy0e1MPhNrps0EYywi0071+MTmy6XV+uBEF6LX1c
         2UY8ImkoWHhO51e3kmGK9GtpPRN2JelyHOMiFvvwLT34LV0VvPyKl96wTXlez3EsoNA1
         6Y27SAC34YScoaI0rNqVqINucJldp79ytdtqLf6aGpVO/BdSwbvok4Y6COLfJhca6/cP
         LUGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcdj9CO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d92e7582e2si57288416d6.103.2024.12.11.16.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 16:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcdj9CO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLWdg-0003GV-QA; Wed, 11 Dec 2024 19:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWde-0003G4-Uq
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:01:06 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWdd-0002yH-C2
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:01:06 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-71deb3745easo16517a34.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 16:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733961664; x=1734566464; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xFmKzDQC9Q1eVnjpUWHdAZRkqcA1HIwlGW/yL4lX2pU=;
 b=kcdj9CO3UVjJNgb8HCQuE6Xenkqq+GbwMAIt4wSfGwDaWqLw2N3oRKPcyy++5XAs9T
 zU9TcLnGnoTeOGvgEeZhmVMQqffp0doMJ/1sX4J4F8+JlDQ5BH9C+oSBt9zlPEvO8I6h
 nfBK4XOnY38Zxsyo76OCjHU+BAD9clRmUAGxLG0lZbXoEiGE4jTaSoNvy0Z1zMJTc321
 yDuBFNz/OSiU9duX0NCDj4wgOy6ClGxYJbIUMRTe2BbkDpQHCqO9i3HdSSnI9X/CeFOz
 zSPOYz/eQXA5JqEI70kcftLfjQO7oi3sxZtowJlDSwhXI0ehBtfsZ8Cpft1NMQx6GoOO
 JbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733961664; x=1734566464;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xFmKzDQC9Q1eVnjpUWHdAZRkqcA1HIwlGW/yL4lX2pU=;
 b=UJ0qEUGgWxgU01JjBoutunakmq7EP4qi8x3fpucS08lW1L+HMUrtAhTLd50Cfr7b1W
 Jwt7g7cu5hUTJ6ExO904/gZUn6xfhX+m4KUuzJXGYQgG836KK3COIFOdeuDl1hcVlXmy
 DDyhLhxMMD50K5mR650uu/dUt7rCILpnVtfIwP0Z0HIKI0TSxQoegucyzhVle7+ij1fL
 7H1sNRC/7cqF/HJWAaddD82XnRUN8uE6TqGh/EiDU4Im9T0wVKUdxXl1FX6fKF7b9Vrm
 QwKQeIy7YYzZhO2Mod0qwdsE6Y225mG4fY8qEjx9DY8mO6F49iPEcTCC16FyrH/6B0db
 xZ5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIpe9Ys+viR7PY26zOFSPXUWUhWx8zYYMfKkwPdn8LBw+J7A2DGZ8oqhMLhsmtba5ZuJrrlidVPw==@nongnu.org
X-Gm-Message-State: AOJu0Yz0ZpZEisldA+Li/6DuSsVyhSTy1jxd6Gm1p/Tckq1l/M2nl+N9
 QOJoz0xd9r+aoCxVhzlWe0Qm0hD0F0FvSCTwlVUv7iMdNoZg4LJjFQTjbubSq1mezXDdyJs+67x
 6hSRgZDTb
X-Gm-Gg: ASbGncu67v4hWeJNbuM5imYM3Mk7phY3eUvpgz2ma+cfK4TGvnbHwlalNGG1phvB4GD
 1YKlGiWcNH5FZkj+I8u1guCGBa24D5lxE7YQ0qTtnIYQJLVuXTG9HyDJLfe9xY4nazYmdE3w6uN
 bTdw41TLM6llZ677sRRdfr/m0jVgXs5EkbqTsXc0VznGSia+VNXWvLd4P1Zb7CMFsNm1d9HJ9tP
 MCCrI/9g3QHOaAo2STrb2r3lkkZj9htlMGUgg930s+dyIcx0vTi10aWRr+VUsBtbD4voVAYZ2Fv
 2yAI4mxdLnw9juyOUoSRBMx5fOQM/O+p
X-Received: by 2002:a05:6871:7a3:b0:29e:777f:a1f with SMTP id
 586e51a60fabf-2a012b4f753mr2714926fac.3.1733961662168; 
 Wed, 11 Dec 2024 16:01:02 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2a003ddc6bbsm1022049fac.6.2024.12.11.16.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 16:01:01 -0800 (PST)
Message-ID: <bb002f33-8cb0-4318-8338-8ef0b2d84c23@linaro.org>
Date: Wed, 11 Dec 2024 18:00:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] hw/ppc: Include missing 'exec/tswap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
X-TUID: Yuk4S1NjoWWM

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> Some files indirectly get "exec/tswap.h" declarations via
> "exec/cpu-all.h". Include it directly to be able to remove
> the former from the latter, otherwise we get:
> 
>    hw/ppc/virtex_ml507.c:123:19: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      123 |     env->gpr[6] = tswap32(EPAPR_MAGIC);
>          |                   ^
>    hw/ppc/sam460ex.c:238:23: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      238 |         env->gpr[6] = tswap32(EPAPR_MAGIC);
>          |                       ^
>    hw/ppc/spapr.c:1617:13: error: call to undeclared function 'tswap64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1617 |             DIRTY_HPTE(HPTE(spapr->htab, i));
>          |             ^
>    hw/ppc/spapr.c:1406:55: note: expanded from macro 'DIRTY_HPTE'
>     1406 | #define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= tswap64(HPTE64_V_HPTE_DIRTY))
>          |                                                       ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I suspect that, like Arm, all of these could be big-endian.
AFAIK all ppc reset into BE; the OS has to flip the bit to get into LE mode.
But I am less sure of this than I was for Arm.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
