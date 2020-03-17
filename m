Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x24sm3160071wmc.36.2020.03.17.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 02:46:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D9A141FF7E;
	Tue, 17 Mar 2020 09:46:08 +0000 (GMT)
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-22-alex.bennee@linaro.org>
 <CAFEAcA-x5L8=csd5tYYEwTaE2wb-8d9qcbaF3A9G2bC0vOOhhg@mail.gmail.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 21/28] configure: allow user to specify what gdb to use
In-reply-to: <CAFEAcA-x5L8=csd5tYYEwTaE2wb-8d9qcbaF3A9G2bC0vOOhhg@mail.gmail.com>
Date: Tue, 17 Mar 2020 09:46:08 +0000
Message-ID: <87r1xrjov3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AYBGZItMKZeD


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 16 Mar 2020 at 18:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This is useful, especially when testing relatively new gdbstub
>> features that might not be in distro packages yet.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  configure | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/configure b/configure
>> index eb49bb6680c..6724158fde1 100755
>> --- a/configure
>> +++ b/configure
>> @@ -303,6 +303,7 @@ libs_qga=3D""
>>  debug_info=3D"yes"
>>  stack_protector=3D""
>>  use_containers=3D"yes"
>> +gdb_bin=3D$(command -v "gdb")
>>
>>  if test -e "$source_path/.git"
>>  then
>> @@ -1588,6 +1589,8 @@ for opt do
>>    ;;
>>    --disable-fuzzing) fuzzing=3Dno
>>    ;;
>> +  --with-gdb=3D*) gdb_bin=3D"$optarg"
>> +  ;;
>>    *)
>>        echo "ERROR: unknown option $opt"
>>        echo "Try '$0 --help' for more information"
>> @@ -1773,6 +1776,7 @@ Advanced options (experts only):
>>    --enable-plugins
>>                             enable plugins via shared library loading
>>    --disable-containers     don't use containers for cross-building
>> +  --with-gdb=3DGBB-path      gdb to use for gdbstub tests [$gdb_bin]
>
> s/GBB/GDB/. (Also, the only other program we pass to configure
> with "--with-foo=3D" is git; for make, install, python, sphinx-build,
> smbd, iasl, cc, gcov we just use "--foo=3D".)

Alright I'll fix that up in the PR.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
