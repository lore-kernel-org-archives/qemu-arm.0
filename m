Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E279CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:35:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jKC-0001gD-E4; Thu, 25 Sep 2025 06:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jK9-0001fq-FM
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:35:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jK4-0004la-2Q
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:35:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso582559f8f.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796532; x=1759401332; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TVnT9/bfeElcUuZpxPL2NI8pn6v0NhHePey+agUmBBE=;
 b=VATd5TcxHSQlW5kwcQCPJctcL+3nXJNwHnYz6k7Tya6uQMKKXB66CwlJvC/Zwqp4zK
 n2/E1oCM+kIfcvvUaMPvDNMc615BUyhYg1wzXXMyjnr9M7/JaC6ytNY5/76b3Q7iqpFH
 AfgwvMuEfDgnUjK0snwTkcjKM8KH+OXRRkWN9EgmraD5jrcKQdAjaQZKxYS+s6ZwthqX
 6mGlDxSyWFccK8SOEFMCoNvCflBDfEEHm2dcpRK/dvSRg7iER43zGb3oP0zju386t8mJ
 5SAIM3R6X3+3udmmkgNqOrKcbLWBZTgfOEi+UraSuICYdYvnDNzpeqbtwTR8RI2l1hpZ
 PmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796532; x=1759401332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TVnT9/bfeElcUuZpxPL2NI8pn6v0NhHePey+agUmBBE=;
 b=OSZhuvqW6advi1LsGYgbtQvDgqhg4morWT3abP5v/QZcl+NgUF1Kgm8cgpi+igQtZS
 FemU/O1oOJXuHIKJyzoPEOfIa6EojydOaAIPjI9+1lrEy/VAHnJbG8X9EB2F2oGVNUo+
 eiZGh6E/Qed+Tz6CIHEW/XxtwQVfW/LNIaY59+HyGykM6TVPDb4HEz6CCfZJUy7+Jc8J
 JFko6f6ShjqgvavKKF5KehPBGOrqDEokGgt8OF0QG3a5YesTLVc9BDYrHhS7ELUE1vd3
 idFeugf4o+o2ydgdUlNc5vROg2NPgHY4fqhDEjkdO8xhgdj/csPPVoEuIaRu/PT9DN0E
 YcAg==
X-Gm-Message-State: AOJu0YwZZ9fAwa7j6BuwG47VDqdueZJqrDN51sB7xcY7xJnsbT8cZ2oj
 aqnd1IQCVX6lzsTBEfLRmu9IvS1HvoCwiRtoC5GX3K43/Qd4B2EQAS03cFQGUB/VUlI04Q9JUyk
 ZTpIF0gWFOg==
X-Gm-Gg: ASbGncvpxX+R7E/B5wKE8OtyIIntYngCfb/MkGvGzwZLpZBvMVCs5c3d0XgeGtqDkuz
 ri3dRLHlp+yit4N+9F/DJwSVW+d1zoRG8YcpG+2cesXiW1/m6QHB9ZNFblTkIAFTD4+HaEp8nTq
 HYc2lg5rMsEHAR6QIdAw+AfwjXPhzPCs0ZoL2I4W5yWBN+n4YgquL1pd/tSFva9R+sXkvZ3D0He
 ffzltjTeYSI6exU1mzphwgVOiKuYzKJzEDf+YQL6IXQQYAHpnyW7vYNfMKhOAmLuVboxAZqpa5q
 dikv+/kVN5XWqOAZkqN0bjv8Kjgi/bOs8MPGdCHd5+Y+Dae4636G5eGqRJrfTDH/8rXwjORZPW6
 p6VtcCN4uA5PXms9fV89aWNKdolO3DKpPQf3zv/iYAL00E/Y6FyPyadbWC9xj2bkk5nd/Se4YhS
 g+
X-Google-Smtp-Source: AGHT+IEQDYNen3/U5CUsqPlHGmkfGoQo3o18XqapKtke1ZP7TxMkXIx2u9Vtdwc/mxzut38IDcLu3Q==
X-Received: by 2002:a05:6000:2585:b0:3d4:15a2:11e9 with SMTP id
 ffacd0b85a97d-40e49e7291dmr2699223f8f.61.1758796531822; 
 Thu, 25 Sep 2025 03:35:31 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33105e58sm14118775e9.7.2025.09.25.03.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:35:30 -0700 (PDT)
Message-ID: <1f36c178-223a-451d-a145-1938b466e37f@linaro.org>
Date: Thu, 25 Sep 2025 12:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/36] target/arm/hvf: Use raw_read, raw_write to access
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 16/9/25 16:22, Richard Henderson wrote:
> Reduce the places that know about field types by 2.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


