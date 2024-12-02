Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3209980njk;
        Mon, 2 Dec 2024 13:05:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBdRd+z3da8Bn5zTWpEBKEvpvr/Wir64wBxPTfJ4VSuPPTvT4CoLchKq137NKK8+Z5lSrolVyu4848Nw==@linaro.org
X-Google-Smtp-Source: AGHT+IHSLtZ5z2spPVqw7CGQGrWb1+FMi1IHJ03KGv0/CY8CzC7dOin81oNkfUjHXpH5uceawOa7
X-Received: by 2002:a05:690c:4984:b0:6ea:4b91:38d3 with SMTP id 00721157ae682-6ef4a0bd43dmr197001157b3.4.1733173521365;
        Mon, 02 Dec 2024 13:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733173521; cv=none;
        d=google.com; s=arc-20240605;
        b=PrgS/CiM+qz0B/zylH1SkYk/8PzsvNH96cjYNKIbZl37zgEFwkWOwjedwg+zmXNwKd
         lNrWHE+S915YKOVBTfcCi+Abn6R9ObDgVGxgRD2x3EVQ2r6YDuVyjOjyDTRlMCyP3qcn
         QtVgHerOEfiluN+FIrxg5a20nKivTMC1XX7QR2ldIdTTIC+Uz8N9bjXRiX+P4bXeQysy
         cPr5dQj4A2aR9VkZhoLIo4+rybpMlJNSExipc2sw1/p8pGnmou0YLk8wB2ND446GThHD
         bRZiCMropSbMqbu7Fk6nullV9XN/mH+/l685i1khXiF8yfaC4zqN80ufvaLouhtDe1v+
         meCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b7pHA1ZzxA35HB89aNQKhK/RkVG2io8s/fOWi0XjtcQ=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Bl1bf0mpFUOvkEgPNRlk52+JBodk9JJgNerwGIfCbNmC7//buMZ/VWg+4EiZK2eluN
         EPRfDGHLpx86xOi2By2hys+G44i0hJyv+AMTRsAwsSngmLoVWm1zjiSx+1gyOTrASmV8
         Rfi6OPuAFOYzKXTkPh9PxZn2zWyVbqYsBbKdHGXXeQYULYrfhwkHzIuw2b7wXApnKHoU
         d0mJxx4rXuKk8eGqGsVVivaLIP3usVfNcLzUXBhCNFdy8rRf27z+S2wKURgZBbu832V3
         JaWeWWPcKu7RjtVo58QERyTbwCB2T+1tpkMce7FQvRi3qxyAjyW/pWtafWz7NJFN70Dz
         K7Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8JgItxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6ef4ddf9497si11905417b3.467.2024.12.02.13.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 13:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8JgItxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIDbH-0003Fq-7I; Mon, 02 Dec 2024 16:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIDbF-0003EN-Ci
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 16:04:57 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIDbD-0004JH-LG
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 16:04:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385df8815fcso2148837f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 13:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733173494; x=1733778294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7pHA1ZzxA35HB89aNQKhK/RkVG2io8s/fOWi0XjtcQ=;
 b=k8JgItxv2I0fMvNcTqXDyJJdzU9qFErca8D/MDHA3pztGiZwLk26529nL6/4o34DX9
 oq1pmTBLLBtEJMOutNfySldOMRUvz0Ox5LYY359nJFIwHwpBiGElsqiMwPVE4pUgc7Iq
 Z2MpmHzquD1RLw32qOjqZRN4Uw03A9EPx1uqH7z+tSpChMf6UfSvMeECOuSnBxtvI988
 3tgZkeWJ+5ofcz1lX8m4O/LNYdlKTDtYJjiCryyqQbXlTXc7GeUkg9i6WaOFZ0aXW7/U
 OukXlR5r0hX180ms5UbDM8DGYG/K7IZPPHjeD9ozVJLKXuiz7GOyio888Ql9Yy+iwA1x
 C6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733173494; x=1733778294;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b7pHA1ZzxA35HB89aNQKhK/RkVG2io8s/fOWi0XjtcQ=;
 b=LvdtU82ofwmNhiIXbJTgoXVe3a1BkQbMzPqUPzdWvqo0R5HNOwdNqyRl4OV+INKd/N
 Lqwys9ayl6oANG9kcGCbB+Mkmfo5dIhEkJ+bV3+g+iI0mD3exDe0N/DBYHkLCsmEP4C4
 UP/WSGB6pzI/nphF8d99Zba0O0sp6LK/Krcf5pLui8hfgBYLb0pYjntTBdg6nblIvCUi
 uu+ilR8k1xF+HXVQyHTrRSSylO6jUIay3M6WGc0ONk5I2c9fBWSw/aeFcz9qU3E+GtdU
 5xw9Ldg2ZH0Ua7ujZUTh7Mq04A0jqUoNssrCBQbp2flsMEwueisW9ENJdj8kHoNTucst
 1HgQ==
