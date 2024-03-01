Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1322120eja;
        Fri, 1 Mar 2024 13:10:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVt8brK/nWiXa2AHzmH+Ojm60t1thY3/N4Ei1GL7UU6fdbzmZ74iHwdZ4yYkLFdS2OyOI5EysL+PgYbJc2DyYO/pOTwRS7c
X-Google-Smtp-Source: AGHT+IFa240yWJP/XSzzaLVaqv6aMhVEQVHNPrQ1v7BTgib0NqpTUh96dtHDPWvzZaCxPMxmNMUS
X-Received: by 2002:a0c:e14d:0:b0:68f:74f3:d571 with SMTP id c13-20020a0ce14d000000b0068f74f3d571mr2898442qvl.16.1709327458167;
        Fri, 01 Mar 2024 13:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709327458; cv=none;
        d=google.com; s=arc-20160816;
        b=0fRB1WcFa9cIReDzfXGB8TzvoPYy6jOXmhYeccY82oxgvyniE0o8pjDIzFuUnsW9QR
         Hy7idJPw22+9nCjAcyyQyLMFjCLBa4VSCITN2FghT8Exf0q3jUCbIJJOYUpVhcl4FArP
         RZ7Hrlbqw/L6L6Wj9x6hHJeF95tM4TI9tK6l/dICWSotpj5C8ZOIlqJ58JzaLd7xz4cL
         N3S7yIu5kz/HfFB9qV+E/gLezR6Kr+lERro8ZGzYhGhuU3/RU0QAi0hYNeNvV8m7sT3E
         yFBls740z06/yzn3H4C0d73RayqM4hIPrUENsBPRseCna34+y09712VeqlEPdjdF+jg9
         pEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D4HeIULekpGrsrojeqSX33LBOUEmQtyGU7qBzXdm0K0=;
        fh=P2hf4Ci0JXyJW/2gSL8VAfL6jx7bFAlXiRZzg9iMQLs=;
        b=iNzqZRIBRo3suG1X5vrcCLDLXXbaX+IU8wdp0L7kTRAb8ogytzGHzYgQPTJ5D3e8ne
         c4eKKA3wFsrDLw8AO0OykXVykSJCAh+7dLgNZyajCYGcqw6KVuW7o0MIJZnRYmFaIeVL
         76ZFJUaHDq5Xidmru7JkVn6wXtSy6ETVPSnMf8awRBWdIGdWR969lFwHxB3vIp+BoTFB
         hqPPx4KJgYj+wgjryaD/CMqvC7zYJmreGJovYBBAG37NfT8pCnhFJ5b84+LGpVf3n3tT
         PkHDE6g2v6UeWZkx8+vMXQocTOUQB451y8/ddyLTj4UvzqVIKdpkjB6ZyE3jiWdtxbyi
         ldnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rktp30KP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a0562140d8400b0068ff0e2ec67si4258552qve.265.2024.03.01.13.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rktp30KP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgA9T-00038r-Db; Fri, 01 Mar 2024 16:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgA9R-00038M-Kc
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:10:41 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgA9Q-0005gs-4G
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:10:41 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so2062350a12.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709327438; x=1709932238; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D4HeIULekpGrsrojeqSX33LBOUEmQtyGU7qBzXdm0K0=;
 b=Rktp30KP/TVJKjqlC3sAtl74LqCVfR7phu76MNTKa7zuRH43YxW/I74ET9Nlq0npHN
 +9p61fVwpaIoOvYiYRNCaxyyJpUKoktdnJtVxnBuW3di4CwFpENImrLLSKWejwoLkOqK
 rfVvYbOF8exv8kb1rU7xVP4TDskgdVmM2XTMh8qXOOi3DvPRanqEg7LjfVlaM0XJJeCG
 x3TTWM+fiZG+hKjZaLSGiNAGn4uayMsHMvRc40Y6Pj4SApMd7qbaG1073rJ5IWwRXAB3
 0iTXHIZ0gPadyebCTl/fjRtQ1tVdNrvSfs8QkQ3RM1Qe7Gq3l8tR/XbEcatMUAkg+c3q
 Ozjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709327438; x=1709932238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4HeIULekpGrsrojeqSX33LBOUEmQtyGU7qBzXdm0K0=;
 b=i+REm7h86Nc68rr1gW5skZV+/LJJIJBQwIglXXtr+za3ewsYbLebOKb7W+p3VESmsc
 NhZ0U1BrWyVeG26jn7ARmIrgOzhceCIDHf0q3UjQFipyM01CSQ6yFR1eAvID60wuo+TF
 UH3dLzTQ+gsrsOpNsj5/0hnHOAKMyyjjdFjRpGZqymmfLciWjpouBZdUvJvgV5P3Y4DT
 QtTWE69djw0lliFKJPMhYJV5TmPcY5JcgJSa/9enJ48masQIE1GZMawFmQg5UZbOamUX
 3it/cRHgKior38fJnZ86fMXodUBMw47ZMMbg0ZHNj+3W1w/toZ/IeNLdeLjRcS3PhJB1
 NpaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNXr2gdTz2yzwGEebAe1gm/OyEqh0vcNejW9054m0CaiOKx9tnZq7jSl9OMvBYXxhVSPk8QBWuIjuzJ+kmjZnadWt6
X-Gm-Message-State: AOJu0Yxyf5pQUF4BGpG75/MHirry77nPHiU+1sTprXV50Q6adPMV1Aoe
 b8SHuKYosYUT7xd/+XlKGLMoYwYFqJ/pjTOEAg0fYrVMZiBCjWKFgJv0vLG/tw8/UQYVuRXkSDC
 6
X-Received: by 2002:a05:6a20:429f:b0:1a1:461a:3320 with SMTP id
 o31-20020a056a20429f00b001a1461a3320mr75693pzj.9.1709327437865; 
 Fri, 01 Mar 2024 13:10:37 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a718200b0029ab17eaa40sm3654043pjk.3.2024.03.01.13.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:10:37 -0800 (PST)
Message-ID: <6efb383f-4655-48ff-b787-e048ca076773@linaro.org>
Date: Fri, 1 Mar 2024 11:10:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: use FIELD macro for CNTHCTL bit
 definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RpVcFXb60Fr4

On 3/1/24 08:32, Peter Maydell wrote:
> We prefer the FIELD macro over ad-hoc #defines for register bits;
> switch CNTHCTL to that style before we add any more bits.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 19 +++++++++++++++++--
>   target/arm/helper.c    |  9 ++++-----
>   2 files changed, 21 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
