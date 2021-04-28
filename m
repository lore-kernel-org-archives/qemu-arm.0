Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp836771lfb;
        Wed, 28 Apr 2021 10:32:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlQLdienhwRJ9ijpUml+5eTIGP+SqQsndeMm1Z6JCoZbU53ML1ePnec18vA1PRU1R4PqXh
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr30652973ejo.471.1619631133574;
        Wed, 28 Apr 2021 10:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619631133; cv=none;
        d=google.com; s=arc-20160816;
        b=ubNT3TpTHkpx3YbcBl48KmaVVQ1svjNMvVFMgU4iwBxglUvart+MuHZ+wUM/5uZdO2
         On7ItFM+JelPWHjZipD1J74vzwuPcnYYJqVOfBLDy1RD4ejAYfdfTueMRdtZ/wUJ8qwB
         7gopRHVnzgNsWbSTr5Wi0hkgD7kdoBW2RbqFNtB4zga/OJWbE5gy/uVBlWeW69eJ3QYA
         afOg6MDn7C9uIcAtVYUbD/QelKWnTVYCRgbeNA/kAWqxob/nN/GpggqDfVDfbN2Yvf+2
         8o+LXYNiZUgax6+aKCd+cArXCfos33wsVWldUhzgV/X8JeQI7pF6ykrEExL7ixf5sl3a
         36tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=v/0UEpyH+lzR8CV8S1dhdxJXNx56u9OsBWOU1lGo9OA=;
        b=0v/HsYF1nQAuoCzC5b9qHF9c11ypcLuDEvngLSZuhP/WMAh1CfsAeXvRMuC5rtPAsV
         PArknDPYDRgYEEUUElab9VPBYuyCKK8dMRTpnxm0Y4faud9m/PGy8BMMIpnd+SXGVBZB
         LCB121/wtovMq3UCHl9SaTg7LfUaznJ5wyAJDV3KMf14luB4uGYkZghdT4vPQ/N4pgIV
         ngkfLy2wO9C2q61ACFS2J9cs0SNeOacYS7JpyTSTFRuIaZe6lOC5nHUePwlamGuvhxXx
         CErfmon7295QEcxEvIgR4XapKitzxS97fN6tjX05Gziz+DSOrIgmh3oJTVEDisOkP2Kq
         0xMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Heptww5f;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h14si351004eds.113.2021.04.28.10.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 10:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Heptww5f;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619631132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/0UEpyH+lzR8CV8S1dhdxJXNx56u9OsBWOU1lGo9OA=;
	b=Heptww5fvWS7rTBAbBC5gCkY2AnkVGyTnriITfwERABapOCMUdGC5YRlGBO3LgfDHEdxlX
	FXd5BshJo5JBOWlaaybAJTFBYUI5xvNiln/tjaCK9hs/wbXywO9UNQQXFznmWM//DcH+yA
	TBnskBkZKIDecnRWEycAPeYOjzfkroE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-ejhlvRPiPgSC4uqosarRXQ-1; Wed, 28 Apr 2021 13:32:08 -0400
X-MC-Unique: ejhlvRPiPgSC4uqosarRXQ-1
Received: by mail-wr1-f70.google.com with SMTP id 32-20020adf92a30000b029010d6849a4e1so2501862wrn.4
        for <alex.bennee@linaro.org>; Wed, 28 Apr 2021 10:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v/0UEpyH+lzR8CV8S1dhdxJXNx56u9OsBWOU1lGo9OA=;
        b=mwwXjzg/iH8nVXvxSCpwZ505tQ+7KV6l7lfAkuYfFvREaZy78jRu0dFs9c4QfApOiV
         WpyC5iLOpyBGAo1duPOdodlWK87LRm1ae5QL6ErkhiInK6ZRMFf66bY5/aCCaaeo40ta
         hI5L9Msvq+4PPKktSegE9p6G2ir+1A5l2jNIsCczKcZcitcDloFRqnwECGX73xHH8GDs
         iDitZeJq37Yyp7SdgGtX+fRNZ5F9mR7YmVebBYm8gum9VX1cJ68go/eVgYG7WAt4XuwN
         nt9VBvpTH59RWyfCVnxf+UOA/y0DN00Kyxt6JWlcLOqKdbNuCJ8iz2w6ccDRxNyUNJeH
         lKEw==
X-Gm-Message-State: AOAM531NSOVtnxeZdXCuYYa5j1rRxMgW2sJe09MJm7uRokLyhvNRcyEh
	YkSzL9yHa2L9dvWj8qRJflKCEVi+H7XjixkM24DyQSRxISHIXRNvz91/T3npiCNXFJTmIZB1Egv
	iokKXJey2H7sn8tx9
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr31730968wmq.128.1619631127214;
        Wed, 28 Apr 2021 10:32:07 -0700 (PDT)
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr31730953wmq.128.1619631127060;
        Wed, 28 Apr 2021 10:32:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id m15sm546158wrx.32.2021.04.28.10.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 10:32:06 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Emilio G . Cota" <cota@braap.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com> <874kfqs5gl.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com>
Date: Wed, 28 Apr 2021 19:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <874kfqs5gl.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hxeQ8LlzSIUu

On 4/28/21 7:06 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Alex, Richard, do you mind reviewing this one please?
> 
> Isn't it already merged (with my r-b tag no less ;-)
> 
>   f77147cd4de8c726f89b2702f7a9d0c9711d8875

See ...

>   Author:     Philippe Mathieu-Daudé <philmd@redhat.com>
>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
> 
>>
>> On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> The previous attempt (commit f77147cd4de) doesn't work as

... ^ this comment :(

>>> expected, as we still have CONFIG_TCG=1 when using:
>>>
>>>   configure --disable-system --disable-user
>>>
>>> Now than we have removed the use of CONFIG_TCG from target-dependent
>>> files in tests/qtest/, we can remove the unconditional definition of
>>> CONFIG_TCG in config_host.
>>>
>>> This avoid to build a bunch of unrequired objects when building with
>>> --disable-tcg (in particular the softfloat tests):
>>>
>>> Before:
>>>
>>>   $ make
>>>   [1/812] Generating trace-qom.h with a custom command
>>>   ...
>>>
>>> After:
>>>
>>>   $ make
>>>   [1/349] Generating trace-qom.h with a custom command
>>>   ...
>>>
>>> A difference of 463 objects...
>>>
>>> Reported-by: Claudio Fontana <cfontana@suse.de>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> v3: Include Paolo's feedback:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
>>> therefore o not include Alex's R-b tag.
>>>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Emilio G. Cota <cota@braap.org>
>>> ---
>>>  meson.build | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index c6f4b0cf5e8..623cbe50685 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -262,7 +262,6 @@
>>>                          language: ['c', 'cpp', 'objc'])
>>>  
>>>    accelerators += 'CONFIG_TCG'
>>> -  config_host += { 'CONFIG_TCG': 'y' }
>>>  endif
>>>  
>>>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
>>>
> 
> 