X-Gm-Message-State: AOJu0YzIQlLtvqIEOXnIIva7mdB3A2FSXa1PPAWx7bC6SYCg+QLVWm74
 IW5huI42madK8XHW8BJd6yGhDOidS9vJhFVoxkl13Eh6M0uGEu3fRu5qE1x718M=
X-Gm-Gg: ASbGnctReDjChtZwvvM8IdwrXEmb8AS7x7RHL/sh7cjlgJ7ak9oRVrEgJAe8TFFT0Fn
 3FGX8HBLOYtPfOwxubevvcF+knAHsTfYHpWNZGOf3T2ymgDGtg99iwfk8RLyfLAnzHcAiF/5fz2
 kL/s2OiaXmZY7TplLpgL6oBNEugwOsltAdEOuTthZkv0ahOpEFvgie2cgNrigb9orW4H3ko2qUD
 sJn0+lAmzj1F5Zfa+7jmjlCSvQpve0xvh4ThVyKmcqz+1ZSnyghRmpalcoD+ra2WQ==
X-Received: by 2002:a05:6000:79e:b0:385:e429:e59a with SMTP id
 ffacd0b85a97d-385e429e74emr8527459f8f.25.1733173494018; 
 Mon, 02 Dec 2024 13:04:54 -0800 (PST)
Received: from [192.168.69.223] ([176.176.160.129])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d7611af2sm12092866f8f.22.2024.12.02.13.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 13:04:52 -0800 (PST)
Message-ID: <d4c27234-6f39-4509-9352-4e3a33982d50@linaro.org>
Date: Mon, 2 Dec 2024 22:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/67] target/arm: Convert CRC32, CRC32C to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-5-richard.henderson@linaro.org>
 <59d6b035-8be3-43bb-849d-5664bcd34795@linaro.org>
 <c626df3b-3994-4898-a97c-e4d4a45c6636@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c626df3b-3994-4898-a97c-e4d4a45c6636@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: MSowLBO8VgR6

On 2/12/24 18:49, Richard Henderson wrote:
> On 12/2/24 08:01, Philippe Mathieu-Daudé wrote:
>>> -    if (!dc_isar_feature(aa64_crc32, s)
>>> -        || (sf == 1 && sz != 3)
>>> -        || (sf == 0 && sz == 3)) {
>>
>> We are not checking the sf bit anymore, is that intended?
> 
> Yes.
> 
>>> +CRC32           0 00 11010110 ..... 0100 00 ..... ..... @rrr_b
>>> +CRC32           0 00 11010110 ..... 0100 01 ..... ..... @rrr_h
>>> +CRC32           0 00 11010110 ..... 0100 10 ..... ..... @rrr_s
>>> +CRC32           1 00 11010110 ..... 0100 11 ..... ..... @rrr_d
>>> +
>>> +CRC32C          0 00 11010110 ..... 0101 00 ..... ..... @rrr_b
>>> +CRC32C          0 00 11010110 ..... 0101 01 ..... ..... @rrr_h
>>> +CRC32C          0 00 11010110 ..... 0101 10 ..... ..... @rrr_s
>>> +CRC32C          1 00 11010110 ..... 0101 11 ..... ..... @rrr_d
> 
> We are forcing sf (bit 31) to match sz (bits 10:11) in decode.

Oh, indeed :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

