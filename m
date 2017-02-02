Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b8sm39776263wrb.17.2017.02.02.05.25.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 05:25:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 482323E0126;
	Thu,  2 Feb 2017 13:25:32 +0000 (GMT)
References: <CAFEAcA9j47hSCHyYh5TzNh5P-V3_ddcmA=XMcini+d8PnqruZA@mail.gmail.com> <87bmuk4zyb.fsf@linaro.org> <CAFEAcA_vxpT+rErpPBmyst+g71KassD-N2755yyY8TvW6S2Y=g@mail.gmail.com> <87a8a44wi9.fsf@linaro.org> <CAFEAcA_NWwQGjXwEMpYBwV=CH_CcmQNhjnXunQMQYNvPFbR0Tg@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.1.91.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers
 <qemu-devel@nongnu.org>, KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?=
 <fred.konrad@greensocs.com>, Alvise Rigo <a.rigo@virtualopensystems.com>,
 "Emilio G. Cota" <cota@braap.org>, Pranith Kumar <bobby.prani@gmail.com>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Mark Burton
 <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana
 <claudio.fontana@huawei.com>, Bamvor Zhang Jian
 <bamvor.zhangjian@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v8 23/25] target-arm: introduce ARM_CP_EXIT_PC
In-reply-to: <CAFEAcA_NWwQGjXwEMpYBwV=CH_CcmQNhjnXunQMQYNvPFbR0Tg@mail.gmail.com>
Date: Thu, 02 Feb 2017 13:25:32 +0000
Message-ID: <878tpo4tdf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kxrUx9oZKVLM


Peter Maydell <peter.maydell@linaro.org> writes:

> On 2 February 2017 at 12:17, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> Your longjump is effectively skipping the normal "end of the TB" code,
>>> which is what usually does the set_condexec for you. At the end of a
>>> TB the expectation is that everything's been sync'd back to the CPU
>>> state structure.
>>
>> Hmm so as long as the tlb flush helpers don't set ARM_CP_SUPPRESS_TB_END
>> things should just work normally?
>
> If they're register writes, yes -- we end the TB on writes but not
> on reads (on the assumption that only writes might modify state that
> requires a TB end). If the TLB instructions are reads then we can
> add a "force TB end" flag.
>
>> Is shouldn't matter if the TB with the
>> flush is chained to a new TB as the exit_request test should fire before
>> any more state changing operations happen?
>
> I think so, but again if you know that you're always going to exit
> the TB then there's no point setting it up so it might chain.

So setting s->is_jmp = DISAS_JUMP ensures that?

--
Alex Bennée
