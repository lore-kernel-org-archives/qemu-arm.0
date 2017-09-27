Received: by 10.223.173.107 with SMTP id p98csp11998wrc;
        Wed, 27 Sep 2017 15:42:36 -0700 (PDT)
X-Received: by 10.55.120.129 with SMTP id t123mr4540675qkc.13.1506552156623;
        Wed, 27 Sep 2017 15:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506552156; cv=none;
        d=google.com; s=arc-20160816;
        b=HAcGa1UIsmAbTYey9/YMgKR0Gx7tHkM9Ku1nl9jLTon3+uNp18/OGa7oyhN5SG2KaB
         zlmefTstBk9XvS63qCdTwJYeWYLJjIxzdfysqjiljoUWJqJE+RVNpeeiZ9kEs7ZOvSwq
         7kVfzVbGS7XaUlRkxn7ayE8YUthT3UI1tCVDbvWRRhFI9ETx+f3BZou3cymx+/eeW+fn
         DhguLaysCe9hqfNN8fVU4Sn3VeAyxIp7ntgGMAZ1OOMmRuBUVAcvdKub3PWpMMNzLsQO
         KENYvvngfwzLM1Ynq0bpkDDxce35Px2EpMR39wXo7jsCH23xJGzI313JIYap9tngfl/q
         zSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=sdYUbeVZhZCzUw83teV/dkoe49F5oXI3kI/7kQ3DTCs=;
        b=sPGuJGaE4xSEaskJF/K+Ln2fk0Hhiv9W/UURYByf1RjrQEz2RBtFZdItLsWig22ULG
         aoWLPC6CzpnayLjBQo148z7qJhgdzzG5X9sCkzeg7odqJvAcj+TZuvzlpO5K46lt7Hh9
         As6Dd6ZOHHna4/+gsLApdnKJqOzNqYoKTntMS2ziaf9Lm1Q3tMP7XMezmIvcSZXpm/Gk
         BKRp/V2O+7doioTRI5UxlteJ7D8vaaBf5Rqik5JQv07D1t4VVV3ULY1a2GJSjhkMXhjO
         enHLNdoEchxjPW5PeOulH1sJb3iIFyKevpKA6t8gTtxYc58DT3vRPsxc4k3Mw519K9VZ
         EsYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UOWfAFvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i1si64630qkc.127.2017.09.27.15.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 15:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UOWfAFvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxL2I-000545-8L
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 18:42:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxL1s-0004sv-8u
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 18:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxL1q-0007VF-Fp
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 18:42:08 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:35523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dxL1i-0007LH-Ag; Wed, 27 Sep 2017 18:41:58 -0400
Received: by mail-wr0-x244.google.com with SMTP id n64so6758859wrb.2;
	Wed, 27 Sep 2017 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=sdYUbeVZhZCzUw83teV/dkoe49F5oXI3kI/7kQ3DTCs=;
	b=UOWfAFvKgU4ObkVwUE+Ukl3L9jK+OKyUxSWrz517I2Wf0ASf3r32dPZPotd9flnkco
	VaERC9Q9Ua935wPZRnnRoOdliKU44sYZiFQP1V9oOPn60PwYfnezqnah4cfmWNoJsyAc
	6pGs/7Dh9/3aZVJKR2x5l42ltSebMRjh2vU7hbtZOdUHoglIHlaaucuKjcGylYrAIIxs
	3D4xbbG4t/seTWlyR/0wp32LcFIqMJYNCdyDuwzGNa3BACLsp8FTGSvL6SQjQavGN1rg
	9RJM884fVW1L0BQDYywFm6vHXIqn1Uwm1qmfaGul6tn+9x5hItwODU0Vo4RXg/RHQUHn
	wqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=sdYUbeVZhZCzUw83teV/dkoe49F5oXI3kI/7kQ3DTCs=;
	b=XKbAIyqoiHGsDnjoTpesJA+rHJQ/pgpbbQn+Ul/eFa0pxjD4YyqFKu1AzmTJ2NuIU9
	+m4GUaN2RBRLsHrLDW1ya4Q3KJ6eijKhsq6e+p6pt9Fo+kivNLbvUslKUs1YX3IyB4FB
	6aKB9UQXz4DwMm+7WpPPfO56AIuQbjj9XHDyOR1IdAQ5jZ3kmNG+UHnOgCunc42kNrGV
	ZmAupd/962a7mIEOwk/FYqF+rlhDVDZao7lSUcdGvPdzEI08rhq/RjGbHv63tBV8wAzV
	6EAShl3JvAGr7vn3PmmWq1SmWnQQmIacAd06JyXNyeTRx4XZgfCjjW51m2ubMzDucjIO
	AlOA==
