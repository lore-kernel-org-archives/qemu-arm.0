Received: by 10.25.0.23 with SMTP id 23csp294687lfa;
        Wed, 14 Jun 2017 05:44:03 -0700 (PDT)
X-Received: by 10.200.52.82 with SMTP id v18mr558853qtb.214.1497444243754;
        Wed, 14 Jun 2017 05:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497444243; cv=none;
        d=google.com; s=arc-20160816;
        b=iwI/VlI1gBQp8FoVzjOPvcswjtrDZ2Td/7OkqmgJ2HRHwh7RHKN0/vOGJtus2cKZ6o
         MYCOjJ9igDLhn0J7lC/HFEfEPFZj8grdluOavT3ToUn+yXQZGfy+3mTegfhka/+Fx3nC
         d2FaRnxi7KC1qp0IvN543KajlHhzHVgapHvhYbDxL+Ls5PBfDrKJ8ItBQiCimBARm5+6
         a0fBJxkhN5GScGrekNJ3H63I5MDxE6TTRrtjGBJvmfKc/Qt+H6SLTMX6H2wajLzpF4uE
         j4xRsszVRN6UeCl7VzGGJ/2aY/ggsPM+G1vf8CbDhZlvPFQuaKMW/NnGeh1bJWe0GKuA
         dsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=UBOJ0B352OGafMtSgmvgMYPftubArbmM1EB1H4ctNdk=;
        b=c9xR51Ixww98Oe4olYZiz5w9KSJpL11Qq3HI5mNX9nniOtZiN6q5zve4YEYKMSIwWX
         Tn2dqcVQ5f+EXVpnKjDBz3eY11AM3Qjg9tjybauvQfQk+7n4nzyIjkL6e7y/3ekO+5+e
         X6GOzduIAkLEs6E4toJOnf4CjzWHCgDsbRiAf9AMNEwFrhbiBEHsuSFtsn19ggmm0h9w
         //rXRMyx0yvPq2Z4fi9k++WEQ7Px+PCo0MJx0sfpfdfpaDHd45g8R80spUdW619jGnLc
         UrOdhgIsMxuVHE/1kKc2cFBpOxeMfA41bYXLnErlAEEnDQ5W4ivd4iNxgD1HE73Ss0en
         rkRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h134si559617qke.104.2017.06.14.05.44.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 05:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98BCD80C12;
	Wed, 14 Jun 2017 12:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 98BCD80C12
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 98BCD80C12
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v5EChxJP030965
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Jun 2017 08:44:00 -0400
Subject: Re: [PATCH] target/aarch64: exit to main loop after handling MSR
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>,
        peter.maydell@linaro.org, edgar.iglesias@xilinx.com,
        qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        "open list:ARM" <qemu-arm@nongnu.org>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
 <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
 <87vao4b4z5.fsf@linaro.org>
 <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
 <20170611050730.GA12317@flamenco> <20170613225352.GA26288@flamenco>
 <db800d74-7cfa-d9e3-60d7-3e7b19565b9b@twiddle.net>
 <5036e9ad-257a-b098-5093-050fca825627@redhat.com> <87r2ymiyht.fsf@linaro.org>
 <9c7ea148-2ca7-ec56-48ed-eabac0fe7896@redhat.com> <87poe6ix5u.fsf@linaro.org>
 <f185840b-5390-7df7-2450-f846f6af8a84@redhat.com> <87o9tqiw6g.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ab7ac96a-2c72-816d-0435-49e744522035@redhat.com>
Date: Wed, 14 Jun 2017 14:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87o9tqiw6g.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 14 Jun 2017 12:44:02 +0000 (UTC)
X-TUID: 96oV6/OO1Gwc



On 14/06/2017 14:35, Alex Bennée wrote:
>> That would cause an unnecessary slowdown in code that runs with
>> interrupts disabled but does a lot of indirect jumps...  ppc's SLOF
>> firmware probably qualifies.
> 
> Really?

Yes. :)  SLOF basically runs a Forth interpreter.  If you run
"qemu-system-ppc64 -d in_asm", you'll see a lot of "bctr" and "bctrl"
instruction (respectively ARM's "br" and "blr" IIRC).

> I'd have to measure the change it makes. Is there a benchmark
> stanza for measuring the PPC slof firmware time?

Just booting.  PPC doesn't have tcg_gen_lookup_and_goto_ptr support yet,
so it would be a theoretical slowdown at this time.

Paolo

> I have 3 patches now which all fix the same thing so we can pick and
> choose which we should apply. Patches incoming...
