Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C9606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ku4hnXpj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJdGe-0007hk-L0; Wed, 21 Oct 2026 16:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJdGW-0007cp-Lr
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 16:50:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJdGU-0007QD-A0
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 16:50:28 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso9668775e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792615825; x=1793220625; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=X2CxcxJSRvKESmBbEKcO55HDwInTaJ4oWVM+mXsHScg=;
 b=ku4hnXpj4D5+6PcVX4qdxXJ+Ee1KBDXY9rspKE5qwk2sMCBm+uFm3TeCrrW3eOIgjU
 wy7JE8jOWHOm1TItAT63nhslIQtaYEmLwx8xz2nFiDL2XvIcy8bqINHTvC+sybeGiuws
 4DXMyAbJ2lCXw3VY7QLCGiQ+TroPrBd+2dSumrQitu+6uIM7AKMhGSrhNjbyg09EGmE0
 +Mq4XNQN4gm8e6HFJ9RblWe/qknhoR9FOvDd/2fBO1VS9dFA6Te8GHWFwEyvc3JJeq1P
 98oRGbBwGIqozHLIU6rP7qfnmJF0K5EpoinrHI07xSKP4H/4hFoeLtvR+i8Oqg/Xj6U5
 DYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792615825; x=1793220625;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X2CxcxJSRvKESmBbEKcO55HDwInTaJ4oWVM+mXsHScg=;
 b=LtVAQM6oNUrK4a0rDDL7ux/IupTGZZJcbuBhSmK+bCQqfEJaOtsSeWy4o5q5bSt7JK
 cs3xSTGczROFq53ZOF9HpmPqMrs8nYRXXlmyrGGiIfFEOy4OVHQOAPjXKTDySOnBBoKE
 tvGuqcJZGzDitvOn8aQeT2tLScXv5e8JBzP33WNA3jvA2DyBhpiWaCBGzc4KZZ1YUegj
 BjsDQAmEWdIGrncXO3p5GY/FMe7p5dtyMbxfVebBW63x8shv8uF4igTvj456QburrdLX
 NnPDhS/8oWm1vyJ2AW2tzZvUzfxC8sXQmLLXzoRFvyP3tt6PZHai6zLHpIB9eCz4rXOV
 NULA==
X-Forwarded-Encrypted: i=1;
 AKwUvBynWqY/pZc7Jo8d5fmCZNzu/xeRrlZTIyRoWCR274+44pa/Gvs2FDC04I9CV+F1/wfN9FmM8j7z9A==@nongnu.org
X-Gm-Message-State: AFq9FYIDsG/Btw1A0kOFlyW6XaZDiUlpDnFJgaDWI5/cvCQp3cATmknS
 bPZratdB4fnnl8oe201uEmk128rxRmH9XJg0HsKgA2sdNPW2hSQj5NTTB8VDOrnnhAM=
X-Gm-Gg: AYBFou12fJBvdvHPFS/7q+Ihr4rO+3M/GdSNUYYve/n0D1WRv6DgdLTZskHLSVjJNbY
 2S8wXJOZJ13hTwwyS/9/Mrimqjx1a1DYrf3c8pyU2aFgHbyd6BQNqXH8+aWtfNd4ZrzwHmkCjh8
 FOsTlhZej6FuDlUSzjgU3WlgGcHRWPsbXRgLLgnnkoFUp/QmbpnUv5SOa9wwfX3SaccXHk53deD
 NyFzJA3/Z0lCkZ5M2XvD9h0SgJKYXuiEWrHBaOrdN56NO9cjPfo/rL5V43JVkogXYHguQUxNDTl
 PMv4fARS6FuEc8HsoyR/cnLyCS2TV48SypKDfT+uB4Q8bE68E+Kc5n/9YrQYpGysleRS/7Hnega
 YRK+E5uMMm8rwOkN6T2cHDeMJfBc8fX9hpxtMfWJEKTSai6uswhSb+CV8H1oB79A6M9ujpW5arW
 sx7INV1GOoKJRoWUgq5zv7l7R05GmPAaz1rtn7gjSu+5Tx7PhSX0+oXkrcILeBt8Irz7Q99Pw1A
 EztiGyOVcz0n3K2bZ6lMvQ2lPipc8TdwU6oNPdn8pWHm28YwVbCAj0=
