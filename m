Received: by 10.223.159.74 with SMTP id f10csp3711068wrg;
        Tue, 12 Dec 2017 03:45:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBoueY0ETs6oDqAMwFSMgtpp3qy/Px+WpfvlrtUckCcmvUpZ7IrgIiYvFqRlfSwpRYqLDycMk
X-Received: by 10.37.136.142 with SMTP id d14mr2581800ybl.374.1513079112396;
        Tue, 12 Dec 2017 03:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513079112; cv=none;
        d=google.com; s=arc-20160816;
        b=LlSrEBTeyOW5RjzTqLZGZBk9vzDDmpP1P6NWmvKc/3QWO3SWXTdfkxk60aPlW/oNYl
         wFqeNDk1bPhDRsiVK7gcPIplqweV1t6QDzv4KEUepArsbwgO9PDc3jU2OpaTmPXCplkz
         4UIOEYIejkYj+ucWJoyNO4hhGVZBoJFCuBY3QLpgp1ouXuh5+r38uEiXc5uN5lNcdZ+w
         SHDAwH8FULL/4LatqQf10Ug3GGrJc0GwaaI/AprfSGTrsqLaghXbv3o4wYhS+efDlB1u
         FdG2gcNtvv8ep4Omx9UhgqUw72nIaIcP5TNXTZr7c14EXN7wQN8LBJXlbLzctyVVP7F4
         UvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=15nOXUVpXMPXqEm4uMSE3NK7Zq6fL6os7ryxxRdlzww=;
        b=VdGWLQ2+zVIYxCLSEQlOw98zR/ikvkTCdo15OnnopMH9UBtp0vT292iPsu3jat02sF
         84LXJr7fDlMDEKVGCG7t/ZWabG/X8Bdu3ggGyOiprfw1+i8xv6/WcSV/HG1gTkWVjXSD
         qQLO9jLmIZ1b9UQstvA5QbPqnXaQ4ErpkgKK3G491IgI8/N17DgF7g2ag7yzLoW1vJsN
         33oGM4gj6ch0Gau+LbYoNcnBEQVKhw77zZgSZ8ZIXJmx2nO2CW/+TQ7Gl/QcF4mnAwzN
         MbOels0Xr1iqh9CeeW1/rHEcDAmMRQSC/YNuqiaXrQCa+6HTVlfsXKSrKf529B/jOHwB
         PGng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GjTlFR+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si3114265ybn.398.2017.12.12.03.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 03:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GjTlFR+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOizn-0000QW-SF
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 06:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOizb-0000Nz-CV
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOiza-0004fP-CX
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:44:59 -0500
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:40404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eOiza-0004em-6o
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:44:58 -0500
Received: by mail-it0-x241.google.com with SMTP id f190so23543671ita.5
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 03:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=15nOXUVpXMPXqEm4uMSE3NK7Zq6fL6os7ryxxRdlzww=;
	b=GjTlFR+cFtJd7s7BE1rdAAnQcfsTsUYTo+bRyeCZD4K4q9f2lNMdakVDhuhnhK6NKU
	zftrwM7PsWrvXuRf3k81yl2QSsqhxIy/bZ/Wex71l3d+aeASc2C2ykf6fee4crSSmCj4
	jfUuzXZqR1HMkng9b2trbq1G8cSA3ayvCo+ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=15nOXUVpXMPXqEm4uMSE3NK7Zq6fL6os7ryxxRdlzww=;
	b=PeV8JiQm8bVSouOQGpo8qA66L7N4n4X2P+CWbOPR2gPGExJjx+ARQa9Bf7v74+Bx+s
	3xG4qkp4clwb3R3wsjyXMSX9KKSv5T3F77aBURepYTM0pul9hx1D2R4ByPH5qLKwWRx/
	kiUm/2dKTwokoqfhkNddNZJQlwaohkHZA0NG4G2XmSlFNqz7XSntkRZNHZk1GcW3iFBN
	gZZKsb4eJTjB5ImR10Wi46mR287bQkFtYK9tkqbKmygIWGoVJihxx+2N0187CSwlRbKg
	cJFsW69qrGUwnkpGKzudzl5f6T7ImvaSDlyBNWplN5PL98cqiwrC70m8LYnLAzudR8rA
	kyFg==
X-Gm-Message-State: AKGB3mLSjoDNLDagTSN+G0Z1GXXjgXdStD8twHPkhucfrb075bafd6Kj
	+Cni9m+BjWOvc6ld+l9phLpiYt8by6eVwOgRfOBO7w==
X-Received: by 10.107.174.222 with SMTP id n91mr4600322ioo.43.1513079097044;
	Tue, 12 Dec 2017 03:44:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.104.16 with HTTP; Tue, 12 Dec 2017 03:44:55 -0800 (PST)
In-Reply-To: <6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 12 Dec 2017 11:44:55 +0000
Message-ID: <CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Drew Jones <drjones@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ln/vRvXtt7aU

On 12 December 2017 at 11:33, Laszlo Ersek <lersek@redhat.com> wrote:
> On 12/12/17 12:11, Peter Maydell wrote:
>> On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
>>> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
>>> can see from the firmware code, the firmware will use the PL011 whose
>>> description comes first in the DTB (and ignore the other PL011), in an
>>> fdt_next_node() traversal. Is that OK for the intended use case?
>>> (Perhaps I should have asked this under the second patch, which updates
>>> the DTB generator.)
>>
>> I haven't tested, since I don't have a working setup for that to hand.
>> (Do you have instructions somewhere for getting it working?)
>
> The Wiki page I most frequently refer to (for a libvirt-less description
> anyway) is Ard's:
>
>   https://wiki.linaro.org/LEG/UEFIforQEMU
>
> There's also:
>
>   https://www.kraxel.org/repos/
>   https://fedoraproject.org/wiki/Architectures/AArch64/Install_with_QEMU
>
>> The behaviour we would want would be for the firmware to keep using
>> the PL011 at 0x09000000.
>
> With these QEMU patches, I reckon that's going to happen, yes.
>

IIRC the DT nodes appear in the opposite order as they are added, so
adding the second UART after adding the original one is probably going
to cause trouble.

We do check the 'status' though, so if backward compatibility with
older firmwares is a concern, we could set status=disabled, and let
newer firmware builds enable it on the fly.

>> (In an ideal world the firmware would
>> prefer the UART marked in the 'stdout-path' in the DTB /chosen node,
>> as the kernel does, I guess.)
>
> Hmmm, I recall that we used to have some code related to the /chosen
> node... We have a helper function for locating that
> (GetOrInsertChosenNode), but we no longer use it, it seems? The last
> (only?) use was apparently removed in:
>
> https://github.com/tianocore/edk2/commit/29589acf1010
>
> I'll let Ard comment too.
>

That would require us to implement some non-trivial parsing and alias
resolution, given that stdout-path is simply a string that may refer
to a UART node via an alias.
