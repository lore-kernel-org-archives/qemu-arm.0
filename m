Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD187CCA471
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 09:58:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5hzC-0006mX-Ap; Mon, 06 Oct 2025 05:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v5hzA-0006lx-SD
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 05:58:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v5hz9-0003wm-4z
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 05:58:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so42575415e9.0
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759744704; x=1760349504; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZR3WzlMYsu4GBFnnNWN4ERINGpFEhaJ68AUmhmXx2s=;
 b=q8iDxPm53lbvSKvMy/bGvWsPdEHPoK1ywzzbw8im1woyjdGd10TZdhqOjBVIrOETp0
 Df/6rCPPJtGeUXzbEGrVs4tklwDE1B2I3XIWMEmOAiSpTW+zLrvmR78iWSIf8S2ZCbbH
 R/Dt0lyaZuGM2kfNEJg5PLZteILvdY28EMoutItteA75qkFiaB8YJ6F/Tfs12JoTZIEu
 dRhqY1YGc8kxdWYKxxeYARFVDOUnrD0euG5j0bNXnNcPJo9oh8Mlwd8YvEYQOxWCGGds
 jmEpyaPGwB6zV0tin0qN3hTt9omanc/rH3LtIaNBjknq5xzSuEOBoRHdJQOeTF8Bf+va
 Lt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759744704; x=1760349504;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wZR3WzlMYsu4GBFnnNWN4ERINGpFEhaJ68AUmhmXx2s=;
 b=rPCpe3OW3UAJD1ijMl0AXzsFO0J6F3IDqHE3AJIma173k7zShHjhU1EyYW9q9Zjluw
 0OHyl99USOUmaPqDtiigPy6qHmi0GAeHEnfLFMfvRYSGdVNYDAZqGQQcuw4G/A1sF9cY
 jzBl1xA7+WkfHdXcL6sf7GQvKroDB8TKWuDDAnCK1vFks+L1Z9gFKqsGdai8wHAOxuIV
 qrARgCzrM/KWLLbWLHmaIvAXmBWryKWdP9YrlUmGBE16RmOtIEHJa0JN37/2Bu11hGxY
 lIG9+YXCAgF4iQmjEjSRb0UhNGUSzJ/66gtGJW1FeOtQbd1PSC2F9p8YSz51rBzp4RRx
 Cb1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvsmTCuzdrPUC7/AtLrwfeAPxsLVAbjWA0+5hl2634llqLz23uHbItvzidIDCZ278XU/OP8BrWbA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9EQk5XUUMsTNgCj1vpjncjvTZ0CGBR0hC3MjZneqO4mGZN1KE
 fmcgJjJl6N+oVUDSzaga31HbHn6SBeWhD8hbilO3aDmdQD8hllJ8WwmRIpVy4pm6BE0=
X-Gm-Gg: ASbGncv9zUzEG0JQ+KTuSz1J6UNDnBWEdP7GniBxVybRTW0EVQkSNo/XH24RjDXCsvS
 kcSR7V3QyGvqM/xJIgJfLRuA50uRu9sCW43EodREknX51hpijSQD762untjE3OJ0mYh1lfYMPsd
 oN3fAvoZCcquwn7ZCspbEMzK/fNaTWVUuca6BuTpU+6waRRL1b4oaRsxMU4bFqLwxJTsbIxbbZP
 L7QApVOu7JKAXLe7RdwZMzSNTrvwPRKL8XuxwadaeokbC/btstpiGbdQ7492OoExsKrfG/ipqJe
 tYrLEP7kqD6Jx6Nnex6OAjYhD5KBeL3XhLMKKqKnqQqrC4Du4B2pPtt50AYfRohYl2aZ98bo8WY
 L4RO7hsneF2/325tA7efMZIBSnWgNiFv4V8d3XB4hO8wMj4/dhs8=
X-Google-Smtp-Source: AGHT+IFYB7x9nvRASZ87aS+X0TVeI+RwUx2z4BrnZ3RzIZcXeSjdy0S+FtutENOHE/SljKdp7OMHzw==
X-Received: by 2002:a05:600c:3d90:b0:46e:43ee:3809 with SMTP id
 5b1f17b1804b1-46e71111cbdmr73987565e9.7.1759744704328; 
 Mon, 06 Oct 2025 02:58:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723593d8sm165893285e9.11.2025.10.06.02.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 02:58:23 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7BBBC5F845;
 Mon, 06 Oct 2025 10:58:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
 berrange@redhat.com,  qemu-arm@nongnu.org
