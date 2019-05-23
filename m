Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1850973wrg;
        Thu, 23 May 2019 08:12:17 -0700 (PDT)
X-Received: by 2002:a67:f297:: with SMTP id m23mr44220509vsk.109.1558624336948;
        Thu, 23 May 2019 08:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558624336; cv=none;
        d=google.com; s=arc-20160816;
        b=0RJaOxCa4IJRhVMsqPHbYGfJ6TT5CD9TZRlsS+rYx4wpzrRVDeY3trE6PEdzdILBHx
         cav5kuw6RyHOng/SJkyUWg3/U5xj0ZAQyBSmcIh1eobpa7nZVxH339vkqgkJnU1WkevJ
         wuLHN1WiGnPM3023TKs/U1fgIE7hJHcUame3lQeqsDi23iaoJ2tZ0ONNe2bqK6TMElaR
         lnAJnVffS31WcTC42V3HBE/hX37D1E0NYwF2GzFRM7zxH/yvmjPR/598nSXvozMX5k0L
         N7pUbMnIvc/k5t5SolrI2L5NckXzSNwbFFXfrT1BkLYg7MMPDd1dzFtgiCpWRkUQHISb
         MGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=VtX4706PwqW+Myap8+XCUmAg/m3A5RvWOGN+9V+MaPc=;
        b=GZZpasrzHnKYENxNcPVyovLp8y9eZwZ5e2FEB73NnT+0QEV9c3TgtO2VncSyVWIJPe
         HuiyAavfW5I5oA6EupISNHc8JyBdj/IsC7YjHSn2B5YmLEcT6JCzSv+Ib0nqyruyRfvf
         TacXSEKPqUJ0I8FjhRnKWP4uO/vyi1iDdw34iaCFvO6tt+cESVXJqkJNJk8hsIN40smt
         ObgPNiMSaKmTusdO0i1Bg9oplb8eAWvKPpuhCG3Wqk1AbAwtxrdVL8LWhbkdCxN3ZP92
         /x91PR5+PbfJSGchfBaeymPTICMESwiRijtSR/KT0anL/ztBvMUQ/oDbbu7MWjV5oTEA
         HuTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypFqGqnD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h12sor5537648uar.53.2019.05.23.08.12.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 08:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypFqGqnD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VtX4706PwqW+Myap8+XCUmAg/m3A5RvWOGN+9V+MaPc=;
        b=ypFqGqnDy2VJFE3RjhUVHdp5AEDZQzvID8CAm2X/ews9H9kfm4Ck65QjIoFCOSD7s4
         vgo8NAaBkpsZhw1ycf1LwJKz3mrxR2+uKcZG0x3jByN99pTzm49K7hZUG0kWN01t8nrj
         p5pVc9tf1iexOlUukJZCn2vyxCxtfDBlur3udmbG0S5nSQLernDfjw+8YVCKHRPJzTv6
         f1bzmvzo72lCpdnmcMjeeZTEC5n/agjqXBdFb6aXDR8oJ/MjfIR0X+rti00HyJ6K4UeJ
         e5uv+8FpvYeLZ1FG7J34yWcVFm3UCm2/NrSJkvoMve+amLzn3vjPaSffVsd/4Ml3g/mn
         aXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VtX4706PwqW+Myap8+XCUmAg/m3A5RvWOGN+9V+MaPc=;
        b=QR9dl+GcOjowf7H/lulc6O5SSg25CIMqyBVQr2118xEPCxwT2iUsJq8Xj4kzA6EF2L
         hvhjXsHN/ts5p7oxBWgo1tSoH+Fiq6rHPkKT5IciIXKXdNRFZ0KwBSv49Wq7F9iXjC3W
         L13x4CGod7iYIklD/UQnAvDkLbTCaY8MpKIbeq8V5PXFlGHlfJf1FKZ+dMkuu9SmkhiD
         kTJFy60d3umI+UltS43HV0NjnQig2YMuWgFNEIItoGjXIHx4IobZNjj8aboAK61PjB3Z
         CzdJRf/YeON68ecqU8lHsy0o3itzYEjVJ/r/HHdmnAgihE3HErVGdmDUsPY72jNYF25c
         fJSQ==
X-Gm-Message-State: APjAAAU8g0kYIoamJSPGUsJ++mqjtr01J7NrxluaSF56t1CZ1DPShe/2
	CQmt44VIu+gs9Kp6JzSZHrNm6PBp
X-Google-Smtp-Source: APXvYqzT3Kwo2woL6jg4oUyvmyCrNYbrR+4hmpr8v/MUKLqLAig7EoKu4Pj+niVmhPAg5l864B2UYQ==
X-Received: by 2002:a9f:3dc6:: with SMTP id e6mr45710277uaj.33.1558624336440;
        Thu, 23 May 2019 08:12:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-215-183.orldfl.spcsdns.net. [173.130.215.183])
        by smtp.gmail.com with ESMTPSA id e76sm18055059vke.54.2019.05.23.08.12.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:12:15 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 06/28] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio
 <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ff7b3b75-1e08-cb51-5070-2042b9a329ab@linaro.org>
Date: Thu, 23 May 2019 11:12:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 75NZl8WeKWkG

On 5/23/19 6:25 AM, Alex Bennée wrote:
>      case TARGET_SYS_WRITEC:
> -        {
> -          char c;
> -
> -          if (get_user_u8(c, args))
> -              /* FIXME - should this error code be -TARGET_EFAULT ? */
> -              return (uint32_t)-1;
> -          /* Write to debug console.  stderr is near enough.  */
> -          if (use_gdb_syscalls()) {
> -                return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,1", args);
> -          } else {
> -                return write(STDERR_FILENO, &c, 1);
> -          }
> -        }
> +    {
> +        qemu_semihosting_console_out(env, args, 1);
> +        return 0xdeadbeef;
> +    }
>      case TARGET_SYS_WRITE0:

You can drop the braces now that "char c" is gone,
which will then fix the indentation.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
