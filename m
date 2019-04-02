Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1344466wrx;
        Tue, 2 Apr 2019 01:42:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvgqBMImMsAjMWHggD5ZfkUToUiVisdD4CGHpniKVg/gXj7sarJXSYttgp3eOSyJzQxUYV
X-Received: by 2002:a0d:ca41:: with SMTP id m62mr5957682ywd.97.1554194568196;
        Tue, 02 Apr 2019 01:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554194568; cv=none;
        d=google.com; s=arc-20160816;
        b=a4xUGwc2KZuBE3yvnFGpdbdzrObN2/NfQKhOI+b4Jmzm3EuBJ6QjgDTEsHwvFoOv7U
         661a1glULefs2XEjq6V8oUgupXXOxEtf9KW88S16evv7dE1bdMf8nve4cSAtA7CaNxCt
         CYAg0EASyJbrqjZrNgnfzgXF/vIWVr7qLh4+78GPdPRih6QmHF4HFrWA9VOtCrZ/irQN
         567i0EdMjhqixgfad8fA+xXBsB9orj+9GeaFjmZ8Hkf9UtIxugn4Hzj6QGqvu6nqW3wa
         cCXicqb102/Z6ILu0ADoxbb6X69v4MUm81LkPFKEdywEJ/WD5bwF00KXXYW/a03W3t1z
         FBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJJR32VT/OsA1C05gK2mNpE7eskQHRAZ1InfxuwWt9A=;
        b=xWflXmmHy2ejigYTRYtsdNlrf2YdOnJT7/AJNUVrVIq2LwqR8hvuMmJ495ECwjxcbw
         lbhHeqqluxsB8R9c0AYYAqwwvG3guZmm60zP6bbM5peillHO7UC+eAo+zVLOc76BgJNB
         CQKZ7fx04abgCy7Qr+kPmvzqSIXIqu1bkefjpLg7VoMJ7WP49O59zwwuI7Zli8Uuh6E8
         7RXOKPG1NvKK+u+XLN9FVlJD4a3qcRn5JfWcbl7N4CXu9NETL2B3Wnd2l2j4Qs8YjDDq
         weA/qReOR668yjyQwpjDFqwcjaJrh/okVmAVeJY8P56i4iW+otNpZ+jJbDtk1DCVHrTB
         mrqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YZ/NvVak";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o189si3585402yba.162.2019.04.02.01.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Apr 2019 01:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YZ/NvVak";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBF0J-0002zi-Fe
	for alex.bennee@linaro.org; Tue, 02 Apr 2019 04:42:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBF00-0002wR-R6
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 04:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBExZ-00063W-P7
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 04:39:58 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBExZ-0005xb-G7
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 04:39:57 -0400
Received: by mail-ot1-x343.google.com with SMTP id e5so11225799otk.12
	for <qemu-arm@nongnu.org>; Tue, 02 Apr 2019 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pJJR32VT/OsA1C05gK2mNpE7eskQHRAZ1InfxuwWt9A=;
	b=YZ/NvVakPKVHAK33csV9cdn72WBvMynIUp/KFIpoXnlj2l8qcZzLMeG24nmznik6sN
	iRBwQS12v4nGCKQsM8q2SyqSWx2ZSh1T6FCBvJeQGwuxlZGJ+9VBktGZ6RWqMUhLqqY7
	jIG8KHSwLQCcmgDOKAkWsm0E/baVglCARFprlQO+VFmnTdXBdBZBuzGSZOKFAP+89Xg1
	ityluphdmIlvUhlRtJwA5zfhlm0DVaPEqI36KTAifBtl7ykISD2K2Jcr9B96FoomeUWc
	zGDmkPZKqhMwcL26HyeXaR7nL0i5VYH4Nzt9RJFmxJJwiMFMtH9iZOg0oLIiExAhIq2c
	qzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pJJR32VT/OsA1C05gK2mNpE7eskQHRAZ1InfxuwWt9A=;
	b=hJLOJm999u2sho+qJjXPLJDp2nW35F8Oy56QomX26UTvqZsOY2dfr9ka9nrvsmu0qk
	QcG5fYpT3TQlfyffz4GNyc3zdLIrhJRXaPvi9RwLgL/FdCn5ad9rUaJil5givcRj93TR
	sT0/LUHWN7t1632ldwx0qup9qh7mkG8wiswUJxYRMpCmgdLl4KbCA67srS7neJiInwF9
	qHGbXxI6R9+m+BeXaADJ413XwaeH6pyd0LYmqBkSD+ckWbBScnASFu6fYwMeyzmHfGGy
	T9bjPCfLX94BNTKyDIpXN8W+E1XtgGHsOGFnwns6gveaTAOFylZMxZ7u2ZlYBArlbaLH
	ZwvQ==
X-Gm-Message-State: APjAAAXqO1xOeflK4x1WEeQ1BsZKHXY0/5ZoJi0bhNV62B9t29TjUwCy
	HZVJXiwoy5Tirjk2n31GL3En/DOytVhK2gYF+Bji+Q==
X-Received: by 2002:a05:6830:1cb:: with SMTP id
	r11mr38560410ota.302.1554194396392; 
	Tue, 02 Apr 2019 01:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
In-Reply-To: <a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2019 08:39:45 +0000
Message-ID: <CAFEAcA9mf3HxzYkCA1rj8xQVRGo5Nbe72KEPXtQtQgA2GYaHmQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Laszlo Ersek <lersek@redhat.com>, Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3vPJx32pd+Gv

On Fri, 29 Mar 2019 at 20:56, Auger Eric <eric.auger@redhat.com> wrote:
> This series:
> - [PATCH v3 00/10] ARM virt: ACPI memory hotplug support,
> https://patchwork.kernel.org/cover/10863301/
>
> aims to introduce PCDIMM support in qemu. In ACPI mode, it builds the
> SRAT and DSDT parts and relies on GED to trigger the hotplug.
>
> We noticed that if we build the hotpluggable memory dt nodes on top of
> the above ACPI tables, the DIMM slots are interpreted as not
> hotpluggable memory slots (at least we think so).
>
> We think the EDK2 GetMemoryMap() uses the dt node info and ignores the
> fact that those slots are exposed as hotpluggable in the SRAT for example.
>
> So in this series, we are forced to not generate the hotpluggable memory
> dt nodes if we want the DIMM slots to be effectively recognized as
> hotpluggable.
>
> Could you confirm we have a correct understanding of the EDK2 behaviour
> and if so, would there be any solution for EDK2 to absorb both the DT
> nodes and the relevant SRAT/DSDT tables and make the slots hotpluggable.
>
> At qemu level, detecting we are booting in ACPI mode and purposely
> removing the above mentioned DT nodes does not look straightforward.

My initial response would be to say that hotpluggable memory
should be suitably marked up in both the DTB and the ACPI tables
so that guest software that cares can tell that it is hotplugged
whether it is choosing to consume the DT or the ACPI tables.
QEMU should definitely not be reporting the hardware as looking
different to the guest based on some guess about what guest
software it is booting.

thanks
-- PMM
