Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4451957lfg;
        Thu, 27 Feb 2020 05:29:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3O/6EM7B/9heDvlsSpRuCi10gPqv8ZvXD5mvBJWS05e14AhO363jJlLt8XmbOMsNVXAS6
X-Received: by 2002:ac8:190b:: with SMTP id t11mr4986853qtj.154.1582810145286;
        Thu, 27 Feb 2020 05:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582810145; cv=none;
        d=google.com; s=arc-20160816;
        b=CjyXkkCUFPwQ0AJZ0wgxPk334TG4J+V9jXveuPXQknS0ciJXqMCVisWgd/eoadmuGL
         Uc7hV/FrAz/BKB8NCLpn1sQ3H8tzNPg/oxX8EkRAH3Te9mAbwKCz/VFOk/s0AaHV/wcM
         /T109lWtdcFmU8dJsfOaCplLqw4CiaITX+WoqjsbApQ/G6Lq47tHRH3Y3iR+KLlEXc1a
         0N08l/q0pTJOGyIa7f0LSMZ3E5aSoQg/TGPxsXCKrCtjIBNahunaKPTsRtM5uHE06KC8
         2EPRamAwUR2uqQ8gLqsfyY7IGlyYN2XRzl/Tu8mZ7b68hXLEjKqzNjEzbktdYqDhqkGx
         sb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7cil+S2TI0XenfpWIIHgW3zIl7wCogwPVlPkS1oJPDY=;
        b=HJJKa83zI8NC093F0UwmKnN42c9Tvz/JD/b7EPglcVRLvms9ynV5lCEcHujM8Vz+ws
         tw83QQf+1DRNVmfB8l8VflWs2MYHdPxPfVYw+97yfXjYXPGYi0XoraKwzGqUvk+NCPBp
         AuoAfZ6PpL/L3AwDHuU9UBiBZ/fZJOP5NIVUWX61kb9Nrp/MtKrEK1fr6BYQo0D/wDzp
         9Snvl71qr60ZvdaOKbaGHOIHBwe+VRVEoj4NMhW0CvAFj5VwSmHQaEXDsN3SoXn/0Yxd
         Kx0myQXJWK30hdGNL9HQQJw6P3/ak61xBc2iZXFo/hg1DCedJKDTqdUDHx4QzElpfs3G
         bstw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iyNjlY7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si1415832qkh.284.2020.02.27.05.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 05:29:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iyNjlY7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7JDs-0001DG-J9
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 08:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j7JDh-000192-GF
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:28:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j7JDg-0005PQ-BE
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:28:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57549
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j7JDg-0005P1-7z
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582810131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cil+S2TI0XenfpWIIHgW3zIl7wCogwPVlPkS1oJPDY=;
 b=iyNjlY7EoBq/ma+A+6Qodz2rf7LPyd73dnecPArgJGyrtrN01uVa8OF/FCr1acHchdAdG3
 1Vue+XxbrjcuooTlfA1aS8YVFR5J5Djz5u2/VY5oTLVfjGgufkYz989uvvQIV1b6Pvx+5q
 oTq65sDWmisNd59lhT0+nejvzgvm5H0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-mUTnIEQkN16Wp-yB1F9VKw-1; Thu, 27 Feb 2020 08:28:44 -0500
X-MC-Unique: mUTnIEQkN16Wp-yB1F9VKw-1
Received: by mail-wm1-f69.google.com with SMTP id y18so950320wmi.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fD0MNpuWhab4G9SMLJRbIrZoxFLbb/kORsNGxaBYd4A=;
 b=Psdj3AaKN0JwATpNNvAoKyITS9FLu17nfigxRlpHBlrSLfAnt5kgLo9lg0uLt3bxXw
 klntX8GaThcM1aCdX6W62saJCBuexPXeTfIiRWyGtwQq9tKl9QNlswASCQgp/mWEgFVn
 LZDL8DXZoIecQZJE7R9EE2NURiL2fxobfZkM5HeS6Nrj7z8FdUb3PyzA9rSlxeJ/L47E
 FAl9xcjH5+o+P+DP0B9GCc33Eo0TlXmjmRXayj84StehSjAVrXOuj41rg1uc7GjdbW5c
 ZcGuwuAvJlKEeylZqQqzgSVYnMgIaXkbOaTdH70BbYqp6VgpR5hNwmholta39cnBbmXE
 +L5Q==
