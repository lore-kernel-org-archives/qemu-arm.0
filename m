Received: by 10.25.0.23 with SMTP id 23csp278050lfa;
        Wed, 14 Jun 2017 05:02:24 -0700 (PDT)
X-Received: by 10.55.175.67 with SMTP id y64mr319746qke.130.1497441744518;
        Wed, 14 Jun 2017 05:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497441744; cv=none;
        d=google.com; s=arc-20160816;
        b=Ia+0kdjyNamnVFfdKAWtCzOfOGkKVYIvr1pUqJ5HcZ/YubbkFhGsNVVubxTuUb+sZO
         ufxlkAK409Nq5lFAOhz0DHuzRAOR4/o+nL8mnrAeaGWuVAkzVXumkvYtp2rPVmmaXI3c
         g57xLM+t4baKXSgLfIT/nv7OTLscQEInyGbuZc6fKPA+nm3pVv+RXEn8mjYzzJFR7RHu
         T+ur4UXKImWF6bScm2Twd6TW1F8bzh1Cf6Ef0Lok1aMHNESmCtp9p7midWK+SqVMz+Xn
         g2nDzqeNKIE/JlZALzLmC0ww2AD/ZJ1iBWPCkBaxXr3NxcP9qnmuc5JGMNKsR1N2z9p/
         mFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=FoHVShN0soFlAUGAgLU8QdYRUCbZJBHrEH+F+ABGeAc=;
        b=DiM7Vu1HLThShwDe+ax5V8MwAjo9Uhkj51CpUUjxBkfeao1U5goSG6MU7rmzWh3Qij
         /j3t9lrqiammGoeDr/2nCYbXeAxxMJAoq6Zl77KTC4HOZZUZUr0z/VHq7HCybQnGSCJ4
         r/bNGdYtRMm1LNiM1VpBTu2bF4UGW8f0zzfytC0s5DqN7pmGzEdFoOlJC1Q61Vch9/vX
         gbOcw8d9ACypp1JBXxgz4DEyJYl6F7p5KNf5cn/9XMY8n2JQ3eee2hmUZgQV62+X3DCz
         ePSTNKmb6TStbRatY1FwJmgXGcr1zhxv8IdMeRvR9axjPITxrcCtFXbSbMG0x9IzXu7b
         upKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u35si463483qtd.228.2017.06.14.05.02.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 05:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E3BFC057FAB;
	Wed, 14 Jun 2017 12:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4E3BFC057FAB
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4E3BFC057FAB
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v5EC2Jar005904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Jun 2017 08:02:21 -0400
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
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c7ea148-2ca7-ec56-48ed-eabac0fe7896@redhat.com>
Date: Wed, 14 Jun 2017 14:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87r2ymiyht.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 14 Jun 2017 12:02:23 +0000 (UTC)
X-TUID: aMJ37l1DGvnU



On 14/06/2017 13:45, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 14/06/2017 06:48, Richard Henderson wrote:
>>>>
>>>> Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
>>>> a regression by which aarch64 guests freeze under TCG with -smp > 1,
>>>> even with `-accel accel=tcg,thread=single' (i.e. MTTCG disabled).
>>>>
>>>> I isolated the problem to the MSR handler. This patch forces an exit
>>>> after the handler is executed, which fixes the regression.
>>>
>>> Why would that be?  The cpu_get_tb_cpu_state within helper_lookup_tb_ptr
>>> is supposed to read the new state that the msr handler would have
>>> installed.
>>
>> Could some of these cause an interrupt, or some other change in the
>> cpu_exec flow?
> 
> Well what I was observing was the secondary_start_kernel stalling and
> leaving the main cpu spinning. The msr is actually:
> 
> 	local_irq_enable();
> 	local_fiq_enable();
> 
> Which I assume would re-enable IRQs if they are ready to go. However I
> guess if we sink into our cpu_idle without exiting the main loop we
> never set any pending IRQs?

Then Emilio's patch, if a bit of a heavy hammer, is correct. After
aa64_daif_write needs you need an exit_tb so that arm_cpu_exec_interrupt
is executed again.

Compare with this from the x86 front-end:

        /* if irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
           the flag and abort the translation to give the irqs a
           change to be happen */
        if (dc->tf || dc->singlestep_enabled ||
            (flags & HF_INHIBIT_IRQ_MASK)) {
            gen_jmp_im(pc_ptr - dc->cs_base);
            gen_eob(dc);
            break;
        }

(This triggers one instruction after a STI instruction, due to how x86's
"interrupt shadow" work, so it doesn't happen immediately after
helper_sti; but the idea is the same).

Paolo
