Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q141sm3989285wmg.3.2015.10.29.08.11.46
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2015 08:11:46 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id CF5883E03C9;
	Thu, 29 Oct 2015 15:11:45 +0000 (GMT)
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com> <20151027105322.GA16832@hawk.localdomain>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
In-reply-to: <20151027105322.GA16832@hawk.localdomain>
Date: Thu, 29 Oct 2015 15:11:45 +0000
Message-ID: <87io5pwvym.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: wg8cb4hJj5KF


Andrew Jones <drjones@redhat.com> writes:

> On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:
>> Hi; it's been suggested to me that it would be helpful to have a
>> qemu-arm mailing list, along the lines of the existing qemu-ppc
>> and qemu-block lists. The idea would be to get people to cc the
>> list with their ARM related patches, so it would mostly act as
>> a way for people to filter their mail to separate the ARM stuff
>> out from the qemu-devel firehose. (Everything should still be
>> cc'd to qemu-devel as well.)
>> 
>> Any objections/opinions?
>
> FWIW, I like the idea. Although

I have no objections to the idea.

>
> notmuch tag +qemu-arm -- tag:new \
>                          and to:qemu-devel@nongnu.org \
>                          and \( subject:arm or subject:aarch64 \)
>
> also seems to work pretty well for me.

Funnily enough for mu I have the something similar:

list:qemu-devel.nongnu.org AND (aarch64 OR arm64 OR A64)

>
> Thanks,
> drew


-- 
Alex Bennée
