Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp603259ejq;
        Wed, 24 Jan 2024 15:18:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8S9gmBe1wtRE0CEL15MGTsA1UI0seuX3UlRRJimfleZN0eYH4z8VBkBs0jgWFq91JaPTT
X-Received: by 2002:a05:620a:36f2:b0:783:3c71:fdaa with SMTP id cz50-20020a05620a36f200b007833c71fdaamr144212qkb.106.1706138306305;
        Wed, 24 Jan 2024 15:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706138306; cv=none;
        d=google.com; s=arc-20160816;
        b=spZgS/qI9GhyDmqahZYIWZCTPU5K6UvwDI02Rz8dD43Z8FgoYVfiKuPcZM61gXILSm
         JpXBtDKRBwPR+J0kIT+2JtT+sVGnTnnpR/88/GUdeJRuNEdA+lKBoPE/cmIIyePdgHi+
         /io7ccwwSJNYGtR2V/VoVmIf/L/x4lNTs9AXAtl6dU26gyPM4B4GTK1vL2uN++DFJtv9
         F5uTJgl7anqB83ZblJrKo75l8Uo5jH1wyrT0KTIXSvZ22xK0BT0ZsVOMe2WSKeanMo49
         01hSPngHxW0n8C5zFyFEx3tLhGJ8vmogVU8Chq4cHvsRcOQmba3n7fLpH0px7riNBQpj
         q27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W6hHELT1Cs1XXl8oCVlrvXMDWO1i4PgfYwTjGwgOarM=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=hfB3oajr3EbCbebNk+Q2tniNx2VeRWREADoV/Puj2fQa9NDwBa2BD0LsrewZge/Udf
         v57YNnLHMgVEEUk2xtQ03vZovT715zonUwNh2HmDzHXl28HLsNdhyMvnrAMhgj7I2GQr
         aJAuCeYQ+xUCK73eVzReVAWfLzUEMOav/hbJD1JhZ4/TmOlhl+nHCgM6rBzj3BB8YF4Z
         orARXbLIdEhF8tlJpdy/HoeZP0dP4EwAlZasDJAWH9GXrBng83rjt5IlaRio2iHiYz2k
         Af7qvJE6fgkyDlmfciEbUCGf9CmJvWw7er9DySQbIaA/5DAqB9pKmkkveNvXS02ZgXaO
         F31w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sgV9aA2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26-20020a05620a0a9a00b00783b630ea71si2000792qkg.365.2024.01.24.15.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sgV9aA2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmVd-0002Qn-9X; Wed, 24 Jan 2024 18:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmVb-0002PY-Ab
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:18:15 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmVZ-0005iL-ML
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:18:15 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6ddc6f5eaccso152841b3a.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706138292; x=1706743092; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6hHELT1Cs1XXl8oCVlrvXMDWO1i4PgfYwTjGwgOarM=;
 b=sgV9aA2e65H9rKm1ERYGDHBDXgJ6fW97+NR7Z39PzXVZss6se/C/givabwpfVQl1Iy
 rDJE4FlvILNg3uUj/xUHDGnY88AAPUVBYsKH0LG/00GBGyqrB71NT0VT/+Yyjc3NlxMB
 zqX51QMCO1XnJ5KK9GllZG9vWu5LAhBfSOUOK+ZNzuOTIugKGiBlDmjq27pbV1D8CgUQ
 LWv+Oaf88NUJtFLqTbs1OjPfhAgowruCTlYkrwYwrBpV2UElVS3GC7pPB++Hb0NbhbdN
 fPE6XakSbtA3Y0TGRY8rxCEdrOEkoP9o1pxoOcWKfO2ICnT+nNp0l6NIJRnhvoX/0MTb
 utZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706138292; x=1706743092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6hHELT1Cs1XXl8oCVlrvXMDWO1i4PgfYwTjGwgOarM=;
 b=aetys2bRGFgOwhJ6Y9bQuwI5FpY7r/aUEUHbU+dCrwDyO6PCkuOXlFc6H+oOG21lQL
 P3InMGG11ci1s+K5lS1r5VgVPmGu3HpPziK8p3/JH5cJ0O79OScQIPXZYJ9FgsQcFbGf
 YoDQ0igLZePDOaA0jMnYodyQB/Ugc9JN5zca6HvQR+0FPur7gFwKuMW6V0WwP0jsE8qM
 Hadg9MrDr2Nv2COMzXaUUO8nUrJIKk10kSTtPltf0xn3z7XRvApTdNk3eUCVWWFApCW8
 llex/q6loCSItdf2+oIEpf/ye60Na8OfB3xTA43AdPtUHpGi02saE61jPAU8FxOxBnXS
 eKjA==
X-Gm-Message-State: AOJu0Yz91hML+1lvffB76x6JGCyCkSHpjebR2juSU4ty0Zuw+FcKSsw4
 Qr5FLPqBmgAu7U+lJyJys+R1RHeCQET9NPltPXMTIvGCaIXlI9Ubo6Xu2UiYdqA=
X-Received: by 2002:a05:6a00:2285:b0:6d9:d71c:d1a3 with SMTP id
 f5-20020a056a00228500b006d9d71cd1a3mr278597pfe.66.1706138292138; 
 Wed, 24 Jan 2024 15:18:12 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 ks11-20020a056a004b8b00b006d6b91c6eb6sm14657150pfb.13.2024.01.24.15.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:18:11 -0800 (PST)
Message-ID: <64b7a417-35a1-4674-ba74-cf7149363358@linaro.org>
Date: Thu, 25 Jan 2024 09:18:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123224842.18485-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: 556isxySKPia

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> Aspeed SoCs use a single CPU type (set as AspeedSoCClass::cpu_type).
> Convert it to a NULL-terminated array (of a single non-NULL element).
> 
> Set MachineClass::valid_cpu_types[] to use the common machine code
> to provide hints when the requested CPU is invalid (see commit
> e702cbc19e ("machine: Improve is_cpu_type_supported()").
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/arm/aspeed_soc.h |  3 ++-
>   hw/arm/aspeed.c             |  1 +
>   hw/arm/aspeed_ast10x0.c     |  6 +++++-
>   hw/arm/aspeed_ast2400.c     | 12 ++++++++++--
>   hw/arm/aspeed_ast2600.c     |  6 +++++-
>   hw/arm/aspeed_soc_common.c  |  5 ++++-
>   6 files changed, 27 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
