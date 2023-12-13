Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1903143ejo;
        Wed, 13 Dec 2023 13:02:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhFzaYs5wQGAAmQsTV4JQhNIkVbwEamkmB1N3T9w2vHkVe/m9ye/+9GykSnEdXIAJCjln1
X-Received: by 2002:a05:620a:8386:b0:77b:b1d2:3a2a with SMTP id pb6-20020a05620a838600b0077bb1d23a2amr10633046qkn.69.1702501324594;
        Wed, 13 Dec 2023 13:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702501324; cv=none;
        d=google.com; s=arc-20160816;
        b=NxF4hMRK6XaLsifNwhXAirTuH0UUQpGFUQUt/+JpjkX8awihGKT9gaTPDZUwGaC+aJ
         fgFdcPxxwz6JP9BxiawJA9TGpgSkopI+Q7WyexvOvVik33r8gu+VFlGvbI/oNVnlTWff
         +Vpp5cKjFAbDVAd3Pgpx+UdJd0cgM7EttFsiyXqkrVqGhKJ2nDHHmtwzYlVFxp683Oik
         GoispNs4RHpE8/KH0lh59/EQdAlnum7ZouSBiqgU5xz9yhZEU32C1rciQa5Eb7Yqt/YZ
         9A46T5Ud08V8XJaY4RFQkQxCQWpCnR2/liWTAmL13Z3uuDhHFxJz0ptxB0+d0PU/92Qk
         dbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=V9Y4tQelQotKGCNtpb33VNfk/Uf5WfNvGE9AkWeF3LY=;
        fh=/Vlx6SRrwmuwEMWeXSojT6/YD8t+ahn9lz6Q4Ls7Vbo=;
        b=A0tO4eM7yRdp8Sw2xfEtq7xllQk2uDpKs/JTWVcDXOxa0gvsYATx333eJpm31p4UBD
         vs5Aw85jT2OY2SL223Akwivn4zfA/LcV2si9UxhWQzsPY7VVUbrjuRULWg8v2mbQKQKj
         FNuGK1vPJW8pHFuNuCVrdDdgPUHa+KlhRk2wNCRf1e2cfas+DqCL4NajW2L/uw8arkPe
         lI0UjYMMrxhlV3tC+tJWKnZhNZi7Sb2uLZKxnTzQ97vsV1sQnkVLEjjoQlpfegyjKgRG
         PKjLVrAtarO9jP21mHR8Yh+XuMG+nNQE3gruzMHOsAifBqYKk0Wk045nkP4uimm2xL5z
         THfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RxYRavq8;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p21-20020a05620a113500b007788d7c09f8si13324235qkk.573.2023.12.13.13.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 13:02:04 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RxYRavq8;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702501324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9Y4tQelQotKGCNtpb33VNfk/Uf5WfNvGE9AkWeF3LY=;
	b=RxYRavq8eT757jJPnaLmmJXuG2NG6LDpUyZjZyF394EgXACXPBTx/AY44lZwg89KB+eKos
	2XUa/wvPzxxMPuGa9hY5gyAx3ETy+BtNdOJwyWgYL9GSkdyPYg6FLLvCiypViRk/8VlBsL
	WZLATAOa5HqL1XIdvPqm2wpY9z8veoI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-dF0vmdgUP1aw5h4Fi8V0kg-1; Wed, 13 Dec 2023 16:01:57 -0500
X-MC-Unique: dF0vmdgUP1aw5h4Fi8V0kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2D0B185A785;
	Wed, 13 Dec 2023 21:01:56 +0000 (UTC)
