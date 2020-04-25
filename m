Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2118035lfm;
        Sat, 25 Apr 2020 10:59:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ69fsr7loj5aylERfFhN6kdzZMMuZaG+jN2XKVvDLUQvceDc9xOkUWVhtbSfTvIHf9Cn//
X-Received: by 2002:aed:2542:: with SMTP id w2mr15681782qtc.43.1587837566537;
        Sat, 25 Apr 2020 10:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587837566; cv=none;
        d=google.com; s=arc-20160816;
        b=KVD+x+n/HxsxNj3H5zA93gaYKSdOvIe6QA3/9Ou8f8BgDqC0gqCJi5UzoKrRLIERTz
         q9r6Ivkp7YrM6p8xHS0ZxqEYJk8BWpgP8V2WeygmNCdN0tPiURvp0s5NmEMWjp10Gbjs
         R13+obGUGLWua0EMcp/Uw8EYOCz3o3aeL9/UbzjVw3cPPVcqLSh+JLRl7iHPWQ3QMzG1
         6yAaGl4fhhjFMwmOWjglDIt/ljiLIUfIAhIg5axpZS6bk85QzjEgKBV/fejwiJRCRG81
         o+7H5P1P3mokDzgmoBSDsn8SyCfsm4xOPyR492wN9B/gZ6PO5UI4ygmGmwnRoolI8Fx8
         n7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GXpTuuJGywooN0AyHTizpDh3mj3YqcrOCeVlzyrzfLk=;
        b=oo1ltdzzI/a5qW2jp5EHXRrcEuTZ7FpzVXGsJJrjP4Mh68Mslc/kOZgKaCRWflZDCy
         3N2rUZmtZt10RmhRxD15YvyTbvuNYvKL4UJXagI+nV24kSjZKbBptcwy+nwF/9ott8Uj
         s5oKwLB46DdtGuYzlIAxzXO4Xkl/Vhl1mrtCl7j/ArxFdzBNOv3PIgNb6TKYU+4/VeWS
         frQiMkYo6nFzgfEnx6BBGx0giIALXnkfB8Yuru7+MfS4UJWLTm5cEb7zQgUpH0XPZOrz
         C1AB0HZaXOg+ue05FhgBZZQ6uhzee96lXIm10kqHlBA+1xvnxqaK4rBrmEH7B0beBvLy
         W7Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vslY4KrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z201si6020573qkb.70.2020.04.25.10.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 10:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vslY4KrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jSP5J-0004y2-Ur
	for alex.bennee@linaro.org; Sat, 25 Apr 2020 13:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSP5D-0004xw-SM
 for qemu-arm@nongnu.org; Sat, 25 Apr 2020 13:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSP5C-0005la-NZ
 for qemu-arm@nongnu.org; Sat, 25 Apr 2020 13:59:19 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jSP5C-0005gf-2Q
 for qemu-arm@nongnu.org; Sat, 25 Apr 2020 13:59:18 -0400
Received: by mail-pl1-x636.google.com with SMTP id g2so5034516plo.3
 for <qemu-arm@nongnu.org>; Sat, 25 Apr 2020 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GXpTuuJGywooN0AyHTizpDh3mj3YqcrOCeVlzyrzfLk=;
 b=vslY4KrXy/PxiGrVQAQapX0Fm/1M3rAaLA+qp8U3QTq6cql63tPLBqBXfd9dZm15bL
 ZD7yYL+Lms1dqVkTCBD8lvonwW+dp93DGJL8iO0RYuIACc7TBP0ShDDwwNLcoh4yaQAX
 76C2DeUQcYnUqmGqZRzhLAlVdoWiarfVlziDL0n2iCZK1VNXGsXqDqXTbWBedxZ/Qdev
 8ArqedM813FVf9nQSgriY8eEApsfsNRE2K0JnmregDNrWGMK/jcRWdRcEsHU9TyKUWfE
 PDSDixNSB3wXEJE+iWqXdJlpkgPipCYKA5KqeAPrKl+mHX9OhDO616Y0ssLU45Yg3HkA
 a+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GXpTuuJGywooN0AyHTizpDh3mj3YqcrOCeVlzyrzfLk=;
 b=mMffKwJOSqlaSa5aF63xCZCEArkAMUZicmp+Pwik9UJ0OfHH7LFcDDQGtSlrd7KfdB
 LMlp7BAASalurQa/7/IHoqoCG2Kw/DtFcCow2sSUPl5gum1GvfabQOCGV0QFw7Qs/p7a
 0s3BzRrpw4h4j887XJCJ4+3Tz47y3Q/c51iNfU8qAn6kOzt3YN7I4/uPDRa3drlRCREh
 d9yH9GjwvedRE0+PCx53aS/P9Y5tllpKRHg1fc4PNkUEwznQXXkq5COau8cyIFIaHVm/
 +S84ikIhfJc8Gne0sGVrE37eUy4yKSIvM+AFUFEazLMOA867qdy9R/Gp3qE0GJSruaBF
 MtRA==
X-Gm-Message-State: AGi0PuZ0i66ng29Yw/ZPQBrD+tmmbIW58ucLNq8lwL9aG/ASH7mbg3Uc
 u3bvyqQBRr67GARDhR145fxUQbNikbI=
X-Received: by 2002:a17:90a:e608:: with SMTP id
 j8mr14131137pjy.44.1587837555788; 
 Sat, 25 Apr 2020 10:59:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u13sm7594650pjb.45.2020.04.25.10.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 10:59:15 -0700 (PDT)
Subject: Re: ARM SVE issues with non "standard" vector lengths
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <643d0330-5915-641c-af98-99366fc5eec9@linaro.org>
Date: Sat, 25 Apr 2020 10:59:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::636
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ogQpfojI0X2

On 4/23/20 6:59 AM, Laurent Desnogues wrote:
> Hello,
> 
> I found the following issues in SVE while playing with a vector length
> of 640-bit.
> 
> 1. sve_uzp_p
> 
> I think the comment about VL not being a power of 2 should be that VL
> is not a multiple of 512-bit elements with VL > 512 (not sure how to
> phrase that properly).
> 
>         if (oprsz & 15) {
>             d[i] = compress_bits(n[2 * i] >> odd, esz);
> Here n[2 * i + 1] should be taken into account.
> 
>             for (i = 0; i < oprsz_16; i++) {
>                 l = m[2 * i + 0];
>                 h = m[2 * i + 1];
>                 l = compress_bits(l >> odd, esz);
>                 h = compress_bits(h >> odd, esz);
>                 tmp_m.p[i] = l + (h << 32);
>             }
>             tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
> Here m[2 * i + 1] should be taken into account.

Fixed.  This was obvious once you pointed it out.

> This generates extraneous data in the higher part of the result.
> 
> I hit this when I got a wrong result on an instruction that ends up
> using sve_cntp which counts all bits set in each 64-bit chunk. There
> might be some other instructions beyond ZIP that generate extra data
> that would break sve_cntp.  So perhaps it'd be easier to fix sve_cmtp
> (and hope that it's the only function that uses bits beyond vector
> length...).
> 
> I hope I got all of this correctly I'm not familiar with that
> implementation of SVE :)

This is not so obvious.  I'll write a test case to try and find out, but
perhaps fixed by:

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f0c9f81db9..a7ffd9a655 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3071,7 +3071,7 @@ void HELPER(sve_zip_p)
             high = oprsz >> 1;
         }

-        if ((high & 3) == 0) {
+        if ((high & 7) == 0) {
             uint32_t *n = vn, *m = vm;
             high >>= 2;



r~
