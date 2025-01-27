Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2721909njk;
        Mon, 27 Jan 2025 13:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0pR4+tF6oVX5rkIt9FQR5vIQuVUW2w1iwYRKSQ6rEbyHY4DG6YOrSdsbF2gbwqdXgXUXBiQsInRDxPA==@linaro.org
X-Google-Smtp-Source: AGHT+IGFuMmcrSvZicySxL8RVUyf82T7b9fT/GYXaIie4rrHC5tkBR8nWeMVqbsHzo4hxJnfTNJj
X-Received: by 2002:a05:622a:1314:b0:46d:faa2:b6dd with SMTP id d75a77b69052e-46e12a627a9mr669083311cf.14.1738012967652;
        Mon, 27 Jan 2025 13:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738012967; cv=none;
        d=google.com; s=arc-20240605;
        b=EdBexfgv/quM2/KdJGqDH4xeRitcyfVbcXTEn20fotVN6K7Ou3MkHIufvMVBBMIjW2
         tJH2LKj/ApJiQ2g7o26uR8htxsYYhejbwmysLaLBd7DhazFmQRLStVIkHYEjxK70SSkv
         yiRM5iil8MlaRxTgJgaNZH0V9tXFXKBBu8QGkwtBvumvI+xqhIHJp7mqzLbk3tjFvYWX
         Fatm9N2mxaMEBKndXECPFI8i2qn0S0YPtuKlySgiZ3TAJHZgakMRvZwOg7j33NmISN3y
         89CJYHBu3XgUHtY4xIrbrfpUGHDHWxXDSP9jeHvn/5W4KBQpM6N0vEPtIjIO5QFpU0zp
         eKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OW2HkPPwANqK9qN6DD8X5NCpTyrVJpv120SbiG3owM8=;
        fh=ZemggdAqcroFHMbYH3cM9g+CglCwq0TBpyUOxrbj5xY=;
        b=k5SqJrvxspDJBhPjHtdE1rLlDbY0UXuCefWJ6jG0mgU3nZnw2AnO1hYRWWDh9/zjH6
         p0kv2DTU4zBg56sQJZ0aBmKP972nOYO4CZYOezN0nImwgNWBA28UcIXN26OZ2XhTEkCr
         LverTr1wfxbaZQiPhG+LVQZyqaQqP1zedMnA9kB/4QQ0Pu1W3+MnptcD5yRfnXPw5QiS
         V7kO9tgwqeYKCievBHyJKofWMaqR6Frbs52vMi0c6v/JTdHZS9ROlHIHxoFubcuJY0Vo
         HvrFfOJzvKTQl7ZrqNDLb0CqH6TTtVVBnwyqBR0ix+dM9Lrz2n4TPcOiXe7aOCF8M//r
         /aIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJsc+q0D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686be27si122359931cf.48.2025.01.27.13.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:22:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJsc+q0D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcWZ8-0003mq-9P; Mon, 27 Jan 2025 16:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWZ6-0003m3-2J
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 16:22:40 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWZ4-0002PD-HL
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 16:22:39 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-216401de828so89874485ad.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 13:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012957; x=1738617757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OW2HkPPwANqK9qN6DD8X5NCpTyrVJpv120SbiG3owM8=;
 b=tJsc+q0DbSO6QZ8Xswco8OrlcqEgAFed6WFtgd8K9DNX0SWqmaVpkIOp7ngMQA9haJ
 Ynwkl7mIVyA2pBXYVOqSJOFXS6zHXle2vaCICT9B0Rbmowizo/pUKX0SWUvBOcWlroxG
 uIM2RheLT8cEkl0uDXE5zlrQpiB3/30qI38i6h4/dyRT0oVKEBweuF6cO8DjNw81wxFs
 WsOmknvQs9IFCtmdtHgOd/zVzPqp8OcLZFAzQ/+OpSy4JtAniHq4UhtPNRtDWQDbbd0C
 PKBkDgnIqsCiJdGD1riZxeqNUMyDCBqK5TkM/CExlaj5A7vESSzECCmJF4itKJaqZOnq
 HI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012957; x=1738617757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OW2HkPPwANqK9qN6DD8X5NCpTyrVJpv120SbiG3owM8=;
 b=oMu0eW2CykJv3T+RxpQuDPC9J0oxdTl+HvUIbhTz8qYt3Y/N3iWHlJNZlotG/7U/Yg
 2lgcR3cbphe17lPBmp4v+P51Wijjr++RT6eTirXtu6NYr68bMosmNN86bMq3JxfgcRA/
 D3CvBwkXl4U9sQoI2C3WtOb1PU/Qo1kXG6bmjOo7a3vdtNl+BLFxlbpIajn4ZAO/Yb+M
 iKUxTE3t09icMzoLwY2x7x+c0pOf/Z64x1ArNSTw1kh0x/91LnJkmxmkeW13DJ/38k45
 OHOkXOXFfGymCOZJ6GpYhwUiQTEWxaARHGNkDVNVMErWt5PoGY8TSOFAEuzZoLlViEnf
 RHNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKjY/Y8Tjj2JmLQp2sglW79y4jvkpkOrCrSGBYK5alKvrmL1FiUMUxYukktG6o6xDd4J+JStTm+HTA@nongnu.org
X-Gm-Message-State: AOJu0YylV/RxdWl18otw1DHIJjxhcnUD2iZqzC09LHhAa0rz1Se73kps
 WYdi9GWinUBtSPTkBfllCWzfJzsl8o19JBpyoPt62WyTYyGP9suzhJaZ6iyJu/w=
X-Gm-Gg: ASbGncuotl6xBvyAgkf2sH69qneDGt6+qcRezM10Y0Ri4W4+wgsPvx7bElMFI0ntzgg
 oFDk/soU3I5GpqAN7Pb7MrukvQPhgtxe6cnOpABBagGwjyw1sAbe2e/9Gu01VtxRjnBvzMYf7pd
 7u+GwLkPrgnfMyUiv47PS6UhIA685EBIZ0LDWZJDRZwHlzCQyTv+HkUjCwUyI91/8ruMXGMsQM8
 9UJrUZqQ4jZKCdRIZlc/TLGJEHckhDTVgCuqGqO5X2GesRPhwrnRCEuM3NqCTEMA/MPZAFJKIpA
 HmorO7PzcvzyaGLadGK3ogvO1wcP8I2rRIl6/tNrXawASUKs9+uNW47IRg==
X-Received: by 2002:a17:902:eccb:b0:215:97a3:5ec5 with SMTP id
 d9443c01a7336-21c35503551mr677022635ad.22.1738012957099; 
 Mon, 27 Jan 2025 13:22:37 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea4200sm68881735ad.88.2025.01.27.13.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:22:36 -0800 (PST)
Message-ID: <ed920ff2-2bf6-41d6-b67b-89aa34c4ea2c@linaro.org>
Date: Mon, 27 Jan 2025 13:22:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_ram_sym()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aFXfZbBwikkY

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> Rather than passing a boolean 'is_big_endian' argument,
> directly pass the ELFDATA, which can be unspecified using
> the ELFDATANONE value.
> 
> Update the call sites:
>    0 -> ELFDATA2LSB
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/loader.h |  4 ++--
>   hw/core/loader.c    | 23 ++++++++++-------------
>   hw/riscv/boot.c     |  3 ++-
>   3 files changed, 14 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
