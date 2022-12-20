Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4118665ejb;
        Mon, 19 Dec 2022 23:31:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7TG3Q0zGMLgETL2zLB+u13OWOGH+FhGrjqWGVZCH3vODaIuTqDU3uCCyyE4LIOsdD9Zfuq
X-Received: by 2002:adf:ff8b:0:b0:24f:869a:6c13 with SMTP id j11-20020adfff8b000000b0024f869a6c13mr22122739wrr.2.1671521510733;
        Mon, 19 Dec 2022 23:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671521510; cv=none;
        d=google.com; s=arc-20160816;
        b=jfz4AstD3O2khlJiQ2yUG+zxjK8UHJtkYdTl+yC6SiHkPkcVlDttwI5DwxQVpglFj5
         C/Rs/fDZSO1H/M1JC9d6PcVcYi7SbbfFJmE+WarUfTRNyZTQRfiZZJ8NTBW096xN7BAG
         C9J1bJRro/r/tmRW0YJNUEmA15/3dhHAR37vhvd/eoPBtOcUWCbnc/s/FM/IGg+AB7ln
         GZ66P4kbf8Q+oD78ohHljXGCEQPkE7gENMpPwGwp00yb2w0ZS2T+GcVcC5jHh+8WPgSi
         NhvWKmFPsRlHKYiZrkGhhb2Y/NpMpY+0A8eQfRUppHU5nCF5X/2q0c2cKYG/moie0gt3
         poTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=XVqC1pyGLp8EtzZzKgV8GtpOP7U4QZiA9tUuUugd3FU=;
        b=xF1dbakLZGx59pxWHabYfCkvcxEhkuRSjenpB9WffnxLS3xrxgxJ8srl+4jtZB1GCa
         ZL1moUjjdrEUjiz8gZhdLM7OYBmRw40DT4Iud2kQetyyi0tB1/wBrcireADxrkc3rb8j
         c5MQNAvNCHZRMxc7xsmaRodLGOfT7LCHFHJ5aONCJWooKrQgbPydi9vFQx24MbIsN/Be
         r5KzxVeXPBLtGJNrmkMiDKezJGpCBafVFuWPfTPBAcAl1G79sesPrHp2FndE7gjkD9sg
         6BGIiPeb2wgsY88orXiqtib53n9iSY8go55twzVgwb8CyYsayoLKEDldXIL9VgO4nuhy
         YWqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id o10-20020adfcf0a000000b00236db57e3d6si6789977wrj.68.2022.12.19.23.31.50;
        Mon, 19 Dec 2022 23:31:50 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [192.168.106.118] (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
	by csgraf.de (Postfix) with ESMTPSA id 816C06080366;
	Tue, 20 Dec 2022 08:31:49 +0100 (CET)
Message-ID: <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de>
Date: Tue, 20 Dec 2022 08:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de> <87r0wv8vsa.fsf@suse.de>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <87r0wv8vsa.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 33xbaSl6WElC

Hey Fabiano,

On 19.12.22 12:42, Fabiano Rosas wrote:
> Claudio Fontana <cfontana@suse.de> writes:
>
>> Ciao Alex,
>>
>> On 12/19/22 11:47, Alexander Graf wrote:
>>> Hey Claudio,
>>>
>>> On 19.12.22 09:37, Claudio Fontana wrote:
>>>> On 12/16/22 22:59, Alexander Graf wrote:
>>>>> Hi Claudio,
>>>>>
>>>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>>>> Alex
>>>> Hi Alex, Fabiano, Peter and all,
>>>>
>>>> that was the plan but at the time of:
>>>>
>>>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>>>
>>>> Peter mentioned that HVF AArch64 might use that code too:
>>>>
>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>>>
>>>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>>>
>>>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
>>> I originally reused the PSCI code in earlier versions of my hvf patch
>>> set, but then we realized that some functions like remote CPU reset are
>>> wired in a TCG specific view of the world with full target CPU register
>>> ownership. So if we want to actually share it, we'll need to abstract it
>>> up a level.
>>>
>>> Hence I'd suggest to move it to a TCG directory for now and then later
>>> move it back into a generic helper if we want / need to. The code just
>>> simply isn't generic yet.
>>>
>>> Or alternatively, you create a patch (set) to actually merge the 2
>>> implementations into a generic one again which then can live at a
>>> generic place :)
>>>
>>>
>>> Alex
>> Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)
>>
>> Ciao,
>>
>> Claudio
> Hello, thank you all for the comments.
>
> I like the idea of merging the two implementations. However, I won't get
> to it anytime soon. There's still ~70 patches in the original series
> that I need to understand, rebase and test, including the introduction
> of the tcg directory.


Sure, I am definitely fine with leaving them separate for now as well :).


> I'd say we merge this as is now, since this patch has no
> dependencies. Later when I introduce the tcg directory I can move the
> code there along with the other tcg-only files. I'll take note to come
> back to the PSCI code as well.

I'm confused about the patch ordering :). Why is it easier to move the 
psci.c compilation target from generic to an if(CONFIG_TCG) only to 
later move it into a tcg/ directory? Wouldn't it be easier to create a 
tcg/ directory from the start and just put it there?

The current approach just looks like duplicate effort to me.


Alex
