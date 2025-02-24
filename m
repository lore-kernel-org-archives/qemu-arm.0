Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp2139865njc;
        Mon, 24 Feb 2025 12:35:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2aXmmx0L3+R5HpoIzF2CmTri1XjiesZLWEJ+fMNIkKHNMljyuIbz/wHYZIWfBSeKdSv/PWjRPbFjOtw==@linaro.org
X-Google-Smtp-Source: AGHT+IGwYpLXImqHERodTcWWj+3pi1AmgR0ZP2IRFZjx9YUIX0HUZbAoDqJe6n9qZLuEawNhY6nH
X-Received: by 2002:a05:620a:4407:b0:7c0:a431:6c64 with SMTP id af79cd13be357-7c23bf44895mr83969385a.35.1740429353780;
        Mon, 24 Feb 2025 12:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740429353; cv=none;
        d=google.com; s=arc-20240605;
        b=dA8X3hpCsBcZU9720qcW5jzw1KRwGVIobyjD50HhUKDTbW+53AGGRAkbd/QXOF+Pu1
         pj3QosgcMk3qn/R6augWgLT05Rs4TDPYNxAv+2m0cmaQYVeJAdDe549X7n3T1BAYKIGh
         WEPKL+/9e3zDtTFIMyPFKgKs+bPXFnAAQS6OaFC6yLlywH2Ff2906FI+yqDVfPFuE7pQ
         j3CPuDI02MH5NPhgpec7Y3CHCAx71MOkU4oOCJBItWovyIWyJ5YthagY1HY2fg7dbVCf
         By5XR3OQ8gupW5E9wXS2ex8Cv8TgV6990re/E5YT+G4j2U52d4OjEVf0mY5uz4GeZ0iE
         te6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kt7gS8BmQi+IL4wbz3L6B79T8ydpItRDtTAfYOHZWGQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=O0DuCDXmnNIArymqc+9lJFUB9vK73IhiFF71AnD32olIHHbm52J3QVddvLN6yYuq2E
         8d7Q5NPbMSMc7sKThLozMetshnjSwLdKxl+nvHsQUviX8aQw2W6y91/kBc9Y9AexnNzY
         6nVKuc2AO+FuzdfORCA00rPlQPT2EelzvKS7+35vfpz3YABS265pyOJWcAw+zWg1lOa1
         oCgU0Ej8iYdHYvsVZNvz6KBIl9Ve3R4CxHRU2IyvRrf17czyF/AzwAbOr6mgQ6r84x93
         fGPU4DjhQYA00McvKXYM3GL1mpsxqNe+SYe8wtZOjaJufRwnaAaebtofwuAzoYdQyhdf
         95wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nFUYD/An";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2da7c9si23550585a.433.2025.02.24.12.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 12:35:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nFUYD/An";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmfB5-0005Av-IS; Mon, 24 Feb 2025 15:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tmfAq-0005A6-JJ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 15:35:33 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tmfAp-00022D-3z
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 15:35:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22100006bc8so85370815ad.0
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2025 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740429329; x=1741034129; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kt7gS8BmQi+IL4wbz3L6B79T8ydpItRDtTAfYOHZWGQ=;
 b=nFUYD/AnuGiJpgltGAxIFOIUXkCMOZO5Ak8St7IDSwraJnBZxwSPEEqzi6lAHIJ0PJ
 wnaGAu+5IUpRVlO0joMYbSNqb18RLRfcSMGdlHlqhLqjVOokvozglHTAzZ03zM5I6vqR
 mNww08UINmGoHg8BtFkYCOmMmm0XtfVXS/UQ6Y+nQ6TYAJqR3kb/8x75T+EEn4okolpg
 UTcZgJzOXdEiio57Pd6Dk/BH3o8ndzuGeL3EcP3+vSWYTkKvmZeBDgOZuEK/9aIIEU/Y
 86sWROxhlJCC9Gh4/mlccjJKniu+xxM1YyZe9e1cQwvVjxL2Rxh4JdEx1yECvjHB7QNp
 NGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740429329; x=1741034129;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kt7gS8BmQi+IL4wbz3L6B79T8ydpItRDtTAfYOHZWGQ=;
 b=V9t/pIOsTf2gFne0nRpgCi3V5NpF5NMk7kCv9zO7snx1CVKSaf8hBw3O6Lfyo6mq9J
 00iAT840gpheWQBDiy170VfqdhWh9ViEucacaD7iT595felWAw+jQjrV6G6MYECz0K4A
 qhvSndlkmXMGtt2gLuhbSEHgNKjNYGzXXnq9zk1RTekAdqdxsTJ48NFa+q2CYf0A89rr
 Do1ooLRfCU1/o2rgpKCsx6XPTE+lXkHz+07Zk2Uiq3LEEvj2nWqGSq/3vTd7hjcHFoWN
 TQKy/o+Uua7dvmQHutI4pZmVPH4IxiSzom22YSHyWE3VRZdeigcJrnHQmluGZozWcTby
 Z+tg==
