Received: by 10.25.0.144 with SMTP id 138csp498331lfa;
        Wed, 26 Apr 2017 15:29:53 -0700 (PDT)
X-Received: by 10.28.113.135 with SMTP id d7mr62029wmi.71.1493245793500;
        Wed, 26 Apr 2017 15:29:53 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id z63si8363029wmb.23.2017.04.26.15.29.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 15:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id 6so1804147wrb.1;
        Wed, 26 Apr 2017 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sir9C4/h01v3JuxiBkRzPH6+QcdvisfNqC9aY5X9KDQ=;
        b=YjxFQlgZvqtee8D079JKvCV4ZV9Fu1EZAknJMIby5efPvSF8T44FA2tBTNGdb/bcLF
         gt5dXTMfRl3E4HndltHFrPRU0mUairrAxhKMoK8pm+3+MJCKKUQAsQuyl2w5ywZVV6p1
         WNITU+yXXFE3TOv6UxLd6NQK+Hil6/hMLRXdc6CUFtRUtdIx1/bH72OFlhsbvb9xScxA
         i8IwD/mr2R5kINAiEk+UhWpf+k4RS30yX/4rhmDXuT22KTcqmJcDj9/MbIcXU7EQTgC7
         +koXAQT/D8BYIrNn9ZlSrIb9pIrSFxUMU8UsM7WZ1AaWncZZtCxSJJzobCGyZvS9YiDr
         2scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sir9C4/h01v3JuxiBkRzPH6+QcdvisfNqC9aY5X9KDQ=;
        b=aaM3bmnqS9cQuCy6WR/55VOeTQzj8upk+t3emE9LmwBV/ubnZ6ZgvcZI6Sutqvt6v3
         oKArIEWsZundjlcP3ESj68o7AgmsCEFKRBxeKuYhIj+fXEyITAkpVYSne6LJrct0WxUV
         sJLrV5LsQCxIFwDi+vusTQOCFyjrV6YFtHFBoyyV0m+Yo83hyEjoHn1X5HP82kbV/ss1
         4mX9/Smmh8/iBw4yXPIoFEnF4C9L+rRAweGal5XiNxKqZJ1LAqJvfrcoR4I9Rn0eIHgr
         ZMmpjKny3qK1bNqHbJwLQ1AYA8Gbx5F+g0BwNLXvVvWGKG/dRB5opBSt+sKG1Vx28Ych
         5shg==
X-Gm-Message-State: AN3rC/647uQhWi8NMDFH3E18DH464U55EZA+A1FvMHruUc7LhZIugRch
	1zyizI1oRahXLw==
X-Received: by 10.223.177.215 with SMTP id r23mr1451606wra.97.1493245793077;
        Wed, 26 Apr 2017 15:29:53 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id y63sm11041221wme.31.2017.04.26.15.29.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 15:29:51 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org>
 <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
 <20170426215604.GA16014@flamenco>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <22fb44cc-b8de-c3fb-0980-bfc908229a2e@twiddle.net>
Date: Thu, 27 Apr 2017 00:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170426215604.GA16014@flamenco>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: bJk2G8xwVUhT

On 04/26/2017 11:56 PM, Emilio G. Cota wrote:
> On Wed, Apr 26, 2017 at 10:40:45 +0200, Richard Henderson wrote:
>> On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> (snip)
>>> +    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>>> +    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
>>> +    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
>>> +               tb->flags == flags)) {
>>
>> This comparison is wrong.  It will incorrectly reject a TB for i386 guest
>> when CS_BASE != 0.  You really want
>>
>>    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
>>    if (tb) {
>>      cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>>      if (tb->pc == pc && tb->cs_base == cs_base && tb->flags == flags) {
>>        return tb->tc_ptr;
>>      }
>>    }
>>    return tcg_ctx.code_gen_epilogue;
> 
> wrt the comparison, the only change I notice in your suggested change is
>    tb->pc == pc
> 
> instead of
>    tb->pc == addr
> 
> , which seems innocuous to me (since tb->pc == addr).
> 
> I fail to see how this relates to your "CS_BASE != 0" comment.
> What am I missing?

Recall how you computed vaddr for target/i386:

   addr = pc + cs_base


r~
