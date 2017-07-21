Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z108sm14993413wrb.41.2017.07.21.02.57.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:57:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 330663E0127;
	Fri, 21 Jul 2017 10:57:00 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-3-alex.bennee@linaro.org> <98e1b6a7-7af5-7b8b-23c8-159572c83eb4@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, rth@twiddle.net
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 02/23] fpu: import SoftFloat3c
In-reply-to: <98e1b6a7-7af5-7b8b-23c8-159572c83eb4@redhat.com>
Date: Fri, 21 Jul 2017 10:57:00 +0100
Message-ID: <87shhq6rkj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: QPC8uMbAXX7W


Thomas Huth <thuth@redhat.com> writes:

> On 20.07.2017 17:04, Alex Bennée wrote:
>> SoftFloat3c is a re-write of the BSD softfloat library which includes
>> a number of new features. It has been written with libraries in mind
>> and has a new API so hopefully we can use both side-by-side as we
>> migrate.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  fpu/softfloat3c/8086-SSE/extF80M_isSignalingNaN.c |   57 +
>
> I'd maybe rather name the folder "softfloat3" instead of "softfloat3c"
> ... otherwise it does not match anymore if we ever want to update to
> version 3d (which is likely just a minor release with some few bug
> fixes, so we likely don't want to maintain that in a separate folder)

Good point, will do.

--
Alex Bennée
