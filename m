Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1081269njb;
        Mon, 9 Sep 2024 15:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhKW7vyMorYEjcRZpdV/Z84O+INLaGa5Dda+0yt7Tn3od0pOxdrzcG75pzFCzUu8FqbLiRELczFBpU4g==@linaro.org
X-Google-Smtp-Source: AGHT+IG3QaW2kL5CtKVhpw7JzJ0C+sqeABnxVTjnKQCmny24mq4vMiyDoP+inaokQRvtNrkHB9s6
X-Received: by 2002:a05:622a:447:b0:453:74cc:ce09 with SMTP id d75a77b69052e-4580c66c164mr185218281cf.8.1725920713248;
        Mon, 09 Sep 2024 15:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725920713; cv=none;
        d=google.com; s=arc-20240605;
        b=UST6IYYWFSE3Ht5grmQqTd91Ghk1fj5VJVtU0x3HNpvlt9DDV4FgQ2RgHqHK/+844r
         aGGzK6WlQ4Q+D/uodqibaG5udCpYVw5UnV+PtTwLd3qrcIC/OQthOn6ysBc+/LpRg/9z
         tmm/fI7Afc7FpIrGmQcREcS7HSZRO0qgiLgpEIvz6G26aeYv5KGU2pzcElraN3WghNpF
         J3ffy5Pcjx+ZJmbKCHqckcjnknfLlaPmOTtZhNCzCqe6ccS5DpQxZ47YEPwbZxJj7LpD
         YQQMX7ZmaljLXb7upN8gksOay7tvdGrPz3bSaLRje8mo32H0QXvlkYhXXD0Cd9yR9d5S
         iJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s3nccRPp9XSZgrwaQxSVXpKvn0JnR3Q7NoUBJkM8qqA=;
        fh=6kRp3K1jVRJe/0go9qIIcZsa+Wj5WXzmWLQ1QEnOntI=;
        b=d42wLSDrC1M2mHdQXSfrrqDmGUPfShmt3Fr2rb3K9lYBNc2K//IP8sndbWESCyiUs1
         nHa17qv5rdMi7ngTIw247jUpm8CyWcz4RjOrto8Bdnmc5ixXVc2J/EEN7zq2N1Ou1Ic3
         IKSv7kTYH4YhOaSIw9xFd2P5U3ixBrAfNvBEmAmcL7GFLcv0pqxSj/yFwctnEXuTjrV5
         +G5va9W99ClhoqnCSYjJLWzK34bfOB17zqJKX8m0cE9KFv1hbHECkzGpLxALaGg0gtiC
         aPaIv0mYzbhpX0vDMHHDFB1Io4osbq5GxToJPLRQwLXPS19AKBdP/sJzhxWBnnhStH0M
         lFng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LSrDtPJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e63a68si65582721cf.93.2024.09.09.15.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 15:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LSrDtPJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snmoo-0008B9-P0; Mon, 09 Sep 2024 18:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmom-00080q-9u
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:25:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmog-0000nY-9z
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:25:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so726254266b.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725920692; x=1726525492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s3nccRPp9XSZgrwaQxSVXpKvn0JnR3Q7NoUBJkM8qqA=;
 b=LSrDtPJ37dxTpyaaYdoHh3/jV/dzwJE2zi68KH23kCeevMl9o2VcV//+NQrUafiv7e
 kmLYJ6DIIBVoeT3/wGWUG0gNR7m0SyWvKEwT9PhqJxj/ryDYEcW8A8ynk+CH3EPZeoAP
 svY4Q5x/Wm02qzcspFtLrXtSahACMZJvKMBPAyOSuaJBoeB/O4whISLA1RelFmD0z73t
 SAn7VmXCv2LnrBBHNN6ESt5ZwmgQHpXsmmulRpEJUjxHT1beOU/3mQLODVRd3NLfKqyY
 YXhkMzhIcgaiRSwNb2KGu3Dz60MQmLNDEsmlJnvT23P3x6ujDQ9yg/svjsXCj3PNOWj0
 B5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920692; x=1726525492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s3nccRPp9XSZgrwaQxSVXpKvn0JnR3Q7NoUBJkM8qqA=;
 b=lJ2WoGpOijcyZ4ckYZ7WjAFtun4n/EFDH9Y8qvnIDbOfUds2NYRldqWvMyvJlO+ilf
 7a2qSwXFBiktWfxJd9v6R5Qmvu6yoSiSpLyCGMKAfkCAZzQQ2tou3/wivGkgf0zEw2Zf
 fGhSgG1iFp1uOUkimE4KJ7joVlSS23qCi8+S6P6nsaFtSCn5YLBOpOie0Q33KdtTJdhI
 FnXfsN6kI7ByD3BATR44/FCRajT1rs1C4maIRnGu2XZTztSq0cgOZvo9jv/yT4gVQaN8
 3HDZdDA0VQPjZW3FRoq2C69TuxMAAsHzzi74eZgZW+hWefe55i2cusuExMDw6DOIfee2
 JkAw==
X-Gm-Message-State: AOJu0Yx/YB2V4sUT4bF0lj/ZQ0lo4BaV4/0bLCLkw8nvvKAt/H4guoEY
 JxL9rqAv+wZmp2M2u+1ooiS+77SAxysLUCbVG1N4WJAkEu0yTkblPfds3TvJu1I=
X-Received: by 2002:a17:907:6ea6:b0:a8d:498f:640 with SMTP id
 a640c23a62f3a-a8d731a7c8cmr86405466b.21.1725920691977; 
 Mon, 09 Sep 2024 15:24:51 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c6126esm392591766b.120.2024.09.09.15.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 15:24:51 -0700 (PDT)
Message-ID: <678932dd-02e3-488d-8cb1-6f3d37c112ab@linaro.org>
Date: Tue, 10 Sep 2024 00:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/29] target/arm: Convert FMOVI (scalar, immediate) to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-13-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240909162240.647173-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: bBjR22qLTVFk

On 9/9/24 18:22, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I wonder, maybe you mispasted my previous R-b tags
with Peter's?
https://lore.kernel.org/qemu-devel/37096dc8-7827-4a4c-a27b-4f8343aa9c6c@linaro.org/

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 74 ++++++++++++----------------------
>   target/arm/tcg/a64.decode      |  4 ++
>   2 files changed, 30 insertions(+), 48 deletions(-)

