Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5771516lff;
        Tue, 17 Dec 2019 02:04:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhR2hdPhIfLSfNzTOl5IaaXUHIwPyMWiGMrkW8QSZSED7lfbEPMwqb6uf9/7kfto6vrS0L
X-Received: by 2002:a0c:9ad6:: with SMTP id k22mr3637411qvf.154.1576577077023;
        Tue, 17 Dec 2019 02:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576577077; cv=none;
        d=google.com; s=arc-20160816;
        b=eJSeP3WGzW7uMvrDVv8RuHvH6RvsfjOqQVMIRME2/EuGZU7cm8tZYM4mYkYbLS/Obo
         +AsF59lJbvxbIAvXJmg/SKiYi/O4YqgtCmKohkKwa16Iu7priFCJdpfaQiSx8GocJP0e
         0o2CgXo6vfvFpU0Vj2luPTrtZNFo/GydsMJG7+pX0SHmhfj4gDw4O9+jig5O9ShsHxyQ
         cGuzKPBKHncl9HBGNI6WSdfa5/srgf4kkPj8jg6ZwtRK5tzTPAc1+w3D6/dREV3GpnF0
         RpDhjhaxyIi8qaHRL4naI8JwSuwgVMbJVZMtAKZGSkkffxuUcOgAhPL5f7yTFLIh5NKv
         so2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=loAK4kVwopibUcm9RXYBoS7F17AJtpqG86ZIEZJUItE=;
        b=cetilSYV9U0KrLUGBjHeRoAymqAgBhNVnivsqxBl6wwJ/bKyRA9guOxyjX+jGh2Ljo
         axlmmIu0DrWoGdrnI2nsIhvywZc18Bq7S+ombFMDzdhnxl9TV2U6OTMO8EeN/fYSmken
         mIgamyC0DL4UbD3LpFhiwfxC5kv+SL4+dHAXDyO3no1Gj5/IK0YTEOBfo/LWLNPirKl1
         uSaDAnSJ26zsr/oSTBxeXjFQ8p/ZVMH1SLAmBhn0Z65cRBaNUO1e1gMjmtw7Y1NDmHzt
         HoW6rqyeAjBDuUvHLiSBEm7sHfbl+PCAPHOqRQ+ETZ4dqQrrMGvnu/gfiOI97ecs3XR7
         JSpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RZdOn97a;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id f9si3070222qto.263.2019.12.17.02.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 02:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RZdOn97a;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576577076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=loAK4kVwopibUcm9RXYBoS7F17AJtpqG86ZIEZJUItE=;
	b=RZdOn97aLuYppzl+16FcEWuU9AqOBOpxcCy6WsIKmmWPJbvHGixL016ap2FjvUF9J7iY9g
	jzbfP/aTg89a/knDWOSSYFhiwGoM2l4TAd3Tg5LHC7qRT1IgvvNlj+YKeMyW7poR79uwDI
	+qVH1HsVPftcqkNfBk4pPq5h6ybtCV0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-L3fuDn8rOqeCR5wQQjvpYQ-1; Tue, 17 Dec 2019 05:04:35 -0500
Received: by mail-wr1-f71.google.com with SMTP id j13so5126008wrr.20
        for <alex.bennee@linaro.org>; Tue, 17 Dec 2019 02:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D6qcer7pEfC9pWYO7pBi1lXIWSygHQ8u1k+W/Teuk1I=;
        b=hCMugnup0rd3m2NGOi4JO+1mXd2QP38slNrkwDL9CIad1k8QraZUX3ac2mXOMP1sEV
         9Wc7uJuAr6b/sLEyfjws0mpEljidBYa+C7w956sOjqI59i9nnYLHbWt2GjZl07berCmE
         6kg6D2r41BypOMPrs9CyylyOUtbL6KCKhDjZbMYpVbivu6RcBEnWCBZogMLTOxJTsYFL
         XPo+ZhmuSAHxzgv7IN/7/VMpTl/+Z5d6VV5Mk9WebxS5/4NWKogoFK7T2g+kOyROTsTB
         zjp79XAQK5Bbm21HgMHEkeCpj67Qr8IHyZpTN44o6ZuaMrE2/d7APedcxQjogTXlg8y+
         8Duw==
X-Gm-Message-State: APjAAAVJSI8m/VIIDIxJNKKPyWZXkM6jf4ev6Mvn4a5PfAZ6VO3+zeCY
	Uqm38aUQ/O36TBM1M0r8LNTzeeGCh0x6bJyaMjExMycBMubVeS0LEmQY9hUZqTATwhllo859QmQ
	FF7GRRXalm3QkgF1W
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr4646942wma.89.1576577073987;
        Tue, 17 Dec 2019 02:04:33 -0800 (PST)
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr4646911wma.89.1576577073720;
        Tue, 17 Dec 2019 02:04:33 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:503f:4ffc:fc4a:f29a? ([2001:b07:6468:f312:503f:4ffc:fc4a:f29a])
        by smtp.gmail.com with ESMTPSA id v83sm2480731wmg.16.2019.12.17.02.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 02:04:33 -0800 (PST)
Subject: Re: [PATCH] Semihost SYS_READC implementation (v6)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
References: <87h83w4dod.fsf@keithp.com>
 <20191104204230.12249-1-keithp@keithp.com> <87h81zwdmw.fsf@linaro.org>
 <5a3b1155-4242-831c-8ae4-e9fb07f1cdb2@redhat.com> <87eex3wa9a.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <77dd4863-6301-b17d-529c-451d491d4794@redhat.com>
Date: Tue, 17 Dec 2019 11:04:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87eex3wa9a.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: L3fuDn8rOqeCR5wQQjvpYQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4cOpWntMhiX9

On 17/12/19 10:51, Alex Benn=C3=A9e wrote:
>>> Secondly if the vCPU is paused (via console or gdbstub) we need to
>>> unwind from our blocking position and be in a position to restart
>>> cleanly.
>> Perhaps if fifo8_is_empty(&c->fifo) the CPU could update the PC back to
>> the SVC instruction and enter a halted state?  Perhaps with a new
>> CPU_INTERRUPT_* flag that would be checked in arm_cpu_has_work.
> I don't think the PC has been updated at this point - but we don't want
> that logic in the common semihosting code. If we cpu_loop_exit the
> exception is still in effect and will re-run when we start again.

So that would work?  cpu_loop_exit if the FIFO is empty, reentering via
cpu_interrupt and clearing the interrupt signal in do_arm_semihosting.

> What we really want to do is fall back to the same halting semantics
> that leave us in qemu_wait_io_event until there is something to process.
> Is there any particular reason a blocking semihosting event isn't like
> any other IO event?

The "io" in wait_io_event really stands for "iothread".  Usually in
system emulation "waiting for I/O events" means "waiting for an
interrupt" with a halt instruction (for ARM, WFE/WFI), hence my suggestion.

Thanks,

Paolo
