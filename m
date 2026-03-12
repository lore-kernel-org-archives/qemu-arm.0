Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC82106705A
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 15:55:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0iNy-0000cI-1B; Thu, 12 Mar 2026 11:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w0iNw-0000c1-GN
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 11:55:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w0iNu-0003tz-ES
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 11:55:40 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso11168235e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773330936; x=1773935736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yu2Tsft2mJAvNjMtOHPfNwzbs+QKUG6xukc3vRcW1U=;
 b=ji6l5W8HfmFyCzsDPr3sJOVjCgkeDR4LmZtfpWzi+PD+HjmNtphTYRQhgmXzevkttY
 OA7N2/vtuXCyLOyDh9r7ALrcuWrsAdr+p8MJymTPnlTLjpe2Q8M+Sy/EORF8xQp52ARU
 PItpocTPqzcJ2eTO6fS5wHJo2dpOyaNxmGUGpL+LLwhm0ZDQCcXgb708U4oYHCDXsfEZ
 in6n0+TStHRHhTbckfGhMcnHF1jTXw/za2D+s3kKumBpAodLwc1CtvKCKFexhBl0zFJC
 Rd81zJa+Zs5tndV+wiCKeqDo/iM6iGCqrjVCpR0P6oFIA9ZXUMIQAzLUId4DA6QShtFS
 WMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773330936; x=1773935736;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1yu2Tsft2mJAvNjMtOHPfNwzbs+QKUG6xukc3vRcW1U=;
 b=EUGsSGaXameQFlYGq4uDQCUNWppvuomxlWE+QZglEs51QTJ5x/6wEyOIzWyo3zykxX
 nV1qTeXgaCyMfmxIkSQHbg9zTy1fRK7XLSRLqT0LWCmC1BQiEPbbO4eqU3svJQMRSdfD
 KdAIdi4CisySkiDRpI2S1zPHbj+GsjKkWfA7bxpV4Oes/S+v8MPyGhyVrr3Sifjc12Di
 6+4JHK4PI3CuXdxGB/hlA9ASLWxf1bpDFCNdPYoqtvNLyc/fxz+5HvgQwK5fxZNGrNR+
 P2Lea9aFc7ckAAoiK0QxqZC3a7ZMRZA4RMAnj1rGRx/ROUqsYdwyHfyo+/Bp5kElCtar
 nQSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt/AAOyNABi1PYV1p+M5KIy2KADf0b0bBVFjttucRVGmTQmOwAsvNmwVe0E5Wy1HE+slPddug5sg==@nongnu.org
X-Gm-Message-State: AOJu0YwrLPxZpwMENpke97SRBreT/xZKMTnJJ5ePK18XT3Iimz9GYazE
 cag1HjjS9wtGehPOWGYG2BwQnZsv8n0BMjrA+COGZIOgKAz8a/VvqeTA0nzDCa7Ai1A=
X-Gm-Gg: ATEYQzwXaEtLdUMhVhoGXwYKUQVwkDfJtD6HPNOllbmgP7Xet2McjoXc3pVdi9auOSw
 A19D/UiG/T2DX6nMeYbZBwKSqs78w6FkjPZIVPJfDw6U7NdSsMSZnwgtMdVGY3OOWE6DDzWcgaZ
 9vrmm76D6Wa0osL6Qb8aRRUitmBNbU7IgiDv3OGQwfJj39L92Lyp4HmCjBbRjdKLb1629FGTYNx
 WUTAq+CiH9XrHmQBIcgsL/sM1GcYPCg7amwyKoGHduucThIy8c4llLmZ6KAMwsjnFKmQQd97BiV
 zIOb6wmT1Votb6v8bYSxwydi74TNW6vuMftI+v8jX8IQ4Y+EuY8MJLGpdNjzJBxNQJCuqee2J8I
 nFeC8rpRcp8C/KC+myqLZfeOm/Bjm9T6YhI5j6da0nMKzm2IrPzAaysvx/jLcItOHz16SkcM6P5
 h2FFnRqfZ4l8N6JKQAtV6rpr1nLSRhFj1tAg==
X-Received: by 2002:a05:600c:8b02:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-4854b0ac45dmr121084115e9.5.1773330936071; 
 Thu, 12 Mar 2026 08:55:36 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm137425225e9.4.2026.03.12.08.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 08:55:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9B8AE5F7A0;
 Thu, 12 Mar 2026 15:55:34 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Pierrick
 Bouvier <pierrick.bouvier@linaro.org>,  qemu-devel@nongnu.org,  Brad Smith
 <brad@comstyle.com>,  qemu-arm@nongnu.org,  Kyle Evans
 <kevans@freebsd.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
