Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp355574njc;
        Sun, 23 Jun 2024 23:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyR4CQuTM4GfE7+iqaLczrjhv0AIOVqsxAuB0cIOIES81IyGx9/YPwdEffhoNcKvUdhxKN2EZG2llr/V0aHib8ZP2RwFhI
X-Google-Smtp-Source: AGHT+IEwKGY2IOfpU437b/ZC1dDnE0XnKR543/gN8njSAxDRLU7lrnhrRwyuCLKy4FwhSLatJfcS
X-Received: by 2002:a05:6214:cce:b0:6b5:25b6:dd04 with SMTP id 6a1803df08f44-6b531fce968mr58214886d6.1.1719209126386;
        Sun, 23 Jun 2024 23:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719209126; cv=none;
        d=google.com; s=arc-20160816;
        b=F0iU2Er1Uwq97Lq35fcNTXIwY7Lj10nqyZYYLKLo+lkgdJLTsyKQIzCsPRbxcQUasE
         ZfIAvVdrwc22jmurFA17AElq4iu4zq/m7iED9OvSAddwlokfS7i3FY1z9wTipVW8I5JL
         bYYCOeWRUJZwubsFDxe3rtd6+Zb9Y4+usGIYJCNYyIKgY5d4qA4cZmTZwoTwZ1R6p7ON
         X1AFBeA/cRT5apkmJ6NNRM7HL3IJsv+jb2apv4v6VR1FO5boeco4ykqnSV7bA/6OjZci
         7oYk8RJmS5rM6kQHdkcW33Y3LKv24w8JgDpbRM37sHft7sEfQetygGA+kvpOUMdv+Tfj
         DGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FIqx486pjvWcB0j9Rra+5ck4J91i2YBVFGZKXLlW6lA=;
        fh=2WpCX0y22fX+r7USvIx4c1uXz44VYi5WbqLXrDIsH8Y=;
        b=Dd4qRmSsG3YeuTt2kHv5L/0texWrQjmMks5HwTYWVexpCdBTiEmG/t5GRuirRD+ZcK
         Uhi1viQWNcRGhph2fd3Ve+9VoCbSTe/fdqy7RC5ZfSeGO+H+IyJiOwPZWgTFHxmvtC3K
         cfMHGna4VCZaz5Q/77REfw9JqdRddMgDGXQ8REUMX2S8NxKWdBgXG4gb/L6qjMKM54rM
         RLSv2ztuLC5LXC7hqv9yFszkg2XxoThlumqCJU8Tvi6r0xPqBda8PLP1MBDy1jid5AfF
         mT+ebEyhUmJCNWqDvpvG18vmwSrxzSSoy75wiJFYIVMrEr1RxAmjin04uPfKmVQmAH7a
         i5EQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iRtTASiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef2defdsi74189816d6.465.2024.06.23.23.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jun 2024 23:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iRtTASiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLcp4-0000On-Nr; Mon, 24 Jun 2024 02:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sLcp2-0000NT-LW; Mon, 24 Jun 2024 02:05:00 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sLcp1-0001G9-3T; Mon, 24 Jun 2024 02:05:00 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-80f5cd5717cso2191057241.1; 
 Sun, 23 Jun 2024 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719209097; x=1719813897; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIqx486pjvWcB0j9Rra+5ck4J91i2YBVFGZKXLlW6lA=;
 b=iRtTASiU7OQocs/veab4MKh+D7TnMWqLusjOyoIHAt6bvcN3Cyp+PEOLuQ/7vU//1G
 7YFfmxcFvc6Ufo/k7KWBL01mkmarH66ULVTfak3EeA7l+jFKawdwx1WqMzZVUVrzLDwe
 y/KnUBJpSlbk8i1GPj+UeJzVTuDftibmSCGY8+ynAwnNylky3YVNwA3/mxP1Z5lm/KqN
 8dfnyT9vzOSsd38R4bsTKkfM1I6kNHP5aPK6WVjLf5e/L73Tov2XnxOvyZTuWLUiff84
 nn+cqHTRhDuzUAJSOizqdQ/wRqcExSD5N76sy9GHJ+PnfC4CEl4+vB8EQ4Lf0Ii4Z7HF
 ABnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719209097; x=1719813897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIqx486pjvWcB0j9Rra+5ck4J91i2YBVFGZKXLlW6lA=;
 b=nShaXcSJOIggIlg5l7TojpgYKNTsQYHJdux41BPH6PphN7tY50k9H72+j3taUax6cp
 YTtUFTy2X0VUuPhju6ElsHSZWpJmJMBTUlkXNyuuYPBlROSer2io+5b9lyS0RXfXXsbz
 CvuCbBY9uIveyq+6I7EGHDbiY3vRJvWAqf3zXYXEQ97cjeexTstpi6jkjaerqaf7aDAE
 YxNXz36lG78gWRm7b87plvPkFMuv3PZMuDw7jzN5sZtHT+pLgz9/wtyhRCFdpS75+36u
 +Jt8QvjBLt1cTM46C9/ALv5MdgaxgmNW6+8OG2BbqaqQX1L9Lb1QC4DClKWrvg48xuQW
 uO0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/wMCFQ1IIrVm9SznGNR5uLtQoamsWNcuy596+NqrNrhQguYfgsKOsyY3ztKs6q1kz6bMdmA8v3pOqt5y8qZKBWmD5Asf9Lf5TY/DPS5YZKd8j1QYRCYmq3vY=
X-Gm-Message-State: AOJu0YxKvqLIqM5amFg6hpf0BsT0jPAEMNpEAtWKZFL9JrNatFmYWBHO
 cAvwutENIvhZixZRikw4nnUfMZh9pKuWaPfq2SuSJy4cAnLug53xESVv7o3IKnKEkpBtCXWuPGB
 RtPqTcujqWq0EAV2ayW0nm6IYCLU=
X-Received: by 2002:a05:6122:a1d:b0:4d3:34f4:7e99 with SMTP id
 71dfb90a1353d-4ef652101e6mr2322868e0c.0.1719209097273; Sun, 23 Jun 2024
 23:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-7-sunilvl@ventanamicro.com>
In-Reply-To: <20240621115906.1049832-7-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jun 2024 16:04:31 +1000
Message-ID: <CAKmqyKPrCjRNXKc6GWERwYzgrsQ3ed6XKa+Swf_8Y2ds27a58w@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] tests/qtest/bios-tables-test.c: Set "arch" for
 aarch64 tests
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gVXbtou6jOrK

On Fri, Jun 21, 2024 at 9:59=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> To search for expected AML files under ${arch}/${machine} path, set this
> field for AARCH64 related test cases.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/qtest/bios-tables-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 29c52952f4..007c281c9a 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1591,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> @@ -1684,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void=
)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> @@ -1706,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> @@ -1779,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(vo=
id)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> @@ -1935,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> @@ -1954,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(voi=
d)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .variant =3D ".topology",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
> @@ -2037,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> @@ -2213,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> +        .arch =3D "aarch64",
>          .tcg_only =3D true,
>          .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> --
> 2.40.1
>
