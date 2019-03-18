Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2335986wrt;
        Mon, 18 Mar 2019 06:03:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnd35JU/EdT9k3YEjpgr6BcBVQ/FRlRVA6mpkRsqvoSroTbOrE2FZbvOVXBuHaeTx2wvcP
X-Received: by 2002:a1c:2dc9:: with SMTP id t192mr10719590wmt.119.1552914218508;
        Mon, 18 Mar 2019 06:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552914218; cv=none;
        d=google.com; s=arc-20160816;
        b=07hD8x+M3F8guKyaL6yeH4fpgexWGt33MxNcsjYbx99jOdFT4UXplZ7iHPlJCcEU3Q
         zjzCnaSEkMBN4mMLFTj9RKxtqF3aRGkjKbhI3vAx3vLwNRZHn9PFNsjzfH4SD38VuhNe
         mEIYyCVyChMDgBVMkAPUtflNpp716W9+61jmD6AZSPe44F/3V6Ah6CSnP43oIPC5fqs+
         TgGN4wUDWCc6Nn2iDV+D0beNL5oIA4yu6Jke2WGiwORRxiXRlu9wQy9xD+I8qJMAKfys
         MWrApmQ+FRZC1CzfJxJjANph1m3L7RijCBy3LasfBXZHRVIGMUrhwJB3Pwr+H/6MNWVl
         KzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VRQGsOTNjz3Pd7pyedG9TcXUTsR6zWkIjmt5qIEsAts=;
        b=hPFWhz2+e1bdTyid7efa2Sy1SfiBf1fmgdE+4Y4/KlEY1nvZ3bBrlz9z4s7fnO5uyu
         IAVFsDYBnCbYofn2eFnpzsTo1h8UI8iQk75TPWUmV5otAd/EtxxuNe45wXYW5193T4p6
         2vWQli/f0EdJ+F2lWRH4GOLfYDS3ZFrGamUIsnJRq4hfYG66NtidaSRYqlEUp2EvSGLU
         XdmyYizHHzMdN5iFekX3sX8xQ+ollEObK457x6rhKvTlZAaZOGeKinqhw4TSQgs1ZRIA
         4R+EW1RtuogMuddhbD/SMII/WlLFL2ds+we/NTduBtpZ1V0IKKiS6BoPLAl9ksE9NZ8z
         tdTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z7BGvG5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si7233101wrs.29.2019.03.18.06.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 06:03:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z7BGvG5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:41261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5rvV-00015b-Gx
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 09:03:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h5rv7-0000zj-5V
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 09:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h5rqC-0003aP-QT
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 08:58:09 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:45587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h5rqC-0003Zd-EO
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 08:58:08 -0400
Received: by mail-ot1-x32b.google.com with SMTP id i12so14261300otp.12
	for <qemu-arm@nongnu.org>; Mon, 18 Mar 2019 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VRQGsOTNjz3Pd7pyedG9TcXUTsR6zWkIjmt5qIEsAts=;
	b=Z7BGvG5cZklt4U5fHelYsEEIUx8zHRi7euzUKolCu/2kgd2fwN3OrWnCfFKe/t3htt
	cYnkGGkG4K2AUu/lFB3PUklzF+IOhxg+93ZWD25q9FEScWc2m1eQzTodxjd++dcu+DYU
	9Sj2sdZISLL38bfPUa7M7LWaC3cLGmtwWzYiON5i7cBw9P/HNXAQkWSvRKCjmKaCy+++
	MPBHyw9IjrMBdhnhQz/m7Tz2Cc/mix9ren5bKtE8Wv6EcutxN9uDDZmyUQOBrbwOXNPK
	mgpslB4SoVFQKF4P+HH+WUTuZWMHdTF2HxhY1l5sIGTYVX47dwGOdF5fsQWr0foIjbdl
	AvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VRQGsOTNjz3Pd7pyedG9TcXUTsR6zWkIjmt5qIEsAts=;
	b=b1pGg5r+7xbftcF2e6oxXmIQhpol6YoNkTOp/wYJi7r+7Wy09zYVJt6Fsoq0YnAxke
	hgKuMilOdUU0tj3JE+V7dpRyfAOhmcEhy2tG0iBZrKyrYvPSRlFLguvnNzmqf+Ui7cHY
	wxtzXlszwRNwaMT6OvPH/3Zo+jrP+/kiUkqHh0OJyV2xKVaRIlkMS8UDxzavXMBl3zgt
	1Fs8wIS8k3e613VvAiyLJdDMBsFm/PzyL5A3egk4xQOnrvI7ah+qMBh65H9YZ145CiDN
	2SisdfaCmh2DaORlTPYfygC23s+1C9RrVUghR9ghZy4FHSYfIUwD96pJz0BvWEQIQHU1
	scJg==
