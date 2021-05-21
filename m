Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1125425lfm;
        Fri, 21 May 2021 05:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxwGUbV2zb8WF7Y7S+j4LWuHyShNbnTbL6w+JDeJwl3dprpOowgA8AU3Mjbl94fxjmF+JV
X-Received: by 2002:a17:907:76fa:: with SMTP id kg26mr10442635ejc.192.1621600962685;
        Fri, 21 May 2021 05:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621600962; cv=none;
        d=google.com; s=arc-20160816;
        b=r8vLmnUKAsiRs88Z2V/phoX6teKAeR1YhXCGT0ARzzycpQT/VNETiHa0V2NAVboxWV
         0VFVdN9mnNbTHAnN4slbdEcJHH0CJ57ZKNxi6jVvIoh+h49epowE0QbTmM/iSz0yMThk
         idJh/49u3jWpeyGfaPCUm4ZWcRYb5n6Z7LW5Qx0nVlns7X6j1mcnD+DiyTvWTOUY+qH7
         jzf2cFnMJ6Glq/+c97lti08enn0zKc6sS9cwYMBj8BE4sDGjAE22QDUkkbRSpRJ3M6Fw
         sUioTpbr33U4e0DEpp8mZe96ejgBcYipcMwOsS6oceXkmPnCUyn8yqYaRKAMU7WUg72g
         kLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :dkim-signature;
        bh=N7j8Em2K9BdP1hzxpGTjNb+/7SVGexm+ZKKntisRLj4=;
        b=M+FlqN9Z4mhfEBUwBkw8zKYJ/DibRsQ9qDlHsVyc8ZmKKJgJoufmkk9ygKP9rnldl1
         7XkGvSJyuLDzVxfknqOAsub4XficF3sUFiKXvECapi39U8DH66ixXo/AKpl9x0BaBJ4c
         fPijzz8k97K2HfYZK6ZZ2mSVHvzQo3c6omCLv9FsMnN04unTk42aRFPlaXcKy2nVOcX+
         aOBjaOERnpsS+kEjdkZ1Xkmg7p1SFDuQOpyuBN+cfhov+06LdjkTXV/6natdTHkRG29m
         W98u8Z58IvL3aQ9Cu2WTsanoHtAZIRhgAdZR8m//kpGy07ahzraSFQbP7l5G1++6zg9N
         a8/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKrKvug1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id nc38si6124964ejc.622.2021.05.21.05.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 05:42:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKrKvug1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621600961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7j8Em2K9BdP1hzxpGTjNb+/7SVGexm+ZKKntisRLj4=;
	b=NKrKvug1EOsdTXAT1WweV56rmZLWQ8Ssidb6COe3mHWwZqloDpxMIPV9/2ZHmjgo1ZOsPh
	pj8w5QE8d/84DyhvqSN31Uzlfqib+Dsc4lUijIMFY1vtgGgd6Q7Oc9ohChPFbF0KiB6Vn7
	/UMovY17/XkWomuQwc19ms2ejZpHIx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-uwNTN3WcNV20kTMYVtl_4g-1; Fri, 21 May 2021 08:42:38 -0400
X-MC-Unique: uwNTN3WcNV20kTMYVtl_4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CC19107ACE8;
	Fri, 21 May 2021 12:42:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D10E45D9E3;
	Fri, 21 May 2021 12:42:27 +0000 (UTC)
To: Willian Rampazzo <wrampazz@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Message-ID: <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
Date: Fri, 21 May 2021 14:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yzFsJb1/xwyi

On 21/05/2021 14.28, Willian Rampazzo wrote:
> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
[...]
>> Alternatively, what about renaming the "acceptance" tests to "validation"
>> instead? That word does not have a duplicated definition in the context of
>> QEMU yet, so I think it would be less confusing.
> 
> While at the beginning of your reply, I started thinking if
> "validation" would cause less confusion for the QEMU project. Although
> validation testing is a broader concept inside the Verification &
> Validation process, encompassing unit testing, functional testing,
> integration testing, system testing, and acceptance testing, it may be
> an option for the QEMU project.
> 
> While system testing would be the correct terminology to use, if it
> causes more confusion, using a less strict terminology, like
> validation testing, is valid, in my opinion.

<semi-homorous-friday-bikeshedding>
Or we could come up with a new, artificial name instead (like "qtests"). It 
certainly need a "q" in the name. For example what about:

- avoqado
- valiqation
- aqueptance
- inteqration

?
</semi-homorous-friday-bikeshedding>

  Thomas
