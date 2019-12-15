Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2984244lff;
        Sat, 14 Dec 2019 20:56:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzV7TIkvbXCt6AcUS0iZ4MyuBTYNVN75/35Cuci3IYAZSm21UQU/T6l1E6t6wiVkg2tVhgu
X-Received: by 2002:a37:6543:: with SMTP id z64mr22151158qkb.389.1576385810443;
        Sat, 14 Dec 2019 20:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576385810; cv=none;
        d=google.com; s=arc-20160816;
        b=XigG7xvlBvn4nJqjvUDSHJ25onkMtz6CkPC4y8R+Bow+N8zunLEO2ujEpD/craj2da
         grkAt+mLwhX776McURNekDr4UWGb7x8CM/c8u25FZgGU1+7BLgIX5v4EZIrnvPakHKZo
         XzFsCca8nYbeKUeLhU21dFeMyV8cZqMImW409MYiS0iKFDondbbxruWqIJB25DD4tsv5
         gXefWIbh5adRk2qQw7sQGa3wXG/jw+HWdEQl0hGuZHQwE9WFV7LVqwXsL5is5jPmyRVQ
         5gjZf6Cld+0l9zB5sKx13biHRMSyVJAp9CRLJpITydIxXDVjjlHQkFb27CxASsUDSoTE
         ptUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=B8HFuknbXINXAAhRk14V53jaomrIIMFMcmuG8o0oqKM=;
        b=ikWbk8fH/qZPb2fQQM6aRcuFSukUnSYULJaOk1vKxqtiJp3P+mHWNf/Ve0GIENup29
         oWi7+YU+ttvG0vWRMiU7Z3hd8tLQR9FntfR4L/e7zXX8jrS+ic8LK8P6TwpMxDtJmIxL
         nj9ZMvooCV4N+UNX8g9/otiCsHK8n2k37xKsGKf5EY9ReST8+oF3qSsBypaXu1I3lqc/
         p5KnxOTkq/K8hOaPR0Ypj7kuF/5qnkhKHiE8hute/9CWvBzsEfXKNcW00AuQWRFNFS+t
         XlHxfwrXZ7eMzotrZSP10cmcIw0R3M+20oRr7iLCHxGPmSbaIrq9Z3B5c5JdHch2pQNL
         ByOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NoPmfL4x;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id h3si7745568qvs.71.2019.12.14.20.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Dec 2019 20:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NoPmfL4x;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576385809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8HFuknbXINXAAhRk14V53jaomrIIMFMcmuG8o0oqKM=;
	b=NoPmfL4xVIdugKixqq9r7tVj6ZKADB5ooPtb2w6BXP0bPDn0aINpUGjfNcjpH4Zust3fAm
	GsbsjaQ+zQLEi4c6vfURoigyL6qvHb5k9ZszI+ZoZmm33lNWdyBMQttXMRzAhY/0SmPxbb
	cr+oo0DyaCZOKj56lYydW6Q0hXJbb9E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-_Ujmt2ZdOJSAUyfHvmSARA-1; Sat, 14 Dec 2019 23:56:48 -0500
Received: by mail-wr1-f69.google.com with SMTP id y7so429580wrm.3
        for <alex.bennee@linaro.org>; Sat, 14 Dec 2019 20:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rDlgANhttMxSBGvPj/xsQ6/eaqHcaNJi+vyNymVXSvw=;
        b=ORqRNDhmxAXLQWXo+Nj0A7re82cH8HqD9pDWJMzUjY4o/9en243B/qPbOH4ClDMH5Z
         ocE0f46qsPCuny54dy3+chyrA5OWLByLJasXNMti24/1CAv0IMZ3zghLepsGJb9OUcC4
         FgzNhaYnExqVgxVa/4s6DZDh6Lj/B8nesdRIkh38dPcTDIq3vYTfn9qCIc3XWoQMux96
         DaVdpdyA2J9/WWR/IM9cPu3S3PyXhAEjWh2qztMftgQ9jO46LS0L9OsUXbRPQ6pH7M94
         r6Qtfn8PleFEZNjTdw6t+a7OLvIPt9VvbmfS46vWVrLZfJSzDFzeZ82VEFmv3BZljjIa
         U+cg==
X-Gm-Message-State: APjAAAVm953kXQbUhRTjnowrijurRnBtRkd19/QGD9ou0ED/4LoPQvVY
	w0JsHe1HS8+NRsm0NABzMaRgNg6kVXPxTJ6g/Z2NGsCx3f6PoT0/f0SatSZqEpbLdfZfxrO+Y3e
	dwsKRx74GHuifqy4o
X-Received: by 2002:a1c:f008:: with SMTP id a8mr22594391wmb.81.1576385805922;
        Sat, 14 Dec 2019 20:56:45 -0800 (PST)
X-Received: by 2002:a1c:f008:: with SMTP id a8mr22594375wmb.81.1576385805703;
        Sat, 14 Dec 2019 20:56:45 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.34])
        by smtp.gmail.com with ESMTPSA id y20sm15499882wmi.25.2019.12.14.20.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2019 20:56:45 -0800 (PST)
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20191209134552.27733-1-philmd@redhat.com>
 <87d0cx32vv.fsf@linaro.org> <1d51109a-ae9f-7bfe-66d4-0e1e1266df64@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1407bf23-85c2-fce2-da17-bed6766456f9@redhat.com>
Date: Sun, 15 Dec 2019 05:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1d51109a-ae9f-7bfe-66d4-0e1e1266df64@linaro.org>
Content-Language: en-US
X-MC-Unique: _Ujmt2ZdOJSAUyfHvmSARA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 8a0v7DeEle3D

On 12/12/19 1:36 AM, Richard Henderson wrote:
> On 12/9/19 8:00 AM, Alex Benn=C3=A9e wrote:
>>> -#ifdef CONFIG_DEBUG_TCG
>>> -    assert(flags =3D=3D rebuild_hflags_internal(env));
>>> -#endif
>>> +    assert_hflags_rebuild_correctly(env);
>>
>> I'm trying to recall why we don't just use:
>>
>>    g_assert_cmphex(flags, =3D, rebuild_hflags_internal(env))

s/=3D/=3D=3D/ ;)

>>
>> I think it came up in one of the reviews.
>=20
> checkpatch.pl.
>=20
> Because, I believe, there is an environment variable that causes this to =
*not*
> abort on mismatch.

Indeed, see commit 6e9389563e5:

commit 6e9389563e56607f72562bdb72db452fcd7e7f74
Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
Date:   Thu Apr 27 17:55:26 2017 +0100

     checkpatch: Disallow glib asserts in main code

     Glib commit a6a875068779 (from 2013) made many of the glib assert
     macros non-fatal if a flag is set.
     This causes two problems:
       a) Compilers moan that your code is unsafe even though you've
          put an assert in before the point of use.
       b) Someone evil could, in a library, call
          g_test_set_nonfatal_assertions() and cause our assertions in
          important places not to fail and potentially allow memory=20
overruns.

     Ban most of the glib assertion functions (basically everything except
     g_assert and g_assert_not_reached) except in tests/

     This makes checkpatch gives an error such as:

       ERROR: Use g_assert or g_assert_not_reached
       #77: FILE: vl.c:4725:
       +    g_assert_cmpstr("Chocolate", >, "Cheese");