Received: from p1.localdomain.some.host.somewhere.org (ovpn-114-21.gru2.redhat.com [10.97.114.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D69BF2026D66;
	Wed, 13 Dec 2023 21:01:48 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 04/10] tests/avocado: machine aarch64: standardize
 location and RO/RW access
In-Reply-To: <2972842d-e4bf-49eb-9d72-01b8049f18bf@linaro.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-5-crosa@redhat.com>
 <2972842d-e4bf-49eb-9d72-01b8049f18bf@linaro.org>
Date: Wed, 13 Dec 2023 16:01:39 -0500
Message-ID: <87le9xvmto.fsf@p1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-TUID: 7RP+AuGWThXj

Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> W dniu 8.12.2023 o=C2=A020:09, Cleber Rosa pisze:
>> The tests under machine_aarch64_virt.py do not need read-write access
>> to the ISOs.  The ones under machine_aarch64_sbsaref.py, on the other
>> hand, will need read-write access, so let's give each test an unique
>> file.
>>=20
>> And while at it, let's use a single code style and hash for the ISO
>> url.
>>=20
>> Signed-off-by: Cleber Rosa<crosa@redhat.com>
>
> It is ISO file, so sbsa-ref tests should be fine with readonly as well.
>
> Nothing gets installed so nothing is written. We only test does boot work=
s.

That was my original expectation too.  But, with nothing but the
following change:

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machi=
ne_aarch64_sbsaref.py
index 528c7d2934..436da4b156 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -129,7 +129,7 @@ def boot_alpine_linux(self, cpu):
             "-cpu",
             cpu,
             "-drive",
-            f"file=3D{iso_path},format=3Draw",
+            f"file=3D{iso_path},readonly=3Don,format=3Draw",
             "-device",
             "virtio-rng-pci,rng=3Drng0",
             "-object",

We get:

15:55:10 DEBUG| VM launch command: './qemu-system-aarch64 -display none -vg=
a none -chardev socket,id=3Dmon,fd=3D15 -mon chardev=3Dmon,mode=3Dcontrol -=
machine sbsa-ref -
chardev socket,id=3Dconsole,fd=3D20 -serial chardev:console -cpu cortex-a57=
 -drive if=3Dpflash,file=3D/home/cleber/avocado/job-results/job-2023-12-13T=
15.55-28ef2b5/test
-results/tmp_dirx8p5xzt4/1-tests_avocado_machine_aarch64_sbsaref.py_Aarch64=
SbsarefMachine.test_sbsaref_alpine_linux_cortex_a57/SBSA_FLASH0.fd,format=
=3Draw -drive=20
if=3Dpflash,file=3D/home/cleber/avocado/job-results/job-2023-12-13T15.55-28=
ef2b5/test-results/tmp_dirx8p5xzt4/1-tests_avocado_machine_aarch64_sbsaref.=
py_Aarch64Sbsa
refMachine.test_sbsaref_alpine_linux_cortex_a57/SBSA_FLASH1.fd,format=3Draw=
 -smp 1 -machine sbsa-ref -cpu cortex-a57 -drive file=3D/home/cleber/avocad=
o/data/cache/b
y_location/0154b7cd3a4f5e135299060c8cabbeec10b70b6d/alpine-standard-3.17.2-=
aarch64.iso,readonly=3Don,format=3Draw -device virtio-rng-pci,rng=3Drng0 -o=
bject rng-random
,id=3Drng0,filename=3D/dev/urandom'

Followed by:

15:55:10 DEBUG| Failed to establish session:
  | Traceback (most recent call last):
  |   File "/home/cleber/src/qemu/python/qemu/qmp/protocol.py", line 425, i=
n _session_guard
  |     await coro
  |   File "/home/cleber/src/qemu/python/qemu/qmp/qmp_client.py", line 253,=
 in _establish_session
  |     await self._negotiate()
  |   File "/home/cleber/src/qemu/python/qemu/qmp/qmp_client.py", line 305,=
 in _negotiate
  |     reply =3D await self._recv()
  |             ^^^^^^^^^^^^^^^^^^
  |   File "/home/cleber/src/qemu/python/qemu/qmp/protocol.py", line 1009, =
in _recv
  |     message =3D await self._do_recv()
  |               ^^^^^^^^^^^^^^^^^^^^^
  |   File "/home/cleber/src/qemu/python/qemu/qmp/qmp_client.py", line 402,=
 in _do_recv
  |     msg_bytes =3D await self._readline()
  |                 ^^^^^^^^^^^^^^^^^^^^^^
  |   File "/home/cleber/src/qemu/python/qemu/qmp/protocol.py", line 977, i=
n _readline
  |     raise EOFError
  | EOFError

With qemu-system-arch producing on stdout:

   qemu-system-aarch64: Block node is read-only

Any ideas on the reason or cause?

Thanks,
- Cleber.
