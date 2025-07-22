Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC852C83F1A
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 16:05:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueFSt-0002jn-Eh; Tue, 22 Jul 2025 12:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ueEli-0001BG-43
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 11:19:06 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ueElg-0004Qv-Do
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 11:19:01 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-234fcadde3eso65252755ad.0
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753197538; x=1753802338; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0sNlK1qjGzRozbYhoHXl7MpQvGFl7B576kcNKrPjaXA=;
 b=wsNgvcYM9fHjWTvkslgpKE6o01YIMx2CbZIREshYTN6flOSOY4BUix4Qwr8lGcp1Gz
 raC5pA4TST5cWLJHhMxUkan5HloRRhkV0bYRmCDwwaxm4zc9pnuTAI8kaD9t8MOL2mFi
 z3IOZ+E/qsdpjUA4rJQnRRWbbbdX0GlOtpSh76vIcTsMPa5LE59UN1/Fa++VqaZM+cm8
 ge0lpBUdtWjq6csBogPXHszafjWxhfYWyc3wfd4DbgVTP++gzBscNS524shmpk+TNYkw
 rv0G8yCnMNeaMWhUB5B1hdSaztFTNrY7aT2FQTVG7tZ/+mc3EmI+QXZeLoKC6+v5UJoM
 ERBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753197538; x=1753802338;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0sNlK1qjGzRozbYhoHXl7MpQvGFl7B576kcNKrPjaXA=;
 b=eZXchViaTL9L9h4PHPh83aHjxJvqPDlHPMFrsCOksdPdk7UoHvvDNPqvvSZf5pDs9W
 1WAU2EVLVwttlTajauwNqucbQRAZAqCTvO/ka4botxWWVyVPfWLyE8jVvMhuxj/zHZBE
 16ISjdnV1xq8vS/E+/ppzZmcZUABrYRYcZlZToMThmc6saw/ZKMni8PQILQ3jtrtW90J
 cmsd0E/gWZkyy6YQHdLrGVpL0rPzLKfgKZc54mfVYQU/3rYI64A3Y2CM9eOKJqKHJMjF
 Vrt/mX4S4/vd8+miBLulax55RSA1VyymzjBooZzZXBV7T6/2jKvG1V3OedzC3nHOgBvm
 5xVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGpSOz5w4WVi8v0owdaeYtcDEnEkRczLA+jSLjdXV+7AtZOZmplLHuYrgZChc4fqjTrVV7dF0eKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx79SnT0McyJDsj72JAbx+raeiRubr3e0ZZPXVgvhALqypSudJh
 QemOsMIEM80esTSXO6EbTDUsbiAtvSAorz5A+armm1QALZVQsgEUFIy/wTlYsqPIs8uhzhguVlO
 ZNGrf
X-Gm-Gg: ASbGncu+688xJIAxSJ2FVXs8+BkkXVEZna5VHvGwM81D9A80Cw1KTog7BgtcZQUScMX
 sChAcRjBDlHQ9TaFm+xhZM7VzoioQ78wiYSR7lsj2yt0r7V/TRdH6MFMtzsIESv4BLpo3qdU/og
 Vg2W25fwG0WE2BF83cm1srZLAZYIJg1EZdo1s/1hGeTW8ti/d766hyXvxq4/3nXmr/QzFfLKIzF
 GJe5z5jvPWCDcuf1auLfQO+xBYLg86ow/wrrjI1W4MPRMSjOouTV0Hi9M1VO54kBXynGH3qxDdo
 XyASX02QLrPRAkJH4dkU4yotvAJcXdiOrwSWunFsv6YEehUzM4duXD0vmWT9Jla73LJXdaePTnK
 nC1bZlruGJ6eaS5f0FiEHwCvDhPX6rFfNLlkAbh6OAp6pF8Q=
X-Google-Smtp-Source: AGHT+IGesIXdnEg7dnVlHdGWgfEVr+pzgTtenYpWBygppprS5V8oijkwAz4TYbI+J19AdCOqdFBAeQ==
X-Received: by 2002:a17:903:1b6c:b0:234:8ec1:4aea with SMTP id
 d9443c01a7336-23e2579eed1mr365484635ad.52.1753197537940; 
 Tue, 22 Jul 2025 08:18:57 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4c76sm78337885ad.116.2025.07.22.08.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 08:18:57 -0700 (PDT)
Message-ID: <2ded1ec3-4370-47f2-8efa-a244290ea9f7@linaro.org>
Date: Tue, 22 Jul 2025 08:18:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Fix sve2p1 mtedesc assertion
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250722142358.253998-1-richard.henderson@linaro.org>
 <CAFEAcA-_pYcxD+rCocqGJ5LpvE4S7dzf55wW8Nn=ggEDek9FEw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-_pYcxD+rCocqGJ5LpvE4S7dzf55wW8Nn=ggEDek9FEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/22/25 07:52, Peter Maydell wrote:
> There's also a bug we have at the moment where gen_sve_ldr()
> and gen_sve_str() call gen_mte_checkN() with a length value
> which is the SVE vector length and can be up to 256 bytes.
> We don't assert there, so we just fail to do the MTE checks
> on the right length of memory. I assume these patches will
> fix that too.

Ah, yes, I see.  Yes, it should fix that too.
Perhaps adding an assert there is a good idea...


r~