In-Reply-To: <94e17bd5-e864-45eb-878b-2296d6188271@linux.ibm.com> (Ilya
 Leoshkevich's message of "Thu, 12 Mar 2026 16:12:04 +0100")
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
 <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
 <7e6cdb4b-4cb8-4968-acce-56db2f0ee307@linaro.org>
 <97506340-18a4-4691-8017-110ab2fc76b8@linaro.org>
 <3c2bf09d-245c-4de7-b55d-37085ef24545@linaro.org>
 <c776bbc1-6021-45d0-a5ca-74e50d906f4f@linux.ibm.com>
 <1493fdd5-5254-4398-bb69-8c83eee8bef2@linaro.org>
 <CAPMQPEKPk1iySmCt0_Vi1=bcaG_ZkNfzYknCu14zzR2N7p-6zw@mail.gmail.com>
 <871phpi22y.fsf@draig.linaro.org>
 <94e17bd5-e864-45eb-878b-2296d6188271@linux.ibm.com>
User-Agent: mu4e 1.14.0-pre2; emacs 30.1
Date: Thu, 12 Mar 2026 15:55:34 +0000
Message-ID: <87v7f1ghzd.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On 3/12/26 14:56, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>
>>> On Thu, 12 Mar 2026 at 11:39, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
>>>> On 12/3/26 11:11, Ilya Leoshkevich wrote:
>>>>> On 3/11/26 00:28, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> On 11/3/26 00:22, Pierrick Bouvier wrote:
>>>>>>> On 3/10/26 4:07 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>>> On 10/3/26 23:33, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>>>> On 6/3/26 17:17, Alex Benn=C3=A9e wrote:
>>>>>>>>>> This allows the gdb integration tests to be run as well.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>>     tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
>>>>>>>>>>     tests/lcitool/refresh                                 | 1 +
>>>>>>>>>>     2 files changed, 2 insertions(+)
>>>>>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>>>>>>> I'm getting:
>>>>>>>>
>>>>>>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>>>>>>> address 0x45001fff
>>>>>>>> Error occurred in Python: Cannot access memory at address 0x45001f=
ff
>>>>>>>> qemu-hppa: QEMU: Terminated via GDBstub
>>>>>>>> make[1]: ***
>>>>>>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>>>>>>> run-gdbstub-prot-none] Error 1
>>>>>>>> make[1]: *** Waiting for unfinished jobs....
>>>>>>>> qemu-hppa: QEMU: Terminated via GDBstub
>>>>>>>> warning: Could not load shared library symbols for linux-vdso32.so=
.1.
>>>>>>>> Do you need "set solib-search-path" or "set sysroot"?
>>>>>>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>>>>>>> run-tcg-tests-hppa-linux-user] Error 2
>>>>>>>>
>>>>>>> To add more information, we tested it on GitHub, our machines and
>>>>>>> GitLab, and for an unknown reason, it only fails on GitLab runners.
>>>>>> Also we tested on our local Linux machines, where this test pass
>>>>>> for all our targets ;)
>>>>>>
>>>>>>> Which is unfortunate since it is where QEMU run its CI.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Pierrick
>>>>> FWIW it passes on my laptop as well.
>>>>>
>>>>> Does this test fail only for hppa, or for other architectures as well?
>>>> Have a look at these job failures:
>>>> https://gitlab.com/philmd/qemu/-/pipelines/2376819801
>>>>
>>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>>> address 0x7e085b4b1fff
>>>> Error occurred in Python: Cannot access memory at address 0x7e085b4b1f=
ff
>>>> qemu-aarch64: QEMU: Terminated via GDBstub
>>>> make[1]: ***
>>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>>> run-gdbstub-prot-none] Error 1
>>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>>> run-tcg-tests-aarch64-linux-user] Error 2
>>>>
>>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>>> address 0x40802fff
>>>> Error occurred in Python: Cannot access memory at address 0x40802fff
>>>> qemu-arm: QEMU: Terminated via GDBstub
>>>> make[1]: ***
>>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>>> run-gdbstub-prot-none] Error 1
>>>> make[1]: *** Waiting for unfinished jobs....
>>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>>> run-tcg-tests-arm-linux-user] Error 2
>>>>
>>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>>> address 0x45001fff
>>>> Error occurred in Python: Cannot access memory at address 0x45001fff
>>>> qemu-hppa: QEMU: Terminated via GDBstub
>>>> make[1]: ***
>>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>>> run-gdbstub-prot-none] Error 1
>>>> make[1]: *** Waiting for unfinished jobs....
>>>> qemu-hppa: QEMU: Terminated via GDBstub
>>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>>> run-tcg-tests-hppa-linux-user] Error 2
>>>>
>>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>>> address 0x7d742025efff
>>>> Error occurred in Python: Cannot access memory at address 0x7d742025ef=
ff
>>>> qemu-alpha: QEMU: Terminated via GDBstub
>>>> make[1]: ***
>>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>>> run-gdbstub-prot-none] Error 1
>>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>>> run-tcg-tests-alpha-linux-user] Error 2
>>>>
>>>> So at least Alpha / ARM / Aarch64 / HPPA.
>>>>
>>>> (I haven't checked whether the test is run for other targets).
>>>>
>>>> We also run these on GitHub runners where the tests pass, and apparent=
ly
>>>> when running on k8s private runner on GitLab they also pass. The probl=
em
>>>> is with public runner on GitLab.
>>> Also another test we ran was to pull GitLab docker image and run the sa=
me
>>> tests locally within that GitLab-generated image and they passed. So we
>>> believe the issue is related to some container restriction with
>>> GitLab.
>> Most likely because the ptrace settings are tighter - ptrace is the
>> mechanism we use to access the memory we can't normally.
>
>
> I thought about this, but then probe_proc_self_mem() that guards the
> test would fail.
>
> I don't think cpu_memory_rw_debug() does anything in addition to what
> we probe for.

The probe only checks for read access. Could there be a difference
between read and write?
>
>
> [...]

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

