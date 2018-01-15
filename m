Received: by 10.28.173.206 with SMTP id w197csp2517139wme;
        Mon, 15 Jan 2018 01:39:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBos00mOaRj5OpgSx3YUDB5yYEPgCOLaxf5dL2xwKlFsp7SUYPf8Cz6UBu0XXIdcEc25UtGDt
X-Received: by 10.37.191.138 with SMTP id l10mr11980529ybk.350.1516009140649;
        Mon, 15 Jan 2018 01:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516009140; cv=none;
        d=google.com; s=arc-20160816;
        b=CH5QvD0mS7jLtzPH5ourt5B6Y1DzklID/oEUbl4ys33zFD/jgdXvcGpAYJG6hz09As
         eVrLkUIdeMzXxRHCQNyG6jPVMs8Z1gyud73TZLNgiWF5FSU1DqrovLL4a9jz6iauk97P
         GDfRf6BfzvyylIQjmMX8BWPg0YtEuWVftSJ3JkPFJ3zIXpTUy0GcDYIF0CSxsFSOI667
         +UHr/wG+Ae8jMbwSWZnEIUYJ7urKuaBC4CXirpUjYtdp1Pj06N+Yse3BwvHaZynUSP9G
         jQ7DTlsS5n8fk9M2Jz7tV42tVppcyvezVI+m3dyD6US4alURhZFc6BFRgYT2+K7/njeJ
         AwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Os1+Xaz69hkcNb0E9r2N94Yytv9DLPTTr8wz4hofO8M=;
        b=X664OvftGIZohaMjDh2aXG/o0y2/SSHfJ0qxEyrEsE1Ka+NibZrXTRxno6EzZ4Ys80
         1ebryF632Fd+RUcQD9YPvrNHr+hFfUJRx+PvoBMJ9LRGw8Ey5wwqZMBfkNXQEQdKzQ3u
         2ZvxpgR5Cs9i6bhPEPrDcpfYDH+hYpdhXXh4H10eMvGzLg7R/xQj/GEbY6bbVocsiB2k
         1y2C8S6H8gbdU6YN5b0Xct51RwdXMPcleb2Ek/EOz/rUIN7OxuaWX9pAqeTUnFgnIb7E
         YB9CoGbaqvLbg+BjSzTxngSQIL0/00zf616pFHthR5XR7k7+gyornhD4P1Ev0Qm+zirp
         GvUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w11si6024973ybi.749.2018.01.15.01.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 01:39:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb1EK-0004ej-3B
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 04:39:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eb1CP-0003Qu-Io
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 04:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eb1CO-0007xi-Jh
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 04:37:01 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:56452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eb1C8-0007fd-0K; Mon, 15 Jan 2018 04:36:44 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MYoWQ-1eOFZg3Unq-00VN6t; Mon, 15 Jan 2018 10:35:47 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
References: <20180114020412.26160-1-f4bug@amsat.org>
	<20180114020412.26160-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b5c64f47-26ae-3a80-4162-23ca411fd9c5@vivier.eu>
Date: Mon, 15 Jan 2018 10:35:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180114020412.26160-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:WKmV32zAOiQWR6nvbQXqUoEgj+V26qHkD4N3JhLbINjamx+Lh35
	PzloyvQ3l31afdhcNKZKoXD79fmlX0iCM9fj08PPtkLriQVCXJewy8OyMn2qC+cD+g1s1s0
	DxiZ3OxvjIiwCIwqTlBHRRmK1aZCJGQCuVOIRReiA5L9UoJ3vJy/iB/6Dtq+LvuxLJR32sx
	IZtVgSMg9Q28s3A14dvgg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:pbK/HXxKDs8=:jweRcZiJzn/O5+4Qy/+GuJ
	FllevSS09tuccq5MPlPYNL3G+8O0I0B1/3fHNqaV/h+paRRFUyDGm1tnq9l6LuavAH3EQhRRH
	HBI3Jrv47e3iaU5ya78Lpjj5C4393kBngLQBp8b2DsydUvNOH/hWel4BYtOdgjjzgE9qDHAwD
	9gdxI8aCqdNazqpb9snZlCFCXqmU+qbJohiXpSoAivfteeKn2fAH0dipOl6ez0tBslSoBTNYH
	mFg+4lzoJbnYcjoJ6KXeMmR7vTFt4dGsMSqjhNGVn9BipwOFAzG4k6TZmXR58+0w7TWddrPIR
	Pj3jHix6EGCJDacalk01DN/6p5u1K39lTqax7kruISZ9RyQy3/P7IKZ3IYRWjGdhGvJCgvNLD
	mmI5Ygm1RIT5kjPtZN+uMqQGCR9IRhaznFP50EpyQAatKrmFEX9EWWObOZ6CnTnKfjI4r0RkX
	kTuOMNmtfRsYO0FHPn11d2Ou+FTUP5WeG1LaBIeGBN1HASjFPf9Rq2vO+6k7SJiP7mN93QlE8
	ZIt6lof/qFh8RvD7PZOJ/6OgJpZXj18WUnkN7Jbw+YyPeXKnJrGoBo2C9S9t/DCN1CEueW1Va
	NbUPsAZzq9SbyUYwz3nfxNpejX81/fTuRXTOXFUGRZ48VN49Hv5/PO/CBcbJUgo8alBUj+x8W
	7twyvTwpw+8pIxhjaVPZ+AlB5uVJCWK8G7orUJmLfiEJbh9hiV7/HalkBtGGlG4hzR5Ydhdoy
	V5qxcwpjJHZqjjLzLOFSzdWmNHTrug1sntxgvJeBMLmnbDoUa4DaJL/XpBw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-devel] [RFC PATCH 3/3] qdev: use
 device_class_set_parent_realize/unrealize/reset()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Dmitry Fleytman <dmitry@daynix.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Fam Zheng <famz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"open list:ARM cores" <qemu-arm@nongnu.org>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, "open list:S390" <qemu-s390x@nongnu.org>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sry5FTkbGL/b

