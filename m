Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2148101lfo;
        Sat, 30 Jan 2021 10:36:26 -0800 (PST)
X-Received: by 2002:adf:bbc1:: with SMTP id z1mr10425945wrg.95.1612031786143;
        Sat, 30 Jan 2021 10:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612031786; cv=none;
        d=google.com; s=arc-20160816;
        b=LpBIxKGCxT2q3tQvs9I02IRMsswn3QEKksJ8BPRziam/JGyxYHIVtEOFcUvb87iSje
         bCCD38bgAdhYGGqyMdt4jbEoXqEdyWtxIFqAMZmhwXAVbi45RUd1CHFO0UDJDaCiTraF
         y9hcnqjFtgJjEKUkDwUqkSEjNvjVmDFhkza7Z4zJH71rpY1TKR8D4JPzUwPx/+gst5Jk
         NXXT54mnGcIJih2c92uhkJTWSMf9RXC05BNDsgJxzd8lskHPNMYBwGqKaxFHteNDXp5m
         ucJc18ps5WkdYpchzcM4rYsKrZTbV+0uAlBOa0S7h9Aimtnfy1wo1OnAfKRcQoKZ+dNJ
         BT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=1mNh9mlH0J+zMjgMzcqZVDvGumB7ljSHk0DeAaBnlyo=;
        b=pw59ttQrm9dA1ejY0U2S1+ySQ5h4kBV4SUUPsyV/zq2fzRRjYo4YeObevDIkfXygZ2
         jmRqXJAq7xUYCjkOdi27Cv5qZyRPywQtXqxTeMw4ypGLnYVsfdVxB0ghVlWb3EMo+rHt
         adS9IwNNnZbdCs4cPdVBJcEDIK94GnGPGTpkt/cOEB+yG3R34UFe8G14BfOLdFY3pA23
         4d1mNML4YwQzn6K83rxuJD5vd8AnNkcSExvMvmYb+Y8FU7FzVkKsQEmJXGt/cV2QJD2d
         supgLpXsRJb8ewPif7QzAGpxqzIktGMqnr2F0GN2JMizzoo3Dq6EdO7oAkEP41DML0i+
         uQYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WbGzkcuA;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 191sor723719wmb.23.2021.01.30.10.36.25
        (Google Transport Security);
        Sat, 30 Jan 2021 10:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WbGzkcuA;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1mNh9mlH0J+zMjgMzcqZVDvGumB7ljSHk0DeAaBnlyo=;
        b=WbGzkcuAeKstM9npuwuwjBnsuEZm3r5ywk/P67nlhSNsqQWcxGtIyp/B/UlSUyJqWe
         rWBBL0Hz04hYGcGKDbdlr+Q5TbjmlDYeP5aAaN0R5Ay5zodmCvmp+ggN5wHssG7x7vyD
         3JMGGA5AK75ov59qdcqNoZf8s+vtn2UJxw1pfb79km+kvaVW4eKgDH3lx4Mh0ZHyu1Es
         c8DrTbZ1CxgbbiLIZJsUSSC8Q0FPV6OGKMYCyFML2qBkeE7xTcngCuC6pXhF6fRDpxw8
         rRY35sV+EjjJAipw1mYL04unB71LVdiuXGyJ5HxfzbLH8oo7/z0NEn0QORV5RNgzd6a6
         q3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1mNh9mlH0J+zMjgMzcqZVDvGumB7ljSHk0DeAaBnlyo=;
        b=AV19rrVSAm6R/jt+a1/+1bi2WWaBvwifyjoY1pBFnbVdZjF91ULxEqNbfIk2e7Qh/p
         +guXD/IFLCUh5XZE9DnXqMbdvBChRTZ9Verc7pVUUEWijL7vZ/H/jsBfrOY/Pcb1k0xi
         ejklCn2wire+P4djASTvfVWVUTzNLnttDG2wasfxMHC0+Wk6u86I1UyPfHOxl9EWSPdB
         gAkP4WRai7710fBxdme/FffRj/cT48ygXej8Psip/zuqJiGCK4auGEnLtHKf729/ppoj
         gVtgY0ksKy18VVEsMcuDjSYbf1lsFfas7VS1OOjExMB21oUP3DrxLd1ng1wBRtEeIAy1
         2PTA==
X-Gm-Message-State: AOAM5327v+5jjeWYCaeSJ9VpmuYmuqwjCegnI0mQRog07s+DDfbJb9DT
	+CrA3cW9DQri460N9iSjINo=
X-Google-Smtp-Source: ABdhPJyXkcz3LAR4E0+PEoeKblLFblLD+ThxjmdYgyS8ayJSPNpoC+HMjVsKg7NDgRMrHhT3Y4wlJQ==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr8531992wma.76.1612031785730;
        Sat, 30 Jan 2021 10:36:25 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id y67sm15807411wmg.47.2021.01.30.10.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 10:36:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
 <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
Date: Sat, 30 Jan 2021 19:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 67MJ8JxYGNPy

Hi Peter,

On 1/30/21 4:37 PM, Peter Maydell wrote:
> On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> KVM requires a cpu based on (at least) the ARMv7 architecture.
> 
> These days it requires ARMv8, because we dropped 32-bit host
> support, and all 64-bit host CPUs are v8.

Oh, this comment is about the target, to justify it is pointless to
include pre-v7 target cpus/machines in a KVM-only binary.

I'll update as:

"KVM requires the target cpu based on (at least) the ARMv7
architecture."

Is that OK?

Thanks,

Phil.
