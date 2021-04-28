Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp634704lfb;
        Wed, 28 Apr 2021 06:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDr6UaAlC1jgulScPG8JuKckTorG/chpikmAeuJ2WXGvR7RQklhgtAxllzUZt+Of61DEM5
X-Received: by 2002:a67:f281:: with SMTP id m1mr24559671vsk.24.1619618381065;
        Wed, 28 Apr 2021 06:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619618381; cv=none;
        d=google.com; s=arc-20160816;
        b=fhJ6PHfvk6bbWhus6PcJK7cd17IKaNh5cYNK1vtKMdSJ6+MWGE1GddoSF16YyWsVMx
         OqZQS8wyXGW6COP3XSeumjbCXqG8bVmsRD3dKNVPe5fd+/MNDkj3m0qaTU9Y/FmxEUbM
         6nUoagoRH0cisb+aWALSMianFcu6pIwfIq1SP97ps2ONekAo4Zy5Thmf8XTtNNoyfv1W
         tJMlqbtIaqgqfpqt+HrQtbCQGOh32arLhIFnKfR/Cr7XmbMLbOiqf7B/SrgAtf7YaLsT
         fLehcWXV/S9TPnhfKY8EJpNVLxNpkP1it6/t/rBz2HFqjxylsAZHsScTqf8Yg2ZSgOqN
         UVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CdYpkNV7QgbQdn8pX64m1wgplTR7dgxwO922EwsgMRg=;
        b=ovaJdOIFp1XcCMbIYj8NCKl1Z6X2X5qEj+b4XBTJir2OF/+XajeGJrFma/vwZ2B+7M
         sepi3VikN67M8NUusXa/SozrG22qvoTYZpC7k1tgwbGCxa0+KPddQWHhbRtFoXqcI06x
         HA5xeBic85ntD0vF1sphkHq6WYFNurwrtMspS59mvOpi8hCSHG2P+uB8dTK99b3XgAnQ
         6atXEy6K+8FZblWuGSIBlWrRnaTy14Br8zT4Jk35E80+aNTTrtbay7mUT/lBNFIyt6c5
         9ELDiVHJoW7AfDpX7UeRbpqys+P/QgZmaoidJMBhXjYxqONpRs1HMHKNhgCEwaJBlWiA
         9yWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=alexandru.elisei@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <alexandru.elisei@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id d24si4736923vsl.308.2021.04.28.06.59.39;
        Wed, 28 Apr 2021 06:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=alexandru.elisei@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81EA4ED1;
	Wed, 28 Apr 2021 06:59:39 -0700 (PDT)
Received: from [192.168.0.110] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BCF23F882;
	Wed, 28 Apr 2021 06:59:38 -0700 (PDT)
Subject: Re: [kvm-unit-tests PATCH v1 1/4] arm64: split its-trigger test into
 KVM and TCG variants
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, shashi.mallela@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com
References: <20210428101844.22656-1-alex.bennee@linaro.org>
 <20210428101844.22656-2-alex.bennee@linaro.org>
 <eaed3c63988513fe2849c2d6f22937af@kernel.org> <87fszasjdg.fsf@linaro.org>
From: Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <996210ae-9c63-54ff-1a65-6dbd63da74d2@arm.com>
Date: Wed, 28 Apr 2021 15:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87fszasjdg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: wDbAF4BcRIm3

Hi,

On 4/28/21 1:06 PM, Alex Bennée wrote:
> Marc Zyngier <maz@kernel.org> writes:
>
>> On 2021-04-28 11:18, Alex Bennée wrote:
>>> A few of the its-trigger tests rely on IMPDEF behaviour where caches
>>> aren't flushed before invall events. However TCG emulation doesn't
>>> model any invall behaviour and as we can't probe for it we need to be
>>> told. Split the test into a KVM and TCG variant and skip the invall
>>> tests when under TCG.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Shashi Mallela <shashi.mallela@linaro.org>
>>> ---
>>>  arm/gic.c         | 60 +++++++++++++++++++++++++++--------------------
>>>  arm/unittests.cfg | 11 ++++++++-
>>>  2 files changed, 45 insertions(+), 26 deletions(-)
>>> diff --git a/arm/gic.c b/arm/gic.c
>>> index 98135ef..96a329d 100644
>>> --- a/arm/gic.c
>>> +++ b/arm/gic.c
>>> @@ -36,6 +36,7 @@ static struct gic *gic;
>>>  static int acked[NR_CPUS], spurious[NR_CPUS];
>>>  static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
>>>  static cpumask_t ready;
>>> +static bool under_tcg;
>>>  static void nr_cpu_check(int nr)
>>>  {
>>> @@ -734,32 +735,38 @@ static void test_its_trigger(void)
>>>  	/*
>>>  	 * re-enable the LPI but willingly do not call invall
>>>  	 * so the change in config is not taken into account.
>>> -	 * The LPI should not hit
>>> +	 * The LPI should not hit. This does however depend on
>>> +	 * implementation defined behaviour - under QEMU TCG emulation
>>> +	 * it can quite correctly process the event directly.
>> It looks to me that you are using an IMPDEF behaviour of *TCG*
>> here. The programming model mandates that there is an invalidation
>> if you change the configuration of the LPI.
> But does it mandate that the LPI cannot be sent until the invalidation?

I think Marc is referring to this section of the GIC architecture (Arm IHI 0069F,
page 5-82, I've highlighted the interesting bits):

"A Redistributor can cache the information from the LPI Configuration tables
pointed to by GICR_PROPBASER, when GICR_CTLR.EnableLPI == 1, subject to all of the
following rules:
* Whether or not one or more caches are present is IMPLEMENTATION DEFINED. Where
at least one cache is present, the structure and size is IMPLEMENTATION DEFINED.
* An LPI Configuration table entry might be allocated into the cache at any time.
* A cached LPI Configuration table entry is not guaranteed to remain in the cache.
* A cached LPI Configuration table entry *is not guaranteed to remain incoherent
with memory*.
* A change to the LPI configuration *is not guaranteed to be visible until an
appropriate invalidation operation has completed*"

I interpret that as that an INVALL guarantees that a change is visible, but it the
change can become visible even without the INVALL.

The test relies on the fact that changes to the LPI tables are not visible *under
KVM* until the INVALL command, but that's not necessarily the case on real
hardware. To match the spec, I think the test "dev2/eventid=20 still does not
trigger any LPI" should be removed and the stats reset should take place before
the configuration for LPI 8195 is set to the default.

Thanks,

Alex
