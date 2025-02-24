Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp2135280njc;
        Mon, 24 Feb 2025 12:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9pfEvG40DhOfntP9oDaOBhp6K7zqyC97czzn1/uvo6MHbuWh/F9MRmokz53nXe0X/lar3fgbmqpzIXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGCeuDdu2HT+xYWB/QCMwUMnTB/c5fz1UR77clvxQ3mNjCLJ2qbOiMo9xYrXTngnGJp7G1A
X-Received: by 2002:a05:6214:daa:b0:6e6:5cad:5ce6 with SMTP id 6a1803df08f44-6e6ae7c9f82mr200671186d6.9.1740428869142;
        Mon, 24 Feb 2025 12:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740428869; cv=none;
        d=google.com; s=arc-20240605;
        b=bLAEeHGdjmgpjeUMwAbuRqrmEqE7nR+wv6/CQvBPV263lD3/2MgYBCk+tt4mYtmpjb
         TVMgKby5Of/Bv6y3c2vGTFKCBz3YDkGBgHSexvyOw6Lr0qphzTCBIwDOsm12gPAAv1Cu
         zc40Ow5Lb9PbqMeWjJlRtAYbJB2JIWwXe4Ll81POdR5xEkMQeSbE7MLNgohpdRLRoeB9
         /3FXEIw1Mjd9QKR8LTk/j7V1Ak99CqeoRM2VFfNr8/W9Whht1Tcin65G7OsdcsjeTYaF
         HidGWTORAj9cvUcMjvWp8nDrooNDP7NdrhRa0U5YMxgWtD8m9ozLV7GzMVLUZz4dULM8
         mrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6kQ4fP6I7W8y+aobU7UbgCaxlk1JveuMEMhxoAelzGY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=iEnlsj515mgnc2lLEpM1IoX5OiTqxEJ2imJcJUGi8mWdvwt3qCctp7vwxcvyZqCOR0
         FAdbfZ8szNp8X3y5WYoE7ZJU/hJBzs5yrBW3tAc1HBXZ8v4EoRVDtWlMpdulhQ14MRmk
         yCgBig07jK+K8l0UKX3/ZnaKtz3TR+3j5jPBJBQNWKWpYcdaQ5heYJQneUDJ98XswLJ3
         YEcuckGu1zZ0H3vUacF5raJJW3zJj3u6MkVJmj0kRQHAo1zElPb7M+LbiX2CE+Tt1UwN
         6Ryd161JBqUhLk8P45ZYwLoZbobl+itCvfJW5xLM1EaUjkBsV9YNDDDqHshAWPM14xnQ
         3Cgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RhHYwLhN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0467casi1630686d6.149.2025.02.24.12.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 12:27:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RhHYwLhN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmf3G-0003es-Td; Mon, 24 Feb 2025 15:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tmf3B-0003eH-Kf
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 15:27:38 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tmf39-00008U-VZ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 15:27:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-220e83d65e5so92677325ad.1
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2025 12:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740428854; x=1741033654; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6kQ4fP6I7W8y+aobU7UbgCaxlk1JveuMEMhxoAelzGY=;
 b=RhHYwLhNxDH6aYkwHYwMNkU4g+BWUtwpxnUUAW8hhNEajNw7yHVRAOPvliIVo4uZoN
 NDrBM+WtiNnE5G1YYqA+rbaX2Hfww3jdO+HIOq+JVykAG6XvMPPxAOQRmZb1nY+oduxc
 6t3KgybRiDDeYa5oopcJIM6z9asgFowaCEahNoxUd2++iPGnACLrv4gmhfr7uJTfpQ9T
 vITKYihELiPkJKySUdIsyMmyQDaNnOQlhYGCTjqHMLzGHBFO8IJLuDamrt+nXwuinqx/
 bdDbE812SO0joLQe/5rA6xV5JQS4Jz75QgLqNIyJOYo6cRV1wA8Op3aZW0T7vQ8ERWSD
 toZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740428854; x=1741033654;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6kQ4fP6I7W8y+aobU7UbgCaxlk1JveuMEMhxoAelzGY=;
 b=j9ef1OShZJN9yy3jigFHUdOZhy8IdFKhKzVGl9Ld9xWvkwOwvuF0MwWfguA597tdCJ
 8F05MWIgevF/TkHLHqdwY84yUO+bh85Vw4KkWJE9MUDo5yBEvpv4TnBBdwBvFUj8oi4C
 Y2S7GS6Cj/5f4l5Ih5CGCWnIOFb80Hik4Ooci+6QWRwMxQKBtjTn5GXUHNUATrxDfrlo
 dJ5UVuVJ6CqahaBwR+Kc7KmnmDHM4iy4k0GreSLnKAZcKAAAF7DXo1zdYd1is+oUDM15
 8hJcVSxjCD9koYBsz3eA6epjFLyKivzM86ayBQssnQ1yMefkgmDgu4VXRCnsGhDnUiJ8
 uSAw==