X-Received: by 2002:a05:600c:6304:b0:4a1:f377:5c68 with SMTP id
 5b1f17b1804b1-4a1fdd46423mr64987775e9.34.1792615824593; 
 Wed, 21 Oct 2026 13:50:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2038ddb20sm17473515e9.0.2026.10.21.13.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:50:23 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E7B235F7FA;
 Wed, 21 Oct 2026 21:50:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Cornelia Huck <cohuck@redhat.com>,  Thomas Huth
 <th.huth+qemu@posteo.eu>,  Paolo Bonzini <pbonzini@redhat.com>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Kyle Evans <kevans@freebsd.org>,  Keith
 Busch <kbusch@kernel.org>,  Matthew Rosato <mjrosato@linux.ibm.com>,  Eric
 Farman <farman@linux.ibm.com>,  Zhao Liu <zhao1.liu@intel.com>,  Ani Sinha
 <anisinha@redhat.com>,  Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org,  Song Gao <gaosong@loongson.cn>,  Peter Maydell
 <peter.maydell@linaro.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier
 <laurent@vivier.eu>,  qemu-s390x@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Brad Smith <brad@comstyle.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Yoshinori Sato
 <yoshinori.sato@nifty.com>,  Klaus Jensen <its@irrelevant.dk>,  John Snow
 <jsnow@redhat.com>
Subject: Re: [PATCH v3 12/19] tests/functional: teach tuxrun about launching
 gdb tests
