Received: by 10.223.159.74 with SMTP id f10csp3701426wrg;
        Tue, 12 Dec 2017 03:33:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBoukPzFCkOlNbEYHlkTkqmM+2/B5m8AIFGNkiSrs8XuLX4MTeL3/c4AcOQBHSvN76PvSW63i
X-Received: by 10.37.180.74 with SMTP id c10mr1742423ybg.503.1513078423970;
        Tue, 12 Dec 2017 03:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513078423; cv=none;
        d=google.com; s=arc-20160816;
        b=04BvakdzSxT9lWmjnCIbomtZEDv6IUCe+igpr5nrJkVgaLCkCZYmLrGF0p3KcH6ZBI
         nRqaqi72PqozKTBfJ+VTFXKBe4MzD06EgNhjlrg5JZVyR5qLoStJ3Rsr8sdQwSSa9mKC
         WKkPIOC1qR1fqd9dcrzLKd7dBTd3hOfxAyVheVc2ql3u8yVicma745+sM6KlS5LxHum9
         qoyQSTD/195uKEUYMsS1GXzkXmcHyxDdA2/uwJIKk3bjgCe+b2eb6Ds+pkpI77qcSgYl
         guvpqKBpk4sK8lh3I/32SYVtLhFhh5PA7FMedL99lwoZgUuc/SCJJG+PXHol5tG8Jb2b
         q6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=hAa2PS+vUuNPFEOl64g6V0nvhNf4IuZVZxTCmcSRAQs=;
        b=miMWurAjFs81gYquwPkG3hhvWD7QfvnXA114ZG86kTtf7fSxLKxS9sp62AH2oZ+3Wt
         30gFMmT1fvnoJnDoAjUtoKMQD4/v8lYYEl9cqidvn90AhrcH64wbGwomD6de86fn8qNT
         DsNn1lrMqPn6kcPP5j/BHjBtaUdeEZFNgu3G3RqET5jnUSplqnYaIEaeC+PTLXgVCDDk
         3S44qvLfHJKuXeWCwF32fFp7kcd3HJxNjvbCX4xN0WVV435wzXf0Kp015Lfl5YWBG8cp
         3zDYErRAXAfClR4REl7Stvi3okyPthRxGxsLduDEtAr1I2ditFbNJ33YaKKhFFeCBXUm
         RKnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n15si3529910ywm.249.2017.12.12.03.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 03:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOioh-0004dK-EH
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 06:33:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOioZ-0004d0-2O
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:33:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOioV-0005Z2-9e
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:33:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eOioV-0005Yl-2f; Tue, 12 Dec 2017 06:33:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CA61356EC;
	Tue, 12 Dec 2017 11:33:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-105.rdu2.redhat.com
	[10.10.120.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0774C600D3;
	Tue, 12 Dec 2017 11:33:27 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
Date: Tue, 12 Dec 2017 12:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Dec 2017 11:33:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pTdeZqGIBxDj

On 12/12/17 12:11, Peter Maydell wrote:
> On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
>> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
>> can see from the firmware code, the firmware will use the PL011 whose
>> description comes first in the DTB (and ignore the other PL011), in an
>> fdt_next_node() traversal. Is that OK for the intended use case?
>> (Perhaps I should have asked this under the second patch, which updates
>> the DTB generator.)
> 
> I haven't tested, since I don't have a working setup for that to hand.
> (Do you have instructions somewhere for getting it working?)

The Wiki page I most frequently refer to (for a libvirt-less description
anyway) is Ard's:

  https://wiki.linaro.org/LEG/UEFIforQEMU

There's also:

  https://www.kraxel.org/repos/
  https://fedoraproject.org/wiki/Architectures/AArch64/Install_with_QEMU

> The behaviour we would want would be for the firmware to keep using
> the PL011 at 0x09000000.

With these QEMU patches, I reckon that's going to happen, yes.

> (In an ideal world the firmware would
> prefer the UART marked in the 'stdout-path' in the DTB /chosen node,
> as the kernel does, I guess.)

Hmmm, I recall that we used to have some code related to the /chosen
node... We have a helper function for locating that
(GetOrInsertChosenNode), but we no longer use it, it seems? The last
(only?) use was apparently removed in:

https://github.com/tianocore/edk2/commit/29589acf1010

I'll let Ard comment too.

Thanks
Laszlo
