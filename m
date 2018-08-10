Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g125-v6sm893217wmf.16.2018.08.10.01.55.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Aug 2018 01:55:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4AA713E00CE;
	Fri, 10 Aug 2018 09:55:50 +0100 (BST)
References: <20180808123934.17450-1-alex.bennee@linaro.org> <20180808123934.17450-2-alex.bennee@linaro.org> <20180810033200.GA8773@localhost.localdomain>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, Cleber Rosa <crosa@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH 1/4] scripts/decodetree.py: add a disassembly generator (HACK!)
In-reply-to: <20180810033200.GA8773@localhost.localdomain>
Date: Fri, 10 Aug 2018 09:55:50 +0100
Message-ID: <878t5eppm1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: m2LDz4zt3L+h


Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Aug 08, 2018 at 01:39:31PM +0100, Alex Benn=C3=A9e wrote:
>> Given our issues with failing disassembly we could try and re-use the
>> decode tree data to output what instruction is being decoded. This
>> will be used if registered as a fall-back for when the "proper"
>> disassembler fails to decode an instruction.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I don't have an opinion on the approach you are taking, but the
> Python code you are adding is consistent with the existing style
> of the script.
>
> That said, I find the existing code full of output() calls very
> hard to read.  If anybody wants to volunteer to improve the
> readability of the output generation, it would be welcome.

If we expect to have the script output a number of different forms I
guess re-factoring it with some sort of template based approach would be
worthwhile. I wonder if there are other examples in the code base? We
wouldn't want to have multiple template types.

>
> Acked-by: Eduardo Habkost <ehabkost@redhat.com>


--
Alex Benn=C3=A9e
