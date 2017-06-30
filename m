Received: by 10.25.227.6 with SMTP id a6csp5970401lfh;
        Fri, 30 Jun 2017 11:46:06 -0700 (PDT)
X-Received: by 10.200.34.248 with SMTP id g53mr14208751qta.65.1498848366448;
        Fri, 30 Jun 2017 11:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498848366; cv=none;
        d=google.com; s=arc-20160816;
        b=z6Fa8YhRjiAGu6TTRnoe5OP81Mz/D0nLQR7vswW8bKfKwoWpz5Q3XjkUeyS8OQORtV
         yeXntGffdK4o0viPq/hXkj5uRJ08mtIROdiH0KnALPE415UBHXItvAiDpJX4IC3+jReb
         JIufcHMY8DQKlNJgUFFpNNdUGBVyGh+UaKZHzJ+sUG7qj6RHVIehz8Qd1ZxgxrmiNLhF
         zfpv0CkaZFFby4C1MEUseDHw/+YeLEDQ/UIdef6EQauouaK87S7AejOcl5z2h0CMHekv
         Mljkwj7Csixj/fyJ+JRtj3YwMiLeNLcyqiTb3fMCEXRh3GncKsYZFesPYNyiL5JiAfV5
         KPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=KtDME5tKRixFRqjlD7tAw8yK+RoaOzlvnt5BcAEZmGk=;
        b=ScmXysRz47RaAvt61wXsV9AC+LuCLMqpR4DpG2G2I+PtuOwLrHQA/KbuFVSJaphrxA
         xxh9Q1BGhf9Rvr+QpDbGMP+SgpQf4+h5AFOgkNHnwc/OR2L37jvpWxUiVFj7E+BGijjH
         whGIzjjoN1ezscwTngZc27Ke9PO47Ye8hBhvNwnDdt76wuIjsl8uWkUqDdH/M6j3/K6w
         4bknO0My0J5MgDnZinWueudYAIniKjS8xNcWd2B6lpg1LQ0V7gzvftyjKW6/D0k80+Tg
         N+HPLKTp7cE6eBxzUeG0Yg0kFCzILCJExHgJwdKnnGduvKIz51rDEXIwnO905MKpZwjH
         syNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=bmiIbQv9;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id e16si8307628qtc.156.2017.06.30.11.46.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 11:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=bmiIbQv9;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id 91so16485619qkq.1;
        Fri, 30 Jun 2017 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KtDME5tKRixFRqjlD7tAw8yK+RoaOzlvnt5BcAEZmGk=;
        b=bmiIbQv9wOXigSnS27FsIK+gv+u+2XbAYeLfdwDvaPealmtSKC98LXdVaLOW3I6aaS
         xy9IQZCW4w9BKiVhy7mP32ZN5tfKARzruallbgXLo9Dq/pjHPHZQf4lAzlquWN1JX0z5
         RoUy5KkVVsVb0JlLZAVm2dO9eKmr7FMvDbPj3gkhRI4qoJOasHvA2CKWYXSTGcnLi7pA
         6IcGYFA6okoFQS6Oi8fUQ7DDOIEp20oAmSyYJYVmhrDHWhFL00R+8TOGHVr9uVHCBWhD
         6v5GNSuEpdmjqVQqZM5Cy6wayTDJqjzMp9kytYn8g03PKdGlF36THXoUSL84arVHH42R
         yGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KtDME5tKRixFRqjlD7tAw8yK+RoaOzlvnt5BcAEZmGk=;
        b=T+0jq72ApEwJgKVjEVju1C4jI0zwZ8jrEXOZzyRsFh/FvAKdkvFHM8Z7727bAVELJ1
         D86gRx+i9+aW5Rx+cnbdOtP9DeWGuFi431kzAXrHqT8oEySrqxnM58eUMoIiOJQMNV3a
         q1IQU6xYVvQNMPwqHExJ5x/lvciwEkh4bRVOUXgJhgU0HwsxzOxMyzbfBUyITNGcmYg4
         B9qQkd0LtNE02mfc5tvuCUYGHxhjnI/P2b8a3U/7xmOfz8trNmkyHlwMDblB0rw1eKh+
         StlfxM4m2x0vQe3FRtrOEsBKLzUt2cB89lXHAJrupYeC49aolybxAQKP37jWbAIFcyiE
         MNfw==
X-Gm-Message-State: AKS2vOxwcZ6x5jsVdO+wHcNOwYkf0ck2PyeVzqXuO+oOWhQdFaY/YAOp
	ftBtf2Uy+JeE+A==
X-Received: by 10.55.207.140 with SMTP id v12mr25392417qkl.49.1498848366070;
        Fri, 30 Jun 2017 11:46:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id s6sm6593467qki.44.2017.06.30.11.46.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 11:46:04 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v11 01/29] Pass generic CPUState to
 gen_intermediate_code()
To: "Emilio G. Cota" <cota@braap.org>, =?UTF-8?Q?Llu=c3=ads_Vilanova?=
 <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Anthony Green <green@moxielogic.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865244195.17063.11938084353514091141.stgit@frigg.lan>
 <20170629225225.GA13979@flamenco>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <69def2b9-13d1-1600-2f4a-4001958ffa97@twiddle.net>
Date: Fri, 30 Jun 2017 11:46:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170629225225.GA13979@flamenco>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BCdC7/5T3OSb

On 06/29/2017 03:52 PM, Emilio G. Cota wrote:
> On Wed, Jun 28, 2017 at 15:20:42 +0300, Lluís Vilanova wrote:
>> Needed to implement a target-agnostic gen_intermediate_code() in the
>> future.
>>
>> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
> (snip)
>> -void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
>> +void gen_intermediate_code(CPUState *cpu, struct TranslationBlock *tb)
>>   {
>> -    AlphaCPU *cpu = alpha_env_get_cpu(env);
>> -    CPUState *cs = CPU(cpu);
>> +    CPUAlphaState *env = cpu->env_ptr;
> 
> I'd keep the original variable names, i.e. cs for CPUState in this case,
> just like you did for a64:
> 
>> -void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>> +void gen_intermediate_code_a64(CPUState *cs, TranslationBlock *tb)
>>   {
>> -    CPUState *cs = CPU(cpu);
>> -    CPUARMState *env = &cpu->env;
>> +    CPUARMState *env = cs->env_ptr;
>> +    ARMCPU *cpu = arm_env_get_cpu(env);
> 
> This will keep the diff size to a minimum.

I asked for the same thing many revisions ago.


r~
