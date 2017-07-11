Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r191sm1399101wmg.6.2017.07.11.01.27.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 01:27:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 797853E025C;
	Tue, 11 Jul 2017 09:27:23 +0100 (BST)
References: <20170710192128.9048-1-alex.bennee@linaro.org> <20170710192128.9048-5-alex.bennee@linaro.org> <e21159d2-42aa-1b08-5ea9-2f367a8e452f@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-devel@nongnu.org, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 4/5] target/arm: use DISAS_JUMP for ISB handling
In-reply-to: <e21159d2-42aa-1b08-5ea9-2f367a8e452f@twiddle.net>
Date: Tue, 11 Jul 2017 09:27:23 +0100
Message-ID: <87lgnv9y50.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: tGqLOZdHJJI3


Richard Henderson <rth@twiddle.net> writes:

> On 07/10/2017 09:21 AM, Alex Bennée wrote:
>> -        s->is_jmp = DISAS_UPDATE;
>> +        gen_a64_set_pc_im(s->pc);
>> +        s->is_jmp = DISAS_JUMP;
>
> Better would be gen_goto_tb.  The destination is known, so there's no
> need to go through lookup_and_goto_ptr.  You still get the icount_decr
> check at the start of the linked TB, which is what you're looking for.
>
> Interesting that a64's gen_goto_tb sets is_jmp, but a32 does not...

Hmm the only caller that is not already in the exit path sets it. Maybe
I should push the s->is_jmp to the a32 gen_goto_tb? I can then do the
same in both.

--
Alex Bennée