Le 14/01/2018 à 03:04, Philippe Mathieu-Daudé a écrit :
> changes generated using the following Coccinelle patch:
> 
>   @@
>   type DeviceParentClass;
>   DeviceParentClass *pc;
>   DeviceClass *dc;
>   identifier parent_fn;
>   identifier child_fn;
>   @@
>   (
>   +device_class_set_parent_realize(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn = dc->realize;
>   ...
>   -dc->realize = child_fn;
>   |
>   +device_class_set_parent_unrealize(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn = dc->unrealize;
>   ...
>   -dc->unrealize = child_fn;
>   |
>   +device_class_set_parent_reset(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn = dc->reset;
>   ...
>   -dc->reset = child_fn;
>   )
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/kvm/i8254.c                | 4 ++--
>  hw/i386/kvm/i8259.c                | 3 +--
>  hw/input/adb-kbd.c                 | 4 ++--
>  hw/input/adb-mouse.c               | 4 ++--
>  hw/intc/arm_gic.c                  | 3 +--
>  hw/intc/arm_gic_kvm.c              | 7 +++----
>  hw/intc/arm_gicv3.c                | 3 +--
>  hw/intc/arm_gicv3_its_kvm.c        | 3 +--
>  hw/intc/arm_gicv3_kvm.c            | 7 +++----
>  hw/intc/i8259.c                    | 3 +--
>  hw/net/vmxnet3.c                   | 4 ++--
>  hw/pci-bridge/gen_pcie_root_port.c | 3 +--
>  hw/scsi/vmw_pvscsi.c               | 4 ++--
>  hw/timer/i8254.c                   | 3 +--
>  hw/vfio/amd-xgbe.c                 | 4 ++--
>  hw/vfio/calxeda-xgmac.c            | 4 ++--
>  hw/virtio/virtio-pci.c             | 4 ++--
>  target/alpha/cpu.c                 | 4 ++--
>  target/arm/cpu.c                   | 4 ++--
>  target/cris/cpu.c                  | 4 ++--
>  target/hppa/cpu.c                  | 4 ++--
>  target/i386/cpu.c                  | 8 ++++----
>  target/lm32/cpu.c                  | 5 ++---
>  target/m68k/cpu.c                  | 5 ++---
>  target/microblaze/cpu.c            | 5 ++---
>  target/mips/cpu.c                  | 5 ++---
>  target/moxie/cpu.c                 | 5 ++---
>  target/nios2/cpu.c                 | 4 ++--
>  target/openrisc/cpu.c              | 5 ++---
>  target/ppc/translate_init.c        | 8 ++++----
>  target/s390x/cpu.c                 | 4 ++--
>  target/sh4/cpu.c                   | 4 ++--
>  target/sparc/cpu.c                 | 4 ++--
>  target/tilegx/cpu.c                | 4 ++--
>  target/tricore/cpu.c               | 4 ++--
>  target/unicore32/cpu.c             | 4 ++--
>  target/xtensa/cpu.c                | 4 ++--
>  37 files changed, 73 insertions(+), 88 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

