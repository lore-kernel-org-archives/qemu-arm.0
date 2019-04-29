Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3612604wrh;
        Mon, 29 Apr 2019 08:07:53 -0700 (PDT)
X-Received: by 2002:a1c:5f42:: with SMTP id t63mr16728109wmb.94.1556550473435;
        Mon, 29 Apr 2019 08:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556550473; cv=none;
        d=google.com; s=arc-20160816;
        b=SUQ76ZYnBybab9tSgPkpKcJtvuGu65jr9g3e5PXP6nWFm6Q1LDyi5ClMY2ZZCcR+QW
         tGMFn59IfRc2EYuZNJIaMs+lTnpNZ1nlP1MsgRe3gv9rj2Ji/VqsU70X7qUaclt3DLpH
         JXOAus5VSHnKWiGU3s5CnFb0UE9/GuV1fU4clXeQPplBgfhzFLdcjt+vh7f8PX7NMe+U
         0JYpX2xMV2NA2Xg5p95UjwudUWjy9rRUHCMJZYpNbJjXP6j1wrRBeSXbieTW6RM2cMtj
         5uOSxRkPSKvfQKNLf/Xq0lY4hLeCu2a7dhzdtFEh6YaDSFLVUWEE1azr72qFqiNezp2v
         hE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=MpDgiLgJ9RRXgUs7sB2muXL9gf9ys+AyRP6KFcSBe2g=;
        b=qFZ51jyW53z26H2w3fHGCg1Uv7VbKkuh2i3zriCHeYP8OAFj4FPFFgBJb2QSvj62g4
         w4IdGjjD5fyLJR7Y3IbICAXLgTQYcfxuzvd7kQT7gBZeIb5Rh+e+VE38NCMVkuzgdxdx
         zPT349GV+pGjjY/7e4XWMpQCdeN2QeftsGmPfTyBw8H6aGUHepCOb1eQanmp6d6SJ/fd
         lMVX+o0dAh6PmaN3iNAuM45qRZG81DBNi5vfg4Hg/1w+EMs8nW7wlaSKhe4OJhG8ta2U
         U8BxXKNQijv6m4Yb4DAf+V9hy6gVHb5/tMM0x47gn99j/kq39kJpMoNmgZcgYR1UumtM
         BhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t4sor2628356wrx.15.2019.04.29.08.07.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Apr 2019 08:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MpDgiLgJ9RRXgUs7sB2muXL9gf9ys+AyRP6KFcSBe2g=;
        b=IbmzQRZ6zZRZNsDRKm0VxcUyHeUmrYVWlfNf/fMZMu3xknBd5dPe1AOK+duQs+opl1
         DCJV529g9oWM9oK9CL98MTrNhVppKk/Y7/Ep3w7jIPmmtTiogRLaG9Wh5eJvssAutoMb
         fbSuKtpWQmQ0YpXYevXmREGpr6rJIYtQYTHg4bBFSmVZR3i9JFjQFFX5LQcOn1sbqNIO
         If1/wBfuUUkii2K1OA9RE6uVEffxkMnig5NvFFIXo+qruvML9QPKVWwRraNkXUUnATIQ
         NRF1n2/DYd8FH3e6y82vcAWMddSHpeRiUhrrIxUDOoywYt2lBn3XFFgS7K+N0S9W7AZ/
         KpWg==
X-Gm-Message-State: APjAAAVXaSUgM/8oMD3bZELSvk7sJluNU5fofBsWCz3vyL1KezfEOKnI
	MoB3HjRmS2Nm5B0UdTFDabkEHg==
X-Google-Smtp-Source: APXvYqwjTrm88f5VUi+f7MCLkauYaswQp2D7ydZ4HwTVXJDIPPRndQ17lyHzANbbwqmfVbzTqp7ETQ==
X-Received: by 2002:adf:f749:: with SMTP id z9mr25511737wrp.218.1556550473246;
        Mon, 29 Apr 2019 08:07:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id 10sm32295838wmd.23.2019.04.29.08.07.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 08:07:52 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Jim Mussared <jim@groklearning.com>, Julia Suvorova <jusual@mail.ru>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
 <20190426091702.GA2071@stefanha-x1.localdomain>
 <CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com>
 <20190429122819.GB7587@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <738394de-bd75-4ef3-10ef-de8cd07891de@redhat.com>
Date: Mon, 29 Apr 2019 17:07:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429122819.GB7587@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hkiYsLwLUmt2



On 4/29/19 2:28 PM, Stefan Hajnoczi wrote:
> On Fri, Apr 26, 2019 at 12:45:37PM +0100, Peter Maydell wrote:
>> On Fri, 26 Apr 2019 at 10:17, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>> On Thu, Apr 25, 2019 at 08:07:06PM +0200, Philippe Mathieu-Daudé wrote:
>>> Old boards probably want to continue using -kernel.  New boards like
>>> microbit may use just -device loader.  Perhaps there is even a group
>>> that wants both options.
>>>
>>> A solution is to introduce explicit checks so that we can tell the user
>>> the appropriate option for the machine type.  I can work on this if you
>>> like, but probably won't be able to send a patch until Tuesday.
>>
>> But it's difficult to tell how to identify whether there's really
>> any guest code there. For instance the user might want to start
>> QEMU, connect via the gdbstub and load guest code from gdb.
>> Or they might be using the generic-loader device. Or they might
>> really be using -kernel but with a broken guest image which doesn't
>> have a vector table in it, which will result in the same message.
>> I guess you could have a heuristic for "if an M-profile CPU is in reset
>> and the value it loads for the starting PC is zero and the gdb
>> stub is not connected, then print a warning that the guest image
>> is missing or there's no vector table" but I'm not a big fan of
>> heuristics...
> 
> I was going to add a function to check kernel_filename and the presence
> of -device loader.  Then each machine type init function would call the
> function with flags indicating which modes are allowed:
> 
>   /* Allow both -kernel and -device loader */
>   check_kernel_loaded(KERNEL_CMDLINE | KERNEL_LOADER);
> 
>   /* Allow only -kernel */
>   check_kernel_loaded(KERNEL_CMDLINE);
> 
>   /* Allow only -device loader */
>   check_kernel_loaded(KERNEL_LOADER);
> 
> This doesn't support the gdbstub use case you've described though.  No
> heuristics but a bit inflexible.
> What do you think?

We can check for QEMU_OPTION_gdb/QEMU_OPTION_s, if present display
warning, else display error? Or no warning at all...