In-Reply-To: <41147e0a-c8a2-4060-903e-695e3977c8cd@linux.ibm.com> (Ilya
 Leoshkevich's message of "Wed, 21 Oct 2026 22:17:01 +0200")
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
 <20261019192704.3220373-13-alex.bennee@linaro.org>
 <41147e0a-c8a2-4060-903e-695e3977c8cd@linux.ibm.com>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Wed, 21 Oct 2026 21:50:22 +0100
Message-ID: <87h5iezskx.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On 10/19/26 21:26, Alex Benn=C3=A9e wrote:
>> This resurrects the hand run test script from d84842be6c5 (tests:
>> remove test-gdbstub.py) and modernises it to use the shared test
>> infrastructure for run-test.
>> We then tweak the common tuxrun code to over an alternative "launch
>> via gdbstub" helper which reuses the existing code but:
>>    - needs a vmlinux with symbols
>>    - drops kaslr because it doesn't play nice with symbols
>>    - extend qargs with stuff normally added by vm.launch
>>    - passes kargs directly
>>    - runs with the gdb run-test script
>>    - log the run-test output to the console log
>>    - makes --binary not mandatory
>> Message-ID: <20260930164649.433573-13-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v3
>>    - mention the nokaslr in the commit message
>>    - add a comment about it to the shared kernel args
>>    - drop unused failcount
>>    - remove stale comment about hbreak
>>    - always delete the watch point pass or fail
>>    - fix unbalanced tuple in sh4's direct call of fetch_tuxrun_assets
>>    - simplify the symbol to watchpoint logic
>>    - drop the mandatory --binary
>>    - make the command copy and paste friendly
>> v2
>>    - add self.vm._machine to qargs
>>    - drop leading spaces in print () calls
>>    - add register read tests
>>    - use gdb.Breakpoint for hwbreak as for swbreak
>>    - drop flaky symbol evaluation, verify hit_count instead
>>    - explicit gdb.BP_BREAKPOINT for CatchBreakpoint
>> ---
>>   .../functional/gdb-scripts/kernel_gdb_test.py | 162 ++++++++++++++++++
>>   tests/functional/qemu_test/tuxruntest.py      |  97 ++++++++++-
>>   tests/functional/sh4/test_tuxrun.py           |   4 +-
>>   tests/guest-debug/run-test.py                 |  14 +-
>>   4 files changed, 261 insertions(+), 16 deletions(-)
>>   create mode 100644 tests/functional/gdb-scripts/kernel_gdb_test.py
>
> [...]
>
>> @@ -132,10 +144,77 @@ def common_tuxrun(self,
>>           special with the command line we can process most things using
>>           the tag metadata.
>>           """
>> -        (kernel, disk, dtb) =3D self.fetch_tuxrun_assets(kernel_asset, =
rootfs_asset,
>> -                                                       dtb_asset)
>> +        (kernel, disk, dtb, _) =3D self.fetch_tuxrun_assets(kernel_asse=
t,
>> +                                                          rootfs_asset,
>> +                                                          dtb_asset)
>>             self.prepare_run(accel, kernel, disk, drive, dtb,
>> console_index)
>>           self.vm.launch()
>>           self.run_tuxtest_tests(haltmsg)
>>           os.remove(disk)
>> +
>> +    def common_tuxrun_gdb(self,
>> +                          kernel_asset,
>> +                          vmlinux_asset,
>> +                          rootfs_asset,
>> +                          accel=3DNone,
>> +                          dtb_asset=3DNone,
>> +                          drive=3D"virtio-blk-device",
>> +                          haltmsg=3D"reboot: System halted",
>> +                          console_index=3D0):
>> +        """
>> +        Common path for LKFT tests under gdb. Unlike the common_tuxrun
>> +        function we need to launch with the gdb test script and deal
>> +        with munging the arguments for that especially.
>> +        """
>> +        (kernel, disk, dtb, vmlinux) =3D self.fetch_tuxrun_assets(kerne=
l_asset,
>> +                                                                rootfs_=
asset,
>> +                                                                dtb_ass=
et,
>> +                                                                vmlinux=
_asset)
>> +
>> +        gdb_path =3D os.getenv("QEMU_TEST_GDB")
>
> By the way, there is a minor usability issue: if I set QEMU_TEST_GDB to
> a non-existent binary, the test hangs instead of exiting with an error
> message.

I can add a guard - but in normal invocation meson should take care only
to pass the env variable if configure detects gdb.

>
>> +        run_script =3D self.data_file('..', 'guest-debug','run-test.py')
>> +        test_script =3D self.data_file('gdb-scripts', 'kernel_gdb_test.=
py')
>> +
>> +        # Instead of launching QEMU via the functional test machinery
>> +        # we need to launch it with the gdb run script. We utilise the
>> +        # existing prepare_run machinery to build the command line but
>> +        # we pass the kernel args separately to avoid horrible string
>> +        # escaping.
>> +
>> +        self.prepare_run(accel, kernel, disk, drive, dtb,
>> +                         console_index, append =3D False)
>> +
>> +        # the functional test machinery adds more stuff for handling
>> +        # console redirection which we need to do manually.
>> +
>> +        qargs =3D self.vm.args
>> +        qargs.extend(["-display", "none", "-serial", "stdio"])
>> +
>> +        # and the machine type
>> +        if self.vm._machine is not None:
>> +            qargs.extend(["-machine", self.vm._machine])
>> +
>> +        cmd =3D [
>> +            str(run_script),
>> +            "--qemu", self.qemu_bin,
>> +            "--qargs", " ".join(qargs),
>> +            "--kargs", self.kcmd_line,
>> +            "--symbols", str(vmlinux),
>> +            "--test", str(test_script),
>> +            "--gdb", gdb_path,
>> +        ]
>> +
>> +        log_cmd =3D " ".join(f'"{arg}"' if ' ' in arg else arg for arg =
in cmd)
>> +        self.log.info(f"run-test: {log_cmd}")
>> +
>> +        res =3D subprocess.run(cmd, text=3DTrue,
>> +                             stdout=3Dsubprocess.PIPE,
>> +                             stderr=3Dsubprocess.STDOUT)
>
> [...]

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

