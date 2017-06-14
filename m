Received: by 10.25.0.23 with SMTP id 23csp284601lfa;
        Wed, 14 Jun 2017 05:17:22 -0700 (PDT)
X-Received: by 10.200.54.102 with SMTP id n35mr378351qtb.219.1497442642273;
        Wed, 14 Jun 2017 05:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497442642; cv=none;
        d=google.com; s=arc-20160816;
        b=tpQlc7wlRp6d3hPuTbpB2cVdBBayAKSeZ5vaSp0k7x9Uauag/GZ99IVZXwOaew7vTz
         EjZ1M7G9qB2XxUWAfho0cc+W9LiollY8+iM6FIe6V0J85XLvxhywLWlLtDs0i9n+nlm/
         N1ggNlRZxgK5dfqZSXD5CEavz9HJlAbQ6q4PGzfzf6DCz1vjGyHSFBNFOVgnfkzg0JLp
         W1SfuuJP4acMqvUzh7Vt9EFJo3qqyLcNmuqS1VnntgYQbIAKC8HbPj9I0BFPZG6o673d
         ANSuOkf3EKjgDc2iaWiu5wFEtqKGwvjwLI1XlafVUow9seWAwAzS8XZDVwhGnp02yRAw
         tB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=JAFJuxqZJM0sMlk4reToTRM59XNaSJuFJyzdWbIkONY=;
        b=ESc1wCT2/fTSA6Z7qmTKcuBM75HS3Uo5/kJaosAxSjpwdE5r5PSEIq14OXMMlogffY
         pyC6Aq+vIsPgAssAAJOoX79aIWdYRJqipOeQ1oGaeUm1qWNitz7xXTcm/xrPtQm2BgCC
         QleTTAMsUbxdSNzWomBBhk4gDrD2uFBlzewBiSmk+3XkPtr6GtTdWEmYd02cQzTZonGD
         mhLWbxq/zUgt1ZXlR7qid4saX+nTpIyOVv4R0j75eiGlzlXJ4Zc9ctZImN93bfvF8ead
         B5KluxxngH95TRnJUsZWi2Nl7+Wq6TgcQueu9aUvjdB3R1iT788p+TUP6pxgPqqjoC1z
         9Kxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 24si531946qkv.314.2017.06.14.05.17.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 05:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 216E51E2F0;
	Wed, 14 Jun 2017 12:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 216E51E2F0
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 216E51E2F0
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v5ECHHlt008928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Jun 2017 08:17:19 -0400
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
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f185840b-5390-7df7-2450-f846f6af8a84@redhat.com>
Date: Wed, 14 Jun 2017 14:16:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87poe6ix5u.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 14 Jun 2017 12:17:21 +0000 (UTC)
X-TUID: KI7WTLyV+sPC



On 14/06/2017 14:14, Alex Bennée wrote:
>> Then Emilio's patch, if a bit of a heavy hammer, is correct. After
>> aa64_daif_write needs you need an exit_tb so that arm_cpu_exec_interrupt
>> is executed again.
> 
> This is a case of cpu->interrupt_request being pending but not having
> set cpu->icount_decr yet to signal the exit.

Rather than "yet", "anymore".  So far it has always been an invariant
that anything that re-enabled an interrupt had to do exit_tb.

> Wouldn't another approach
> (that didn't involve futzing with each front-end) to be to check
> cpu->interrupt_request and force the exit in lookup_tb_ptr?

That would cause an unnecessary slowdown in code that runs with
interrupts disabled but does a lot of indirect jumps...  ppc's SLOF
firmware probably qualifies.

Paolo
