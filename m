Received: by 10.223.159.74 with SMTP id f10csp3876598wrg;
        Tue, 12 Dec 2017 06:21:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBouHDvOmyYN19kbnDcIReoG9yoNGRAPQx9enDD39/6bQwcpU8Gkf+xvpsGgFfbGanzup9XdW
X-Received: by 10.37.221.198 with SMTP id u189mr2825953ybg.123.1513088464005;
        Tue, 12 Dec 2017 06:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088463; cv=none;
        d=google.com; s=arc-20160816;
        b=bdhNel8A22qMYwgR7zsqdeeJ4d0m8yb8jz+vJdGpnRqZIjkhFF+xt3AHHPeIFdD+8G
         Mu76MTltbYJub4bjb+A/DPcdVFhFHtduQP75p09iQUessGHnVuKDTBWtE1vi3rcOEWlI
         1G4cgNwkd9b+F5SNvruq1ce/pyweC/gvCIkfZoCtQ8KVkRF3KdkOmtxgh6cYHh67/RgE
         AKWjpuFYcf8mIeuBY/pDegO7FAh98uza537YKvSRKiniQwRWsD/haOFnIf4m+OuC4R4w
         p8SK6LqhdOoAE4DUuLO5tkhD/s9OHdMKMdT6QAVHLENtAm3NAiriw27beMvi8FW/mISV
         su3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5+VcYLeoNrvH1mESwcsUa64qnKEKo8D3Qr2FWtnxM7A=;
        b=g8YQZpqT9Clbxu5hEfkxQVcYeBj0LTtYnvrwbWtb6qZLnfVui2nD6Fcdt51uWeQEiy
         SyR+ZkydOgvQQXN42OeFhuoSu42ixVqPe5nxdZYGuPAwu79ascXWU6ajyZwYRg0ItajE
         Yw9Cx7C91Bwc0E73w8y5fYDFjfpTq40p6kwKn8iY2VDVuH4n1gRBjM1SgoGq1+3tCqTG
         k2FqKlcUL9R8misTHfH+5fkl3Ho0KJdlGp393wscLCbYun58As5NHJQlksFEcDHMm35I
         GZfYIQ7Mu3Hx0IJv1fIDCwxMXVPt9t1jlwpMqLFEN/KJT8SX+PGHJGr2da2/PJhidMM/
         2jTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fwP1qPZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l77si3320952ywb.402.2017.12.12.06.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fwP1qPZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlQd-0004yz-Dh
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:21:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOlML-0000X1-5F
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOlMK-0005un-CP
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:16:37 -0500
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:39952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eOlMK-0005uL-8f
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:16:36 -0500
Received: by mail-it0-x241.google.com with SMTP id f190so24541014ita.5
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 06:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5+VcYLeoNrvH1mESwcsUa64qnKEKo8D3Qr2FWtnxM7A=;
	b=fwP1qPZAcmgtFHDik1iSvin8DjQfCyasXvvPvjT3rwOcNyQYD8P2OcAKluFShFtBbW
	k+IGoCYz+zf9b8E7xwg+15jx2UxdDSJyBCgowt5sgOy9GeSEEp7K5E1HUJPSKqO6w/MR
	IrbaKz/GV54aO62PpJcflrNmTQsxloVA/fNPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5+VcYLeoNrvH1mESwcsUa64qnKEKo8D3Qr2FWtnxM7A=;
	b=TjqTdTSOlIgAJmAFKx3CxdC3eSoXtRHrBZo0gMk4IUqSbCUeUbJrxBfz3xnTD6gdkP
	E8ty9Oiq9CoGOMqF6xenLQzjFGglzqRWBvObA+GmYUAwK+svIwZM7VZtEIgilPPXwdH4
	57SsNPOr570ybkCQct5VC0LEVMp+NVi9bKat9pta2DdbqLKqUWYfD5LMMFGLnyzJPKLz
	rnMBKsLUSfyQ30O9fn7cy+MfuMFGnVs6jRCihCH5CMrL/97xPem8/L8wCxUhE7wKGduZ
	NvTawG7luB4tR4Nolv4KnGd4ggSGvbWwA1rKOu1r2/Q/3zVfsyO2WmyGsXus1zeV1xzw
	TwIA==
X-Gm-Message-State: AKGB3mIrpra4EMXy14iI1cqrrwooSeC9z+L4ckD0EPbaIudEVFRYTM/+
	Q9fFIib9tfExXY7MrM0UiPkj8qzK5aIdrNYe8m9Oww==
X-Received: by 10.36.145.216 with SMTP id i207mr2671644ite.73.1513088195577;
	Tue, 12 Dec 2017 06:16:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.104.16 with HTTP; Tue, 12 Dec 2017 06:16:35 -0800 (PST)
In-Reply-To: <CAFEAcA9HAcZTi6bT-FbsG9LtqO=4s7rpcz0niZbimG834t4uHA@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
	<CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
	<CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
	<CAFEAcA9HAcZTi6bT-FbsG9LtqO=4s7rpcz0niZbimG834t4uHA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 12 Dec 2017 14:16:35 +0000
Message-ID: <CAKv+Gu8gZ-Y4-zV2GRgbXPcignAg3vi8__XaFXqAhYOZOL7GcQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A5TG4sxbx/WK

On 12 December 2017 at 14:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 December 2017 at 14:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> On 12 December 2017 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> That doesn't actually usefully separate debug output from the
>>> console, though, because stdout-path is also going to point
>>> to the UART with the lowest physical address...
>>>
>>
>> By default, yes, just like is currently the case. But I would assume
>> this new serial port could be appointed 'console' and put into
>> stdout-path by QEMU, based on the command line options?
>
> We don't have any command line options for doing that, and I'm
> generally reluctant to introduce new command line UI, especially
> new command line UI that's specific to Arm and not also needed
> for x86.
>

If stdout-path is always going to point to pl011@0x9000000, why would
we need to parse it?