X-Gm-Message-State: AOJu0YyBwoUknoQmdXsMSxsgoExFUczWp0sd4PpVTxg45dTgoTY7Rhum
 lbG1Yh+wcEjXS5zqw/dY8h5duKQF6sFcf9kUlzB+X5IYETSE4sc/WJckKDMS6lw=
X-Gm-Gg: ASbGncuTqtf7F2crwFfzDNb2tlorj8bprWHp1GAIiJjA+oKflJl6ITeo6nwiGXGl/cO
 Ehe9IdefZX5nUvjhesFlP0N0VwkUCesYdXyqqIJkiCljUbklT29T5ECiQs5NmhuwGDPqzEwJoT2
 TacULfTsnaGDsmBqR2NXX1B6upap1s5dQUt+CNzBiYIQwrmP3nIpVWkAYcmH9rE5xjI04YEYMv7
 9RuoDmMo1Y+Ss8LjL3PyHlZ0r5lJ02miMs3wJTbHELDFmzOgWy2nYrk7kJA3jz0ofUBwUq+j7x1
 iTs/CYntZJF91JATvytTeLcsFgI5Um3EIp96klA1CNRFIPXW2iBnsQhy0Vi6Gppfvq/RI/roIvz
 9uhqe32U=
X-Received: by 2002:a05:6a20:9184:b0:1ee:ce5b:853d with SMTP id
 adf61e73a8af0-1eef3dcc063mr25751423637.39.1740428853830; 
 Mon, 24 Feb 2025 12:27:33 -0800 (PST)
Received: from [10.254.143.227] (syn-156-019-246-023.biz.spectrum.com.
 [156.19.246.23]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aedaab2e9casm46566a12.67.2025.02.24.12.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 12:27:33 -0800 (PST)
Message-ID: <9e0853e9-b590-4a84-8214-fbb543bd4359@linaro.org>
Date: Mon, 24 Feb 2025 12:27:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/61] target/arm: Implement FEAT_SME2
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: bOZBclAJTEao

On 2/6/25 11:56, Richard Henderson wrote:
> Based-on:20250201164012.1660228-1-peter.maydell@linaro.org
> ("[PATCH v2 00/69] target/arm: FEAT_AFP and FEAT_RPRES")
> 
> This implements the Scalar Matrix Extensions, version 2, plus two
> trivial extensions for float16 and bfloat16.
> 
> This hasn't been tested much at all; I need to either get FVP up and
> running for RISU comparison, or write some stand-alone test cases.
> But in the meantime this could use some eyes.
> 
> SME2 is the first vector-like extension we've had that has dynamic
> indexing of registers: ZArray[(rv + offset) % svl], where RV is a
> general register.  So the first thing I do is extend TCG's gvec
> support to handle TCGv_ptr base + offset addressing.  I only changed
> enough to handle what I needed within SME2; changing it all would be
> a big job, and it would (at least for the moment) remain unused.
> 
> Still to-do are few more extensions for SME2p1.

Ho hum.  I've missed the entire set of counted predicate insns.
Hooray for Arm sample code!


r~
