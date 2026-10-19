Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FDD606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fY3tAwHX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIpvU-0004AF-QB; Mon, 19 Oct 2026 12:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIpvQ-00049O-Hz
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:09:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIpvO-0007xt-Oa
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:09:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so22416275e9.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792426161; x=1793030961; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xja6PBXFp8FsYYM+xp0Zv9dptIGMTCJ4I04YmDvqHj0=;
 b=fY3tAwHX3l5VZmDm3oJveKDY9FioEhx8KISuKjapiAqDhgN2UotOvtn49uWrg/fUHU
 KSg4EPzXVuoXaWGAcCRPYXOHlV6v9giaNdcNqKw7AcyK9XGjEgdjetg5bSm03fEGXWhD
 bzTLxDRw7WGevcSt7ojLH7n5vUWnmek5Mfawd8wtaLoiMBXqp0XuRgAjSRmcYWY7Sr9m
 1CCvGEQPZtVR3+dTmLkaIaZrTcDBQAa5iNSk6cre8KfAovhZUJjDKfFn2WyPZhtxpEcI
 o7aGTuBU9e9xHmtSUoY3yzTobIK67Mfx5k+hSWwjUY0jXV6MdbW9ldPvFeh5qlkM21Uq
 xbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426161; x=1793030961;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xja6PBXFp8FsYYM+xp0Zv9dptIGMTCJ4I04YmDvqHj0=;
 b=H5HB0jsFcNtqTo/0UCHogBQJuKQSqJbnjgcPqNjdKd2WrN4Lqj5zfnivVvIk1ir94+
 B3Gc5f1QE7RlaAfMFAPxZ42/bP2HxW9m0IR1UumEm4tVeWXHpY4A+0Fxc2spmF0HMfLo
 yU4+Vq3D4LeGWffBl5iFi1UL12aJ3e4tpWBxC2kiCxJrADNCOcY1G6Fv5Ua9tCLZc2XF
 3tm8Cb4/rjqhoByfYgYhAHC4KhrSaKuA8acfJGVRmtzKyWxmXBdbpFseAd8Jc/qfFQfi
 rp9Myr1+34lTFiRuuiVh4UZQUA1dxHzRytFwv5dqiJ+qROBvkds2/q8xSw7lztjwQ0we
 aSJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVuKcxsSQL0y1PYLPSdTykId//HmL+C0aPXIiOK5pjMaq7s7McvaQNV1D2DUOytIt84I5zbY7iOQ==@nongnu.org
X-Gm-Message-State: AFq9FYLaByJLqFB5sVfSJBciTSyoyrgghaAVjumNL+WX7GSsoskRJhWY
 plJvr+JHNMzbRsyonEnqti+Uz0MCGremlXmlfnOI3DA0x/oD9FQMHmGfIYS2WfbUaJo=
X-Gm-Gg: AYBFou1NnS8w372JkVFVYzQ/LRkRFO3L4Ct9GWYLj0Wi5T3wzLm14n9vMKYEw4Qdavx
 EY5heCP/FLGpmNJTk/Ngsyqp84nlZ3o0cfHEsJlXfXokuB0PXWgCpLWgYZnwDytJ07SHGgz4MRL
 1gHwocqstxDBsaMgJsp0NJCjpDr/3ojL7aOo3Gj8ide/grcWq81OT1L3uTTlD1dj8nIzI7p2Gg2
 e0UYd6iYlil/WOvVHx1QDjoJndY2q1ItgRi7XFNRvS2MUvWFAhGRQUF+GyB/fg79ho1vET/P6PJ
 dShNFvVt+x/Fs8O+tMkeQOARixsVme0bVNK+HGYWtT9GGVgP5neL/Mx4rvclEK7jas2e0OIiYwd
 9lYbVS3sBPsJKvWFpEtMo8sS157lPIwvmKrBY4rgkjmx3BKcncAEm1qOVJ8O9tx6AjW5BwGTQ8A
 ahJq28hWERt2MWCkfR/5T6MgUKSNQSsn4ona0hGtAyUHRTHWQbnpT+dlXqh4lAc/GWRbSgr9d4Y
 8UoJYxk
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id
 5b1f17b1804b1-4a1d7608614mr159430875e9.15.1792426160698; 
 Mon, 19 Oct 2026 09:09:20 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4e28bcsm24268982f8f.23.2026.10.19.09.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:09:10 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 662DB5F879;
 Mon, 19 Oct 2026 17:09:09 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Zhao Liu <zhao1.liu@intel.com>,  Kyle Evans
 <kevans@freebsd.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Brian
 Cain <brian.cain@oss.qualcomm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Brad Smith <brad@comstyle.com>,  Ani
 Sinha <anisinha@redhat.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Thomas Huth <th.huth+qemu@posteo.eu>,  Keith
 Busch <kbusch@kernel.org>,  Matthew Rosato <mjrosato@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,  John Snow <jsnow@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Anders Roxell
 <anders.roxell@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Warner Losh <imp@bsdimp.com>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Xu <peterx@redhat.com>,  Klaus Jensen <its@irrelevant.dk>,  Song
 Gao <gaosong@loongson.cn>,  qemu-s390x@nongnu.org,  Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [PATCH v2 08/16] tests/guest-debug: add --symbols option to
 run-test
In-Reply-To: <d5f4c9d6-a28f-43f2-a0bc-da9c2aca39bf@linux.ibm.com> (Ilya
 Leoshkevich's message of "Tue, 13 Oct 2026 21:23:29 +0200")
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
 <20261012170330.1144446-9-alex.bennee@linaro.org>
 <d5f4c9d6-a28f-43f2-a0bc-da9c2aca39bf@linux.ibm.com>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Mon, 19 Oct 2026 17:09:09 +0100
Message-ID: <87a4o94qqi.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On 10/12/26 19:03, Alex Benn=C3=A9e wrote:
>> Sometimes the debug symbols are not in the kernel binary image but in
>> a separate elf blob. Provide --symbols to facilitate using them.
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Message-ID: <20260930164649.433573-12-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/guest-debug/run-test.py | 5 +++++
>>   1 file changed, 5 insertions(+)
>> diff --git a/tests/guest-debug/run-test.py
>> b/tests/guest-debug/run-test.py
>> index 4aa24939b7d..0c7cbd137ef 100755
>> --- a/tests/guest-debug/run-test.py
>> +++ b/tests/guest-debug/run-test.py
>> @@ -28,6 +28,7 @@ def get_args():
>>       parser.add_argument("--kargs", help=3D"Kernel args to --append")
>>       parser.add_argument("--binary", help=3D"Binary to debug",
>>                           required=3DTrue)
>> +    parser.add_argument("--symbols", help=3D"Symbol file for binary to =
debug")
>>       parser.add_argument("--test", help=3D"GDB test script")
>>       parser.add_argument('test_args', nargs=3D'*',
>>                           help=3D"Additional args for GDB test script. "
>> @@ -114,6 +115,10 @@ def log(output, msg):
>>       gdb_cmd +=3D " -ex 'set confirm off'"
>>       # connect to remote
>>       gdb_cmd +=3D " -ex 'target remote %s'" % (socket_name)
>> +
>> +    if args.symbols:
>> +        gdb_cmd +=3D " -ex 'symbol-file %s'" % args.symbols
>> +
>
> I would consider shlex.quote() here too. Or maybe make gdb_cmd an
> array and use subprocess.call(shell=3DFalse)?

I have made it an array in the new version.

>
> Also, while it's probably a matter of existing code style and
> personal preferences, I would use an f-string instead of %.
>
>>       # finally the test script itself
>>       if args.test:
>>           if args.test_args:

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

