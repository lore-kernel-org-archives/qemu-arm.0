Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z14sm15521995wrp.70.2021.11.24.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:40:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DB9DE1FF96;
	Wed, 24 Nov 2021 11:40:47 +0000 (GMT)
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-2-alex.bennee@linaro.org>
 <20211124110659.jhjuuzez6ij5v7g7@gator.home>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
 idan.horowitz@gmail.com, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v8 01/10] docs: mention checkpatch in the
 README
Date: Wed, 24 Nov 2021 11:38:16 +0000
In-reply-to: <20211124110659.jhjuuzez6ij5v7g7@gator.home>
Message-ID: <87y25dhjcw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QhTx6H0OBaVT


Andrew Jones <drjones@redhat.com> writes:

> On Thu, Nov 18, 2021 at 06:46:41PM +0000, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  README.md | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/README.md b/README.md
>> index b498aaf..5db48e5 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -182,3 +182,5 @@ the code files.  We also start with common code and =
finish with unit test
>>  code. git-diff's orderFile feature allows us to specify the order in a
>>  file.  The orderFile we use is `scripts/git.difforder`; adding the conf=
ig
>>  with `git config diff.orderFile scripts/git.difforder` enables it.
>> +
>> +Please run the kernel's ./scripts/checkpatch.pl on new patches
>
> This is a bit of a problem for kvm-unit-tests code which still has a mix
> of styles since it was originally written with a strange tab and space
> mixed style. If somebody is patching one of those files we've usually
> tried to maintain the original style rather than reformat the whole
> thing (in hindsight maybe we should have just reformatted). We're also
> more flexible with line length than Linux, although Linux now only warns
> for anything over 80 as long as it's under 100, which is probably good
> enough for us too. Anyway, let's see what Paolo and Thomas say. Personally
> I wouldn't mind adding this line to the documentation, so I'll ack it.
> Anyway, we can also ignore our own advise when it suits us :-)
>
> Acked-by: Andrew Jones <drjones@redhat.com>

I can make the wording more weaselly:

 We strive to follow the Linux kernels coding style so it's recommended
 to run the kernel's ./scripts/checkpatch.pl on new patches.

I added this reference because on the older iterations of these test
divergence from the kernel coding style was pointed out and I've fixed
them in this iteration.

>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
