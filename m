Received: by 10.28.71.155 with SMTP id m27csp966337wmi;
        Fri, 6 Apr 2018 10:28:03 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/M0x85hyYvi0qvqIui9fpJjgZaj6tDD/QsXkOARYlv2tKp6bN/vk/80NFfpG33jk33S1wl
X-Received: by 10.223.168.4 with SMTP id l4mr18029943wrc.170.1523035683865;
        Fri, 06 Apr 2018 10:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523035683; cv=none;
        d=google.com; s=arc-20160816;
        b=Fxkwonz84teuLoAz87o5gYJ/c2hhbPvGHCvU+QIfHmCM2Op1tGrknS2z4W606Bm2zB
         fj19SfYCXl9fJ6NwJTk8RPK3j2n8yFtpgOSFPmKHtYO4zcbvy1Qp2Na84IlaqToGqUOX
         3WEocwq2m8fj8Ajz/tIfnrFYZVpALLcz2ZFZjP8bMH+GIgFldDwZGz3bZ9rxFKsGxVsO
         rYCDLqGLy/riGN4to3GXWgz81nLEERl34Tw/AE7ejMHW1ZmQe598PTyGCIcxo+SqjboG
         C/bGsYUoRbb1L9x9k2WnB75m1TOeO6DJti+vWMcXYAOK9q5Q5LwPwodUjR+mstyEqlAR
         cdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=au/mpbww5qOQkj002BPaM6M8foWm83TpFi3c1/biqPo=;
        b=gxO3wdjlEQ6EuFg+AFRcwCdrnKv4kGXQmsRFurWFZQgPtwd/ZTqmQQWcjECV8e8Dd8
         Qap5AwJF6dOvCXXVtPaM1xeJGmK5LMs4ZgOQWi9DKBPEcxlMtnLNBVEcOiVzzdnVsxYv
         3OSznKsAJt6Dy+jl1nM8cqq/b1mpqYmai7n8dMadX3KsP5CL85ggPHFkQovjg3c1L5/x
         MgtdoN7fwRqwVf65obefXMu3mEPz/HW33ic7xgCwHVvzjnnK+67WHMNexY6Fx+GmpOa0
         nFWDjraAHvp1L7EfLEpg4KfQKOnz1ofGpf5CjkuKx42EePUD0fMnFUpYCz3N989FEzvu
         rruw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id 22si7636873wrw.358.2018.04.06.10.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Apr 2018 10:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 9370 invoked by uid 484); 6 Apr 2018 17:28:03 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.190145 secs); 06 Apr 2018 17:28:03 -0000
Received: from unknown (HELO [192.168.187.23]) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <qemu-arm@nongnu.org>; 6 Apr 2018 17:28:02 -0000
Subject: Re: [Qemu-arm] [PATCH v5 3/3] target/arm: Add the XML dynamic
 generation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, khaled.jmal@lauterbach.com, qemu-arm@nongnu.org
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <1521034084-17344-4-git-send-email-abdallah.bouassida@lauterbach.com>
 <87h8orcg3a.fsf@linaro.org>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <7a39d3f5-af2b-e21d-fa10-798b67fe4f63@lauterbach.com>
Date: Fri, 6 Apr 2018 18:28:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87h8orcg3a.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TUID: CRnPKufvc6VI

Hi Alex,

First of all, thanks for the review!
>> +static int arm_gdb_get_sysreg(CPUARMState *env, uint8_t *buf, int reg)
>> +{
>> +    ARMCPU *cpu = arm_env_get_cpu(env);
>> +    const ARMCPRegInfo *ri;
>> +    uint32_t key;
>> +
>> +    key = cpu->dyn_xml.cpregs_keys[reg];
>> +    ri = get_arm_cp_reginfo(cpu->cp_regs, key);
>> +    if (ri) {
>> +        if (cpreg_field_is_64bit(ri)) {
>> +            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
>> +        } else {
>> +            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
>> +        }
>> +    }
>> +    return 0;
> There is something odd going on here because if I run a simple little
> features binary
> (https://github.com/stsquad/testcases/blob/master/aarch64/features.c) I
> get:
>
>   ID_AA64ISAR0_EL1    : 0x0000000000011120
>   ID_AA64ISAR1_EL1    : 0x0000000000000000
>   ID_AA64MMFR0_EL1    : 0x00000000ff000000
>   ID_AA64MMFR1_EL1    : 0x0000000000000000
>   ID_AA64PFR0_EL1     : 0x0000000000000011
>   ID_AA64PFR1_EL1     : 0x0000000000000000
>   ID_AA64DFR0_EL1     : 0x0000000000000006
>   ID_AA64DFR1_EL1     : 0x0000000000000000
>   MIDR_EL1            : 0x00000000411fd070
>   MPIDR_EL1           : 0x0000000080000000
>   REVIDR_EL1          : 0x0000000000000000
>
> However in the gdb output we see:
>
>   ID_AA64ISAR0_EL1           0x11120	69920
>   ID_AA64ISAR1_EL1           0x0	0
>   ID_AA64MMFR0_EL1           0x1124	4388  <-?
>   ID_AA64MMFR1_EL1           0x0	0
>   ID_PFR0                    0x131	305   <-name and value?
>   ID_AA64PFR1_EL1            0x0	0
>   ID_AA64DFR0_EL1            0x10305106	271601926 <-?
>   ID_AA64DFR1_EL1            0x0	0
>   REVIDR_EL1                 0x0	0
>
> So why the discrepancies?

>  ID_AA64MMFR0_EL1           0x1124	4388  <-?
>  ID_AA64DFR0_EL1            0x10305106	271601926 <-?
I get the same value in x1 (= 0x1124) and x2 (= 0x10305106) when I execute 
the following instructions on the guest:
  MRS x1, ID_AA64MMFR0_EL1
  MRS x2, ID_AA64DFR0_EL1
So, I think that there is no problem on how GDB is reading these registers!

>  ID_PFR0                    0x131	305   <-name and value?
This is not ID_AA64PFR0_EL1 - the ID_AA64PFR0_EL1 is not registered in our
dynamic XML as it has "ARM_CP_NO_RAW" type.
So should we add some modifications to handle this special case?

Best regards,
Abdallah