X-Gm-Message-State: AOJu0YxccEOduM81RJm85C9kIOYQCoYNknujOHqRUi4UaeggeZTVnccb
 cozALSvREHyrN8dR0Tr29ID3Zt3uaEItXxwnVndfTpmjIDs6gsAi3J5cskxdR6XuKsBjr7GXHYw
 f
X-Gm-Gg: ASbGncs5uc1/jcVS+W6Y7JjPGpCYtxidttAQEFKV5d869kjU8yn9NWa1gZ4fFpDXkSn
 fjJVRguQj8D1XeKHEPyfOMSEnsKOt6cTnm3aTIuEDaz7WjvvEW5nkby0Cj/cumWIXbXSK9SH8Gj
 ViglNzT4AQkqiw+YcRW6HF/ddg/fMweeBv9trs/VjlPbteLy6/4mPNy2IKCmFpRp3dLApzGeKVQ
 Dc6P/Xk08WpAIJG7GaZrHj3nWaYQs71JdktT2Rfcmw/RSSzHJkVVRsKbeOjFXITrTkNCMzJsttS
 goVh/p1eJPK0eddgccPlFOkJdXaGRy+3khhss0Df9TU3SPQsHLBXgAH0XkRP/eqWPGQFTBnBNw1
 AilMCjs8=
X-Received: by 2002:a17:902:f68c:b0:21f:7880:8472 with SMTP id
 d9443c01a7336-22307e675a7mr11480485ad.35.1740429329450; 
 Mon, 24 Feb 2025 12:35:29 -0800 (PST)
Received: from [10.254.143.227] (syn-156-019-246-023.biz.spectrum.com.
 [156.19.246.23]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0944a4sm238125ad.121.2025.02.24.12.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 12:35:29 -0800 (PST)
Message-ID: <1824fbe1-33a1-40db-8e9a-afc00f13d2b4@linaro.org>
Date: Mon, 24 Feb 2025 12:35:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/61] target/arm: Implement FEAT_SME2
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
 <9e0853e9-b590-4a84-8214-fbb543bd4359@linaro.org>
Content-Language: en-US
In-Reply-To: <9e0853e9-b590-4a84-8214-fbb543bd4359@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: 09/OmUsQTXXk

On 2/24/25 12:27, Richard Henderson wrote:
> On 2/6/25 11:56, Richard Henderson wrote:
>> Based-on:20250201164012.1660228-1-peter.maydell@linaro.org
>> ("[PATCH v2 00/69] target/arm: FEAT_AFP and FEAT_RPRES")
>>
>> This implements the Scalar Matrix Extensions, version 2, plus two
>> trivial extensions for float16 and bfloat16.
>>
>> This hasn't been tested much at all; I need to either get FVP up and
>> running for RISU comparison, or write some stand-alone test cases.
>> But in the meantime this could use some eyes.
>>
>> SME2 is the first vector-like extension we've had that has dynamic
>> indexing of registers: ZArray[(rv + offset) % svl], where RV is a
>> general register.  So the first thing I do is extend TCG's gvec
>> support to handle TCGv_ptr base + offset addressing.  I only changed
>> enough to handle what I needed within SME2; changing it all would be
>> a big job, and it would (at least for the moment) remain unused.
>>
>> Still to-do are few more extensions for SME2p1.
> 
> Ho hum.  I've missed the entire set of counted predicate insns.
> Hooray for Arm sample code!

Oh, duh -- they're in SME2p1, which is I guess not as optional as I assumed.


r~
