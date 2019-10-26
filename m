Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp600173wri;
        Sat, 26 Oct 2019 05:21:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxChRs5TOf6hJFGo8V8dKeDy4KNEp/SGxYkxGfRa5USnlI5MLcXrMzhmG3ETuMrXMz+NstC
X-Received: by 2002:a50:e409:: with SMTP id d9mr9178142edm.254.1572092464014;
        Sat, 26 Oct 2019 05:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572092464; cv=none;
        d=google.com; s=arc-20160816;
        b=NqflD+VsF83xTh026DxxXdW3AENhKSh/aOCa7ck0RTRtQf3OkYK6TypJigiceWJmaB
         0FXwTf3bite6vli9Ye5ektSTBaxRmijeomwf6SwIJBsCv1NvvYEZ5BtLu2kGHg1Z6QXz
         Z9NO2igR5e5x7K2uBfV78i5r2Hk2my+wm+yGnY24cGMGHBqaxoR6CRkzpFFKJx8OnQfV
         CRt9PyTpkKIq46XuMebSMps8vJaBSSPKdMn3dFNEh2SD7MV81Asnc1dtC+vyl01N/Qux
         TVJPe9AzOrSAAroduW/exhBcdhYrRx5Yu5bYFo7SMWyZO1/nB7bE3pLcGFJXgpPbNkUF
         lOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Byi4bAe4o60OtVyJiuQiz5jF6cj1ynSz2aNNjYGM2w0=;
        b=USlIZoAxxSyN4psMj0wSCbDQuQbVA++GLg8+jhGnX/pszzLVm7v6NoLVBagQXVHXF6
         yoCD3YsTtQfLT8xVD/ZkEnmmpPbUlmlur/3KO/Uk6/stuLX6MmjJBHKx0KGDm2MKgtAk
         +Y9sH4Yn122WL8cBHZFHMHyNw3ieOWtilDh+snQDM1QW/7AkfIXqc6VgKDbqwTC6dEbx
         Loqm6pFoPieUp/KGULChnCIxYWveFT4JaYEfdP+/sMrD95KiI7VIL5pGQQ6LLTbzaPWe
         ygjk3a+E7JRyD0fV0ETxvUpIfmgiETVhhETHTC6OtVEGf8sCH9APeDF8izO/+IFqSddR
         9n3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si3485037eda.162.2019.10.26.05.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Oct 2019 05:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iOL42-000432-Qy
	for alex.bennee@linaro.org; Sat, 26 Oct 2019 08:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOL3L-0003gg-Gp
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 08:20:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOL3J-0000N4-9P
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 08:20:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOL3J-0000MA-0l
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 08:20:17 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E50181F0D
 for <qemu-devel@nongnu.org>; Sat, 26 Oct 2019 12:20:15 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id i10so2816745wrp.7
 for <qemu-devel@nongnu.org>; Sat, 26 Oct 2019 05:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P79WRKrO53iDbT1Yf/VUXLVKWsDQGmKDqtRB4o0iXfg=;
 b=oiHos26UoTv7TqJVN3g/SkQLhgkEVvQQj9KhQ+9FB6wbzVez08dhQa7xzaNxRkSZl0
 MJ8f2PK2cUzXOQUr/sDi58QStaAFUJBlDEqTd8u0ryQ5wF0qvvdd5T0bCqFyKqnjYdJ9
 LeIRTLNk53MN8Ky6jgZBk9EiukCdRys+4DjZdoko8HrHPAXfS/Ncq++InPM9NB3ShU8w
 xSL7zv9+KzGfflqK5Z+unvoL+bxdOBGBoSGw+6C9nzVBJIWCI8k83Fb1bkzs6baepTOO
 nFvsnDGqR1eG6mc+dnj8WqQtMTOVcOo3Oa/QVaEXTZJozzgewC0sRwvDe3bFU10HMFsK
 Ga2A==
X-Gm-Message-State: APjAAAVEH8nY5H5UBWt6VzE6aNhmebtSCMDe2hcZrLFtkYPf/SzGLZ54
 DJnQ3bNZOKmOzavgtdzTJk9tb02vnkKWVG0mQDElho97Ng1OQ4IpJMph0qUuKZExyx0+sXxbh3w
 ZNTkNrv2dy1xTNag=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr7153950wmk.123.1572092414375; 
 Sat, 26 Oct 2019 05:20:14 -0700 (PDT)
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr7153907wmk.123.1572092414091; 
 Sat, 26 Oct 2019 05:20:14 -0700 (PDT)
Received: from [192.168.1.33] (62.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.62])
 by smtp.gmail.com with ESMTPSA id y3sm9322335wro.36.2019.10.26.05.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2019 05:20:13 -0700 (PDT)
Subject: Re: [PATCH 00/20] hw: Clean up hw/i386 headers (and few alpha/hppa)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
Date: Sat, 26 Oct 2019 14:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y51kW3UzCDin

Hi,

On 10/14/19 4:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> This is a follow-up of Markus's cleanup series:
> Tame a few "touch this, recompile the world"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html
>=20
> This part is mostly restricted to X86, but since some file from the
> Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
> too.
>=20
> Eventually I'll succeed at removing hw/i386/ dependency on non-X86
> platforms (Quest I started 2 years ago...).
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=C3=A9 (20):
>    vl: Add missing "hw/boards.h" include
>    hw/southbridge/ich9: Removed unused headers
>    hw/input/pckbd: Remove unused "hw/i386/pc.h" header
>    hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
>    hw/timer: Remove unused "ui/console.h" header
>    hw/usb/dev-storage: Remove unused "ui/console.h" header
>    hw/i386/intel_iommu: Remove unused includes
>    hw/xen/xen_pt_load_rom: Remove unused includes
>    hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>    hw/alpha/dp264: Include "net/net.h"
>    hw/hppa/machine: Include "net/net.h"
>    hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>    hw/timer/hpet: Include "exec/address-spaces.h"
>    hw/pci-host/q35: Include "qemu/range.h"
>    hw/i2c/smbus_ich9: Include "qemu/range.h"
>    hw/pci-host/piix: Include "qemu/range.h"
>    hw/acpi: Include "hw/mem/nvdimm.h"
>    hw/i386: Include "hw/mem/nvdimm.h"
>    hw/pci-host/q35: Remove unused includes
>    hw/i386/pc: Clean up includes
Laurent, since this series is fully reviewed, can it go via
your qemu-trivial tree?

Thanks,

Phil.
