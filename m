Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4537310lfa;
        Tue, 8 Jun 2021 08:36:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmYJ4MFJ9yVaW4NnboaUEZUGQOkYyObqZdYB+ARmp3CJDXFhwNiw9iWFjxuvyqIkCU3oYj
X-Received: by 2002:a17:907:1c25:: with SMTP id nc37mr24433141ejc.300.1623166566312;
        Tue, 08 Jun 2021 08:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623166566; cv=none;
        d=google.com; s=arc-20160816;
        b=iBGHzuyLFDr3njHulIYBIvmvrqU0GU6xNVUIjhiraUD/CBp27se+XcCrOy3iaUL6CH
         yE1v9Wwy/u/bNJKz9aCyj9eySlSeHyxPYJLAOjKyc7Lcp1JJyynUs7pvTIDk5ldF31QK
         R2S0hl+u0+kDXIPrjS+LW4HZRLQuMtp/fpK1qKWfYBCzepoPkqUPzyx60PIiSBjmzC34
         5IDYaEmoNSpzA+RjXoM3uTnVv62OTjhRo5vVJtN6j+d0IzIsRKM+yGEvxdViHJNSONXJ
         ge7qQe/8D+d4iomwqvRe0Hf//Glx6/pStHhD/YJ7oyoPR8w7eyUxkQ9NkPGYiyMIL3WO
         Y6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+lRB7po5tcVn4f9KYWwl4QQJ7HgFM1NIf+AFIwAvD+w=;
        b=WdskuTwS+dKhqsySbeXtIyvHIibeEb2lHsjCZV6gvOOCx1IkauJ/2xOKZPQF893YAH
         bBFnckOiq+3DCL+X/5RksIOzcCsNoBjCpIVhTJlOF4p1XGdEfdqvFa1TuT44+cyaGOSp
         ryuMeR8FAFT4S+b+fTt755u0gXf8gvwOw6+/PsVyd3dm/TSzI336UsxjIG9RKRGEQ5Fm
         MUOyQX5REGIMacSoFXg1AOmrY3gDGIPi/BmshXAL8WfYf1QY577TuLkbih0SGt20RGy9
         /dREmVGELMcuY5LGW4FBZK77YivxEEI38e5qtjXs5T0HZ6Xa0cA6P3cVdG0WykGk69rW
         Vn5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cpnfOMue;
       spf=pass (google.com: domain of jsnow@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c16si17330edr.499.2021.06.08.08.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cpnfOMue;
       spf=pass (google.com: domain of jsnow@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623166565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lRB7po5tcVn4f9KYWwl4QQJ7HgFM1NIf+AFIwAvD+w=;
	b=cpnfOMue74mjzkN53IVIN7qUQYmZodvJ5cxcPY/GKVfU/9SXGh2u3AmE2oqDTJ0jRGBdSH
	S6WbrOd0yVNBVXG2gD9O9eSiGVHvVSdwgq1ySjHlv9BlE7kup0p0FphgL05g/yCwKfXqkn
	YSzzaFD/Md+5gtAPYgzA675ESQwPOWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-ynNat_p8N7CAl3fqjjFTMQ-1; Tue, 08 Jun 2021 11:36:04 -0400
X-MC-Unique: ynNat_p8N7CAl3fqjjFTMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 232368015C6;
	Tue,  8 Jun 2021 15:36:02 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3780F5C1C2;
	Tue,  8 Jun 2021 15:36:01 +0000 (UTC)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
 <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <067a2f68-1520-29be-6463-9a27a12a96ce@redhat.com>
Date: Tue, 8 Jun 2021 11:36:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: anhbwmzQhCL6

On 6/8/21 11:01 AM, Thomas Huth wrote:
> On 08/06/2021 16.27, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>> machines is about to be broken...
>>>
>>> Um, what?
>>
>> Really what we want is to probe the -M (machines) that a binary
>> supports rather than just barfing the test because we've built a QEMU
>> that doesn't support all the random 32 bit machines.
>>
>>> r~
>>>
>>>
>>>
>>>   and besides it's not likely this is
>>>> improving out coverage by much. Test the "virt" machine for both arm
>>>> and aarch64 as it can be used by either architecture.
>>
>> I think this point still stands though, I don't think we get much from
>> running the cdrom test with realview et all on qemu-system-aarch64.
> 
> In a lot of CI pipelines, we are either building aarch64 or arm, but not 
> both, so I think it might be good to keep the tests in here.
> 
>   Thomas
> 

I'm deferring to Thomas on this -- it has just a little bit less to do 
with the CDROM itself and more to do with machine configuration, which I 
consider outside of my wheelhouse here.

--js
