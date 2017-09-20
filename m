Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f43sm1574283wra.79.2017.09.20.02.36.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Sep 2017 02:36:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A4F683E010A;
	Wed, 20 Sep 2017 10:36:56 +0100 (BST)
References: <20170915150849.23557-1-peter.maydell@linaro.org> <CAKmqyKPEtdXp2Dn2a2FuL-f_WVaRDEaY_3_=h=2kVobFm4z4QA@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.3.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, "qemu-devel\@nongnu.org Developers" <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Remove out of date ARM ARM section references in A64 decoder
In-reply-to: <CAKmqyKPEtdXp2Dn2a2FuL-f_WVaRDEaY_3_=h=2kVobFm4z4QA@mail.gmail.com>
Date: Wed, 20 Sep 2017 10:36:56 +0100
Message-ID: <87zi9pd83r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: bqmVxhIf3tVX


Alistair Francis <alistair23@gmail.com> writes:

> On Fri, Sep 15, 2017 at 8:08 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> In the A64 decoder, we have a lot of references to section numbers
>> from version A.a of the v8A ARM ARM (DDI0487). This version of the
>> document is now long obsolete (we are currently on revision B.a),
>> and various intervening versions renumbered all the sections.
>>
>> The most recent B.a version of the document doesn't assign
>> section numbers at all to the individual instruction classes
>> in the way that the various A.x versions did. The simplest thing
>> to do is just to delete all the out of date C.x.x references.
>>
<snip>
>>
>> -/* C3.6.2 TBL/TBX
>> +/* BL/TBX
>
> I don't know how I noticed this, but it looks like you are missing a T.

Good catch!

--
Alex Bennée
