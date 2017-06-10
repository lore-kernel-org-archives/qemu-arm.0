Received: by 10.25.0.23 with SMTP id 23csp968lfa;
        Fri, 9 Jun 2017 19:29:33 -0700 (PDT)
X-Received: by 10.233.220.134 with SMTP id q128mr33855516qkf.199.1497061773679;
        Fri, 09 Jun 2017 19:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497061773; cv=none;
        d=google.com; s=arc-20160816;
        b=05prIhy+ndjdnU0xxCSKxxvFUtTRI7Ks5QQF15Pe3FhiajGqO6oPI4DAAAhW0N2xKM
         wAY/VlvLIdmQUALr30NQZrMvvVjAJ5k39iN5eAJs4ZRA9QfwOuhPDh22b6oLqPzIEmOX
         LehRjNV/ic/gRZ6gkHY9DaO5+68iTe5YIfP3XuaPToytcO++30TZgnkJKyoUpA61Xo3I
         DGz4k8LPnVXEi/kJ/DpGgJnj+r7g3nqJEl0t07qi99l7Fi9p2KpHf1oHx6VkenDKCQmv
         f+RsWrljKy7NxTpnGtdY+fm4qXsyXAmb8XXEx3taRU+v4+3Bn+RJqd5dRo60i1oGNxX4
         p0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=z0RbPUj48LEW8pVfxQFBfLxtxoD4iCL7sBDGRWr9Lpo=;
        b=WukaEI+b5bqMyWi9hAGG5lazNMNuTqyUCyWOcgx6pezRAo9vhAFwMYhtSDxggVpUBS
         MbDNL0zkWPA35MD/3OOTL3yv8O3/cA9cqHNr68aAaVnJnrbOX6JmrmJoijEZ2E1BlDqk
         P3LP4fdBBqRafW8e5BRfRedle6ZjWNPn212Fua32li+Elm9BYVFvN+z0RRrWgHFcuETs
         z7mIdjGc+LE0xiGLyTE8zCHbpZsu6HTh5v16e0hFa5rOwlHPeeVRR+d0jc7Xuev/p5jr
         g+2c0Vcbnv0mXHg+iMXflRCJwMd8YDXOYPDZKTHTr0eUGCl2SQSdRMuZm2FrHR+bbOgn
         V2SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id g2si2704265qtc.5.2017.06.09.19.29.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2017 19:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id 76so1857203qkz.0;
        Fri, 09 Jun 2017 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z0RbPUj48LEW8pVfxQFBfLxtxoD4iCL7sBDGRWr9Lpo=;
        b=Iic2cxWynXjAzd1hMBaMKp7lHOrejZJnIlGXySga3JEjY5HRFPAh2CfB3A9n11mxZQ
         1n/7doBMkP62Fmc6QA8m2hlMID60rnulKjk8KI3gbw6bVpRTgRW2Cw/UMGk/y4FS+ZVM
         f2CBQXK7lDyeWLai4bsRrNrlzqW2CCpGaJB2uETN3KtYcfYSkFejG9MQRZO5hMAllTha
         s125sJ1ui5lXGv+mzHXB2CAjUcH+wcjrzW9JmA5m9YpGn7AsEaziB+jL49wEk5JZGeuq
         QulOvGl1c6XJVvi0Yf36i0MMQofY3wNtYNzLqDwlw6q6puRKql+2S3pPOp1FKYxNOJP1
         oNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z0RbPUj48LEW8pVfxQFBfLxtxoD4iCL7sBDGRWr9Lpo=;
        b=pmf2LHbtXNLQlGOW2LK76bngyL7BZS6EitUZbSdAq6n4/xb6rSlmaEMd2UI/vnzxwF
         M3HKn8zuzYD1W8DDB74Wz8540SOi+ctXq7n5xaiSRI5UMLRehT1aBWKWBlLkK8DCS/Bl
         fDdCIKXmSquHK5d2TugV+sBZ5dyjZfIfEl/bLG5BVSoa9K3iBshgcX5PMkyEobkUap/m
         t8pn+sXoQRlymWgUxSEpo+Ass5/royrHue0Jl+UJYQJpwaxI9+nZvyySsBm+ORh0rB4C
         bCRsGCRClmEAAjjIvMAMZbvLVT5Rgvkmm6CebzNZiWOwM4s6V6Pr0X+gmeO+SmK+kFkd
         AfaA==
X-Gm-Message-State: AKS2vOwA+vXXyllUvh8TVU1EayBpDUzblV9VoE/xzoJWZHofLB0D9ocz
	ioJuBJf8cwl29w==
X-Received: by 10.55.212.65 with SMTP id l62mr51786238qki.248.1497061773129;
        Fri, 09 Jun 2017 19:29:33 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id v68sm1950371qkb.16.2017.06.09.19.29.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2017 19:29:31 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC DEBUG PATCH 3/3] translate-a64: fix lookup_tb_ptr hang
 (DEBUG!)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, pbonzini@redhat.com, edgar.iglesias@xilinx.com,
 cota@braap.org
Cc: qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
Date: Fri, 9 Jun 2017 19:29:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170609170100.3599-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: cbIcOOtlnMo8

On 06/09/2017 10:01 AM, Alex Bennée wrote:
> THIS IS A DEBUG PATCH DO NOT MERGE
> 
> I include all the comments to show my working. I was trying to
> isolate which instructions cause the problem. It turns out it is the
> RET instruction. I don't understand why because AFAICT it is a
> pretty much a BR instruction.

Yeah, same thing for Alpha.

It has been my guess that not chaining through RET means that we get back to 
the main loop regularly and often, letting interrupts be recognized in a timely 
manner.

I can't figure out why that would be, however, since interrupts *ought* to be 
setting icount_decr, and the TB to which we chain *is* checking that to return 
to the main loop.

Since changing the timing affects the outcome (e.g. -d exec), it follows that 
this *must* be some sort of race condition.  But since this still happens with 
single-threaded mode, I can't imagine what sort of race condition it might be.

More data points.  I removed the tb_htable_lookup, and that by itself is enough 
to fix Alpha booting.  But it doesn't help the aarch64 kernel+image that I 
have.  Which does still boot with -d nochain (which, along with disabling 
goto_tb chaining, also disables all goto_ptr).

Not really sure where to go from here.


r~
