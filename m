Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2895045njc;
        Tue, 17 Jun 2025 18:44:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLcxhLxQxvydQtAMjh1NOyYCvJXTMxMrXVdaOvRA5Z9JuWX3FNiw9jR8xtEjcXIfRE6Mi3nigizO+SMA==@linaro.org
X-Google-Smtp-Source: AGHT+IEMNJ3emQ3nHmxiM4wBdLd7CaX+EK776WX101X7IHhSrMqNPDgkqkNY3WPuhBDriBN6Xr42
X-Received: by 2002:a05:620a:199e:b0:7c5:5cd6:5cf2 with SMTP id af79cd13be357-7d3c6c1ee66mr2195063785a.17.1750211087832;
        Tue, 17 Jun 2025 18:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750211087; cv=none;
        d=google.com; s=arc-20240605;
        b=URC4XfApp/9PEC8VFufnbyIXAxBSgIcdW7ZDCJQaOiFl75T/pR2YYAUy4AVuAlp7YD
         v5tGYTUnevV+VjBa4WZEKB0dYi8S19B2rUrI1MHPQDjxOwOpVynydMYmAlVw7v46KoEq
         ECtJv0M3fcfJ53PphA+KZCFkNLXieNLLwBMj//GjNNCDgDFbHL+3pp2GKGsn1WXNDVVA
         niIuv3/WcPHiVgfJsgVnUZOurfEX7w4JRIBOPZp5lg7AG2z3TlQCCUbyJUmFSAXEJTzK
         DHx2NxVu+vW+OIhHmaJI6jMrzBElyG0xyaS0GpRUu0v9mt2qONRkYI4DISiFNXjRnwO4
         EhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RX+3aU0eDanYb6DkwNX/vUApo5z9SdgWf84aaYJNi0E=;
        fh=lCcDh4eGOiXHSn/Qw6cbEAFDVC4JBLKOi3hHkkhbP6k=;
        b=hmVw+2c0cRLZ/0+oDZNpbJeJxT6YGZIGdqIoQTIEhnzRtaOxyOGOR+QcDmdJhDmquy
         ZUOFYw8PwGuB4p9KsITXi8BGzf9DtGXYldHrs2ZvKfIHwC1KcJ/R+Dexr5LXf9O9+3Gg
         n/zUXe9taK1MEuRfIsn0Vu4S9sYygclsitcQ8MFHccZpqQsqS4Y6CLjNwmlLaX3de9NI
         WccckMLZbqCg2tc+4ilPA9h83DuFEPSHMkHZQ5lRPUnlCkt7Zyi66IHQcU3eaCBjhjJ0
         /wD1TPLTGr+6NgVS9bCDAwytyUBQLhfpeQ8YDEHENHdSNi+Ixeo4y2CzuWi2lmOOLEj7
         2s1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scFKVGWz;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f30639si1296756985a.521.2025.06.17.18.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 18:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scFKVGWz;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1uRhqY-0003I7-49; Tue, 17 Jun 2025 21:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uRhqW-0003HD-FJ
 for qemu-discuss@nongnu.org; Tue, 17 Jun 2025 21:44:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uRhqT-0003ct-HV
 for qemu-discuss@nongnu.org; Tue, 17 Jun 2025 21:44:12 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-313f928718eso3061434a91.0
 for <qemu-discuss@nongnu.org>; Tue, 17 Jun 2025 18:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750211047; x=1750815847; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RX+3aU0eDanYb6DkwNX/vUApo5z9SdgWf84aaYJNi0E=;
 b=scFKVGWzDSfFRwPVm2vDRBJAlyjNMUPUJGprTotuEkShXe3a2AEucX49MR13An9Zey
 vgCGvsMkDAFAG2POx0cXWD/EAQwZZ1Nuw+JIgXy4wpD7YE7gOsp9J9FwONVUU2ME532u
 N3saX1dA9RYA4WOemUPVNG8ctpDlPq0iV1E6bLfDK46/lfATuA6J3AY3UxeXP/Uc78b1
 oWn5GFepcCkJNhvUi+/YN3krgpsgULz5YadlJYcml6yrQE3j1j0WMOtuQMXKCwOPLyd+
 MNz5/cFgrYXS61VeFwRieXSY4zOZeA9B25F8SDFBlLX+0QVePcH89UP6lJf8RqhE/DJk
 n3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750211047; x=1750815847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RX+3aU0eDanYb6DkwNX/vUApo5z9SdgWf84aaYJNi0E=;
 b=M7p3mKo3cVZpSHfv06HzX7Zn33PCDm4uCZ+goVPRSOA6wu8I6EGPlknaHMN38MrpiJ
 BHqB6u2RvXRj53p5KNTVkKC1SO8ju+0tOfSAb2oM9QUS0MJFnpwYD7xbOhoZQL4VYQWL
 h5dGjM5SakFIRNemLVs+lEGZKzPqIToLum3xXqjMMsHmTzk1x+vEa6Hz7dkehu5b3/hq
 0pZRMtaqhzrGsvbU9QbEBPHW8OiJJh6yFv00iqZWtkrux9YWHATI41c+0s/bRPD2GYs1
 U/cQDvitCYCnPgw/uHf7dgxH3+a6vZPj+2v2uMHKIiISFDGZwkuQCPEfP+iJhSxk0Ttb
 RKUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpCYNMZ2MgFgOgCtA4431JSidCBe5w7iRy/9NmRqYqnp6pSHQcAavESOouu/csMWv/0FgINeUkG2FnMFc=@nongnu.org
