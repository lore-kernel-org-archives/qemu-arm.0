Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2366513lfm;
        Thu, 30 Apr 2020 14:03:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypJCS/XL0TtKMqKIcXOD+sqc2IAakE7HJCloCK3JPZ+GsVlechaXenwOEU/NhIfBvlON8WNe
X-Received: by 2002:a37:27d5:: with SMTP id n204mr399891qkn.425.1588280603632;
        Thu, 30 Apr 2020 14:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588280603; cv=none;
        d=google.com; s=arc-20160816;
        b=GXctQrODWGhRWvb1a+RiH9lVPIICMMp7Sg3hbJaqctOz9L7cJuRlNsbAs3AgpeHXPn
         TFMolHfkll9JnDDMAnQFxX9bDtgX1VcA4Nwdp+vYVHVkdn3YzkLj/LwMp1MsFuWpSmYP
         2Hb80WEDyXe33fEnXfc4W2tv1HuzGWMRRIsfbNgAerJ8tDHT20k/rPonFV1rWycpEGfV
         M9GLPIhrLkumq9udP4DcRoqyp8dYFDSMlkAkf+6Vn/7REhaTN9uU1y/cdtjrEGtn+4Mz
         XwRXJapzzMzOGQM1vPRzREyUfpF8B0qgN/aKgto9T5q2H9byG1oTVenPpSnmJKHuT/mj
         ZEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=syP61VexkoQAAxyuK65YJsKWhf8NpTioloMhS9Km3MM=;
        b=oKPVXGybk5VT6J3ok62uVpAO0+UP8Jh3B+TBQwf8Rfx47FvEeAFnkqLJHshURp+y3F
         0ncZkdA19UV9bMIhkUwGaSYD56v5VcBy5T0L0U1WPD+YZ8i6wB68T+vcu5FFqtSUt/BB
         9EZIPlimd/0iXfdRH380PQoJNFeV6yY48NLpYbI/pQ5Y8EvuBvl4Kaxm9/fqtMeRYU9g
         msGtaBkFENe7vrj24x3V3gcrdafv9R1rBUl2Hl9nIbEZ7siBO+CELoy3fCycUDAgegvy
         0y5LqhmDNZFZYBHYi2gcPoym+/w4+0BIkm3u/UL+urWHVm0JmxsHBbuTU5V3iYDsNOwN
         daYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VvPDBEfJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id n6si553609qtd.100.2020.04.30.14.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 14:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VvPDBEfJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUGL4-0008Be-VH
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 17:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUGHH-0005Qy-4D
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUGHF-0002s0-Fj
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:59:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUGHE-0002oI-Kq
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:59:24 -0400
Received: by mail-pg1-x541.google.com with SMTP id l12so621298pgr.10
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=syP61VexkoQAAxyuK65YJsKWhf8NpTioloMhS9Km3MM=;
 b=VvPDBEfJ+M2OEkq+qxXVu1rnwQ5qaCrbJmrxg04G0NYod2Ox0fU4PDS9/ooFbeFmL/
 pIsx6oBIMB9BHh9+0mAmf/Qry172ajF+HNP95DDiLoBfUJfsAkZsTfVZQ2hHpTf1DRdp
 JOfF2/QwTUmXgOSqVjv3y3mX83b/vxDnP+JuG7LE5IRsxiGyOQfS9YAZuy4CCVFjqrf2
 sFO8YIM0lUpkT3l7D7qOMyE9IR+yM8a2XyMyvPivoXNNm+b96w/SKgNFPGxwI3DI9VvD
 2uCpCM1rFDsblDsSFmVe4AZ7e3niGIjC0CApVfVXjy8z7wGkgIG9SnL1/hssAH9mywFE
 0wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=syP61VexkoQAAxyuK65YJsKWhf8NpTioloMhS9Km3MM=;
 b=LOaEVqQG2xckfN6T2pZp8EqOzKZxbD6dgXHWvM749M4tlS2utBy/nm60zQYDdWScLT
 7p+eeTUrYDYZmWlEFP5DXrOl20X+5IwT8jUrfFTWugkREK7Wz2cFvTB7uRKk0ZWvaYjf
 mEieJwe970bsiq/oZy8MlrLbC2E/KK/1EAv1V45Zx2KBXHyf08B5zZWVqTxeNNkmwHkB
 KgJn/4rrb+x7A7YqJP8ii3v25U3I3ud/VJH08tmB11dpepBb/EXl4XeIFc9UaVrmzRSs
 zEdmDDaV4srRPLU2jenvP5vSctmi3f2OYkUL43tLvOjUfjSLD/2g77Ob1lKLoI3GJuW4
 sC2A==
X-Gm-Message-State: AGi0PuZGSdvlxpVEtv7VYlI8Q2ZFnK5nd9V+Ss1bmx4k8EsO+J2ulb1h
 Gu3oLCJW8qz1dJ+9EMIj/CkRXw==
X-Received: by 2002:aa7:990f:: with SMTP id z15mr713752pff.132.1588280362607; 
 Thu, 30 Apr 2020 13:59:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a16sm578009pff.41.2020.04.30.13.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:59:21 -0700 (PDT)
Subject: Re: [PATCH 24/36] target/arm: Convert Neon VHADD 3-reg-same insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72c8792f-2ab6-dd8b-94e9-79cf533fc584@linaro.org>
Date: Thu, 30 Apr 2020 13:59:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SLext3E7wg/v

On 4/30/20 11:09 AM, Peter Maydell wrote:
> +    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
> +        tmp = neon_load_reg(a->vn, pass);
> +        tmp2 = neon_load_reg(a->vm, pass);
> +        fn(tmp, tmp, tmp2);
> +        tcg_temp_free_i32(tmp2);
> +        neon_store_reg(a->vd, pass, tmp);
> +    }
> +    return true;
> +}
> +
> +#define DO_3SAME_32(INSN, func)                                         \
> +    static bool trans_##INSN##_S_3s(DisasContext *s, arg_3same *a)      \
> +    {                                                                   \
> +        static NeonGenTwoOpFn * const fns[] = {                         \
> +            gen_helper_neon_##func##_s8,                                \
> +            gen_helper_neon_##func##_s16,                               \
> +            gen_helper_neon_##func##_s32,                               \
> +        };                                                              \
> +        if (a->size > 2) {                                              \
> +            return false;                                               \
> +        }                                                               \
> +        return do_3same_32(s, a, fns[a->size]);                         \
> +    }                                                                   \

Right, I just talked about the .fni4 hook vs the DO_3SAME_64 patch.


r~
