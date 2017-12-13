Received: by 10.223.159.74 with SMTP id f10csp5299754wrg;
        Wed, 13 Dec 2017 08:46:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBousy3S57slY6jOsFkSmQ8Ahn209d9EUJQTuy3veY96GbxO8mH357jRP9AVtNL8batH++ddC
X-Received: by 10.37.215.145 with SMTP id o139mr2258248ybg.518.1513183617779;
        Wed, 13 Dec 2017 08:46:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513183617; cv=none;
        d=google.com; s=arc-20160816;
        b=rEZM1VbvJT3dCiZiSPJdjZijK7+pZBCq70KUvVWbjxodUTAgVaf1IjJSn0OA38AKoo
         Y+HqEH9fl+aDKUh3hTf5eIeYB3TJq5FRYmF/8YLvF0d8nOiyZIZ8TnP9YHwjT1IenQsy
         3oFmQdOhAqdyE/OWk8qy1gl/fQRxEPLCB4QfiATVa+jbrym33opC54GyQadj+I4/WThP
         0Kblwk8jqtQJW0lxup2sCqLR9FcKtUBImXIQeK70VT2WjLvi8iItdKhK97owK2Eyd0Cr
         GVpUME0nr2cYbWHJeua8rw/BGwZvanYB23ppae2JjVAiAGfLl0YAcecXLhe6emh3LBKo
         YVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=M/hgh+Sy6T3ekV632fTNSeOWpSZj5Djp/sPovbcDwiI=;
        b=XEwMPl3xJinkGv3bK8rgqwclFCQEkIcw9I7O3SafYeH6M2z5wHZuimYs8IFVZcipW3
         ePLkRk20GquPaFynGRJjj0016uZv4d7ryt5ViEVLzSK7KiAtq1tK+IcoLGBLAB3FP1bi
         aKLeZCQmmn5x1twFpyyD0m9EPGD0g3ukRBDlDASYf3s+xMVoh7SJptn6tTsv97F38MAx
         NX8+nktHNlsXWx/3NP8QdkS3kxRICr4le3lxHvCzOML7iQdZShJz8K3AaiETrgxyC5IB
         DeBM4mDNqSE0EVQHv2lh3Ge/x5bQe2absxTE33FZR2rDv1C9hgkrP2EHFhS3OKFl3AoP
         TCJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DqaFnjI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w127si414889ywc.558.2017.12.13.08.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:46:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DqaFnjI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePABN-0004mu-7x
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:46:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ePABF-0004mb-6p
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ePABE-0000WL-4v
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:46:49 -0500
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:33986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1ePABD-0000Vo-VS
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:46:48 -0500
Received: by mail-io0-x244.google.com with SMTP id n41so3492810ioe.1
	for <qemu-arm@nongnu.org>; Wed, 13 Dec 2017 08:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M/hgh+Sy6T3ekV632fTNSeOWpSZj5Djp/sPovbcDwiI=;
	b=DqaFnjI5jNVq0hJVRWc+uUT4q2THoqSh5RHqm15vWNiR+8ZXhRoOTS+5kUpsVwWIY1
	hXrnLgLt1NfQT3pMrf1wGntzp6agYO+GHuX5jT3n8PbJ9Pcg/mPpTUctoljgxJBgyJY2
	2JnqCT7rugGYSYiGySROJ9d2YCT2GPBXoG3/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M/hgh+Sy6T3ekV632fTNSeOWpSZj5Djp/sPovbcDwiI=;
	b=RLjGfaNtvhU36C8sEwozPt4nzxJShsSIfBIQNRQ93MMzF0FDuwu9TAdGt7W+MXBwwd
	gyaBiRyndLXGd9aoWej7ldA5qql3+x8CycYIQ2d4UkfDgQk/DKLzUTwHCLR43PYV/jHS
	61ksDnNYZ8Zkp1VtnKSs7L65snkEpbix2U292JSGWMfmrsNk9py3Qbku20IFQMe0Bwi0
	ZRbNYEbSTHGp2c6FNq+USuoYmWHJZMcPV4PdkD3ZPSQ6+AOCY3HNbjywzuOtoTbmyCB4
	83E4v7KcNgHoFRAk6fmD0ZGpXn35wAGGP8dn7RFhSrqQkCiBa3IE7vSbJR9jPMb7f5vS
	GzHQ==
X-Gm-Message-State: AKGB3mIo2gA9XYZu3ZwslEqlYQvkaMyPhqHX/skPeQve+hpDuy0fe5Rv
	sVJgkwrx4S2os4fKoS1tfW2C4GTbcF9OuebiDDeGqg==
X-Received: by 10.107.2.137 with SMTP id 131mr3771746ioc.186.1513183606895;
	Wed, 13 Dec 2017 08:46:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.104.16 with HTTP; Wed, 13 Dec 2017 08:46:46 -0800 (PST)
In-Reply-To: <0355e1ee-2f48-81ce-55e6-bed7bdeac771@redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA8ySsNx-rz__Nfbmd+QM3nKbgRXJtwSYjhRRvqbokt+uQ@mail.gmail.com>
	<0355e1ee-2f48-81ce-55e6-bed7bdeac771@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 13 Dec 2017 16:46:46 +0000
Message-ID: <CAKv+Gu-uPf9QLobM1Vqdek_rSPfZcAXV24Ybg83hZvHbH5LqHw@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::244
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
X-TUID: IdDPeNWqlDHe

On 13 December 2017 at 16:01, Laszlo Ersek <lersek@redhat.com> wrote:
> On 12/13/17 14:56, Peter Maydell wrote:
>> On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
>>> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
>>> can see from the firmware code, the firmware will use the PL011 whose
>>> description comes first in the DTB (and ignore the other PL011), in an
>>> fdt_next_node() traversal. Is that OK for the intended use case?
>>
>> I have now tested this,
>
> Thank you!
>
>> and annoyingly UEFI and the kernel seem
>> to disagree about enumeration order. That is, if QEMU creates
>> them in the code in the order 0x09050000 (uart 2), 0x09000000 (uart 1),
>> then they appear in the dtb with uart 1 first, and the kernel enumerates
>> them as ttyAMA0 being uart 1 and ttyAMA1 being uart 2, but UEFI
>> outputs to uart 2...
>
> Ouch. This reminds me (remotely) of QEMU commit 587078f0ed63
> ("hw/arm/virt: explain device-to-transport mapping in
> create_virtio_devices()", 2015-02-05).
>
> I'd still like to avoid the "sophisticated" /chosen lookup (the lookup
> itself is not too complex, but evaluating whatever we find there against
> each of the scanned UART nodes appears difficult, if I'm to understand
> Ard's earlier point correctly).

This may be a lot simpler than I originally thought. stdout-path
contains a string of the from

<nodename-or-alias>[:<baudrate[<parity>[<data-bits>[<flow-control>]]]]

where nodename-or-alias can be resolved into a path via fdt_get_alias
(), or used directly as a path otherwise.

> I hope that we can match the kernel's
> logic with simple modifications to our scanning loops, e.g. we could
> simply pick the last UART rather than the first, or else do a maximum
> (or minimum) search for the UART base, and stick with the maximum (or
> minimum) found.
>
> However, for that, we first have to understand what the kernel does. Can
> someone explain that? (I tried taking a look, but it's turtles all the
> way down.)
>

The kernel uses the contents of the SPCR table or /chosen/stdout-path
as the console unless overridden on the kernel command line. This is
independent of enumeration order.