X-Gm-Message-State: AHPjjUj2mDYUD5u4sZe7G9uE+slVW6+stkbafkSgb6t5fOY1k0Oku7o4
	touhgO41PBOVwg/sXnvLlFWGHgXfqEdl6M4I2jA=
X-Google-Smtp-Source: AOwi7QAp0LILoqKtaPluU/r7ELsiQeueETWZ/0IyV94YdUN1HcCo6UDYqPgvIh6QlO/X4kivcUCYpIAn2qAZHxf272M=
X-Received: by 10.223.169.143 with SMTP id b15mr3002426wrd.127.1506552117045; 
	Wed, 27 Sep 2017 15:41:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Wed, 27 Sep 2017 15:41:26 -0700 (PDT)
In-Reply-To: <1d317e5b-9de9-9186-1c00-573ca96f3d25@tuxfamily.org>
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<bf3dd056ce55cbea81ca762c3c40d22683a542e7.1506384414.git.alistair.francis@xilinx.com>
	<1d317e5b-9de9-9186-1c00-573ca96f3d25@tuxfamily.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 27 Sep 2017 15:41:26 -0700
X-Google-Sender-Auth: 4CpEOc9u8p_tS483Wm4BKbYrhnM
Message-ID: <CAKmqyKMfPtPmRNbK52ATwu+rvHY-A5=Bnf3QaDBV=9FvGDUUkQ@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 3/8] hw: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jia Liu <proljc@gmail.com>, qemu-block@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	Stafford Horne <shorne@gmail.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Paul Burton <paul.burton@imgtec.com>,
	Chris Wulff <crwulff@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P42UqUy80KA3

