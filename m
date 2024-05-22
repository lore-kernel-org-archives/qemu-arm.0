Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp375228ejb;
        Wed, 22 May 2024 05:58:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXm/kL9OszjOVzHNicJimxgydi3UetY3aEhYX2z4wkou/hUmp+WAS5PXTeKC2m/8ywOxGHf1VDuyMYFzBfufKbPoeuhReH7
X-Google-Smtp-Source: AGHT+IHzPpLFEFylNK1wiOjFrkZ+1AAk5ZWtF9UPPoiaT/CS6C8jkldIKB0pYVzK4Xk8WAfeu19i
X-Received: by 2002:a05:622a:c1:b0:43a:ca31:8617 with SMTP id d75a77b69052e-43f9e1522cdmr20446861cf.44.1716382709506;
        Wed, 22 May 2024 05:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716382709; cv=none;
        d=google.com; s=arc-20160816;
        b=C+j8WRrIinPq543xkRz2zNxGmzRnatZTquHnbUOdpyL2ShVoHZlhVhtlAMg5Gyi8Oj
         ZRUqwTvFc7Gu5INyNVO859xhyVOlTcfqDlsK3FDyv9nT2qb/vIMsRUwYGhLe/W1d9D/x
         Nl0lIvF9W+gUtCzQfjP5MMYSLbusaarrl8e70foZFS0ZPvUQ6DdQ/SSz/w14YwKT0E/O
         TDkfO/RPT28VLv/nd0VA2ic3Y0C8iBsAK/+dmH1suxjJjjcfC0OlJc8DRrsMn1QxocfB
         izOVnQAJKdLcOyP+/n4JDNbEbPfM2Bt+rUhpov0KDN4OeD+LNyevvXtXu+mL3ox4fSux
         uE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZakG4gdFrCffcgn4XA9dGcrf2l5petDhae6M+vQ4FyU=;
        fh=8ow/xdv4ZubtDhx5h3KQ6WIFkkaCwHKn/hnSTkjLNGY=;
        b=BcW/ygsFOtTLZaY3CqA/UA5xWfrP7hisggCfbBIVFCQdSZXrYPuiTF0xjMn80Dpsym
         3DDcnc0JuQjO1E9oOE10R+Ps3uX59pM8QUI2uSbG5nEHSvDT5Qlga2DnB752m0d1o5iU
         OPScRyA33v8RlHPYkHcGGe109koXCtC565l0kVliP09u/DAtDwwANnCb8a48yBnavDGO
         CFBgZo/Kq05mCWaAtYGR2r8IxaSAFNLlAcsk5AIB57saSIdMrpiE7orYEjSmJXnY073x
         4MBfv+iJz01K+s6nbKUlz8ftTKaga+ezPU5SWTGWiHLRSUxNjlTtVknAYR9QVfpGqzjc
         eUkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aedOqnDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e4bce0677si108578411cf.29.2024.05.22.05.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2024 05:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aedOqnDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9lXj-0005be-CD; Wed, 22 May 2024 08:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9lXh-0005b3-TF
 for qemu-arm@nongnu.org; Wed, 22 May 2024 08:58:06 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9lXg-0002b7-3r
 for qemu-arm@nongnu.org; Wed, 22 May 2024 08:58:05 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6f447260f9dso1257048b3a.0
 for <qemu-arm@nongnu.org>; Wed, 22 May 2024 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716382682; x=1716987482; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZakG4gdFrCffcgn4XA9dGcrf2l5petDhae6M+vQ4FyU=;
 b=aedOqnDaFxsgatwq5PwhtxNr7Zau9L6jFF1RwnfCbhw3YTwpdSzAQ8wa7dStTVdJdP
 EpI9mySJ5K6h73ppOAU8CQ6sNChkomLsthAGR50rzW/FDeCrFwRGIX+F0XWLYOmV6LZi
 ZY0cHOtGelIOWx/VTkmuW1WIVH+RdwoP2tpoizFM8TEJxCzbR6DJqn/0kyf9y62z/MNI
 RLZjddy203ITRcfaI00xCMO0lDPoEWekzBZ5wzMUxWY9Sav6JzKGshZqYh4HPsE8K1pp
 QIe6Y6s0vhV0vzPgVuEVB3Q4dUsADmVfo7kc9DYw0tqY5t5/j4Gq9Pd6nquAlAGhBqqg
 UUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716382682; x=1716987482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZakG4gdFrCffcgn4XA9dGcrf2l5petDhae6M+vQ4FyU=;
 b=iVHPp64RXbAKIWy9IigfI5efCFpGj/5fgLQT+IEh7kZMNrM131NW1Li5opofeJT0gU
 2HhySdlPFF1WAlFAGjOGTkkCBR8YZtO5oqivTnmtoKtrCFnN3/rILWB3SZ7uEEkq7oVT
 5SFAaYrHVwgqMee3HYSk6T2jJozn3bsw/jF6/8XHqqTZaNBGN6MMW5mrosgkOrvj75mW
 UuRShrDcDiQk+10ddz4ZEKeVRxRSS12syVlos4lBRWGiacPTbUIc5SBwvBKERIU/MWRB
 EWzTuYUlpAROOqNBJKQ54JXOgo+M6l+0zmxs2be0bKcA9csWNX+ZSlDgk98ulehKHRA7
 26xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTL5Oos7v3Puk6/TGofhAu4DMtyWySABBUCiesUvX2QpksTo7w4XEVidtbfx4EUjgSY/T4qeXqLqnx/uLJ1IGv5xjx
X-Gm-Message-State: AOJu0YwD9rieZrgQfug9BprdMkvVSVgSih7NLEGCEjVToI1azdschi8C
 VRAl35YPhOap/dQQUkPSCPGKfcAWVilvKoSj4BagiXUzhAhkS3XNsSWAq+y5JlLa2kWQtOu57ST
 S
X-Received: by 2002:a05:6a20:258d:b0:1af:cce1:6fc4 with SMTP id
 adf61e73a8af0-1b1f89fb3d5mr2106270637.29.1716382682358; 
 Wed, 22 May 2024 05:58:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bad7dc1sm238618635ad.89.2024.05.22.05.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 05:58:01 -0700 (PDT)
Message-ID: <f01a18eb-3570-422f-b836-1c789a7c3d10@linaro.org>
Date: Wed, 22 May 2024 05:57:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/57] target/arm: Convert SUQADD and USQADD to gvec
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-32-richard.henderson@linaro.org>
 <CAFEAcA_ASs4_O22dMi4chcZTT+K=3swJfp3KY83JPbsEJoF-RA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ASs4_O22dMi4chcZTT+K=3swJfp3KY83JPbsEJoF-RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: FPH7JYOngAIj

On 5/22/24 03:01, Peter Maydell wrote:
> (Did you do much risu testing on this series?)

Yes.  Complete run of my test cases on every patch, with -cpu neoverse-n1, traces 
re-generated on aarch64.ci.  That said, qemu master does not pass 100%, failures not 
investigated, merely no regressions.


r~