X-Gm-Message-State: APjAAAXFmaL/McZaWdUW7KrrrO57a+v++xd9Z7zX9bHsNLA0AcS3Ab1D
 Kp6e0wSpf3iToSD5inShQ3eo/dAm3TpZ7mF+bzXAX5NGNe/LQKyRAUW+aWPkY3Sw2SW6AhpMgGb
 i71orN9t4Bt0k
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5577720wmg.154.1582810123068; 
 Thu, 27 Feb 2020 05:28:43 -0800 (PST)
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5577674wmg.154.1582810122767; 
 Thu, 27 Feb 2020 05:28:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:30cb:d037:e500:2b47?
 ([2001:b07:6468:f312:30cb:d037:e500:2b47])
 by smtp.gmail.com with ESMTPSA id z1sm7450624wmf.42.2020.02.27.05.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 05:28:42 -0800 (PST)
Subject: Re: [PATCH 00/20] hw: Clean up hw/i386 headers (and few alpha/hppa)
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
 <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
 <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
Date: Thu, 27 Feb 2020 14:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WxJzxBmMQxOy

On 26/10/19 15:32, Laurent Vivier wrote:
> Le 26/10/2019 =C3=A0 14:20, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> Hi,
>>
>> On 10/14/19 4:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> This is a follow-up of Markus's cleanup series:
>>> Tame a few "touch this, recompile the world"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html
>>>
>>> This part is mostly restricted to X86, but since some file from the
>>> Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
>>> too.
>>>
>>> Eventually I'll succeed at removing hw/i386/ dependency on non-X86
>>> platforms (Quest I started 2 years ago...).
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>> Philippe Mathieu-Daud=C3=A9 (20):
>>> =C2=A0=C2=A0 vl: Add missing "hw/boards.h" include
>>> =C2=A0=C2=A0 hw/southbridge/ich9: Removed unused headers
>>> =C2=A0=C2=A0 hw/input/pckbd: Remove unused "hw/i386/pc.h" header
>>> =C2=A0=C2=A0 hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" =
header
>>> =C2=A0=C2=A0 hw/timer: Remove unused "ui/console.h" header
>>> =C2=A0=C2=A0 hw/usb/dev-storage: Remove unused "ui/console.h" header
>>> =C2=A0=C2=A0 hw/i386/intel_iommu: Remove unused includes
>>> =C2=A0=C2=A0 hw/xen/xen_pt_load_rom: Remove unused includes
>>> =C2=A0=C2=A0 hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>>> =C2=A0=C2=A0 hw/alpha/dp264: Include "net/net.h"
>>> =C2=A0=C2=A0 hw/hppa/machine: Include "net/net.h"
>>> =C2=A0=C2=A0 hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>>> =C2=A0=C2=A0 hw/timer/hpet: Include "exec/address-spaces.h"
>>> =C2=A0=C2=A0 hw/pci-host/q35: Include "qemu/range.h"
>>> =C2=A0=C2=A0 hw/i2c/smbus_ich9: Include "qemu/range.h"
>>> =C2=A0=C2=A0 hw/pci-host/piix: Include "qemu/range.h"
>>> =C2=A0=C2=A0 hw/acpi: Include "hw/mem/nvdimm.h"
>>> =C2=A0=C2=A0 hw/i386: Include "hw/mem/nvdimm.h"
>>> =C2=A0=C2=A0 hw/pci-host/q35: Remove unused includes
>>> =C2=A0=C2=A0 hw/i386/pc: Clean up includes
>> Laurent, since this series is fully reviewed, can it go via
>> your qemu-trivial tree?
>=20
> I'll try but I'm not sure to have the time to do that before the softfree=
ze.

Ping :)

Paolo

