Received: by 10.25.21.156 with SMTP id 28csp347242lfv;
        Thu, 18 Aug 2016 07:28:21 -0700 (PDT)
X-Received: by 10.55.58.68 with SMTP id h65mr2886093qka.210.1471530501409;
        Thu, 18 Aug 2016 07:28:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 58si1388224qtx.77.2016.08.18.07.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baOIu-0008Qx-SI
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:28:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baOH4-0007Qu-6D
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baOH2-0005lE-U0
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:26:26 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:34618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baOH2-0005kv-OZ
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:26:24 -0400
Received: by mail-ua0-x235.google.com with SMTP id k90so30688866uak.1
	for <qemu-devel@nongnu.org>; Thu, 18 Aug 2016 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xua4UP391QJCY2djj9+aMQAArRkc1GUuFx1J1It28ns=;
	b=YRmSgJHSpJMtKbYu/cMknkGckMdlff6RgZIIRiysHxKsXsa1KLmYeU70Pr+mJEBmxZ
	3h2H72CyHZRrNA9cY87IyChX+gXa4zzPqyNRN2ybJ1zF3RlvWt6cfGQRZ4TFQx4XhQ88
	4RUqhTW5b68SXhMNV6CepkzzJA55c+Zaa6sWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xua4UP391QJCY2djj9+aMQAArRkc1GUuFx1J1It28ns=;
	b=N+vaB/846BvGThoCPaZabquaZA6BtcDCetxvjEz/PjgGDq6GXz1YAADu1EhAdKllpj
	gGXx+u5q2uY71dZvU49ziUQzJZzUYdLNKUkOaQd4xeGCdvgtYRUwtZl+qvG91v7OGhc6
	z+PdFESaCQ7nxeH6tizlncczqn7bRA3wVfZbWTyvKx9YptJ19toD+TbDyU7YGSOHblx3
	iUa0C0ICHgjuBtMEPCzcWjnpACcQyKMLCs6Ojmfx8/mCOJNk6VUHy11/Ck4UzNsQsatW
	v9wrobJ+VABmoNZ9KQcgyp5vbvFT/1lrA8zCD+3HLz7Cz08YNtGW13k8c1sMbVMXXwbW
	0m1w==
X-Gm-Message-State: AEkoousUah+nd7NCvRBtQNdWBjjcw/hajef3iC6FStxxRBF8vYh8GoftnpMyQ6m6WWKl/LBoXCI42340phfj2h5x
X-Received: by 10.176.80.4 with SMTP id b4mr1156645uaa.17.1471530384223; Thu,
	18 Aug 2016 07:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Thu, 18 Aug 2016 07:26:03 -0700 (PDT)
In-Reply-To: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
References: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2016 15:26:03 +0100
Message-ID: <CAFEAcA9oAi5++H0eYiE-SyHMtLFmD5haw+d0DsN+MLo29f9U_A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-devel] hw/arm/virt: vmstate-static-checker.py results
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
Cc: Amit Shah <amit.shah@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	David Gilbert <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eN1MiQ5lb5BT

On 18 August 2016 at 15:00, Andrew Jones <drjones@redhat.com> wrote:
> We've recently started versioning mach-virt, v2.6 was the first versioned
> release. As an effort to try and make sure we're doing things right, I
> tried the vmstate-static-checker.py script. I compared a 2.6 machine
> from a QEMU built from the v2.6.0 tag with a 2.6 machine from a QEMU
> built from today's latest pull (5844365fe8). I see lots of errors. I have
> no experience in this area, so I can't even state whether they're truly
> a concern or not. I can say a few things;
>
>  1) Most of the errors look like the same problem. Something is wrong
>     with xilinx_spi state, which shows up everywhere. Here's an example
>
> Section "en25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest

Well, something here is weird, because en25q64 and nonvolatile_cfg
aren't part of xilinx_spi at all, they're in hw/block/m25p80.c.

However we don't care about migration compatibility in the Xilinx
boards at all, so the simple fix is just not to try to test them.
Similarly, aspeed and imx are boards where we're not trying to
preserve migration compat.

>  2) Several of the remaining problems are also present on a check of the
>     x86_64 pc-i440fx-2.6 machine type. To be precise
>
> Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest

Looking at just the e1000 for an example, this is a false positive
in your checker. In commit 093454e2 the struct we're putting the
ipcss/ipcso/etc fields was moved, so:

-        VMSTATE_UINT8(tx.ipcss, E1000State),
-        VMSTATE_UINT8(tx.ipcso, E1000State),
-        VMSTATE_UINT16(tx.ipcse, E1000State),
-        VMSTATE_UINT8(tx.tucss, E1000State),
-        VMSTATE_UINT8(tx.tucso, E1000State),
-        VMSTATE_UINT16(tx.tucse, E1000State),
-        VMSTATE_UINT32(tx.paylen, E1000State),
-        VMSTATE_UINT8(tx.hdr_len, E1000State),
-        VMSTATE_UINT16(tx.mss, E1000State),
+        VMSTATE_UINT8(tx.props.ipcss, E1000State),
+        VMSTATE_UINT8(tx.props.ipcso, E1000State),
+        VMSTATE_UINT16(tx.props.ipcse, E1000State),
+        VMSTATE_UINT8(tx.props.tucss, E1000State),
+        VMSTATE_UINT8(tx.props.tucso, E1000State),
+        VMSTATE_UINT16(tx.props.tucse, E1000State),
+        VMSTATE_UINT32(tx.props.paylen, E1000State),
+        VMSTATE_UINT8(tx.props.hdr_len, E1000State),
+        VMSTATE_UINT16(tx.props.mss, E1000State),

but the on-the-wire format doesn't include the names of the C struct
fields so this isn't a migration break.

>     x86 only has three additional messages, which look harmless to me
>
> Section "apic-common" does not exist in dest
> Section "apic" does not exist in dest
> Section "kvm-apic" does not exist in dest
>
>  3) I analyzed one error I saw, and see it should be fine, as the device
>     simply went from unmigratable to migratable (for TCG anyway)
>
> Section "arm-gicv3-common" Section "arm-gicv3-common" Description "arm_gicv3": minimum version error: 0 < 1

Yep, that should be fine.

thanks
-- PMM