X-Gm-Message-State: AOJu0YxqYpHrAUkMa+BTdEJzKfVyo599RsywRL6rysqJbwTcfwufMFrk
 bsV6whwMYA79no8d9VpImeFTbNNXeWwFd+VeD6YWLInZIupRukIL05Hx1j3EXRk4hKA=
X-Gm-Gg: ASbGncul9+jK8AVs9E64WKeFnE8H+bCF2skZKAc9jgZ91IH4i/SV+YoH987y2iUYfYe
 LKF1FlJemu8czjLTFgBiOR3TgmPZrIlAKwzorzRkOE8Sq1SnXc8S12DtQhV96p5WPJ4KWN0mrmd
 qY0iHFXL/QpR717S+Sr8Jv5xUHy0lueWS1zK6V7JJDuaM1/NELryjNMK6E7Jt4Fbf2tYXM/PcPt
 h0KIdWgZnwPyD371xDJcUWdmEXKYseRIN8x9T4r13jT4QVzqPkXcXOGkiPdJH7I5iEWJVDtRtol
 +PAHTeYLdcdSBR3b+tXS+GdRrtFlzls+X6EUU6AXImKaUeo1Jwv2fOTiVwx7ShiXHHTaPFjRqWP
 U3KZM8PTXBFEWjVtLeNLKLa829Spb
X-Received: by 2002:a17:90b:1e07:b0:311:f99e:7f4e with SMTP id
 98e67ed59e1d1-313f1cae835mr26944248a91.16.1750211047370; 
 Tue, 17 Jun 2025 18:44:07 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0cffe6sm87274865ad.245.2025.06.17.18.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 18:44:06 -0700 (PDT)
Message-ID: <3e1e6a7f-18d4-4667-b1a7-6857bdc3de66@linaro.org>
Date: Tue, 17 Jun 2025 18:44:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QEMU emulating ARM Neoverse N1 unexpectectly emulates `retaa`
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 root@wjsota.com, qemu-discuss@nongnu.org
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <1235E663-AD2F-499E-8CF9-16E54A1C01DD@wjsota.com>
 <7d1ddf7e-b16c-4820-958c-0d03bf8479d1@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7d1ddf7e-b16c-4820-958c-0d03bf8479d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z8g6Tu/YeZT2

On 6/15/25 22:09, Philippe Mathieu-Daudé wrote:
> Hi Solomon,
> 
> Cc'ing the qemu-arm@ list.
> 
> On 14/6/25 06:51, root@wjsota.com wrote:
>> Hi!
>>
>> Is `qemu-aarch64 -cpu neoverse-n1` supposed to emulate the `retaa` instruction?
>>
>> I have a binary called `main_pac` compiled from https://learn.arm.com/learning-paths/ 
>> servers-and-cloud-computing/pac/example/ .
>>
>> The compiling command is `aarch64-linux-gnu-gcc -march=armv8.5-a -fPIC -pedantic -Wall - 
>> Wextra -ggdb3 -O0 -mbranch-protection=standard -fno-stack-protector -fPIE -static main.c 
>> -o main_pac`. The binary includes the `paciasp` and `retaa` instructions associated with 
>> ARM PAC.
>>
>> ```
>> (gdb) disas main
>> Dump of assembler code for function main:
>>     0x0000000000400858 <+0>:    paciasp
>>     0x000000000040085c <+4>:    stp    x29, x30, [sp, #-32]!
>>     […]
>>     0x0000000000400898 <+64>:    ldp    x29, x30, [sp], #32
>>     0x000000000040089c <+68>:    retaa
>> End of assembler dump.
>> (gdb) quit
>> ```
>>
>> When emulated using `qemu-aarch64 -cpu neoverse-n1` , the program completes without issues.
>> ```
>> user@dell-op7020:~/learning/arm_learning_path_pac$ qemu-aarch64 -cpu neoverse-n1 
>> main_pac test
>> Hello World!
>> user@dell-op7020:~/learning/arm_learning_path_pac$
>> ```
>>
>> This is the case for two versions I tested:
>> - v9.2.1 (Debian 1:9.2.1+ds-1ubuntu5)
>> - v10.0.50 (v10.0.0-1610-gd9ce74873a)
>>
>>
>> The expected behavior is for an Illegal Instruction exception to occur. Citing the Arm 
>> A-profile A64 Instruction Set Architect Version 2025-03, the `retaa` instruction should 
>> return an Undefined Instruction error when the PAC feature is not implemented.
>> ```
>> if !IsFeatureImplemented(FEAT_PAuth) then EndOfDecode(Decode_UNDEF);

Yes, trans_RETA() is missing the pauth check.


r~
