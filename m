Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2418329lfi;
        Thu, 26 Mar 2020 14:39:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtGcZT3AcM809BS3TaBuas9d+zObxc7org1ZAPbAV3fILI9UXzsSU+iXfVbAYfqTDvvuDzD
X-Received: by 2002:aed:3eec:: with SMTP id o41mr11280554qtf.343.1585258763441;
        Thu, 26 Mar 2020 14:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585258763; cv=none;
        d=google.com; s=arc-20160816;
        b=KiyB+X5DR4PpYEpDiR2rrfu2ug0g7YFoldRkfgZbRR/0p01tQ/BcFrPjJ5ZnXoZYNO
         9+OyKCT9G1EoApfWC8l2235fLjrUam/HZdnwpBJ/7FjyWZAYIFA7AoTodIYClZjP6nZh
         Z9sGWbD+wgteEMLaXlknv9Y1YkP7VMzKDOlh4xrNO8FewiGKAV04AswlEaRjvqJOQa4u
         8ObKKMngi5lhJ0wCunHzX0pAEiS4UTlgv4Vg9D/p325dzEYyqIdfH8lJwX9RpOgfdIYQ
         uDVc0F3YZ+++cd+A4uBWybCuz+qWsOeXBmAbcAUUP7uiCyPEyrUr85Ms/pvAboyXSwbY
         j7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ttFRTy1miBphiIkRdmeJ7d7lmPHn2JFJgTlTt9y5xDY=;
        b=fhjD/sixIFMIkiaZ+QZ3TR58jB8cZAKbvxb/2B4SIUOfATuNcWdYLGL4YeY2mnKVMJ
         LHH8iatmxVkOoxrIHGynjHvxZ2qboqIqEyg1yLaMiC+aY729t0cvcgzzaasEjAZH8ZSK
         zkwFKtbsezQAjAi9vHEE++J142/Qkxsu31PM7jQJhTzx9OsyF4zOe8C6kuaSxzV4sO8m
         pP+0hzjHpmfvXCAY+MNasobHnaZ5JDOU2ffGIjr04fPPZr/sco7FIChx3icqBy2XnrgE
         x8OEoeCsYlYuoBcC1V0SwOJh8FtcYMfhJOWeqNbfrvUjvwA/q0jQ9jcNzo7yS2Pkp2pf
         BYzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oy7ZsYMi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si2222045qtb.149.2020.03.26.14.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oy7ZsYMi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaDi-0004LX-Pi
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaDT-0004L4-KC
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:39:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaDS-00039w-BO
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:39:07 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:34170)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaDS-00039b-6F
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:39:06 -0400
Received: by mail-ot1-x336.google.com with SMTP id j16so7643819otl.1
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ttFRTy1miBphiIkRdmeJ7d7lmPHn2JFJgTlTt9y5xDY=;
 b=oy7ZsYMiDp5Es2IvFowVFh0nr4+ydviKOk/cJWOGWV5G+4UZRor6v6j5BnVXyTDQAw
 qpU1jNIl9XhNxR270tB+3awACdQY1r4P++FIVs6Lo0ILF1gPhqIqvd5mFPHRupPdaYSA
 D/iQ43oXoU7RDdcGDg0B24Pt7TMnj0pjNbevqM9Ghc/YVjO1fJRnJ+JFZuzq2fMmpxlh
 1TsShaNqjV9qNHBtkeGGWtvi6H6Jvp5kWS3pW8gf/yTUyrV4ihYcAZYe/ptsDR6pmYBH
 Q1fs90oCKS/D0oCmhg/oeooj2jorB2nHEVa9ZoxRW5od8NRNy7LUAzQMegm32ikfkyvX
 89QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ttFRTy1miBphiIkRdmeJ7d7lmPHn2JFJgTlTt9y5xDY=;
 b=Y3++DcQcztuitjBn8gu0seXBPPtvffFM9MoXrvOpqjXb2oKFFEUfOwx+OpCwc8A0ty
 nWuU7R7FlraiQ9tiyfECmk//EpXjHEXmiViKNrWa+3ZIU+c55hOw49AhUrbc048VOnGw
 nMso1nJ4AG6Gdlw79awBXcTN1CBvsIlo0P0bnDE0CNnw0KMKSv8alE1/LUjHcIA8BhSc
 YW4D12o7kf6iupq8a8SwDqi/iCJyji4UfvJH6+9sKItd7LjTKLv6QEhBEoXJM3prH/oZ
 5eXgFD6xYPJE4y/BZAjiV5Rfbv/r8NN1YVr5n6lpTfgnijqeK6JPDICRT08lZXwbontf
 K8Fg==
X-Gm-Message-State: ANhLgQ2/q1ga0EenDjz0EAuM6iNH4nC21QMKXa0Hd9q9J05orc8IAbTN
 2S48Ve3HMRLZdQxZuQwFIErzQNcqSxO9ajWbGxV+Zw==
X-Received: by 2002:a9d:1920:: with SMTP id j32mr7656604ota.221.1585258744877; 
 Thu, 26 Mar 2020 14:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-6-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:38:53 +0000
Message-ID: <CAFEAcA97j0LD__A4eSkf1Aq2GpcQ5up1e76Hwfcj-Dd3o6iOeg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 05/12] hw/i386/x86: Add missing error-propagation
 code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::336
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QAvDVnh9ZCeq

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/x86.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 87b73fe33c..0a4865d4a9 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -103,13 +103,17 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState=
 *x86ms,
>  void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>  {
>      Object *cpu =3D NULL;
>      Error *local_err =3D NULL;
>
>      cpu =3D object_new(MACHINE(x86ms)->cpu_type);
>
>      object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>      object_property_set_bool(cpu, true, "realized", &local_err);
>
>      object_unref(cpu);
>      error_propagate(errp, local_err);
>  }

Hmm, not sure about this one -- in the error-exit path
for failure-to-realize we object_unref(), do we need to
do so also if we error-exit for failure to set the apic-id ?

(Since apic-id is a PROP_UINT32 with no set function, there
is not currently any way for the set_uint to fail, as it
happens. But we ought to either have the error-propagation
right or use error_abort if we truly believe it can never fail.)

thanks
-- PMM
