Received: by 10.25.0.23 with SMTP id 23csp250144lfa;
        Wed, 14 Jun 2017 03:46:26 -0700 (PDT)
X-Received: by 10.237.43.134 with SMTP id e6mr5295759qtd.211.1497437186094;
        Wed, 14 Jun 2017 03:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497437186; cv=none;
        d=google.com; s=arc-20160816;
        b=ZaLo5hVEFiqEbwOg16Nyurtq8IgbHYV6JfNzZtPHax12q0FNm9qtxV3gowywJKopQ1
         GQ5v3UFqvJ8sErXyv+UXR1QQkNdsDxaqQtOlCr7eesdbrFswErH1Q+Y7L8tb0tY4HPhH
         0Lf77odp9ryUJucQJFIXDR60ETKGIIxk5Fzf4QlbeF+8y2tv/fBqYAc0i6uJoHyrSTNL
         AN8zySrRvZZebxCIBJKbMIJCoZ4egERcy8bYjIIo1UT0sp7S/LT103ZKUnCMzcxatEgk
         jmpBEJKMpUxS2ji1wi75TAeE6Oosf021uaQDltAURmFcDCkhQ+ufbsAqf9h0Sb1zQWBn
         Hdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=0Ftc1lyvAYof7mCs5mdPSRNBV1zDJmFhp2Uefe5M1Og=;
        b=RcV70X2viICxcPY6O8w8OUmzvxOa7V5UcrSdN36nXVp7a6uU3t71gFHCGAB5gsP0Xn
         R1cuzCGMUYvepfe+f5wxpp2TDnXjHr0OBAAx1/QDAluw00gRswwNnQXYBxiP/rTo2Wy5
         oUFTLL4iAM/K6RANI2q0Oif++OmqmsP6n2kSzjNq4eTvU8oPoUmGUnyfQCNEBB4+Pd0W
         uUH07G2vCqSQfpqRpX2eMNjtkMRIUkIBC4uWjtV88hzwam1jdVDh/ocpuNp79PPbAluX
         OjUD0rEkzoQo5NZoCQvOlfkz6A3adKLWTXM1jRquk0uJDabOTqsWcDYuXyYdcqRJQoEb
         vxsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u65si381846qkf.84.2017.06.14.03.46.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 03:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5CC65F742;
	Wed, 14 Jun 2017 10:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B5CC65F742
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B5CC65F742
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v5EAkLBF027736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Jun 2017 06:46:22 -0400
Subject: Re: [PATCH] target/aarch64: exit to main loop after handling MSR
To: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, edgar.iglesias@xilinx.com, qemu-devel@nongnu.org,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        "open list:ARM" <qemu-arm@nongnu.org>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
 <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
 <87vao4b4z5.fsf@linaro.org>
 <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
 <20170611050730.GA12317@flamenco> <20170613225352.GA26288@flamenco>
 <db800d74-7cfa-d9e3-60d7-3e7b19565b9b@twiddle.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5036e9ad-257a-b098-5093-050fca825627@redhat.com>
Date: Wed, 14 Jun 2017 12:46:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <db800d74-7cfa-d9e3-60d7-3e7b19565b9b@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 14 Jun 2017 10:46:25 +0000 (UTC)
X-TUID: h/o92vajWW6d



On 14/06/2017 06:48, Richard Henderson wrote:
>>
>> Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
>> a regression by which aarch64 guests freeze under TCG with -smp > 1,
>> even with `-accel accel=tcg,thread=single' (i.e. MTTCG disabled).
>>
>> I isolated the problem to the MSR handler. This patch forces an exit
>> after the handler is executed, which fixes the regression.
> 
> Why would that be?  The cpu_get_tb_cpu_state within helper_lookup_tb_ptr
> is supposed to read the new state that the msr handler would have
> installed.

Could some of these cause an interrupt, or some other change in the
cpu_exec flow?

Thanks,

Paolo
