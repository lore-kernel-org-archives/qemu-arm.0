Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2194557ejb;
        Tue, 30 May 2023 06:58:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ln2xOqoq0Nyuyn/ZUUIh/jf1mgGtDnUfCF9p3meQvA3HQP6wH637Utif9eYh+x7CsE5ce
X-Received: by 2002:a05:6214:5189:b0:5c8:403a:22f8 with SMTP id kl9-20020a056214518900b005c8403a22f8mr2370918qvb.5.1685455139208;
        Tue, 30 May 2023 06:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455139; cv=none;
        d=google.com; s=arc-20160816;
        b=szlZ1kxxmnMBwqYG8Dms8vN4Xa+WTQ1dm510hUE1/MY0GQ7LOUpIM989vtPSYrggbr
         0nXPm41ZAyizNECm9PSXABT9GKa6UWXFaFXWq8hITbuj8tfYAN8mh2EAZEizPUWwRkYE
         0a/SMyAU0AWzz2ePTqCBXRHMMq69c7USVeSVN6s8H3RFGQxcUzMiRGNvdyv2UZ3NGXN9
         DDYcJfL5HO4HUuINa45/3WTJ7WHHEQqaJgk6wtrGNlcmRsrPnw5+s56UFKusDAaWTdzW
         n9/N+1BYZe3ZwY3jN0UCEaZi5o4GtyfFLdoGlhU49ULDLoI9JCTcD8HGl3HEMsbzOn57
         p8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=c6gxx3XYEw1R0UESSFgF/8EhaZtTdOhlN1lo4gAPxoU=;
        b=xyEl7pAwT6oIFAHBFPGhF7dxowKWMER5tDw1j5/584BM6kebSXTLPN6b0xV+BBBRNH
         S+u7sVL+lVdab9fkd7638K6TlPQhOPlW6cSptl5fEmuu+weU1dgVSLrk0vOCbXac9MjH
         POHwMrztTMMtUdW5UAWQkbuRoaUYc6Q5VyPUe3Fjq7L9/HD4g/Uc9+7Cte9ZT7a97vlE
         brpfj16gbRSaPyIZJvp7RwjZzw5vqVGCgrIEhs6GAqSiWpPQEn1lDn/eDbus7XbVbkYz
         NS4XL1m9moW+h5cClSVpe2umC2BnZSaK36OJJsE8NsetU4sWX9ajbwKB6htr7myDyVGJ
         QaZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eg2hJhBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a056214224500b006262d5b55c9si1987938qvc.124.2023.05.30.06.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eg2hJhBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zrx-00019B-Nc; Tue, 30 May 2023 09:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q3zrr-000187-IC
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:58:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q3zrp-0002xG-M1
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:58:31 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so3989102a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455108; x=1688047108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c6gxx3XYEw1R0UESSFgF/8EhaZtTdOhlN1lo4gAPxoU=;
 b=eg2hJhBl8n+rbpf7O6JXNsgsFGRmSHDb2NJPJR9npgSLDfUx0JdC577UjKFoRftLki
 VmW6o4f9z3QTjKgsnvwZJHP9VNcZ6gwwDbx3A7J0zUmO4z5LZPFLsZ/UcX0sQtUVMyCR
 zxlxfUfHPN5nyLCLSpHvaV9cgwa6Ul+c5aoltCiXJDHjak+Wg+MW9il9sBnIG7YfxbyZ
 YpgLlWsSlbOLb2S6KiQmH7638w7QsIM4eLi4zwTI2jvyHjKm/5dp49fVWIQTbDNAtVUa
 L0JvMVVdMg8zTVPNxjg+8ciMhyAQa9eN7u5R9g4IK1TreBsRleDm5Ln8SmeWXX2XWgID
 wQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455108; x=1688047108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6gxx3XYEw1R0UESSFgF/8EhaZtTdOhlN1lo4gAPxoU=;
 b=Fu83KiPRW+ikHeuZ98GiBREc5L9vnPd11IG3cmw3SGFfcEPusW9/mQbkmiJuu6UfsW
 Wu96cAUK6DgyopGJU2iLmCTvOtbTLJbpV5DHK7H5bUaHN2rAqJgzZVXNxmmUORNGQO1B
 P24FZ77GZ6mE+tSki/fFFjzAuYb7aLT6vnXJOHOqhgNVGx7+1MAVMThmBS6XwZ3VFdX9
 1WIinwQgczPdf4J5wqLoEuyGzeC9Ytj8r88IyqDPe4beT34YFGJfSMbUdyZRPxWEjIFP
 /eEjoxk/+Kl9BgVFn9lhtPXvatYoM0GJHK56nibaXz5rFmZZZg41x+NNlFVKZgqAiQFY
 RULg==
X-Gm-Message-State: AC+VfDxYkAG71K1/PnOf2bk4zFRHlzXbs4xb1Q7ME2xejo7cKFHX3fCb
 hUV02hZ0jXv30N++m+kH7c83uw==
X-Received: by 2002:a17:902:d48d:b0:1ae:87d8:a0c3 with SMTP id
 c13-20020a170902d48d00b001ae87d8a0c3mr2618891plg.10.1685455108178; 
 Tue, 30 May 2023 06:58:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:35a2:c45d:7485:f488?
 ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a170903249800b001b016313b1dsm8172430plw.86.2023.05.30.06.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 06:58:27 -0700 (PDT)
Message-ID: <5192c74b-38fb-7f2e-7b27-58d210c1b087@linaro.org>
Date: Tue, 30 May 2023 06:58:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 02/16] accel/tcg: Fix check for page writeability in
 load_atomic16_or_exit
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-3-richard.henderson@linaro.org>
 <CAFEAcA8E_wbiL=xxc=qzfbhBjTsGVxpMGYex_Ezsn_=47DJP3w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8E_wbiL=xxc=qzfbhBjTsGVxpMGYex_Ezsn_=47DJP3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: uX9vboRdQ54G

On 5/30/23 06:44, Peter Maydell wrote:
> On Fri, 26 May 2023 at 01:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> PAGE_WRITE is current writability, as modified by TB protection;
>> PAGE_WRITE_ORG is the original page writability.
>>
>> Fixes: cdfac37be0d ("accel/tcg: Honor atomicity of loads")
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/ldst_atomicity.c.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
>> index 0f6b3f8ab6..57163f5ca2 100644
>> --- a/accel/tcg/ldst_atomicity.c.inc
>> +++ b/accel/tcg/ldst_atomicity.c.inc
>> @@ -191,7 +191,7 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
>>        * another process, because the fallback start_exclusive solution
>>        * provides no protection across processes.
>>        */
>> -    if (!page_check_range(h2g(p), 16, PAGE_WRITE)) {
>> +    if (!page_check_range(h2g(p), 16, PAGE_WRITE_ORG)) {
>>           return *p;
>>       }
>>   #endif
>> --
>> 2.34.1
> 
> load_atomic8_or_exit() has a similar condition, so
> we should change either both or neither.
> 
> So, if I understand this correctly, !PAGE_WRITE_ORG is a
> stricter test than !PAGE_WRITE, so we're saying "don't
> do a simple non-atomic load if the page was only read-only
> because we've translated code out of it". Why is it
> not OK to do the non-atomic load in that case? I guess
> because we don't have the mmap lock, so some other thread
> might nip in and do an access that causes us to invalidate
> the TBs and move the page back to writeable?

This is about falling through to the cmpxchg below: if !PAGE_WRITE_ORG, then the page is 
really not writable, we will SIGSEGV, and handle_sigsegv_accerr_write will kill the process.


r~

