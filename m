Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DA5ECD991
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 17:15:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo2x6-0001iI-1A; Thu, 05 Feb 2026 12:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vo2x3-0001f6-Ro
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 12:15:33 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vo2x1-0006vJ-Cb
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 12:15:33 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-794fe698e36so14412137b3.2
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 09:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770311729; cv=none;
 d=google.com; s=arc-20240605;
 b=Q+cVd8XTCsHJIyP2e+Sw5vi6bR0z1f5Z2NlMACnyevnUwwD1cBKTf+8qjXaNxrQ7/r
 nP7GUc6TKtCdiooXR8uwXb8sLVus0j+ytDOCDieUEE46cEGKsA6brVuewFQnaQr95e7Y
 mvuwKWK5GLQw5eViyh8Nn/X3mBEPuI+Zra37rexk7qVzQiYWv1LtKUTlwbGDXI6X+WUh
 7dc9HB0QDfV+aLeOrYVy97J7k6DeSW0L5IURlDvV+Npq+yMhSsyqtr2Ytxec7oWNBtWU
 U+CpbUcwA1D3h4QgFuPbYKdtct1+ZJ6K53LZkGtWQeraT4UxCzjPpWQ8U/mzseZuk2fn
 qrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8CrqP1Cl24oKE7Od4ltNfgbmCGTYG00/dY14XKZiqf0=;
 fh=pikurAJr3XKwkry4Vi8rD6c3qwSGM9na6v0AoP8ZWIA=;
 b=LrbpYr0C88sjOeR4b19NcmMdDqwkjbapcvnjVA2KGIkNhi6Ts0t7jOf8YBbkaawGnY
 hIIPCTCBfE3eudJQL/C6BHfrxwzg/Qa37sOrzV/bm1RYqgPrS3UfH1NlNXbJHGrfX8QC
 5ScrcODpMRyPodqzpHezo9Bp+nI/f7XUzemJ+WzcBuDxqgIs6hzyu66mvXKmyCYAdyN6
 06RKcNMJ84LCGDFBLNGrWBLzoEg8WSNYfEopPrXP0gQLhOmkz+nDvq+v6Gg3Dv98MvEE
 llDopRjRZ5cJDtbrsupXPwh4uX4te63nE0iQAr2+/z/U/Uo1ilnFZWMPbDeYkwocdirx
 6iRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770311729; x=1770916529; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CrqP1Cl24oKE7Od4ltNfgbmCGTYG00/dY14XKZiqf0=;
 b=ARLLANZS7HBl7JIM1+DueogUIIg0wG82oopOt6QRKeGuGLjJ3RKeklyGcxa+Eipj6/
 U7UifR0U1iE5WibctJPODrrYyMbfLLceB+nAxCIRjt9kP8egBJu+VRe80ry4B8NxhWp1
 7THPsCzQzyf433FSw2kcnJ8H/Dip3uy0sV0bhluxY9qJEwZaBUT8Gamwubuj+sMsyYbm
 Wl2pgGHAQofLcVoYP8Wf/s4DvuYQ6hcXt8W7rdrd7JnQb1ZUGmxhSjRkh2jDhCijUz7+
 7HgCtobVDbxpBYAjqDrHsd1qU6l4egfqIRhk3fEDgxHAu6Yqnul8VNeHbJ4iu0PF0boD
 BA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770311729; x=1770916529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8CrqP1Cl24oKE7Od4ltNfgbmCGTYG00/dY14XKZiqf0=;
 b=Ci9ChOCqTsZhmSVLSVi0+6ltf6XgjarweOcPyyr6/glLgCxfsFYf0mB8KFDdy+hZG+
 DlKqVnm7UeCc6Vm1BXzAyfcqJsHgLDgopxLtkK/3VMzT3wlbGoP/sbyOP17egt82sw1l
 7L/KHCkZZlbxdWUqNf8h5QNUbletBeI2dS6Y9QFzoayeJxUaoASPuVOh3QVQCwUYhN4x
 DdbLscX7tmx1SNSoAKrlIRtBAEIWGkZlnatPFO47zVCHHf+UO2HUaGv0Vgk1sl4ahOVI
 QPat7nNzBSo0YDkHWMqEjhjxuYdRaUp3iegfyVY6BGs/a10iK9fsvrj/gPJQH5kMz00y
 BXJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZWYGM8btOdokb50luG3a5g606CF45I26lpqEH3UWLpvCQF9j7xM0cJI/D7ncSdLDS2YGLm1z2Kg==@nongnu.org
