Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7324712lff;
        Wed, 15 Jan 2020 11:08:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNkuQ9glYY7MIqUkshBpMoaxuZ/ckdbaKQPQ23TXYnLnDbhDo8Ii284wrQvA6gnxIzEWUM
X-Received: by 2002:a17:906:34d2:: with SMTP id h18mr29026812ejb.76.1579115281715;
        Wed, 15 Jan 2020 11:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579115281; cv=none;
        d=google.com; s=arc-20160816;
        b=rr4/Mkfn7kTorE5Ex4/dfS6kroj/ESWEeQ4lPxvMdiE5Y008bjsK1P1Qv1Km2W+Tgc
         bI4h1omnrY1EuR3BzvF+meAJjyu2cAJv+ZlqN+yEGdy9oaGO3x5WR956a81rgE+Cwwbd
         KLJTteq1gRBvcGQOOZDAT6SbG3BQIcH0ILTWMh+2fk01Wty8YU+lfxYg7wEz/Me0mij+
         cis8wn+05urDkpHh82EG2NOF3aJ6u33pkkkcs4iVQHMHCvAflON8Z9cOoDSgc+FWcxfw
         5E/67hhzo61Hb0JFpk1Wg/JRTRqybxyRzswZzEHB78MIQwSok4AQaXKlEZE246WNwVIv
         jKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oTf/X9JRU1S5mb/cQiyKrPQrCvNfEz5GOFJu6fVFXwU=;
        b=tx+/UuBwt8RtPR20UbU3Zj8LMp0LjnetsaUkb/BCJn6XptbTGTsU3zUeU6NhWYjxm7
         w0tD7jmYDSxc3k7t4zTvPV+KXsjJB7jdi1fd8DTDPGYPKRh+7Rx5bIk+j+3fK25VMaLq
         jpmf93Uxkjw8ZRU6VWfa9nXDwN22DH6iAU/eNZMUtiQdp/iB9UhePCEUxBnCBOvN081X
         hS8pJrpkV8k1ZhU/42Te1AZx2ELLV3mmO/SYG6DgpAdQQII1+nyVDBLx6vlbqmHMB7qz
         3+9BdvMNqLkDtPQqXy+GPTnTOCpANqcL4/aXoRzal8MhCcM3p6bcwNSVb/3TAy9+chbN
         H3kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AZm9Mu8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm24si14645439edb.390.2020.01.15.11.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:08:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AZm9Mu8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iro1H-0003df-H5
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iro15-0003W1-QA
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:07:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iro12-00009p-Bw
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:07:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36511
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iro12-00009R-98
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579115263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTf/X9JRU1S5mb/cQiyKrPQrCvNfEz5GOFJu6fVFXwU=;
 b=AZm9Mu8jH8M9Gvv7z0TVdockOxPuOanpu+gMUOcztRrwCP9xDEyuVunR4ITs+VdptZMgRt
 UvABe0J0M3ji3Ng+Yt8ZzWSqwrNeCW9C/MV7rATFteLASJzLurad8EL8yWft3+M7jXvmjR
 RX1H90aTXTMVBsbOXQs8AiCTZaUw9pA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-yK8UJjsCMpuZqvSFtPHcNA-1; Wed, 15 Jan 2020 14:07:37 -0500
Received: by mail-wr1-f71.google.com with SMTP id j4so8328364wrs.13
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZPXg09kSF/iW30BhuqrDyViJr5YAO5qJXilf3ProNx4=;
 b=tBBB6LQI8oPNwhOFb05YjDCdEds8zrWnIH4KlxuE+2QEDjHrABxbYGxWi32TV/pxJK
 W5tUL6hehZsZmVrjGs3ehuY/1KII1rZZ/HhPelhZ+WwQ8wYgA7njkYy4TDTlaLh1yjH6
 4KY+h/CVnHBjdrcogeGJhY22k1Ej23oE9nLXgU05nJkxq+IqvQPEcCC6DBWiTHVULQmM
 T7OSZEl8/Owwqu5amUNZJ+xM6DDwQAEzVwIl7Q1HbajWp5B/2vLovHsFe2Z/kI0vjQJ3
 7VLwQV+f6cvQM+W3ymiDdAsKVaMEK2hPXo8R6l9Vpm5PxP1lR64P8DXEXcMVHbSbms7S
 oszw==
X-Gm-Message-State: APjAAAUwUfjUqGm6xefqbtLfFaagmOtblGl4E9t38tvkhAs3vmHuIaUM
 5sbuE2xvU1Hocp70vO3Q91j6+wKaVBlxp9WCmk/VndIDfif+AoAv/UF4115sPrfvcHYVjQm3RE3
 +XSsXc/OlaZO2
X-Received: by 2002:adf:f80c:: with SMTP id s12mr32720254wrp.1.1579115256434; 
 Wed, 15 Jan 2020 11:07:36 -0800 (PST)
