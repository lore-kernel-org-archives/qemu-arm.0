Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o7sm14162617wmc.36.2019.07.15.04.08.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 04:08:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3C9681FF87;
	Mon, 15 Jul 2019 12:08:11 +0100 (BST)
References: <20190712111849.9006-1-alex.bennee@linaro.org> <20190712111849.9006-2-alex.bennee@linaro.org> <189b17fc-fdba-5ccc-d018-6fbd27c6babd@redhat.com>
User-agent: mu4e 1.3.3; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v1 1/7] tests/docker: add test-misc for building tools & docs
In-reply-to: <189b17fc-fdba-5ccc-d018-6fbd27c6babd@redhat.com>
Date: Mon, 15 Jul 2019 12:08:11 +0100
Message-ID: <87o91vv9lw.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8MytpJUxkN5s


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/12/19 1:18 PM, Alex Benn=C3=A9e wrote:
>> Add yet another test type so we cna quickly exercise the miscellaneous
>
> "cna" -> "can"
>
>> build products of the build system under various docer configurations.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/test-misc | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100755 tests/docker/test-misc
>>
>> diff --git a/tests/docker/test-misc b/tests/docker/test-misc
>> new file mode 100755
>> index 00000000000..d480afedca7
>> --- /dev/null
>> +++ b/tests/docker/test-misc
>> @@ -0,0 +1,22 @@
>> +#!/bin/bash -e
>> +#
>> +# Build the miscellaneous components
>> +#
>> +# Copyright (c) 2019 Linaro Ltd.
>> +#
>> +# Authors:
>> +#  Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +. common.rc
>> +
>> +cd "$BUILD_DIR"
>> +
>> +# build everything else but QEMU
>> +configure_qemu --disable-user --disable-system --enable-docs --enable-t=
ools
>> +build_qemu
>> +install_qemu
>>
>
> I got:
>
> $ make docker-test-misc@debian-win32-cross
>   BUILD   debian9
>   GEN
> /home/phil/source/qemu/docker-src.2019-07-13-17.03.48.3829/qemu.tar
>   BUILD   debian9-mxe
> usage: git archive [<options>] <tree-ish> [<path>...]
>    or: git archive --list
>    or: git archive --remote <repo> [--exec <cmd>] [<options>] <tree-ish>
> [<path>...]
>    or: git archive --remote <repo> [--exec <cmd>] --list
>
>     --format <fmt>        archive format
>     --prefix <prefix>     prepend prefix to each pathname in the archive
>     -o, --output <file>   write the archive to this file
>     --worktree-attributes
>                           read .gitattributes in working directory
>     -v, --verbose         report archived files on stderr
>     -0                    store only
>     -1                    compress faster
>     -9                    compress better
>
>     -l, --list            list supported archive formats
>
>     --remote <repo>       retrieve the archive from remote repository <re=
po>
>     --exec <command>      path to the remote git-upload-archive command
>
> failed to archive qemu
> make[1]: *** [tests/docker/Makefile.include:31:
> qemu/docker-src.2019-07-13-17.03.48.3829] Error 1

Hmm I haven't been able to get this... does it depend on having
uncommited changes in a subproject?

>
> And remembered some script/archive patch on the list:
> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg02073.html

I'll look at snarfing that.

>
> With it amended this works correctly, so:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


--
Alex Benn=C3=A9e
