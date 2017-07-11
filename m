Received: by 10.25.44.15 with SMTP id s15csp5364956lfs;
        Tue, 11 Jul 2017 14:08:07 -0700 (PDT)
X-Received: by 10.200.41.172 with SMTP id 41mr471290qts.85.1499807287419;
        Tue, 11 Jul 2017 14:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499807287; cv=none;
        d=google.com; s=arc-20160816;
        b=Wm+KdWOV6OKyCaIbTAA7LxnyxmWNz0hfCzqL4gy2mbdG+y5rLhCobejf/yAvVjV2J/
         E2cmhLYCt634ouJN5bWi54WkP/kwJ8kfqndjfQpXomvV3UkpNbL6qD0tD9rXa+h52MqP
         e27JNCLdS2uIw3oIZGEQuRHGLDzH7hTWPmWGMPQ2XDiFgJfF2K2AlGC8bo+4r20JORmK
         w9qJ/eUD681LX2p9S8KFwgfcHhRqKFognQn0HYK43pdQ2o/N484A16FwL0CPseHPq4Be
         qEbHgrlhRDOu6HMk353NU6MYhwszn2A+yb+3jT8AZNvlsvzZon7PPuvabjCy5Kyl2blN
         QrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=rq1EJfQNO5eqCFsVbqgTonOxfdDdncAqpSI8eZQ7xCQ=;
        b=T19aLjgl411OYGBSORiwj5JbPkfV2kwUdTLRnW3OACptQ6RAr+J5rOEwdZWsCoJ6t+
         HfPd5ltyFpn3a5JcsWi3zDHQlM8iiCmgyWtRVMnatLEZ5kMkXXWJYQ+itG/zqNEwrrkQ
         FpTHv0ha2wa1KuxY+oBpOKFoKkMnnD/nJjNWvB0roWnoKnxiiINz0DAzT8POQI4J/cSL
         Lt3I2+5zqjgCPrXjYzb5r4UHZa4184T8m5JZXqUJq9LKfi+wTQvlaM2keIYWva/Hhlqo
         RkkE9c78N6doFnXc8Ejo6vC/c7lHvd9I9RnXq4flmS0lbHbn60nbOUII80E7PqexO+Rq
         ewGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=iiKGfy6h;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::22b as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com. [2607:f8b0:400d:c0d::22b])
        by mx.google.com with ESMTPS id l2si377797qkd.274.2017.07.11.14.08.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 14:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::22b as permitted sender) client-ip=2607:f8b0:400d:c0d::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=iiKGfy6h;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::22b as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x22b.google.com with SMTP id r30so3974704qtc.0;
        Tue, 11 Jul 2017 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rq1EJfQNO5eqCFsVbqgTonOxfdDdncAqpSI8eZQ7xCQ=;
        b=iiKGfy6hHUELONB7dE7qPmMAnCeaWuJtNYWEfsqtY4/AbS+8FC4c2txmTKKryq1cCs
         gOnZemToO99fgfka3XKUv0CZJ4rwdwmXrR4Z8aufmHKYK3NvqCdK6jtZL+58ATv6heH7
         vG3qG+JTXMp/4SKyQDC2y/DOA9YKmuK5lkZRDcCtV0yPamU5kx2n+voDP/PDHeFJoHrU
         H20rkaRV4J4nUArftNSG6PqneLd8Ab1MQjJ3iDLVDnq/KUHyH7l2b8UEYSGfmxAoWa/D
         Y8Q2KwdMcHxcvTpl4DzFsfK0QVIjOTsN4rZOr4yE+0AbxAfh4kjS5liAGveF6rfVbabz
         jWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rq1EJfQNO5eqCFsVbqgTonOxfdDdncAqpSI8eZQ7xCQ=;
        b=Q9CwH1bzCK/5SCLvndEFePJPTWIiOS5J+Av2T7EW/+Aw8ED2x3a4Hax/j5Tpzen2Ey
         m0kQsMcLCNA8IO45N5QCqtUzYB0Kr3SO/0gl+8L6NrSE+orezmSwutvrR3zkLKH4qOe6
         1AzgT9rrY/FZSleJBu20+/jjFVvYA3Few8b4dSVn4GaB1V4eoeYKmIMjL7LQOmKBMqhx
         dVhN5cFMF1R+tqNTlz1Cb4B4bJLxI8lz5Hxf9kWO8uzbqByNzNIJAG+S0lGKq3qNKmRF
         y9k7tj/DjKHkOcsc96RzCcW9h1+H0GfdsecH4Ff045BILdua+XGAtsr+8XkmA526aZva
         DNtw==
X-Gm-Message-State: AIVw111XQDBYMpkGaHMQ63tQIS36h+Xn+6O+d9LzVzY+KWZSwJBjEGtO
	uc3zkHQD43IbzO9cg7I=
X-Received: by 10.237.47.132 with SMTP id m4mr2411747qtd.200.1499807286930;
        Tue, 11 Jul 2017 14:08:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id a126sm307100qkf.25.2017.07.11.14.08.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 14:08:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 4/6] target/arm/translate: ensure gen_goto_tb sets exit
 flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-devel@nongnu.org,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-5-alex.bennee@linaro.org>
 <d0d0750b-127e-79e8-4307-57e187cd302f@twiddle.net>
 <87fue2aigw.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <99791611-a047-4884-6abc-a84a0183c532@twiddle.net>
Date: Tue, 11 Jul 2017 11:08:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87fue2aigw.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9WyZRkbQw7YF

On 07/11/2017 09:20 AM, Alex Bennée wrote:
> 
> Richard Henderson <rth@twiddle.net> writes:
> 
>> On 07/11/2017 07:59 AM, Alex Bennée wrote:
>>>        if (use_goto_tb(s, dest)) {
>>>            tcg_gen_goto_tb(n);
>>>            gen_set_pc_im(s, dest);
>>>            tcg_gen_exit_tb((uintptr_t)s->tb + n);
>>> +        s->is_jmp = DISAS_TB_JUMP;
>>>        } else {
>>>            gen_set_pc_im(s, dest);
>>>            gen_goto_ptr();
>>> +        s->is_jmp = DISAS_JUMP;
>>>        }
>>
>> I think DISAS_TB_JUMP is appropriate for both cases.  When not using
>> goto_tb, the jump is still static and we still chain to the next TB
>> via goto_ptr.
> 
> OK - I guess we need to nail down what the essential difference is
> between the two. I understood DISAS_TB_JUMP as a static known PC which
> can be patched in the generated code because we know the two addresses
> are in the same page - whereas DISAS_JUMP is a "computed" jump although
> in this case the PC is already known.
> 
> Does making a distinction between computed and non-computer inter-page
> jumps make any sense anyway?

*shrug* probably not.

Honestly, the only thing that's really interesting here is that is_jmp indicate 
that we have already exited the TB and that all following code is dead.

As a response to one of Lluis' threads, I suggested that the generic term for 
this be DISAS_NORETURN.  Which also covers exiting the TB via calling a helper 
that does not return, e.g. throwing an illegal opcode exception, aka DISAS_EXC 
in the current target/arm sources.


r~
