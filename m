Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4279241lfm;
        Mon, 13 Apr 2020 15:23:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypIHVlZHqfZ4E8VEFD3qH7LxY599xtFLBlpj11t66xYvuKMLmluTwgKNlbrpvt4XM0LeGOVD
X-Received: by 2002:a0c:f00f:: with SMTP id z15mr10655670qvk.113.1586816630555;
        Mon, 13 Apr 2020 15:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586816630; cv=none;
        d=google.com; s=arc-20160816;
        b=TyCqmL0weCtZ1hvWLzvuzp3vu+yEgzjdH5D3cA3i7YY1UnXLTY3jgY/ABWZPJUAOBM
         hs7ft65DUEDeQE3E4V3YYr5/AdNGjVJ8hxP7s5mSmoF5xxuo7Q9JrazHd4epUmWLjWnQ
         ynlIDwU+TOy0yPuF4+CPZ/uavQIFTMxja5ogCYq8uC1rt13725jgNZQYNFdGFJFk/D0k
         b5FiGKBiUYJZPMau0WjGL5CVhmVKWuwcmXAcpO+aWTjzaaZzTWQM8CNKHaKvNf/azb+M
         9b1P6rqV5j81RjFTrDZf5s1SV2Soa8r2yApbhOrH9h1dHqBCiNRSArsjCMT/8Do4aOIG
         fZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YzMwyUxjG9VjYUhzYdWXMKxuI7FUnl5tFZL2IUdOTm8=;
        b=yf12hfo7/JmJNbPbdOoCcjR38Y12n57HdDuuzawJvHX9Onk0UkHGAOw0CTe8Y5RxRk
         dZo4qF5jrEdZWnAEzeDO0PB6mwrCUTishGC88/Od8XcLDVvkmiMgkZxNo8KA7RfkQLRU
         Q45hnHwqUSosIT0QVdpaGNt66DVI8m+Npk8TyI3HNnOsIuoFL0sVJHKnZrcDgds3q/eo
         xcAE8atvFLpSRjce65lFDq84rys8Qzixrc/D9+0a6B7aorGYn1GmA2QSO2R63Wwq/9pZ
         JnqiiFenEMO6pKbnyEkyPf6sYzE+mfPcGtZIXCkxEBL2BeQKpGLzSgluPEnkrXpn8WRR
         j15w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dpignNU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si6301824qto.239.2020.04.13.15.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 15:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dpignNU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO7Ub-00025q-Ui
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 18:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7TS-0000Rp-JY
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7TR-00063R-Iz
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:22:38 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:36451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7TN-00062c-9p; Mon, 13 Apr 2020 18:22:33 -0400
Received: by mail-ua1-x941.google.com with SMTP id m15so3732258uao.3;
 Mon, 13 Apr 2020 15:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YzMwyUxjG9VjYUhzYdWXMKxuI7FUnl5tFZL2IUdOTm8=;
 b=dpignNU7ncFb7s4gJxsqDp964C4u1fm8PFQTs7wsS/Ko6GVjwhgPPIW3qLZca7/c1l
 oxVdZEl3ZPQKyv8VPVYF6YSClTiReCv6v0oGjEEQ7exzKtfIOaMnvIHxfgBPu4eTSX30
 KXenLuN8g6q2QmHLMgbYvQIteKyhdqhKE9fvfP5t3P73AjQMtsPMDo/AgLijqij2c0ES
 2vBxww5h+3O5V/Ie7oh/UD9k9nIFMr82/B+wlNRYReJM8c28lPI8LcE9dNwfqwH9+4f+
 P+P+0uKat6NvQRAmZv886vWTe4bx5TjkTVNoMgJYyUwZZSKYdZjUVlf+9dyW8okqShvE
 2VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YzMwyUxjG9VjYUhzYdWXMKxuI7FUnl5tFZL2IUdOTm8=;
 b=UqSjcG8accLMrXDcuSG4ffYC0gB7mx/QXW19DMjMuA+1q922bVj0mygWQS4VZ/IL6b
 UZMoZGjsOuYmXIKOuTumqcfQjacGNXuh4QYQu4Jsi9yvWcNyvvGsqMN1gdp7jplX1XZK
 JvAIFpnK6Bb9xhbOxFtkT9v86TTgVCHXVLgukzgq9Cpi8P26T/V5zDCbbze4oUEl9jIj
 JCf/P2vwPDQEkzfml+L44VUOONSt2JS4lYipWozVTjWmn9q4gAo9yZSRmCQNbR+0vso8
 opJC3JUHXr5NiZwN1w0QoEdxJYtYCjJ1Rcoo1CAZV7voxJMIY+K9A1qrcDXMtJpU/f0V
 8f7Q==
X-Gm-Message-State: AGi0PuaZ5+SGEixCLLSPefRUb76i+VHKUbIgEjNwiF6wSQrxZeAyl2Mq
 R0SV9oiHqXJPAYikhjjjdvBs3hHOUq5frG30MDk=
X-Received: by 2002:a9f:2964:: with SMTP id t91mr12504390uat.21.1586816552774; 
 Mon, 13 Apr 2020 15:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-25-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-25-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:14:16 -0700
Message-ID: <CAKmqyKPV-BLHoic+y7W_j4E2WWkmgtOxiTS68z4G_34DtcTXpQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 24/24] hw/riscv/sifive_u: Rename
 MachineClass::init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::941
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5SCc6JzUS4fQ

On Sun, Apr 12, 2020 at 3:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> As there already is the riscv_sifive_u_soc_init() method,
> rename riscv_sifive_u_init() as riscv_sifive_u_machine_init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7bf1f30a35..e13ab34de4 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -312,7 +312,7 @@ static void create_fdt(SiFiveUState *s, const struct =
MemmapEntry *memmap,
>      g_free(nodename);
>  }
>
> -static void riscv_sifive_u_init(MachineState *machine)
> +static void riscv_sifive_u_machine_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap =3D sifive_u_memmap;
>      SiFiveUState *s =3D RISCV_U_MACHINE(machine);
> @@ -606,7 +606,7 @@ static void riscv_sifive_u_machine_class_init(ObjectC=
lass *oc, void *data)
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
>      mc->desc =3D "RISC-V Board compatible with SiFive U SDK";
> -    mc->init =3D riscv_sifive_u_init;
> +    mc->init =3D riscv_sifive_u_machine_init;
>      mc->max_cpus =3D SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CP=
U_COUNT;
>      mc->min_cpus =3D SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpus =3D mc->min_cpus;
> --
> 2.21.1
>
>
