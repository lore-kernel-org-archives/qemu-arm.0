Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2817051njc;
        Tue, 5 Nov 2024 05:22:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQNAsGqvbI8JeJFg2ki37tsZUEtpxEFu0ZvXnKBqo1uO73lPIWmXWr0vJsyDLj/uSW/8x4FoZf6qimEg==@linaro.org
X-Google-Smtp-Source: AGHT+IH2izoN8kRmGQ+BAWpxTXwDjMagyY7Z4Fa6QR7PyoyIwwC+HUhVt0F6WGwMMOU2P/rfwSxx
X-Received: by 2002:a05:6902:2b0a:b0:e29:6571:b107 with SMTP id 3f1490d57ef6-e33025b5d7emr12508140276.32.1730812941529;
        Tue, 05 Nov 2024 05:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730812941; cv=none;
        d=google.com; s=arc-20240605;
        b=YfeY8cMPMSeqoh5dj6lpvaNvsWU3VntisQShR9FS/T7S3RO2/Yl29IF71GkaWedb4H
         fEXRWlVxsIxC0cOGPjPGRhSG6d6+9HwGc7KBp+viqNjgBi2QTouFW8IX8D9EAwvKD2U8
         HHkahsnENFl+HtEiKh+rWdYfKrC/tqIAsKm11NPIdV3ah8KRJ0JGVyguuAtGznNp8Oec
         RN/nGMVJ6JN/tuVlpnpOsmE3oNgeL4W5Zpd4dUe7+v/jy7Ux5g7cn+QjBRaRaMkTajJ5
         x/Cz983vaWVHNjqu0ocG1Y1zSiEJpRgNwgp6gAZxfJyXhObSAW14M2dlEoqoktktz0YY
         xqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w6wgqD+0FjdO6hWqjVzrKgK5jrcU6kuaYq0bd+BuPK8=;
        fh=dhxP76BSos0KJo9NVt1d+PdODtmZOtdMuoOYoFzEvss=;
        b=ZuZXQpr+AbZb9x5ZfQgpyir2US/qSqI1LmRJ8bSsAipnh00y5gXvHQYKYGJcYVxM7s
         sjUlMHEKJmtgt0UhPaSZGZAqsfpRnFf94ZlV8dDdIjkDXlKXS6ReP+p4PqfxpY23vDCD
         xmnPCw8EQuVHj/NIchnkTP2dejTYLnfuNQqw+bccfJzH3oHJn3aE+M6XrVkgIjsl7YDQ
         TIVXYbiUszHTBQ3zXGpW+AfTskCAYwAEz5LcMpsAxp5cswsYg+3uerL9/93LbLGTzJ1p
         2H2gEWX/73nsUj2WvQUKSF4WLJQ8h4Ng4PpQ5cLWSD8vheSoqod7DR0pDpRyqsmzYHUk
         PECA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LtCiubfy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f22c5si1347217185a.29.2024.11.05.05.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LtCiubfy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JVc-00067G-4v; Tue, 05 Nov 2024 08:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JVZ-00066g-2j
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:22:09 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JVX-0006FU-BT
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:22:08 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so34101325e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730812925; x=1731417725; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w6wgqD+0FjdO6hWqjVzrKgK5jrcU6kuaYq0bd+BuPK8=;
 b=LtCiubfy/UfvabTQdHkHlO3DqomUyj3my9l6GGM3WFdZbsW8SZBYlJuvHeYbY4St86
 fnwtknhIF6SeAPluQ61H8V+kG9joVDl/ace9KHZGpM6ByMrBVWsU3Iv/hYq51fhQTaSt
 URtArny1TVobVxoPhGHupwBU7POoau8ykYaES0PBoPu0uPLGANB+DbW7rF5ajLFIAnsH
 EvZtqr8sv4VYNeQdBXQv2F8O6WW/N2ownkHeWG933YTb7XLEwEOduhO4q1LqJ9odwNfL
 zQs9DfPgEaMwKlrNTjCQI8kUS8JShqYuaC86G2v8EyZz0YLXLpdvjFNf9Jxg/DPboAH5
 5U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730812925; x=1731417725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w6wgqD+0FjdO6hWqjVzrKgK5jrcU6kuaYq0bd+BuPK8=;
 b=T3iSylEIRKDtAexhCNMTms3P/I1bHEXHwEsVKAohye1Ka3sOUR5isKy7SHE+WD2v2j
 OL7WmXW9bSrVljWml/j5ewL1Ztjbcih77IVCkT3yaRi/EaLG0i/GWZMMr14TxLj3mpxv
 JipBNtiPxJt0NPPsEAFRnfOlNh8tK86Vss5LUd+5mqUamBg04QbEZTdUFExuBkVqEsFT
 62po03/KAkVQuXNv7cVBgxLyM9rC3tumOQP/RZCrkF2aZtlnCaZgLyNJCYvadpB3SAJ8
 ub5uJUmsmXS+PRnAay1KbS9K1Yx13nqq41Xl1Baj09b1mFdcbIfZKsm41wm6wezC8s5Z
 ZI6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQjBChJXOa+/Bfll6fHMgmYhZ+XZP8ldsp31o1g3t0PG0lX2cuk7MF1gH6v6IlMNh3UhPK46+ivw==@nongnu.org
X-Gm-Message-State: AOJu0YzEO+CWELBANtgJcDi0u67tTdpieXN1yWqoofdTm1MpdaMl1yT5
 gW27YjVwFTT9fGhzWuqrzDdsxinobVtmaItVQTwEKH6CEAoZ+RNfMWPrbtx8KN4=
X-Received: by 2002:a05:600c:35c5:b0:431:9340:77e0 with SMTP id
 5b1f17b1804b1-4327dab3f6cmr161568325e9.9.1730812925263; 
 Tue, 05 Nov 2024 05:22:05 -0800 (PST)
Received: from [192.168.21.227] ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d20sm16415297f8f.7.2024.11.05.05.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:22:04 -0800 (PST)
Message-ID: <31bf5682-d478-45aa-82b4-094ac95c2614@linaro.org>
Date: Tue, 5 Nov 2024 13:22:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] hw/microblaze/s3adsp1800: Explicit CPU endianness
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: +SnPP69mcxSn

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> By default the machine's CPU endianness is 'big' order
> ('little-endian' property set to %false).
> 
> This corresponds to the default when this machine was added;
> see commits 6a8b1ae2020 "microblaze: Add petalogix s3a1800dsp
> MMU linux ref-design." and 72b675caacf "microblaze: Hook into
> the build-system." which added:
> 
>    [ "$target_cpu" = "microblaze" ] && target_bigendian=yes
> 
> Later commit 877fdc12b1a ("microblaze: Allow targeting
> little-endian mb") added little-endian support, forgetting
> to set the CPU endianness to little-endian. Not an issue
> since this property was never used, but we will use it soon,
> so explicit the endianness to get the expected behavior.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
