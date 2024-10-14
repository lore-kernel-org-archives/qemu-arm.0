Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1966067njb;
        Mon, 14 Oct 2024 09:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvTaJx4AcJ9GFdZrEDIEBeLX9aG3jJl9kXdxgDIU+nA/kSBQtUix3dz5QuY/za6tp7E7+Yg1HKboo3XQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH7CIF+p/BPD06XnVloVt2XQGch4HVWJTn0/prtYVUZMwo5HO+n0yrookmHBPJgohwzyOJL
X-Received: by 2002:ac8:5dd4:0:b0:45d:56e4:1ffc with SMTP id d75a77b69052e-4604bc54450mr197373441cf.51.1728923646685;
        Mon, 14 Oct 2024 09:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728923646; cv=none;
        d=google.com; s=arc-20240605;
        b=hzF+SCVY0lbYt+Ahq1uJHxhVkgPDI4o+zN/kKjveens1IvVQa/rM1WO4uCnKzJzbEx
         1gG6WFvPyrrN1WqgINZisrqrBz9F4FHiqbvEcGn+AGRAz4oaUKTwLz17OYLRu9pSZnm6
         flRunYCesUJiUL4wRpUzbikUSBo6ySG67O8Oms1nr/qyinqVKk4Xx2LCF2XSdUppr9f0
         YZ19o81gt1Nd4T4nStQYJg7WYSc6CahlSXBsYjRT016mBj/ZMMZTSXXZJLsyoL/rzW+0
         7UcQYc7DdiWnB6uZcz5Gsv5bUCCchJnokSUEhqnd5wanwvRdv+KvA13MOLoy4hJ3Kmua
         sbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=POFVMJnrlK3O2mHGqkmmfGAkdXgO1fN5o5e098lVQ5I=;
        fh=SEtsEc7DwJgDOTNDBsKC60fsBtvv3ZErApOo+7zmgOM=;
        b=SK6ZT58M9iq1ZQUm91LB4Maw19Tf9+yqb1p3qSchVHVwn0B2n3w7n+veuvUCFkPgZF
         NHAh5IjxSTh5fTgR41YMnSODCt2jvf0dhLsFAwhd+odhbXNJV1VfkAwwAWnuh2qje/kT
         Jwzap7RSjacp+0neLFNs2uRLYz3ftAkB/nYCnjDus65Q0AVepQZqBKmBS+m3rCAaNO6H
         45iGG7CsKcFb8XzJ+IX+HDMV8jdRXsj6X5t/6b50mjMo0SApRV7XIEMUT22fW5M058KD
         wuBO07Fi8WB5pC4kRm0/ebAAsPChPWaVpbGkiuWZyQzFNHlfYA6TPDi2ecTG9EE1nDqR
         PjnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xdQSdDvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4604289bd2fsi107266341cf.481.2024.10.14.09.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 09:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xdQSdDvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0O10-0003vL-S6; Mon, 14 Oct 2024 12:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0O10-0003uz-4P
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:33:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0O0y-0000x6-GC
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:33:49 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20c8b557f91so34207665ad.2
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728923627; x=1729528427; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=POFVMJnrlK3O2mHGqkmmfGAkdXgO1fN5o5e098lVQ5I=;
 b=xdQSdDvoeyenAIEAsW1477Zq8++O/nL50XVx5XV1VnS6fPCDXPjTJvf3Rd0yJfdgrv
 GNZujWJvmV26o61LFPI2tkiKKG6yD9FAanqUEtA6aMT1DoToi+dJfs1/Mx80iKM3ZoTQ
 Ls1ValoC6mT7y64zdoXLZpRFtGXJKpfCR3MsQspzcNLH62Z/6YKhkVx4sP3VEwUy7nrU
 zG2FoD65lq7DLZ0EHWtsdU444oKQHCjZYz20MBkZFoaHKrZwisyB61jC4LmHLmT2sWKP
 ylGlNYQg4Ysd0QW66e8mwcES1lVo/jvVZutAhooD3yH9pVmiTl6v2epcJwSaDF3JXfAA
 7MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923627; x=1729528427;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=POFVMJnrlK3O2mHGqkmmfGAkdXgO1fN5o5e098lVQ5I=;
 b=NrlEtd3eO/xfc0pruzV5hwye2X4+3aTMtpZEvfHVfxeqrDMryjrgFBUPC6auJ2Ay/O
 5W/nws+JhJAPpY9CexliMznZShknJTPXPjJZw0q4u5D1qbaeUTU+aMPssFowYBtr3Ypt
 7GbJbnwS3sq7y5NW37JCbt8RtBLycpO12mFWJYkTckVt2NPEHyQiReiv6MfwuLlOvvOP
 sXR2DLx/OKy8o6L4P3AruYf32TjMtWxRpD8TvqH0NL5Vpc0GFdMqXoK7ZjDPxR4liHZV
 VmhdSmZpT4XHBHUM+5xlNJ7jP0Dk0H8D5wHzVpnBrICx6E3SF6JSmUwNfqjrhWDwUhC+
 YtMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaNmJc4Z+LsZwJB3F8YaALflwqvZGkOw16kKsyODvw21AmOHn+Cz1TrR55WEPzAzsp6/yApWkMKw==@nongnu.org
X-Gm-Message-State: AOJu0YymunzZG6JtCrcEU3EZdQaTlXRP0xcWyiTz1v7nO8YvSJJOHfh3
 /EX3UuK8ZVb45DLBuPu0B3MpunT5AW5Osfu0nZ2pn/HtQfzh5hHt0UCl+8h5IVM=
X-Received: by 2002:a17:902:e542:b0:20c:5b80:930f with SMTP id
 d9443c01a7336-20ca1429fb7mr155345835ad.12.1728923627023; 
 Mon, 14 Oct 2024 09:33:47 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c8badc805sm67410355ad.40.2024.10.14.09.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 09:33:46 -0700 (PDT)
Message-ID: <a322affd-e3e1-44a7-97bc-d9db2090b000@linaro.org>
Date: Mon, 14 Oct 2024 09:33:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] tests/tcg/aarch64: add system test for FEAT_XS
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
 <20241014-arm-feat-xs-v1-4-42bb714d6b11@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-4-42bb714d6b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: BGG+81BZfaJX

On 10/14/24 03:48, Manos Pitsidianakis wrote:
> Add system test to make sure FEAT_XS is enabled for max cpu emulation
> and that QEMU doesn't crash when encountering an NXS instruction
> variant.
> 
> Signed-off-by: Manos Pitsidianakis<manos.pitsidianakis@linaro.org>
> ---
>   tests/tcg/aarch64/system/feat-xs.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
