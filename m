Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y6sm2262008wrw.60.2019.05.09.13.38.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 13:38:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7EFE11FF87;
	Thu,  9 May 2019 21:38:09 +0100 (BST)
References: <20190509165912.10512-1-alex.bennee@linaro.org> <20190509165912.10512-23-alex.bennee@linaro.org> <2dcd2689-ca10-b014-e7f0-1967f4901fe2@redhat.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>, "open list\:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH v1 22/23] tests/qemu-iotests: re-format output to for make check-block
In-reply-to: <2dcd2689-ca10-b014-e7f0-1967f4901fe2@redhat.com>
Date: Thu, 09 May 2019 21:38:09 +0100
Message-ID: <87r2974b4e.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CC3VSCccStCN


Max Reitz <mreitz@redhat.com> writes:

> On 09.05.19 18:59, Alex Benn=C3=A9e wrote:
>> This attempts to clean-up the output to better match the output of the
>> rest of the QEMU check system. This includes:
>>
>>   - formatting as "  TEST    iotest: nnn"
>>   - calculating time diff at the end
>>   - only dumping config on failure
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
>> ---
>>  tests/qemu-iotests/check | 101 +++++++++++++++++++++++----------------
>>  1 file changed, 61 insertions(+), 40 deletions(-)
>
> Hm, this makes every iotest print two lines:
>
> $ ./check -T -qcow2
> [...]
> 001 [20:06:27] -> [20:06:27]
> 001 0s (last 1s)

Yes - it was a compromise to ensure we printed a start and end
timestamp but I guess we can fix it up with a bit more shell ugliness:

--8<---------------cut here---------------start------------->8---

Subject: [PATCH] fixup! tests/qemu-iotests: re-format output to for make
 check-block

---
 tests/qemu-iotests/check | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index fb239967a32..9f083f06b46 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -726,7 +726,11 @@ _report_test_result()
     if $pretty; then
         echo "  TEST    iotest: $1 $2"
     else
-        echo "$1 $2"
+        if $timestamp; then
+            echo " $2"
+        else
+            echo "$1 $2"
+        fi
     fi
 }

@@ -793,7 +797,7 @@ do
                     $run_command >$tmp.out 2>&1)
         fi
         sts=3D$?
-        $timestamp && echo " [$(date "+%T")]"
+        $timestamp && echo -n " [$(date "+%T")]"
         stop=3D$(_wallclock)

         if [ -f core ]
--8<---------------cut here---------------end--------------->8---

--
Alex Benn=C3=A9e