X-Gm-Message-State: AOJu0YxH0GaKPxcYJXQTHP2BQ3gJDo++ugjQ5J2xOJvooN/Q9iVWUG3k
 PUners3xFw8ZM0qWHDZ2t1PuTmq9IFLPWaUSwWUUcX8k4iUTP4g0xuWdG/kxKBDkSkKVtTTmlJm
 s9kBN9dZD2bJdkEDAcUT1UUQ/1dm490/2Btyk0DRMmg==
X-Gm-Gg: AZuq6aLDpAMzLPHhzFm2wikaqY++tSkwg+FIUOvuwmQTB92tkvdWv35JDTsd8EGVQsL
 nXrF5kRJI0kY248GH7z5w4uHkqyVLXqyDjjUwmMpoJV+GuPlVWFTduiuo9zXvBhq+HqK2D2cFkv
 9LK8Szpv1Cd/d3hEXm8Bl/mso/oT51zng7poVioQV5EDi6LXpjsDzabn5V9mkV3bJiXLi+KtCcb
 pVc7Zk1V5ppYfhat9ipEXYB0zyiND196HEJcYfCzr2mBY04vB/N5wXxPV7CSVbdhkpEh5yq8ImE
 N1oA
X-Received: by 2002:a05:690c:97:b0:794:bbce:e4a0 with SMTP id
 00721157ae682-794fe70ff6amr70544567b3.24.1770311729086; Thu, 05 Feb 2026
 09:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20251211102025.873506-1-me@linux.beauty>
 <CAFEAcA8FcW22-TnyBKHmFUUsR=xk2u-74uPz6KisJTeG=YWxmQ@mail.gmail.com>
 <20260205051236-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260205051236-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 17:15:17 +0000
X-Gm-Features: AZwV_Qghiw-LQMbU9sXqsmNvp_K457KiMnBiTAKvpnOxlu4A02bi2vOw_mwtr9w
Message-ID: <CAFEAcA-2QKtniTsLFA2ayjQ28dmQ=35r_zhkL6UBpiEOr=xGVg@mail.gmail.com>
Subject: Re: [PATCH v6] acpi/virt: suppress UART device & SPCR when guest has
 no serial hardware
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Li Chen <me@linux.beauty>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 5 Feb 2026 at 10:13, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Feb 05, 2026 at 10:08:32AM +0000, Peter Maydell wrote:
> > On Thu, 11 Dec 2025 at 10:21, Li Chen <me@linux.beauty> wrote:
> > >
> > > From: Li Chen <chenl311@chinatelecom.cn>
> > >
> > > virt machines always instantiate a PL011/16550 UART at slot 0 and des=
cribe
> > > it in ACPI (DSDT and optional SPCR table). When the command line disa=
bles
> > > the serial backend (e.g. "-serial none"), the guest still sees the UA=
RT as
> > > a preferred console even though it is not usable.
> > >
> > > Teach the virt ACPI code to omit the UART device and SPCR when there =
is no
> > > serial backend attached. This matches the hardware that the guest can
> > > actually use and avoids confusing firmware or OS code that relies on =
SPCR.
> > >
> > > The bios-tables-test qtests rely on an ACPI UART node and SPCR entry =
for
> > > UEFI-based virt machines. To keep those tests working we create a UAR=
T
> > > with a "null" chardev backend instead. This preserves the ACPI tables
> > > while discarding the firmware's serial output so it does not corrupt =
the
> > > TAP stdout stream.
> > >
> > > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> > > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> >
> > Sorry, I must have missed this patch previously. I'm not sure that
> > this is a good idea, because it means:
> >  * the dtb version of virt and the ACPI handling diverge
> >  * we tangle up "what chardev do you want to connect serial output to"
> >    and "what UARTs does the guest see"
> >
> > If the user explicitly sends the first serial port output
> > to nowhere with "-serial none -serial stdio" they presumably
> > had a reason for that and won't be happy to find that we've
> > adjusted the ACPI tables to redirect that output to the
> > second serial port they were planning to use for something else.

> presumably, things would be different with -nodefaults?

-nodefaults doesn't generally do much on Arm boards, because
we don't have a lot of "pluggable thing that's plugged in by
default" that we would turn off -- that's more of an x86 thing.

On the virt board the UART situation is a bit complicated,
for command-line backwards compatibility reasons:

 * the first UART always exists
 * if you're emulating the security extensions, the second
   UART always exists (and is the secure-world UART)
 * otherwise, the second UART exists only if the user
   configured a second serial backend (i.e. provided
   "-serial foo -serial bar" or similar)

If I were designing it again from scratch without the
back-compat baggage, it would probably have three always-exists
UARTs, one for secure-world and two for normal-world.

thanks
-- PMM

