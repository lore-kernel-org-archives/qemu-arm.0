Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2125195lfc;
        Sun, 15 Mar 2020 13:17:32 -0700 (PDT)
X-Received: by 2002:a17:90b:370c:: with SMTP id mg12mr7835022pjb.154.1584303452492;
        Sun, 15 Mar 2020 13:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584303452; cv=none;
        d=google.com; s=arc-20160816;
        b=WG32uJO5KswVJmWAfZm3YpLq1tXzmypFjO8Jr4rlqIphybiV09ca6EkkA8GfAugdNF
         3PvhuRYiSOZHyxRUx3oKD2Em8OPss6xckAU02i1IzjGLSwEJozhQfB1o/hvzQ0IimZWt
         sSeJCsWzU+leJpvXvR7Gb4YPy1mfgiZrWEtNp1VVA0u1U7j4hyJVqolicB/pR/nkzrWV
         nLdeStdz9yD0s9czz8r/vyK+AWmlA9u8p/LrkVsZx/B9czVmjc33BtDPmUtSY60Qy9ww
         hkuhGQ4EFyxZLF48j89vClejbe7iR3S2NeEu1a11YAnpZBIJIMyDs0G4pPqY1bpJwxh6
         1M8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6gBwYbnX4Se3M5jfu273nxf9h2vGvRVO0RidTPNXEr0=;
        b=JJ/uVk9wVUZfQcy6aRmkYTv1cWDh+HAY8U9lsOQKA1REoValSUQghT5ARNsniVyUaR
         zAci5JsyUvSnat2l6xXzepzkAygizAFhO82ok0L4e2cxmv8DXolIj8ALHS38Z9TAa0sX
         9czvLCikzD2wLRw2miao+puiE/EIuQ8/vt5IwoaanC9YP1Y/nIVEBsu2TJzW7hXpNQqi
         c0PEQw9b1ZtwX7jqjlXfzCljsV63gQyvBNsIALi2jDBInDjIlqj3Nnv5761ymDNsSEaK
         uidww6cKvQQRCU2ZSSq4Fv4mrAf0+fKY01+CG9rOu8ajIu10DNSvQDz9aF/fMRK41zNb
         OHog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I2E/3N9J";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d26sor18446032pgb.6.2020.03.15.13.17.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I2E/3N9J";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6gBwYbnX4Se3M5jfu273nxf9h2vGvRVO0RidTPNXEr0=;
        b=I2E/3N9J5wVSHrrdGxlRtlqdy44+ZlhOHgN+wGslHxCr4+W4xiZXj3udZ9D31Ngjrh
         6bf7CI/CGckIWfC9F275EZmzIUTu8A4aI9LlZ4C7x1dE2JZwoAmcTYdd6Vg5jotCdc0s
         C/kwHfrhB9bQFtpVkn2D+qhni7El9685nay2zcGm26kVArIv7D1skBA+8IRfZK28eOGZ
         zpVmVCb1NulH/axIWqoo6rMNnAB7LNBtEuDDJikFrbdmOTHc1X0pxcIygQVYiD2Bzi1L
         8H7dPKDWQCr/PiSIEgJHsG6WNjo315uZp8GRPCjUlPFBdSDGpry0AaGEMAgUBNQKCy9Q
         IDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6gBwYbnX4Se3M5jfu273nxf9h2vGvRVO0RidTPNXEr0=;
        b=CDNGoYL+5yTo6AbE9+YyEnlRf90LFAY9sN1CULzX3CQmmGtJ9RWFpKrp1bP2huTZ8f
         0mx3mcJvAAKOsvo0kS6tnpRBSmaHi9AeiHOmsZkphb2IR1XHJGcSagDFr1NmOH0zMB23
         d8y1tOY3rTePu8fLJ0PHBFBGbuFyYDbqO7317sby4so0yiVhEusKooi62FAXcrJmro5w
         0lrx7KA/wjj4USya8QjdTgk7w9zCr3JJPEvfbq+NN7gJbUzrZI6RBksj2RXWGNT9cuyu
         w8lriSSrI0ig7CRqONRS6K47f9wIdhP9ZEmpx4jfE61STjS/e+K9Lgjjh2pJdMevnuaJ
         tuuA==
X-Gm-Message-State: ANhLgQ0gIJC4kfsmYXIjZMWzDzkKWBYya3PicJIQ2/U0+xvcdUie9xoT
	YsaosfzxpLFZvhg5LoG0zwSiYVPL
X-Google-Smtp-Source: ADFU+vssijLhaXyL/4k+UfHIYKXFWUVTPyO2a4DXoxZAIug2ken6y9Qn0xE5K7nlggctqPlVJ4SzVg==
X-Received: by 2002:a63:ee02:: with SMTP id e2mr22989077pgi.183.1584303451954;
        Sun, 15 Mar 2020 13:17:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id f127sm65685327pfa.112.2020.03.15.13.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:17:31 -0700 (PDT)
Subject: Re: [PATCH 04/14] tests/Makefile: Restrict some softmmu-only tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-5-philmd@redhat.com>
 <942d57d6-b272-c2c6-b2df-405d81d03996@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab32ab13-f5ce-8f6d-af9e-d59272801c3d@linaro.org>
Date: Sun, 15 Mar 2020 13:17:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <942d57d6-b272-c2c6-b2df-405d81d03996@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7WRILQdTTAHH

On 3/15/20 1:07 PM, Richard Henderson wrote:
> On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
>> These tests fails when configured with --disable-system.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/Makefile.include | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> So... they don't currently fail check-unit.  Did you mean to say that they
> *will* fail once other files are disabled?

Ah yes.  I've rebased your patchset without this one and it does fail.  So with
a re-worded commit message,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~
