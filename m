Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1301030wrg;
        Sat, 8 Jun 2019 06:54:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7/gP9XrpeffN8nQG5WhW/lL4NgkRFsVdKNiF+QHCTDcSv2ejEG8q/TE3JmSLa0zee+Y8K
X-Received: by 2002:a05:620a:1456:: with SMTP id i22mr24052044qkl.170.1560002077675;
        Sat, 08 Jun 2019 06:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560002077; cv=none;
        d=google.com; s=arc-20160816;
        b=QVU+0yejT1bAgiJZC3tWMlfXZ0LP+PaPOC5OTDyD3GMxktOX9lWYK26OgSb+GIRF0u
         QHBfRQzXknWSNG/yrXZBROW+oO1+/7zHtkA5jSdluiwyQRK7JgaFFFyQBONpZfk9UuLF
         Zxiv2PBHVbwGy/40CUj2gMjbB/BPmuxdbxJHrCsSDxwraZtO+92kdcIcWGPyAtHHSHqU
         qB+Xfe3v9bBmyHIqs8QWTWlztp5Kino60EFRPt3PXjVh3o/Hp1sO76PHPQYQjP+sUXkR
         Qktf6UlQ1PVMgb4uGmx4YLIdLr2e5jyJGcYP/W2weoSN7hgGokns+4sy3rA3LwTdGNL0
         G7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=nEyiOxz4/S+R/o+ioto7HVavx8UhAG3DaG0SZtZC7XA=;
        b=mcoNGJ1upS1RDXL7mynHSFBldfxWbaQB9ZobfsY91ss+UO1BsKDekvgK/7/pVLZlOm
         srfmlqzkcC7W1qEitQXkR+Q/XaOR7AbznGYvwCi1M0gRJP5wgZbMOxlmozCHVtO90hEl
         hLBBD3Mec401B80x/vISjU9PQA+hQyArEi4firNFy02LqQdjYEYEMzIWCcHUfNy7DW0r
         BVkLvIJWElA9sYXOXSbItiQlILblYU+zQnW8qKn12vojyMSj4VA+DHPmDg5lyXHN+zJG
         0PHqzInPqwl51zhoWgcSh9i9n06Skzg8PLGHYnfUjbR0s+qLPWOXJxcvjlxZuol1eHFt
         XrNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CLFjjzfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w57si3610232qtj.259.2019.06.08.06.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 06:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CLFjjzfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZbnp-0007OI-8O
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 09:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33003)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbnL-0007O4-L5
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 09:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbnK-0000qo-FY
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 09:54:07 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42627)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZbnK-0000pp-5U
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 09:54:06 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so4440410otn.9
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nEyiOxz4/S+R/o+ioto7HVavx8UhAG3DaG0SZtZC7XA=;
 b=CLFjjzfhFh6Pco80LkydYKXRKpQK1ok2zFk3Z8i5xGNYOkVls5EAX6TuYnK/hQR0ip
 iQe/8gZzfzx6lhpWt3dFqT/Xm6OWBwIqZX64eN7THXBRhxZRoj3zKrLhJ5KkgqZ2Lxrf
 /0v1YFCiAAkt6V/u6F1mXWNYrHxcwglhmFA+Wnvv72TLBAeu5JAGv/F0ich/s8SK7OVy
 vDQI+miPIn8MWCF/HbNiuZPjx8mBvnAf1S53Ua7wM6bK/KFSXkw5kQgJNkjFszr5IP8a
 V1Nc3bOxr8IeNuh5nibBck31HsDEu8V5FzXLx6xgELLE3DA4tjZ3RLVIwa24NccC8hI7
 KXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nEyiOxz4/S+R/o+ioto7HVavx8UhAG3DaG0SZtZC7XA=;
 b=s5SbjL14jwSqe0Ktfpog27x9gtnPSDSfe9ZstsulfeGzNnxOvWPl0qy65Z9OB3/rds
 a1vUyYJBhgWe48jzxpq3x5ccE4cImWuGI//2t+IoERIG36EgItI4AD7LkVE4FM+3wIE2
 L0+tVFlj8yvg6DW0JYr6NxfmtOdlcAreG1TB24uUbPWnDWSAI7+0xW4Qs3ad7stqKDkV
 nTys4MCfauNXAuxoq0LIVfNtLFbI/+vodHtYi8UE2rib+OikQ4kS2lPXIpNCfGbPXP1g
 NtY79ksDF+XA+Nzi2pxuENddtkX/VQYAmA9FiCWmlyGgQ2gLlDuA9D0B4a+NjTS+VnLI
 IxPw==
X-Gm-Message-State: APjAAAUK/JG+vnsO2TBbsKZUnEpiPMd2bF5yrAfryTnA9Nm8/iwKxItg
 B051klFnBbwxync7jJSA9/4NHXjVjYOEnA==
X-Received: by 2002:a9d:629a:: with SMTP id x26mr17628489otk.7.1560002044894; 
 Sat, 08 Jun 2019 06:54:04 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id r7sm1798244oia.22.2019.06.08.06.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 06:54:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8109000f-18df-2eb8-4a4d-af6531aeb5ad@linaro.org>
Date: Sat, 8 Jun 2019 08:54:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 15/42] target/arm: Convert VFP VLDR and
 VSTR to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MF3mg5Kre4+R

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP single load/store insns VLDR and VSTR to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 73 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 22 +---------
>  target/arm/vfp.decode          |  7 ++++
>  3 files changed, 82 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

