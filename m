Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp625714wre;
        Fri, 1 Jun 2018 06:26:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIDFk92nVN/aI/EbxxO6DrK7W/j5HdRySFeGRbxcJ2kk/4Tn8dZbINik0pYuoW9Hr7GQZLW
X-Received: by 2002:ac8:3ff0:: with SMTP id v45-v6mr10788159qtk.57.1527859567060;
        Fri, 01 Jun 2018 06:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527859567; cv=none;
        d=google.com; s=arc-20160816;
        b=N56szEK91Sm2WXv8ueCrAvf0x/jV3C5rdSNfMN1IR1U1wWWaioh7QkqAi1D8FgnUip
         IOvulkZcYQhcBYCj1caHTo1hOzqfLyNuQdpgIZPPVv7W+/MDm1SKP5Yig+mY8rdNt7Rk
         0oK8vuzV8TZMKig7Hl4UAmGq+59Me4K+gUVV4CFeTllabG7LMI8LurvTUL4pw+elmq+E
         ZLQHxcJq2+TLxfqsHMTNV/589s2MoVru5dXO1gNG0xi/0sg+OOf1cbLNiPXSeSNCZ1Af
         iRE2F1F2svW1vdvuA6fhu4RpEcwuEiBByf6TpQP/e/21yQDU8gfACnyVD9xj5Kr5Tnbx
         i9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=iDcqQ/Cucdvyc3PLcUDH9N+4zz12bR4uSIxFYN04dJM=;
        b=zwa9+aRfPYR7tE5pG9tvng7AbhPTTwNPSnD9A1NX4K0yGpJTesc9zqrUcUqlsFMXBG
         Cze9SPHBeCKburKC1NHoxpzlwHQBYj77TMNtc4F2hEtBI+CHmsJyXpbOhMpMlhMsEKp3
         TEQ6jjCFyCf/fsIBXKhCJ52bIo8MjsxHGa/nHtQPU0GB1SoNXPM7h9DGnZKNdbsMdIZE
         TzcI1eGzJJw5vNvucTZfllxzJXWnkQqxmEcRE5eE+NrRIUDL9xEnux4T90lNa9zxLtc5
         X7jxThBDPv9nhuoXK53aEwt1A7TqGFYhkNj6bu3enSBmlIBF4iUrCNba5/aq8IwQFXNz
         UyOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TYIsP2po;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7-v6si3186236qtg.212.2018.06.01.06.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 06:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TYIsP2po;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOk4E-0007vx-Hk
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 09:26:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOk46-0007vk-87
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 09:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOk45-0005ND-6a
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 09:25:58 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:35097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOk45-0005Mu-0r
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 09:25:57 -0400
Received: by mail-ot0-x243.google.com with SMTP id q17-v6so18678106otg.2
	for <qemu-arm@nongnu.org>; Fri, 01 Jun 2018 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iDcqQ/Cucdvyc3PLcUDH9N+4zz12bR4uSIxFYN04dJM=;
	b=TYIsP2poSEHkPP6crS26UKM0wxJgtQM3pDl0qFcFn2Vp4WI5wKcnTnmwaqVZqib6WP
	54mOI5aFwykV8u/YoO9nsND3HZx2W0B0IuQS4Er01sH/kLw2R79QkNdTMNydoxAY2tjd
	nrK8q2jj4x1LfME92/GqYlEQdORzOAezI0KHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iDcqQ/Cucdvyc3PLcUDH9N+4zz12bR4uSIxFYN04dJM=;
	b=spw8bSQkceTK9fW2lAKeWlxDGaGi4teVm9/mUmmauCTsAr/LIW0o8IqsaFmkHtu3UJ
	M7IXPraV7yWR6PxKyK9dShqz02Hg4coEsut6iSnXBCSNGFOuiKmVn3grlgBArIM9P4d1
	s8CdYi9T4Azp1Hd8hPZq7ZXtTmSE2+STuzujc1FWJQ62FIxMlE92CAmxN7D3k3ChvAvo
	ROKYfTUPgSIv6FGQKTfvdtIkXkF0Ab24duAm4xmuy465x/bUOozBTSnsbU3uoqX+jiHh
	zuTtENfNgyZccN1u8Y7QXYHkzMl56hzTgFKxU8mHvSzmn9REcGYM0hzOkHfCaO39jkWb
	b/uw==
