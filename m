Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w2sm5104176wru.16.2019.05.27.09.20.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 09:20:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 817871FF87;
	Mon, 27 May 2019 17:20:09 +0100 (BST)
References: <20190523102532.10486-1-alex.bennee@linaro.org> <20190523102532.10486-28-alex.bennee@linaro.org> <18f8fad1-5dac-eb5b-f531-da3b2124ec35@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "open list\:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 27/28] tests/qemu-iotests: re-format output to for make check-block
In-reply-to: <18f8fad1-5dac-eb5b-f531-da3b2124ec35@redhat.com>
Date: Mon, 27 May 2019 17:20:09 +0100
Message-ID: <87imtvrhs6.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QWJyyGU2YkVK


Max Reitz <mreitz@redhat.com> writes:

> On 23.05.19 12:25, Alex Benn=C3=A9e wrote:
>> This attempts to clean-up the output to better match the output of the
>> rest of the QEMU check system when called with -makecheck. This includes:
>>
>>   - formatting as "  TEST    iotest-FMT: nnn"
>>   - only dumping config on failure (when -makecheck enabled)
>>
>> The non-make check output has been cleaned up as well:
>>
>>   - line re-displayed (\r) at the end
>>   - fancy colours for pass/fail/skip
>>   - timestamps always printed (option removed)
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>>
>> ---
>> v3
>>   - revert echo to printf
>>   - add _report_test_start
>> v4
>>   - -pretty -> -makecheck
>>   - keep all output together for makecheck
>> v5
>>   - merged in kwolf's pretty printing
>>   - timestamps always printed in non-makecheck mode
>> ---
>>  tests/qemu-iotests/check | 179 +++++++++++++++++++++++++--------------
>>  1 file changed, 116 insertions(+), 63 deletions(-)
>
> Unless I missed something, this breaks ./check:
>
> $ ./check -T -qcow2
> 000 - unknown test, ignored

Because -T has been dropped (timestamps are always shown). Of course
removing from the opts passing falls through. Should I just do:

modified   tests/qemu-iotests/check
@@ -433,6 +433,11 @@ testlist options
             cachemode=3Dtrue
             xpand=3Dfalse
             ;;
+        -T)
+            echo "-T no longer needed"
+            exit -1
+            ;;
+
         -v)
             verbose=3Dtrue


> QEMU          -- "build/x86_64-softmmu/qemu-system-x86_64" -nodefaults
> -machine accel=3Dqtest
> QEMU_IMG      -- "build/qemu-img"
> QEMU_IO       -- "build/qemu-io"  --cache writeback -f qcow2
> QEMU_NBD      -- "build/qemu-nbd"
> IMGFMT        -- qcow2 (compat=3D1.1)
> IMGPROTO      -- file
> PLATFORM      -- Linux/x86_64 dresden 5.0.14-300.fc30.x86_64
> TEST_DIR      -- build/tests/qemu-iotests/scratch
> SOCKET_SCM_HELPER -- build/tests/qemu-iotests/socket_scm_helper
>
> Passed all 0 tests
>
>
> Max


--
Alex Benn=C3=A9e