X-Gm-Message-State: APjAAAUnI65fnXoWDT59phqw24H2EKGkUzsP+0zmhpb+/EdOgrcIiqsl
	Ck6qbpoxDfFuc/4/2mec2bXYGhtyeQOdjonaPfEiOA==
X-Received: by 2002:a9d:7a4a:: with SMTP id z10mr9855377otm.363.1552913887442; 
	Mon, 18 Mar 2019 05:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABQjfmMThKjQ-Fn0KqqdxBEiWkwS_0-VnrWLySrQU4LCoETv=A@mail.gmail.com>
In-Reply-To: <CABQjfmMThKjQ-Fn0KqqdxBEiWkwS_0-VnrWLySrQU4LCoETv=A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Mar 2019 12:57:55 +0000
Message-ID: <CAFEAcA_vuCuNUuAu6U1ECHiLvYPtMj+mKAM=x3X4CcKKFsurOw@mail.gmail.com>
To: Madhusudan A <madhusudan.bit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-arm] Boot QEMU Arm from NAND Flash
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xLhjBcSwTEif

On Mon, 18 Mar 2019 at 12:10, Madhusudan A <madhusudan.bit@gmail.com> wrote:
> I am relatively new to the embedded domain and ARM architecture
>
> I have devices that use a dual bank NAND flash. The flash has 18 partitions. The project creates the kernel images (zImage and uImage), a u-boot.bin and 4 different filesystems that are loaded onto different partitions (MTD).
>
> I have tried a lot of things to try and use qemu to emulate this. The board being used is very old (Marvell PXA166), so I am using machine type as virtual.
>
> Somehow, even if I just specify the kernel image, QEMU just starts and shows the QEMU prompt. It never attempts to load the kernel or anything.

The most important thing to understand about arm embedded
systems is that they are all very different at the hardware
level. They have RAM at different physical addresses, they
have different devices even for simple things like the serial
port, and so on. This is not like the x86 world, where every
x86 board is basically the same as a desktop PC.

The result of this diversity is that you cannot take a
kernel for board A and run it on board B, unless the
kernel was specifically compiled with support for both
boards A and B. This applies both for trying to run a
kernel on real hardware, and also for running a kernel
on emulated hardware such as that which QEMU provides.
If you try to boot a kernel which doesn't support the hardware
it's being run on, then the most usual outcome is that the
kernel crashes before even being able to print anything out
to the serial port -- so you just see a blank screen in QEMU.

So you need to make sure you pick a QEMU machine model
which matches what the kernel you're booting wants.
If QEMU does not have a model of the specific hardware
your kernel requires, then unfortunately you're out of
luck: your kernel will not boot on QEMU. You would need
to write an emulation of your hardware's board, SoC and
devices to get it to work -- this is a lot of effort.

In this particular case QEMU doesn't have a PXA166 CPU
emulation either -- we only have the later PXA2xx CPUs --
so you would also probably need to adjust the CPU emulation.

thanks
-- PMM