X-Gm-Message-State: APt69E2oaHJmSQPWeMNMDrTHIrMmpzJF0yXUgpO9R2Q/fY8X65ax0X8Q
	p0PS00oIKSi4UBf5KnJFlAnJZNPhSNGz1EM4V/1+cA==
X-Received: by 2002:a9d:705d:: with SMTP id
	x29-v6mr7707624otj.308.1527859556264; 
	Fri, 01 Jun 2018 06:25:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 06:25:35 -0700 (PDT)
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F201CAECD7@DGGEMA503-MBX.china.huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F201CAECD7@DGGEMA503-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jun 2018 14:25:35 +0100
Message-ID: <CAFEAcA9y_A5x-ELXbOGFp34FGKBED0v568tD8=corZn9cjJGzA@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND v1 0/3] add support for
 VCPU event states
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "famz@redhat.com" <famz@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HA/kmXCChQ2y

On 1 June 2018 at 14:17, gengdongjiu <gengdongjiu@huawei.com> wrote:
> Hi Peter,
>> This series failed build test on s390x host. Please find the details bel=
ow.

>> /var/tmp/patchew-tester-tmp-hwsn3wsl/src/hw/display/virtio-gpu-3d.c: In =
function =E2=80=98virgl_cmd_get_capset_info=E2=80=99:
>> /var/tmp/patchew-tester-tmp-hwsn3wsl/src/hw/display/virtio-gpu-3d.c:366:=
26: error: =E2=80=98VIRTIO_GPU_CAPSET_VIRGL2=E2=80=99 undeclared (first
>> use in this function); did you mean =E2=80=98VIRTIO_GPU_CAPSET_VIRGL=E2=
=80=99?
>>          resp.capset_id =3D VIRTIO_GPU_CAPSET_VIRGL2;
>>                           ^~~~~~~~~~~~~~~~~~~~~~~~
>>                           VIRTIO_GPU_CAPSET_VIRGL
>> /var/tmp/patchew-tester-tmp-hwsn3wsl/src/hw/display/virtio-gpu-3d.c:366:=
26: note: each undeclared identifier is reported only once for
>> each function it appears in
>> /var/tmp/patchew-tester-tmp-hwsn3wsl/src/hw/display/virtio-gpu-3d.c: In =
function =E2=80=98virtio_gpu_virgl_get_num_capsets=E2=80=99:
>> /var/tmp/patchew-tester-tmp-hwsn3wsl/src/hw/display/virtio-gpu-3d.c:646:=
32: error: =E2=80=98VIRTIO_GPU_CAPSET_VIRGL2=E2=80=99 undeclared (first
>> use in this function); did you mean =E2=80=98VIRTIO_GPU_CAPSET_VIRGL=E2=
=80=99?

> This build failure is due to kernel missing the definition of "VIRTIO_GPU=
_CAPSET_VIRGL2", I sync the mainline kernel tree header file to the mainlin=
e QEMU using the scripts[1],
> So happen this failure, It does not related with myself patch, so can I d=
iscard the patch [1] or add the =E2=80=98VIRTIO_GPU_CAPSET_VIRGL2=E2=80=99 =
definition to mainline kernel tree?

This is a known issue with the kernel headers (hopefully somebody
will fix them). There are several nits and also bugs in the
update-headers script that I sent a patchset to fix recently:
 https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05803.html

You should wait for that to get into master (it is in Paolo's
most recent patchset but that has an issue with a different
patch, so is waiting on Paolo to do a respin). Then you can
base on that. At that point a simple script update should
work fine (if you need anything in rc7 that wasn't in rc6).

thanks
-- PMM
