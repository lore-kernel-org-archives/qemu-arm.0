Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1296009wrg;
        Sat, 8 Jun 2019 06:47:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxN1nPizot6mDs6E2lVkXFUrf1M/dRbT38c9ANLpVH4VBil7mMLkDT7DYJf0c3i4DXbIcBK
X-Received: by 2002:ac8:2bdc:: with SMTP id n28mr12934854qtn.197.1560001630366;
        Sat, 08 Jun 2019 06:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560001630; cv=none;
        d=google.com; s=arc-20160816;
        b=osbHr0WOI10zICvYkqgYboMjXnYGqZyRiOMwsAoZvOfO/pBQK4y17W4YVT09eQyJo4
         M3HbLG+NsAWm26MPkSqlApWUFLq6iymTTmVr/cwelo6249cAvq2J/3ewEmGAVGQN+NQD
         u8yF5q0Sp4EqBmWAXg+zeSZN+peUL+2cUXO/ABTjWzClEbUWBOOioi//l11VFDltcLJm
         +FpaMuHWiA1O7DTzir5s9by/fTpT+36WDhN+ESd8vUYNKVk1Xp3j13WDLlD4rTLSRdDL
         UYlRy74uwP+svCSvDF36Sss+1Cnvifq5Ld6raZ9RiN0/yBzvEEstnsqcG71uqVIslrsa
         bK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=vZo7nzAqRjAizPJNgAsuN4rXu4QrALKrYOTntgEhOZs=;
        b=j0CaVA0TnxpOsgRFNvZP/q4HOvyFmFtGg8rLa1QjT3Fx/T4Fw9vhMVv/PKT8eIRp4m
         ZTUB4sVgurac1c9iewuiY0BvSQZwU6XmlNrIacCS0jlQjvYTJF5gKrn66ekHh0yKItZj
         enuwcHRm8ZOJCJw13RgwdKnKZU/ICM3VBKC+ydmyDPz+XqSqZYAdrscnPI5gFahaWkAS
         unGjwjGHDHIjoX7/mv2qt3H5CeiROPSnwAk6CSwk4IcHWfdDcvcFFQjaeAGSE1GjEJ4R
         h74pOQpXaoN2FdnhHqwPJzbGJzHM4TIuVznGrrZYF4+3WS2tZbAuyg3TyaeRVP5yi1sR
         ix+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BSl3HNDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y45si137057qvc.130.2019.06.08.06.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 06:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BSl3HNDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZbgb-0004tf-UL
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 09:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59299)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbgD-0004tS-6u
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 09:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZbgC-0002h4-9n
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 09:46:45 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZbgC-0002gA-4e
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 09:46:44 -0400
Received: by mail-ot1-x341.google.com with SMTP id x24so4437968otp.7
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vZo7nzAqRjAizPJNgAsuN4rXu4QrALKrYOTntgEhOZs=;
 b=BSl3HNDz9VtOsubWVBEpzAMLCd/B0xNZ/+zvhOEv0MG4aaRBLhkLVX47kELYG7B2jM
 4Y/KyCONn+9NdXuVCxrYuEAOdgKeVn9Y/kqlZoP4Vw3slnNLN9ofbpbQbRo0Y5hx1vLp
 izN/sWWxPZyJyUDQ7OWc8F8NXobto0HCJIAHNajuFoMHInKUxLhaeuj8pzdaRSp17DHX
 VxLUKBtHggfbO/I6CTmD6T9Mn3l2Dt8Qyrq1v8uLrvLfI7YtAQ1zIKzbDaS3WhVpDpsp
 EVsC2TV/oXxFrjEuau9qoXQEebl6rdV1wypWYAfWoEx1hNG3W90CFtyzgydP7IXya24Y
 nL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vZo7nzAqRjAizPJNgAsuN4rXu4QrALKrYOTntgEhOZs=;
 b=I+8YAWz6xHRTkg1L/20MIKanHd7PD4imc3H8L1MODnLFCcOqUEARM2UGwuLth/+bUt
 Xr1eD89ISbhlSQjOiWjE/Wp29Yau2EBPiZD3oJh1r1iyvIcQzg3WKjWOZt52WsEMk+fN
 VIV1gJG0oltxm5rXbQc8yaRfHB0tB1RbObJUbyHLd6Vf9UQhWItj+ENvIipYxPyUfkbt
 LbvxWES+ZuYyDNWNlzg40cP8oaSApUV137fearNGzWGRUMlxuDLeHb12qdbgO3+7zgqg
 kq4Zm5wxkStlX0DVm1bM+OpLmNS1SB6AYZuXZGPLFp9rc8Q+ZGkZRIEGmQqlsvR4bLbp
 gDwA==
X-Gm-Message-State: APjAAAVAA+dDRP/YpKVmIgw7+oA58B44XClSuldA/C4aPTo6UOirbX7h
 BEfpNFiQj4ZPo3Xx61qYW+IlnQ==
X-Received: by 2002:a9d:32a1:: with SMTP id u30mr22464552otb.371.1560001602335; 
 Sat, 08 Jun 2019 06:46:42 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id w14sm1900239otq.1.2019.06.08.06.46.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 06:46:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8648d40f-7418-c3ea-3f01-c11dcbd2bfde@linaro.org>
Date: Sat, 8 Jun 2019 08:46:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 14/42] target/arm: Convert VFP two-register
 transfer insns to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UElIfTjJUwgx

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP two-register transfer instructions to decodetree
> (in the v8 Arm ARM these are the "Advanced SIMD and floating-point
> 64-bit move" encoding group).
> 
> Again, we expand out the sequences involving gen_vfp_msr() and
> gen_msr_vfp().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 70 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 46 +---------------------
>  target/arm/vfp.decode          |  5 +++
>  3 files changed, 77 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

