Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id xu5sm62992656wjc.49.2016.12.13.09.09.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Dec 2016 09:09:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1B21A3E0C52;
	Tue, 13 Dec 2016 17:09:33 +0000 (GMT)
References: <20161208175030.12269-1-drjones@redhat.com> <20161208175030.12269-4-drjones@redhat.com> <8760mnu6ga.fsf@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.90.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com, eric.auger@redhat.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [PATCH kvm-unit-tests v8 03/10] arm/arm64: add some delay routines
In-reply-to: <8760mnu6ga.fsf@linaro.org>
Date: Tue, 13 Dec 2016 17:09:33 +0000
Message-ID: <874m27u56a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 4Br8FgAw+b00


Alex Bennée <alex.bennee@linaro.org> writes:

> Andrew Jones <drjones@redhat.com> writes:
>
>> Allow a thread to wait some specified amount of time. Can
>> specify in cycles, usecs, and msecs.
<snip>
>> diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
>> index 6b0d36b87817..857bdd96a3cc 100644
>> --- a/lib/arm/asm/processor.h
>> +++ b/lib/arm/asm/processor.h
>> @@ -7,6 +7,7 @@
>>   */
>>  #include <asm/ptrace.h>
>>  #include <asm/sysreg.h>
>> +#include <asm/barrier.h>
>
> Hmm this fails to apply cleanly to master and doesn't build as sysreg.h
> isn't in my tree. What happened to it?
<snip>

Ahh I missed this is based on arm/next

--
Alex Bennée
