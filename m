Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2256125lfm;
        Thu, 30 Apr 2020 12:10:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ17MFbae2greuQZeIPUQK50uAAbwQuIBhXne4N9+yVSh23XPJRa+PsotJM5/WirbzH9bjU
X-Received: by 2002:a37:809:: with SMTP id 9mr5222829qki.93.1588273808356;
        Thu, 30 Apr 2020 12:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588273808; cv=none;
        d=google.com; s=arc-20160816;
        b=S+gelUjGWT0yt4OGzEaMIW/W89rifNh8Q6i20hH9rzvqb49ETwoOuPxI82DEizIBqV
         yQJtyIkvlAci5nAp8P/u58dUhJ5hyhpLtWANbIW9MVuRfvEa98RZlzYThb8oZitQRYt5
         hs9S7srmUJLpDOnwcIOvY+kbTnMi7GX1LJGQbFxnG2XJ8wz/jMrXEd83sUUFCf6ulNQP
         EKsWHMMchcXEht7FATD69fw4LjWlv+nYasH2KjD12l/eLCC93IbbEgKvsb1dq2Q6cG+Q
         6cvzsas7k1Ji+ARX+1aMaTE1WBTr7wXL7hqXzwRjutkY+RwRPkWwp3+h3p7ozYrtCQ75
         4kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W2LvCywvrLt5PdfgutWQGzZb+F5g9vTbkhLOkEDmYYE=;
        b=suMObdD3Sdj7icPnTFzW5rqoPGasyxPPu8ph2Wl+NbnhRtvBa/SlXtw//Sa/EJ7+Q3
         sPvroiMA4HmkPaD02ppH/IdOmqSmgiKJXfn8vcxwcniKg5Vl4fTU4CTn056kIPDRBmXE
         RVeSP7nzOWS0D9AVfgtWkVKyeew6YBaWDEI9/UG1TfslM3M+E6OJ0usy62bPNd+aH7Ta
         yr/9fCuRJyXzBg1CXucEdTQ1ncrMt0sMzraeqSumexlOzJgJJv1Ab6CKjKNkXwm9WYRw
         3utsLCNnU48jwcZL2XpGCr/ZLjp4TH3N2LbjcQKLJCSUEZCcEFz59FJkJFdnj0es7p8f
         lkwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1xyF7qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id e23si308807qts.281.2020.04.30.12.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1xyF7qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEZT-0004Q7-PW
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUERK-0006P6-Kk
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUERK-0003Dc-0L
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:01:42 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUERJ-0003DG-F6
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:01:41 -0400
Received: by mail-pg1-x541.google.com with SMTP id d17so3258722pgo.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=W2LvCywvrLt5PdfgutWQGzZb+F5g9vTbkhLOkEDmYYE=;
 b=C1xyF7qgf6b13SwtILCZ396ARWspluKMAfYaoES9Y+TNYCXjw0Hd04pnRYywqw+SVl
 zLlzY4XiXc4/mfE4CtgsVDI9FS4+YF4rn6BFi7XG5JNgHaf43PdnjBVGTNN7MAT8AAnO
 VeYhiFKOXEE76Y1uBeLm/Zv4jyYxdetEvQghRUH2JD5HMk7UFvnyz/l/n3G1jJ4BCT1P
 ShStKNnyGWq4dE/LNGjX4RkFrqZK0TPVPKwKGmQWb+Se0wcqJNRn/oP7nQzbY/BZv0up
 tkrXcfkMhCr7DPOn2svXlXlEAQgSqKU/GXnM/DNZqmLULAxzvMwgdzWzpgwix+mcds35
 GiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W2LvCywvrLt5PdfgutWQGzZb+F5g9vTbkhLOkEDmYYE=;
 b=PW9yvlIb3sCtDhRh0r8Z/fkbXi1YecaFOJxGRTjCbmLE2bhd+kbJzDF6isTuzUj/GO
 HZQQ+q5tPvAF1Cn1p+jpMM1LGczIUyj2fRLLD4VLd8qfpokvxesTuYgFcrlRTQ269k33
 /oEwLmM4sgA34kcxOvN1NXz7EPOb3Be8Tza11h21xFfBAPeudVlK8/rY4mrcFi8AunLA
 10lrSHgf6BxRWDK+ubFBu8L2vdIEptq++2hc0W+sAxFOEidIGT485fnNKVebHVnGqIe9
 N6Et4BNuJm7e0nKUx2v4qoNa1KnqkjV27X3eiJR5lvCIRtVf5hKFQzGHfBDzDkiO76Hd
 URlA==
X-Gm-Message-State: AGi0PubQu8pNiplPEnSjcfoJ+N7jVRXVvC+aEJBJWm8v+He/oRStaXC0
 nhp4D5fA00uCOyPcrbhh71dDyA==
X-Received: by 2002:a63:cf02:: with SMTP id j2mr405039pgg.130.1588273300023;
 Thu, 30 Apr 2020 12:01:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c10sm469803pfm.50.2020.04.30.12.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:01:38 -0700 (PDT)
Subject: Re: [PATCH 09/36] target/arm: Convert V[US]DOT (scalar) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1031894b-486a-a38d-25b2-9888d75d5471@linaro.org>
Date: Thu, 30 Apr 2020 12:01:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: PxbJh3D8XCkW

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the V[US]DOT (scalar) insns in the 2reg-scalar-ext group
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 35 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 13 +-----------
>  target/arm/neon-shared.decode   |  3 +++
>  3 files changed, 39 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