Subject: Re: [PATCH v5 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
In-Reply-To: <b5b739a9-28ef-4d0c-b82b-878e9aee103c@redhat.com> (Thomas Huth's
 message of "Mon, 6 Oct 2025 09:24:57 +0200")
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <b5cb30d8-65a2-4bf7-b66f-5bfe61e19835@redhat.com>
 <8fb3351e-f1a1-4a1e-9650-33f0d4ee6d44@redhat.com>
 <bb7801f1-67d3-47d7-b5bd-39b1113ea9e0@linaro.org>
 <8d89f02e-9e5b-4cdd-9a54-d55bea8967bc@linaro.org>
 <30fec60e-b0e8-408c-b577-e4875d8bb133@linaro.org>
 <b5b739a9-28ef-4d0c-b82b-878e9aee103c@redhat.com>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Mon, 06 Oct 2025 10:58:22 +0100
Message-ID: <87qzvg1hdt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

>  Hi Gustavo!
>
> On 03/10/2025 17.07, Gustavo Romero wrote:
>> Hi Thomas,
>> On 10/3/25 11:38, Gustavo Romero wrote:
>>> Hi Thomas,
>>>
>>> On 10/3/25 10:30, Gustavo Romero wrote:
>>>> Hi Thomas,
>>>>
>>>> On 10/2/25 14:52, Thomas Huth wrote:
>>>>> On 02/10/2025 18.53, Thomas Huth wrote:
>>>>>> On 02/10/2025 04.04, Gustavo Romero wrote:
>>>>>>> The goal of this series is to remove Avocado as a dependency for ru=
nning
>>>>>>> the reverse_debugging functional test.
>>>>>>>
>>>>>>> After several rounds of discussions about v1 and v2, and experiments
>>>>>>> done by Daniel and Thomas (thanks for all the experiments and comme=
nts
>>>>>>> so far), I've taken a new approach and moved away from using a runn=
er
>>>>>>> for GDB. The changes, I believe, are much simpler now.
>>>>>>
>>>>>> =C2=A0=C2=A0Hi Gustavo,
>>>>>>
>>>>>> unfortunately, this still seems to be broken on Fedora. After
>>>>>> applying your series, I get:
>>>>>>
>>>>>> stderr:
>>>>>> Traceback (most recent call last):
>>>>>> =C2=A0=C2=A0 File
>>>>>> "/home/thuth/devel/qemu/tests/functional/reverse_debugging.py",
>>>>>> line 100, in reverse_debugging
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 self.reverse_debugging_run(vm, port, gdb_ar=
ch, last_icount)
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^
>>>>>> =C2=A0=C2=A0 File "/usr/lib64/python3.13/unittest/case.py", line 156=
, in
>>>>>> skip_wrapper
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 raise SkipTest(reason)
>>>>>> unittest.case.SkipTest: Missing env var(s): QEMU_TEST_GDB
>>>>>
>>>>> Looks like it's required to explicitly use the --gdb=3D...
>>>>> parameter of configure to make it work, and it does not work
>>>>> without that paramter? Could you please have a look whether it
>>>>> works without --gdb with the auto-detected gdb for you?
> ...
>> I've just tried it on Fedora 42 and GDB is correctly detected:
>> $ ../configure --target-list=3Daarch64-softmmu --disable-docs
>> $ make -j check-functional-aarch64
>
> I just tried it again, and it just seems to be broken in my build
> folder where I do incremental builds. It works when I build QEMU in a
> new folder from scratch - quite weird.
>
>> I have installed:
>> gromero@gromero13:~/git/qemu/build$ dnf info gdb
>> Updating and loading repositories:
>> Repositories loaded.
>> Installed packages
>> Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=
 gdb
>> Epoch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0
>> Version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16.3
>> Release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 1.fc42
>> Architecture=C2=A0=C2=A0=C2=A0 : x86_64
>> Installed size=C2=A0 : 455.3 KiB
>> Source=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : gdb-16.3-=
1.fc42.src.rpm
>
> I've got the very same package installed here.
>
>>> Are you sure GDB is installed in your test env?
>>>
>>> Do mind checking if:
>>>
>>> gromero@gromero0:/mnt/git/qemu_$ gdb_bin=3D$(command -v
>>> "gdb-multiarch" || command -v "gdb")
>>> gromero@gromero0:/mnt/git/qemu_$ echo $gdb_bin
>>> /usr/bin/gdb
>>>
>>> works in your env and if QEMU_TEST_GDB is in:
>>>
>>> $ ./pyvenv/bin/meson test=C2=A0 --verbose --no-rebuild -t 1 --setup
>>> thorough  --suite func-thorough=C2=A0 func-aarch64-reverse_debug
>>>
>>> output?
>
> $ echo $gdb_bin
> /usr/bin/gdb
>
>  Thomas

Do you want me to drop the series until we figure out whats going on?

FWIW it works fine in my "all" build directory and I incrementally build
it all the time.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