On Mon, Sep 25, 2017 at 8:51 PM, Thomas Huth <huth@tuxfamily.org> wrote:
> On 26.09.2017 02:08, Alistair Francis wrote:
>> Replace a large number of the fprintf(stderr, "*\n" calls with
>> error_report(). The functions were renamed with these commands and then
>> compiler issues where manually fixed.
>>
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|err=
or_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error=
_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_rep=
ort("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_repor=
t("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report(=
"\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\=
1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"=
\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2=
);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);=
|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|I=
g}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}=
' \
>>     {} +
>>
>> Some lines where then manually tweaked to pass checkpatch.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: Andrzej Zaborowski <balrogg@gmail.com>
>> Cc: Jan Kiszka <jan.kiszka@web.de>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Thomas Huth <huth@tuxfamily.org>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: John Snow <jsnow@redhat.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Alexander Graf <agraf@suse.de>
>> Cc: Michael Walle <michael@walle.cc>
>> Cc: Paul Burton <paul.burton@imgtec.com>
>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
>> Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
>> Cc: Anthony Green <green@moxielogic.com>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Chris Wulff <crwulff@gmail.com>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Jia Liu <proljc@gmail.com>
>> Cc: Stafford Horne <shorne@gmail.com>
>> Cc: Marcel Apfelbaum <marcel@redhat.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Fabien Chouteau <chouteau@adacore.com>
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-block@nongnu.org
>> Cc: xen-devel@lists.xenproject.org
>> Cc: qemu-ppc@nongnu.org
>> ---
>>
>>  hw/arm/armv7m.c                 |  2 +-
>>  hw/arm/boot.c                   | 34 +++++++++----------
>>  hw/arm/gumstix.c                | 13 ++++----
>>  hw/arm/mainstone.c              |  7 ++--
>>  hw/arm/musicpal.c               |  2 +-
>>  hw/arm/omap1.c                  |  5 +--
>>  hw/arm/omap2.c                  | 21 ++++++------
>>  hw/arm/omap_sx1.c               |  6 ++--
>>  hw/arm/palm.c                   | 10 +++---
>>  hw/arm/pxa2xx.c                 |  7 ++--
>>  hw/arm/stellaris.c              |  3 +-
>>  hw/arm/tosa.c                   | 17 +++++-----
>>  hw/arm/versatilepb.c            |  2 +-
>>  hw/arm/vexpress.c               |  8 ++---
>>  hw/arm/z2.c                     |  6 ++--
>>  hw/block/dataplane/virtio-blk.c |  6 ++--
>>  hw/block/onenand.c              |  8 ++---
>>  hw/block/tc58128.c              | 44 ++++++++++++-------------
>>  hw/bt/core.c                    | 15 +++++----
>>  hw/bt/hci-csr.c                 | 17 +++++-----
>>  hw/bt/hci.c                     | 30 ++++++++---------
>>  hw/bt/hid.c                     |  2 +-
>>  hw/bt/l2cap.c                   | 47 ++++++++++++++-------------
>>  hw/bt/sdp.c                     |  7 ++--
>>  hw/char/exynos4210_uart.c       |  6 ++--
>>  hw/char/mcf_uart.c              |  5 +--
>>  hw/char/sh_serial.c             |  9 +++---
>>  hw/core/loader.c                | 31 +++++++++---------
>>  hw/core/ptimer.c                |  7 ++--
>>  hw/cris/axis_dev88.c            |  3 +-
>>  hw/cris/boot.c                  |  5 +--
>>  hw/display/blizzard.c           | 20 ++++++------
>>  hw/display/omap_dss.c           | 14 ++++----
>>  hw/display/pl110.c              |  2 +-
>>  hw/display/pxa2xx_lcd.c         |  2 +-
>>  hw/display/qxl-render.c         |  7 ++--
>>  hw/display/qxl.c                | 10 +++---
>>  hw/display/tc6393xb.c           | 36 ++++++++++++---------
>>  hw/display/virtio-gpu-3d.c      |  4 +--
>>  hw/display/vmware_vga.c         | 22 ++++++-------
>>  hw/dma/omap_dma.c               | 26 ++++++++-------
>>  hw/dma/soc_dma.c                | 37 ++++++++++-----------
>>  hw/gpio/omap_gpio.c             |  2 +-
>>  hw/i2c/omap_i2c.c               | 10 +++---
>>  hw/i386/kvm/apic.c              |  9 +++---
>>  hw/i386/kvm/clock.c             |  7 ++--
>>  hw/i386/kvm/i8254.c             |  7 ++--
>>  hw/i386/kvm/i8259.c             |  5 +--
>>  hw/i386/kvm/ioapic.c            |  5 +--
>>  hw/i386/multiboot.c             | 21 ++++++------
>>  hw/i386/pc.c                    | 18 +++++------
>>  hw/i386/pc_piix.c               |  2 +-
>>  hw/i386/pc_sysfw.c              |  5 +--
>>  hw/i386/xen/xen-hvm.c           | 32 +++++++++---------
>>  hw/i386/xen/xen-mapcache.c      | 12 +++----
>>  hw/i386/xen/xen_apic.c          |  2 +-
>>  hw/ide/ahci.c                   |  6 ++--
>>  hw/ide/core.c                   |  2 +-
>>  hw/input/lm832x.c               |  6 ++--
>>  hw/input/pckbd.c                |  3 +-
>>  hw/input/pxa2xx_keypad.c        |  2 +-
>>  hw/input/tsc2005.c              | 17 +++++-----
>>  hw/input/tsc210x.c              | 72 ++++++++++++++++++++--------------=
-------
>>  hw/input/virtio-input-hid.c     | 14 ++++----
>>  hw/input/virtio-input.c         |  5 +--
>>  hw/intc/arm_gic_kvm.c           | 12 +++----
>>  hw/intc/omap_intc.c             |  4 +--
>>  hw/intc/openpic.c               |  7 ++--
>>  hw/intc/openpic_kvm.c           |  8 ++---
>>  hw/intc/s390_flic_kvm.c         |  4 +--
>>  hw/ipmi/ipmi.c                  |  1 +
>>  hw/ipmi/ipmi_bmc_extern.c       |  5 +--
>>  hw/isa/isa-bus.c                |  7 ++--
>>  hw/lm32/lm32_boards.c           |  5 +--
>>  hw/lm32/milkymist.c             |  5 +--
>>  hw/m68k/an5206.c                |  4 +--
>>  hw/m68k/mcf5206.c               |  3 +-
>>  hw/m68k/mcf5208.c               |  7 ++--
>>  hw/microblaze/boot.c            |  2 +-
>>  hw/mips/boston.c                |  4 +--
>>  hw/mips/mips_fulong2e.c         |  4 +--
>>  hw/mips/mips_jazz.c             |  4 +--
>>  hw/mips/mips_malta.c            |  4 +--
>>  hw/mips/mips_mipssim.c          |  4 +--
>>  hw/mips/mips_r4k.c              |  6 ++--
>>  hw/misc/a9scu.c                 |  3 +-
>>  hw/misc/omap_gpmc.c             | 11 ++++---
>>  hw/misc/omap_l4.c               |  5 +--
>>  hw/misc/omap_sdrc.c             |  3 +-
>>  hw/misc/vmport.c                |  2 +-
>>  hw/moxie/moxiesim.c             |  7 ++--
>>  hw/net/fsl_etsec/etsec.c        |  2 +-
>>  hw/net/pcnet.c                  |  2 +-
>>  hw/net/smc91c111.c              |  5 +--
>>  hw/net/vhost_net.c              | 16 ++++-----
>>  hw/nios2/boot.c                 |  2 +-
>>  hw/nvram/eeprom93xx.c           |  5 +--
>>  hw/nvram/fw_cfg.c               |  4 +--
>>  hw/openrisc/openrisc_sim.c      |  3 +-
>>  hw/pci-host/bonito.c            |  6 ++--
>>  hw/pci/pci.c                    | 10 +++---
>>  hw/ppc/e500.c                   | 20 ++++++------
>>  hw/ppc/mac_newworld.c           |  2 +-
>>  hw/ppc/mac_oldworld.c           |  2 +-
>>  hw/ppc/mpc8544_guts.c           |  5 +--
>>  hw/ppc/ppc405_boards.c          |  8 ++---
>>  hw/ppc/ppc440_bamboo.c          | 19 +++++------
>>  hw/ppc/ppc4xx_pci.c             |  3 +-
>>  hw/ppc/prep.c                   |  4 +--
>>  hw/ppc/virtex_ml507.c           |  4 +--
>>  hw/s390x/virtio-ccw.c           |  2 +-
>>  hw/scsi/lsi53c895a.c            |  4 +--
>>  hw/scsi/spapr_vscsi.c           | 49 ++++++++++++++--------------
>>  hw/scsi/virtio-scsi-dataplane.c |  6 ++--
>>  hw/sd/pl181.c                   |  5 +--
>>  hw/sd/sd.c                      | 14 ++++----
>>  hw/sh4/r2d.c                    |  9 +++---
>>  hw/sh4/sh7750.c                 | 64 ++++++++++++++++++----------------=
--
>>  hw/sparc/leon3.c                |  9 +++---
>>  hw/sparc/sun4m.c                |  8 ++---
>>  hw/sparc64/niagara.c            |  2 +-
>>  hw/sparc64/sun4u.c              |  9 +++---
>>  hw/ssi/omap_spi.c               |  5 +--
>>  hw/timer/omap_gptimer.c         | 11 ++++---
>>  hw/timer/twl92230.c             |  2 +-
>>  hw/timer/xilinx_timer.c         |  8 ++---
>>  hw/usb/core.c                   | 15 +++++----
>>  hw/usb/desc.c                   |  4 +--
>>  hw/usb/dev-audio.c              | 29 +++++++++--------
>>  hw/usb/dev-bluetooth.c          |  4 +--
>>  hw/usb/dev-mtp.c                |  9 +++---
>>  hw/usb/dev-network.c            | 20 ++++++------
>>  hw/usb/hcd-ehci.c               | 32 +++++++++---------
>>  hw/usb/hcd-musb.c               |  4 +--
>>  hw/usb/hcd-xhci.c               |  3 +-
>>  hw/usb/host-legacy.c            |  2 +-
>>  hw/watchdog/watchdog.c          |  9 +++---
>>  hw/watchdog/wdt_i6300esb.c      |  8 +++--
>>  hw/xen/xen-common.c             | 10 +++---
>>  hw/xen/xen_pt.c                 |  4 +--
>>  hw/xenpv/xen_domainbuild.c      | 24 +++++++-------
>>  hw/xenpv/xen_machine_pv.c       |  8 ++---
>>  142 files changed, 769 insertions(+), 705 deletions(-)
>
> This patch is IMHO way to big! Can you please break this down into the
> individual hw/* subsystems, so that people who are familiar with a
> certain subsystem have a chance to review just their part? Thanks.

Ok, will do in v2.

Thanks,
Alistair

>
>  Thomas
