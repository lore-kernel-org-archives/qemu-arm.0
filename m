Received: by 10.25.44.15 with SMTP id s15csp235281lfs;
        Fri, 7 Jul 2017 08:26:09 -0700 (PDT)
X-Received: by 10.55.165.200 with SMTP id o191mr68044234qke.47.1499441169282;
        Fri, 07 Jul 2017 08:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499441169; cv=none;
        d=google.com; s=arc-20160816;
        b=N1dyko7tgE+JirMt44oIx7mH6HAwzhBjt7ja96MxkSPBpJMwUTnaJ/YAWTYoIYuOOR
         TpednBNAnrMnLsIZewKngbeIuqBafJp7az4WAuR/9Qzz+Kcyz9PF5HFaB1eEotD1CpMb
         5Lfc9MmYmIFk+BSgWr8PWBUcepWh2S/svqTeX6caqfreOz0PtODMDKpjuscy1Jej61v1
         Ai6Qpda3gD5c7WAbPggzLgBU6ku6GRfsnDPkBHiR1mQo0ymYsqCRnSZgNfGMWlQZAqzM
         wJKBczfQR/s5WFMeZlbUINZYtv+ZpmIGR0NnzGxAvHHZlXn4oLwphOHwM3Im7S2IEosG
         8fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=xnuT1PjozIyTMYDdw0rDzxC16HtC+VbxhrQnmfXERSA=;
        b=0T0SHdjigQunYOFzSRW3cbevDPH8kS+rakcYsqkXjzrbIOZxaQOLWun7ZtyPQ1r/02
         q8D3pO1/8d+EzKT2Flgo1ZjbtGiRjg8n9fzAEHw6K3jZ/ada3WF5j6aZv/h8wLmR0fwr
         IKT0cu09KxHwsZTgsOt/WP9ZVwNgronSfjGZB4MKCai8aLTvu9Us3NVuKqOJMTV2zwlx
         Yu50AwkbNZMM0o8vhAemAR/VCcXMmp4r3D7Ywev7TYM/+tmuWnJ2l8yx3EMHRCrW5xBC
         ZoMOeo6gwn/VXPQjE9vCDDZOhJvu+z/U5jpcEXXQHcZYsnrcQIpvYAN4ka0ZLK/zeQqw
         S24w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=PLkKxB1P;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id k7si3438940qkb.124.2017.07.07.08.26.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 08:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=PLkKxB1P;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id c20so4642687qte.0;
        Fri, 07 Jul 2017 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xnuT1PjozIyTMYDdw0rDzxC16HtC+VbxhrQnmfXERSA=;
        b=PLkKxB1PrhV9OTNCWn/yBzDSSvQwpcko/sifI4JpXglrYPdT+7oxqAvkttVYqE+0Qu
         UL5jBmjPMWApfjRMBhyREAxkJbNUwN/kdaKAdsew/gawFcJ2iCLv9eDNHA5cuBjS420f
         pJ34XGuhXO3lB1dgTdVnYePO7BsucDZUrgl311u7RAiQgbqo76/PZDte4UamBpoxlhcw
         uCWgFUMkl2d0rLnQrwvIUyqOsmg+CLo+5jvjt25K/qCRSTkGPy3VvbmdAnSD0GfpO0K6
         O4y0i4+Mi/WtSEG9jHZo2Yk5dOzzYC0fJAbFL8hOvzLMCTQ2Rk6AJ1h1RAL3ZEDg61Iz
         +OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xnuT1PjozIyTMYDdw0rDzxC16HtC+VbxhrQnmfXERSA=;
        b=cgo5XAZu38H4fHfYnzIpQaqlv2rcybzwh4AxuQkznFwru22P0+WpnqgUidREj0chHK
         vncdz+4w3yKPmrrtSIA3xjx4b/BAyRRe4AFQP7b0ojKQhZK8gUBZjT295irj3+U8ISGB
         p7BGCo/+fCwOxPiTeOSJH7fIsek9wHkrqQXGdQcqaJD4gPCBsc7Vqx40lZ7zpu3fd2BT
         HJbO44W6jl6X0HV931RUt15HMhjHXNSb76oLkjTj3UTRvy31G5VEUdgwLhsfMNyi3jfV
         zQVPYSZwUkoLSnJHTeKKw5/Kohnqb3hfjhNd+JJHkLjZMCm5nO6TmA8v05zxuJkh85nL
         Gx1g==
X-Gm-Message-State: AIVw111WKFyQm3vUPIU2pML6yvH+GNxnoICHDbTZb6ros+9U7Brh5DnM
	4q8+baJafZPwyVeYGlI=
X-Received: by 10.237.56.135 with SMTP id k7mr34590061qte.134.1499441168683;
        Fri, 07 Jul 2017 08:26:08 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id a62sm2499157qkd.14.2017.07.07.08.26.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 08:26:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to
 translate_insn
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865776960.17063.4875279139522061160.stgit@frigg.lan>
 <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net> <87podcebyi.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net>
Date: Fri, 7 Jul 2017 05:26:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87podcebyi.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QzSI3E4w8SLZ

On 07/07/2017 01:13 AM, Lluís Vilanova wrote:
>>> +    if (dc->ss_active && !dc->pstate_ss) {
>>> +        /* Singlestep state is Active-pending.
>>> +         * If we're in this state at the start of a TB then either
>>> +         *  a) we just took an exception to an EL which is being debugged
>>> +         *     and this is the first insn in the exception handler
>>> +         *  b) debug exceptions were masked and we just unmasked them
>>> +         *     without changing EL (eg by clearing PSTATE.D)
>>> +         * In either case we're going to take a swstep exception in the
>>> +         * "did not step an insn" case, and so the syndrome ISV and EX
>>> +         * bits should be zero.
>>> +         */
>>> +        assert(dc->base.num_insns == 1);
>>> +        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
>>> +                      default_exception_el(dc));
>>> +        dc->base.is_jmp = DISAS_SKIP;
> 
>> This is surely DISAS_EXC -- see gen_step_complete_exception.
>> Why introduce a new name?
> 
> The original code goes straight to done_generating here, and that's the purpose
> of DISAS_SKIP (skip the code executed between the end of the loop and the
> done_generating label).

That is the purpose of DISAS_EXC too.  We've called a noreturn helper to raise 
an exception and all following code is unreached.  If there *was* any code 
being emitted afterward, that is arguably a bug.


r~
