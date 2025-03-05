Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm314744a12.42.2025.03.05.08.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:58:21 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D7B0B5F932;
	Wed,  5 Mar 2025 16:58:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Eduardo Habkost <eduardo@habkost.net>,  Li-Wen Hsu <lwhsu@freebsd.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Laurent Vivier
 <laurent@vivier.eu>,  qemu-arm@nongnu.org,  Alexandre Iooss
 <erdnaxe@crans.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Riku Voipio
 <riku.voipio@iki.fi>,  Warner Losh <imp@bsdimp.com>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
  Kyle Evans <kevans@freebsd.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Ed Maste <emaste@freebsd.org>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 07/32] tests/functional: update the aarch64_virg_gpu
 images
In-Reply-To: <20f719a9-a26d-4cb7-aa59-aab6cb20fe77@redhat.com> (Thomas Huth's
	message of "Wed, 5 Mar 2025 09:35:08 +0100")
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
	<20250304222439.2035603-8-alex.bennee@linaro.org>
	<20f719a9-a26d-4cb7-aa59-aab6cb20fe77@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 05 Mar 2025 16:58:19 +0000
Message-ID: <87cyev4dp0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UZWSREC2iLiR

Thomas Huth <thuth@redhat.com> writes:

> On 04/03/2025 23.24, Alex Benn=C3=A9e wrote:
>> Update to the most recent aarch64_virt_gpu image. The principle
>> differences are:
>>    - target a v8.0 baseline CPU
>>    - latest vkmark (2025.1)
>>    - actually uses the rootfs (previously was initrd)
>>    - rootfs includes more testing tools for interactive use
>> See README.md in https://fileserver.linaro.org/s/ce5jXBFinPxtEdx for
>> details about the image creation and the buildroot config.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/functional/test_aarch64_virt_gpu.py | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>> diff --git a/tests/functional/test_aarch64_virt_gpu.py
>> b/tests/functional/test_aarch64_virt_gpu.py
>> index 3fdb31f034..e417ca9beb 100755
>> --- a/tests/functional/test_aarch64_virt_gpu.py
>> +++ b/tests/functional/test_aarch64_virt_gpu.py
>> @@ -25,14 +25,14 @@ class Aarch64VirtGPUMachine(LinuxKernelTest):
>>       ASSET_VIRT_GPU_KERNEL =3D Asset(
>>           'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
>>           'download?path=3D%2F&files=3D'
>> -        'Image',
>> -        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462=
f6')
>> +        'Image.6.12.16.aarch64',
>> +        '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec=
8b')
>>         ASSET_VIRT_GPU_ROOTFS =3D Asset(
>>           'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
>>           'download?path=3D%2F&files=3D'
>> -        'rootfs.ext4.zstd',
>> -        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bda=
d4')
>> +        'rootfs.aarch64.ext2.zstd',
>
> I'm a little bit surprised to see "ext2" instead of "ext4" here, did
> they really downgrade the filesystem?

I think buildroot just symlinked them all together. I'll double check.

>
> Anyway,
> Reviewed-by: Thomas Huth <thuth@redhat.com>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
