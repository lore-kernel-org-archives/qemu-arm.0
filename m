Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id up6sm7868459wjc.6.2016.03.24.08.23.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Mar 2016 08:23:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D3D593E018D;
	Thu, 24 Mar 2016 15:23:11 +0000 (GMT)
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org> <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org> <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com> <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, sergey.fedorov@linaro.org, qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Claudio Fontana <claudio.fontana@huawei.com>, Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, "Vassili Karpov \(malc\)" <av1474@comtv.ru>, Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
In-reply-to: <56F4039A.5050907@redhat.com>
Date: Thu, 24 Mar 2016 15:23:11 +0000
Message-ID: <87io0brjc0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: RQolaCnI8JnQ


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 24/03/2016 16:01, Alex Bennée wrote:
>>>> >> OK I found that tricky to follow. Where does the value of the pointer
>>>> >> come from that sets these bottom bits? The TB jumping to this TB sets it?
>>
>> Where I get confused it what is the point of jmp_list_first? If these
>> are two circular lists do we care which the first in the list is? The
>> exit condition when coming out of searching seems when ntb with index =
>> orig tb with index.
>
> Say you have a list for blocks that jump to TB. The next pointer is in
> jmp_list_next[0] for blocks whose first jump is to TB. It is in
> jmp_list_next[1] for blocks whose second jump is to TB.
>
> However, because it is a circular list, you also need TB itself to be a
> part of the list. For TB, the next pointer is in jmp_list_first.
>
> Because TB probably doesn't jump to itself, the first link of the list
> of blocks that jumps to TB is not in jmp_list_next[].  Thus QEMU places
> it in tb->jmp_list_first.
>
> Say you have three tbs.  TB1's first jump and TB2's second jump lead to
> TB0.  Then the list starting at tb0->jmp_list_first goes like this:
>
>     tb0->jmp_list_first = tb1 | 0;
>       .--------------------'    |
>      |                 .--------'
>     tb1->jmp_list_next[0] = tb2 | 1;
>       .--------------------'      |
>       |                 .---------'
>     tb2->jmp_list_next[1] = tb0 | 2;
>
> There is also a case where a TB jumps to itself; it then appears twice
> in the list with different values in the low bits, such as this:
>
>     tb->jmp_list_first = tb | 0;
>      .--------------------'   |
>      |                .-------'
>     tb->jmp_list_next[0] = tb | 2;
>
> Other blocks jumping to TB would appear in the same list, too, either
> before or after the tb|0 link.

Right I follow now. Extra ascii art always helps ;-)

--
Alex Bennée
