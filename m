Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp975197wre;
        Wed, 23 May 2018 10:46:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJqWidJ22b5C1Km9VsMJxspsl/ijHozfUo+/tTA1xVdJLuUPMs4xt8GZongNSyY0YPKjTPS
X-Received: by 2002:a37:9782:: with SMTP id z124-v6mr3467407qkd.214.1527097568271;
        Wed, 23 May 2018 10:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527097568; cv=none;
        d=google.com; s=arc-20160816;
        b=NjyQnsU/FFszDkzeidDUJ5Ar11MJsOVeIWWl6lB58YkGGwefwKUVqkvCquiOmH9eyW
         Bx9hIAAw/+yASMp8fPdZvPhLmJmeVC0lkUzCwJlNw2QnFtN2SSL19wM92vXQ5kyuLDzx
         +YIPubJS4I/9/QyoqeyFIkksteyq3j0Lv7U4jrUTvcs7ohOQ+vvFji6NisCboZGBYTCk
         Gc2i8gXFxATe0Dki9R5ayrxt6rwnEWKX9xTyKxYWglOeeq1bqrxWPEtiz0+xlp5yEE/h
         ksU2X7qbnko6tn4kyuXlLCR8VC8fQpujUuQomiKuTGmWTGXomw/2zQ92BX43DNUkCBiB
         jblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=k8l8ElwizZd4hIQrer7lDG2IxwP+83Tz/ME4mxtmarE=;
        b=St8bPSwAqX8mL+9ol7qDcRox4D/8WiX9WSEhT5ikBIJQRGYEMbgKxvdI8o3RdHdeiz
         s5vHlb/cEBcSfgLnPfJVfDMLm3zgcyvt+E8mZ3u39jXfnahVe/xrBup+A36jK6DR3ADq
         GwrylPpoqQEPArC8DfspxzXgurGy9qiXGwxJJVhtJUB/Q8dwkk9OcudMpaet4rWGV/8s
         o9uERSXl+QY4x4oBRjiUDvPAY3F++aJ1hqbuGC0fGRL2YVTr0siGF2Sl8wi1qKLjFoJp
         xjUnw6s8v8fLNjYYXN6MOaNw0CPtRd/+ZvGngERFPaSpmE9A89ppLQkvyKvAqMkCPw6u
         GQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b75-v6si3702295qkc.118.2018.05.23.10.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 10:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLXpv-0001m4-S6
	for alex.bennee@linaro.org; Wed, 23 May 2018 13:46:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLXpl-0001ly-Bq
	for qemu-arm@nongnu.org; Wed, 23 May 2018 13:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLXph-0001pZ-Gb
	for qemu-arm@nongnu.org; Wed, 23 May 2018 13:45:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38098 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fLXph-0001pK-Ba; Wed, 23 May 2018 13:45:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8A79BD98;
	Wed, 23 May 2018 17:45:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-208.rdu2.redhat.com
	[10.10.120.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD8AD6466E;
	Wed, 23 May 2018 17:45:45 +0000 (UTC)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
Date: Wed, 23 May 2018 19:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 23 May 2018 17:45:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 23 May 2018 17:45:52 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 0/2] ARM virt: Support up to 256 PCIe buses
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uYzozANOHJWu

Hi Eric,

On 05/23/18 18:03, Eric Auger wrote:
> Current Machvirt PCI host controller's ECAM region is 16MB large.
> This limits the number of PCIe buses to 16.
>
> PC/Q35 machines have a 256MB region allowing up to 256 buses.
> This series tries to bridge the gap.
>
> It declares a new ECAM region located beyond 256GB, of size 256MB
> (just after the hypothetical new GICv3 RDIST region). The new
> ECAM region is used as soon as the highmem option is set (default)
> and disabled for machines older than 3.0.
>
> Best Regards
>
> Eric
>
> Git: complete series available at
> https://github.com/eauger/qemu/tree/v2.12.0-256MB-ECAM-RFCv1
>
> - Tested with guest running in aarch64 and aarch32 modes (aarch64=off)
> - In aarch32 mode I encountered the issue the vmalloc region may be
>   reported too small for the needs (dmesg excerpt below). So I had to
>   extend the vmalloc size by passing the "vmalloc=512M" option to the
>   bootargs and this eventually booted fine.
>
> [    1.399581] pl061_gpio 9030000.pl061: PL061 GPIO chip @0x0000000009030000 registered
> [    1.402636] OF: PCI: host bridge /pcie@10000000 ranges:
> [    1.404506] OF: PCI:    IO 0x3eff0000..0x3effffff -> 0x00000000
> [    1.406606] OF: PCI:   MEM 0x10000000..0x3efeffff -> 0x10000000
> [    1.408690] OF: PCI:   MEM 0x8000000000..0xffffffffff -> 0x8000000000
> [    1.411992] vmap allocation for size 1052672 failed: use vmalloc=<size> to increase size
> [    1.414895] pci-host-generic 4010000000.pcie: ECAM ioremap failed
> [    1.427472] pci-host-generic: probe of 4010000000.pcie failed with error -12
>
> - Maybe this issue deserves introducing a new highmem_ecam option?

I refer to my earlier email here:

  http://mid.mail-archive.com/13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com

This series flips the sole ECAM range that is exposed to the guest to a
large one that is located above 4GB. That's a problem because -- to my
understanding -- it breaks 32-bit ARM UEFI builds, unless you change the
QEMU command line.

(1) Please enable the "firmware repo" from Gerd's site:

https://www.kraxel.org/repos/

(2) Please install the "edk2.git-arm" package.

(3) Please run the 32-bit ARM UEFI firmware, with qemu-system-aarch64,
in a separate directory, as follows (note: TCG only, KVM not needed):

  cp /usr/share/edk2.git/arm/vars-template-pflash.raw vars
  FWBIN=/usr/share/edk2.git/arm/QEMU_EFI-pflash.raw

  qemu-system-aarch64 \
    -nodefaults \
    -no-user-config \
    \
    -M virt \
    -cpu cortex-a15 \
    -m 1024 \
    \
    -drive if=pflash,format=raw,file=$FWBIN,readonly \
    -drive if=pflash,format=raw,file=vars \
    \
    -device virtio-gpu-pci \
    -device qemu-xhci \
    -device usb-kbd \
    \
    -chardev stdio,signal=off,mux=on,id=char0 \
    -mon chardev=char0,mode=readline \
    -serial chardev:char0

This will boot the UEFI shell for you in a graphical window and take
input from the keyboard in that window. A virtio-gpu-pci device is used
as GPU (a PCI Express virtio device) and a USB3.0 keyboard is used as
human input device (the USB3.0 controller is also PCI Express).


I didn't test it, but I expect that this series, when applied as-is,
will break the above use case, unless highmem is explicitly disabled.

I think the first patch is OK (modulo the runaway empty line at the end
of acpi_dsdt_add_pci()), while realizing my review cannot be complete.
:)

Regarding the second patch, I do believe we need "more sophistication"
there. For example, I guess it could be possible to distinguish "-cpu
cortex-a15" from "-cpu cortex-a57" somehow, and stick with the low/small
ECAM in the former case. (The 32-bit firmware already runs on cortex-a15
only, and not on cortex-a57, according to my testing.)

Thanks,
Laszlo
