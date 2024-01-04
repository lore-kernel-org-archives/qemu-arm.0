Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp88522ejo;
        Thu, 4 Jan 2024 05:40:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ+eZ6lisRSw3wMlYt90i8MCkLs1LlckLdPhMxcAx/YAKoeIyYQVXV/BzD0+AUeNqRMgde
X-Received: by 2002:a05:6808:41:b0:3bb:bd4d:5110 with SMTP id v1-20020a056808004100b003bbbd4d5110mr411158oic.40.1704375646454;
        Thu, 04 Jan 2024 05:40:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704375646; cv=none;
        d=google.com; s=arc-20160816;
        b=tTyle3XvNG1iwBwxAf+ZYCajRcA4xeC4wHSHHM1Mh4k0aAP57KwnVN9py+iLZHjdO1
         UQegSIJ1i0WSSEUap65M7ao3aA+J4PfsLMfvRcVodk5PYG8xFk2MY0nDb0KPvgXDPXfE
         tNQtLGevGaCGL3XYj2BgsRe2Vu39FdGtPo17yW51Ne0/C1vFiDSqf/7xedGXB2lrcxao
         r0OsOvwnZimcN8l3tabqjT3BpaZMJnT7grmtXErJ+dV+jCUsjY3aiGfFjeWRERSCMTLU
         xoWwITTZWAj1HUOTPpYwoGWD4eX6kF6/+LUWl2jIPP3axCdtP0Rj6XhHNohOZL0O79gb
         Py4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TyGOTt5YQ5dKu9eEJjLJcTwPgoh0JifEfkWu+PyEtDI=;
        fh=uE8p+EozBs2JBCh2hw0rDNVGp3prF3vzqfS8BqhCpGs=;
        b=sM0IEbM+LRNmVH+B4JVuXu3EexDRKKWccHeqg/iWk3+4MG9dlX29RPV4knQ+evUgqe
         P40P6MGgK2VzgAFbKdTduNY9FIjwWW8T6/mEde3hij+QW04nLDxol8FVKNUq1CyjZyqS
         gZJMLjprFuR4HMxoKTWt2Dn378db2giPI+86CYyRoh8Zd8PheAxBNDfKw42vgwPAxLnQ
         P7okxGGmj1/pQsTEeBc+dV06Mhw3sPJtaTcvc52iWyr42QEiofg0RsPqn0dFY6mr3Tty
         i+uqLs3H+Ephkt5qNRMAKAEFVKaF+IZvmhkE1X2uwtDJMtlHsMYiyQ0Kkit5n0G++UnO
         oNYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdbhDYSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a0cf38a000000b0067efde87a92si31232928qvk.194.2024.01.04.05.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:40:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdbhDYSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNxY-00008c-SM; Thu, 04 Jan 2024 08:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNxQ-0008Ub-Kj
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:40:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNxC-0007CD-4p
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:40:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so3693605e9.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704375607; x=1704980407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TyGOTt5YQ5dKu9eEJjLJcTwPgoh0JifEfkWu+PyEtDI=;
 b=gdbhDYSZymnT4Nc+19kw7Zk976DvAeteKQJQyFtR6XHZS9MmFMGFUMmwRNdmuPitNz
 97h0wTASt5EcvsVQjB8/tfbYM5/qZqsnhO/y4FI4I2ah0nkWQM9BgyPlDl1Sp6epQCiO
 hMxn9q0sNGGt+u4zTb4Q8KS1yOeLJchr1rW55Kkdumyg1Fkl1M5BbZEEaL7inWW5Ov0v
 iD0z/Utv+oOLVJ8EpX5J/O2ZAtweK0UG3kp9p+y5N0e1v1px6pwt5YPvxiEUkCgflBPX
 X1Fhblr4KJsHBCjvnNDkCqRaARN/vdpabHcZXC7lQP+0hbMWLN4tesBYxDA0I/+OKKv7
 QcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704375607; x=1704980407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyGOTt5YQ5dKu9eEJjLJcTwPgoh0JifEfkWu+PyEtDI=;
 b=R4lfhoJBE/wPNQr9naYUkmxJTV6sKuIOG8MVi8w5vnW2bXUd+0oJx/NzOl89DXhimg
 sClBst6Npfcqb6Gudh9CPvzh7rEKgsQx+gizpTKF4qi6EsyDIVlE47ZxhAjXgqsMQvdk
 9Xt5tbPsv9Yo/mbsWAaxRnrOCRQ67YDqN3R5WkvPsnhqQgCVCRX+aWVtIExc0HCP9FGV
 ldmkSRKFGLw5Pwk7NVXSKc1OWB8Fk5NGikGzv88QgyFnbBWWVsX9P7A5aLfBr5BJ6Mre
 Saz4+i8GureolkIvsK7ZzSp8Btn6oKQVmA6xVH2aqm4vmCp3W+gTdweKb5CgIIIpWiMY
 EUIQ==
X-Gm-Message-State: AOJu0YzleHB8IdsaSH2mVwFJirKnUu/RCXx2TEiIXYbJ/SFYngUZsp7E
 orJ1z7GVSis/N6yJN3uTVR/vNUZ68TECbw==
X-Received: by 2002:a1c:6a15:0:b0:40d:77d9:8d80 with SMTP id
 f21-20020a1c6a15000000b0040d77d98d80mr403977wmc.44.1704375607155; 
 Thu, 04 Jan 2024 05:40:07 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b0040d6d755c90sm5763131wmo.42.2024.01.04.05.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:40:06 -0800 (PST)
Message-ID: <b0f06e83-aa11-4990-a3ed-e6738e7ebbbf@linaro.org>
Date: Thu, 4 Jan 2024 14:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] hw/misc: Implement STM32L4x5 EXTI
Content-Language: en-US
To: Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
Cc: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-2-ines.varhol@telecom-paris.fr>
 <908650b4-3bb2-4cf2-8909-5bffc622950f@linaro.org>
 <877ckpgrie.fsf@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <877ckpgrie.fsf@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sfrUi1J3MIM8

On 4/1/24 14:23, Samuel Tardieu wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> This doesn't build:
>>
>> ../../hw/misc/stm32l4x5_exti.c:172:9: error: expected expression
>>         const uint32_t set1 = value & ~DIRECT_LINE_MASK1;
>> […]
>> I could build using:
>> -    case EXTI_SWIER1:
>> +    case EXTI_SWIER1: {
> 
> Out or curiosity, which C compiler or option do you use for checking? I 
> have no problem building this using "./configure 
> --target-list=arm-softmmu" with GCC 12.3.0.

C compiler for the host machine: clang (clang 15.0.0 "Apple clang 
version 15.0.0 (clang-1500.0.40.1)")
C linker for the host machine: clang ld64 1015.7

If you don't have access to similar compiler, you can fork on GitLab
and push a branch to trigger the CI; I expect it to fail.

Regards,

Phil.
