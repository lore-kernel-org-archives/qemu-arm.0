Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4506287lfa;
        Tue, 8 Jun 2021 08:01:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM/XMRDs+KmQBsrChlABzDPodgmX3ZTFo+4jC5rmImqoJDbVTdJ+2EmSAUvosc0p0yTwGl
X-Received: by 2002:aa7:c445:: with SMTP id n5mr26008894edr.64.1623164500051;
        Tue, 08 Jun 2021 08:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623164500; cv=none;
        d=google.com; s=arc-20160816;
        b=pryQtwwBKmocAjTDM8NfMUuH4GM9mCnU8UDmjosi3JZum4D+KvRvupeKcl83J1nIIb
         7GEceZ7Q13jquWJ49k3xEs4JUwaZxQjwawvOPBp0ZQ55Dt0kdPnX+LFAOsujuGBto1vI
         xaSreyd/Z/ih4csRRj+/1hfRglkLgklIdcnnaWkfmrNOh6mAeFvIEHv15jDkc/Y/j34p
         H9gmZjUCnKkuOgqoUAv2GDt/9JSOa16ZKzZzT3ZHmNwUi4RBZzFoDaL9lqTs4hS7R8UD
         8es6/aX1tMQbnEGyMujZhzF+sd4VLSFvm3mIN2vZnmk4UhJjYr2Z/mThcys9BfRkYBXS
         Uzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vx5R0BPvy494d/s9UoA5JBYkqxPxWI5fJnuec735xiY=;
        b=0Pz0QZ4QzMZ7mgudaF7NoELgFODi0of45QtkbLfmPzFWtnscCv7RyHtVMj4gtyw4oJ
         2myFumv+XRVESzm7jRSo0NP16euDhzntxebS1Z/RIfLA3Vch/gahrz8MJT8JjJXi47Kl
         Hnut2KtUK5TA7OJnd/wl8fNrBRKP62DQJM+8fgzliPeXWdoptoZvRIX3FHTYguewA4ZX
         BDxwMfDsV7LSbpXlB6q/1TaORXWmIQ02EsmsIbzsxyyLNv7Wm1ZE/yoF5gY4hEMo8lkJ
         ob1mxRHv6vQX6KsW2Bm4T2nBBtZ8Le+UoVuxjd3cRnaWUxxKCNpzEawSR2qrsFzP2T0o
         C9KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MgJy3/Jf";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l3si17573377ejd.313.2021.06.08.08.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MgJy3/Jf";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623164499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vx5R0BPvy494d/s9UoA5JBYkqxPxWI5fJnuec735xiY=;
	b=MgJy3/JfWNDPBzOgDh+DebLD6V6qsPOiW61fVYse/mPhSur8i8m86g+bGqE5tQCV0j5JKO
	AhEy+aDlnbUNmRDrffdzGJqTqPnGfdljuQZLE8boS4yKY7PDPB1/ivulMeWVnUIV2l/cWi
	HzUN60/x/niVFDaPkknZDqQk/WZQMpM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-kaBrvWRWPLatTHndaApi5g-1; Tue, 08 Jun 2021 11:01:37 -0400
X-MC-Unique: kaBrvWRWPLatTHndaApi5g-1
Received: by mail-wm1-f69.google.com with SMTP id w3-20020a1cf6030000b0290195fd5fd0f2so867406wmc.4
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vx5R0BPvy494d/s9UoA5JBYkqxPxWI5fJnuec735xiY=;
        b=EDTKpDl9TOWq8+4+SmBnUNJC4csHKwJtG/vIFELkYfSibsDRSfpwhaQwZSLFDn6kyb
         FatY/KDj+hg0i3aAeZAJi6g2eCW+5SE2iOCGc1EasaOaRb9OROc2qBdJ6wUN3A1q/3nj
         qT34pM8wWVSBoUq2YXGYCpE2y1/QwXUa14ky0scxfxj8hCCPXlSosD9px68aYWWxoZ31
         /cXm771r+StFJ7DLE1KtV9iA0WnLaAejIvAHRgF5AGYhwKjEKUq18NyKu3rRuLR87sin
         tZhhW1ghTIC6phEJMlU+WuUvr75Ai1T0HaTFa8z4v3Qt6TZnkdfYnE5c32fami6pLruP
         m4Lg==
X-Gm-Message-State: AOAM533fK7UrnyYIr7nD33EAadluxdAb9kF+pK2esryA4e5NCqEQr2ID
	HtsXeJza+60KO4gyNqg4Ifas8ZZv+6PitncuLDsUYaPa/hdZ13rVQz1gtydLGiDGlC6CCyuZYCH
	zKTUWU28fibGO9RZ0
X-Received: by 2002:a05:600c:4f0c:: with SMTP id l12mr5329341wmq.123.1623164496697;
        Tue, 08 Jun 2021 08:01:36 -0700 (PDT)
X-Received: by 2002:a05:600c:4f0c:: with SMTP id l12mr5329308wmq.123.1623164496516;
        Tue, 08 Jun 2021 08:01:36 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de. [217.232.61.128])
        by smtp.gmail.com with ESMTPSA id b26sm3073377wmj.25.2021.06.08.08.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:01:36 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
Date: Tue, 8 Jun 2021 17:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87im2ol8xu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /FoTIUB4eOKG

On 08/06/2021 16.27, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken...
>>
>> Um, what?
> 
> Really what we want is to probe the -M (machines) that a binary
> supports rather than just barfing the test because we've built a QEMU
> that doesn't support all the random 32 bit machines.
> 
>> r~
>>
>>
>>
>>   and besides it's not likely this is
>>> improving out coverage by much. Test the "virt" machine for both arm
>>> and aarch64 as it can be used by either architecture.
> 
> I think this point still stands though, I don't think we get much from
> running the cdrom test with realview et all on qemu-system-aarch64.

In a lot of CI pipelines, we are either building aarch64 or arm, but not 
both, so I think it might be good to keep the tests in here.

  Thomas