X-Received: by 2002:adf:f80c:: with SMTP id s12mr32720229wrp.1.1579115256112; 
 Wed, 15 Jan 2020 11:07:36 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id p7sm964604wmp.31.2020.01.15.11.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:07:35 -0800 (PST)
Subject: Re: [PATCH v2 28/86] arm:raspi: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-29-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b2162130-041f-e709-a33d-56c0beb880b9@redhat.com>
Date: Wed, 15 Jan 2020 20:07:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-29-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: yK8UJjsCMpuZqvSFtPHcNA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yo6rrttPmIDv

On 1/15/20 4:06 PM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>    MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>   remove no longer needed RasPiState
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Andrew.Baumann@microsoft.com
> CC: philmd@redhat.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/raspi.c | 34 +++++++++++++---------------------
>   1 file changed, 13 insertions(+), 21 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 6a510aa..33ace66 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -32,11 +32,6 @@
>   /* Table of Linux board IDs for different Pi versions */
>   static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3]=
 =3D 0xc44};
>  =20
> -typedef struct RasPiState {
> -    BCM283XState soc;
> -    MemoryRegion ram;
> -} RasPiState;
> -
>   static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info=
)
>   {
>       static const uint32_t smpboot[] =3D {
> @@ -166,7 +161,7 @@ static void setup_boot(MachineState *machine, int ver=
sion, size_t ram_size)
>  =20
>   static void raspi_init(MachineState *machine, int version)
>   {
> -    RasPiState *s =3D g_new0(RasPiState, 1);
> +    Object *soc;
>       uint32_t vcram_size;
>       DriveInfo *di;
>       BlockBackend *blk;
> @@ -179,30 +174,26 @@ static void raspi_init(MachineState *machine, int v=
ersion)
>           exit(1);
>       }
>  =20
> -    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
> -                            version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM28=
36,
> -                            &error_abort, NULL);
> +    soc =3D object_new(version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);
> +    object_property_add_child(OBJECT(machine), "soc", soc, &error_fatal)=
;
>  =20
> -    /* Allocate and map RAM */
> -    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram"=
,
> -                                         machine->ram_size);
>       /* FIXME: Remove when we have custom CPU address space support */
> -    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram,=
 0);
> +    memory_region_add_subregion_overlap(get_system_memory(), 0,
> +                                        machine->ram, 0);
>  =20
>       /* Setup the SOC */
> -    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ra=
m),
> +    object_property_add_const_link(soc, "ram", OBJECT(machine->ram),
>                                      &error_abort);
> -    object_property_set_int(OBJECT(&s->soc), machine->smp.cpus, "enabled=
-cpus",
> +    object_property_set_int(soc, machine->smp.cpus, "enabled-cpus",
>                               &error_abort);
>       int board_rev =3D version =3D=3D 3 ? 0xa02082 : 0xa21041;
> -    object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
> -                            &error_abort);
> -    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_a=
bort);
> +    object_property_set_int(soc, board_rev, "board-rev", &error_abort);
> +    object_property_set_bool(soc, true, "realized", &error_abort);
>  =20
>       /* Create and plug in the SD cards */
>       di =3D drive_get_next(IF_SD);
>       blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> -    bus =3D qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
> +    bus =3D qdev_get_child_bus(DEVICE(soc), "sd-bus");
>       if (bus =3D=3D NULL) {
>           error_report("No SD bus found in SOC object");
>           exit(1);
> @@ -211,8 +202,7 @@ static void raspi_init(MachineState *machine, int ver=
sion)
>       qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
>       object_property_set_bool(OBJECT(carddev), true, "realized", &error_=
fatal);
>  =20
> -    vcram_size =3D object_property_get_uint(OBJECT(&s->soc), "vcram-size=
",
> -                                          &error_abort);
> +    vcram_size =3D object_property_get_uint(soc, "vcram-size", &error_ab=
ort);
>       setup_boot(machine, version, machine->ram_size - vcram_size);
>   }
>  =20
> @@ -233,6 +223,7 @@ static void raspi2_machine_init(MachineClass *mc)
>       mc->min_cpus =3D BCM283X_NCPUS;
>       mc->default_cpus =3D BCM283X_NCPUS;
>       mc->default_ram_size =3D 1 * GiB;
> +    mc->default_ram_id =3D "ram";
>       mc->ignore_memory_transaction_failures =3D true;
>   };
>   DEFINE_MACHINE("raspi2", raspi2_machine_init)
> @@ -255,6 +246,7 @@ static void raspi3_machine_init(MachineClass *mc)
>       mc->min_cpus =3D BCM283X_NCPUS;
>       mc->default_cpus =3D BCM283X_NCPUS;
>       mc->default_ram_size =3D 1 * GiB;
> +    mc->default_ram_id =3D "ram";
>   }
>   DEFINE_MACHINE("raspi3", raspi3_machine_init)
>   #endif
>=20

This patch diverges a lot from my current work:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg653818.html
So I'm not very happy about it. Maybe my bad I should ping more=20
aggressively my patches. I can respin mine preparing for your series on top=
.

Meanwhile if you are in a hurry I tested yours, so:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

